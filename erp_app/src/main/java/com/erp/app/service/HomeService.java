package com.erp.app.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erp.app.common.CommonEmail;
import com.erp.app.dao.HomeDao;
import com.erp.app.dto.MemberDTO;
import com.erp.app.dto.TourDTO;

@Service
public class HomeService {

	@Autowired
	private HomeDao homeDao;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private CommonEmail commonEmail;

	// �α���
	public Map<Object, Object> SelectMember(MemberDTO member) {

		String checkLogin = "";
		
		MemberDTO result = homeDao.SelectMember(member);	

		// ��ġ�ϴ� ������ ���� �� null�� return
		if(result == null) {
			checkLogin = "User ID �Ǵ� Password�� �ٽ� Ȯ���ϼ���.";
		}
		//naver로 로그인했는지 체크
		/*else if(result.getJoin_Type().equals("NAVER")) {
			request.getSession().setAttribute("LoginInfo", result);
			
			// ������ �α��� �ð� update
			homeDao.updateLastLogin(member); 
		}*/
		// �̸��� ������ ��ġ�� ���� �����
		else if(result.getApproval().equals("F")) {
			checkLogin = "������ �ʿ��� User ID �Դϴ�.";
		}
		// �α��� ����
		else {
			request.getSession().setAttribute("LoginInfo", result);
			
			// ������ �α��� �ð� update
			homeDao.updateLastLogin(member); 
		}
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("result", checkLogin);
		
		return map;
	}
	
	// ��й�ȣ ã��
	public Map<Object, Object> findUserInfo(MemberDTO member) {

		boolean checkLogin = false;
		
		MemberDTO result = homeDao.SelectMember(member);

		// ��ġ�ϴ� ������ ���� �� false�� return
		if(result == null) {
			checkLogin = false;
		}
		else {
			
			// �ӽ� ��й�ȣ ����
			char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7',
					'8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 
					'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
					'U', 'V', 'W', 'X', 'Y', 'Z' };

			  int idx = 0;
			  StringBuffer sb = new StringBuffer();
			  
			  for (int i = 0; i < 8; i++) {
				
				  idx = (int) (charSet.length * Math.random()); // 36 * ������ ������  Int�� ���� (�Ҽ�������)
				  sb.append(charSet[idx]);
			  }
			  
			  // �ӽ� ��й�ȣ update
			  result.setPassword(sb.toString());
			  homeDao.updatePassword(result); 
			  
			  // �̸��� ����
			  try {
					commonEmail.findUserInfoEmail(result, sb.toString());
			  } catch (MessagingException e) {
					e.printStackTrace();
			  }

			  checkLogin = true;
		}

		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("result", checkLogin);
		return map;
	}
	
	
	//naver 이메일 정보 체크
	public MemberDTO selectNaverInfo(MemberDTO member){
		MemberDTO result = homeDao.selectNaverInfo(member);
		return result;
	}

	//naver 정보로 자동 회원가입
	public int insertNaverInfo(MemberDTO member){
		return homeDao.insertNaverInfo(member);
	}
}
