package com.erp.app.dto;

import java.io.Serializable;

public class HomeDTO implements Serializable {
	private String UserID;
	private String ITEM1;
	private String ITEM2;
	public String getUserID() {
		return UserID;
	}
	public void setUserID(String userID) {
		UserID = userID;
	}
	public String getITEM1() {
		return ITEM1;
	}
	public void setITEM1(String iTEM1) {
		ITEM1 = iTEM1;
	}
	public String getITEM2() {
		return ITEM2;
	}
	public void setITEM2(String iTEM2) {
		ITEM2 = iTEM2;
	}
	
}
