package com.web.hulklogic.dao.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.web.hulklogic.bo.UpdateIssueBo;
import com.web.hulklogic.bo.User;
import com.web.hulklogic.dao.UpdateIssucesDAO;

@Repository
public class UpdateIssucesDAOImpl implements UpdateIssucesDAO {

	private static final String INSERT_INTO_ISSUEMESSAGE="insert into issuemessage(issueid,updatedagentemailid,issuestatus,issuemessage)values(?,?,?,?)";
	private static final String valid_EMAIL = "select userid from user where email=? and isActivated=?";
	private static final String GET_ALL_EMAIL="select email from user where roleid!=2";
	private static final String GET_USER_INFO="select userid,email from user where email=?";
	private static final String ENABLE_USER="update user set enabled=1 where email=?";
	
	@Resource
	private JdbcTemplate jt;
	public int updateIssuce(UpdateIssueBo bo) {
		int count=jt.update(INSERT_INTO_ISSUEMESSAGE,bo.getIssueId(),bo.getIssuemessage(),bo.getIssueStatus(),bo.getUpdatedemail());
		return count;
	}
	public int isvalidEmail(String email) {
		List<Map<String, Object>> data=new ArrayList<Map<String, Object>>();
		data=jt.queryForList(valid_EMAIL,email,"Activated");
		return data.size();
	}
	public List<String> getAllEmails() {
		List<String>data=jt.queryForList(GET_ALL_EMAIL,String.class);
		return data;
	}
	@Override
	public User getUserInfo(String userName) {
		User user=jt.queryForObject(GET_USER_INFO,new UserRowMapper(),userName);
		return user;
	}
	
	private static class UserRowMapper implements  RowMapper<User>{

		@Override
		public User mapRow(ResultSet rs, int index) throws SQLException {
			User user=new User();
		    user.setUserId(rs.getInt("userid"));
		    user.setEmail(rs.getString("email"));
			return user;
		}
		
	}

	@Override
	public int enableUser(String email) {
		int count=jt.update(ENABLE_USER,email);
		return count;
	}
}
