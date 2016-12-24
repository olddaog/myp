package easyFrame.controller;

import org.apache.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import easyFrame.service.ResponseObject;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	
	@RequestMapping(value = "/loginTrans.do")
	public String loginDispacher() {
		System.out.println("--------------------------");
		return "admin/home";
	}
}
