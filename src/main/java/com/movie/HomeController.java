package com.movie;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class HomeController {


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		req.setAttribute("contentPage", "mainphoto.jsp");
		req.setAttribute("topmenu", "maintop.jsp");
		return "main";
	}

	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(HttpServletRequest req) {
		req.setAttribute("contentPage", "mainphoto.jsp");
		req.setAttribute("topmenu", "maintop.jsp");
		return "main";
	}

	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletRequest req) {
		req.setAttribute("contentPage", "login.jsp");
		req.setAttribute("topmenu", "maintop.jsp");
		return "main";
	}

	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(HttpServletRequest req) {
		req.setAttribute("contentPage", "signup.jsp");
		req.setAttribute("topmenu", "maintop.jsp");
		return "main";
	}

	@RequestMapping(value = "/Information", method = RequestMethod.GET)
	public String freeboard(HttpServletRequest req) {
		req.setAttribute("contentPage", "Information.jsp");
		req.setAttribute("topmenu", "maintop.jsp");
		return "main";
	}
	
	@RequestMapping(value = "/2", method = RequestMethod.GET)
	public String noticeboard(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "2.jsp");
		req.setAttribute("topmenu", "maintop.jsp");
		return "main";
	}




	

	
	@RequestMapping(value = "/movieSearch", method = RequestMethod.GET)
	public String transferboard(HttpServletRequest req) {
		req.setAttribute("contentPage", "movieSearch.jsp");
		req.setAttribute("topmenu", "maintop.jsp");
		return "main";
	}
	@RequestMapping(value = "/BoxOffice", method = RequestMethod.GET)
	public String transboxoffice(HttpServletRequest req) {
		req.setAttribute("contentPage", "movieList.jsp");
		req.setAttribute("topmenu", "maintop.jsp");
		return "main";
	}



	
	
	



}
