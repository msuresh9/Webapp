package com.web.hulklogic.utils;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.springframework.core.io.support.PropertiesLoaderUtils;

import com.web.hulklogic.dto.RegistrationDTO;

public class EmailRegistrationUtil {

private static Logger logger = Logger.getLogger(EmailRegistrationUtil.class);
	
	private static Properties prop = null;
	private static String from=null;
	private static String username=null;
	private static String password=null;
	private static String host=null;
	private static String subject=null;
	private static String serverUrl =null;
	
	static{
		if(null==prop){
			try {
				prop = PropertiesLoaderUtils.loadAllProperties("mail.properties");
				from = prop.getProperty("fromMail");
				username = prop.getProperty("username");
				password = prop.getProperty("password");
				host = prop.getProperty("host");
				subject = prop.getProperty("subject");
				serverUrl = prop.getProperty("serverUrl");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	public  EmailRegistrationUtil(){
		try{
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public boolean sendMail(RegistrationDTO registerDto,String[] details){
		try{
			logger.info("from:"+from);
			logger.info("mailId:"+registerDto.getEmail());
			
			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", "587");

		      // Get the Session object.
		      Session session = Session.getInstance(props,
		      new javax.mail.Authenticator() {
		         protected PasswordAuthentication getPasswordAuthentication() {
		            return new PasswordAuthentication(username, password);
		         }
		      });
		      
		      try {
			         // Create a default MimeMessage object.
			         Message message = new MimeMessage(session);

			         // Set From: header field of the header.
			         message.setFrom(new InternetAddress(from));

			         // Set To: header field of the header.
			         message.setRecipients(Message.RecipientType.TO,
			         InternetAddress.parse(registerDto.getEmail()));

			         // Set Subject: header field
			         message.setSubject(subject);
			         
			         // Now set the actual message
			         message.setText(details[0]+"<a href='"+serverUrl+details[1]+"'>click here</a>");
			         
			         // Send message
			         Transport.send(message);
			         logger.info("Sent mail successfully....");
			      } catch (MessagingException e) {
			            throw new RuntimeException(e);
			      }
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	
	/*public static void main(String[] args){
		
		EmailUtility emailUtility = new EmailUtility();
		emailUtility.sendMail("asd@mailinator.com");
		
	}*/
	
	
}
