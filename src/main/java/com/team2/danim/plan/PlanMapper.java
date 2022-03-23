package com.team2.danim.plan;

import java.util.List;
import com.team2.danim.Criteria3;

public interface PlanMapper {

	//게시물 등록
	int uploadPlan(Plan_write pw);

	//게시물 전체 조회
	List<Plan_write> getAllPlan();
	
	//게시물 한개 조회
	Object getPlan(int p_no);

	public int getTotalPlan();
	
	public List<Plan_write> getPlanPaging(Criteria3 cri3);
	

}
