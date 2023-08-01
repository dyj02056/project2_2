package com.movie.dao;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Freeboards {
	private List<Freeboard> freeboard;

	public Freeboards() {
		// TODO Auto-generated constructor stub
	}

	public Freeboards(List<Freeboard> freeboard) {
		super();
		this.freeboard = freeboard;
	}

	public List<Freeboard> getFreeboard() {
		return freeboard;
	}

	@XmlElement
	public void setFreeboard(List<Freeboard> freeboard) {
		this.freeboard = freeboard;
	}

}
