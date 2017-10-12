package com.web.hulklogic.dao;

import java.util.List;

import com.web.hulklogic.bo.IssueReportBO;
import com.web.hulklogic.utils.Issues;

public interface IssueReportDAO {
	public int issueReport(IssueReportBO issucesBO);
	public List<Issues> getIssuename(String issueValue); 
}
