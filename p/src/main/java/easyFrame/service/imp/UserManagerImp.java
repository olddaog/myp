package easyFrame.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import easyFrame.dao.OrgDao;
import easyFrame.dao.UserDao;
import easyFrame.model.Org;
import easyFrame.model.User;

import easyFrame.service.UserManager;

@Service(value = "userManager")
@Transactional
public class UserManagerImp extends GenericManagerImpl<User, Long> implements UserManager, UserDetailsService {
	@Autowired
	UserDao userDao;
	@Autowired
	OrgDao orgDao;
	private PasswordEncoder passwordEncoder;

	public UserManagerImp() {

	}

	@Autowired
	public UserManagerImp(UserDao userDao) {
		super(userDao);
		this.userDao = userDao;
	}

	public User getByUserName(String username) {
		User user = userDao.getByUserName(username);
		return user;
	}

	public User SaveUser(User user) {
		// 密码加密
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		return userDao.save(user);
	}

	// 注入
	@Autowired
	@Qualifier("passwordEncoder")
	public void setPasswordEncoder(final PasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
		/*String tmp = this.passwordEncoder.encode("123");
		System.out.println(tmp);*/
	}

	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User u = userDao.getByUserName(username);
		org.springframework.security.core.userdetails.User details = new org.springframework.security.core.userdetails.User(
				u.getUsername(), u.getPassword(), true, true, true, true,
			u.getRole());

		return details;

	}

	public List<User> getUsersbyOrg(Org org) {
		
		return userDao.getUsersbyOrg(org);
	}

}
