package easyFrame.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;

import easyFrame.service.ResponseObject;

@Controller
@RequestMapping(value="admin/role")
public class RoleController {
	@RequestMapping(value = "/list.do")
	public String list(){
		System.out.println("888888888888888888888888888888");
		return "admin/roleManager";	
	}
            
}
