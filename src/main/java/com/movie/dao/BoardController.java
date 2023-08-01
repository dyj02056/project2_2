package com.movie.dao;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BoardController {
	@Autowired
	private BoardDAO bDAO;

	@RequestMapping(value = "/board.getAllFreeJSON", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	public @ResponseBody Freeboards getAllFreeJSON(HttpServletRequest req) {
		return bDAO.getAllFree(req);
	}


	@RequestMapping(value = "/board.writeFreeboard", method = RequestMethod.GET)
	public String writeFreeboard(Freeboard f, HttpServletRequest req) {
		bDAO.writeFreeboard(f, req);
		req.setAttribute("topmenu", "maintop.jsp");
		req.setAttribute("contentPage", "4.jsp");
		return "main";
	}

	
	@RequestMapping(value = "/board.freedetailJSON", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	public @ResponseBody Freeboards getFreeboardDetailJSON(Freeboard f, HttpServletRequest req) {
		req.setAttribute("f_no", 1);
		return bDAO.getFreeDetail(f, req);
	}

	
}
