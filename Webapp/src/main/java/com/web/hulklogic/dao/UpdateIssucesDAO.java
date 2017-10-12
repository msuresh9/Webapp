package com.web.hulklogic.dao;

import java.util.List;

import com.web.hulklogic.bo.UpdateIssueBo;
import com.web.hulklogic.bo.User;

public interface UpdateIssucesDAO {

	public int updateIssuce(UpdateIssueBo bo);
	public List<String> getAllEmails();
	public int isvalidEmail(String email);
	public User getUserInfo(String userName);
	public int enableUser(String email);
}


