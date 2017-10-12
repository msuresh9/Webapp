package com.web.hulklogic.command;

public class AgentIssueCommand {
	private String clinet;
	private String issueName;
	private String issueMessage;
	private String agentEmail;
	private String voiceType;
	private String voiceImgPathe;
	private double latitude;
	private double longitude;
	public String getClinet() {
		return clinet;
	}
	public void setClinet(String clinet) {
		this.clinet = clinet;
	}
	public String getIssueName() {
		return issueName;
	}
	public void setIssueName(String issueName) {
		this.issueName = issueName;
	}
	public String getIssueMessage() {
		return issueMessage;
	}
	public void setIssueMessage(String issueMessage) {
		this.issueMessage = issueMessage;
	}
	public String getAgentEmail() {
		return agentEmail;
	}
	public void setAgentEmail(String agentEmail) {
		this.agentEmail = agentEmail;
	}
	public String getVoiceType() {
		return voiceType;
	}
	public void setVoiceType(String voiceType) {
		this.voiceType = voiceType;
	}
	public String getVoiceImgPathe() {
		return voiceImgPathe;
	}
	public void setVoiceImgPathe(String voiceImgPathe) {
		this.voiceImgPathe = voiceImgPathe;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

}
