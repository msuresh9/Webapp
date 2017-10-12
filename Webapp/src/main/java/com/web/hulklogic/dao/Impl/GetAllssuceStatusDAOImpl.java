package com.web.hulklogic.dao.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.web.hulklogic.bo.GetAllssuceStausBO;
import com.web.hulklogic.dao.GetAllssuceStatusDAO;
@Repository
public class GetAllssuceStatusDAOImpl implements GetAllssuceStatusDAO  {
private static final String GET_ALL_ISSUCE_STATUS="select a.issueid,a.issuename,a.agentemail,a.latitude,a.longitude,a.assignFrom,a.assignTo,"
		+ "t.issuemessage,t.issuestatus,t.created_at "+ "from issues a inner join issuemessage t on a.issueid = t.issueid where t.created_at"+ " between ? and ? ";
private static final String GET_ALL_ISSUCE_STATUS_By_Email="select a.issueid,a.issuename,a.agentemail,a.latitude,a.longitude,a.assignFrom,a.assignTo,"
		+ "t.issuemessage,t.issuestatus,t.created_at "+ "from issues a inner join issuemessage t on a.issueid = t.issueid where  a.agentemail =?";

@Resource	
private JdbcTemplate jt;
	public List<GetAllssuceStausBO> getAllssuceStatus(String startDate,String endDate) {
		String startDateMin=startDate+" 00:00:00";
		String endDateHMin=endDate+" 00:00:00";
		List<GetAllssuceStausBO> getissucestatusBO=null;
		try{
		getissucestatusBO=jt.query(GET_ALL_ISSUCE_STATUS, new GetIssuceReportResultSetExtractor(),startDateMin,endDateHMin);
		System.out.println(getissucestatusBO.size());
		}catch(Exception e){
			e.printStackTrace();
		}
		return getissucestatusBO;
	}
	
	private static class GetIssuceReportResultSetExtractor implements ResultSetExtractor<List<GetAllssuceStausBO>>{

		public List<GetAllssuceStausBO> extractData(ResultSet rs)throws SQLException, DataAccessException {
			List<GetAllssuceStausBO> listbo=null;
			GetAllssuceStausBO getAllIssueBO=null;
			listbo=new ArrayList<GetAllssuceStausBO>();
			System.out.println("came");
			while(rs.next()){
				 getAllIssueBO=new GetAllssuceStausBO();
				 getAllIssueBO.setIssueName(rs.getString("issuename"));
				 getAllIssueBO.setIssueId(rs.getInt("issueid"));
				 getAllIssueBO.setLatitude(rs.getDouble("latitude"));
				 getAllIssueBO.setLongitude(rs.getDouble("longitude"));
				 getAllIssueBO.setIssueStatus(rs.getString("issuestatus")); 
				 getAllIssueBO.setAssignFrom(rs.getString("assignFrom"));
				 getAllIssueBO.setAssignTO(rs.getString("assignTO"));
				 getAllIssueBO.setAgentemail(rs.getString("agentemail"));
				 getAllIssueBO.setCreated_at(rs.getString("created_at"));
				 getAllIssueBO.setIssueMessage(rs.getString("issuemessage"));
			    listbo.add(getAllIssueBO);
			}
			
			return listbo;
		}
		
	}

	@Override
	public List<GetAllssuceStausBO> getAllIsuesStatusByEmail(String email) {
		List<GetAllssuceStausBO> getissucestatusBO=null;
		try{
		getissucestatusBO=jt.query(GET_ALL_ISSUCE_STATUS_By_Email, new GetIssuceReportResultSetExtractor(),email);
		System.out.println(getissucestatusBO.size());
		}catch(Exception e){
			e.printStackTrace();
		}
		return getissucestatusBO;
	}


}
