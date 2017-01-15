package easyFrame.service;

import java.util.List;

import easyFrame.model.Org;

public interface OrgManager extends GenericManager<Org, Long> {
	List<Org> getOrgsByParentId(Long parentId);
	
}
