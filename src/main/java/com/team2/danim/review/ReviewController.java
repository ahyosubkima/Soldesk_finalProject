package com.team2.danim.review;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReviewController {

		
		@RequestMapping(value = "/review.go", method = RequestMethod.GET)
		public String home() {
			
			return "review/reviewMain";
		}
}
