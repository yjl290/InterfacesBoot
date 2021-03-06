package cn.springmvc.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.springmvc.model.Function;
import cn.springmvc.service.IFunctionService;


@Controller
@RequestMapping(value = "/func")
public class FunctionController {

	/**
	 * Controller Method
	 */

	@Autowired
	private IFunctionService funcService;

	@Autowired
	private HttpServletRequest request;

	public FunctionController(){}

	@RequestMapping(value = "/funclist.do")
	public String functionlist(Integer pag,Integer pagesize) {
		request.setAttribute("data", funcService.list(pag,pagesize));
		return "func/funcList";
	}

	@RequestMapping(value = "/addfunc.do")
	public String addfunc(Function func) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		funcService.add(func);
		return "redirect:funclist.do";
	}

	@RequestMapping(value = "/toaddfunc.do")
	public String toaddfunc(){
		request.setAttribute("objs", funcService.toadd());
		return "func/addfunc";
	}

	@RequestMapping(value = "/toupdatefunc.do")
	public String toupdatefunc(String funcid){
		request.setAttribute("data", funcService.toupdate(funcid));
		return "func/updatefunc";
	}

	@RequestMapping(value = "/updatefunc.do")
	public String updatefunc(Function func){
		funcService.update(func);
		return "redirect:funclist.do";
	}

	@RequestMapping(value = "/delete.do")
	public String delete(String funcid){
		funcService.delete(funcid);
		return "redirect:funclist.do";
	}

	@RequestMapping(value = "/checkname.do")
	@ResponseBody
	public String checkname(String funcname){
		return funcService.checkname(funcname);
	}
}
