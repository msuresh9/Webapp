package com.web.hulklogic.bo;

public class IssueReportBO {
	private String issueName;
	private String issueStatus;
	private double longitude;
	private double latitude;
	private String issueMessage;
	private String assignFrom;
	private String assignTO;
	private String email;
	public String getAssignFrom() {
		return assignFrom;
	}
	public void setAssignFrom(String assignFrom) {
		this.assignFrom = assignFrom;
	}
	public String getAssignTO() {
		return assignTO;
	}
	public void setAssignTO(String assignTO) {
		this.assignTO = assignTO;
	}
	

	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public String getIssueName() {
		return issueName;
	}
	public void setIssueName(String issueName) {
		this.issueName = issueName;
	}
	public String getIssueStatus() {
		return issueStatus;
	}
	public void setIssueStatus(String issueStatus) {
		this.issueStatus = issueStatus;
	}
	public String getIssueMessage() {
		return issueMessage;
	}
	public void setIssueMessage(String issueMessage) {
		this.issueMessage = issueMessage;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}	

}
