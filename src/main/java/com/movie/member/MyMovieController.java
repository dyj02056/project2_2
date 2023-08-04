package com.movie.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@Autowired
	private MemberDAO mDAO1;
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String showProfilePage(HttpServletRequest req,Model model) { 
        HttpSession session = req.getSession();
        String m_id = (String) session.getAttribute("m_id");
        Member member = mDAO1.getMemberProfile(m_id);
        req.setAttribute("member", member);
        session.setAttribute("member",member);
        
        List<MyMovie> mml = mservice.listMyMovie((String)session.getAttribute("m_id"));
		model.addAttribute("mml",mml);
        
        req.setAttribute("contentPage", "profile.jsp");
        req.setAttribute("topmenu", "maintop.jsp");
        return "main";
    }
	
	
	@RequestMapping(value="/mymovie.reg", method=RequestMethod.GET)
	public String regMyMovie(MyMovie mm, HttpServletRequest req, Model model) {
		HttpSession hs = req.getSession();
		mm.setMm_id((String) hs.getAttribute("m_id"));
		mmDAO.regMyMovie(mm, req);
		
		Member member = (Member)hs.getAttribute("memberlogin");
		req.setAttribute("member", member);
		
	
		List<MyMovie> mml = mservice.listMyMovie((String)hs.getAttribute("m_id"));
		model.addAttribute("mml",mml);

		
		req.setAttribute("contentPage", "profile.jsp");
		req.setAttribute("topmenu", "maintop.jsp");
		return "main";
		
	}
	
	@RequestMapping(value="mymovie_delete{mm_no}", method=RequestMethod.GET)
	public String deleteMyMovie(HttpServletRequest req,
		Model model, MyMovie mm,  @PathVariable("mm_no") int mm_no) {
		mservice.deleteMyMovie(mm_no);
		HttpSession hs = req.getSession();
		mm.setMm_id((String) hs.getAttribute("m_id"));
		
		Member member = (Member)hs.getAttribute("memberlogin");
		req.setAttribute("member", member);
		
		List<MyMovie> mml = mservice.listMyMovie((String)hs.getAttribute("m_id"));
		model.addAttribute("mml",mml);
		hs.setAttribute("mml", mml);
		
		req.setAttribute("contentPage", "profile.jsp");
		req.setAttribute("topmenu", "maintop.jsp");
		return "main";
	}
	
}
