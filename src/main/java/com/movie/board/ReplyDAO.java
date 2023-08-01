package com.movie.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyDAO {
	@Autowired SqlSession ss2;
	
	public void writeReply(Reply r, HttpServletRequest req) {
		try {
			ReplyMapper rm = ss2.getMapper(ReplyMapper.class);
			if(rm.writeReply(r) == 1) {
				req.setAttribute("rr", "댓글 등록 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("rr", "댓글 등록 실패");
			
			// TODO: handle exception
		}
	}
	
	public List<Reply> listReply(){
		return ss2.getMapper(ReplyMapper.class).listReply();
	}
	
	public List<Reply> detailReply(int b_no) {
		return ss2.getMapper(ReplyMapper.class).detailReply(b_no);
	}
	
	public void deleteReply(int r_no) {
		ss2.getMapper(ReplyMapper.class).deleteReply(r_no);
	}
	
}
