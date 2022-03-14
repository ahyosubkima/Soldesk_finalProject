package com.team2.danim.comm;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.team2.danim.Criteria;
import com.team2.danim.Criteria2;
import com.team2.danim.PageMakerDTO;
import com.team2.danim.PageMakerDTO2;


@Service
public class CommDAO {
	
	@Autowired
	private SqlSession ss;
	
	@Autowired
	private Criteria cri;
	
	
	public void getCommPicture(HttpServletRequest req) {
		try {
			req.setAttribute("pictures", ss.getMapper(CommMapper.class).getCommPicture());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
public void getCommPicturePaging(HttpServletRequest req,Criteria cri) {
		
	
	try {
			
		if(req.getParameter("pageNum") != null)
		{
				cri.setPageNum(Integer.parseInt(req.getParameter("pageNum")));
			}
			req.setAttribute("pictures", ss.getMapper(CommMapper.class).getCommPicturePaging(cri));
			System.out.println("불러온후");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

public void getPageMaker(HttpServletRequest req,Criteria cri) {
	
	int total = ss.getMapper(CommMapper.class).getTotal();
	
	PageMakerDTO pageMake = new PageMakerDTO(cri, total);
	req.setAttribute("pageMaker", pageMake);
	/*System.out.println(pageMake.getEndPage());
	System.out.println(pageMake.getStartPage());
	System.out.println(pageMake.getTotal());
	System.out.println("페이지메이커 실행후");
	*/
	
}

public void getPageMakerVideo(HttpServletRequest req,Criteria cri) {
	
	int total = ss.getMapper(CommMapper.class).getTotalVideo();
	
	PageMakerDTO pageMake = new PageMakerDTO(cri, total);
	req.setAttribute("pageMaker", pageMake);
	/*System.out.println(pageMake.getEndPage());
	System.out.println(pageMake.getStartPage());
	System.out.println(pageMake.getTotal());
	System.out.println("페이지메이커 실행후");
	 */
	
}

public void upload(HttpServletRequest req) {
		
	
	String path = req.getSession().getServletContext().getRealPath("resources/comm/file");
	System.out.println(path);
	MultipartRequest mr = null;
	String token = null;
	try {
		mr = new MultipartRequest(req, path, 1500 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		token = mr.getParameter("token");
		String successToken = (String) req.getSession().getAttribute("successToken");
		if (successToken != null && token.equals(successToken)) {
			String fileName = mr.getFilesystemName("comm_picture_name");
			new File(path + "/" + fileName).delete();
			return;
		}
	} catch (Exception e) {
		e.printStackTrace();
		return;
	}
	
	
	try {
		String fName = mr.getFilesystemName("comm_picture_name");
		System.out.println(mr.getParameter("comm_picture_write_name"));
		System.out.println(fName);
		System.out.println(mr.getParameter("comm_picture_txt"));
		Comm_picture cp = new Comm_picture();
		cp.setComm_picture_name(fName);
		cp.setComm_picture_txt(mr.getParameter("comm_picture_txt"));
		cp.setComm_picture_write_name(mr.getParameter("comm_picture_write_name"));
		cp.setComm_picture_writer(mr.getParameter("comm_picture_writer"));
		if (ss.getMapper(CommMapper.class).upload(cp) == 1) {
			req.getSession().setAttribute("successToken", token);
			req.setAttribute("result", "업로드성공");
		}
		
		
		//  '#{comm_picture_name}','#{comm_picture_write_name}','김진현','#{comm_picture_txt}'
	} catch (Exception e) {
		e.printStackTrace();
	/*	String fileName = mr.getFilesystemName("g_file");
		new File(path + "/" + fileName).delete();*/
		req.setAttribute("result", "업로드실패");
	}
	
	

	}

public void getCommPicture2(Comm_picture cp,HttpServletRequest req) {
	
	
	
	try {
		System.out.println(req.getParameter("no"));
		cp.setComm_picture_no(Integer.parseInt(req.getParameter("no")));
		req.setAttribute("picture", ss.getMapper(CommMapper.class).getCommPicture2(cp));
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}


public void delPicture(Comm_picture cp, HttpServletRequest req) {
	
	try {
		System.out.println(req.getParameter("no"));
		cp.setComm_picture_no(Integer.parseInt(req.getParameter("no")));
		if (ss.getMapper(CommMapper.class).delPicture(cp)==1) {
			System.out.println("삭제성공");
		}
		
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	}

public void updatePicture(Comm_picture cp, HttpServletRequest req) {
	
	String path = req.getSession().getServletContext().getRealPath("resources/comm/file");
	MultipartRequest mr = null;
	System.out.println(path);
	try {
		mr = new MultipartRequest(req, path, 1500 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		
		
		
		
		System.out.println(mr.getParameter("comm_picture_write_name"));
		System.out.println(mr.getParameter("comm_picture_txt"));
		System.out.println(mr.getParameter("comm_picture_no"));
		
		String newFile = mr.getFilesystemName("newFile");
		String oldFile = mr.getParameter("oldFile");
		
		if (newFile != null) {
			
			cp.setComm_picture_name(newFile);
			
			
		}
		else {
			cp.setComm_picture_name(oldFile);
		}
		
		cp.setComm_picture_write_name(mr.getParameter("comm_picture_write_name"));
		cp.setComm_picture_txt(mr.getParameter("comm_picture_txt"));
		cp.setComm_picture_no(Integer.parseInt(mr.getParameter("comm_picture_no")));
		if (ss.getMapper(CommMapper.class).updatePicture(cp) == 1) {
			System.out.println("수정성공");
			req.setAttribute("picture", ss.getMapper(CommMapper.class).getCommPicture2(cp));
		}
		
		
		//  '#{comm_picture_name}','#{comm_picture_write_name}','김진현','#{comm_picture_txt}'
	} catch (Exception e) {
		e.printStackTrace();
	/*	String fileName = mr.getFilesystemName("g_file");
		new File(path + "/" + fileName).delete();*/
		req.setAttribute("result", "업로드실패");
	}
		
	
		
		
	
	
	
}

public void serachPicture(Comm_picture cp, HttpServletRequest req, Criteria cri) {
	
	String search_option = req.getParameter("search_option");
	req.getSession().setAttribute("search_option", search_option);
	
	System.out.println(req.getSession().getAttribute("search_option"));
	
	if(req.getParameter("pageNum") != null)
	{
			cri.setPageNum(Integer.parseInt(req.getParameter("pageNum")));
		}
	
	if (req.getSession().getAttribute("search_option").equals("title")) {
		try {
			System.out.println(req.getParameter("search_input"));
			
			cp.setComm_picture_write_name(req.getParameter("search_input"));
			
			int total = ss.getMapper(CommMapper.class).getSearchTotal(cp);
			
			PageMakerDTO pageMake = new PageMakerDTO(cri, total);
			req.setAttribute("pageMakerTitle", pageMake);
			Map<String, String> map = new HashMap<String, String>();
			map.put("search_input", req.getParameter("search_input"));
			map.put("amount",cri.getAmount()+"");
			map.put("pageNum",cri.getPageNum()+"");
			
			
			req.setAttribute("pictures", ss.getMapper(CommMapper.class).searchTitle(map));
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	else if (req.getSession().getAttribute("search_option").equals("writer")) {
		try {
			System.out.println(req.getParameter("search_input"));
			
			cp.setComm_picture_writer(req.getParameter("search_input"));
			int total = ss.getMapper(CommMapper.class).getSearchWriterTotal(cp);
			
			PageMakerDTO pageMake = new PageMakerDTO(cri, total);
			req.setAttribute("pageMakerTitle", pageMake);
			Map<String, String> map = new HashMap<String, String>();
			map.put("search_input", req.getParameter("search_input"));
			map.put("amount",cri.getAmount()+"");
			map.put("pageNum",cri.getPageNum()+"");
			req.setAttribute("pictures", ss.getMapper(CommMapper.class).searchWriter(map));
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

	else if (req.getSession().getAttribute("search_option").equals("txt")) {
		try {
			System.out.println(req.getParameter("search_input"));
			
			cp.setComm_picture_txt(req.getParameter("search_input"));
			int total = ss.getMapper(CommMapper.class).getSearchTxtTotal(cp);
			
			PageMakerDTO pageMake = new PageMakerDTO(cri, total);
			req.setAttribute("pageMakerTitle", pageMake);
			Map<String, String> map = new HashMap<String, String>();
			map.put("search_input", req.getParameter("search_input"));
			map.put("amount",cri.getAmount()+"");
			map.put("pageNum",cri.getPageNum()+"");
			
			req.setAttribute("pictures", ss.getMapper(CommMapper.class).searchTxt(map));
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	
}

public void viewPlus(Comm_picture cp, HttpServletRequest req) {
	
	try {
	String token = (String)req.getSession().getAttribute("token"); // 디테일 진입시 생성된 토큰 값
	
	System.out.println(token);
	
	String successToken = (String) req.getSession().getAttribute("successToken");
	System.out.println(successToken + "?????????????");
	
	if(successToken == token) {
		return;
	}

	
		System.out.println(req.getParameter("no"));
		cp.setComm_picture_no(Integer.parseInt(req.getParameter("no")));
		if (ss.getMapper(CommMapper.class).viewPlus(cp)==1) {
			req.getSession().setAttribute("successToken", token);
			System.out.println("조회수증가 성공");
		}
		
	
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}

public void goodPlus(Comm_Picture_good cpg, HttpServletRequest req,Comm_picture cp) {
	
	try {
		
		String token2 = req.getParameter("token2");
		String successToken = (String) req.getSession().getAttribute("successToken");
		

		if (token2.equals(successToken)) {
			return;
		}
				
		System.out.println(req.getParameter("no"));
		cpg.setCpg_no(Integer.parseInt(req.getParameter("no")));
		cpg.setCpg_id(req.getParameter("id"));
		
		
		if (ss.getMapper(CommMapper.class).goodPlusById(cpg)==1) {
			cp.setComm_picture_no(Integer.parseInt(req.getParameter("no")));
			if (ss.getMapper(CommMapper.class).goodPlus(cp)==1) {

				System.out.println("추천수증가");
				req.getSession().setAttribute("successToken", token2);

			}
			
		}
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}

public void goodCheck(Comm_Picture_good cpg, HttpServletRequest req,Comm_picture cp) {
	
	try {
		
				
		System.out.println(req.getParameter("no"));
		System.out.println(req.getParameter("id"));
		cpg.setCpg_no(Integer.parseInt(req.getParameter("no")));
		cpg.setCpg_id(req.getParameter("id"));
		Comm_Picture_good cg = ss.getMapper(CommMapper.class).goodCheck(cpg);
		
		req.setAttribute("checked",cg); 
			System.out.println("------");
			System.out.println(cg);
			System.out.println(cg.getCpg_good());
			
		
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}


public void getReply(Comm_picture_reply cpr, HttpServletRequest req) {
	
	try {
		System.out.println(req.getParameter("no"));
		
		cpr.setCpr_cp_no(Integer.parseInt(req.getParameter("no")));
		req.setAttribute("reply", ss.getMapper(CommMapper.class).getReply(cpr));
		
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}

public void pictureReplyUpload(Comm_picture_reply cpr, HttpServletRequest req) {
	
	
	
	try {
		String token2 = req.getParameter("token2");
		String successToken = (String) req.getSession().getAttribute("successToken");
		

		if (token2.equals(successToken)) {
			return;
		}
		
		
		
		System.out.println(req.getParameter("no"));
		System.out.println(req.getParameter("cpr_txt"));
		
		cpr.setCpr_owner(req.getParameter("cpr_owner"));
		cpr.setCpr_owner_id(req.getParameter("cpr_owner_id"));
		cpr.setCpr_txt(req.getParameter("cpr_txt"));
		cpr.setCpr_cp_no(Integer.parseInt(req.getParameter("no")));
		
		if (ss.getMapper(CommMapper.class).pictureReplyUpload(cpr) == 1) {
			System.out.println("댓글등록 성공");
			req.getSession().setAttribute("successToken", token2);
		}
	
	} catch (Exception e) {
		e.printStackTrace();
	}
	System.out.println(req.getParameter("cpr_txt"));

	
}

public void delPictureReply(Comm_picture_reply cpr, HttpServletRequest req) {
	
	try {
		System.out.println(req.getParameter("no"));
		cpr.setCpr_no(Integer.parseInt(req.getParameter("no")));
		if (ss.getMapper(CommMapper.class).delPictureReply(cpr)==1) {
			System.out.println("삭제성공");
		}
		
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}

public void getGoodPicture(HttpServletRequest req) {
	
	try {
		req.setAttribute("good_pictures", ss.getMapper(CommMapper.class).getGoodPicture());
		System.out.println("굿픽쳐 실행");
		
	} catch (Exception e) {
		e.printStackTrace();
	}
}


public void goodMinus(Comm_Picture_good cpg, HttpServletRequest req, Comm_picture cp) {
	try {
		String token2 = req.getParameter("token2");
		String successToken = (String) req.getSession().getAttribute("successToken");
		

		if (token2.equals(successToken)) {
			return;
		}
		
		System.out.println(req.getParameter("no"));
		cpg.setCpg_no(Integer.parseInt(req.getParameter("no")));
		cpg.setCpg_id(req.getParameter("id"));
		
		
		if (ss.getMapper(CommMapper.class).goodMinuById(cpg)==1) {
			cp.setComm_picture_no(Integer.parseInt(req.getParameter("no")));
			if (ss.getMapper(CommMapper.class).goodMinus(cp)==1) {
				System.out.println("추천수 감소");
				req.getSession().setAttribute("successToken", token2);
			}
			
		}
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}

public void getCommVideo(HttpServletRequest req) {
	try {
		req.setAttribute("videos", ss.getMapper(CommMapper.class).getCommVideo());
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}

public void getGoodVideo(HttpServletRequest req) {
	try {
		req.setAttribute("good_videos", ss.getMapper(CommMapper.class).getGoodVideo());
		
	} catch (Exception e) {
		e.printStackTrace();
	}
}

public void videoUpload(HttpServletRequest req) {
	
	String path = req.getSession().getServletContext().getRealPath("resources/comm/file");
	System.out.println(path);
	MultipartRequest mr = null;
	String token = null;
	try {
		mr = new MultipartRequest(req, path, 1500 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		token = mr.getParameter("token");
		String successToken = (String) req.getSession().getAttribute("successToken");
		if (successToken != null && token.equals(successToken)) {
			String fileName = mr.getFilesystemName("cv_name");
			new File(path + "/" + fileName).delete();
			return;
		}
	} catch (Exception e) {
		e.printStackTrace();
		return;
	}
	
	
	try {
		String fName = mr.getFilesystemName("cv_name");
		System.out.println(mr.getParameter("cv_write_name"));
		System.out.println(fName);
		System.out.println(mr.getParameter("cv_txt"));
		Comm_video cv = new Comm_video();
		cv.setCv_name(fName);
		cv.setCv_txt(mr.getParameter("cv_txt"));
		cv.setCv_write_name(mr.getParameter("cv_write_name"));
		cv.setCv_writer(mr.getParameter("cv_writer"));
		if (ss.getMapper(CommMapper.class).videoUpload(cv) == 1) {
			req.getSession().setAttribute("successToken", token);
			req.setAttribute("result", "업로드성공");
		}
		
		
		//  '#{comm_picture_name}','#{comm_picture_write_name}','김진현','#{comm_picture_txt}'
	} catch (Exception e) {
		e.printStackTrace();
	/*	String fileName = mr.getFilesystemName("g_file");
		new File(path + "/" + fileName).delete();*/
		req.setAttribute("result", "업로드실패");
	}
	
	
}

public void viewVideoPlus(Comm_video cv, HttpServletRequest req) {
	
	try {
		String token = (String)req.getSession().getAttribute("token"); // 디테일 진입시 생성된 토큰 값
		
		System.out.println(token);
		
		String successToken = (String) req.getSession().getAttribute("successToken");
		System.out.println(successToken + "?????????????");
		
		if(successToken == token) {
			return;
		}

		
			System.out.println(req.getParameter("no"));
			cv.setCv_no(Integer.parseInt(req.getParameter("no")));
			if (ss.getMapper(CommMapper.class).viewVideoPlus(cv)==1) {
				req.getSession().setAttribute("successToken", token);
				System.out.println("조회수증가 성공");
			}
			
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	
}

public void goodVideoCheck(Comm_Video_good cvg, HttpServletRequest req, Comm_video cv) {
	try {
		
		
		System.out.println(req.getParameter("no"));
		System.out.println(req.getParameter("id"));
		cvg.setCvg_no(Integer.parseInt(req.getParameter("no")));
		cvg.setCvg_id(req.getParameter("id"));
		Comm_Video_good cvgg = ss.getMapper(CommMapper.class).goodVideoCheck(cvg);
		
		req.setAttribute("checked",cvgg); 
			System.out.println("------");
			System.out.println(cvg);
			System.out.println(cvg.getCvg_good());
			
		
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}

public void getVideoReply(Comm_Video_reply cvr, HttpServletRequest req) {
	try {
		System.out.println(req.getParameter("no"));
		
		cvr.setCvr_cv_no(Integer.parseInt(req.getParameter("no")));
		req.setAttribute("reply", ss.getMapper(CommMapper.class).getVideoReply(cvr));
		
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}

public void getCommVideo2(Comm_video cv, HttpServletRequest req) {
	try {
		System.out.println(req.getParameter("no"));
		cv.setCv_no(Integer.parseInt(req.getParameter("no")));
		req.setAttribute("video", ss.getMapper(CommMapper.class).getCommVideo2(cv));
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}

public void getCommVideoPaging(HttpServletRequest req, Criteria cri2) {
	
	try {
		
		if(req.getParameter("pageNum") != null)
		{
				cri.setPageNum(Integer.parseInt(req.getParameter("pageNum")));
			}
			req.setAttribute("videos", ss.getMapper(CommMapper.class).getCommVideoPaging(cri));
			System.out.println("불러온후");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
}

public void serachVideo(Comm_video cv, HttpServletRequest req, Criteria cri2) {
	String search_option = req.getParameter("search_option");
	req.getSession().setAttribute("search_option", search_option);
	
	System.out.println(req.getSession().getAttribute("search_option"));
	
	if(req.getParameter("pageNum") != null)
	{
			cri.setPageNum(Integer.parseInt(req.getParameter("pageNum")));
		}
	
	if (req.getSession().getAttribute("search_option").equals("title")) {
		try {
			System.out.println(req.getParameter("search_input"));
			
			cv.setCv_write_name(req.getParameter("search_input"));
			
			int total = ss.getMapper(CommMapper.class).getSearchTotalVideo(cv);
			
			PageMakerDTO pageMake = new PageMakerDTO(cri, total);
			req.setAttribute("pageMakerTitle", pageMake);
			Map<String, String> map = new HashMap<String, String>();
			map.put("search_input", req.getParameter("search_input"));
			map.put("amount",cri.getAmount()+"");
			map.put("pageNum",cri.getPageNum()+"");
			
			
			req.setAttribute("videos", ss.getMapper(CommMapper.class).searchTitleVideo(map));
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	else if (req.getSession().getAttribute("search_option").equals("writer")) {
		try {
			System.out.println(req.getParameter("search_input"));
			
			cv.setCv_writer(req.getParameter("search_input"));
			int total = ss.getMapper(CommMapper.class).getSearchWriterTotalVideo(cv);
			
			PageMakerDTO pageMake = new PageMakerDTO(cri, total);
			req.setAttribute("pageMakerTitle", pageMake);
			Map<String, String> map = new HashMap<String, String>();
			map.put("search_input", req.getParameter("search_input"));
			map.put("amount",cri.getAmount()+"");
			map.put("pageNum",cri.getPageNum()+"");
			req.setAttribute("videos", ss.getMapper(CommMapper.class).searchWriterVideo(map));
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

	else if (req.getSession().getAttribute("search_option").equals("txt")) {
		try {
			System.out.println(req.getParameter("search_input"));
			
			cv.setCv_txt(req.getParameter("search_input"));
			int total = ss.getMapper(CommMapper.class).getSearchTxtTotalVideo(cv);
			
			PageMakerDTO pageMake = new PageMakerDTO(cri, total);
			req.setAttribute("pageMakerTitle", pageMake);
			Map<String, String> map = new HashMap<String, String>();
			map.put("search_input", req.getParameter("search_input"));
			map.put("amount",cri.getAmount()+"");
			map.put("pageNum",cri.getPageNum()+"");
			
			req.setAttribute("videos", ss.getMapper(CommMapper.class).searchTxtVideo(map));
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
	
		}	
 	}

public void delVideo(Comm_video cv, HttpServletRequest req) {
	
	try {
		System.out.println(req.getParameter("no"));
		cv.setCv_no(Integer.parseInt(req.getParameter("no")));
		if (ss.getMapper(CommMapper.class).delVideo(cv)==1) {
			System.out.println("삭제성공");
		}
		
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
}

public void updateVideo(Comm_video cv, HttpServletRequest req) {
	String path = req.getSession().getServletContext().getRealPath("resources/comm/file");
	MultipartRequest mr = null;
	System.out.println(path);
	try {
		mr = new MultipartRequest(req, path, 1500 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		
		
		
		
		System.out.println(mr.getParameter("cv_name"));
		System.out.println(mr.getParameter("cv_txt"));
		System.out.println(mr.getParameter("cv_no"));
		
		String newFile = mr.getFilesystemName("newFile");
		String oldFile = mr.getParameter("oldFile");
		
		if (newFile != null) {
			
			cv.setCv_name(newFile);
			
			
		}
		else {
			cv.setCv_name(oldFile);
		}
		
		cv.setCv_write_name(mr.getParameter("cv_write_name"));
		cv.setCv_txt(mr.getParameter("cv_txt"));
		cv.setCv_no(Integer.parseInt(mr.getParameter("cv_no")));
		if (ss.getMapper(CommMapper.class).updateVideo(cv) == 1) {
			System.out.println("수정성공");
			req.setAttribute("video", ss.getMapper(CommMapper.class).getCommVideo2(cv));
		}
		
		
		//  '#{comm_picture_name}','#{comm_picture_write_name}','김진현','#{comm_picture_txt}'
	} catch (Exception e) {
		e.printStackTrace();
	/*	String fileName = mr.getFilesystemName("g_file");
		new File(path + "/" + fileName).delete();*/
		req.setAttribute("result", "업로드실패");
	}
}

public void videoReplyUpload(Comm_Video_reply cvr, HttpServletRequest req) {
	
	try {
		String token2 = req.getParameter("token2");
		String successToken = (String) req.getSession().getAttribute("successToken");
		

		if (token2.equals(successToken)) {
			return;
		}
		
		
		
		System.out.println(req.getParameter("no"));
		System.out.println(req.getParameter("cvr_txt"));
		
		cvr.setCvr_owner(req.getParameter("cvr_owner"));
		cvr.setCvr_owner_id(req.getParameter("cvr_owner_id"));
		cvr.setCvr_txt(req.getParameter("cvr_txt"));
		cvr.setCvr_cv_no(Integer.parseInt(req.getParameter("no")));
		
		if (ss.getMapper(CommMapper.class).videoReplyUpload(cvr) == 1) {
			System.out.println("댓글등록 성공");
			req.getSession().setAttribute("successToken", token2);
		}
	
	} catch (Exception e) {
		e.printStackTrace();
	}
	System.out.println(req.getParameter("cpr_txt"));

}

public void delVideoReply(Comm_Video_reply cvr, HttpServletRequest req) {
	try {
		System.out.println(req.getParameter("no"));
		cvr.setCvr_no(Integer.parseInt(req.getParameter("no")));
		if (ss.getMapper(CommMapper.class).delVideoReply(cvr)==1) {
			System.out.println("삭제성공");
		}
		
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}

public void goodVideoPlus(Comm_Video_good cvg, HttpServletRequest req, Comm_video cv) {
	
try {
		
		String token2 = req.getParameter("token2");
		String successToken = (String) req.getSession().getAttribute("successToken");
		

		if (token2.equals(successToken)) {
			return;
		}
				
		System.out.println(req.getParameter("no"));
		cvg.setCvg_no(Integer.parseInt(req.getParameter("no")));
		cvg.setCvg_id(req.getParameter("id"));
		
		
		if (ss.getMapper(CommMapper.class).goodVideoPlusById(cvg)==1) {
			cv.setCv_no(Integer.parseInt(req.getParameter("no")));
			if (ss.getMapper(CommMapper.class).goodVideoPlus(cv)==1) {
				System.out.println("추천수증가");
				req.getSession().setAttribute("successToken", token2);
			}
			
		}
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
}

public void goodVideoMinus(Comm_Video_good cvg, HttpServletRequest req, Comm_video cv) {
	
	try {
		String token2 = req.getParameter("token2");
		String successToken = (String) req.getSession().getAttribute("successToken");
		

		if (token2.equals(successToken)) {
			return;
		}
		
		System.out.println(req.getParameter("no"));
		cvg.setCvg_no(Integer.parseInt(req.getParameter("no")));
		cvg.setCvg_id(req.getParameter("id"));
	
		
		if (ss.getMapper(CommMapper.class).goodVideoMinuById(cvg)==1) {
			cv.setCv_no(Integer.parseInt(req.getParameter("no")));
			if (ss.getMapper(CommMapper.class).goodVideoMinus(cv)==1) {
				System.out.println("추천수 감소");
				req.getSession().setAttribute("successToken", token2);
			}
			
		}
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
}

public void getFreePageMaker(HttpServletRequest req, Criteria2 cri2) {
int total = ss.getMapper(CommMapper.class).getFreeTotal();
	
	PageMakerDTO2 pageMake = new PageMakerDTO2(cri2, total);
	req.setAttribute("pageMaker", pageMake);
	
	
}

public void getCommFreePaging(HttpServletRequest req, Criteria2 cri2) {

	try {
			
		if(req.getParameter("pageNum") != null)
		{
				cri.setPageNum(Integer.parseInt(req.getParameter("pageNum")));
			}
			req.setAttribute("frees", ss.getMapper(CommMapper.class).getCommFreePaging(cri2));
			System.out.println("불러온후");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
}


}



	
