package easyFrame.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import easyFrame.model.Menu;
import easyFrame.model.Role;
import easyFrame.model.User;
import easyFrame.service.MenuManager;
import easyFrame.service.ResponseObject;
import easyFrame.service.SuccessResponse;
import easyFrame.service.UserManager;

//------------------------------------////.///////------------------------njjjnjnj--
@Controller
@RequestMapping("/admin/menu")
public class MenuController {
	@Autowired

	MenuManager menuManager;
	@Autowired

	UserManager userManager;

	@RequestMapping(value = "/save.do")
	@ResponseBody
	public ResponseObject saveMenu(@RequestBody Menu menu) {
		menu = menuManager.save(menu);
		Menu parent = menuManager.get(menu.getParentId());
		System.out.println(JSONObject.fromObject(parent));
		parent.getChildren().add(menu);
		System.out.println(parent.getChildren().size() + "----9999999999999------------------");
		// parent.addChildren(menu);
		Menu res = menuManager.save(parent);
		return new SuccessResponse(res);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/getmenu.do")
	@ResponseBody
	@Transactional
	public ResponseObject getMenu(HttpServletRequest request) {
		String username = request.getRemoteUser();
		User user = userManager.getByUserName(username);
		List<Menu> aa = menuManager.getAll();
		ArrayList list = new ArrayList();
		// 获得所有角色，然后把所有角色对应的菜单整合成一块
		//System.out.println(JSONObject.fromObject(user));
		Set<Role> roles = user.getRole();
		Iterator<Role> itera = roles.iterator();
		ArrayList<Menu> menus = new ArrayList<Menu>();

		while (itera.hasNext()) {
			Set<Menu> power = itera.next().getMenus();
			for (Menu menu : power) {
				menus.add(menu);
			}
		}
		
		//menu去重复
		
		HashMap<Long, Menu> map = new HashMap<Long, Menu>();
		for (Menu menu : menus) {
			if(menu.getChildren().size()>0){
				map.put(menu.getId(), menu);
			}
		}
		
		
		return new SuccessResponse(map.values());
	}
	
	
	

}
