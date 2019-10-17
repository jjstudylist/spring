package com.erp.app.service;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.erp.app.dao.HomeDao;
import com.erp.app.dao.ProfileDao;
import com.erp.app.dto.MemberDTO;

@Service
public class ProfileService {

	@Autowired
	private ProfileDao profileDao;
	@Autowired
	private HomeDao homeDao;

	// ����� ������ ��ȸ
	public Map<Object, Object> selectProfile(MemberDTO member) {

		MemberDTO result = homeDao.SelectMember(member);	

		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("result", result);
		
		return map;
	}
	
	// ����� ������ ����
	public boolean updateProfile(MemberDTO member) {

		profileDao.updateProfile(member);

		return true;	
	}

}
