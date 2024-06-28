package com.springmvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@ControllerAdvice //This annotation is for centralized exception handling
public class MyExceptionHandler {
	//Exception handling
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
		
//---------------------------------------------------------------------------------//
	
	//Generic Exception Handling
	@ExceptionHandler(value = Exception.class)
	public String ExceptionHandler(Model m, Exception e) {
		m.addAttribute("msg", "Exception: "+e);
		return "ErrorPage";
	}
}
