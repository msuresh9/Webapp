package com.web.hulklogic.service;

import com.web.hulklogic.bo.RegistrationBO;
import com.web.hulklogic.command.AgentIssueCommand;

public interface ShowCurrentAgentService {
	public RegistrationBO retrieveCurrentUser(String email);
	public String saveAgentReportIssue(AgentIssueCommand agentCommand);
}
