package com.erp.app.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.erp.app.dto.MemberDTO;

@Repository
public class HomeDao {

	@Autowired
	private SqlSessionTemplate session;

	public MemberDTO SelectMember(MemberDTO member) {
		return session.selectOne("home.SelectMember", member);
	}
	public void updateLastLogin(MemberDTO member) {
		session.update("home.updateLastLogin", member);
	}
	public void updatePassword(MemberDTO member) {
		session.update("home.updatePassword", member);
	}
	//naver 이메일 정보 체크
	public MemberDTO selectNaverInfo(MemberDTO member){
		return session.selectOne("home.selectNaverInfo", member);
	}
	//naver 정보로 자동 회원가입
	public int insertNaverInfo(MemberDTO member){
		return session.insert("home.insertNaverInfo",member);
	}
}
