package com.movie.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.member.Member;
import com.movie.member.MemberMapper;
import com.movie.member.Members;

@Service
public class MovieBoardDAO {
	@Autowired
	private SqlSession ss;
	
	
	
	
	public void regMovieBoard(MovieBoard mb, HttpServletRequest req) { 
		try {
			MovieBoardMapper mbm = ss.getMapper(MovieBoardMapper.class);
			if (mbm.regMovieBoard(mb) == 1) {
				req.setAttribute("rb", "게시판 등록 성공!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("rb", "게시판 등록 실패");
		}
	}
	
	public List<MovieBoard> listMovieBoard(){
		return ss.getMapper(MovieBoardMapper.class).listMovieBoard();
	}
	
	public MovieBoard detailMovieBoard(int b_no) {
		return ss.getMapper(MovieBoardMapper.class).detailMovieBoard(b_no);
	}
	
	
	public void updateMovieBoard(MovieBoard movieboard) {
		ss.getMapper(MovieBoardMapper.class).updateMovieBoard(movieboard);
	}

	
//	public void updateMovieBoard(int b_no) {
//		ss.getMapper(MovieBoardMapper.class).updateMovieBoard(b_no);
//	}

	
	public void deleteMovieBoard(int b_no) {
		ss.getMapper(MovieBoardMapper.class).deleteMovieBoard(b_no);
	}
	
}
