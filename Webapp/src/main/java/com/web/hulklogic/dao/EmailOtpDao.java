package com.web.hulklogic.dao;

import com.web.hulklogic.bo.EmailOtpBo;
import com.web.hulklogic.utils.Invite;

public interface EmailOtpDao {
   public int emailOtp(EmailOtpBo bo);
   public int emailCheck(String eamil);
   public int checkOtp(String email,int otp);
   public int UpdatePassword(String email,String password);
   public int selectPassword(String email,String oldPassword);
   public int updatePassword(String email,String newPassword);
   public Invite getReferralCode(String email);
}
