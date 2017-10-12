package com.web.hulklogic.controller;

import java.util.ArrayList;
import java.util.List;

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
import com.web.hulklogic.bo.IssucesHistoryMessageBO;
import com.web.hulklogic.bo.RegistrationBO;
import com.web.hulklogic.bo.ShowHistoryMessageBo;
import com.web.hulklogic.dto.GetAllTaskInBackGroundDTO;
import com.web.hulklogic.dto.GetAllssuceStatusDTO;
import com.web.hulklogic.dto.RegistrationDTO;
import com.web.hulklogic.service.GetALLAgentsService;
import com.web.hulklogic.service.GetAllTaskInBackGroundService;
import com.web.hulklogic.service.GetAllssuceStatusService;
import com.web.hulklogic.service.ShowCurrentAgentService;
import com.web.hulklogic.service.ShowHistoryMessageService;
@Controller
public class ShowAgentController {
	private static Logger logger = Logger.getLogger(ShowAgentController.class);
	
	@Resource
	private GetALLAgentsService getALLAgentService;
	@Resource
    private GetAllssuceStatusService allIssuceStatusService;
	@Resource
    private GetAllTaskInBackGroundService allTaskInBackGroundService;
	@Resource
	private ShowHistoryMessageService historyMessage;
	@Resource
	private ShowCurrentAgentService showCurrentAgentService;
	
	@RequestMapping(value="/admin/getAllAgents",method=RequestMethod.GET)
	public @ResponseBody  List<RegistrationDTO> sendAllAgentDetails() {
	List<RegistrationDTO> getALLAgents=new ArrayList<RegistrationDTO>();
		try{
			getALLAgents=getALLAgentService.retrieveAllAgentsForAdmin();
		}
		catch(Exception e){
		    e.printStackTrace();
		}
		return getALLAgents ;
	}	
	
	@RequestMapping(value="/agent/currentUser",method=RequestMethod.POST)
	public @ResponseBody  String showAgentDetail(HttpServletRequest request) {
		HttpSession session = request.getSession(false) ;
		String currentAgent = (String)session.getAttribute("userName");
		RegistrationBO currentAgentDetails=showCurrentAgentService.retrieveCurrentUser(currentAgent);
		return new Gson().toJson(currentAgentDetails);
	}	
	
	
	
	@RequestMapping(value="/admin/showOpearator",method=RequestMethod.GET)
	public @ResponseBody  List<RegistrationDTO> sendAllOperatorDetails() {
	List<RegistrationDTO> getALLAgents=new ArrayList<RegistrationDTO>();
		try{
			getALLAgents=getALLAgentService.retrieveAllOperatorForAdmin();
		}
		catch(Exception e){
		    e.printStackTrace();
		}
		return getALLAgents ;
	}	

	@RequestMapping(value="/admin/allIssueStatusByEmail",method=RequestMethod.POST)
	 public @ResponseBody String allIssueStatus(@RequestParam(value="agentEmail",required=false) String agentEmail) {
		
		     logger.info("agentEmail:"+agentEmail);
			List<GetAllssuceStatusDTO> allIssueStatus=allIssuceStatusService.retriveALLIssuceStatusByEmail(agentEmail);
	        return new Gson().toJson(allIssueStatus);
	 }
	
	@RequestMapping(value="/admin/GetAllTaskInBackGroundByEmail",method=RequestMethod.POST)
	public  @ResponseBody String  getAllTaskInBackInGroundByEmail(@RequestParam(value="agentEmail",required=false) String agentEmail) {
		
		 logger.info("agentEmail:"+agentEmail);
		List<GetAllTaskInBackGroundDTO> getAllTaskInBackGround=allTaskInBackGroundService.retrieveTaskInBackGroundByEmail(agentEmail);
	return new Gson().toJson(getAllTaskInBackGround); 
	}
 
	@RequestMapping(value="/showHistoryMessage",method=RequestMethod.POST)
	public  @ResponseBody String  showHistoryMessage(@RequestParam(value="taskId",required=false) int taskId) {
		
		 logger.info("taskId:"+taskId);
		 
		 List<ShowHistoryMessageBo> getHistoryMessage=historyMessage.retrieveHistoryMessage(taskId);
	return new Gson().toJson(getHistoryMessage); 
	}
	
	
	@RequestMapping(value="/getIssueHistoryMessage",method=RequestMethod.POST)
	public  @ResponseBody String  showIssueHistoryMessage(@RequestParam(value="issueid",required=false) int issueid) {
		
		logger.info("issueid:"+issueid);
		
		List<IssucesHistoryMessageBO> getIssueHistoryMessage=historyMessage.getIssueHistoryMessage(issueid);
	return new Gson().toJson(getIssueHistoryMessage); 
	}
}
