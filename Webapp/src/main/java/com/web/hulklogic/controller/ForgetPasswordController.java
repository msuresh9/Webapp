package com.web.hulklogic.controller;

import java.security.Principal;
import java.util.Properties;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.web.hulklogic.dao.UpdateIssucesDAO;
import com.web.hulklogic.dto.EmailOtpDto;
import com.web.hulklogic.service.Impl.EmailOtpImplservice;

@Controller
public class ForgetPasswordController {
	
	private static Logger logger = Logger.getLogger(ForgetPasswordController.class);
	
    @Resource
    private EmailOtpImplservice emailotpservice;
	@Resource
	private UpdateIssucesDAO updateIssucesDao;
	
	@RequestMapping( value="/otpSendEmail",method=RequestMethod.GET)
	public @ResponseBody String otpinsert(@RequestParam("email") String email) {
         String result=null;
		EmailOtpDto dto = new EmailOtpDto();
		
		if(!emailotpservice.checkEmailOtpSend(email))
		{
			return new Gson().toJson("Email is not registered");
		}
		
		dto.setEmail(email);
	    String numbers = "0123456789";
		String values = numbers ;
		int len = 6;
		Random rndm_method = new Random();

		char[] password = new char[len];

		for (int i = 0; i < len; i++)
		{
			password[i] = values.charAt(rndm_method.nextInt(values.length()));
		}
		String text = String.valueOf(password);
		dto.setOtp(text);
		try {
		Properties prop = new Properties();
		 String host = "smtp.gmail.com";
		 final String user = "hulklogic";
		 final String pass = "hulklogic@123";
	     Properties props = System.getProperties();
	     props.put("mail.smtp.starttls.enable", "true");
	     props.put("mail.smtp.host", host);
	     props.put("mail.smtp.user", user);
	     props.put("mail.smtp.password", pass);
	     props.put("mail.smtp.port", "587");
	     props.put("mail.smtp.auth", "true");
	     String subject = "Your Forget Password Otp";
	     String body = "Your Forget Pasword Otp is:";
	     String[] from = {email};

	    Session session = Session.getDefaultInstance(props);
	    MimeMessage message = new MimeMessage(session);
	    
	        message.setFrom(new InternetAddress(user));
	        InternetAddress[] toAddress = new InternetAddress[from.length];
	        for( int i = 0; i < from.length; i++ ) {
	            toAddress[i] = new InternetAddress(from[i]);
	        }
	       
			for( int i = 0; i < toAddress.length; i++) {
	            message.addRecipient(Message.RecipientType.TO, toAddress[i]);

	    
	        message.setSubject(subject);
	        message.setText(body + " "+ text);
	        Transport transport = session.getTransport("smtp");
	        transport.connect(host, user, pass);
	        transport.sendMessage(message, message.getAllRecipients());
	        transport.close();
			}
			}catch (AddressException ae) {
	            ae.printStackTrace();
	        }
	        catch (MessagingException me) {
	        	me.getMessage();}

		catch (Exception e) {
	        e.printStackTrace();
	    }	
		
		try{
			result =emailotpservice.emailotp(dto);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	    return result;
	}
	
	@RequestMapping(value="/checkopt",method=RequestMethod.POST)
	public @ResponseBody String checkOtpAndUpdatePassword(@RequestParam(value="email",required=false) String email,
	         @RequestParam(value="password",required=false) String password,
	         @RequestParam(value="otp",required=false) int otp ) {
	 System.out.println(email);
	 System.out.println(password);
	 System.out.println(otp);
	 
		String  result=null;
		
		try{
		 result=emailotpservice.checkOtpAndPassword(email, password, otp);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		System.out.println(result);
		    return result;
		}
	
	@RequestMapping(value="/updatePassword",method=RequestMethod.POST)
	public @ResponseBody String updatePassword(HttpServletRequest req,@RequestParam(value="oldPassword",required=false) String oldPassword,
	         @RequestParam(value="newPassword",required=false) String newPassword) {
		
		logger.info("oldPassword: "+oldPassword);
		logger.info("newPassword: "+newPassword);
		
		HttpSession session = req.getSession(false) ;
		String agentEmail = (String)session.getAttribute("userName");
	    System.out.println(agentEmail+": :updat");
	   
	   String result=null;
	   try{
	   result=emailotpservice.changePassword(agentEmail, oldPassword, newPassword);
	   }catch(Exception e){
		   e.printStackTrace();
	   }
	   return result;
	}
}
