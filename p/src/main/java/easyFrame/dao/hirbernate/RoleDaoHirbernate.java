package easyFrame.dao.hirbernate;

import org.springframework.stereotype.Repository;

import easyFrame.dao.RoleDao;
import easyFrame.model.Role;
@Repository(value="roleDao")
public class RoleDaoHirbernate extends GernericDaoHirbernate<Role, Long> implements RoleDao {

	public RoleDaoHirbernate() {
		super(Role.class);	
	}

}
