package easyFrame.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;

import easyFrame.model.Role;
import easyFrame.service.ResponseObject;
import easyFrame.service.RoleManager;
import easyFrame.service.SuccessResponse;

@Controller
@RequestMapping(value="admin/role")
public class RoleController {
	@Autowired
	RoleManager roleManager;
	@RequestMapping(value = "/list.do")
	public String list(){
		System.out.println("888888888888888888888888888888");
		return "admin/roleManager";	
	}
        @ResponseBody    
	@RequestMapping(value="showRoles.do")
public  Object showRoles(){
	List<Role> roles = roleManager.getAll();
	return roles;
}
	
	
	
}
