package easyFrame.dao.hirbernate;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;






import org.springframework.transaction.annotation.Transactional;

import easyFrame.dao.MenuDao;
import easyFrame.model.Menu;

@Repository(value="menuDao")
public class menuDaoHirbernate extends GernericDaoHirbernate<Menu, Long>implements MenuDao {

	public menuDaoHirbernate() {
		super(Menu.class);
	}

	@SuppressWarnings("unchecked")
	public List<Menu> getMenusByParentId(Long parentId) {
		
		List list = getSession().createCriteria(Menu.class).add(Restrictions.eq("parentId", parentId)).list();
				
		Collection<Menu> result = new LinkedHashSet<Menu>(list);  
		   
		return new ArrayList<Menu>(result);
		  
	}
	
}

