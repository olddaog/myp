package easyFrame.dao.hirbernate;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import easyFrame.dao.MenuDao;
import easyFrame.dao.UserDao;
import easyFrame.model.Menu;
import easyFrame.model.User;

public class UserDaoHirbernate extends GernericDaoHirbernate<User, Long> implements UserDao {
	public UserDaoHirbernate() {
		super(User.class);
	}

	@SuppressWarnings("rawtypes")
	public User getByUserName(String username) {
	  List res = getSession().createCriteria(User.class).add(Restrictions.eq("userName", username)).list();	
		if(res!=null&&res.size()>0){
			return (User) res.get(0);
		}
	  return null;
	}
}
