package easyFrame.service;

import easyFrame.model.User;

public interface UserManager extends GenericManager<User, Long> {

	public User getByUserName(String userName);
	
	
}
