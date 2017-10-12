package com.web.hulklogic.dao.Impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.web.hulklogic.bo.TaskInBankGroundAgtBO;
import com.web.hulklogic.dao.TaskInUpdateBackGroundDAO;
import com.web.hulklogic.utils.Invite;

@Repository
public class TaskInUpdateBackGroundDAOImpl implements TaskInUpdateBackGroundDAO {
private static final String INSERT_Edit_TaskMessage="insert into taskmessage(taskid,agentemailid,sellerstatus,sellerdeal,taskmessage)values(?,?,?,?,?)";
	private static final String SELECT_SELLER_INFO="select shopname,customername,customermobile,address from sellerdetails where id=?";
	@Resource
	private JdbcTemplate jdbcTemplate;
	@Resource 
	private SimpleJdbcCall simpleJdbcCall;
	@Resource
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	public int  insertTaskMessage(int taskid, String agentemailid,
			String sellerStatus, String sellerDeal,String taskmessage) {
		Date date=new Date();
		int count=jdbcTemplate.update( INSERT_Edit_TaskMessage,taskid,agentemailid,sellerStatus,sellerDeal, taskmessage);
		return count;
	}

	@Override
	public Map<String, Object> retrieveSellerInfo(double longitude, double latitude) {
		System.out.println("hello");
		simpleJdbcCall.withProcedureName("closest_users");
		 SqlParameterSource in = new MapSqlParameterSource().addValue("lat", latitude).addValue("lon", longitude).addValue("max_distance", "10");
	      Map<String, Object> out = simpleJdbcCall.execute(in);
	     System.out.println(out.size()); 
	     System.out.println(out);
	     /* SellerInfo sellerInfo = new SellerInfo();
	      sellerInfo.setLatitude((Double)out.get("LATITUDE"));
	      sellerInfo.setLongitude((Double)out.get("LONGITUDE"));
	      sellerInfo.setSellerName((String) out.get("SHOP_NAME"));
	      sellerInfo.setSellerAddress((String) out.get("ADDRESS"));
	      System.out.println( sellerInfo.getSellerAddress());
	      System.out.println(sellerInfo.getSellerName());
	      return sellerInfo;*/
	     return out;
	}

	@Override
	public Invite getSellerInfo(int id) {
		try {
			Invite invite = jdbcTemplate.queryForObject(SELECT_SELLER_INFO,new Object[] { id },new RowMapper<Invite>() {
			 public Invite mapRow(ResultSet rs, int rowNum) throws SQLException {

				 Invite invite=new Invite();
				 invite.setShopname(rs.getString("shopname"));
				 invite.setSellerName(rs.getString("customername"));
				 invite.setSellerAddress(rs.getString("address"));
				 invite.setSellerMobileNumber(rs.getLong("customermobile"));
					return invite;
			 }
		                });
		      return invite;

		} catch (EmptyResultDataAccessException e) {
			Invite invite=new Invite();
			return invite;
		}
	}

	@Override
	public int saveAgetRejectTasks(final TaskInBankGroundAgtBO abo) {
		final KeyHolder keyHolder = new GeneratedKeyHolder();
		int count=0;
		try{
			jdbcTemplate.update(new PreparedStatementCreator() {
	
	public PreparedStatement createPreparedStatement(Connection connection)
			throws SQLException {
		  java.sql.PreparedStatement ps =
                  connection.prepareStatement("insert into agenttasks (agentemailid,shopname,voiceimgpath,voiceimgtype) values (?,?,?,?)", new String[] {"id"});
              
              ps.setString(1, abo.getAgentemail());
              ps.setString(2, abo.getShopname());
              ps.setString(3, abo.getVoiceImagePath());
              ps.setString(4, abo.getVoiceType());
             
              return ps;
}
},keyHolder);

System.out.println("came============-----------"+keyHolder.getKey().intValue());
String sql_insert_agentvisitupdate="insert into taskmessage"
		+ "(taskid,taskmessage,agentemailid) values("
		+ ":taskid,:taskmessage,:agentemailid)";

try{
	System.out.println(keyHolder.getKey().intValue());
 MapSqlParameterSource pss = new MapSqlParameterSource();
  Date date=new Date();
  pss.addValue("taskid",keyHolder.getKey().intValue()) ;
  pss.addValue("taskmessage", abo.getTaskmessage());
  pss.addValue("agentemailid",abo.getAgentemail() ) ;


  count=namedParameterJdbcTemplate.update(sql_insert_agentvisitupdate, pss);
}catch(Exception e){

	e.printStackTrace();
}
}catch(Exception e){
	e.printStackTrace();
}
return count;
	}

	}

		

