package com.web.hulklogic.dto;

public class GetAllTaskInBackGroundDTO {
	private int taskid;
	private  String taskname;
	private  String agentemailid;
	private String  shopname;
	private String sellername;
	private long selllermobile;
	private int totaldoc;
	private String sellerdeal;
	private String sellerstatus;
    private  double latitude;
	private double longitude;
    private String assignTO;
	private String assignFrom;
	private String created_at;
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getTaskmessage() {
		return taskmessage;
	}
	public void setTaskmessage(String taskmessage) {
		this.taskmessage = taskmessage;
	}
	private String taskmessage;
	
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
	public int getTaskid() {
		return taskid;
	}
	public void setTaskid(int taskid) {
		this.taskid = taskid;
	}
	public String getTaskname() {
		return taskname;
	}
	public void setTaskname(String taskname) {
		this.taskname = taskname;
	}
	public String getAgentemailid() {
		return agentemailid;
	}
	public void setAgentemailid(String agentemailid) {
		this.agentemailid = agentemailid;
	}
	public String getShopname() {
		return shopname;
	}
	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	public String getSellername() {
		return sellername;
	}
	public void setSellername(String sellername) {
		this.sellername = sellername;
	}
	public long getSelllermobile() {
		return selllermobile;
	}
	public void setSelllermobile(long selllermobile) {
		this.selllermobile = selllermobile;
	}
	public int getTotaldoc() {
		return totaldoc;
	}
	public void setTotaldoc(int totaldoc) {
		this.totaldoc = totaldoc;
	}
	public String getSellerdeal() {
		return sellerdeal;
	}
	public void setSellerdeal(String sellerdeal) {
		this.sellerdeal = sellerdeal;
	}
	public String getSellerstatus() {
		return sellerstatus;
	}
	public void setSellerstatus(String sellerstatus) {
		this.sellerstatus = sellerstatus;
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
