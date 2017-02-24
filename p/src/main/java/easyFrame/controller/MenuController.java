package easyFrame.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import easyFrame.model.Menu;
import easyFrame.model.Role;
import easyFrame.model.User;
import easyFrame.service.MenuManager;
import easyFrame.service.ResponseObject;
import easyFrame.service.RoleManager;
import easyFrame.service.SuccessResponse;
import easyFrame.service.UserManager;

@Controller
@RequestMapping("/admin/menu")
public class MenuController {
	@Autowired
	MenuManager menuManager;
	@Autowired
	UserManager userManager;

	@Autowired
	RoleManager roleManager;

	@RequestMapping(value = "/save.do")
	@ResponseBody
	public ResponseObject saveNewMenu(@RequestBody Menu menu) {
		
		menu = menuManager.save(menu);
		Menu parent = menuManager.get(menu.getParentId());
		parent.getChildren().add(menu);
		Menu res = menuManager.save(parent);
		
		System.out.println(JSONObject.fromObject(res));
		return new SuccessResponse(res);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/getmenu.do")
	@ResponseBody
	public ResponseObject getMenuByLoginerRoles(HttpServletRequest request) {
		String username = request.getRemoteUser();
		User user = userManager.getByUserName(username);
		/*
		 * 一个用户可以有多个角色
		 */
		Set<Role> roles = user.getRole();
		Iterator<Role> itera = roles.iterator();
		/*
		 * 存放menu的容器，因为menu已经重写了hashcode和equals方法，所以set 容器可以对menu去重复
		 */
		HashSet<Menu> menus = new HashSet();
		// 获得所有角色，然后把所有角色对应的菜单存放在一起,并且去重复
		while (itera.hasNext()) {
			// 每个角色都有对应的menu
			Set<Menu> power = itera.next().getMenus();
			for (Menu menu : power) {
				menus.add(menu);
			}
		}

		/*
		 * 补充完整的的容器
		 */
		HashSet<Menu> fullSet = new HashSet<Menu>();
		for (Menu menu : menus) {
			/*
			 * 如果不是根节点,根节点的pareantId=0
			 */
			if (!(menu.getParentId() + "").equals(0 + "")) {
				// 生成树结构
				Menu p = test2(menu);
				fullSet.add(p);
			} else {
				fullSet.add(menu);
			}

		}

		return new SuccessResponse(fullSet);
	}

	@RequestMapping(value = "/showMenuManager.do")
	public String showMenuManager() {

		return "admin/menuManager";
	}

	@ResponseBody
	@RequestMapping(value = "/getAllMenu.do")
	public ResponseObject getAllMenu(Long roleId) {
		if (roleId != null) {
			// 如果获取该角色获取所有节点
			List<Menu> menuList = menuManager.getAll();
			// 获得角色根据角色Id
			Role role = roleManager.get(roleId);
			// 遍历所有menu，如果有menu和角色get到的menu一样设为1
			for (Menu mm : role.getMenus()) {
				for (Menu menu : menuList) {
					if ((menu.getId() + "").equals(mm.getId() + "")) {
						menu.setAdded(1 + "");
						menu.setChecked(true);
					}
				}
			}
			// HashMap<Long, Menu> map = new HashMap<Long, Menu>();
			// 把menuList中menu生成一个tree
			HashSet<Menu> resset = new HashSet<Menu>();
			for (Menu mm : menuList) {
				Menu res = test3(mm);
				// map.put(res.getId(), res);
				resset.add(res);
				
			}
			// map.values();

			System.out.println(JSONArray.fromObject(resset));
			return new SuccessResponse(resset);
		} else {
			// 如果是全部的节点
			List<Menu> ms = menuManager.getMenusByParentId(0l);
			return new SuccessResponse(new LinkedHashSet<Menu>(ms));
		}
	}

	/*
	 * 递归获得所有树节点放入集合中
	 */
	public HashSet<Menu> test(HashSet<Menu> set) {
		HashSet<Menu> set2 = new HashSet<Menu>();
		// 遍历所有menus，将所有menu放入list里面
		for (Menu menu : set) {
			set2.addAll(menu.getChildren());
			test(set2);
		}
		return set2;
	}

	public Menu test2(Menu menu) {
		Menu res = menu;
		if (!(menu.getParentId() + "").equals(0 + "")) {
			res = menuManager.get(menu.getParentId());
			// res.getChildren().clear();
			res.addChildren(menu);
			res = test2(res);
		}
		return res;
	}

	public Menu test3(Menu menu) {
		Menu res = menu;
		if (!(menu.getParentId() + "").equals(0 + "")) {
			res = menuManager.get(menu.getParentId());
			res.addChildren(menu);
			res = test3(res);
		}
		return res;
	}

	@ResponseBody
	@RequestMapping(value = "/getMenusByRole.do")
	public ResponseObject getMenusByRole(Long roleId) {
		// 根据roleId获得角色
		Role role = roleManager.get(roleId);
		// 获得该角色对应的菜单
		Set<Menu> menus = role.getMenus();
		// 创建一个容器存放该角色对应的树形结构菜单
		HashSet<Menu> fullPathSet = new HashSet<Menu>();
		// 遍历角色对应的菜单
		for (Menu menu : menus) {

			if (!(menu.getParentId() + "").equals(0 + "")) {
				// 如果不是根节点，获得该节点的父节点，并且调用该节点的父节点的addchild方法把该节点传入
				// 然后返回父节点把父节点存入fullset
				Menu p = test2(menu);
				fullPathSet.add(p);
			} else {
				
				// 如果是根节点菜单直接放入fullpathset
				fullPathSet.add(menu);
			}
		}
		return new SuccessResponse(fullPathSet);
	}

	// 给角色分配菜单
	@ResponseBody
	@RequestMapping(value = "/assignMenuByRole.do")
	public ResponseObject assignMenuByRole(@RequestBody HashSet<Long> menuIds,
			Long roleId) {

		Role role = roleManager.get(roleId);
		Set<Menu> roleMenus = role.getMenus();
		roleMenus.clear();
		for (Long id : menuIds) {
			Menu menu = menuManager.get(id);
			role.addMenu(menu);
		}
		//System.out.println(JSONArray.fromObject(roleMenus));
		//role.setMenus(roleMenus);
		roleManager.save(role);
		return new SuccessResponse();
	}

	@ResponseBody
	@RequestMapping(value = "/getmenuSet.do")
	public ResponseObject getmenuSet(Long roleId) {

		Role role = roleManager.get(roleId);
		return new SuccessResponse(new LinkedHashSet<Menu>(role.getMenus()));

	}

}
