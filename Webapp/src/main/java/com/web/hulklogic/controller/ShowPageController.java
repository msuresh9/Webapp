package com.web.hulklogic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ShowPageController {

	@RequestMapping(value = "/admin/createAgent", method = RequestMethod.GET)
	public String showCreateAgent(ModelMap model) {
		return "createAgentPage";
	}
	
	@RequestMapping(value = "/admin/createIssues", method = RequestMethod.GET)
	public String showCreateIssues(ModelMap model) {
		return "createIssuesPage";
	}

	@RequestMapping(value = "/admin/createOperator", method = RequestMethod.GET)
	public String showCreateOperator(ModelMap model) {
		return "createOperatorPage";
	}
	
	
	@RequestMapping(value = "/admin/showAgents", method = RequestMethod.GET)
	public String showAgents(ModelMap model) {
		return "agentsPage";
	}
	
	@RequestMapping(value = "/admin/showallTasksinBackground", method = RequestMethod.GET)
	public String showAllTaskInBackGround(ModelMap model) {
		return "staskInBackGroundPage";
	}

	@RequestMapping(value = "/admin/showIssues", method = RequestMethod.GET)
	public String showIssues(ModelMap model) {
		return "issuesPage";
	}
	
	@RequestMapping(value = "/admin/taskInBackGround", method = RequestMethod.GET)
	public String showTaskInBackGround(ModelMap model) {
		return "taskInBackGroundPage";
	}
	
	@RequestMapping(value = "/admin/updateAgent", method = RequestMethod.GET)
	public String showUpdateAgent(ModelMap model) {
		return "updateAgentPage";
	}
	
	 @RequestMapping(value = "/admin/getDetails", method = RequestMethod.GET)
		public String showAdmin(ModelMap model) {
			return "adminPage";
		}
	  	
      @RequestMapping(value = " /admin/getAllOpearator", method = RequestMethod.GET)
		public String showOperator(ModelMap model) {
			return "operatorpage";
		}
      
      @RequestMapping(value = "/demo", method = RequestMethod.GET)
      public String showDemoPage(ModelMap model){
    	  return "demoPage";
      }
      
      @RequestMapping(value = "/changePassword", method = RequestMethod.GET)
      public String changePassword(ModelMap model){
    	  return "changePwdPage";
    	  
      }
      
      @RequestMapping(value = "/invite", method = RequestMethod.GET)
      public String invite(ModelMap model){
    	  return "inviteagent";
    	  
      }
      
      @RequestMapping(value = "/agent/getDetails", method = RequestMethod.GET)
      public String agentIndex(ModelMap model){
    	  return "index";
     } 
      
      @RequestMapping(value = "/agent/demo", method = RequestMethod.GET)
      public String agentDemo(ModelMap model){
    	  return "Demo";
     }
      
      @RequestMapping(value = "/agent/inviteAgent", method = RequestMethod.GET)
      public String inviteAgentPage(ModelMap model){
    	  return "inviteagent";
     }
      
      @RequestMapping(value = "/agent/reportIssue", method = RequestMethod.GET)
      public String reportIssue(ModelMap model){
    	  return "Reportissue";
     }
      
      @RequestMapping(value = "/agent/visitupdate", method = RequestMethod.GET)
      public String visitupdate(ModelMap model){
    	  return "visitupdate";
     }
      
      @RequestMapping(value = "/agent/taskinBacklog", method = RequestMethod.GET)
      public String taskinBacklogPage(ModelMap model){
    	  return "TaskinBacklog";
     }
      
      
      @RequestMapping(value = "/agent/register", method = RequestMethod.GET)
      public String register(ModelMap model){
    	  return "register";
     }
      
      @RequestMapping(value = "/agent/payment", method = RequestMethod.GET)
      public String payment(ModelMap model){
    	  return "Payment";
     }
      
      @RequestMapping(value = "/agent/changePwd", method = RequestMethod.GET)
      public String changePwdAgent(ModelMap model){
    	  return "updatepassword";
     } 
      
      @RequestMapping(value = "/agent/currentAgent", method = RequestMethod.GET)
      public String showAgentDetails(ModelMap model){
    	  return "agentview";
     } 
      
}
