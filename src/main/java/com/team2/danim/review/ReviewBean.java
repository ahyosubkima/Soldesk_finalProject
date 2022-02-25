package com.team2.danim.review;

public class ReviewBean {

	private int rb_no;
	private String rb_title;
	private int rb_likecount;
	private int rb_viewcount;
	private int commentcount;
	private String rb_date;
	private String rb_text;
	
	
	public ReviewBean() {
		// TODO Auto-generated constructor stub
	}


	public ReviewBean(int rb_no, String rb_title, int rb_likecount, int rb_viewcount, int commentcount, String rb_date,
			String rb_text) {
		super();
		this.rb_no = rb_no;
		this.rb_title = rb_title;
		this.rb_likecount = rb_likecount;
		this.rb_viewcount = rb_viewcount;
		this.commentcount = commentcount;
		this.rb_date = rb_date;
		this.rb_text = rb_text;
	}


	public int getRb_no() {
		return rb_no;
	}


	public void setRb_no(int rb_no) {
		this.rb_no = rb_no;
	}


	public String getRb_title() {
		return rb_title;
	}


	public void setRb_title(String rb_title) {
		this.rb_title = rb_title;
	}


	public int getRb_likecount() {
		return rb_likecount;
	}


	public void setRb_likecount(int rb_likecount) {
		this.rb_likecount = rb_likecount;
	}


	public int getRb_viewcount() {
		return rb_viewcount;
	}


	public void setRb_viewcount(int rb_viewcount) {
		this.rb_viewcount = rb_viewcount;
	}


	public int getCommentcount() {
		return commentcount;
	}


	public void setCommentcount(int commentcount) {
		this.commentcount = commentcount;
	}


	public String getRb_date() {
		return rb_date;
	}


	public void setRb_date(String rb_date) {
		this.rb_date = rb_date;
	}


	public String getRb_text() {
		return rb_text;
	}


	public void setRb_text(String rb_text) {
		this.rb_text = rb_text;
	}
	
	
}
