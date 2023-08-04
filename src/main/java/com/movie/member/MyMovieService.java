package com.movie.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyMovieService {
	@Autowired
	private MyMovieDAO mmDAO;
	
	public List<MyMovie> listMyMovie(String mm_id){
		return mmDAO.listMyMovie(mm_id);
	}
	public void deleteMyMovie(int mm_no) {
		mmDAO.deleteMyMovie(mm_no);
	}
	
}
