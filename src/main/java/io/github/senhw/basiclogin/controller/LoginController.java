package io.github.senhw.basiclogin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

	@GetMapping("/showMyLoginPage")
	public String showMyLoginPage() {
		
		// commenting out the plain login page
		// return "plain-login";
		return "fancy-login-page";
		
	}
	
	// add request mapping for /access-denied
	@GetMapping("/access-denied")
	public String showAccessDenied() {
		
		return "access-denied";
		
	}
	
}
