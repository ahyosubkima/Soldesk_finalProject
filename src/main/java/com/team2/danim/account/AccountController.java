package com.team2.danim.account;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AccountController {

	@RequestMapping(value = "account.login", method = RequestMethod.POST)
	public String home(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "index.jsp");
		return "home";
	}
	
}
