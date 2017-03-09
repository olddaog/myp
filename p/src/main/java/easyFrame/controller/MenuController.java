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
		HashMap<Long, Menu> map = new HashMap<Long, Menu>();
		for (Menu menu : menus) {
			menu.getChildren().clear();
			map.put(menu.getId(), menu);
		}

		for (Menu menu : map.values()) {
			if (map.containsKey(menu.getParentId())) {
				map.get(menu.getParentId()).addChildren(menu);
			}
		}

		for (Menu menu : map.values()) {
			if ((0 + "").equals(menu.getId() + "")) {
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
			HashSet<Menu> fullSet = new HashSet<Menu>();
			HashMap<Long, Menu> map = new HashMap<Long, Menu>();
			for (Menu menu : menuList) {
				map.put(menu.getId(), menu);
			}

			for (Menu menu : map.values()) {
				if (map.containsKey(menu.getParentId())) {
					map.get(menu.getParentId()).addChildren(menu);
				}
			}

			for (Menu menu : map.values()) {
				if ((0 + "").equals(menu.getId() + "")) {
					fullSet.add(menu);
				}
			}

			// map.values();

			System.out.println(JSONArray.fromObject(fullSet));
			return new SuccessResponse(fullSet);
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

	/*
	 * public Menu test2(Menu menu) { Menu res = menu; if (!(menu.getParentId()
	 * + "").equals(0 + "")) { res = menuManager.get(menu.getParentId());
	 * ArrayList<Menu> list = new ArrayList<Menu>(); for (Menu m :
	 * res.getChildren()) { if (!m.getId().equals(menu.getId())) { list.add(m);
	 * } } res.getChildren().removeAll(list); res.getChildren().add(menu);
	 * 
	 * res = test2(res); } System.out.println(JSONObject.fromObject(res));
	 * return res; }
	 */

	/*
	 * public Menu test3(Menu menu) { Menu res = menu; if (!(menu.getParentId()
	 * + "").equals(0 + "")) { System.out.println(menu.getText()); res =
	 * menuManager.get(menu.getParentId()); res.addChildren(menu); res =
	 * test3(res); } return res; }
	 */

	@ResponseBody
	@RequestMapping(value = "/getMenusByRole.do")
	public ResponseObject getMenusByRole(Long roleId) {
		// 根据roleId获得角色
		Role role = roleManager.get(roleId);
		// 获得该角色对应的菜单
		Set<Menu> menus = role.getMenus();

		// 遍历角色对应的菜单
		HashSet<Menu> fullSet = new HashSet<Menu>();
		HashMap<Long, Menu> map = new HashMap<Long, Menu>();
		for (Menu menu : menus) {
			menu.getChildren().clear();
			map.put(menu.getId(), menu);
		}

		for (Menu menu : map.values()) {
			if (map.containsKey(menu.getParentId())) {
				map.get(menu.getParentId()).addChildren(menu);
			}
		}

		for (Menu menu : map.values()) {
			if ((0 + "").equals(menu.getId() + "")) {
				fullSet.add(menu);
			}
		}

		return new SuccessResponse(fullSet);
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
		// System.out.println(JSONArray.fromObject(roleMenus));
		// role.setMenus(roleMenus);
		roleManager.save(role);
		return new SuccessResponse();
	}

	@ResponseBody
	@RequestMapping(value = "/getmenuSet.do")
	public ResponseObject getmenuSet(Long roleId) {

		Role role = roleManager.get(roleId);
		return new SuccessResponse(new LinkedHashSet<Menu>(role.getMenus()));

	}

	/*
	 * 菜单管理根据菜单的id获得菜单属性展示到propertygrid里面
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@ResponseBody
	@RequestMapping(value = "/lookMenuInfo.do")
	public ResponseObject lookMenuInfo(Long menuId) {

		Menu menu = menuManager.get(menuId);
		HashMap<String, String> name = new HashMap<String, String>();
		HashMap<String, String> url = new HashMap<String, String>();
		HashMap<String, String> icon = new HashMap<String, String>();
		name.put("name", "菜单名");
		name.put("value", menu.getName());
		name.put("editor", "text");
		url.put("name", "菜单路径");
		url.put("editer", "text");
		url.put("value", menu.getUrl());
		icon.put("name","图标");
		icon.put("value",menu.getIconCls());
		ArrayList res = new ArrayList();
		res.add(name);
		res.add(url);
		res.add(icon);
		return new SuccessResponse(res);
	}

}
