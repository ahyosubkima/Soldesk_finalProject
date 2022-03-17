package com.team2.danim.plan;

import java.util.Date;

public class Plan_write {
	
			private int p_no;
			private String p_writer;
			private String p_title;
			private String p_TitleFile;
			private Date p_startDate;
			private int p_person;
			private String p_place;
			private String p_budget;
			private String p_freeWrite;
			private Date p_Writedate;
			
			public Plan_write() {
				// TODO Auto-generated constructor stub
			}

			public Plan_write(int p_no, String p_writer, String p_title, String p_TitleFile, Date p_startDate,
					int p_person, String p_place, String p_budget, String p_freeWrite, Date p_Writedate) {
				super();
				this.p_no = p_no;
				this.p_writer = p_writer;
				this.p_title = p_title;
				this.p_TitleFile = p_TitleFile;
				this.p_startDate = p_startDate;
				this.p_person = p_person;
				this.p_place = p_place;
				this.p_budget = p_budget;
				this.p_freeWrite = p_freeWrite;
				this.p_Writedate = p_Writedate;
			}

			public int getP_no() {
				return p_no;
			}

			public void setP_no(int p_no) {
				this.p_no = p_no;
			}

			public String getP_writer() {
				return p_writer;
			}

			public void setP_writer(String p_writer) {
				this.p_writer = p_writer;
			}

			public String getP_title() {
				return p_title;
			}

			public void setP_title(String p_title) {
				this.p_title = p_title;
			}

			public String getP_TitleFile() {
				return p_TitleFile;
			}

			public void setP_TitleFile(String p_TitleFile) {
				this.p_TitleFile = p_TitleFile;
			}

			public Date getP_startDate() {
				return p_startDate;
			}

			public void setP_startDate(Date p_startDate) {
				this.p_startDate = p_startDate;
			}

			public int getP_person() {
				return p_person;
			}

			public void setP_person(int p_person) {
				this.p_person = p_person;
			}

			public String getP_place() {
				return p_place;
			}

			public void setP_place(String p_place) {
				this.p_place = p_place;
			}

			public String getP_budget() {
				return p_budget;
			}

			public void setP_budget(String p_budget) {
				this.p_budget = p_budget;
			}

			public String getP_freeWrite() {
				return p_freeWrite;
			}

			public void setP_freeWrite(String p_freeWrite) {
				this.p_freeWrite = p_freeWrite;
			}

			public Date getP_Writedate() {
				return p_Writedate;
			}

			public void setP_Writedate(Date p_Writedate) {
				this.p_Writedate = p_Writedate;
			}
			
			



}
