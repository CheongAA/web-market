package com.mju.ict.model;

import java.util.Date;

public class Notice {
//    notice_id INT PRIMARY KEY AUTO_INCREMENT,
//    notice_title varchar(255) NOT NULL,
//    notice_writer varchar(255) default "Market" NOT NULL,
//    notice_created datetime default current_timestamp NOT NULL,
//    notice_view INT default 0 NOT NULL,
//    notice_content varchar(500) NOT NULL
	
	private int notice_id;
	private String notice_title;
	private String notice_writer;
	private Date notice_created;
	private int notice_view;
	private String notice_content;
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_writer() {
		return notice_writer;
	}
	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}
	public Date getNotice_created() {
		return notice_created;
	}
	public void setNotice_created(Date notice_created) {
		this.notice_created = notice_created;
	}
	public int getNotice_view() {
		return notice_view;
	}
	public void setNotice_view(int notice_view) {
		this.notice_view = notice_view;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	
	
}
