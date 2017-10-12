package com.web.hulklogic.service.Impl;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.web.hulklogic.bo.IssueReportBO;
import com.web.hulklogic.dao.IssueReportDAO;
import com.web.hulklogic.dto.IssueReportDTO;
import com.web.hulklogic.service.IssueReportService;
import com.web.hulklogic.utils.Issues;
@Service
public class IssucesReportServiceImpl implements IssueReportService{
	@Resource	
	private IssueReportDAO  issueReportDAO;
	public String issucesReportResult(IssueReportDTO dto) {
		int count;
		IssueReportBO issueRepoertBO=new IssueReportBO();
		issueRepoertBO.setIssueMessage(dto.getIssueMessage());
		issueRepoertBO.setIssueName(dto.getIssueName());
		issueRepoertBO.setIssueStatus(dto.getIssueStatus());
		issueRepoertBO.setEmail(dto.getEmail());
		issueRepoertBO.setLatitude(dto.getLatitude());
		issueRepoertBO.setLongitude(dto.getLongitude());
		issueRepoertBO.setAssignFrom(dto.getAssignFrom());
		issueRepoertBO.setAssignTO(dto.getAssignTO());
		count=issueReportDAO.issueReport(issueRepoertBO);
		
		if(count==1) {
			 return "success";
		}else {
			return "fail"; 
		}
}
	@Override
	public List<Issues>  getAllIssueNames(String issueValue) {
		return issueReportDAO.getIssuename(issueValue);
	}
}