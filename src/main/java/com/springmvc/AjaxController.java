package com.springmvc;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class AjaxController {
	@Autowired
	MainDao dao;
	
	@ResponseBody
	@RequestMapping("getcountry")
	public List<String> getCountry(){
		return dao.getCountry();
	}
	@ResponseBody
	@RequestMapping("getstate/{country}")
	public List<String> getState(@PathVariable("country") String country){
		return dao.getState(country);
	}
	
	@ResponseBody
	@RequestMapping("getcity/{state}")
	public List<String> getCity(@PathVariable("state") String state){
		return dao.getCity(state);
	}
	
	@RequestMapping(value = "savestudent", method = RequestMethod.POST)
	public void saveStudent(@RequestBody LoginModel lm, HttpSession seesion) {
		int s = dao.saveStudent(lm);
		seesion.setAttribute("status", "success");
		
	}
	
	//Exception handling
	/*@RequestMapping("nullpointerexc")
	public String getNullPointerException() {
		String str=null;
		System.out.println("Length of STring: "+str.length());
		return "redirect:/";
	}
	
	@ExceptionHandler(value = NullPointerException.class)
	public String NullPointerExceptionHandler(Model model) {
		model.addAttribute("msg", "Null pointer exception occurs");
		return "ErrorPage";
	}
	
	@RequestMapping("numberformat")
	public String getNumberFormatException() {
		String str="Welocme";
		Integer.parseInt(str);
		return "redirect:/";
	}
	
	@ExceptionHandler(value = NumberFormatException.class)
	public String NumberFormatExceptionHandler(Model model) {
		model.addAttribute("msg1", "Number format exception occurs");
		return "ErrorPage";
	}
	
	@ExceptionHandler(value = Exception.class)
	public String ExceptionHandler(Model model, Exception e) {
		model.addAttribute("msg2", "Exception: "+e);
		return "ErrorPage";
	}*/
	
	
	/*@ControllerAdvice //This annotation is for centralized exception handling
	public class MyExceptionHandler {
		@RequestMapping("nullpointerexc")
		public String getNullPointerException() {
			String str=null;
			System.out.println("Length of STring: "+str.length());
			return "redirect:/";
		}
		
		@ExceptionHandler(value = NullPointerException.class)
		public String NullPointerExceptionHandler(Model model) {
			model.addAttribute("msg", "Null pointer exception occurs");
			return "ErrorPage";
		}
		
		@RequestMapping("numberformat")
		public String getNumberFormatException() {
			String str="Welocme";
			Integer.parseInt(str);
			return "redirect:/";
		}
		
		@ExceptionHandler(value = NumberFormatException.class)
		public String NumberFormatExceptionHandler(Model model) {
			model.addAttribute("msg1", "Number format exception occurs");
			return "ErrorPage";
		}
		
		//Generic Exception Handling
		@ExceptionHandler(value = Exception.class)
		public String ExceptionHandler(Model model, Exception e) {
			model.addAttribute("msg2", "Exception: "+e);
			return "ErrorPage";
		}
	}
	*/
	
}
