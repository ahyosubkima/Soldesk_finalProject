package com.team2.danim.comm;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class CommDAO {
	
	@Autowired
	SqlSession ss;
	
	public void getCommPicture(HttpServletRequest req) {
		try {
			req.setAttribute("pictures", ss.getMapper(CommMapper.class).getCommPicture());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
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
			req.setAttribute("result", "수정성공");
		}
		
		
		//  '#{comm_picture_name}','#{comm_picture_write_name}','김진현','#{comm_picture_txt}'
	} catch (Exception e) {
		e.printStackTrace();
	/*	String fileName = mr.getFilesystemName("g_file");
		new File(path + "/" + fileName).delete();*/
		req.setAttribute("result", "업로드실패");
	}
		
	
		
		
	
	
	
}

public void serachPicture(Comm_picture cp, HttpServletRequest req) {
	
	if (req.getParameter("search_option").equals("title")) {
		try {
			System.out.println(req.getParameter("search_input"));
			
			cp.setComm_picture_write_name(req.getParameter("search_input"));
			
			req.setAttribute("pictures", ss.getMapper(CommMapper.class).searchTitle(cp));
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	else if (req.getParameter("search_option").equals("writer")) {
		try {
			System.out.println(req.getParameter("search_input"));
			
			cp.setComm_picture_writer(req.getParameter("search_input"));
			
			req.setAttribute("pictures", ss.getMapper(CommMapper.class).searchWriter(cp));
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

	else if (req.getParameter("search_option").equals("txt")) {
		try {
			System.out.println(req.getParameter("search_input"));
			
			cp.setComm_picture_txt(req.getParameter("search_input"));
			
			req.setAttribute("pictures", ss.getMapper(CommMapper.class).searchTxt(cp));
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	
}

public void viewPlus(Comm_picture cp, HttpServletRequest req) {
	
	try {
		
	String token = req.getParameter("token");
	String successToken = (String) req.getSession().getAttribute("successToken");

	if (token.equals(successToken)) {
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

public void goodPlus(Comm_picture cp, HttpServletRequest req) {
	
	try {
		System.out.println(req.getParameter("no"));
		cp.setComm_picture_no(Integer.parseInt(req.getParameter("no")));
		if (ss.getMapper(CommMapper.class).goodPlus(cp)==1) {
			System.out.println("추천수증가 성공");
		}
		
		
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
		
		System.out.println(req.getParameter("cpr_txt"));
		System.out.println(req.getParameter("cpr_cp_no"));
		
		cpr.setCpr_txt(req.getParameter("cpr_txt"));
		cpr.setCpr_cp_no(Integer.parseInt(req.getParameter("cpr_cp_no")));
		
		if (ss.getMapper(CommMapper.class).pictureReplyUpload(cpr) == 1) {
			System.out.println("댓글등록 성공");
		}
		
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	
	
	
	
	
	
	
	
}


}