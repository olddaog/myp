package easyFrame.service.imp;

import org.springframework.stereotype.Service;

import easyFrame.model.Role;
import easyFrame.service.RoleManager;
@Service("roleManager")
public class RoleManagerImp extends GenericManagerImpl<Role, Long> implements RoleManager{

}
 