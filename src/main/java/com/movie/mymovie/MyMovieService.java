package com.movie.mymovie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyMovieService {
	@Autowired
	private MyMovieDAO mmDAO;
}
