package com.web.hulklogic.dao;

import java.util.Map;

import com.web.hulklogic.bo.TaskInBankGroundAgtBO;
import com.web.hulklogic.utils.Invite;

public interface TaskInUpdateBackGroundDAO {
	public int insertTaskMessage(int taskid,String agentemailid,String sellerStatus,String sellerDeal,String taskmessage);
	public Map<String, Object> retrieveSellerInfo(double longitude,double latitude);
	public Invite getSellerInfo(int id);
	public int saveAgetRejectTasks(final TaskInBankGroundAgtBO abo);

}
