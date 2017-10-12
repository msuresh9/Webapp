package com.web.hulklogic.service;

import java.util.Map;

import com.web.hulklogic.bo.TaskInBankGroundAgtBO;
import com.web.hulklogic.utils.Invite;
public interface TaskUpdateBackInGroundService {
	
	public String updateAndInsertTaskInBackGround(int taskid, String agentemailid,String sellerStatus, String sellerDeal,String taskmessage);
	public Map<String, Object> retrieveSellerInfo(double longitude,double latitude);
	public Invite getSellerInfo(int id);
	public boolean sendShopDetailsLink(Invite  invite);
	public String saveAgentRejectTask(TaskInBankGroundAgtBO taskInBackGroundAgentBo);
	
	
}
