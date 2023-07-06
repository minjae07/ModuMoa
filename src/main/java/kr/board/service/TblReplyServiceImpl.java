package kr.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.board.entity.TblReply;
import kr.board.mapper.TblReplyMapper;

@Service
public class TblReplyServiceImpl implements TblReplyService {
	
	@Autowired
	private TblReplyMapper tblReplyMapper;

	@Override
	public List<TblReply> getReplyList(int idx) {
		return tblReplyMapper.getReplyList(idx);
	}

	@Override
	public void addReply(TblReply tblReply) {
		tblReplyMapper.insertReply(tblReply);
	}

}
