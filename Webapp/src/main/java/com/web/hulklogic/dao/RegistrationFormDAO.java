package com.web.hulklogic.dao;
import com.web.hulklogic.bo.RegistrationBO;
import com.web.hulklogic.dto.RegistrationDTO;

public interface RegistrationFormDAO {

	public int RegistrationForm(RegistrationBO bo);
	public int RegistrationFormCustomerOperator(RegistrationBO bo);
	public int pannumbercheck(String pancardno);
	public int AddharNumberCheck(long aadharno);
	public int checkVoterId(String votercardno);
	public int mobileNumberCheck(long contactno);
	public int getUsernameCheck(String username);
	public int getAccount(String bankaccno);
    public int getEmail(String email);
    public int getRole(String roleName);
	 
}
