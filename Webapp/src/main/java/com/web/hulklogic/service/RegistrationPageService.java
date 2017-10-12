package com.web.hulklogic.service;

import com.web.hulklogic.dto.RegistrationDTO;

public interface RegistrationPageService {

	public String registrationpage(RegistrationDTO dto);
	public RegistrationDTO registrationPageForCustomer(RegistrationDTO dto);
	public boolean checkEmail(String email);
	public boolean checkPan(String pan);
	public boolean checkAadhar(long aadhar);
	public boolean checkVoter(String voter);
	public boolean checkMobile(long mobile);
	public boolean checkUserName(String username);
	public boolean checkUserBankAccount(String bankaccono);
	public boolean sendActivationLink(RegistrationDTO registerDto);
}
