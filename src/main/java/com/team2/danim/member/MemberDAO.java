package com.team2.danim.member;

import java.io.File;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
				req.setAttribute("result", "로그인 실패(PW오류)");
			}
		} else {
			req.setAttribute("result", "로그인 실패(미가입ID)");
		}
		
	}

	//로그아웃
	public void logout(HttpServletRequest req) {
		req.getSession().setAttribute("loginMember", null);
	}

	//회원가입
	public void register(Member m, HttpServletRequest req) {
		
		String path = req.getSession().getServletContext().getRealPath("resources/asset/member/img_member");
		MultipartRequest mr = null;
		
		try {
			mr = new MultipartRequest(req, path, 30 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("가입 실패");
			return;
		}
		
		try {
			String reg_id = mr.getParameter("dm_id");
			String reg_pw = mr.getParameter("dm_pw");
			String reg_name = mr.getParameter("dm_name");
			String reg_nick = mr.getParameter("dm_nickname");
			String reg_addr = mr.getParameter("dm_addr");
			String reg_profile = mr.getFilesystemName("dm_photo");
			reg_profile = URLEncoder.encode(reg_profile, "utf-8");
			reg_profile = reg_profile.replace("+", "");
			
			m.setDm_id(reg_id);
			m.setDm_pw(reg_pw);
			m.setDm_name(reg_name);
			m.setDm_nickname(reg_nick);
			m.setDm_addr(reg_addr);
			m.setDm_photo(reg_profile);
			
			if(ss.getMapper(MemberMapper.class).register(m) == 1) {
				System.out.println("가입 성공");
			} else {
				System.out.println("가입 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			String fileName = mr.getFilesystemName("dm_photo");
			new File(path + "/" + fileName).delete();
			System.out.println("가입 실패");
		}
		
		
		
	}
	
}
