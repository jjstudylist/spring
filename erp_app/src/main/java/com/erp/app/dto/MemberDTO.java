package com.erp.app.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class MemberDTO {
	private String No;
	private String Name;
	private String Id;
	private String Password;
	private String Gender;
	private String Email;
	private String Phone;
	private String Birth;
	private Date JoinDate;
	private String Lev;
	private Date LastLogin;
	private String Approval;
	private String Address1;
	private String Address2;
	private String ZipCode;
	private MultipartFile FileUpload;
	private String Join_Type;
	
	public String getNo() {
		return No;
	}
	public void setNo(String no) {
		No = no;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getBirth() {
		return Birth;
	}
	public void setBirth(String birth) {
		Birth = birth.replace("-", "");
	}
	public Date getJoinDate() {
		return JoinDate;
	}
	public void setJoinDate(Date joinDate) {
		JoinDate = joinDate;
	}
	public String getLev() {
		return Lev;
	}
	public void setLev(String lev) {
		Lev = lev;
	}
	public Date getLastLogin() {
		return LastLogin;
	}
	public void setLastLogin(Date lastLogin) {
		LastLogin = lastLogin;
	}
	public String getApproval() {
		return Approval;
	}
	public void setApproval(String approval) {
		Approval = approval;
	}
	public String getAddress1() {
		return Address1;
	}
	public void setAddress1(String address1) {
		Address1 = address1;
	}
	public String getAddress2() {
		return Address2;
	}
	public void setAddress2(String address2) {
		Address2 = address2;
	}
	public String getZipCode() {
		return ZipCode;
	}
	public void setZipCode(String zipCode) {
		ZipCode = zipCode;
	}
	public MultipartFile getFileUpload() {
		return FileUpload;
	}
	public void setFileUpload(MultipartFile fileUpload) {
		FileUpload = fileUpload;
	}
	public String getJoin_Type() {
		return Join_Type;
	}
	public void setJoin_Type(String join_Type) {
		Join_Type = join_Type;
	}

	
	
}
