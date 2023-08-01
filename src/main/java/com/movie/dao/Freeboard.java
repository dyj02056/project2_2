package com.movie.dao;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Freeboard {
	private int f_no;
	private String f_title;
	private String f_writer;
	private String f_time;
	private String f_detail;
	public Freeboard() {
		// TODO Auto-generated constructor stub
	}
	public Freeboard(int f_no, String f_title, String f_writer, String f_time, String f_detail) {
		super();
		this.f_no = f_no;
		this.f_title = f_title;
		this.f_writer = f_writer;
		this.f_time = f_time;
		this.f_detail = f_detail;
	}
	public int getF_no() {
		return f_no;
	}
	@XmlElement
	public void setF_no(int f_no) {
		this.f_no = f_no;
	}
	public String getF_title() {
		return f_title;
	}
	@XmlElement
	public void setF_title(String f_title) {
		this.f_title = f_title;
	}
	public String getF_writer() {
		return f_writer;
	}
	@XmlElement
	public void setF_writer(String f_writer) {
		this.f_writer = f_writer;
	}
	public String getF_time() {
		return f_time;
	}
	@XmlElement
	public void setF_time(String f_time) {
		this.f_time = f_time;
	}
	public String getF_detail() {
		return f_detail;
	}
	@XmlElement
	public void setF_detail(String f_detail) {
		this.f_detail = f_detail;
	}
	
}
