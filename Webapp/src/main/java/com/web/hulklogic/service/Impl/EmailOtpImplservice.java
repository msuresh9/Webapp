package com.web.hulklogic.service.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.web.hulklogic.bo.EmailOtpBo;
import com.web.hulklogic.dao.Impl.EmailOtpDaoImpl;
import com.web.hulklogic.dto.EmailOtpDto;
import com.web.hulklogic.service.EmailOtpservice;
import com.web.hulklogic.utils.EmailUtility;
import com.web.hulklogic.utils.Invite;
import com.web.hulklogic.utils.MyResponseEntity;
@Service
public class EmailOtpImplservice implements EmailOtpservice {
@Resource
 private EmailOtpDaoImpl dao;

final String STATUS_SUCCESS="success";
final String STATUS_FAIL="fail";

	public String emailotp(EmailOtpDto dto) {
		EmailOtpBo bo = null;
		bo = new EmailOtpBo();
		bo.setEmail(dto.getEmail());
		bo.setOtp(dto.getOtp());
	     int count = dao.emailOtp(bo);
		if(count==1){
			return "success";}
		
		else{
			return "fail";
		}
}
	
	@Override
	public String checkOtpAndPassword(String email, String password, int otp) {
		MyResponseEntity myResponseEntity=new MyResponseEntity();
		
	   if(dao.checkOtp(email, otp)>0) {
		if(dao.UpdatePassword(email, password)>0){
			 myResponseEntity.setStatus(STATUS_SUCCESS);
			 myResponseEntity.setComment("go head");
		}else{
			 myResponseEntity.setStatus(STATUS_FAIL);
			 myResponseEntity.setComment("updated success");
			
		}
			}
		else{
			 myResponseEntity.setStatus(STATUS_FAIL);
			 myResponseEntity.setComment("otp is does not match");
		}
		
		return new Gson().toJson( myResponseEntity);
	}
	   
	
	@Override
	public String changePassword(String email, String oldPassword,String newPassword) {
		MyResponseEntity myResponseEntity=new MyResponseEntity();
		if(dao.selectPassword(email, oldPassword)>0){
			if(dao.updatePassword(email, newPassword)>0){
				myResponseEntity.setStatus(STATUS_SUCCESS);
				myResponseEntity.setComment("Password updated successfully");
				}else{
					myResponseEntity.setStatus(STATUS_FAIL);
					myResponseEntity.setComment("Password updated fail");
					}
			}
		else{
			 myResponseEntity.setStatus(STATUS_FAIL);
			 myResponseEntity.setComment("Password doesn't match");
		}
		return new Gson().toJson( myResponseEntity);
	}

	
	public boolean checkEmailOtpSend(String email) {
		if(dao.emailCheck(email)>0){
			
			return false;
			}
		else
			return true;
	}

	@Override
	public Invite selectReferralCode(String email) {
		return dao.getReferralCode(email);
	}
	
	
	@Override
	public boolean sendActivationLink(Invite invite,String agentEmail) {
		EmailUtility emailUtility = new EmailUtility();
		System.out.println(invite.getFirstname()+":Email Service");
		System.out.println(invite.getInviteAgent()+":Email Service");
		System.out.println(invite.getReferralcode()+":Email service");
		String[] details = new String[2];
		details[0]= "Hi "+invite.getFirstname()+",<br/> send inviteAgent <br/>";
		details[1] = "/agent/register"+"/?"+"referralcode:"+invite.getReferralcode()+"/?"+"agentEmail:"+agentEmail;
		emailUtility.sendMail(invite,details);
		return false;
	}
	
}
	
	
	
	