package easyFrame.dao.hirbernate;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.List;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import easyFrame.dao.OrgDao;
import easyFrame.model.Menu;
import easyFrame.model.Org;
@Repository("orgDao")
public class OrgDaoHirbernate extends GernericDaoHirbernate<Org, Long> implements OrgDao {

public OrgDaoHirbernate(){
	super(Org.class);
}

@SuppressWarnings("unchecked")
public List<Org> getOrgsByParentId(Long parentId) {

	List<Org> list = getSession().createCriteria(Org.class).add(Restrictions.eq("parentId", parentId)).list();
			
	Collection<Org> result = new LinkedHashSet<Org>(list);  
	
	return new ArrayList<Org>(result);
}

}
