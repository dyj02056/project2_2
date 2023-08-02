package com.movie.mymovie;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.movie.member.Member;
import com.movie.member.MemberDAO;

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
//		mm.setMm_name((String)req.getAttribute("mm_name"));
//		mmDAO.regMyMovie(mm, req);
//		
//		Member member = (Member)hs.getAttribute("memberlogin");
//		req.setAttribute("member", member);
//		
	
//		List<MyMovie> mml = mservice.listMyMovie((String)hs.getAttribute("m_id"));
//		model.addAttribute("mml",mml);
//		hs.setAttribute("mml", mml);
//		
//		req.setAttribute("contentPage", "profile.jsp");
//		req.setAttribute("topmenu", "maintop.jsp");
//		return "main";
//		
//	}
	
}
