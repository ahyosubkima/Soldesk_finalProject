package com.team2.danim.plan;

public class plan_budget {
	
	private String p_setTitle;
	private String p_setItemName;
	private int p_setPrice;

public plan_budget() {
	// TODO Auto-generated constructor stub
}

public plan_budget(String p_setTitle, String p_setItemName, int p_setPrice) {
	super();
	this.p_setTitle = p_setTitle;
	this.p_setItemName = p_setItemName;
	this.p_setPrice = p_setPrice;
}

public String getP_setTitle() {
	return p_setTitle;
}

public void setP_setTitle(String p_setTitle) {
	this.p_setTitle = p_setTitle;
}

public String getP_setItemName() {
	return p_setItemName;
}

public void setP_setItemName(String p_setItemName) {
	this.p_setItemName = p_setItemName;
}

public int getP_setPrice() {
	return p_setPrice;
}

public void setP_setPrice(int p_setPrice) {
	this.p_setPrice = p_setPrice;
}


	

}
