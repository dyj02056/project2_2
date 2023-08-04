package com.movie.member;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class MyMovie {
	private int mm_no;
	private String mm_id;
	private String mm_name;
	public MyMovie() {
		// TODO Auto-generated constructor stub
	}
	public MyMovie(int mm_no, String mm_id, String mm_name) {
		super();
		this.mm_no = mm_no;
		this.mm_id = mm_id;
		this.mm_name = mm_name;
	}
	public int getMm_no() {
		return mm_no;
	}
	@XmlElement
	public void setMm_no(int mm_no) {
		this.mm_no = mm_no;
	}
	public String getMm_id() {
		return mm_id;
	}
	@XmlElement
	public void setMm_id(String mm_id) {
		this.mm_id = mm_id;
	}
	public String getMm_name() {
		return mm_name;
	}
	@XmlElement
	public void setMm_name(String mm_name) {
		this.mm_name = mm_name;
	}
	
}
