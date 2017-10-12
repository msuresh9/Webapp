package com.web.hulklogic.service.Impl;

import javax.annotation.Resource;
import javax.annotation.Resources;

import org.springframework.stereotype.Service;

import com.web.hulklogic.bo.RegistrationBO;
import com.web.hulklogic.command.AgentIssueCommand;
import com.web.hulklogic.dao.ShowCurrentAgentDao;
import com.web.hulklogic.service.ShowCurrentAgentService;

@Service
public class ShowCurrentAgentServiceImpl implements ShowCurrentAgentService{
	@Resource
	private ShowCurrentAgentDao currentAgentDao;

	@Override
	public RegistrationBO retrieveCurrentUser(String email) {
		return currentAgentDao.retrieveCurrentUser(email);
	}

	@Override
	public String saveAgentReportIssue(AgentIssueCommand agentCommand) {
		int count= currentAgentDao.saveAgentReportIssue(agentCommand);
		if(count>0){
			return "success";
		}else{
			return "fail";
		}
	}

}
