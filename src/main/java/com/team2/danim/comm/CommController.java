package com.team2.danim.comm;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller	
public class CommController {
	
	@Autowired
	private CommDAO cDAO;
	
	@RequestMapping(value = "/comm_picture", method = RequestMethod.GET)
	public String comm_picture(HttpServletRequest req) {
		
		cDAO.getCommPicture(req);
		
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
