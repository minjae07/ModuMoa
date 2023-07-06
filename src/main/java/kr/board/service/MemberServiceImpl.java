package kr.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.board.entity.Member;
import kr.board.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public List<Member> getmemList() {

		
		return memberMapper.memList();
	
	}

	//admin 회원관리
}
