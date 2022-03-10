package com.team2.danim.member;

import java.io.File;
import java.net.URLDecoder;

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

		String inputPw = req.getParameter("dm_pw");
		String actualPw = Sha256.encodeSha256(inputPw);

		if (dbMember != null) {
			if (actualPw.equals(dbMember.getDm_pw())) {
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
			String reg_rawPw = req.getParameter("dm_pw");
			String reg_dbPw = Sha256.encodeSha256(reg_rawPw);
			String reg_nick = req.getParameter("dm_nickname");
			String reg_email = req.getParameter("dm_email");
			String reg_isAdmin = req.getParameter("dm_isAdmin");
			
			m.setDm_id(reg_id);
			m.setDm_pw(reg_dbPw);
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

	//회원 탈퇴
	public void deleteMember(HttpServletRequest req) {
		try {
			Member m = (Member) req.getSession().getAttribute("loginAccount");
			String join_photo = m.getDm_photo();
			
			if (ss.getMapper(MemberMapper.class).deleteMember(m) == 1) {
				req.setAttribute("result", "탈퇴성공");

				String path = req.getSession().getServletContext().getRealPath("resources/img_account");
				join_photo = URLDecoder.decode(join_photo, "utf-8");
				new File(path + "/" + join_photo).delete();

				logout(req);
			} else {
				req.setAttribute("result", "탈퇴실패");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}


	
}
