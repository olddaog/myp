package easyFrame.dao.hirbernate;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import easyFrame.dao.MenuDao;
import easyFrame.dao.UserDao;
import easyFrame.model.Menu;
import easyFrame.model.Org;
import easyFrame.model.User;

@Repository(value = "userDao")
public class UserDaoHirbernate extends GernericDaoHirbernate<User, Long> implements UserDao {

	public UserDaoHirbernate() {
		super(User.class);
	}

	@SuppressWarnings("rawtypes")
	public User getByUserName(String username) {
		List res = getSession().createCriteria(User.class).add(Restrictions.eq("userName", username)).list();
		if (res != null && res.size() > 0) {
			return (User) res.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public List<User> getUsersbyOrg(Org org) {
		List<User> users = getSession().createCriteria(User.class).add(Restrictions.eq("org", org)).list();
		Collection<User> result = new LinkedHashSet<User>(users);
		return new ArrayList<User>(result);
	}
}
