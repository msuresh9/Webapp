package com.web.hulklogic.dao;

import com.web.hulklogic.bo.RegistrationBO;
import com.web.hulklogic.bo.SellerInfo;
import com.web.hulklogic.command.AgentIssueCommand;

public interface ShowCurrentAgentDao {
	public RegistrationBO retrieveCurrentUser(String email);
	public int saveAgentReportIssue(AgentIssueCommand agentCommand);

}
