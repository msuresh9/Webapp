package com.web.hulklogic.dto;

import java.io.Serializable;
import java.sql.Date;

public class GetAllssuceStatusDTO implements Serializable{
	private int issueId;
	private String issueName;
	private String issueStatus;
	private double longitude;
	private double latitude;
	private String issueMessage;
	private String assignTO;
	private String assignFrom;
	private String created_at;
	private String agentEmail;
	public int getIssueId() {
		return issueId;
	}
	public void setIssueId(int issueId) {
		this.issueId = issueId;
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
	public String getIssueMessage() {
		return issueMessage;
	}
	public void setIssueMessage(String issueMessage) {
		this.issueMessage = issueMessage;
	}
	public String getAssignTO() {
		return assignTO;
	}
	public void setAssignTO(String assignTO) {
		this.assignTO = assignTO;
	}
	public String getAssignFrom() {
		return assignFrom;
	}
	public void setAssignFrom(String assignFrom) {
		this.assignFrom = assignFrom;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getAgentEmail() {
		return agentEmail;
	}
	public void setAgentEmail(String agentEmail) {
		this.agentEmail = agentEmail;
	}
	
		
}
