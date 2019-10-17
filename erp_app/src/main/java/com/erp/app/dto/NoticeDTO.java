package com.erp.app.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class NoticeDTO {
	
	//공지사항 글
	private int No;
	private String Subject;
	private String Contents;
	private String Member_no;
	private Date Make_date;
	private Date Update_date;
	private int View_count;
	private int prev;
	private int next;
	private int curPage;
	private int cnt;
	private String name;
	private String rw;
	
	//댓글
	private int req_No;
	private String reply_no;
	private String type;
	private String req_contents;
	private String req_memberNo;
	private String req_makeDate;
	private String req_updateDate;
	private String req_name;
	private int reply_cnt;
	
	public int getNo() {
		return No;
	}
	public void setNo(int no) {
		No = no;
	}
	public String getSubject() {
		return Subject;
	}
	public void setSubject(String subject) {
		Subject = subject;
	}
	public String getContents() {
		return Contents;
	}
	public void setContents(String contents) {
		Contents = contents;
	}
	public String getMember_no() {
		return Member_no;
	}
	public void setMember_no(String member_no) {
		Member_no = member_no;
	}
	public Date getMake_date() {
		return Make_date;
	}
	public void setMake_date(Date make_date) {
		Make_date = make_date;
	}
	public Date getUpdate_date() {
		return Update_date;
	}
	public void setUpdate_date(Date update_date) {
		Update_date = update_date;
	}
	public int getView_count() {
		return View_count;
	}
	public void setView_count(int view_count) {
		View_count = view_count;
	}
	public int getPrev() {
		return prev;
	}
	public void setPrev(int prev) {
		this.prev = prev;
	}
	public int getNext() {
		return next;
	}
	public void setNext(int next) {
		this.next = next;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getReq_No() {
		return req_No;
	}
	public void setReq_No(int req_No) {
		this.req_No = req_No;
	}
	public String getReply_no() {
		return reply_no;
	}
	public void setReply_no(String reply_no) {
		this.reply_no = reply_no;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getReq_contents() {
		return req_contents;
	}
	public void setReq_contents(String req_contents) {
		this.req_contents = req_contents;
	}
	public String getReq_memberNo() {
		return req_memberNo;
	}
	public void setReq_memberNo(String req_memberNo) {
		this.req_memberNo = req_memberNo;
	}
	public String getReq_makeDate() {
		return req_makeDate;
	}
	public void setReq_makeDate(String req_makeDate) {
		this.req_makeDate = req_makeDate;
	}
	public String getReq_updateDate() {
		return req_updateDate;
	}
	public void setReq_updateDate(String req_updateDate) {
		this.req_updateDate = req_updateDate;
	}
	public String getReq_name() {
		return req_name;
	}
	public void setReq_name(String req_name) {
		this.req_name = req_name;
	}
	public int getReply_cnt() {
		return reply_cnt;
	}
	public void setReply_cnt(int reply_cnt) {
		this.reply_cnt = reply_cnt;
	}
	public String getRw() {
		return rw;
	}
	public void setRw(String rw) {
		this.rw = rw;
	}

	
	
}
