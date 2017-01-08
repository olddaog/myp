package easyFrame.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import easyFrame.dao.OrgDao;
import easyFrame.model.Org;
import easyFrame.service.OrgManager;
@Service("orgManager")
public class OrgManagerImp extends GenericManagerImpl<Org, Long> implements OrgManager{
	
	OrgDao orgDao;
	@Autowired
	public OrgManagerImp(OrgDao orgDao){
		super(orgDao);
		this.orgDao=orgDao;
	}
	public List<Org> getOrgsByParentId(Long parentId) {	
		return orgDao.getOrgsByParentId(parentId);
	}

}
