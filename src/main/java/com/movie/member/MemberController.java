package com.movie.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.board.MovieBoardService;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO mDAO;
	
	

	@RequestMapping(value = "/member.getAllMemberJSON", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	public @ResponseBody Members getAllMemberJSON(HttpServletRequest req) { // 전체회원조회
		return mDAO.getAllMember(req);
	}

	@RequestMapping(value = "/member.reg", method = RequestMethod.GET)
	public String regMember(Member m, HttpServletRequest req) { // 회원가입
		mDAO.regMember(m, req);
		req.setAttribute("contentPage", "mainphoto.jsp");
		req.setAttribute("topmenu", "maintop.jsp");
		return "main";
	}

	@RequestMapping(value = "/member.login", method = RequestMethod.POST)
	public String login(Member m, HttpServletRequest req) { // 로그인 + 세션시작
		String k = mDAO.loginMember(m, req);
		if (k.equals("성공")) {
			HttpSession hs = req.getSession();
			hs.setMaxInactiveInterval(-1); // session의 유지시간 '#초'
			hs.setAttribute("m_id", m.getM_id());
			req.setAttribute("contentPage", "mainphoto.jsp");
			req.setAttribute("topmenu", "maintop.jsp");
			return "main";
		} else {
			req.setAttribute("contentPage", "loginfail.jsp");
			req.setAttribute("topmenu", "maintop.jsp");
			return "main";
		}
	}
	
	@RequestMapping(value="/member.logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest req) { // 로그아웃
		HttpSession hs = req.getSession();
		hs.invalidate();
		req.setAttribute("contentPage", "logout.jsp");
		req.setAttribute("topmenu", "maintop.jsp");
		return "main";
	}
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String showProfilePage(HttpServletRequest req) { 
        HttpSession session = req.getSession();
        String m_id = (String) session.getAttribute("m_id");
        Member member = mDAO.getMemberProfile(m_id);
        req.setAttribute("member", member);

        req.setAttribute("contentPage", "profile.jsp");
        req.setAttribute("topmenu", "maintop.jsp");
        return "main";
    }
}
