package easyFrame.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;

import easyFrame.model.Role;
import easyFrame.service.FailResponse;
import easyFrame.service.ResponseObject;
import easyFrame.service.RoleManager;
import easyFrame.service.SuccessResponse;

@Controller
@RequestMapping(value = "admin/role")
public class RoleController {
	@Autowired
	RoleManager roleManager;

	@RequestMapping(value = "/list.do")
	public String list() {
		return "admin/roleManager";
	}

	@ResponseBody
	@RequestMapping(value = "showRoles.do")
	public List<Role> showRoles() {
		List<Role> roles = roleManager.getAll();
		return roles;
	}
	@ResponseBody
	@RequestMapping(value = "save.do")
	public ResponseObject save(@RequestBody Role role) {
		try {
			Role parent = roleManager.get(role.getParentId());
			Role newRole = roleManager.save(role);
			parent.getChildren().add(newRole);
			roleManager.save(parent);
			return new FailResponse();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new FailResponse();

	}

}
