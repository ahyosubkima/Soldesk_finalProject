package com.team2.danim.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		mDAO.login(m, req);
		req.setAttribute("contentPage", "index.jsp");
		
		return "home";
	}
	
	@RequestMapping(value = "member.myPage", method = RequestMethod.GET)
	public String toMyPage(Member m, HttpServletRequest req) {
		req.setAttribute("contentPage", "member/myPage.jsp");
		return "home";
	}
	
	@RequestMapping(value = "member.delete", method = RequestMethod.GET)
	public String deleteMember(HttpServletRequest req) {
		
		mDAO.deleteMember(req);
		mDAO.logout(req);
		req.setAttribute("contentPage", "index.jsp");
		return "home";
	}
	
	@RequestMapping(value = "member.update", method = RequestMethod.GET)
	public String toMemberUpdate(Member m, HttpServletRequest req) {
		
		req.setAttribute("contentPage", "member/myPage_update.jsp");
		return "home";
	}
	
	
	@RequestMapping(value = "member.updateInfo", method = RequestMethod.POST)
	public String MemberUpdate(Member m, HttpServletRequest req) {
		mDAO.updateMember(m, req);
		req.setAttribute("contentPage", "member/myPage.jsp");
		return "home";
	}
	
	@RequestMapping(value = "member.idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("dm_id") String dm_id) {
		
		return mDAO.userIdCheck(dm_id);
	}
	
}
