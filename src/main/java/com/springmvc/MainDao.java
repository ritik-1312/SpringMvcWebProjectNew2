package com.springmvc;

import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.core.io.InputStreamSource;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


public class MainDao {
	private JdbcTemplate jdbctemplate;
	private MailSender mailSender;
	private JavaMailSender javaMailSender;
	
	
	
	public JavaMailSender getJavaMailSender() {
		return javaMailSender;
	}

	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}

	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}

	public void setJdbctemplate(JdbcTemplate jdbctemplate) {
		this.jdbctemplate = jdbctemplate;
	}


	public int saveData(RegModel rm, int otp) {
		// TODO Auto-generated method stub
		
		String sql = "insert into tb_reg(name,email,password,gender,course,city,otp,status) values('"+rm.getName()+"', '"+rm.getEmail()+"',"
				+ "'"+rm.getPassword()+"', '"+rm.getGender()+"', '"+rm.getCourse()+"', '"+rm.getCity()+"', '"+otp+"', '"+1+"')";
		return jdbctemplate.update(sql);
	}
	
	public int sendOtp(RegModel rm, int otp) {
		// TODO Auto-generated method stub
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("hritikgawali@gmail.com");
		message.setTo(rm.getEmail());
		message.setSubject("Check OTP: ");
		message.setText("Your OTP is: "+otp);
		mailSender.send(message);
		return 0;
	}
	
	public String checkRegOtp(String otp) {
		// TODO Auto-generated method stub
		String sql = "select otp from tb_reg where otp='"+otp+"'";
		return jdbctemplate.queryForObject(sql, String.class);
	}
	
	public int updateStatus(String otpCheck) {
		// TODO Auto-generated method stub
		String sql = "update tb_reg set status = '"+0+"' where otp='"+otpCheck+"'";
		return jdbctemplate.update(sql);
	}
	
	public List<RegModel> checkRegistration(String email) {
		// TODO Auto-generated method stub
		String sql = "select * from tb_reg where email = '"+email+"'";
		
		List<RegModel> list = jdbctemplate.query(sql, new RowMapper<RegModel>() {

			@Override
			public RegModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				RegModel rm = new RegModel();
				rm.setId(rs.getInt(1));
				rm.setName(rs.getString(2));
				rm.setEmail(rs.getString(3));
				rm.setPassword(rs.getString(4));
				rm.setGender(rs.getString(5));
				rm.setCourse(rs.getString(6));
				rm.setCity(rs.getString(7));
				return rm;
			}
		});	
        List<RegModel> list1 = list.size()>0? list:null;
		return list1;
	}


	public List<RegModel> login(LoginModel lm) {
		// TODO Auto-generated method stub
		String sql = "select * from tb_reg where email='"+lm.getEmail()+"' and password='"+lm.getPassword()+"' and status='"+0+"'";
		List<RegModel> list = jdbctemplate.query(sql, new RowMapper<RegModel>() {

			@Override
			public RegModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				RegModel rm = new RegModel();
				rm.setEmail(rs.getString("email"));
				rm.setPassword(rs.getString("password"));
				return rm;
			}
		});
		List<RegModel> list1 = list.size()>0? list:null;
		
		return list1;
	}


	public List<RegModel> getDetails() {
		// TODO Auto-generated method stub
		String sql = "select * from tb_reg";
		return jdbctemplate.query(sql, new RowMapper<RegModel>() {

			@Override
			public RegModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				RegModel rm = new RegModel();
				rm.setId(rs.getInt(1));
				rm.setName(rs.getString(2));
				rm.setEmail(rs.getString(3));
				rm.setPassword(rs.getString(4));
				rm.setGender(rs.getString(5));
				rm.setCourse(rs.getString(6));
				rm.setCity(rs.getString(7));
			
				return rm;
				
			}
		});
	}

	public int getDeleteById(int id) {
		// TODO Auto-generated method stub
		String sql= "delete from tb_reg where id = '"+id+"'";
		return jdbctemplate.update(sql);
	}


	public RegModel getDetailsById(int id) {
		// TODO Auto-generated method stub
		String sql = "select * from tb_reg where id = '"+id+"'";
		
		return jdbctemplate.queryForObject(sql, new Object[] {}, new BeanPropertyRowMapper<RegModel>(RegModel.class));
	}


	public List<RegModel> getUserById(int id) {
		// TODO Auto-generated method stub
		String sql = "select * from tb_reg where id='"+id+"'";
		return jdbctemplate.query(sql, new RowMapper<RegModel>() {

			@Override
			public RegModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				RegModel rm = new RegModel();
				rm.setId(rs.getInt(1));
				rm.setName(rs.getString(2));
				rm.setEmail(rs.getString(3));
				rm.setPassword(rs.getString(4));
				rm.setGender(rs.getString(5));
				rm.setCourse(rs.getString(6));
				rm.setCity(rs.getString(7));
			
				return rm;
				
			}
		});
	}


	public int getUpdate(RegModel rm) {
		// TODO Auto-generated method stub
		String sql = "update tb_reg set name='"+rm.getName()+"', email='"+rm.getEmail()+"', password='"+rm.getPassword()+"',"
				+ "gender='"+rm.getGender()+"', course='"+rm.getCourse()+"', city='"+rm.getCity()+"' where id='"+rm.getId()+"'";
		return jdbctemplate.update(sql);
	}


	public void upload(UploadModel upload) {
		// TODO Auto-generated method stub
		CommonsMultipartFile file = upload.getFile();
		String fileName = file.getOriginalFilename();
		String filepath = "D:\\springproject\\SpringMvcWebProjectNew2\\src\\main\\webapp\\upload";
		try{  
	        byte barr[]=file.getBytes();  
	          
	        BufferedOutputStream bout=new BufferedOutputStream(  
	                 new FileOutputStream(filepath+"\\"+fileName));  
	        bout.write(barr);  
	        bout.flush();  
	        bout.close();  
	         
	        }catch(Exception e){
		      System.out.println(e);
		    }  
	}


	public int saveUpload(UploadModel upload) {
		// TODO Auto-generated method stub
		CommonsMultipartFile file = upload.getFile();
		String fileName = file.getOriginalFilename();

		
		String sql = "insert into tb_upload(username,password,email,phone,filename) values('"+upload.getUsername()+"',"
				+ "'"+upload.getPassword()+"', '"+upload.getEmail()+"', '"+upload.getPhone()+"' ,'"+fileName+"' )";

		return jdbctemplate.update(sql);
		
				
	}


	public void getDownload(HttpServletRequest req, HttpServletResponse res) throws IOException {
		// TODO Auto-generated method stub
		String fileName = "test.docx";
		String filePath = "C:\\Users\\ASUS\\OneDrive\\Desktop\\test.docx";
		
		PrintWriter out = res.getWriter();
		res.setContentType("APPLICATION/OCTET-STREAM");
		res.setHeader("Content-Disposition", "attachent;filename=\'"+fileName+"'");
		FileInputStream fileInputStream = new FileInputStream(filePath);
		
		int i;
		while ((i=fileInputStream.read())!=-1) {
			out.write(i);
		}
		fileInputStream.close();
		out.close();
	}


	public List<UploadModel> downloadFiles() {
		// TODO Auto-generated method stub
		String sql = "select * from tb_upload";
		
		return jdbctemplate.query(sql, new RowMapper<UploadModel>() {

			@Override
			public UploadModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				UploadModel upload = new UploadModel();
				upload.setId(rs.getInt(1));
				upload.setUsername(rs.getString(2));
				upload.setPassword(rs.getString(3));
				upload.setEmail(rs.getString(4));
				upload.setFilename(rs.getString(5));
				upload.setPhone(rs.getString(6));
				return upload;
			}
		});
	}


	public void downloadTableFile(HttpServletRequest req, HttpServletResponse res, String filename, HttpSession session)throws IOException {
		// TODO Auto-generated method stub
		String path = session.getServletContext().getRealPath("/upload");
		
		File file = new File(path);
		if(!file.exists()) {
			file.mkdir();
		}
		System.out.println(""+path);
		
		res.setContentType("APPLICATION/OCTET-STREAM");
		res.setHeader("Content-Disposition",  "attachent;filename=\'"+filename+"'");
		
		PrintWriter out = res.getWriter();
		FileInputStream fileInputStream = new FileInputStream(path+"\\"+filename);
		int i;
		while((i=fileInputStream.read())!=-1) {
			out.write(i);	
		}
		fileInputStream.close();
		out.close();
	}

	public void sendMail(MailModel mailmodel) {
		// TODO Auto-generated method stub
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("hritikgawali@gmail.com");
		message.setTo(mailmodel.getTo());
		message.setSubject(mailmodel.getSubject());
		message.setText(mailmodel.getMessage("<html><head><style>body { font-family: Arial, sans-serif; } h1 { color: blue; } p { color: red; }</style></head><body><h1>Hello</h1><p>This is a styled email.</p></body></html>", true));
		mailSender.send(message);
		
	}

	public void sendEmailAttachment(MailModelAttach mailModelAttach, CommonsMultipartFile filename) {
		// TODO Auto-generated method stub
		javaMailSender.send(new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				// TODO Auto-generated method stub
				MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				messageHelper.setTo(mailModelAttach.getTo());
				messageHelper.setSubject(mailModelAttach.getSubject());
				messageHelper.setText(mailModelAttach.getMessage());
				
				String attachName = filename.getOriginalFilename();
				if(!filename.equals("")) {
					messageHelper.addAttachment(attachName, new InputStreamSource() {
						
						@Override
						public InputStream getInputStream() throws IOException {
							// TODO Auto-generated method stub
							return filename.getInputStream();
						}
					});
				}
			}
		});
	}

	public String CheckRegEmail(String email) {
		// TODO Auto-generated method stub
		String sql = "select email from tb_reg where email = '"+email+"'";
		
		return jdbctemplate.queryForObject(sql, String.class);
		
	}

	public void sendOtpEmail(String email, String otp) {
		// TODO Auto-generated method stub
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("hritikgawali@gmail.com");
		message.setTo(email);
		message.setSubject("Check OTP: ");
		message.setText("Your OTP is: "+otp);
		mailSender.send(message);
			
	}

	public String getPassword(String email) {
		// TODO Auto-generated method stub
		String sql = "select password from tb_reg where email = '"+email+"'";
		return jdbctemplate.queryForObject(sql, String.class);
	}

	public void sendPasswordtoEmail(String password, String email) {
		// TODO Auto-generated method stub
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email);
		message.setFrom("hritikgawali@gmail.com");
		message.setSubject("Checked Password: ");
		message.setText("Your password is: "+password);
		mailSender.send(message);
	}

	public List<String> getCountry() {
		// TODO Auto-generated method stub
		String sql = "select distinct country from address";
		return jdbctemplate.queryForList(sql, String.class);
	}

	public List<String> getState(String country) {
		// TODO Auto-generated method stub
		String sql = "select distinct state from address where country='"+country+"'";
		return jdbctemplate.queryForList(sql, String.class);

	}
	
	public List<String> getCity(String state) {
		// TODO Auto-generated method stub
		String sql = "select distinct city from address where state='"+state+"'";
		return jdbctemplate.queryForList(sql, String.class);
	}

	public int saveStudent(LoginModel lm) {
		// TODO Auto-generated method stub
		String sql = "insert into student(name,email,password) Values ('"+lm.getName()+"', '"+lm.getEmail()+"', '"+lm.getPassword()+"')";
		jdbctemplate.update(sql);
		return 0;
	}


	public void getDeleteMultiple(String id) {
		// TODO Auto-generated method stub
		String sql= "delete from tb_reg where id = '"+id+"'";
		jdbctemplate.update(sql);
	}

	


	
}
