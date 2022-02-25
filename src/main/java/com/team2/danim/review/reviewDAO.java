package com.team2.danim.review;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class reviewDAO {

	@Autowired
	SqlSession ss;
	
	public void getAllreview(HttpServletRequest req) {

		
		req.setAttribute("reviews", ss.getMapper(ReviewMapper.class).getAllReview());
		
	}

}
