package com.web.hulklogic.dao.Impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.web.hulklogic.bo.RegistrationBO;
import com.web.hulklogic.dao.RegistrationFormDAO;
import com.web.hulklogic.dto.RegistrationDTO;

@Repository
public class RegistrationFormDaoImpl implements RegistrationFormDAO{
	
	private static final String INSERT_INTO_REGISTRATIONS="insert user (firstname,lastname,email,roleid,username,password,contactno,dob,qualification,gender,addrline1,addrline2,district,state,country,pincode,bankname,bankaccno,ifsccode,agentcode,aadharno,pancardno,votercardno,recentphotoimg,aadharimg,pancardimg,votercardimg,"
			+"qualificationimg,latitude,longitude,isActivated,isEmailCheck,imeiNo,referral_code)values(:firstname,:lastname,:email,:roleid,:username,:password,:contactno,:dob,:qualification,:gender,:addrline1,:addrline2,:district,:state,:country,:pincode,:bankname,:bankaccno,:ifsccode,:agentcode,:aadharno,:pancardno,:votercardno,:recentphotoimg,:aadharimg,:pancardimg,:votercardimg,:qualificationimg,:latitude,:longitude,:isActivated,:isEmailCheck,:imeiNo,:referral_code);";
	
	private static final String PAN_NUMAR_CHECK="select pancardno from user where pancardno= ?";
	private static final String AADHAR_NUMAR_CHECK="select aadharno from user where aadharno= ?";
	private static final String CHECK_VOTER_NUMBER="select votercardno from user where votercardno=?";
	private static final String CHECK_MOBILE_NUMBER="select contactno from user where contactno = ?";
	private static final String CHECK_EMAIL_QUERY="select username from user where username= ?";
	private static final String GetBankAccount = "select bankaccno from user where bankaccno=?";
	private static final String GetEmailSelectQuery = "select email from user where email= ?";
	private static final String GET_ROLE="select r.roleid from role r where r.rolename=?";
	@Resource
	private NamedParameterJdbcTemplate njt;
    @Resource
    private JdbcTemplate jt;

	public int RegistrationForm(RegistrationBO bo) {
		MapSqlParameterSource pss = new MapSqlParameterSource();
		
		pss.addValue("addrline1", bo.getAddrLine1());
		pss.addValue("addrline2", bo.getAddrLine2());
		pss.addValue("agentcode", bo.getAgentEmail());
		pss.addValue("bankaccno", bo.getBankAccNo());
		pss.addValue("bankname", bo.getBankName());
		pss.addValue("contactno", bo.getContactNo());
		pss.addValue("country", bo.getCountry());
		pss.addValue("district", bo.getDistrict());
		pss.addValue("dob", bo.getDOB());
		pss.addValue("country",bo.getCountry() );
		pss.addValue("username", bo.getUserName());
		pss.addValue("state",bo.getState());
		pss.addValue("qualification", bo.getQualification());
		pss.addValue("pincode", bo.getPincode());
		pss.addValue("password", bo.getPassword());
		pss.addValue("firstname", bo.getFirstName());
		pss.addValue("email",bo.getEmail());
		pss.addValue("votercardno",bo.getVoterIdNo());
		pss.addValue("aadharno", bo.getAadharCardNo());
		pss.addValue("pancardno", bo.getPannumber());
		pss.addValue("lastname", bo.getLastName());
		pss.addValue("gender", bo.getGender());
		pss.addValue("ifsccode", bo.getIFSCCODE());
		pss.addValue("aadharimg", bo.getAadharImg());
		pss.addValue("votercardimg", bo.getVoterIdImg());
		pss.addValue("qualificationimg", bo.getDegreeCertificateImg());
		pss.addValue("recentphotoimg", bo.getPersonimage());
		pss.addValue("pancardimg", bo.getPanimage());
		pss.addValue("latitude", bo.getLatitude());
		pss.addValue("longitude",bo.getLongitude());
		pss.addValue("roleid",bo.getRoleid());
		pss.addValue("imeiNo","2a345f");
		pss.addValue("isActivated","false");
		pss.addValue("isEmailCheck", "true");
		pss.addValue("referral_code", bo.getReferralCode());
	  int count=njt.update(INSERT_INTO_REGISTRATIONS, pss);
	  System.out.println(count+" :ResultRegistrationPage");
		return count;
	}

	public int pannumbercheck(String pancardno) {
		int count = 0;
		List<Map<String, Object>> data=new ArrayList<Map<String, Object>>();
		data = jt.queryForList(PAN_NUMAR_CHECK,pancardno);
		count=data.size();
		return count;
	}

	public int AddharNumberCheck(long aadharno) {
		int count = 0;
		List<Map<String, Object>> data=new ArrayList<Map<String, Object>>();
		data = jt.queryForList(AADHAR_NUMAR_CHECK,aadharno);
		count=data.size();
		return count;
	}

	public int checkVoterId(String votercardno) {
		int count = 0;
		List<Map<String, Object>> data=new ArrayList<Map<String, Object>>();
		data = jt.queryForList(CHECK_VOTER_NUMBER,votercardno);
		count=data.size();
		return count;
	}

	public int mobileNumberCheck(long contactno) {
		int count = 0;
		List<Map<String, Object>> data=new ArrayList<Map<String, Object>>();
	    data = jt.queryForList(CHECK_MOBILE_NUMBER,contactno);
		count=data.size();
		return count;
	}

	public int getUsernameCheck(String username) {
		int count;
		List<Map<String, Object>> data=new ArrayList<Map<String, Object>>();
		data = jt.queryForList(CHECK_EMAIL_QUERY,username);
		count=data.size();
		return count;
	}

	public int getAccount(String bankaccno) {
		int count = 0;
		List<Map<String, Object>> data=new ArrayList<Map<String, Object>>();
		data = jt.queryForList(GetBankAccount,bankaccno);
		count = data.size();
	   return count;
	}

	public int getEmail(String email) {
		int count = 0;
		List<Map<String, Object>> data=new ArrayList<Map<String, Object>>();
		data = jt.queryForList(GetEmailSelectQuery,email);
		count=data.size();
		return count;
		
	}

	@Deprecated
	public int RegistrationFormCustomerOperator(RegistrationBO bo) {
		MapSqlParameterSource pss = new MapSqlParameterSource();
		pss.addValue("aadharno", bo.getAadharCardNo());
		pss.addValue("addrline1", bo.getAddrLine1());
		pss.addValue("addrline2", bo.getAddrLine2());
		pss.addValue("agentcode", bo.getAgentEmail());
		pss.addValue("bankaccno", bo.getBankAccNo());
		pss.addValue("bankname", bo.getBankName());
		pss.addValue("contactno", bo.getContactNo());
		pss.addValue("country", bo.getCountry());
		pss.addValue("district", bo.getDistrict());
		pss.addValue("dob", bo.getDOB());
		pss.addValue("votercardno",bo.getVoterIdNo());
		pss.addValue("country",bo.getCountry() );
		pss.addValue("username", bo.getUserName());
		pss.addValue("state",bo.getState());
		pss.addValue("qualification", bo.getQualification());
		pss.addValue("pincode", bo.getPincode());
		pss.addValue("password", bo.getPassword());
		pss.addValue("firstname", bo.getFirstName());
		pss.addValue("email",bo.getEmail());
		pss.addValue("pancardno", bo.getPannumber());
		pss.addValue("lastname", bo.getLastName());
		pss.addValue("gender", bo.getGender());
		pss.addValue("ifsccode", bo.getIFSCCODE());
		pss.addValue("aadharimg", bo.getAadharImg());
		pss.addValue("votercardimg", bo.getVoterIdImg());
		pss.addValue("qualificationimg", bo.getDegreeCertificateImg());
		pss.addValue("recentphotoimg", bo.getPersonimage());
		pss.addValue("pancardimg", bo.getPanimage());
		pss.addValue("latitude", bo.getLatitude());
		pss.addValue("longitude",bo.getLongitude());
		pss.addValue("imeiNo","2a345f");
		pss.addValue("roleid",2);
		pss.addValue("isActivated","false");
		pss.addValue("isEmailCheck", "true");
		System.out.println("dao"+bo.getVoterIdNo());
		int	count=njt.update(INSERT_INTO_REGISTRATIONS, pss);
		return count;
	}

	public int getRole(String roleName) {
		Integer id = (Integer)jt.queryForObject(GET_ROLE, new Object[] { roleName }, Integer.class);		
		return id;
	}
}
