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
	public ResponseObject saveMenu(@RequestBody Menu menu) {
		menu = menuManager.save(menu);
		Menu parent = menuManager.get(menu.getParentId());
		parent.getChildren().add(menu);
		Menu res = menuManager.save(parent);
		return new SuccessResponse(res);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/getmenu.do")
	@ResponseBody
	public ResponseObject getMenu(HttpServletRequest request) {
		String username = request.getRemoteUser();
		User user = userManager.getByUserName(username);
		List<Menu> aa = menuManager.getAll();
		ArrayList list = new ArrayList();
		// 获得所有角色，然后把所有角色对应的菜单整合成一块
		Set<Role> roles = user.getRole();
		Iterator<Role> itera = roles.iterator();
		ArrayList<Menu> menus = new ArrayList<Menu>();

		while (itera.hasNext()) {
			Set<Menu> power = itera.next().getMenus();
			for (Menu menu : power) {
				menus.add(menu);
			}
		}
		HashMap<Long, Menu> map = new HashMap<Long, Menu>();
		for (Menu menu : menus) {
			if (menu.getChildren().size() > 0) {
				map.put(menu.getId(), menu);
			}
		}
		return new SuccessResponse(map.values());
	}

	@RequestMapping(value = "/showMenuManager.do")
	public String showMenuManager() {
		return "admin/menuManager";
	}

	@ResponseBody
	@RequestMapping(value = "/getAllMenu.do")
	public ResponseObject getAllMenu(Long roleId) {
		// 获取所有根节点

		List<Menu> menus = menuManager.getAll();

		HashSet<Menu> menuSet = new HashSet<Menu>();

		for (Menu menu : menus) {

			menuSet.add(menu);
		}
		// test(menuSet);
		HashSet<Menu> aaaa = test(menuSet);

		for (Menu menu : menus) {
			if ((0l + "").equals(menu.getParentId() + "")) {
				aaaa.add(menu);
			}
		}
		Role role = roleManager.get(roleId);
		for (Menu mm : role.getMenus()) {
			for (Menu menu : aaaa) {
				if ((mm.getId() + "").equals(menu.getId() + "")) {
					menu.setChecked(true);
				}
			}

		}
		HashMap<Long, Menu> map = new HashMap<Long, Menu>();
		// 把aaaa中menu生成一个tree

		for (Menu menu : aaaa) {
			map.put(menu.getId(), menu);
		}

		for (Menu menu : aaaa) {
			if (!(0l + "").equals(menu.getParentId() + "")) {
				map.get(menu.getParentId()).addChildren(menu);
			}
		}

		HashSet<Menu> bbbb = new HashSet<Menu>();
		for (Menu menu : aaaa) {
			if ((0l + "").equals(menu.getParentId() + "")) {
				bbbb.add(menu);
			}
		}

		return new SuccessResponse(bbbb);

	}

	public HashSet<Menu> test(HashSet<Menu> set) {
		HashSet<Menu> set2 = new HashSet<Menu>();
		// 遍历所有menus，将所有menu放入list里面
		for (Menu menu : set) {
			set2.addAll(menu.getChildren());
			// set2.add(menu);
			test(set2);
		}
		return set2;
	}

	@ResponseBody
	@RequestMapping(value = "/getMenusByRole.do")
	public ResponseObject getMenusByRole(Long roleId) {
		Role role = roleManager.get(roleId);
		Set<Menu> menus = role.getMenus();
		return new SuccessResponse(menus);
	}

	// 给角色分配菜单
	@ResponseBody
	@RequestMapping(value = "/assignMenuByRole.do")
	public ResponseObject assignMenuByRole(@RequestBody HashSet<Menu> menus,
			Long roleId) {

		Role role = roleManager.get(roleId);
         role.setMenus(menus);
         roleManager.save(role);

		return new SuccessResponse();

	}

}
