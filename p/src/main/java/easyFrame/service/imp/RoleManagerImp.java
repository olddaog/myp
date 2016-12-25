package easyFrame.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import easyFrame.dao.RoleDao;
import easyFrame.dao.UserDao;
import easyFrame.model.Role;
import easyFrame.service.RoleManager;
@Service(value="roleManager")
@Transactional
public class RoleManagerImp extends GenericManagerImpl<Role, Long> implements RoleManager{

	@Autowired
	RoleDao  roleDao;

	public RoleManagerImp() {
	
	}

	@Autowired
	public RoleManagerImp(
			RoleDao roleDao) {
		super(roleDao);
		this.roleDao =roleDao;
	}

	
}
 