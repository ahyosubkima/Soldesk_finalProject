package com.team2.danim.review;

import java.util.List;

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

	public AA getTitleJSON(ReviewBean rb) {

		List<ReviewBean> reviewTitles =	ss.getMapper(ReviewMapper.class).getTitleJSON(rb);
		
		AA rbs = new AA(reviewTitles);
		
		return rbs;
	}

	public AA getfilterdByJSON(ReviewBean rb) {
List<ReviewBean> reviews =	ss.getMapper(ReviewMapper.class).getfilterdByJSON(rb);
		
		AA rbs = new AA(reviews);
		
		return rbs;
	}

}
