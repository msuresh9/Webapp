package com.web.hulklogic.service.Impl;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.web.hulklogic.bo.RegistrationBO;
import com.web.hulklogic.dao.RegistrationFormDAO;
import com.web.hulklogic.dto.RegistrationDTO;
import com.web.hulklogic.service.RegistrationPageService;
import com.web.hulklogic.utils.EmailRegistrationUtil;


@Service
public class RegistrationPageServiceImpl implements RegistrationPageService{
	  @Resource
	  private RegistrationFormDAO dao;
	  public static final String STATUS_SUCCESS="success";
	  public static final String STATUS_FAIL="fail";
     public String registrationpage(RegistrationDTO dto) {
     RegistrationBO bo=getRegistrationUserInforamtion(dto);
	 int count=dao.RegistrationForm(bo);
	if(count>0){
		
		return "success";
	}
	else{
		
		return "fail";
		}
	}
	
	
public boolean checkEmail(String email) {
		int count=dao.getEmail(email);
		if(count>0)
			return true;
		else
			return false;
	}
	
	public boolean checkPan(String pan) {
		int count=dao.pannumbercheck(pan);
		if(count>0)
		    return true;
		else 
			return false;
		}
	
	public boolean checkAadhar(long aadhar) {
		int count=dao.AddharNumberCheck(aadhar);
		if(count>0)
		    return true;
		else 
			return false;
		}
	
	public boolean checkVoter(String voter) {
		
		
		int count=dao.checkVoterId(voter);
		if(count>0)
		    return true;
		else 
			return false;
		
	}
	
	public boolean checkMobile(long mobile) {
		
		int count=dao.mobileNumberCheck(mobile);
		if(count>0)
		    return true;
		else 
			return false;
	}
	
	public boolean checkUserName(String username) {
		int count=dao.getUsernameCheck(username);
	    if(count>0)
		    return true;
		else 
			return false;
	}
	public boolean checkUserBankAccount(String bankaccono) {
		int count=dao.getAccount(bankaccono);
		if(count>0)
		    return true;
		else 
			return false;
		
	}	
	
 private RegistrationBO getRegistrationUserInforamtion(RegistrationDTO dto){
       RegistrationBO bo=new RegistrationBO();
		bo.setAadharCardNo(dto.getAadharCardNo());
		bo.setAddrLine1(dto.getAddrLine1());
		bo.setAddrLine2(dto.getAddrLine2());
		bo.setBankAccNo(dto.getBankAccNo());
		bo.setBankName(dto.getBankName());
		bo.setContactNo(dto.getContactNo());
		bo.setCountry(dto.getCountry());
		bo.setUserName(dto.getUserName());
		bo.setState(dto.getState());
		bo.setQualification(dto.getQualification());
		bo.setPincode(dto.getPincode());
		bo.setPassword(dto.getPassword());
		bo.setFirstName(dto.getFirstName());
		bo.setEmail(dto.getEmail());
		bo.setPannumber(dto.getPannumber());
		bo.setLastName(dto.getLastName());
		bo.setGender(dto.getGender());
		bo.setIFSCCODE(dto.getIFSCCODE());
		bo.setAadharImg(dto.getAadharImg());
		bo.setVoterIdImg(dto.getVoterIdImg());
		bo.setDegreeCertificateImg(dto.getDegreeCertificateImg());
		bo.setPanimage(dto.getPanimage());
		bo.setPersonimage(dto.getPersonimage());
		bo.setDOB(dto.getDOB());
		bo.setVoterIdNo(dto.getVoterIdNo());
		bo.setLatitude(dto.getLatitude());
		bo.setLongitude(dto.getLongitude());
		bo.setDistrict(dto.getDistrict());
		bo.setAgentEmail(dto.getAgentEmai());
		bo.setReferralCode(dto.getReferralCode());
		int roleId = 0;
		if(dto.isAgent()){
			roleId= dao.getRole("ROLE_AGENT");
		}else{
			roleId= dao.getRole("ROLE_CUSTOMER");
		}
		bo.setRoleid(roleId);
		return bo;
	  }


public RegistrationDTO registrationPageForCustomer(RegistrationDTO dto) {
	RegistrationBO bo=getRegistrationUserInforamtion(dto);
	 int count=dao.RegistrationFormCustomerOperator(bo);
	if(count>0){
		dto.setStatus(STATUS_SUCCESS);
		dto.setEmail(dto.getEmail());
	}
	else{
		dto.setStatus(STATUS_FAIL);
		dto.setEmail(dto.getEmail());
	}
	 return dto;
	}


@Override
public boolean sendActivationLink(RegistrationDTO registerDto) {
	EmailRegistrationUtil emailRegistrationUtility = new EmailRegistrationUtil();
	 String[] details = new String[2];
	details[0]= "Hi "+registerDto.getFirstName()+",<br/> Here is your account activation link <br/>";
	details[1] = "/login/activate/"+registerDto.getEmail()+"/"+registerDto.getReferralCode();
	emailRegistrationUtility.sendMail(registerDto,details);
	return false;
}
}

