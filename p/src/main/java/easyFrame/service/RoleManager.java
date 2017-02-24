package easyFrame.service;

import org.springframework.transaction.annotation.Transactional;

import easyFrame.model.Role;
@Transactional
public interface RoleManager extends GenericManager<Role, Long> {

}
