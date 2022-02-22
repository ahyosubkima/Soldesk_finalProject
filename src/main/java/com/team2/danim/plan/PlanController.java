package com.team2.danim.plan;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PlanController {
	
	@RequestMapping(value = "/planMain", method = RequestMethod.GET)
	public String home() {
		
		return "plan/planMain";
	}
	
	
	

}
