package kr.board.mapper;

import java.util.List;

import kr.board.entity.TblReply;

public interface TblReplyMapper {
	
	public List<TblReply> getReplyList(int idx);
	public void insertReply(TblReply tblReply);
	
}
