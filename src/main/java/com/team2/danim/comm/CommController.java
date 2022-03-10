package com.team2.danim.comm;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team2.danim.Criteria;
import com.team2.danim.PageMakerDTO;
import com.team2.danim.TokenMaker;



@Controller	
public class CommController {
	
	@Autowired
	private CommDAO cDAO;
	
	
	/*@RequestMapping(value = "/comm_picture", method = RequestMethod.GET)
	public String comm_picture(HttpServletRequest req) {
		TokenMaker.make(req);
		cDAO.getCommPicture(req);
		cDAO.getPicture(req);
		
		req.setAttribute("contentPage", "comm/comm_picture.jsp");
		return "home";

	}*/


	@RequestMapping(value = "/comm_picture_page", method = RequestMethod.GET)
	public String comm_picture_page(HttpServletRequest req,Criteria cri) {
		TokenMaker.make(req);
		cDAO.getPageMaker(req, cri);
		cDAO.getCommPicturePaging(req, cri);
		cDAO.getGoodPicture(req);
		
		req.setAttribute("contentPage", "comm/comm_picture.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_video_page", method = RequestMethod.GET)
	public String comm_video_page(HttpServletRequest req,Criteria cri) {
		TokenMaker.make(req);
		cDAO.getPageMakerVideo(req, cri);
		cDAO.getCommVideoPaging(req, cri);
		cDAO.getGoodVideo(req);
		
		req.setAttribute("contentPage", "comm/comm_video.jsp");
		return "home";
		
	}

	

	@RequestMapping(value = "/comm_picture_write", method = RequestMethod.GET)
	public String comm_picture_write(HttpServletRequest req) {
		
		
		req.setAttribute("contentPage", "comm/comm_picture_write.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_video_write", method = RequestMethod.GET)
	public String comm_video_write(HttpServletRequest req) {
		
		cDAO.getCommPicture(req);
		
		req.setAttribute("contentPage", "comm/comm_video_write.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_picture_upload", method = RequestMethod.POST)
	public String comm_picture_upload(HttpServletRequest req,Criteria cri) {
		
		
		TokenMaker.make(req);
		cDAO.upload(req);
		cDAO.getPageMaker(req, cri);
		cDAO.getCommPicturePaging(req, cri);
		cDAO.getGoodPicture(req);
		
		req.setAttribute("contentPage", "comm/comm_picture.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_video_upload", method = RequestMethod.POST)
	public String comm_video_upload(HttpServletRequest req) {
		
		
		TokenMaker.make(req);
		cDAO.videoUpload(req);
		cDAO.getCommVideo(req);
		cDAO.getGoodVideo(req);
		
		req.setAttribute("contentPage", "comm/comm_video.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_picture_detail", method = RequestMethod.GET)
	public String comm_picture_detail(HttpServletRequest req,Comm_picture cp,Comm_picture_reply cpr,Comm_Picture_good cpg) {
			
		cDAO.viewPlus(cp,req);
		cDAO.goodCheck(cpg, req, cp);
		cDAO.getReply(cpr,req);
		cDAO.getCommPicture2(cp,req);
		
		req.setAttribute("contentPage", "comm/comm_picture_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_video_detail", method = RequestMethod.GET)
	public String comm_video_detail(HttpServletRequest req,Comm_video cv,Comm_Video_reply cvr,Comm_Video_good cvg) {
		
		cDAO.viewVideoPlus(cv,req);
		cDAO.goodVideoCheck(cvg, req, cv);
		cDAO.getVideoReply(cvr,req);
		cDAO.getCommVideo2(cv,req);
		
		req.setAttribute("contentPage", "comm/comm_video_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_picture_reply", method = RequestMethod.GET)
	public String comm_picture_reply(HttpServletRequest req,Comm_picture cp,Comm_picture_reply cpr) {
		
		TokenMaker.make2(req);
		cDAO.pictureReplyUpload(cpr,req);
		cDAO.getReply(cpr,req);
		cDAO.getCommPicture2(cp,req);
		
		req.setAttribute("contentPage", "comm/comm_picture_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_video_reply", method = RequestMethod.GET)
	public String comm_video_reply(HttpServletRequest req,Comm_video cv,Comm_Video_reply cvr) {
		
		TokenMaker.make2(req);
		cDAO.videoReplyUpload(cvr,req);
		cDAO.getVideoReply(cvr,req);
		cDAO.getCommVideo2(cv,req);
		
		req.setAttribute("contentPage", "comm/comm_video_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_picture_good", method = RequestMethod.GET)
	public String comm_picture_good(HttpServletRequest req,Comm_picture cp,Comm_picture_reply cpr,Comm_Picture_good cpg) {
		
		TokenMaker.make2(req);
		cDAO.goodPlus(cpg,req,cp);
		cDAO.goodCheck(cpg, req, cp);
		cDAO.getReply(cpr,req);
		cDAO.getCommPicture2(cp,req);
		
		req.setAttribute("contentPage", "comm/comm_picture_detail.jsp");
		return "home";
		
}

	@RequestMapping(value = "/comm_video_Nogood", method = RequestMethod.GET)
	public String comm_video_Nogood(HttpServletRequest req,Comm_video cv,Comm_Video_reply cvr,Comm_Video_good cvg) {
		
		TokenMaker.make2(req);
		cDAO.goodVideoMinus(cvg,req,cv);
		cDAO.goodVideoCheck(cvg, req, cv);
		cDAO.getVideoReply(cvr,req);
		cDAO.getCommVideo2(cv,req);
		
		req.setAttribute("contentPage", "comm/comm_video_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_video_good", method = RequestMethod.GET)
	public String comm_video_good(HttpServletRequest req,Comm_video cv,Comm_Video_reply cvr,Comm_Video_good cvg) {
		
		TokenMaker.make2(req);
		cDAO.goodVideoPlus(cvg,req,cv);
		cDAO.goodVideoCheck(cvg, req, cv);
		cDAO.getVideoReply(cvr,req);
		cDAO.getCommVideo2(cv,req);
		
		req.setAttribute("contentPage", "comm/comm_video_detail.jsp");
		return "home";
		
	}
	
	@RequestMapping(value = "/comm_picture_Nogood", method = RequestMethod.GET)
	public String comm_picture_Nogood(HttpServletRequest req,Comm_picture cp,Comm_picture_reply cpr,Comm_Picture_good cpg) {
		
		TokenMaker.make2(req);
		cDAO.goodMinus(cpg,req,cp);
		cDAO.goodCheck(cpg, req, cp);
		cDAO.getReply(cpr,req);
		cDAO.getCommPicture2(cp,req);
		
		req.setAttribute("contentPage", "comm/comm_picture_detail.jsp");
		return "home";
		
	}
	

	@RequestMapping(value = "/comm_picture_delete", method = RequestMethod.GET)
	public String comm_picture_delete(HttpServletRequest req,Comm_picture cp,Criteria cri) {
		
		
		cDAO.delPicture(cp,req);
		cDAO.getPageMaker(req, cri);
		cDAO.getCommPicturePaging(req, cri);
		cDAO.getGoodPicture(req);
		
		req.setAttribute("contentPage", "comm/comm_picture.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_video_delete", method = RequestMethod.GET)
	public String comm_video_delete(HttpServletRequest req,Comm_video cv,Criteria cri) {
		
		
		cDAO.delVideo(cv,req);
		cDAO.getPageMakerVideo(req, cri);
		cDAO.getCommVideoPaging(req, cri);
		cDAO.getGoodVideo(req);
		
		req.setAttribute("contentPage", "comm/comm_video.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_picture_reply_delete", method = RequestMethod.GET)
	public String comm_picture_reply_delete(HttpServletRequest req,Comm_picture cp,Comm_picture_reply cpr) {
		
		
		cDAO.delPictureReply(cpr,req);
		cDAO.getReply(cpr,req);
		cDAO.getCommPicture2(cp,req);
		
		req.setAttribute("contentPage", "comm/comm_picture_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_video_reply_delete", method = RequestMethod.GET)
	public String comm_video_reply_delete(HttpServletRequest req,Comm_video cv,Comm_Video_reply cvr) {
		
		
		cDAO.delVideoReply(cvr,req);
		cDAO.getVideoReply(cvr,req);
		cDAO.getCommVideo2(cv,req);
		
		req.setAttribute("contentPage", "comm/comm_video_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_picture_update", method = RequestMethod.GET)
	public String comm_picture_update(HttpServletRequest req,Comm_picture cp) {
		
		
		cDAO.getCommPicture2(cp,req);
		
		
		req.setAttribute("contentPage", "comm/comm_picture_update.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_video_update", method = RequestMethod.GET)
	public String comm_video_update(HttpServletRequest req,Comm_video cv) {
		
		
		cDAO.getCommVideo2(cv,req);
		
		
		req.setAttribute("contentPage", "comm/comm_video_update.jsp");
		return "home";
		
	}
	
	@RequestMapping(value = "/comm_picture_update_do", method = RequestMethod.POST)
	public String comm_picture_update_do(HttpServletRequest req,Comm_picture cp) {
		
		
		cDAO.updatePicture(cp,req);
		
		
		req.setAttribute("contentPage", "comm/comm_picture_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_video_update_do", method = RequestMethod.POST)
	public String comm_video_update_do(HttpServletRequest req,Comm_video cv) {
		
		
		cDAO.updateVideo(cv,req);
		
		
		req.setAttribute("contentPage", "comm/comm_video_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_picture_search", method = RequestMethod.GET)
	public String comm_picture_search(HttpServletRequest req,Comm_picture cp,Criteria cri) {
		
		cDAO.serachPicture(cp,req,cri);

		
		
		req.setAttribute("contentPage", "comm/comm_picture.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_video_search", method = RequestMethod.GET)
	public String comm_video_search(HttpServletRequest req,Comm_video cv,Criteria cri) {
		
		cDAO.serachVideo(cv,req,cri);
		
		
		
		req.setAttribute("contentPage", "comm/comm_video.jsp");
		return "home";
		
	}
	
	
	@RequestMapping(value = "/comm_video", method = RequestMethod.GET)
	public String comm_video(HttpServletRequest req) {
		TokenMaker.make(req);
		cDAO.getCommVideo(req);
		cDAO.getGoodVideo(req);
		req.setAttribute("contentPage", "comm/comm_video.jsp");
		
		return "home";
		
	}
	@RequestMapping(value = "/comm_free", method = RequestMethod.GET)
	
	public String comm_free(HttpServletRequest req) {
		TokenMaker.make(req);
		
		
		req.setAttribute("contentPage", "comm/comm_free.jsp");
		
		return "home";

	}
	
	
	
}
