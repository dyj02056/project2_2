package com.movie.search;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SearchController {
	
	
//	@RequestMapping(value = "/movieSearch", method = RequestMethod.GET)
//	public String transferboard(HttpServletRequest req) {
//		req.setAttribute("contentPage", "movieSearch.jsp");
//		req.setAttribute("topmenu", "maintop.jsp");
//		return "main";
//	}
	
	@RequestMapping(value="/search")
	public String movieSearch(HttpServletRequest req) {
		String movie_search = req.getParameter("movie_search");
		req.setAttribute("movie_search", movie_search);
		req.setAttribute("contentPage", "movieSearch.jsp");
		req.setAttribute("subcontentPage", "movieSearchResult.jsp");
		req.setAttribute("topmenu", "maintop.jsp");
		return "main";
	}
}
