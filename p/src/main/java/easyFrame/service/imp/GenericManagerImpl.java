package easyFrame.service.imp;



import easyFrame.dao.GenericDao;

import easyFrame.service.GenericManager;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;


@Transactional
public class GenericManagerImpl<T, PK extends Serializable> implements GenericManager<T, PK> {


    protected GenericDao<T, PK> dao;


    public GenericManagerImpl() {
   
    }

    public GenericManagerImpl(GenericDao<T, PK> genericDao) {
        this.dao = genericDao;
    }


	public T get(PK id) {
		// TODO Auto-generated method stub
		return dao.get(id);
	}

	public T get(PK id, String institutionCode) {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean exists(PK id) {
		// TODO Auto-generated method stub
		return false;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public T save(T object) {
		return 	dao.save(object);
		
	}

	public void remove(T object) {
		// TODO Auto-generated method stub
		
	}

	public void remove(PK id) {
		// TODO Auto-generated method stub
		
	}

	public List<T> search(String searchTerm, Class clazz) {
		// TODO Auto-generated method stub
		return null;
	}

	public void reindex() {
		// TODO Auto-generated method stub
		
	}

	public void reindexAll(boolean async) {
		// TODO Auto-generated method stub
		
	}

	public List<T> getAll() {
		// TODO Auto-generated method stub
		   return dao.getAllDistinct();
	}
	
	
	  
}
