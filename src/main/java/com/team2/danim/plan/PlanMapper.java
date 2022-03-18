package com.team2.danim.plan;

import java.util.List;

public interface PlanMapper {

	//게시물 등록
	int uploadPlan(Plan_write pw);

	//게시물 전체 조회
	List<Plan_write> getAllPlan();
	
	//게시물 한개 조회
	Object getPlan(int p_no);
	


}
