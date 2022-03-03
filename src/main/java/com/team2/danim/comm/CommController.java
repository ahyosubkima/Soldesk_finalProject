package com.team2.danim.comm;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team2.danim.TokenMaker;



@Controller	
public class CommController {
	
	@Autowired
	private CommDAO cDAO;
	
	@RequestMapping(value = "/comm_picture", method = RequestMethod.GET)
	public String comm_picture(HttpServletRequest req) {
		
		cDAO.getCommPicture(req);
		
		req.setAttribute("contentPage", "comm/comm_picture.jsp");
		return "home";

	}

	@RequestMapping(value = "/comm_picture_write", method = RequestMethod.GET)
	public String comm_picture_write(HttpServletRequest req) {
		
		cDAO.getCommPicture(req);
		
		req.setAttribute("contentPage", "comm/comm_picture_write.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_picture_upload", method = RequestMethod.POST)
	public String comm_picture_upload(HttpServletRequest req) {
		
		
		TokenMaker.make(req);
		cDAO.upload(req);
		cDAO.getCommPicture(req);
		
		req.setAttribute("contentPage", "comm/comm_picture.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_picture_detail", method = RequestMethod.GET)
	public String comm_picture_detail(HttpServletRequest req,Comm_picture cp,Comm_picture_reply cpr) {
		
		TokenMaker.make(req);
		cDAO.viewPlus(cp,req);
		cDAO.getReply(cpr,req);
		cDAO.getCommPicture2(cp,req);
		
		req.setAttribute("contentPage", "comm/comm_picture_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_picture_reply", method = RequestMethod.GET)
	public String comm_picture_reply(HttpServletRequest req,Comm_picture cp,Comm_picture_reply cpr) {
		
		TokenMaker.make(req);
		cDAO.viewPlus(cp,req);
		cDAO.pictureReplyUpload(cpr,req);
		cDAO.getReply(cpr,req);
		cDAO.getCommPicture2(cp,req);
		
		req.setAttribute("contentPage", "comm/comm_picture_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_picture_good", method = RequestMethod.GET)
	public String comm_picture_good(HttpServletRequest req,Comm_picture cp) {
		
		cDAO.goodPlus(cp,req);
		cDAO.getCommPicture2(cp,req);
		
		req.setAttribute("contentPage", "comm/comm_picture_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_picture_delete", method = RequestMethod.GET)
	public String comm_picture_delete(HttpServletRequest req,Comm_picture cp) {
		
		
		cDAO.delPicture(cp,req);
		cDAO.getCommPicture(req);
		
		req.setAttribute("contentPage", "comm/comm_picture.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_picture_update", method = RequestMethod.GET)
	public String comm_picture_update(HttpServletRequest req,Comm_picture cp) {
		
		
		cDAO.getCommPicture2(cp,req);
		
		
		req.setAttribute("contentPage", "comm/comm_picture_update.jsp");
		return "home";
		
	}
	
	@RequestMapping(value = "/comm_picture_update_do", method = RequestMethod.POST)
	public String comm_picture_update_do(HttpServletRequest req,Comm_picture cp) {
		
		
		cDAO.updatePicture(cp,req);
		cDAO.getCommPicture(req);
		
		
		req.setAttribute("contentPage", "comm/comm_picture.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_picture_search", method = RequestMethod.GET)
	public String comm_picture_search(HttpServletRequest req,Comm_picture cp) {
		
		cDAO.serachPicture(cp,req);

		
		
		req.setAttribute("contentPage", "comm/comm_picture.jsp");
		return "home";
		
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
