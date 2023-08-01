package com.movie.board;

import java.util.List;

public interface MovieBoardMapper {
	public abstract int regMovieBoard(MovieBoard movieboard);
	List<MovieBoard> listMovieBoard();
	MovieBoard detailMovieBoard(int b_no);
	
//	public void updatemovieBoard(String b_title, String b_content);
//	public abstract int updateMovieBoard(MovieBoard movieboard);
//	int updateMovieBoard(int b_no);
	public void updateMovieBoard(MovieBoard movieboard);
	int deleteMovieBoard(int b_no);
}
