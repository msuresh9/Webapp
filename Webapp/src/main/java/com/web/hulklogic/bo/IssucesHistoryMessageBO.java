package com.web.hulklogic.bo;

public class IssucesHistoryMessageBO {

	private int issuemessageid;
	private int issueid;
	private String issuemessage;
	private String updatedagentemailid;
	private String issuestatus;
	private String created_at;
	public int getIssuemessageid() {
		return issuemessageid;
	}
	public void setIssuemessageid(int issuemessageid) {
		this.issuemessageid = issuemessageid;
	}
	public int getIssueid() {
		return issueid;
	}
	public void setIssueid(int issueid) {
		this.issueid = issueid;
	}
	public String getIssuemessage() {
		return issuemessage;
	}
	public void setIssuemessage(String issuemessage) {
		this.issuemessage = issuemessage;
	}
	public String getUpdatedagentemailid() {
		return updatedagentemailid;
	}
	public void setUpdatedagentemailid(String updatedagentemailid) {
		this.updatedagentemailid = updatedagentemailid;
	}
	public String getIssuestatus() {
		return issuestatus;
	}
	public void setIssuestatus(String issuestatus) {
		this.issuestatus = issuestatus;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	
}
