package com.web.hulklogic.service;

import com.web.hulklogic.dto.EmailOtpDto;
import com.web.hulklogic.utils.Invite;



public interface EmailOtpservice {
	public String emailotp(EmailOtpDto dto);
	
	public boolean checkEmailOtpSend(String email);
	
	public String checkOtpAndPassword(String email,String password,int otp);
	public String changePassword(String email,String oldPassword,String newPassword);
	public Invite selectReferralCode(String email);
	public boolean sendActivationLink(Invite  invite,String agentEmail);
	
	

}
