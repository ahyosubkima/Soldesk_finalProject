package com.team2.danim.plan;


import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PlanController {
	
	@RequestMapping(value = "/planMain", method = RequestMethod.GET)

	public String planMain(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "plan/planMain.jsp");
		return "home";
	}
	
	
	@RequestMapping(value = "/plan.writePlanner", method = RequestMethod.GET)
	public String planWrite(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "plan/planWrite.jsp");
		return "home";

	}
	
	
	

}
