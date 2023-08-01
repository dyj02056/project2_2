package com.movie.board;



import java.util.Date;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class MovieBoard {
	private int b_no;
	private String b_title;
	private String b_content;
	private String b_writter;
	private Date b_when;
	public MovieBoard() {
		// TODO Auto-generated constructor stub
	}
	public MovieBoard(int b_no, String b_title, String b_content, String b_writter, Date b_when) {
		super();
		this.b_no = b_no;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_writter = b_writter;
		this.b_when = b_when;
	}
	public int getB_no() {
		return b_no;
	}
	@XmlElement
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_title() {
		return b_title;
	}
	@XmlElement
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	@XmlElement
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_writter() {
		return b_writter;
	}
	@XmlElement
	public void setB_writter(String b_writter) {
		this.b_writter = b_writter;
	}
	public Date getB_when() {
		return b_when;
	}
	@XmlElement
	public void setB_when(Date b_when) {
		this.b_when = b_when;
	}
	
	
}
