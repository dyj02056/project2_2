package com.movie.member;

import java.util.List;

public interface MemberMapper {
	int regMember(Member m);

	List<Member> getAllMember();

	int login(Member m);

	Member getMemberProfile(String m_id);

}
