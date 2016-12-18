package easyFrame.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;












import easyFrame.model.Menu;
import easyFrame.service.MenuManager;
import easyFrame.service.ResponseObject;
import easyFrame.service.SuccessResponse;

//------------------------------------////.///////------------------------njjjnjnj--
@Controller
@RequestMapping("/admin/menu")
public class MenuController {
	@Autowired
    MenuManager menuManager;
	@RequestMapping(value = "/save.do")
	@ResponseBody
	public ResponseObject saveMenu(@RequestBody Menu menu ) {
	       menu=   menuManager.save(menu);
	       Menu parent = menuManager.get(menu.getParentId());
	       System.out.println(JSONObject.fromObject(parent));
	       parent.getChildren().add(menu);
	       System.out.println( parent.getChildren().size()+"----9999999999999------------------");
	    //   parent.addChildren(menu);
	    Menu res = menuManager.save(parent);
		 return new SuccessResponse(res);
	}

	@RequestMapping(value = "/getmenu.do")
	@ResponseBody
	@Transactional
	public ResponseObject getMenu(){
		List<Menu> aa = menuManager.getAll();
		ArrayList list = new ArrayList();
		//System.out.println(JSONObject.fromObject(aa.get(0)));
		list.add(aa.get(0));
		return new SuccessResponse(list);
	}
	
	
}
