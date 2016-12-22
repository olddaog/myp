package easyFrame.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import easyFrame.service.ResponseObject;

@Controller
public class UserController {
	@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public String loginPage(@RequestParam(value = "error", required = false) String error, Model model) {
		if (error != null) {
			return "login-failure";
		}
		return "login";
	}
}
