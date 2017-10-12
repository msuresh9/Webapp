package com.web.hulklogic.dao.Impl;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import com.web.hulklogic.bo.RegistrationBO;
import com.web.hulklogic.dao.EditUserDetailsDAO;

@Repository
public class EditUserDetailsDAOImpl implements EditUserDetailsDAO {
private static final String UPDATE_USER_DETAILS="update user  set firstname=?,lastname=?,contactno=?,dob=?,addrline1=?,addrline2=?,state=?,aadharno=?,pancardno=?,votercardno=?,bankaccno=?,ifsccode=?,pincode=?,longitude=?,latitude=?,bankname=?,district=? where email = ?";
	//private static final String UPDATE_USER_DETAILS="update user set firstname=:firstname,lastname=:lastname,contactno=:contactno,dob=:dob,addrline1=:addrline1,addrline2=:addrline2,"
		//	+ "state=:state,aadharno=:aadharno,pancardno:pancardno,votercardno=:votercardno,bankaccno=:bankaccno,ifsccode=:ifsccode,bankname:bankname,district=:district where email=:email";

@Resource
private JdbcTemplate jdbcTemplateObject;
@Resource
private NamedParameterJdbcTemplate namedParameterJdbcTempalt;
	@Override
	public int updateUser(RegistrationBO registrationBo) {
		System.out.println(registrationBo.getDistrict()+":dao");
		
		
   return jdbcTemplateObject.update(UPDATE_USER_DETAILS,registrationBo.getFirstName(),registrationBo.getLastName(),registrationBo.getContactNo(),registrationBo.getDob(),
		registrationBo.getAddrLine1(),registrationBo.getAddrLine2(),registrationBo.getState(),registrationBo.getAadharCardNo(),registrationBo.getPannumber(),
		registrationBo.getVoterIdNo(),
		registrationBo.getBankAccNo(),registrationBo.getIFSCCODE(),registrationBo.getPincode(),registrationBo.getLongitude(),registrationBo.getLatitude(),registrationBo.getBankName(),registrationBo.getDistrict(),registrationBo.getEmail()) ;
	}
	
}
