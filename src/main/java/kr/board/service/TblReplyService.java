package kr.board.service;

import java.util.List;

import kr.board.entity.TblReply;

public interface TblReplyService {
	
	public List<TblReply> getReplyList(int idx);
	
	public void addReply(TblReply tblReply);
	
}
