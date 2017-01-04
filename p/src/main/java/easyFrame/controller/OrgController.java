package easyFrame.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import easyFrame.model.Org;
import easyFrame.service.OrgManager;
import easyFrame.service.ResponseObject;

@Controller
@RequestMapping("/admin/org")
public class OrgController {
	@Autowired
	OrgManager orgManager;
	@ResponseBody
	@RequestMapping("list.do")
	public ResponseObject list(Long parentId){
		try {
			orgManager.getOrgsByParentId(parentId);
			} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public ResponseObject save(@RequestBody Org org){
		
		return null;
	}

}
