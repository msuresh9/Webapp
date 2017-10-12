package com.web.hulklogic.dto;

import java.io.Serializable;

public class UpdateIssueDto implements Serializable {
	
	private  String issueStatus;
	private int issueId;
	private String updatedEmail;
	private String issueMessage;
	public String getUpdatedEmail() {
		return updatedEmail;
	}
	public void setUpdatedEmail(String updatedEmail) {
		this.updatedEmail = updatedEmail;
	}
	public String getIssueStatus() {
		return issueStatus;
	}
	public void setIssueStatus(String issueStatus) {
		this.issueStatus = issueStatus;
	}
	public int getIssueId() {
		return issueId;
	}
	public void setIssueId(int issueId) {
		this.issueId = issueId;
	}
	public String getIssueMessage() {
		return issueMessage;
	}
	public void setIssueMessage(String issueMessage) {
		this.issueMessage = issueMessage;
	}
}
