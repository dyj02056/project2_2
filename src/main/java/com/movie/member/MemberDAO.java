package com.movie.member;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberDAO {
	@Autowired
	private SqlSession ss;

	public Members getAllMember(HttpServletRequest req) { // 모든 회원 조회
		return new Members(ss.getMapper(MemberMapper.class).getAllMember());
	}

	public void regMember(Member m, HttpServletRequest req) { // 회원 가입
		try {
			MemberMapper mm = ss.getMapper(MemberMapper.class);
			if (mm.regMember(m) == 1) {
				req.setAttribute("r", "회원 등록 성공!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "회원 등록 실패");
		}
	}

	public String loginMember(Member m, HttpServletRequest req) { // 로그인 체크
		int result=ss.getMapper(MemberMapper.class).login(m);

		if(result==1){
			return "성공";
		}else {
			return "실패";
		}
	}
	 public Member getMemberProfile(String m_id) { // 사용자 프로필 정보 조회
	        return ss.getMapper(MemberMapper.class).getMemberProfile(m_id);
	    }

}
