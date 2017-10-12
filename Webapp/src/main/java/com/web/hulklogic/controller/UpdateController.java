package com.web.hulklogic.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.web.hulklogic.command.TaskInBackUpdateCommad;
import com.web.hulklogic.command.UpdateCommand;
import com.web.hulklogic.dto.UpdateIssueDto;
import com.web.hulklogic.service.TaskUpdateBackInGroundService;
import com.web.hulklogic.service.UpdateStatusService;
import com.web.hulklogic.utils.Invite;

@Controller
public class UpdateController {
	private static Logger logger = Logger.getLogger(UpdateController.class);
	
	@Resource
	private UpdateStatusService  updateStatusIssuce;
	@Resource
    private TaskUpdateBackInGroundService taskinbackgroundupdateservice;
	
	@RequestMapping(value="/updateIssueStatus",method=RequestMethod.POST)
	 public  @ResponseBody String  updateIssueStatus(@RequestParam(value="updation", required=false) String updateStr) {
		if (null == updateStr || updateStr.trim().isEmpty()) {
			return "failure";
		}
		
	   String result="fail";
	   UpdateCommand updateCommandObj=new Gson().fromJson(updateStr, UpdateCommand.class);
	   UpdateIssueDto dto=new UpdateIssueDto();
	   dto.setIssueId(updateCommandObj.getIssueId());
	   dto.setIssueStatus(updateCommandObj.getIssueStatus());
	   dto.setIssueMessage(updateCommandObj.getIssueMessage());
	   dto.setUpdatedEmail(updateCommandObj.getUpdatedEmail());
	   System.out.println(updateCommandObj.getIssueStatus());
	   try{
		     result =updateStatusIssuce.updateIssuceStatus(dto);
		     System.out.println( result);
	   }
	   catch(Exception e){
		   e.printStackTrace();
	   }
	    return result;
	}

	@RequestMapping(value="/allEmails",method=RequestMethod.GET)
	public @ResponseBody String sendAllEmail(){
		List<String> retrieveEmail=null;
		try{
		 retrieveEmail=updateStatusIssuce.getAllEmail();
		}catch(Exception e){
			e.printStackTrace();
		}
		return new Gson().toJson( retrieveEmail);
	}

	@RequestMapping(value="/TaskInBackGroundUpdate",method=RequestMethod.POST)
	public @ResponseBody String taskinBackGroundUpdate(@RequestParam(value="updationForTaskInBackGround", required=false) String updateTaskInBackGroundStr) {
		if (null == updateTaskInBackGroundStr || updateTaskInBackGroundStr.trim().isEmpty()) {
			return "failure";
		}
		String result=null;
		TaskInBackUpdateCommad taskinbackcommand=new Gson().fromJson(updateTaskInBackGroundStr, TaskInBackUpdateCommad.class);
		System.out.println(taskinbackcommand.getSellerdeal());
		System.out.println(taskinbackcommand.getSellerstatus());
		System.out.println(taskinbackcommand.getAgentemailid());
		System.out.println(taskinbackcommand.getTaskid());
		
		try{
			result= taskinbackgroundupdateservice.updateAndInsertTaskInBackGround(taskinbackcommand.getTaskid(),taskinbackcommand.getAgentemailid(),taskinbackcommand.getSellerstatus(),taskinbackcommand.getSellerdeal(),taskinbackcommand.getTaskmessage());
			}catch(Exception e){
			e.printStackTrace();}
	    return result;
	}

	
	@RequestMapping(value="/agent/getSellerInfo",method=RequestMethod.POST)
	public  @ResponseBody String  getSelllerInformation(@RequestParam(value="longitude",required=false) double longitude,
         @RequestParam(value="latitude",required=false) double latitude) {
	 logger.info("longitude:"+longitude);
	 logger.info("latitude:"+latitude);
	 Map<String, Object> sellerInfo=taskinbackgroundupdateservice.retrieveSellerInfo(longitude, latitude);
	 return new Gson().toJson(sellerInfo); 
	}
 
	
	@RequestMapping(value="/agent/retrieveSellerInfo",method=RequestMethod.POST)
	public  @ResponseBody String  retrieveSelllerInformation(HttpServletRequest request,@RequestParam(value="id",required=false) int id) {
	 logger.info("id:"+id);
	 HttpSession session = request.getSession(false) ;
	 String agentEmail = (String)session.getAttribute("userName");
	 logger.info("currentEmail:"+agentEmail);
	 Invite sellerInfo=taskinbackgroundupdateservice.getSellerInfo(id);
	 session.setAttribute("customerName",sellerInfo.getSellerName());
	 session.setAttribute("shopName",sellerInfo.getShopname());
	 session.setAttribute("customerAddress",sellerInfo.getSellerAddress());
	 session.setAttribute("customerPh",sellerInfo.getSellerMobileNumber());
	 sellerInfo.setInviteAgent(agentEmail);
	 try{
		 if(sellerInfo.getShopname()!=null){
			 taskinbackgroundupdateservice.sendShopDetailsLink(sellerInfo);
			 return new Gson().toJson("Successfully sent to shopdetails to your email!");
	   }
	  }catch(Exception e){
		 e.printStackTrace();
	 }
	 return new Gson().toJson("fail to send shopdetails to your email!"); 
	}
	
	
	@RequestMapping(value="/agent/visitUpdate",method=RequestMethod.POST)
	public  @ResponseBody String  showSellerInfo(HttpServletRequest request) {
		 HttpSession session = request.getSession(false) ;
		 String customerName=(String)session.getAttribute("customerName");
		 String shopName=(String)session.getAttribute("shopName");
		 String customerAddres=(String)session.getAttribute("customerAddress");
		 long customerPh=(long)session.getAttribute("customerPh");
		 Invite invite=new Invite();
		 invite.setShopname(shopName);
		 invite.setSellerName(customerName);
		 invite.setSellerAddress(customerAddres);
		 invite.setSellerMobileNumber(customerPh);
		 return new Gson().toJson(invite); 
	}
	 
}
