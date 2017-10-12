package com.web.hulklogic.controller;

import java.io.File;
import java.io.FileOutputStream;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.web.hulklogic.command.AgentIssueCommand;
import com.web.hulklogic.dao.Impl.EmailOtpDaoImpl;
import com.web.hulklogic.service.ShowCurrentAgentService;
import com.web.hulklogic.service.Impl.EmailOtpImplservice;
import com.web.hulklogic.utils.Invite;

@Controller
public class InviteAgentController {
	@Resource
    private EmailOtpImplservice emailotpservice;
	@Resource
	private EmailOtpDaoImpl emailDao;
	@Autowired
	private ServletContext context;
	@Autowired
	private ShowCurrentAgentService showCuurentAgentService;
	
	@RequestMapping(value = "/agent/inviteAgent", method = RequestMethod.POST)
     public @ResponseBody String inviteAgent( HttpServletRequest req,@RequestParam(value="inviteInfo", required=false) String invitestr) {
		if (null == invitestr || invitestr.trim().isEmpty()) {
			return "failure";
		}
		
		HttpSession session = req.getSession(false) ;
		String agentEmail = (String)session.getAttribute("userName");
		//System.out.println(agentEmail+" :current user");
		
		Invite invite = new Gson().fromJson(invitestr,  Invite.class);
		//System.out.println(invite.getInviteAgent()+" :end user send email");
		
		if(!emailotpservice.checkEmailOtpSend(invite.getInviteAgent()))
		{
			return new Gson().toJson("Email is already registered. Please invite another one!");
		}
		
		Invite  getinvite=emailotpservice.selectReferralCode(agentEmail);
		getinvite.setInviteAgent(invite.getInviteAgent());
		//System.out.println(getinvite.getInviteAgent()+":getInvite");
		try{
	    if(getinvite.getReferralcode()!=null){
	    	//System.out.println(getinvite.getFirstname()+":controller");
	    	//System.out.println(getinvite.getInviteAgent()+":controller");
	    	//System.out.println(getinvite.getReferralcode());
	    	emailotpservice.sendActivationLink(getinvite,agentEmail);
	    	return new Gson().toJson("Invitation Email successfully sent!");
	    }
	    }catch(Exception e){
			e.printStackTrace();
			
		}	
		return new Gson().toJson("Invitation Email failed!");
	}
	
	
	@RequestMapping(value = "/agent/reportIssue", method = RequestMethod.POST)
    public @ResponseBody String saveReportIssue( HttpServletRequest request,@RequestParam(value="reportIssueInfo", required=false) String reportIssueStr) {
		  
		if (null == reportIssueStr || reportIssueStr.trim().isEmpty()) {
			return "failure";
		}
		String resultOfReportIssue=null; 
		
		HttpSession session = request.getSession(false) ;
		String agentEmail = (String)session.getAttribute("userName");
		Integer userId = (Integer)session.getAttribute("userId");
		java.util.Date todayDate=new java.util.Date();
		AgentIssueCommand agentIssueComamnd=new Gson().fromJson(reportIssueStr, AgentIssueCommand.class);
		agentIssueComamnd.setAgentEmail(agentEmail);
		try{
			
			/*if(agentIssueComamnd.getVoiceImgPathe()!=null){
				byte[] voiceDecode = Base64.decodeBase64(agentIssueComamnd.getVoiceImgPathe());
			     String voicename="IssuceAudieo_"+userId+"_"+todayDate.getYear()+"_"+todayDate.getMonth()+"_"+todayDate.getDay()+"_"+todayDate.getHours()+"_"+todayDate.getMinutes()+"_"+todayDate.getSeconds()+".wav";
			     File destination = new File(context.getRealPath("/WEB-INF/voicerecord")+  File.separator +voicename);
			     FileOutputStream fois2=new FileOutputStream(destination);
			     System.out.println(voicename+" :voiec path");
			     fois2.write(voiceDecode);
			     fois2.close();
			     agentIssueComamnd.setVoiceImgPathe(voicename);
			}*/
			if(agentIssueComamnd.getVoiceImgPathe()!=null){
			resultOfReportIssue= showCuurentAgentService.saveAgentReportIssue(agentIssueComamnd);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
			return resultOfReportIssue;
		}
}
	
