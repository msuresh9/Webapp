package com.web.hulklogic.dao.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.web.hulklogic.bo.EmailOtpBo;
import com.web.hulklogic.bo.Images;
import com.web.hulklogic.dao.EmailOtpDao;
import com.web.hulklogic.utils.Invite;
@Repository
public class EmailOtpDaoImpl implements EmailOtpDao {
   private static final String INSERT_INTO_USER = "update user set otp =? where email =?";
   private static final String CHECK_EMAIL="select email from user where email=?";
   private static final String SELECT_OTP_OF_USER= "select otp from user where otp= ? and email=?";
   private static final String UPADATE_PASSWORD="update user set password=? where email=?";
   private static final String SELECT_PASSWORD="select password from user where password=? and email=?";
   private static final String SELECT_REFERRAL_CODE="select referral_code,firstname from user where email=?";
   @Resource
	private JdbcTemplate jdbcTemplate;
   public int emailOtp(EmailOtpBo bo) {
		int count = 0;
		count=jdbcTemplate.update(INSERT_INTO_USER,bo.getOtp(),bo.getEmail());
		System.out.println(count+"email otp");
		return count;
	}
public int emailCheck(String email) {
	System.out.println(email);
    List<Map<String, Object>> list=jdbcTemplate.queryForList(CHECK_EMAIL,email);
	int count=list.size();
	System.out.println(count);
	return count;
}
@Override
public int checkOtp(String email, int otp) {
	List<Map<String, Object>> data=jdbcTemplate.queryForList(SELECT_OTP_OF_USER, otp,email);
	int count=data.size();
	return count;
}
@Override
public int UpdatePassword(String email, String password) {
	int count=jdbcTemplate.update(UPADATE_PASSWORD, password,email);
	return count;
}
@Override
public int selectPassword(String email, String oldPassword) {
	List data=jdbcTemplate.queryForList(SELECT_PASSWORD, oldPassword,email);
	int count=data.size();
	System.out.println(count+":select password");
	return count;
}
@Override
public int updatePassword(String email, String newPassword) {
	int count=jdbcTemplate.update(UPADATE_PASSWORD, newPassword,email);
	return count;
}


public static String getSaltString() {
    String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    StringBuilder salt = new StringBuilder();
    Random rnd = new Random();
    while (salt.length() < 18) { // length of the random string.
        int index = (int) (rnd.nextFloat() * SALTCHARS.length());
        salt.append(SALTCHARS.charAt(index));
    }
    String saltStr = salt.toString();
    return saltStr;

}


@Override
public Invite getReferralCode(String email) {
	try {
		Invite invite = jdbcTemplate.queryForObject(SELECT_REFERRAL_CODE,new Object[] { email },new RowMapper<Invite>() {
		 public Invite mapRow(ResultSet rs, int rowNum) throws SQLException {

			 Invite invite=new Invite();
			 invite.setFirstname(rs.getString("firstname"));
			 invite.setReferralcode(rs.getString("referral_code"));
				return invite;
		 }
	                });
	      return invite;

	} catch (EmptyResultDataAccessException e) {
		Invite invite=new Invite();
		return invite;
	}
}



}
