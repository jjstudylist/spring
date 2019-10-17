package com.erp.app.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class TourDTO {
	
	//Tour
	private String No;
	private String Country;
	private String City;
	private String Title;
	private String Start_date;
	private String End_date;
	private int Price;
	private String Make_id;
	private Date Make_date;
	
	//Tour_date
	private String No_tourDate;
	private String Tour_no;
	private String Date;
	private String Make_id_tourDate;
	private Date Make_time_tourDate;

	//Tour_seat
	private String Date_no;
	private String Member_no;
	private String Order_type;
	private String Seat_no;
	
	//order
	private String Name;
	private String Birth;
	private String Passport;
	private String First_name;
	private String Last_name;
	private String Phone;
	private String email;
	private String make_time;
	
	public String getNo() {
		return No;
	}
	public void setNo(String no) {
		No = no;
	}
	public String getCountry() {
		return Country;
	}
	public void setCountry(String country) {
		Country = country;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}

	public String getStart_date() {
		return Start_date;
	}
	public void setStart_date(String start_date) {
		Start_date = start_date;
	}
	public String getEnd_date() {
		return End_date;
	}
	public void setEnd_date(String end_date) {
		End_date = end_date;
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
	}
	public String getMake_id() {
		return Make_id;
	}
	public void setMake_id(String make_id) {
		Make_id = make_id;
	}
	public Date getMake_date() {
		return Make_date;
	}
	public void setMake_date(Date make_date) {
		Make_date = make_date;
	}
	public String getNo_tourDate() {
		return No_tourDate;
	}
	public void setNo_tourDate(String no_tourDate) {
		No_tourDate = no_tourDate;
	}

	public String getTour_no() {
		return Tour_no;
	}
	public void setTour_no(String tour_no) {
		Tour_no = tour_no;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
	public String getMake_id_tourDate() {
		return Make_id_tourDate;
	}
	public void setMake_id_tourDate(String make_id_tourDate) {
		Make_id_tourDate = make_id_tourDate;
	}
	public Date getMake_time_tourDate() {
		return Make_time_tourDate;
	}
	public void setMake_time_tourDate(Date make_time_tourDate) {
		Make_time_tourDate = make_time_tourDate;
	}
	public String getDate_no() {
		return Date_no;
	}
	public void setDate_no(String date_no) {
		Date_no = date_no;
	}
	public String getMember_no() {
		return Member_no;
	}
	public void setMember_no(String member_no) {
		Member_no = member_no;
	}
	public String getOrder_type() {
		return Order_type;
	}
	public void setOrder_type(String order_type) {
		Order_type = order_type;
	}
	public String getSeat_no() {
		return Seat_no;
	}
	public void setSeat_no(String seat_no) {
		Seat_no = seat_no;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getBirth() {
		return Birth;
	}
	public void setBirth(String birth) {
		Birth = birth;
	}
	public String getPassport() {
		return Passport;
	}
	public void setPassport(String passport) {
		Passport = passport;
	}
	
	public String getFirst_name() {
		return First_name;
	}
	public void setFirst_name(String first_name) {
		First_name = first_name;
	}
	public String getLast_name() {
		return Last_name;
	}
	public void setLast_name(String last_name) {
		Last_name = last_name;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMake_time() {
		return make_time;
	}
	public void setMake_time(String make_time) {
		this.make_time = make_time;
	}
	
	
}
