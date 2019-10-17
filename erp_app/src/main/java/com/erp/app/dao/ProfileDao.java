package com.erp.app.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.erp.app.dto.MemberDTO;

@Repository
public class ProfileDao  {

	@Autowired
	private SqlSessionTemplate session;


	public int updateProfile(MemberDTO member) {
		return session.update("profile.updateProfile", member);

	}	
}