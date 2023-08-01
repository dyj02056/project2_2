package com.movie.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class ReplyService {
	
	@Autowired
	private ReplyDAO rDAO;
	
	public List<Reply> listReply(){
		return rDAO.listReply();
	}
	
	public List<Reply> detailReply(int b_no) {
		return rDAO.detailReply(b_no);
	}
	
	public void deleteReply(int r_no) {
		rDAO.deleteReply(r_no);
	}
	
}
