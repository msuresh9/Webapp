package com.web.hulklogic.controller;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.web.hulklogic.command.IssueReportCommand;
import com.web.hulklogic.command.TaskInBackGroundCommand;
import com.web.hulklogic.dto.GetAllTaskInBackGroundDTO;
import com.web.hulklogic.dto.GetAllssuceStatusDTO;
import com.web.hulklogic.dto.IssueReportDTO;
import com.web.hulklogic.dto.TaskInBankGroundAgtDTO;
import com.web.hulklogic.service.GetAllTaskInBackGroundService;
import com.web.hulklogic.service.GetAllssuceStatusService;
import com.web.hulklogic.service.IssueReportService;
import com.web.hulklogic.service.TaskInBackGroundService;
import com.web.hulklogic.utils.Issues;
import com.web.hulklogic.utils.Taskname;

@Controller
public class MyController {
	private static Logger logger = Logger.getLogger(MyController.class);
	@Resource
    private GetAllssuceStatusService allIssuceStatusService;
	@Resource
    private GetAllTaskInBackGroundService allTaskInBackGroundService;
	@Resource
    private IssueReportService issueReportService;
	@Resource
    private TaskInBackGroundService taskservice;
	
 @RequestMapping(value="/admin/allIssueStatus",method=RequestMethod.POST)
 public @ResponseBody String allIssueStatus(@RequestParam(value="startDate",required=false) String startDate,
				@RequestParam(value="endDate",required=false) String endDate,Model map) {
	 
	 logger.info("startDate:"+startDate);
	 logger.info("categoryId:"+startDate);
	 
List<GetAllssuceStatusDTO> allIssueStatus=allIssuceStatusService.retriveALLIssuceStatus(startDate,endDate);
 return new Gson().toJson(allIssueStatus);
 }
 
 @RequestMapping(value="/admin/GetAllTaskInBackGround",method=RequestMethod.POST)
	public  @ResponseBody String  getAllTaskInBackInGround(@RequestParam(value="startDate",required=false) String startDate,
         @RequestParam(value="endDate",required=false) String endDate) {
	 
	 logger.info("startDate:"+startDate);
	 logger.info("categoryId:"+startDate);
	 
	List<GetAllTaskInBackGroundDTO> getAllTaskInBackGround=allTaskInBackGroundService.retrieveTaskInBackGround(startDate,endDate);
	return new Gson().toJson(getAllTaskInBackGround); 
	}
 
 
 @RequestMapping(value="/allIssuename",method=RequestMethod.POST)
  public @ResponseBody String sendAllIssueNames(@RequestParam(value="issueValue", required=false) String issueValue){
	 
	 logger.info("issueValue:"+issueValue);
	 
	 List<Issues> retrieveIssueName=issueReportService.getAllIssueNames(issueValue);
		List issueName = new ArrayList();
		for (Issues issuname : retrieveIssueName) {
		     if (issuname.getIssuName().contains(issueValue)) {
		    	 issueName.add(issuname);
		      }
		    }
		return new Gson().toJson( issueName);
	}
 
 
 @RequestMapping(value="/allTaskName",method=RequestMethod.POST)
 public @ResponseBody String sendAllTaskNames(@RequestParam(value="taskname", required=false) String taskname){
	 
	 logger.info("taskname:"+taskname);
	 
	 List<Taskname> retrieveTaskName=taskservice.getAllTaskName(taskname);
	 List addAlltaskName = new ArrayList();
	 for(Taskname taskName:retrieveTaskName ){
		 if(taskName.getTaskName().contains(taskname)){
			 addAlltaskName.add(taskName);
		 }
	 }
	 return new Gson().toJson( addAlltaskName);
	}
 
 
 @RequestMapping(value="/admin/issueReportCheck",method=RequestMethod.POST)
	public @ResponseBody String storeIssueReportcheck(@RequestParam(value="issueReportCommand", required=false) String issueReportCommandStr ) {
	 String result="fail";
	 IssueReportDTO issueReportDTO=new IssueReportDTO();
	 IssueReportCommand issueReportCommandObj = new Gson().fromJson(issueReportCommandStr, IssueReportCommand.class);
	 issueReportDTO.setIssueName(issueReportCommandObj .getIssueName());
	 issueReportDTO.setIssueMessage(issueReportCommandObj.getIssueMessage());
     issueReportDTO.setIssueStatus(issueReportCommandObj.getIssueStatus());
     issueReportDTO.setLongitude(issueReportCommandObj.getLongitude());
	 issueReportDTO.setLatitude(issueReportCommandObj.getLatitude());
	 issueReportDTO.setEmail(issueReportCommandObj.getEmail());
     issueReportDTO.setAssignFrom(issueReportCommandObj.getAssignFrom());
	 issueReportDTO.setAssignTO(issueReportCommandObj.getAssignTo());
	 System.out.println(issueReportCommandObj.getIssueName());
	try{
	 result=issueReportService.issucesReportResult(issueReportDTO);
  }
	catch(Exception e){
			e.printStackTrace();
			}
		return result;
	}
 
 @RequestMapping(value="/admin/createtaskInBackGround",method=RequestMethod.POST)
	public @ResponseBody String taskInBackGround(@RequestParam(value="taskInBackGround", required=false) String taskInBackGroundStr) {
		String result="fail";
		TaskInBackGroundCommand taskInBackGroundCommandObj = new Gson().fromJson(taskInBackGroundStr, TaskInBackGroundCommand.class);
		TaskInBankGroundAgtDTO adto=new TaskInBankGroundAgtDTO();
		adto.setAgentemail(taskInBackGroundCommandObj.getAgentemail());
		adto.setLatitude(taskInBackGroundCommandObj.getLatitude());
		adto.setLongitude(taskInBackGroundCommandObj.getLongitude());
		adto.setSellerdeal(taskInBackGroundCommandObj.getSellerdeal());
		adto.setSellermobile(taskInBackGroundCommandObj.getSellermobile());
		adto.setSellername(taskInBackGroundCommandObj.getSellername());
		adto.setSellerStatus(taskInBackGroundCommandObj.getSellerStatus());
		adto.setShopname(taskInBackGroundCommandObj.getShopname());
		adto.setTaskname(taskInBackGroundCommandObj.getTaskname());
		adto.setTotaldoc(taskInBackGroundCommandObj.getTotaldoc());
		adto.setAssignFrom(taskInBackGroundCommandObj.getAssignFrom());
		adto.setAssignTO(taskInBackGroundCommandObj.getAssignTO());
		adto.setTaskmessage(taskInBackGroundCommandObj.getTaskmessage());
		System.out.println("controller :"+taskInBackGroundCommandObj.getAssignTO());
		System.out.println("controller :"+taskInBackGroundCommandObj.getAssignFrom());
		try{
		
		result=taskservice.storeTaskInBackGround(adto);
		}
	catch(Exception e){
	e.printStackTrace();
	}
	return result;
	}
}
