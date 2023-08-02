package com.movie.mymovie;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyMovieDAO {
	@Autowired 
	private SqlSession ss3;
	
	public void regMyMovie(MyMovie mm, HttpServletRequest req) {
		try {
			MyMovieMapper mmm = ss3.getMapper(MyMovieMapper.class);
			if(mmm.regMyMovie(mm)==1) {
				req.setAttribute("rm", "나의 영화 등록 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("rm", "나의 영화 등록 실패");
			// TODO: handle exception
		}
	}
	
}