package easyFrame.dao;

import java.util.List;

import easyFrame.model.Menu;
import easyFrame.model.Org;
import easyFrame.model.User;

public interface UserDao extends  GenericDao <User, Long>{
        User getByUserName(String username);
        List<User> getUsersbyOrg(Org org);
        
}
