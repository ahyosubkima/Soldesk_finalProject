package com.team2.danim.member;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberDAO {

	@Autowired
	private SqlSession ss;
	
	//로그인
	public void login(Member m, HttpServletRequest req) {
		Member dbMember = ss.getMapper(MemberMapper.class).getMemberByID(m);

		if (dbMember != null) {
			if (m.getDm_pw().equals(dbMember.getDm_pw())) {
				req.getSession().setAttribute("loginMember", dbMember);
				req.getSession().setMaxInactiveInterval(60 * 10);
			} else {
				System.out.println("Log in failed(invalid PW");
				req.setAttribute("result", "로그인 실패(PW오류)");
			}
		} else {
			System.out.println("Log in failed(invalid ID)");
			req.setAttribute("result", "로그인 실패(미가입ID)");
		}
		
	}

	//로그아웃
	public void logout(HttpServletRequest req) {
		req.getSession().setAttribute("loginMember", null);
	}

	//회원가입
	public void register(Member m, HttpServletRequest req) {
		
			
		try {
			String reg_id = req.getParameter("dm_id");
			String reg_pw = req.getParameter("dm_pw");
			String reg_nick = req.getParameter("dm_nickname");
			String reg_email = req.getParameter("dm_email");
			String reg_isAdmin = req.getParameter("dm_isAdmin");
			
			m.setDm_id(reg_id);
			m.setDm_pw(reg_pw);
			m.setDm_nickname(reg_nick);
			m.setDm_email(reg_email);
			m.setDm_isAdmin(reg_isAdmin);
			
			if(ss.getMapper(MemberMapper.class).register(m) == 1) {
				System.out.println("가입 성공");
			} else {
				System.out.println("가입 실패");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("가입 실패");
		}
		
		
		
	}
	
}
