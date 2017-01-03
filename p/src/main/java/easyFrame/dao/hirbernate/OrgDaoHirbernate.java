package easyFrame.dao.hirbernate;

import easyFrame.dao.OrgDao;
import easyFrame.model.Org;

public class OrgDaoHirbernate extends GernericDaoHirbernate<Org, Long> implements OrgDao {

public OrgDaoHirbernate(){
	super(Org.class);
}

}
