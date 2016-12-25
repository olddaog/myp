package easyFrame.dao.hirbernate;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;






import org.springframework.transaction.annotation.Transactional;

import easyFrame.dao.MenuDao;
import easyFrame.model.Menu;

@Repository(value="menuDao")
public class menuDaoHirbernate extends GernericDaoHirbernate<Menu, Long>implements MenuDao {

	public menuDaoHirbernate() {
		super(Menu.class);
	}
	
}

