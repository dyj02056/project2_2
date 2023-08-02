package com.movie.mymovie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyMovieController {

	@Autowired
	private MyMovieService mservice;
	
	@Autowired
	private MyMovieDAO mmDAO;
	
	@Autowired
	private SqlSession ss3;
	
//	@RequestMapping(value="/mymovie.reg", method=RequestMethod.GET)
//	public String regMyMovie(MyMovie mm, HttpServletRequest req, Model model) {
//		HttpSession hs = req.getSession();
//		mm.setMm_id((String)hs.getAttribute("m_id"));
//		
//		mmDAO.regMyMovie(mm, req);
//		
//		
//	}
	
}
