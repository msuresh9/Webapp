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
import com.web.hulklogic.bo.TaskInBankGroundAgtBO;
import com.web.hulklogic.dao.TaskInBackGroundDAO;
import com.web.hulklogic.utils.Issues;
import com.web.hulklogic.utils.Taskname;

@Repository
public class TaskInBackGroundDAOImpl  implements TaskInBackGroundDAO{
	private static final String GET_ALL_TaskName="select taskname from agenttasks where taskname like :pname";
	@Resource
	private JdbcTemplate jt;
	@Resource
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	public int insertTaskInBackGround(final TaskInBankGroundAgtBO abo) {
      final KeyHolder keyHolder = new GeneratedKeyHolder();
		int count=0;
		try{
jt.update(new PreparedStatementCreator() {
	
	public PreparedStatement createPreparedStatement(Connection connection)
			throws SQLException {
		  java.sql.PreparedStatement ps =
                  connection.prepareStatement("insert into agenttasks (taskname,agentemailid,shopname,sellername,sellermobile,"
                  		+ "longitude,latitude,totaldoc,assignFrom,assignTO) values (?,?,?,?,?,?,?,?,?,?)", new String[] {"id"});
              ps.setString(1, abo.getTaskname());
              ps.setString(2, abo.getAgentemail());
              ps.setString(3, abo.getShopname());
              ps.setString(4, abo.getSellername());
              ps.setLong(5, abo.getSellermobile());
              ps.setDouble(6, abo.getLongitude());
              ps.setDouble(7, abo.getLatitude());
              ps.setInt(8, abo.getTotaldoc());
              ps.setString(9, abo.getAssignFrom());
              ps.setString(10, abo.getAssignTO());
              return ps;
}
},keyHolder);

System.out.println("came============-----------"+keyHolder.getKey().intValue());
String sql_insert_agentvisitupdate="insert into taskmessage"
		+ "(taskid,taskmessage,agentemailid,sellerstatus,sellerdeal) values("
		+ ":taskid,:taskmessage,:agentemailid,:sellerstatus,:sellerdeal)";

try{
	System.out.println(keyHolder.getKey().intValue());
 MapSqlParameterSource pss = new MapSqlParameterSource();
  Date date=new Date();
  pss.addValue("taskid",keyHolder.getKey().intValue()) ;
  pss.addValue("taskmessage", abo.getTaskmessage());
  pss.addValue("agentemailid",abo.getAgentemail() ) ;
  pss.addValue("sellerstatus",abo.getSellerStatus()) ;
  pss.addValue("sellerdeal", abo.getSellerdeal()) ;

  count=namedParameterJdbcTemplate.update(sql_insert_agentvisitupdate, pss);
}catch(Exception e){

	e.printStackTrace();
}
}catch(Exception e){
	e.printStackTrace();
}
return count;
	}

	@Override
	public List<Taskname> getAllTaskName(String taskname) {
		String finalName=taskname + "%";
		System.out.println(taskname);
		MapSqlParameterSource pss = new MapSqlParameterSource();
		pss.addValue("pname",finalName );
		List<Taskname>data=namedParameterJdbcTemplate.queryForObject(GET_ALL_TaskName,pss,new TaskNameRowMapper());
		System.out.println(data.size());
	  return data;
	}
	private static class  TaskNameRowMapper implements RowMapper{
	       @Override
			public List<Taskname> mapRow(ResultSet rs, int index) throws SQLException {
	    	   int rowcount = 0;
	    	   if (rs.last()) {
	    	     rowcount = rs.getRow();
	    	     rs.beforeFirst(); 
	    	   }
	    	   List<Taskname> listTaskname=new ArrayList<>();
	    	   Taskname taskname=null;
	    	   while(rs.next()){
	    		   taskname=new Taskname();
	    		   taskname.setTaskName(rs.getString("taskname"));
	    		   listTaskname.add(taskname);
	    		   }
			return listTaskname;
		}
		}
	

}
