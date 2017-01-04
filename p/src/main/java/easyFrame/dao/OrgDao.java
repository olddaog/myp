package easyFrame.dao;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import easyFrame.model.Menu;
import easyFrame.model.Org;

public interface OrgDao extends GenericDao<Org, Long> {
	List<Org> getOrgsByParentId(Long parentId);
}
