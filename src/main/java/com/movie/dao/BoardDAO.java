package com.movie.dao;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardDAO {
	@Autowired
	private SqlSession ss;


	// 자유게시판 조회
	public Freeboards getAllFree(HttpServletRequest req) {
		return new Freeboards(ss.getMapper(BoardMapper.class).getAllInFree());
	}
	// 자유게시판 글 작성
	public void writeFreeboard(Freeboard f, HttpServletRequest req) {
		try {
			BoardMapper bm = ss.getMapper(BoardMapper.class);
			if (bm.writeFreeboard(f) == 1) {
				req.setAttribute("r", "글쓰기 성공");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			req.setAttribute("r", "글쓰기 실패");
		}
	}
	// 자유게시판 상세조회
	public Freeboards getFreeDetail(Freeboard f, HttpServletRequest req) {
		return new Freeboards(ss.getMapper(BoardMapper.class).getFreeDetail(f));
	}
	// 자유게시판 게시글 수 리턴
	public int getFreeboardCount(Freeboard f) {
		int result = ss.getMapper(BoardMapper.class).getFreeboardCount(f);
		return result;
	}
	// 자유게시판 페이지 수 리턴
	public int getFreeboardTotalPage(Freeboard f) {
		int count = getFreeboardCount(f);
		int pageCount = 0;
		int numPerPage = 10; // 페이지당 보여줄 항목 수
		pageCount = count / numPerPage;
		if (count % numPerPage != 0)
			pageCount++;
		return pageCount;
	}


}
