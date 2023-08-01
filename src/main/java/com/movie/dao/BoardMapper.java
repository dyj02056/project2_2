package com.movie.dao;

import java.util.List;

public interface BoardMapper {
	
	public abstract List<Freeboard> getAllInFree();
	public abstract int writeFreeboard(Freeboard f);
	public abstract List<Freeboard> getFreeDetail(Freeboard f);
	public abstract int getFreeboardCount(Freeboard f);
}
	
