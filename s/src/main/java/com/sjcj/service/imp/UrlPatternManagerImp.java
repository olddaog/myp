package com.sjcj.service.imp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sjcj.dao.DaoSupport;
import com.sjcj.model.UrlPattern;
import com.sjcj.service.UrlpatternManager;
@Service("urlPatternManager")
public class UrlPatternManagerImp implements UrlpatternManager {
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	public UrlPattern get(Long id) {
		// TODO Auto-generated method stub
		try {
			return (UrlPattern) dao.findForObject("UrlPatternMapper.get", id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public List<UrlPattern> getAll() {
		// TODO Auto-generated method stub
		try {
			return (List<UrlPattern>) dao.findForList("UrlPatternMapper.getAll","");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
