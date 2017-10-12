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

import com.web.hulklogic.bo.IssucesHistoryMessageBO;
import com.web.hulklogic.bo.ShowHistoryMessageBo;
import com.web.hulklogic.dao.ShowHistoryMessageDao;
@Repository
public class ShowHistoryMessageDaoImpl implements ShowHistoryMessageDao {
	
private static final String GET_History_Message="select taskmessageid,taskid,taskmessage,agentemailid,sellerstatus,sellerdeal,created_at from taskmessage where taskid=?";
private static final String GET_ISSUE_HISTORY_MESSAGE="select issuemessageid,issueid,issuemessage,updatedagentemailid,issuestatus,created_at from issuemessage where issueid=?";
	@Resource
	private JdbcTemplate jdbcTemplate;
	

	@Override
	public List<ShowHistoryMessageBo> retrieveHistoryMessage(int taskid) {
		List<ShowHistoryMessageBo> historyMessages=jdbcTemplate.query(GET_History_Message, new HistoryMessageResultExtractor(),taskid);
		System.out.println("histrory");
		return historyMessages;
	}
	private static class HistoryMessageResultExtractor implements ResultSetExtractor<List<ShowHistoryMessageBo>>{
     	

		@Override
		public List<ShowHistoryMessageBo> extractData(ResultSet rs)throws SQLException, DataAccessException {
			List<ShowHistoryMessageBo> listhistoryMessage=new ArrayList<ShowHistoryMessageBo>();
			ShowHistoryMessageBo historyMessage=new ShowHistoryMessageBo();
     		System.out.println("histrory Inner");
     		while(rs.next()){
     		 historyMessage.setAgentemailid(rs.getString("agentemailid"));
     		 historyMessage.setCreated_at(rs.getString("created_at"));
     		 historyMessage.setSellerdeal(rs.getString("sellerdeal"));
     		 historyMessage.setSellerstatus(rs.getString("sellerstatus"));
     		 historyMessage.setTaskid(rs.getInt("taskid"));
     		 historyMessage.setTaskmessage(rs.getString("taskmessage"));
     		 historyMessage.setTaskmessageid(rs.getInt("taskmessageid"));
     		listhistoryMessage.add(historyMessage);
     		}
			 return listhistoryMessage;
		}
		
	}
	@Override
	public List<IssucesHistoryMessageBO> getIssueHistoryMessage(int issueid) {
		List<IssucesHistoryMessageBO> issueHistoryMessages=jdbcTemplate.query(GET_ISSUE_HISTORY_MESSAGE, new IssueHistoryMessageResultExtractor(),issueid);
		System.out.println("histrory");
		return issueHistoryMessages;
	}
	
	private static class IssueHistoryMessageResultExtractor implements ResultSetExtractor<List<IssucesHistoryMessageBO>>{

		@Override
		public List<IssucesHistoryMessageBO> extractData(ResultSet rs)throws SQLException, DataAccessException {
			List<IssucesHistoryMessageBO> listIssueMessages=new ArrayList<IssucesHistoryMessageBO>();
			IssucesHistoryMessageBO issueHistoryMessage=new IssucesHistoryMessageBO() ;
			while(rs.next()){
				issueHistoryMessage.setCreated_at(rs.getString("created_at"));
				issueHistoryMessage.setIssueid(rs.getInt("issueid"));
				issueHistoryMessage.setIssuemessage(rs.getString("issuemessage"));
				issueHistoryMessage.setIssuemessageid(rs.getInt("issuemessageid"));
				issueHistoryMessage.setIssuestatus(rs.getString("issuestatus"));
				issueHistoryMessage.setUpdatedagentemailid(rs.getString("updatedagentemailid"));
				listIssueMessages.add(issueHistoryMessage);
			}
			return listIssueMessages;
		}
		
	}

}
