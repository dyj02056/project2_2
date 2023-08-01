package com.movie.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MovieBoardService {
	
	@Autowired
	private MovieBoardDAO mbDAO;
	
	public List<MovieBoard> listMovieBoardService(){
		return mbDAO.listMovieBoard();
	}
	
	public MovieBoard detailMovieBoardService(int b_no) {
		return mbDAO.detailMovieBoard(b_no);
	}
	
//	public void updateMovieBoardService(int b_no) {
//		mbDAO.updateMovieBoard(b_no);
//	}
	
	public void updateMovieBoard(MovieBoard movieboard) {
		mbDAO.updateMovieBoard(movieboard);
	}
	
	
	public void deleteMovieBoardService(int b_no) {
		mbDAO.deleteMovieBoard(b_no);
	}
	
	
	
}
