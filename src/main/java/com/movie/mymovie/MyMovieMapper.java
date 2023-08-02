package com.movie.mymovie;

import java.util.List;

public interface MyMovieMapper {
	int regMyMovie(MyMovie mymovie);
	List<MyMovie> listMyMovie(String mm_id);
	String deleteMyMovie(String mm_name);
}
