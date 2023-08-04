package com.movie.member;

import java.util.List;

public interface MyMovieMapper {
	int regMyMovie(MyMovie mymovie);
	List<MyMovie> listMyMovie(String mm_id);
	int deleteMyMovie(int mm_no);
}
