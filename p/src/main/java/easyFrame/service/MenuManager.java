package easyFrame.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import easyFrame.model.Menu;



@Transactional
public interface MenuManager extends GenericManager<Menu, Long>  {

	public boolean	makeEasyUItreeByRoleId(Long id);  
	
	public List<Menu> getMenusByParentId(Long parentId);
	
	

}
