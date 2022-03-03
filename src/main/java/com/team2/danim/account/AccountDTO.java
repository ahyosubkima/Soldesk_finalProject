package com.team2.danim.account;

public class AccountDTO {

	private String d_id;
	private String d_pw;
	private String d_name;
	private String d_nickname;
	private String d_addr;
	
	public AccountDTO() {
	
	}

	public AccountDTO(String d_id, String d_pw, String d_name, String d_nickname, String d_addr) {
		super();
		this.d_id = d_id;
		this.d_pw = d_pw;
		this.d_name = d_name;
		this.d_nickname = d_nickname;
		this.d_addr = d_addr;
	}

	public String getD_id() {
		return d_id;
	}

	public void setD_id(String d_id) {
		this.d_id = d_id;
	}

	public String getD_pw() {
		return d_pw;
	}

	public void setD_pw(String d_pw) {
		this.d_pw = d_pw;
	}

	public String getD_name() {
		return d_name;
	}

	public void setD_name(String d_name) {
		this.d_name = d_name;
	}

	public String getD_nickname() {
		return d_nickname;
	}

	public void setD_nickname(String d_nickname) {
		this.d_nickname = d_nickname;
	}

	public String getD_addr() {
		return d_addr;
	}

	public void setD_addr(String d_addr) {
		this.d_addr = d_addr;
	}
	
	
	
}
