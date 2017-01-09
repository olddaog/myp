package easyFrame.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import easyFrame.dao.UserDao;

import easyFrame.model.User;

import easyFrame.service.UserManager;
@Service(value="userManager")
@Transactional
public class UserManagerImp extends GenericManagerImpl<User, Long> implements UserManager{
	@Autowired
	UserDao userDao;
	private PasswordEncoder passwordEncoder ;
	public UserManagerImp() {
	
	}

	@Autowired
	public UserManagerImp(
			UserDao userDao) {
		super(userDao);
		this.userDao =userDao;
	}

	public User getByUserName(String username) {
	User user = userDao.getByUserName(username);
		return user;
	}

	public User SaveUser(User user) {
		//密码加密
		user.setPassword(passwordEncoder.encode(user.getPassword()));	
		return userDao.save(user);
	}
	
	
	//注入
	@Autowired
	@Qualifier("passwordEncoder")
	public void setPasswordEncoder(final PasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
	String tmp = this.passwordEncoder.encode("123");
	System.out.println(tmp);
	}

	

}
