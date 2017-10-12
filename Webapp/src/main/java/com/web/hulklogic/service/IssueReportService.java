package com.web.hulklogic.service;

import java.util.List;

import com.web.hulklogic.dto.IssueReportDTO;
import com.web.hulklogic.utils.Issues;

public interface IssueReportService {

	public String issucesReportResult(IssueReportDTO dto);
	public List<Issues> getAllIssueNames(String issueValue);
	
}
