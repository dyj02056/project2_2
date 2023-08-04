package com.movie.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyMovieDAO {
	@Autowired 
	private  SqlSession ss3;
	
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
	
	public  List<MyMovie> listMyMovie(String mm_id){
		return ss3.getMapper(MyMovieMapper.class).listMyMovie(mm_id);
	}
	
	public void deleteMyMovie(int mm_no) {
		ss3.getMapper(MyMovieMapper.class).deleteMyMovie(mm_no);
	}
	
}
