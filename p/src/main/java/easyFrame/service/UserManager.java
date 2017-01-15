package easyFrame.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import easyFrame.model.Org;
import easyFrame.model.User;

@Transactional
public interface UserManager extends GenericManager<User, Long> {

	User getByUserName(String userName);

	User SaveUser(User user);

	List<User> getUsersbyOrg(Org org);

}
