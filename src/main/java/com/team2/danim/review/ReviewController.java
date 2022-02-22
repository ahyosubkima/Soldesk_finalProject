package com.team2.danim.review;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReviewController {

		
		@Autowired
		reviewDAO reviewDAO;
	
		@RequestMapping(value = "/review.go", method = RequestMethod.GET)
		public String goReviewMain(HttpServletRequest req) {
			
			reviewDAO.getAllreview(req);
			req.setAttribute("contentPage", "review/reviewMain.jsp");
			
			return "home";
		}
		
		@RequestMapping(value = "/reviewWrite.go", method = RequestMethod.GET)
		public String goReviewWrite(HttpServletRequest req) {
			
			req.setAttribute("contentPage", "review/reviewWrite.jsp");
			
			
			return "home";
		}
}
