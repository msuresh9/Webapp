package com.web.hulklogic.service.Impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.web.hulklogic.bo.SellerInfo;
import com.web.hulklogic.bo.TaskInBankGroundAgtBO;
import com.web.hulklogic.dao.TaskInUpdateBackGroundDAO;
import com.web.hulklogic.service.TaskUpdateBackInGroundService;
import com.web.hulklogic.utils.EmailUtility;
import com.web.hulklogic.utils.Invite;

@Service
public class TaskUpdateBackInGroundServiceImpl implements TaskUpdateBackInGroundService {
	@Resource	
	private TaskInUpdateBackGroundDAO taskupdateinsertdao;

	public String updateAndInsertTaskInBackGround(int taskid,String agentemailid, String sellerStatus, String sellerDeal,String taskmessage) {
	int   count=taskupdateinsertdao.insertTaskMessage(taskid, agentemailid, sellerStatus, sellerDeal,taskmessage);
		if(count>0){
		return"success";
	}
	else{
		return "fail";
	}
	}

	@Override
	public Map<String, Object> retrieveSellerInfo(double longitude, double latitude) {
		return taskupdateinsertdao.retrieveSellerInfo(longitude, latitude);
	}

	@Override
	public Invite getSellerInfo(int id) {
		 return taskupdateinsertdao.getSellerInfo(id);
	}

	@Override
	public boolean sendShopDetailsLink(Invite invite) {
		EmailUtility emailUtility = new EmailUtility();
		System.out.println(invite.getFirstname()+":Email Service");
		System.out.println(invite.getInviteAgent()+":Email Service");
		System.out.println(invite.getReferralcode()+":Email service");
		String[] details = new String[2];
		details[0]= "Hi ,"+"<br/> you received shop details <br/>" ;
		details[1] ="/agent/accept"+"/?"+"customerAdress:"+invite.getSellerAddress()+"/?"+"customerName:"+invite.getSellerName()+"/?"+"shopName:"+invite.getShopname()+"/?"+"customerPh:"+invite.getSellerMobileNumber();
		emailUtility.sendMail(invite,details);
		return false;
	}

	@Override
	public String saveAgentRejectTask(TaskInBankGroundAgtBO taskInBackGroundAgentBo) {
		int result=taskupdateinsertdao.saveAgetRejectTasks(taskInBackGroundAgentBo);
		if(result>0){
			return "success";
		}
		return "fail";
	}
	}
