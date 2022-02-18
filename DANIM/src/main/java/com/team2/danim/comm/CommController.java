package com.team2.danim.comm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller	
public class CommController {
	
	@RequestMapping(value = "/comm_picture", method = RequestMethod.GET)
	public String comm_picture() {
		
		return "comm/comm_picture";
	}

	@RequestMapping(value = "/comm_video", method = RequestMethod.GET)
	public String comm_video() {
		
		return "comm/comm_video";
	}
	@RequestMapping(value = "/comm_free", method = RequestMethod.GET)
	
	public String comm_free() {
		
		return "comm/comm_free";
	}
}
