package easyFrame.dao;

import easyFrame.model.Menu;
import easyFrame.model.User;

public interface UserDao extends  GenericDao <User, Long>{
        User    getByUserName(String username);
}
