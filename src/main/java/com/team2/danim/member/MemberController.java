package com.team2.danim.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	@Autowired
	private MemberDAO mDAO;
	
	//로그인 처리
	@RequestMapping(value = "member.login", method = RequestMethod.POST)
	public String home(Member m, HttpServletRequest req) {
		
		// 로그인
		mDAO.login(m, req);
		req.setAttribute("contentPage", "index.jsp");
		return "home";
	}
	
	//로그아웃 처리
	@RequestMapping(value = "member.logout", method = RequestMethod.GET)
	public String logout(Member m, HttpServletRequest req) {
		
		mDAO.logout(req);
		req.setAttribute("contentPage", "index.jsp");
		return "home";
	}
	
	//회원가입
	@RequestMapping(value = "member.register", method = RequestMethod.POST)
	public String register(Member m, HttpServletRequest req) {
		
		mDAO.register(m, req);
		req.setAttribute("contentPage", "index.jsp");
		
		return "home";
	}
	
	@RequestMapping(value = "member.myPage")
	public String toMyPage(Member m, HttpServletRequest req) {
		
		
		req.setAttribute("contentPage", "member/myPage.jsp");
		return "home";
	}
	
	public String deleteMember(HttpServletRequest req) {
		
		mDAO.deleteMember(req);
		req.setAttribute("contentPage", "member/myPage.jsp");
		return "home";
	}
	
	
}
