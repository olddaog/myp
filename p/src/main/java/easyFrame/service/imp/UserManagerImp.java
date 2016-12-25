package easyFrame.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import easyFrame.dao.MenuDao;
import easyFrame.dao.UserDao;

import easyFrame.model.Menu;
import easyFrame.model.User;
import easyFrame.service.MenuManager;
import easyFrame.service.UserManager;
@Service(value="userManager")
@Transactional
public class UserManagerImp extends GenericManagerImpl<User, Long> implements UserManager{
	@Autowired
	UserDao userDao;

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
	
	
	

}
