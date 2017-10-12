package com.web.hulklogic.dao.Impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import com.web.hulklogic.bo.IssueReportBO;
import com.web.hulklogic.dao.IssueReportDAO;
import com.web.hulklogic.utils.Issues;
@Repository
public class IssueReportDAOImpl implements IssueReportDAO{
	private static final String GET_ALL_IssueName="select issuename from issues where issuename like :pname";
	
	@Resource
	private NamedParameterJdbcTemplate namedjt;
	@Resource
	private  JdbcTemplate jt;
	public int issueReport(final IssueReportBO issucesBO) {
		final KeyHolder keyHolder = new GeneratedKeyHolder();
		int count=0;
		try{
jt.update(new PreparedStatementCreator() {
	
	public PreparedStatement createPreparedStatement(Connection connection)
			throws SQLException {
		Date  date=new Date();
java.sql.Date sqlDate=new java.sql.Date(date.getTime());
System.out.println("issuces");
		  java.sql.PreparedStatement ps =
                  connection.prepareStatement("insert into issues (issuename,agentemail,latitude,"
                  		+ "longitude,assignFrom,assignTO) values (?,?,?,?,?,?)", new String[] {"id"});
              ps.setString(1, issucesBO.getIssueName());
              ps.setString(2, issucesBO.getEmail());
              ps.setDouble(3, issucesBO.getLatitude());
              ps.setDouble(4, issucesBO.getLongitude());
              ps.setString(5, issucesBO.getAssignFrom());
              ps.setString(6, issucesBO.getAssignTO());
              return ps;
}
},keyHolder);

System.out.println("came============-----------"+keyHolder.getKey().intValue());
String sql_insert_agentvisitupdate="insert into issuemessage"
		+ "(issueid,issuemessage,issuestatus,updatedagentemailid) values("
		+ ":issueid,:issuemessage,:issuestatus,:updatedagentemailid)";

try{
	MapSqlParameterSource pss = new MapSqlParameterSource();
  Date date=new Date();
  pss.addValue("issueid",keyHolder.getKey().intValue()) ;
  pss.addValue("issuemessage", issucesBO.getIssueMessage()) ;
  pss.addValue("issuestatus", issucesBO.getIssueStatus()) ;
  pss.addValue("updatedagentemailid", issucesBO.getEmail()) ;

  count=namedjt.update(sql_insert_agentvisitupdate, pss);
}catch(Exception e){

	e.printStackTrace();
}
}catch(Exception e){
	e.printStackTrace();
}
return count;
	}
	

	@Override
	public List<Issues> getIssuename(String issueValue) {
		String finalName=issueValue + "%";
		System.out.println(issueValue);
		MapSqlParameterSource pss = new MapSqlParameterSource();
		pss.addValue("pname",finalName );
		List<Issues>data=namedjt.queryForObject(GET_ALL_IssueName,pss,new IssueNameRowMapper());
		System.out.println(data.size());
	  return data;
	}
	
	private static class  IssueNameRowMapper implements RowMapper{
       @Override
		public List<Issues> mapRow(ResultSet rs, int index) throws SQLException {
    	   int rowcount = 0;
    	   if (rs.last()) {
    	     rowcount = rs.getRow();
    	     rs.beforeFirst(); 
    	   }
    	   System.out.println(rowcount+" :size");
    	   List<Issues> listIssue=new ArrayList<>();
    	   Issues issues=null;
    	   while(rs.next()){
    		   issues=new Issues();
    		   issues.setIssuName(rs.getString("issuename"));
    		   listIssue.add(issues);
    		   }
		return listIssue;
	}
	}
}
