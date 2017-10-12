package com.web.hulklogic.dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.web.hulklogic.bo.RegistrationBO;
import com.web.hulklogic.bo.SellerInfo;
import com.web.hulklogic.command.AgentIssueCommand;
import com.web.hulklogic.dao.ShowCurrentAgentDao;

@Repository
public class ShowCurrentAgentDaoImpl implements ShowCurrentAgentDao {
	private static final String GET_Current_Agent_Data="select * from user where email=?";
	private static final String INSERT_INTO_AGENT_REPORT_ISSUE="insert  issues(issuename,voiceimgpath,voiceimgtype,agentemail,latitude,longitude,issuemessage)"
			+ "values(:issuename,:voiceimgpath,:voiceimgtype,:agentemail,:latitude,:longitude,:issuemessage)";
	
	@Resource
	private JdbcTemplate jdbcTemplate;
	@Resource
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	@Override
	public RegistrationBO retrieveCurrentUser(String email) {
		try {
			RegistrationBO registerbo = jdbcTemplate.queryForObject(GET_Current_Agent_Data,
		                 new Object[] { email },new RowMapper<RegistrationBO>() {
			 public RegistrationBO mapRow(ResultSet rs, int rowNum) throws SQLException {

				 RegistrationBO registerbo = new RegistrationBO();
				 registerbo=new RegistrationBO();
					registerbo.setUserid(rs.getInt("userid"));
					registerbo.setAadharCardNo(rs.getLong("aadharno"));
					registerbo.setAddrLine1(rs.getString("addrline1"));
					registerbo.setAddrLine2(rs.getString("addrline2"));
					registerbo.setAgentEmail(rs.getString("agentcode"));
					registerbo.setBankAccNo(rs.getString("bankaccno"));
					registerbo.setBankName(rs.getString("bankname"));
					registerbo.setContactNo(rs.getLong("contactno"));
					registerbo.setCountry(rs.getString("country"));
					registerbo.setDistrict(rs.getString("district"));
					registerbo.setDOB(rs.getDate("dob"));
					registerbo.setEmail(rs.getString("email"));
					registerbo.setFirstName(rs.getString("firstname"));
					registerbo.setGender(rs.getString("gender"));
					registerbo.setLastName(rs.getString("lastname"));
					registerbo.setLatitude(rs.getDouble("latitude"));
					registerbo.setLongitude(rs.getDouble("longitude"));
					registerbo.setPannumber(rs.getString("pancardno"));
					registerbo.setPincode(rs.getLong("pincode"));
					registerbo.setQualification(rs.getString("qualification"));
					registerbo.setState(rs.getString("state"));
					registerbo.setUserName(rs.getString("username"));
					registerbo.setVoterIdNo(rs.getString("votercardno"));
					registerbo.setIFSCCODE(rs.getString("ifsccode"));
					registerbo.setDistrict(rs.getString("district"));
                  return registerbo;
			 }
		                });
		      return registerbo;

		} catch (EmptyResultDataAccessException e) {
			RegistrationBO registerbo = new RegistrationBO();
			return registerbo;
		}
}

	@Override
	public int saveAgentReportIssue(final AgentIssueCommand agentCommand) {
		final KeyHolder keyHolder = new GeneratedKeyHolder();
		int count=0;
		try{
			jdbcTemplate.update(new PreparedStatementCreator() {
	
	public PreparedStatement createPreparedStatement(Connection connection)
			throws SQLException {
		Date  date=new Date();
java.sql.Date sqlDate=new java.sql.Date(date.getTime());
System.out.println("issuces");
		  java.sql.PreparedStatement ps =
                  connection.prepareStatement("insert into issues (issuename,agentemail,latitude,"
                  		+ "longitude,voiceimgpath,voiceimgtype,client) values (?,?,?,?,?,?,?)", new String[] {"id"});
              ps.setString(1, agentCommand.getIssueName());
              ps.setString(2, agentCommand.getAgentEmail());
              ps.setDouble(3, agentCommand.getLatitude());
              ps.setDouble(4, agentCommand.getLongitude());
              ps.setString(5, agentCommand.getVoiceImgPathe());
              ps.setString(6, agentCommand.getVoiceType());
              ps.setString(7,agentCommand.getClinet() );
              return ps;
}
},keyHolder);

System.out.println("came============-----------"+keyHolder.getKey().intValue());
String sql_insert_agentIssueMessage="insert into issuemessage"
		+ "(issueid,issuemessage,updatedagentemailid) values("
		+ ":issueid,:issuemessage,:updatedagentemailid)";

try{
	System.out.println(keyHolder.getKey().intValue());
	MapSqlParameterSource pss = new MapSqlParameterSource();
  Date date=new Date();
  pss.addValue("issueid",keyHolder.getKey().intValue()) ;
  pss.addValue("issuemessage", agentCommand.getIssueMessage()) ;
  pss.addValue("updatedagentemailid", agentCommand.getAgentEmail()) ;

  count=namedParameterJdbcTemplate.update(sql_insert_agentIssueMessage, pss);
  System.out.println(count+"issuemessages");
}catch(Exception e){
e.printStackTrace();
}
}catch(Exception e){
	e.printStackTrace();
}
return count;
}

}