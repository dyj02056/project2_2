package com.movie.member;

import java.util.List;

public interface MyMovieMapper {
	int regMyMovie(MyMovie mymovie);
	List<MyMovie> listMyMovie(String mm_id);
	public void deleteMyMovie(String mm_name);
}
