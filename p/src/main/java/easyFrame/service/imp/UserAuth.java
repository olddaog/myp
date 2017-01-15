package easyFrame.service.imp;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import easyFrame.dao.UserDao;
import easyFrame.model.Role;
import easyFrame.model.User;
import easyFrame.service.UserManager;


@Service("userAuthManager")
@Transactional
public class UserAuth implements UserDetailsService {

	@Autowired
	UserManager userManager;
	@Transactional
	public UserDetails loadUserByUsername(String username){

	/*	User u = new User();

		Set<Role> roles = new HashSet<Role>();
		u.setEnabled(true);
		u.setPassword("123");
		u.setUserName("123");
		Role role = new Role();
		role.setName("ROLE_ADMIN");
		roles.add(role);
		*/
		
		//---------------------------------------
		
	User u = userManager.getByUserName(username);
		
		
		
		org.springframework.security.core.userdetails.User details = new org.springframework.security.core.userdetails.User(
				u.getUsername(), u.getPassword(), true, true, true, true, AuthorityUtils.createAuthorityList("ROLE_ADMIN"));

		return details;
	}

	public static void main(String[] args) {

		String aaa = sendGet(
				"http://restapi.amap.com/v3/direction/driving?origin=116.45925,39.910031&destination=116.587922,40.081577&output=json&key=f5f603f1db0b7df6e4f447aec757921e");

		System.out.println(aaa);

	}

	public static String sendGet(String url) {
		String result = "";
		BufferedReader in = null;
		try {
			String urlNameString = url;
			URL realUrl = new URL(urlNameString);
			// 打开和URL之间的连接
			URLConnection connection = realUrl.openConnection();
			// 设置通用的请求属性
			connection.setRequestProperty("accept", "*/*");
			connection.setRequestProperty("connection", "Keep-Alive");
			connection.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
			// 建立实际的连接
			connection.connect();
			// 获取所有响应头字段
			Map<String, List<String>> map = connection.getHeaderFields();
			// 遍历所有的响应头字段
			for (String key : map.keySet()) {
				System.out.println(key + "--->" + map.get(key));
			}
			// 定义 BufferedReader输入流来读取URL的响应
			in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String line;
			while ((line = in.readLine()) != null) {
				result += line;
			}
		} catch (Exception e) {
			System.out.println("发送GET请求出现异常！" + e);
			e.printStackTrace();
		}
		// 使用finally块来关闭输入流
		finally {
			try {
				if (in != null) {
					in.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}

}
