package easyFrame.service;

import org.springframework.transaction.annotation.Transactional;

import easyFrame.model.Menu;



@Transactional
public interface MenuManager extends GenericManager<Menu, Long>  {

	public boolean	makeEasyUItreeByRoleId(Long id);         

}
