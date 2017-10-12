package com.web.hulklogic.command;

public class TaskInBackUpdateCommad {
	
	private int taskid;
	private String agentemailid;
    private String sellerstatus;
	private String sellerdeal;
	private String taskmessage;
	public String getTaskmessage() {
		return taskmessage;
	}
	public void setTaskmessage(String taskmessage) {
		this.taskmessage = taskmessage;
	}
	public String getAgentemailid() {
		return agentemailid;
	}
	public void setAgentemailid(String agentemailid) {
		this.agentemailid = agentemailid;
	}
	
	public int getTaskid() {
		return taskid;
	}
	public void setTaskid(int taskid) {
		this.taskid = taskid;
	}
	
	public String getSellerstatus() {
		return sellerstatus;
	}
	public void setSellerstatus(String sellerstatus) {
		this.sellerstatus = sellerstatus;
	}
	public String getSellerdeal() {
		return sellerdeal;
	}
	public void setSellerdeal(String sellerdeal) {
		this.sellerdeal = sellerdeal;
	}

}
