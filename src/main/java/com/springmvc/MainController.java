package com.springmvc;


import java.io.*;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
public class MainController {
	
	@Autowired
	MainDao dao;
	
	
	@RequestMapping("/login")
	public String getLogin() {
		return "login";
	}
	@RequestMapping("/Dashboard")
	public String getDashboard() {
		return "dashboard";
	}
	@RequestMapping("/registration")
	public String getView() {
		return "regForm";
	}
	
	/*@RequestMapping(value = "/save" , method = RequestMethod.POST)
	public String saveData(@ModelAttribute("rm") RegModel rm, HttpSession session ) {
		int status = dao.saveData(rm);
		session.setAttribute("sesreg", "success");
		return "login";
	}*/
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveData(@ModelAttribute("rm") RegModel rm, HttpSession session, @RequestParam("email")String email) {
		List<RegModel> list = dao.checkRegistration(email);
		if(list!=null)
		{
			session.setAttribute("sesuserexist", "check");
			return "regForm";
		}
		else
		{
			Random rd = new Random();
			int otp = rd.nextInt(999999) + 100000;

				
			int status = dao.saveData(rm,otp);
			int status1 = dao.sendOtp(rm,otp);
			session.setAttribute("sesreg", "success");
			return "regotp";
		}

	}
	
	@RequestMapping(value = "regotpserver", method = RequestMethod.POST)
	public String getRegistration(@RequestParam("otp") String otp) {
				
			int s = dao.updateStatus(otp);
			return "login";
				
	}
	
	@RequestMapping(value = "/dologin" , method = RequestMethod.POST)
	public String doLogin(@ModelAttribute("lm") LoginModel lm, HttpSession session) {
		List<RegModel> list = dao.login(lm);
		if(list!=null) {
			session.setAttribute("sesemail", lm.getEmail());
			return "redirect:/view";
			
		}else{
			session.setAttribute("seslog", "fail");
			return "login"; //retrun "redirect:/"
			//in case of if the login page is in the index page so we cant go to the index page hitting url so use the above code
		}
		 
	}
	
	@RequestMapping("view")
	public String getDetails(Model model) {
		List<RegModel> list = dao.getDetails();
		model.addAttribute("list", list);
		return "dashboard";
	}
	
	@RequestMapping("delete/{id}" )
	public String deleteById(@PathVariable int id, HttpSession session) {
		int s = dao.getDeleteById(id);
		session.setAttribute("sesdelete", "success");
		return "redirect:/view";	
	}
	
	@RequestMapping("deleteMultiple")
	public String deleteMultiple(@RequestParam("ids") String[] id) {
		for(int i=0; i<id.length; i++)
			dao.getDeleteMultiple(id[i]);
		return "redirect:/view";
	}
	
/*	@RequestMapping("edit/{id}")
	public String editById(@PathVariable int id, Model model) {
		RegModel rm = dao.getDetailsById(id);
		model.addAttribute("command", rm);
		model.addAttribute("user", rm);
		return "edit";
	} */
	
	@RequestMapping("edit/{id}")
	public String editById(@PathVariable int id, Model model) {
		List<RegModel> list = dao.getUserById(id);
		model.addAttribute("list", list);
		//model.addAttribute("user", list);
		return "edit1";
	} 
	
	@RequestMapping(value = "/update" , method = RequestMethod.POST)
	public String updateData(@ModelAttribute("rm") RegModel rm, HttpSession sesion) {
		int status = dao.getUpdate(rm);
		sesion.setAttribute("sesupdate", "success");
		return "redirect:/view";
	}
	
	@RequestMapping("fileupload")
	public String getFile() {
		return "fileupload";
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String getUploadFile(Model model, @RequestParam CommonsMultipartFile file)
	{
		String filename = file.getOriginalFilename();
		String filepath="D:\\upload";
		try{  
	        byte barr[]=file.getBytes();  
	          
	        BufferedOutputStream bout=new BufferedOutputStream(  
	                 new FileOutputStream(filepath+"\\"+filename));  
	        bout.flush();  
	        bout.close();  
	          model.addAttribute("msg","File Uploaded Successfully");
	        }catch(Exception e){System.out.println(e);}  
		return "fileupload";
	}
	
	@RequestMapping("fileUploadAttach")
	public String getUploadAttach() {
		return "fileUploadAttach";
	}
	 
	@RequestMapping(value = "uploadattachment" , method = RequestMethod.POST)
	public String saveUploadAttach(@ModelAttribute("upload") UploadModel upload, Model model) {
		dao.upload(upload);
		int s = dao.saveUpload(upload);
		model.addAttribute("msg", "File upload successfull");
		return "fileUploadAttach";
	}
	
	@RequestMapping("download")
	public String getDownload() {
		return "download";
	}
	
	@RequestMapping("downloadFile")
	public String getDownloadFile(HttpServletRequest req, HttpServletResponse res)throws IOException {
		dao.getDownload(req,res);
		return "redirect:/view";
	}
	
	@RequestMapping("tableDownload")
	public String downloadData(HttpSession session) {
		List<UploadModel> upload = dao.downloadFiles();
		session.setAttribute("upload", upload);
		return "tableDownload";
	}
	
	@RequestMapping("downloadFile/{filename:.+}")
	public String getDownloadTableFile(@PathVariable("filename") String filename, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		dao.downloadTableFile(req,res,filename,session);
		return "tableDownload";
		
	}
	
	@RequestMapping("/mailForm")
	public String getMailForm() {
		return "mailForm";
	}
	
	@RequestMapping(value = "sendEmail" , method = RequestMethod.POST )
	public String getMail(@ModelAttribute("mailmodel") MailModel mailmodel, Model model) {
		dao.sendMail(mailmodel);
		model.addAttribute("emailmsg","Email Send Successfully");
		return "mailForm";
	}
	
	@RequestMapping("/mailFormAttach")
	public String getMailFormAttach() {
		return "mailFormAttach";
	}
	
	@RequestMapping(value = "sendEmailAttachment", method = RequestMethod.POST)
	public String sendEmailAttachment(@ModelAttribute("mailModelAttach") MailModelAttach mailModelAttach, Model model) {
		CommonsMultipartFile filename = mailModelAttach.getFile();
		dao.sendEmailAttachment(mailModelAttach,filename);
		model.addAttribute("emailmsg", "Email Send Successfully");
		return "mailFormAttach";
	}
	
	@RequestMapping("forgetpass")
	public String getForgetPage() {
		return "forgetpass";
	}
	
	@RequestMapping(value = "forgetserver", method = RequestMethod.POST)
	public String getRegEmailOtp(@RequestParam("email") String email, HttpSession session) {
	    String status = dao.CheckRegEmail(email);
	    Random rd = new Random();
		int otp1 = rd.nextInt(99999) + 100000;
		String otpS = String.valueOf(otp1);
		
		session.setAttribute("sesregotp", otpS);
  	  	session.setAttribute("sesemail", email);
  	  	
	    if (status != null) {
	    	  dao.sendOtpEmail(email, otpS);
	    	  return "emailotp";
	    } else{
	    	session.setAttribute("sesregotp", "fail");
			return "forgetpass";
	    }
		
	}
	
	@RequestMapping(value = "otpserver", method = RequestMethod.POST)
	public String checkOtp(@RequestParam("otp") String otpS, HttpSession session) {
		String otp1   = (String) session.getAttribute("sesregotp");
		String email = (String) session.getAttribute("sesemail");
		System.out.println("Form OTP "+otpS+" session otp "+otp1);
		if(otpS.equals(otp1)) {
			String password = dao.getPassword(email);
			dao.sendPasswordtoEmail(password,email);
			session.setAttribute("sesotp", "success");
			return "login";
		}else {
			session.setAttribute("sesotp", "fail");
			return "emailotp";
		}
		
	}
	
	
		
	
}

