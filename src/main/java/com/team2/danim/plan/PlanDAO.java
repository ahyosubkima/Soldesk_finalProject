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
import com.team2.danim.Criteria3;
import com.team2.danim.PageMakerDTO3;

@Service
public class PlanDAO {

	@Autowired
	private SqlSession ss;
	
	

	public void uploadPlan(HttpServletRequest req) {

		String path = req.getSession().getServletContext().getRealPath("resources/plan/p_file");
		System.out.println(path);
		MultipartRequest mr = null;
		String token = null;

		try {
			mr = new MultipartRequest(req, path, 1500 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
			token = mr.getParameter("token");
			String successToken = (String) req.getSession().getAttribute("successToken");
			
			if (successToken != null && token.equals(successToken)) {
				String fileName = mr.getFilesystemName("p_titleFile");
				new File(path + "/" + fileName).delete();
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}

		try {
			//값가져오기
			String p_writer = mr.getParameter("p_writer");
			String p_title = mr.getParameter("p_title");
			String p_titleFile = mr.getFilesystemName("p_titleFile");
			p_titleFile = URLEncoder.encode(p_titleFile, "utf-8");
			int p_days = Integer.parseInt(mr.getParameter("p_days"));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String p_startDate = mr.getParameter("p_startDate");
			int p_person = Integer.parseInt(mr.getParameter("p_person"));
			String p_place = mr.getParameter("p_place");
			
			String[] p_plans = mr.getParameterValues("p_plan");
			String p_plan = new String();
			for (int i = 0; i < p_plans.length; i++) {
				p_plan += p_plans[i] + ",";
			}
			
			String p_budget = mr.getParameter("p_budget");
			String p_freeWrite = mr.getParameter("p_freeWrite");
			
			String[] p_setItems = mr.getParameterValues("p_setItem");
			String p_setItem = new String();
			for (int i = 0; i < p_setItems.length; i++) {
				p_setItem += p_setItems[i] + ",";
			}
			
			String[] p_setTitles = mr.getParameterValues("p_setTitle");	
			String p_setTitle = new String();
			for (int i = 0; i < p_setTitles.length; i++) {
				p_setTitle += p_setTitles[i] + ",";
			}
			
			String[] p_setPrices = mr.getParameterValues("p_setPrice");
			String p_setPrice = new String();
			for (int i = 0; i < p_setPrices.length; i++) {
				p_setPrice += p_setPrices[i]+",";
			}
			
			//빈에 담기
			Plan_write pw = new Plan_write();
			pw.setP_writer(p_writer);
			pw.setP_title(p_title);
			pw.setP_titleFile(p_titleFile.replace("+", " "));
			pw.setP_days(p_days);
			pw.setP_startDate(sdf.parse(p_startDate));
			pw.setP_person(p_person);
			pw.setP_place(p_place);
			pw.setP_plan(p_plan);
			pw.setP_budget(p_budget);
			pw.setP_freeWrite(p_freeWrite);
			pw.setP_setTitle(p_setTitle);
			pw.setP_setItem(p_setItem);
			pw.setP_setPrice(p_setPrice);
			
			//빈2
			Plan_budget pb = new Plan_budget();
			pb.setP_setTitle(p_setTitle);
			pb.setP_setItem(p_setItem);
			pb.setP_setPrice(p_setPrice);
			
			
			//확인용
			System.out.println("작성자(p_writer)::   " + p_writer);
			System.out.println("제목(p_title)::   " + p_title);
			System.out.println("사진(p_titleFile)::   " + p_titleFile);
			System.out.println("박수(p_days)::   " + p_days);
			System.out.println("출발일(p_startDate)::   " + p_startDate);
			System.out.println("사람수(p_person)::   " + p_person);
			System.out.println("장소(p_place)::   " + p_place);
			System.out.println("일정(p_plan)::   " + p_plan);
			System.out.println("총예산(p_budget)::   " + p_budget);
			System.out.println("한마디(p_freeWrite)::   " + p_freeWrite);
			System.out.println("예산 상품제목(p_setTitle)::    " + p_setTitle);
			System.out.println("예산 상품명들(p_setItem)::    " + p_setItem);
			System.out.println("상품명당 금액들(p_setPrice)::    " + p_setPrice);
			
			if (ss.getMapper(PlanMapper.class).uploadPlan(pw) == 1) {
				req.getSession().setAttribute("successToken", token);
				req.setAttribute("pbs", pb);
				System.out.println("작성 성공");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("작성 실패");
		}

	}

	public void getAllPlan(HttpServletRequest req) {
		
		try {
			req.setAttribute("plans", ss.getMapper(PlanMapper.class).getAllPlan());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void getPlan(HttpServletRequest req) {
		
		try {
			
			int p_no = Integer.parseInt(req.getParameter("p_no"));
			req.setAttribute("plan", ss.getMapper(PlanMapper.class).getPlan(p_no));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void getPageMakerPlan(HttpServletRequest req,Criteria3 cri3) {
		
		int total = ss.getMapper(PlanMapper.class).getTotalPlan();
		
		PageMakerDTO3 pageMake = new PageMakerDTO3(cri3, total);
		req.setAttribute("pageMaker", pageMake);
		
		System.out.println(pageMake.getEndPage());
		System.out.println(pageMake.getStartPage());
		System.out.println(pageMake.getTotal());
		System.out.println("페이지메이커 실행후");
	}

	
	public void getPlanPaging(HttpServletRequest req,Criteria3 cri3) {
		
		
		try {
				
			if(req.getParameter("pageNum") != null)
			{
				cri3.setPageNum(Integer.parseInt(req.getParameter("pageNum")));
				}
				req.setAttribute("plans", ss.getMapper(PlanMapper.class).getPlanPaging(cri3));
				System.out.println("불러온후");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	
	
}	
	
	
	
	
	
	
	
	
	
	
	
