package com.erp.app.controller;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.erp.app.dto.MemberDTO;
import com.erp.app.service.SignUpService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SignUpController {
	
	@Autowired
	private SignUpService signUpService;
	
	@RequestMapping("/signUp")
	public String signUp() {
		
		return "signUp";
	}
	
	@RequestMapping("/ex/idCheck")
	public @ResponseBody Map<Object, Object> IdCheck(@RequestBody String userId) throws Exception {

		int cnt = signUpService.IdCheck(userId);
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("result", cnt == 0 ? true : false);
		
		return map;
	}
	
	@RequestMapping("/ex/RegisterMember")
	public @ResponseBody Map<Object, Object> RegisterMember(MemberDTO member) throws Exception {

		boolean result = signUpService.RegisterMember(member); 

		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("result", result);

		return map;
	}

	@RequestMapping("/ex/MemberConfirm")
	public void MemberConfirm(String No) throws Exception {
		
		signUpService.MemberConfirm(No); 
		
	}
}
