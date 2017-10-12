package com.web.hulklogic.bo;

import java.sql.Date;

public class RegistrationBO {
	private String FirstName;
	private String LastName;
	private String Email;
	private String UserName;
	private String Password;
	private long ContactNo;
	private Date DOB;
	private String dob;
	private String Qualification;
	private String Gender;
	private String AddrLine1;
	private String AddrLine2;
    private String District;
	private String State;
    private String Country;
    private long Pincode;
    private String BankName;
	private String BankAccNo;
    private String IFSCCODE;
    private long aadharCardNo;
	private String aadharImg;
	private String voterIdNo;
	private String voterIdImg;
	private int DegreeCertificateNo;
	private String DegreeCertificateImg;
	private String personimage;
	private String pannumber;
	private String panimage;
	private String imeiNo;
	private double latitude;
	private double longitude;
	private String isActiveted;
	private String isEmailCheck;
	private int roleid;
	private String agentEmail;
	private int userid;
	private String referralCode;
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getReferralCode() {
		return referralCode;
	}
	public void setReferralCode(String referralCode) {
		this.referralCode = referralCode;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getAgentEmail() {
		return agentEmail;
	}
	public void setAgentEmail(String agentEmail) {
		this.agentEmail = agentEmail;
	}
	public int getRoleid() {
		return roleid;
	}
	public void setRoleid(int roleid) {
		this.roleid = roleid;
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
	public String getIsActiveted() {
		return isActiveted;
	}
	public void setIsActiveted(String isActiveted) {
		this.isActiveted = isActiveted;
	}
	public String getIsEmailCheck() {
		return isEmailCheck;
	}
	public void setIsEmailCheck(String isEmailCheck) {
		this.isEmailCheck = isEmailCheck;
	}
	public String getFirstName() {
		return FirstName;
	}
	public void setFirstName(String firstName) {
		FirstName = firstName;
	}
	public String getLastName() {
		return LastName;
	}
	public void setLastName(String lastName) {
		LastName = lastName;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public long getContactNo() {
		return ContactNo;
	}
	public void setContactNo(long contactNo) {
		ContactNo = contactNo;
	}
	public Date getDOB() {
		return DOB;
	}
	public void setDOB(Date dOB) {
		DOB = dOB;
	}
	public String getQualification() {
		return Qualification;
	}
	public void setQualification(String qualification) {
		Qualification = qualification;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	public String getAddrLine1() {
		return AddrLine1;
	}
	public void setAddrLine1(String addrLine1) {
		AddrLine1 = addrLine1;
	}
	public String getAddrLine2() {
		return AddrLine2;
	}
	public void setAddrLine2(String addrLine2) {
		AddrLine2 = addrLine2;
	}
	public String getDistrict() {
		return District;
	}
	public void setDistrict(String district) {
		District = district;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public String getCountry() {
		return Country;
	}
	public void setCountry(String country) {
		Country = country;
	}
	public long getPincode() {
		return Pincode;
	}
	public void setPincode(long pincode) {
		Pincode = pincode;
	}
	public String getBankName() {
		return BankName;
	}
	public void setBankName(String bankName) {
		BankName = bankName;
	}
	public String getBankAccNo() {
		return BankAccNo;
	}
	public void setBankAccNo(String bankAccNo) {
		BankAccNo = bankAccNo;
	}
	public String getIFSCCODE() {
		return IFSCCODE;
	}
	public void setIFSCCODE(String iFSCCODE) {
		IFSCCODE = iFSCCODE;
	}
	public long getAadharCardNo() {
		return aadharCardNo;
	}
	public void setAadharCardNo(long aadharCardNo) {
		this.aadharCardNo = aadharCardNo;
	}
	public String getAadharImg() {
		return aadharImg;
	}
	public void setAadharImg(String aadharImg) {
		this.aadharImg = aadharImg;
	}
	public String getVoterIdNo() {
		return voterIdNo;
	}
	public void setVoterIdNo(String voterIdNo) {
		this.voterIdNo = voterIdNo;
	}
	public String getVoterIdImg() {
		return voterIdImg;
	}
	public void setVoterIdImg(String voterIdImg) {
		this.voterIdImg = voterIdImg;
	}
	public int getDegreeCertificateNo() {
		return DegreeCertificateNo;
	}
	public void setDegreeCertificateNo(int degreeCertificateNo) {
		DegreeCertificateNo = degreeCertificateNo;
	}
	public String getDegreeCertificateImg() {
		return DegreeCertificateImg;
	}
	public void setDegreeCertificateImg(String degreeCertificateImg) {
		DegreeCertificateImg = degreeCertificateImg;
	}
	public String getPersonimage() {
		return personimage;
	}
	public void setPersonimage(String personimage) {
		this.personimage = personimage;
	}
	public String getPannumber() {
		return pannumber;
	}
	public void setPannumber(String pannumber) {
		this.pannumber = pannumber;
	}
	public String getPanimage() {
		return panimage;
	}
	public void setPanimage(String panimage) {
		this.panimage = panimage;
	}
	public String getImeiNo() {
		return imeiNo;
	}
	public void setImeiNo(String imeiNo) {
		this.imeiNo = imeiNo;
	}
	
}
