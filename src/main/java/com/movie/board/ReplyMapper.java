package com.movie.board;

import java.util.List;

public interface ReplyMapper {
	public abstract int writeReply(Reply reply);
	List<Reply> listReply();
	List<Reply> detailReply(int b_no);
	int deleteReply(int r_no);
}
