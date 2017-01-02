package easyFrame.dao;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import easyFrame.model.Menu;



public interface MenuDao extends GenericDao<Menu, Long> {
	List<Menu> getMenusByParentId(Long parentId);

}
