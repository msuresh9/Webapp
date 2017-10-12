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

import com.web.hulklogic.bo.GetAllTaskInBackGroundBO;
import com.web.hulklogic.dao.GetALLTaskInBackGroundDAO;
@Repository
public class GetAllTaskInBackGroundDAOImpl implements GetALLTaskInBackGroundDAO{
private static final String GET_ALL_TASK_IN_BACK_GROUND=" select a.taskid,a.taskname,a.agentemailid,a.shopname,a.sellername,a.sellermobile,a.totaldoc,a.latitude,a.longitude,"
		+ "a.assignFrom,a.assignTo,t.taskmessage,t.agentemailid,t.sellerstatus,t.sellerdeal,t.created_at from agenttasks a "
		+ "inner join taskmessage t on a.taskid = t.taskid where t.created_at between ? and ?  order by t.created_at desc limit 1";
private static final String GET_ALL_TASK_IN_BACK_GROUND_EMAIL="select a.taskid,a.taskname,a.agentemailid,a.shopname,a.sellername,a.sellermobile,a.totaldoc,a.latitude,"
		+ "a.longitude,a.assignFrom,a.assignTo,t.taskmessage,t.agentemailid,t.sellerstatus,t.sellerdeal,"
		+ "t.created_at from agenttasks a inner join taskmessage t on a.taskid = t.taskid where a.agentemailid =?  order by t.created_at desc limit 1";

@Resource	
private JdbcTemplate jt;
	public List<GetAllTaskInBackGroundBO> getAllTaskInBackGround(String startDate, String endDate) {
		String startDateMin=startDate+" 00:00:00";
		String endDateHMin=endDate+" 00:00:00";
		System.out.println(startDateMin);
		List<GetAllTaskInBackGroundBO> list=jt.query(GET_ALL_TASK_IN_BACK_GROUND,new GetAllTaskInBckGroundResultExtractor(),startDateMin,endDateHMin);
		System.out.println(list.size());
		return list;
	}
	
	private static class GetAllTaskInBckGroundResultExtractor implements ResultSetExtractor<List<GetAllTaskInBackGroundBO>>{

		public List<GetAllTaskInBackGroundBO> extractData(ResultSet rs)throws SQLException, DataAccessException {
			
			List<GetAllTaskInBackGroundBO> list=null;
			GetAllTaskInBackGroundBO getTaskInBackGroundbo=null;
			list=new ArrayList<GetAllTaskInBackGroundBO>();
			while(rs.next()){
				getTaskInBackGroundbo=new GetAllTaskInBackGroundBO();
				getTaskInBackGroundbo.setAgentemailid(rs.getString("agentemailid"));
                getTaskInBackGroundbo.setLatitude(rs.getDouble("latitude"));
				getTaskInBackGroundbo.setLongitude(rs.getDouble("longitude"));
				getTaskInBackGroundbo.setSellerdeal(rs.getString("sellerdeal"));
				getTaskInBackGroundbo.setSellername(rs.getString("sellername"));
				getTaskInBackGroundbo.setSellerstatus(rs.getString("sellerstatus"));
				getTaskInBackGroundbo.setSelllermobile(rs.getLong("sellermobile"));
				getTaskInBackGroundbo.setShopname(rs.getString("shopname"));
				getTaskInBackGroundbo.setTaskid(rs.getInt("taskid"));
				getTaskInBackGroundbo.setTaskname(rs.getString("taskname"));
				getTaskInBackGroundbo.setTotaldoc(rs.getInt("totaldoc"));
				getTaskInBackGroundbo.setAssignFrom(rs.getString("assignFrom"));
				getTaskInBackGroundbo.setAssignTO(rs.getString("assignTO"));
				getTaskInBackGroundbo.setCreated_at(rs.getString("created_at"));
				getTaskInBackGroundbo.setTaskmessage(rs.getString("taskmessage"));
				list.add(getTaskInBackGroundbo);
				}
			
			return list;
		}
		
	}

	@Override
	public List<GetAllTaskInBackGroundBO> getAllTaskInBackGroundByEmail(String agentEmail) {
		List<GetAllTaskInBackGroundBO> list=jt.query(GET_ALL_TASK_IN_BACK_GROUND_EMAIL,new GetAllTaskInBckGroundResultExtractor(),agentEmail);
		System.out.println(list.size());
		return list;
	}
		
	}
