package com.web.hulklogic.controller;
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
import com.web.hulklogic.bo.RegistrationBO;
import com.web.hulklogic.bo.TaskInBankGroundAgtBO;
import com.web.hulklogic.service.EditUserDetailsService;
import com.web.hulklogic.service.TaskUpdateBackInGroundService;

@Controller
public class EditController {
	private static Logger logger = Logger.getLogger(EditController.class);
	
	@Resource
	private EditUserDetailsService editUserDetailsService; 
	@Resource
	private TaskUpdateBackInGroundService taskUpdateBackInGround;
	
	@RequestMapping(value="/updateUserInfo",method=RequestMethod.POST)
	public  @ResponseBody String  updateUserDetails(HttpServletRequest request,@RequestParam(value="registerBo",required=false) String registerStr) {
		if (null == registerStr || registerStr.trim().isEmpty()) {
			return "failure";
	}	
	 HttpSession session = request.getSession(false) ;
	 String curretnAgentEmail = (String)session.getAttribute("userName");
	 logger.info("curretnAgentEmail :"+curretnAgentEmail);
	 RegistrationBO registerBo=new Gson().fromJson(registerStr, RegistrationBO.class);
	 System.out.println(registerBo.getDistrict()+":District"); 
	 registerBo.setEmail(curretnAgentEmail);
	 int result=editUserDetailsService.updateUser(registerBo);
	 if(result>0){
		 return "success";
	 }
	return "fail";}
	
	@RequestMapping(value = "/agent/rejectTask", method = RequestMethod.POST)
    public @ResponseBody String saveAgentRejectTask( HttpServletRequest request,@RequestParam(value="rejectTask", required=false) String rejectTaskStr) {
		  
		if (null == rejectTaskStr || rejectTaskStr.trim().isEmpty()) {
			return "failure";
		}
		String resultOfRejectTask=null;
		HttpSession session = request.getSession(false) ;
		String currentAgentEmail = (String)session.getAttribute("userName");
		logger.info("curretnAgentEmail :"+currentAgentEmail);
		TaskInBankGroundAgtBO taskInBackGroundAgtBo=new Gson().fromJson(rejectTaskStr, TaskInBankGroundAgtBO.class);
		taskInBackGroundAgtBo.setAgentemail(currentAgentEmail);
		try{
			if(taskInBackGroundAgtBo.getVoiceImagePath()!=null){
			resultOfRejectTask= taskUpdateBackInGround.saveAgentRejectTask(taskInBackGroundAgtBo);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return resultOfRejectTask;
		}

}