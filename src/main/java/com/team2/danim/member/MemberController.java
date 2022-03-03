package com.team2.danim.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class MemberController {
	@Autowired
	private MemberDAO mDAO;
	
//	@RequestMapping(value = "member.login", method = RequestMethod.POST)
//	public String home(Member m, HttpServletRequest req) {
//		
//		// 로그인
//		mDAO.login(m, req);
////		mDAO.loginCheck(req);
//		req.setAttribute("contentPage", "home.jsp");
//		return "index";
//	}
//	
	
	
}
