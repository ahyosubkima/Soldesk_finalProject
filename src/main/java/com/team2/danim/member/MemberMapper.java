package com.team2.danim.member;

public interface MemberMapper {

	public Member getMemberByID(Member m);

	int register(Member m);

	int deleteMember(Member m);

	public int updateMember(Member m);

	int checkOverId(String dm_id);

}
