package com.team2.danim.review;

import java.util.List;

public interface ReviewMapper {

	public List<ReviewBean> getAllReview();

	public List<ReviewBean> getTitleJSON(ReviewBean rb);

	public List<ReviewBean> getfilterdByJSON(ReviewBean rb);

	
	
}
