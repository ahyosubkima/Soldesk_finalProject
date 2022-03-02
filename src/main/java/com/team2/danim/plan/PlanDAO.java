package com.team2.danim.plan;

import java.io.File;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class PlanDAO {

	@Autowired
	private SqlSession ss;

	public void upload(HttpServletRequest req) {

		String path = req.getSession().getServletContext().getRealPath("resources/plan/p_file");
		System.out.println(path);
		MultipartRequest mr = null;
		String token = null;

		try {
			mr = new MultipartRequest(req, path, 1500 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
			token = mr.getParameter("token");
			String successToken = (String) req.getSession().getAttribute("successToken");
			
			if (successToken != null && token.equals(successToken)) {
				String fileName = mr.getFilesystemName("p_TitleFile");
				new File(path + "/" + fileName).delete();
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}

		try {
			String fName = mr.getFilesystemName("p_TitleFile");
			
			System.out.println(mr.getParameter("p_title"));
			System.out.println(fName);
			System.out.println(mr.getParameter("p_person"));
			
			Plan_write pw = new Plan_write();

			
			pw.setP_writer(mr.getParameter("p_writer"));
			pw.setP_title(mr.getParameter("p_title"));
			
			String p_TitleFile = mr.getFilesystemName("p_TitleFile");
			p_TitleFile = URLEncoder.encode(p_TitleFile, "utf-8");
			pw.setP_TitleFile(p_TitleFile.replace("+", " "));
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			pw.setP_startDate(sdf.parse(mr.getParameter("p_startDate")));
			
			pw.setP_person(Integer.parseInt(mr.getParameter("p_person")));
			pw.setP_place(mr.getParameter("p_place"));
			pw.setP_freeWrite(mr.getParameter("p_freeWrite"));
			
			if (ss.getMapper(PlanMapper.class).upload(pw) == 1) {
				req.getSession().setAttribute("successToken", token);
				req.setAttribute("result", "작성 성공");
				System.out.println("작성 성공");
			}

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "작성 실패");
			System.out.println("작성 실패");
		}

	}

}
