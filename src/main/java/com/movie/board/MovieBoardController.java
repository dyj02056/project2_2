package com.movie.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.member.Member;
import com.movie.member.MemberDAO;
import com.movie.member.Members;

@Controller
public class MovieBoardController {
	@Autowired
	private ReplyService rservice;

	@Autowired
	ReplyDAO rDAO;

	@Autowired
	private MovieBoardDAO mbDAO;

	@Autowired
	private MovieBoardService service;

	@Autowired
	private SqlSession ss;

	@Autowired
	private SqlSession ss2;

	@RequestMapping(value = "/writeBoard", method = RequestMethod.GET)
	public String writeboarddetail(HttpServletRequest req) {
		req.setAttribute("contentPage", "writeboard.jsp");
		req.setAttribute("topmenu", "maintop.jsp");
		return "main";
	}

	@RequestMapping(value = "/movieboard.reg", method = RequestMethod.POST)
	public String regMovieBoard(MovieBoard mb, HttpServletRequest req, Model model) {
		HttpSession hs = req.getSession();

		mb.setB_writter((String) hs.getAttribute("m_id"));
		mbDAO.regMovieBoard(mb, req);

		List<MovieBoard> mbs = service.listMovieBoardService();
		model.addAttribute("mbs", mbs);

		req.setAttribute("contentPage", "board.jsp");
		req.setAttribute("topmenu", "maintop.jsp");
		return "main";
	}

	@RequestMapping(value = "/Board", method = RequestMethod.GET)
	public String reviewboarddetail(HttpServletRequest req, Model model) {
		HttpSession hs = req.getSession();

		List<MovieBoard> mbs = service.listMovieBoardService();
		model.addAttribute("mbs", mbs);

		req.setAttribute("contentPage", "board.jsp");
		req.setAttribute("topmenu", "maintop.jsp");
		return "main";
	}

	@RequestMapping("/detailMovieBoard{b_no}")
	public String detailMovieBoard(HttpServletRequest req, Model model, @PathVariable("b_no") int b_no) {
		MovieBoard mb3 = service.detailMovieBoardService(b_no);
		HttpSession hs = req.getSession();
		model.addAttribute("mb3", mb3);
		hs.setAttribute("mb3", mb3);
		hs.setAttribute("mb3writter", mb3.getB_writter());

		List<Reply> rs = rservice.detailReply(b_no);
		model.addAttribute("rs", rs);

		req.setAttribute("contentPage", "boarddetail.jsp");
		req.setAttribute("topmenu", "maintop.jsp");
		return "main";
	}

	@RequestMapping("movieboard_delete{b_no}")
	public String movieboard_delete(Model model, MovieBoard mb, HttpServletRequest req,
			@PathVariable("b_no") int b_no) {
		service.deleteMovieBoardService(b_no);
		HttpSession hs = req.getSession();

		List<MovieBoard> mbs = service.listMovieBoardService();
		model.addAttribute("mbs", mbs);

		req.setAttribute("contentPage", "board.jsp");
		req.setAttribute("topmenu", "maintop.jsp");
		return "main";
	}

	@RequestMapping(value = "/updatego{b_no}", method = RequestMethod.GET)
	public String getupdate(HttpServletRequest req, Model model, @PathVariable("b_no") int b_no) throws Exception {
		MovieBoard mb2 = service.detailMovieBoardService(b_no);
		model.addAttribute("mb2", mb2);

		List<Reply> rs = rservice.listReply();
		model.addAttribute("rs", rs);

		req.setAttribute("contentPage", "boardupdate.jsp");
		req.setAttribute("topmenu", "maintop.jsp");
		return "main";
	}

	// http://localhost/board/update?b_title=tere12123&b_content=sdfa123%09123%09%09%09%09
	@RequestMapping(value = "/updateMovieBoard{b_no}", method = RequestMethod.POST)
	public String updateMovieBoard(Model model, HttpServletRequest req, @PathVariable("b_no") int b_no) {
		MovieBoard mb2 = service.detailMovieBoardService(b_no);
		model.addAttribute("mb2", mb2);
		mb2.setB_title(req.getParameter("b_title"));
		mb2.setB_content(req.getParameter("b_content"));

		List<Reply> rs = rservice.listReply();
		model.addAttribute("rs", rs);

		service.updateMovieBoard(mb2);
		List<MovieBoard> mbs = service.listMovieBoardService();
		model.addAttribute("mbs", mbs);

		req.setAttribute("contentPage", "board.jsp");
		req.setAttribute("topmenu", "maintop.jsp");
		return "main";
	}

	@RequestMapping(value = "/reply.write{b_no}", method = RequestMethod.POST)
	public String writeReply(Reply r, HttpServletRequest req, Model model, @PathVariable("b_no") int b_no) {

		MovieBoard mb3 = service.detailMovieBoardService(b_no);
		HttpSession hs = req.getSession();
		model.addAttribute("mb3", mb3);
		hs.setAttribute("mb3writter", mb3.getB_writter());
		rDAO.writeReply(r, req);

		List<Reply> rs = rservice.detailReply(b_no);
		model.addAttribute("rs", rs);

		req.setAttribute("contentPage", "boarddetail.jsp");
		req.setAttribute("topmenu", "maintop.jsp");
		return "main";
	}

	@RequestMapping("delete_reply{r_no}")
	public String deleteReply(Model model, Reply r, HttpServletRequest req,
			@PathVariable("r_no") int r_no) {

		
		rservice.deleteReply(r_no);
		
		HttpSession hs = req.getSession();
		MovieBoard mb3 = (MovieBoard) hs.getAttribute("mb3");
		hs.setAttribute("mb3writter", mb3.getB_writter());

		List<Reply> rs = rservice.detailReply(mb3.getB_no());
		model.addAttribute("rs", rs);

		req.setAttribute("contentPage", "boarddetail.jsp");
		req.setAttribute("topmenu", "maintop.jsp");
		return "main";
	}

}
