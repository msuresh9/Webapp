package com.web.hulklogic.dao.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.web.hulklogic.bo.Images;
import com.web.hulklogic.bo.RegistrationBO;
import com.web.hulklogic.dao.GetAllAgentsDAO;
@Repository
public class GetAllAgentsDAOImpl implements GetAllAgentsDAO{
	private static final String GET_ALL_AGENTS_ADMIN="select * from user where roleid=1";
	private static final String GET_ALL_AGENTS_ADMIN_OPERATOR="select * from user where roleid=2";
	private static final String GET_ALL_IMGES="select recentphotoimg,aadharimg,pancardimg,votercardimg,qualificationimg from user where userid=?";
	@Resource
	private JdbcTemplate jt;
	
public List<RegistrationBO> getAllAgents() {
		List<RegistrationBO> listbo=null;
	     listbo=jt.query(GET_ALL_AGENTS_ADMIN, new GetAllAgentResultExtractor());
	   return listbo;
	}
	private static class GetAllAgentResultExtractor implements ResultSetExtractor<List<RegistrationBO>>{

		public List<RegistrationBO> extractData(ResultSet rs)throws SQLException, DataAccessException {
			List<RegistrationBO> listbo=new ArrayList<RegistrationBO>();
			RegistrationBO registerbo=null;
			while(rs.next()){
				registerbo=new RegistrationBO();
				registerbo.setUserid(rs.getInt("userid"));
				registerbo.setAadharCardNo(rs.getLong("aadharno"));
				registerbo.setAadharImg(rs.getString("aadharimg"));
				registerbo.setAddrLine1(rs.getString("addrline1"));
				registerbo.setAddrLine2(rs.getString("addrline2"));
				registerbo.setAgentEmail(rs.getString("agentcode"));
				registerbo.setBankAccNo(rs.getString("bankaccno"));
				registerbo.setBankName(rs.getString("bankname"));
				registerbo.setContactNo(rs.getLong("contactno"));
				registerbo.setCountry(rs.getString("country"));
				registerbo.setDegreeCertificateImg(rs.getString("qualificationimg"));
				registerbo.setDistrict(rs.getString("district"));
				registerbo.setDOB(rs.getDate("dob"));
				registerbo.setEmail(rs.getString("email"));
				registerbo.setFirstName(rs.getString("firstname"));
				registerbo.setGender(rs.getString("gender"));
				registerbo.setIsActiveted(rs.getString("isActivated"));
				registerbo.setIsEmailCheck(rs.getString("isEmailCheck"));
				registerbo.setLastName(rs.getString("lastname"));
				registerbo.setLatitude(rs.getDouble("latitude"));
				registerbo.setLongitude(rs.getDouble("longitude"));
				registerbo.setPanimage(rs.getString("pancardimg"));
				registerbo.setPannumber(rs.getString("pancardno"));
				registerbo.setPersonimage(rs.getString("recentphotoimg"));
				registerbo.setPincode(rs.getLong("pincode"));
				registerbo.setQualification(rs.getString("qualification"));
				registerbo.setState(rs.getString("state"));
				registerbo.setUserName(rs.getString("username"));
				registerbo.setVoterIdImg(rs.getString("votercardimg"));
				registerbo.setVoterIdNo(rs.getString("votercardno"));
				registerbo.setIFSCCODE(rs.getString("ifsccode"));
				registerbo.setDistrict(rs.getString("district"));
				registerbo.setRoleid(rs.getInt("roleid"));
				listbo.add(registerbo);
			}
			
			
			return listbo;
		}
	}
	
	
	
	@Override
	public List<RegistrationBO> getAllOperator() {
		List<RegistrationBO> listbo=null;
	     listbo=jt.query(GET_ALL_AGENTS_ADMIN_OPERATOR, new GetAllAgentResultExtractor());
	   return listbo;
	}
	
	@Override
	public Images getAllImages(int userid) {
		try {
			Images images = jt.queryForObject(GET_ALL_IMGES,new Object[] { userid },new RowMapper<Images>() {
			 public Images mapRow(ResultSet rs, int rowNum) throws SQLException {

				    Images images=new Images();
					images.setAadharimg(rs.getString("aadharimg"));
					images.setPancardimg(rs.getString("pancardimg"));
					images.setQualificationimg(rs.getString("qualificationimg"));
					images.setRecentphotoimg(rs.getString("recentphotoimg"));
					images.setVotercardimg(rs.getString("votercardimg"));
					return images;
			 }
		                });
		      return images;

		} catch (EmptyResultDataAccessException e) {
			Images images=new Images();
			return images;
		}
	}
	
	

}

