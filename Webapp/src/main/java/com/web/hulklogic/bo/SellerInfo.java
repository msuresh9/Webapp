package com.web.hulklogic.bo;

public class SellerInfo {
	private String sellerName;
	private String sellerAddress;
	private String shopname;
	private Long sellerMobileNumber;
	private Double longitude;
	private Double latitude;
	public String getShopname() {
		return shopname;
	}
	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	public Long getSellerMobileNumber() {
		return sellerMobileNumber;
	}
	public void setSellerMobileNumber(Long sellerMobileNumber) {
		this.sellerMobileNumber = sellerMobileNumber;
	}
	public String getSellerName() {
		return sellerName;
	}
	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}
	public String getSellerAddress() {
		return sellerAddress;
	}
	public void setSellerAddress(String sellerAddress) {
		this.sellerAddress = sellerAddress;
	}
	public Double getLongitude() {
		return longitude;
	}
	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}
	public Double getLatitude() {
		return latitude;
	}
	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
	
	

}
