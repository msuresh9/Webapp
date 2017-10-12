package com.web.hulklogic.controller;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.sql.Date;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.xml.bind.DatatypeConverter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.web.hulklogic.command.RegisterCommand;
import com.web.hulklogic.dao.Impl.EmailOtpDaoImpl;
import com.web.hulklogic.dto.RegistrationDTO;
import com.web.hulklogic.service.RegistrationPageService;
import com.web.hulklogic.service.Impl.EmailOtpImplservice;
import com.web.hulklogic.utils.MyResponseEntity;

@Controller
public class RegistrationPageController {
	 @Autowired
	 private ServletContext context;
	 @Resource
	 private RegistrationPageService registrationService;
	 @Resource
    private EmailOtpDaoImpl emailDao;
		
    public static final String STATUS_SUCCESS="success";
    public static final String STATUS_FAIL="fail";

	@RequestMapping( value="/Registration",method=RequestMethod.POST)
	 public @ResponseBody String  registration(@RequestParam(value="registrationCommand", required=false) String registrationStr,
			 @RequestParam(value="isAgent", required=false) boolean isAgent){
		
		if (null == registrationStr || registrationStr.trim().isEmpty()) {
			return "failure";
		}
		
         String result=null;
         RegisterCommand register = new Gson().fromJson(registrationStr, RegisterCommand.class);
         System.out.println("controller");
         System.out.println(register.getContactNo()+"concatcno");
		  java.util.Date todayDate=new java.util.Date();
		  RegistrationDTO registerDto=new RegistrationDTO();
		  MyResponseEntity myResponseEntity = new MyResponseEntity();
		  Gson gson = new Gson();
		  File destinatio = new File(context.getRealPath("/WEB-INF/uploaded")+  File.separator );
		  
		
	if(register.getFirstName()==null){
		myResponseEntity.setStatus(STATUS_FAIL);
		myResponseEntity.setComment("first name can not be null");
		return gson.toJson(myResponseEntity);
	 }
	 if(register.getLastName()==null){
		myResponseEntity.setStatus(STATUS_FAIL);
		myResponseEntity.setComment("last name can not be null");
		return gson.toJson(myResponseEntity);
		 
	 }
	 if(register.getEmail()==null){
		myResponseEntity.setStatus(STATUS_FAIL);
		myResponseEntity.setComment("email can not be null");
		return gson.toJson(myResponseEntity);
		 
	 }
	 if(register.getUserName()==null){
		myResponseEntity.setStatus(STATUS_FAIL);
		myResponseEntity.setComment("user name can not be null");
		return gson.toJson(myResponseEntity);
		 
	 }
	 
	 if(register.getPassword()==null){
		myResponseEntity.setStatus(STATUS_FAIL);
		myResponseEntity.setComment("password can not be null");
		return gson.toJson(myResponseEntity);
		 
	 }
	 if(register.getContactNo()==0){
		myResponseEntity.setStatus(STATUS_FAIL);
		myResponseEntity.setComment("first name can not be null");
		 return gson.toJson(myResponseEntity);
		 
	 }
	 
	 if(register.getdOB()==null){
		myResponseEntity.setStatus(STATUS_FAIL);
		myResponseEntity.setComment("Databirth can not be null");
		 return gson.toJson(myResponseEntity);
		 
	 }
	 
	 if(register.getQualification()==null){
		myResponseEntity.setStatus(STATUS_FAIL);
		myResponseEntity.setComment("qualification can not be null");
		 return gson.toJson(myResponseEntity);
		 
	 }
	 
	 if(register.getGender()==null){
		myResponseEntity.setStatus(STATUS_FAIL);
		myResponseEntity.setComment("Gender can not be null");
		return gson.toJson(myResponseEntity);
		 
	 }
	 
	 if(register.getAddrLine1()==null){
		myResponseEntity.setStatus(STATUS_FAIL);
		myResponseEntity.setComment("Address can not be null");
	 return gson.toJson(myResponseEntity);
		 
	 }
	 
	 if(register.getAddrLine2()==null){
		myResponseEntity.setStatus(STATUS_FAIL);
		myResponseEntity.setComment("Address can not be null");
		return gson.toJson(myResponseEntity);
		 
	 }
	 
	 if(register.getDistrict()==null){
		myResponseEntity.setStatus(STATUS_FAIL);
		myResponseEntity.setComment("district can not be null");
		return gson.toJson(myResponseEntity);
		 
	 }
	 
	 if(register.getState()==null){
		myResponseEntity.setStatus(STATUS_FAIL);
		myResponseEntity.setComment("state can not be null");
		 return gson.toJson(myResponseEntity);
		 
	 }
	 
	 if(register.getCountry()==null){
		myResponseEntity.setStatus(STATUS_FAIL);
		myResponseEntity.setComment("country can not be null");
		return gson.toJson(myResponseEntity);
		 
	 }
	 if(register.getPincode()==0){
		myResponseEntity.setStatus(STATUS_FAIL);
		myResponseEntity.setComment("pincode can not be zero");
		return gson.toJson(myResponseEntity);
		 
	 }
	 
		String stringdate=register.getdOB();
		     try{
		    	 try{
		     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
	         java.util.Date date = sdf.parse(stringdate);
	         java.sql.Date sqlDate = new Date(date.getTime());
	         registerDto.setDOB(sqlDate);
		    	 }
		    	 catch(Exception e){
		    		 myResponseEntity.setStatus(STATUS_FAIL);
		    		 myResponseEntity.setComment("Date format Exception date Format is yyyyy-dd-mm");
		    	     return gson.toJson(myResponseEntity);
		    	 }
		    	 
		    
		    	 if(registrationService.checkEmail(register.getEmail())){
		    		 myResponseEntity.setStatus(STATUS_FAIL);
		    		 myResponseEntity.setComment("Email already registered");
		    		 return gson.toJson(myResponseEntity);
		    	 }
		    	 
		    	 if(registrationService.checkPan(register.getPannumber())){
		    		 myResponseEntity.setStatus(STATUS_FAIL);
		    		 myResponseEntity.setComment("Pan number already exists");
		    		 return gson.toJson(myResponseEntity);
		    	 }
	
		    	 
		    	if(registrationService.checkMobile(register.getContactNo())){
		    		myResponseEntity.setStatus(STATUS_FAIL);
		    		myResponseEntity.setComment("MobieNumber already exists");
		    		 return gson.toJson(myResponseEntity);
		    	}
		    	
		    	if(registrationService.checkAadhar(register.getAadharCardNo())){
		    		myResponseEntity.setStatus(STATUS_FAIL);
		    		myResponseEntity.setComment("aadharNumber already exists");
		    		 return gson.toJson(myResponseEntity);
		    	}
		    	
		    	if(registrationService.checkVoter(register.getVoterIdNo())){
		    		myResponseEntity.setStatus(STATUS_FAIL);
		    		myResponseEntity.setComment("voterNumber already exists");
		    		return gson.toJson(myResponseEntity);
		    	}
		    	
		    	if(registrationService.checkUserName(register.getUserName())){
		    		myResponseEntity.setStatus(STATUS_FAIL);
		    		myResponseEntity.setComment("username already exists");
		    		return gson.toJson(myResponseEntity);
		    	}
		    	 
		    	if(registrationService.checkUserBankAccount(register.getBankAccNo())){
		    		myResponseEntity.setStatus(STATUS_FAIL);
		    		myResponseEntity.setComment("Bamkaccno already exists");
		    		return gson.toJson(myResponseEntity);
		    		
		    	}
		    	
		    	registerDto.setAadharCardNo(register.getAadharCardNo());
		    	registerDto.setAddrLine1(register.getAddrLine1());
		    	registerDto.setAddrLine2(register.getAddrLine2());
		    	registerDto.setVoterIdNo(register.getVoterIdNo());
		    	registerDto.setUserName(register.getUserName());
		    	registerDto.setState(register.getState());
		    	registerDto.setQualification(register.getQualification());
		    	registerDto.setPincode(register.getPincode());
		    	registerDto.setBankAccNo(register.getBankAccNo());
		    	registerDto.setContactNo(register.getContactNo());
		    	registerDto.setBankName(register.getBankName());
		    	registerDto.setCountry(register.getCountry());
		    	registerDto.setPannumber(register.getPannumber());
		    	registerDto.setLastName(register.getLastName());
		    	registerDto.setIFSCCODE(register.getiFSCCODE());
		    	registerDto.setAadharCardNo(register.getAadharCardNo());
		    	registerDto.setGender(register.getGender());
		    	registerDto.setVoterIdNo(register.getVoterIdNo());
		    	registerDto.setFirstName(register.getFirstName());
		    	registerDto.setEmail(register.getEmail());
		    	registerDto.setPassword(register.getPassword());
		    	registerDto.setDistrict(register.getDistrict());
		    	registerDto.setLatitude(register.getLatitude());
		    	registerDto.setLongitude(register.getLongitude());
		        registerDto.setAgentEmai(register.getAgentEmail());
		     System.out.println("controller"+register.getVoterIdNo());
		   
		     byte[] decodedAAdhar = DatatypeConverter.parseBase64Binary(register.getAadharImg());
		     System.out.println(decodedAAdhar);
		     String aadharPhotopath=register.getFirstName()+"_aadhar_"+todayDate.getYear()+"_"+todayDate.getMonth()+"_"+todayDate.getDay()+"_"+todayDate.getHours()+"_"+todayDate.getSeconds()+".jpg";
		     File destinationFile = new File(context.getRealPath("/WEB-INF/uploaded")+  File.separator +aadharPhotopath);
		     System.out.println(destinationFile);
		     FileOutputStream fois=new FileOutputStream(destinationFile);
		     fois.write(decodedAAdhar);
		     registerDto.setAadharImg(aadharPhotopath);
		     fois.close();
 
 
		     byte[] decodedVoterImage = DatatypeConverter.parseBase64Binary(register.getVoterIdImg());
		     System.out.println(decodedVoterImage+" votar"+destinationFile.getAbsolutePath());
		     String voterpath=register.getFirstName()+"_voter_"+todayDate.getYear()+"_"+todayDate.getMonth()+"_"+todayDate.getDay()+"_"+todayDate.getHours()+"_"+todayDate.getSeconds()+".jpg";
		     File destination = new File(context.getRealPath("/WEB-INF/uploaded")+  File.separator +voterpath);
		     FileOutputStream fois1=new FileOutputStream(destination);
		     fois1.write(decodedVoterImage);
		     registerDto.setVoterIdImg(voterpath);	
		     fois1.close();


		     byte[] decodedPersonImage = DatatypeConverter.parseBase64Binary(register.getPersonimage());
		     String personpath=register.getFirstName()+"_PersonImage_"+todayDate.getYear()+"_"+todayDate.getMonth()+"_"+todayDate.getDay()+"_"+todayDate.getHours()+"_"+todayDate.getSeconds()+".jpg";
		     File destination1 = new File(context.getRealPath("/WEB-INF/uploaded")+  File.separator +personpath);
		     FileOutputStream fois2=new FileOutputStream(destination1);
		     System.out.println(personpath+" person path");
		     fois2.write(decodedPersonImage);
		     registerDto.setPersonimage(personpath);
		     fois2.close();


		     byte[] panImage = DatatypeConverter.parseBase64Binary(register.getPanimage());
		     String panpath=register.getFirstName()+"_PanImage_"+todayDate.getYear()+"_"+todayDate.getMonth()+"_"+todayDate.getDay()+"_"+todayDate.getHours()+"_"+todayDate.getSeconds()+".jpg";
		     File destination2 = new File(context.getRealPath("/WEB-INF/uploaded")+  File.separator +panpath);
		     FileOutputStream fois3=new FileOutputStream(destination2);
		     System.out.println(personpath+" person path");
		     fois3.write(panImage);
		     registerDto.setPanimage(panpath);
		     fois3.close();


		     byte[] DegreeDecode = DatatypeConverter.parseBase64Binary(register.getDegreeCertificateImg());
		     String DegreePath=register.getFirstName()+"_DegreeCertificateImage_"+todayDate.getYear()+"_"+todayDate.getMonth()+"_"+todayDate.getDay()+"_"+todayDate.getHours()+"_"+todayDate.getSeconds()+".jpg";
		     File destination3 = new File(context.getRealPath("/WEB-INF/uploaded")+  File.separator +DegreePath);
		     FileOutputStream fois4=new FileOutputStream(destination3);
		     fois4.write(DegreeDecode);
		     registerDto.setDegreeCertificateImg(DegreePath);
		     fois4.close();
		     
		     String referralCode=emailDao.getSaltString();
		     registerDto.setReferralCode(referralCode);

		     if(isAgent){
		    	 registerDto.setAgent(true);
		     }
		      result=registrationService.registrationpage(registerDto);
		      
		      if(result=="success"){
		    	  registrationService.sendActivationLink(registerDto);
		    	  return new Gson().toJson("Invitation Email successfully sent!");
		      }
       
		     }
		     catch(Exception e){
		    	 e.printStackTrace();
		
		     }
              return result;
		}
}
