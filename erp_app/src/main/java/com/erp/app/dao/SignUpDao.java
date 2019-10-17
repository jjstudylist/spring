package com.erp.app.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.erp.app.dto.MemberDTO;

@Repository
public class SignUpDao  {

	@Autowired
	private SqlSessionTemplate session;

	public int IdCheck(String userId) {
		return session.selectOne("signUp.IdCheck", userId);
	}

	public int RegisterMember(MemberDTO member) {
		return session.insert("signUp.RegisterMember", member);
	}	

	public void MemberConfirm(String No) {
		session.update("signUp.MemberConfirm", No);
	}	
}