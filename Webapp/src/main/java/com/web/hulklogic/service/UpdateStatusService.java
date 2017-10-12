package com.web.hulklogic.service;

import java.util.List;

import com.web.hulklogic.dto.UpdateIssueDto;

public interface UpdateStatusService {
	
	public String updateIssuceStatus(UpdateIssueDto dto);
	public List<String> getAllEmail();
	public boolean isvalidEmail(String email);
	public int enableUser(String email);

}
