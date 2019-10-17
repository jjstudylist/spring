package com.erp.app.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erp.app.common.CommonUploadFile;
import com.erp.app.dto.MemberDTO;
import com.erp.app.service.ProfileService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ProfileController {

	@Autowired
	private ProfileService profileService;
	@Autowired
	private CommonUploadFile fileUploadService;


	@RequestMapping("/profile")
	public String signUp() {
		
		return "profile";
	}


	@RequestMapping("/selectProfile")
	public @ResponseBody Map<Object, Object> selectProfile(MemberDTO member) {

		Map<Object, Object> result = profileService.selectProfile(member); 
		
		return result;
	}
	
	@RequestMapping("/updateProfile")
	public @ResponseBody Map<Object, Object> updateProfile(HttpServletRequest request, MemberDTO member) throws Exception {
		
		if(member.getFileUpload() != null || !member.getFileUpload().getOriginalFilename().isEmpty())
			fileUploadService.restore(request, member);

		profileService.updateProfile(member); 
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("result", "");
		return map;
	}

	


}
