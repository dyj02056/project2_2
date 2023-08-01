package com.movie.board;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Reply {
	private int r_no;
	private int b_no;
	private String r_content;
	private String r_writter;
	public Reply() {
		// TODO Auto-generated constructor stub
	}
	public Reply(int r_no, int b_no, String r_content, String r_writter) {
		super();
		this.r_no = r_no;
		this.b_no = b_no;
		this.r_content = r_content;
		this.r_writter = r_writter;
	}
	public int getR_no() {
		return r_no;
	}
	@XmlElement
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getB_no() {
		return b_no;
	}
	@XmlElement
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getR_content() {
		return r_content;
	}
	@XmlElement
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getR_writter() {
		return r_writter;
	}
	@XmlElement
	public void setR_writter(String r_writter) {
		this.r_writter = r_writter;
	}
	
}
