package com.sjcj.service.imp;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sjcj.dao.DaoSupport;
import com.sjcj.model.Url;
import com.sjcj.service.UrlManager;
@Service("urlManager")
public class UrlManagerImp implements UrlManager {
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	public Object saveUrl(Url url) {
		
		try {
			return dao.save("UrlMapper.saveUrl", url);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
