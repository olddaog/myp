 package easyFrame.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;








import org.springframework.transaction.annotation.Transactional;

import easyFrame.dao.MenuDao;
import easyFrame.model.Menu;
import easyFrame.service.MenuManager;

@Service(value="menuManager")
@Transactional
public class MenuManagerImp extends GenericManagerImpl<Menu, Long> implements MenuManager{

	@Autowired
	MenuDao menuDao;

	public MenuManagerImp() {
	
	}

	@Autowired
	public MenuManagerImp(
			MenuDao menuDao) {
		super(menuDao);
		this.menuDao =menuDao;
	}
	

	public boolean makeEasyUItreeByRoleId(Long id) {
		return false;
	}

	public List<Menu> getMenusByParentId(Long parentId) {
		return menuDao.getMenusByParentId(parentId);
	}
	
	
}
