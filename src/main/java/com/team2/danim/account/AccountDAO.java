package com.team2.danim.account;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountDAO {
	//profile 사진, 이메일, 전화번호(폰번호든 뭐든)
	@Autowired
	private SqlSession ss;
}
