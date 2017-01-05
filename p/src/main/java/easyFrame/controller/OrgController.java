package easyFrame.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import easyFrame.model.Org;
import easyFrame.service.FailResponse;
import easyFrame.service.OrgManager;
import easyFrame.service.ResponseObject;
import easyFrame.service.SuccessResponse;

@Controller
@RequestMapping("/admin/org")
public class OrgController {
	@Autowired
	OrgManager orgManager;

	
	@RequestMapping("orgManager.do")
	public ModelAndView orgManager(Long parentId) {
		return new ModelAndView("admin/orgManager");
	}
	
	@ResponseBody
	@RequestMapping("list.do")
	public ResponseObject list(Long parentId) {
		try {
			List<Org> orgs = orgManager.getOrgsByParentId(parentId);
			return new SuccessResponse(orgs);
		} catch (Exception e) {
			return	new FailResponse("查询出错");
		}

	}

}
