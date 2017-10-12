package com.web.hulklogic.command;

public class UpdateCommand {
	
	private int issueId;
	private  String  issueStatus;
	private  String updatedEmail;
	private String issueMessage;
	public int getIssueId() {
		return issueId;
	}
	public void setIssueId(int issueId) {
		this.issueId = issueId;
	}
	public String getIssueStatus() {
		return issueStatus;
	}
	public void setIssueStatus(String issueStatus) {
		this.issueStatus = issueStatus;
	}
	public String getUpdatedEmail() {
		return updatedEmail;
	}
	public void setUpdatedEmail(String updatedEmail) {
		this.updatedEmail = updatedEmail;
	}
	public String getIssueMessage() {
		return issueMessage;
	}
	public void setIssueMessage(String issueMessage) {
		this.issueMessage = issueMessage;
	}

	
	
}
