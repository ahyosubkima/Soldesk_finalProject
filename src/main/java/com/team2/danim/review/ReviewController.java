package com.team2.danim.review;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hs.ajax.Menu;
import com.hs.ajax.Menus;

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
		
		@RequestMapping(value = "/getTitleByJSON", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
		public @ResponseBody String getTitleByJSON(ReviewBean reviewBean ) {
			
			//req.setAttribute("contentPage", "review/reviewWrite.jsp");
			
			
			return "home";
		}
		
}


