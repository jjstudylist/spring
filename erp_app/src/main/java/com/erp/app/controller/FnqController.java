package com.erp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class FnqController {

	
	@RequestMapping("/fnq")
	public String fnq() {
		
		return "fnq";
	}
}
