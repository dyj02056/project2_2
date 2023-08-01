package com.movie.member;

import java.util.Date;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Member {
	private String m_id;
	private String m_password;
	private String m_name;
	private String m_email;
	public Member() {
		// TODO Auto-generated constructor stub
	}
	public Member(String m_id, String m_password, String m_name, String m_email) {
		super();
		this.m_id = m_id;
		this.m_password = m_password;
		this.m_name = m_name;
		this.m_email = m_email;
	}
	public String getM_id() {
		return m_id;
	}
	@XmlElement
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_password() {
		return m_password;
	}
	@XmlElement
	public void setM_password(String m_password) {
		this.m_password = m_password;
	}
	public String getM_name() {
		return m_name;
	}
	@XmlElement
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_email() {
		return m_email;
	}
	@XmlElement
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	
}
