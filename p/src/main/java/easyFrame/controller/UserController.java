package easyFrame.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import easyFrame.model.User;
import easyFrame.service.OrgManager;
import easyFrame.service.ResponseObject;
import easyFrame.service.SuccessResponse;
import easyFrame.service.UserManager;

@Controller
@RequestMapping(value = "/user")
public class UserController {
@Autowired
UserManager userManager;
@Autowired
OrgManager orgManager;

	@RequestMapping(value = "/loginTrans.do")
	public String loginDispacher(HttpServletRequest request) {
		System.out.println("--------------------------");
		SecurityContextImpl securityContextImpl = (SecurityContextImpl) request.getSession()
				.getAttribute("SPRING_SECURITY_CONTEXT");
		// 登录名
		System.out.println("Username:" + securityContextImpl.getAuthentication().getName());
		// 登录密码，未加密的
		System.out.println("Credentials:" + securityContextImpl.getAuthentication().getCredentials());
		WebAuthenticationDetails details = (WebAuthenticationDetails) securityContextImpl.getAuthentication()
				.getDetails();
		// 获得访问地址
		System.out.println("RemoteAddress" + details.getRemoteAddress());
		// 获得sessionid
		System.out.println("SessionId" + details.getSessionId());
		// 获得当前用户所拥有的权限
		@SuppressWarnings("unchecked")
		List<GrantedAuthority> authorities = (List<GrantedAuthority>) securityContextImpl.getAuthentication()
				.getAuthorities();
		for (GrantedAuthority grantedAuthority : authorities) {
			System.out.println("Authority" + grantedAuthority.getAuthority());
		}
		return "admin/home";
	}

	// 新建用户
	@RequestMapping(value = "/save.do")
	@ResponseBody
	public ResponseObject save(@RequestBody User usr) {
		// 密码加密操作
		//

		return null;

	}

	@RequestMapping(value = "/showUserManager.do")
	public String showUserManager() {
		return "admin/userManager";
	}

	//////////////////////////////////

	@ResponseBody
	@RequestMapping(value = "/getUsersByOrg.do")
	public ResponseObject getUsersByOrg(Long orgId) {
			return  new SuccessResponse(userManager.getUsersbyOrg(orgManager.get(orgId)));

	}

}
