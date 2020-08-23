package cn.springmvc.controller;

import java.io.UnsupportedEncodingException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.springmvc.model.TParmeters;
import cn.springmvc.service.impl.BaseService;

@Controller
@RequestMapping(value = "/parmeters")
public class TestParmetersController {
	
	@Autowired
	private HttpServletRequest request;
	
	
	@Resource(name="parmetersService")
	private BaseService testParmetersService;
	
	@RequestMapping(value = "/list.do")
	public String list(Integer pag,Integer pagesize) {
		//System.out.println("1111pag "+pag +" pagesize"+pagesize);
		request.setAttribute("data", testParmetersService.list(pag,pagesize));
		return "parmeters/parmetersList";
	}
	
	@RequestMapping(value = "/add.do")
	public String addfunc(TParmeters tParmeters) throws UnsupportedEncodingException{
		tParmeters.setUid(UUID.randomUUID().toString());
		testParmetersService.add(tParmeters);
		return "redirect:list.do";
	}

	@RequestMapping(value = "/toadd.do")
	public String toadd(){
		//request.setAttribute("objs", funcService.toadd());
		return "parmeters/addParmeters";
	}
	
	@RequestMapping(value = "/delete.do")
	public String delete(String id){
		testParmetersService.delete(id);
		return "redirect:list.do";
	}
	
	@RequestMapping(value = "/toupdate.do")
	public String toupdatefunc(String id){
		request.setAttribute("data", testParmetersService.getById(id));
		return "parmeters/updateParmeters";
	}
	
	@RequestMapping(value = "/update.do")
	public String updatefunc(TParmeters system){
		testParmetersService.update(system);
		return "redirect:list.do";
	}

}
