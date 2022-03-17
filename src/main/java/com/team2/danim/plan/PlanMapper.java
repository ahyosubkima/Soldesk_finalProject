package com.team2.danim.plan;

import java.util.List;

public interface PlanMapper {

	int upload(Plan_write pw);

	List<Plan_write> getAllPlan();
	


}
