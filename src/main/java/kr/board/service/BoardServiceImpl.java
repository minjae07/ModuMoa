package kr.board.service;

import java.util.List;  

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.board.entity.Criteria;
import kr.board.entity.TblBoard;
import kr.board.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardMapper boardMapper;

	@Override
	public List<TblBoard> getList(Criteria cri) {
		return boardMapper.getList(cri);
	}

	@Override
	public void register(TblBoard vo) {
		boardMapper.insertSelectKey(vo);
		
	}

	@Override
	public TblBoard get(Integer idx) {
		TblBoard vo = boardMapper.read(idx);
		return vo;
	}

	@Override
	public int count(int idx) {
		int count = boardMapper.count(idx);
		return count;
	}

	@Override
	public void modify(TblBoard vo) {
		boardMapper.update(vo);
	}

	@Override
	public void temp(Integer idx) {
		boardMapper.temp(idx);
	}

	@Override
	public void delTemp(Integer idx) {
		boardMapper.delTemp(idx);
		
	}

	@Override
	public void remove(int idx) {
		boardMapper.deleteReply(idx);
		boardMapper.delete(idx);
		
	}
	
	@Override
	public void reply(TblBoard vo) {
		TblBoard parent = boardMapper.read(vo.getIdx());
		vo.setBoardGroup(parent.getBoardGroup());
		vo.setBoardSequence(parent.getBoardSequence()+1);
		vo.setBoardLevel(parent.getBoardLevel()+1);
		boardMapper.replySeqUpdate(parent);
		boardMapper.replyInsert(vo);
	}

	@Override
	public int totalCount(Criteria cri) {
		return boardMapper.totalCount(cri);
	}

	@Override
	public int hasReplies(int boardGroup) {
		return boardMapper.hasReplies(boardGroup);
	}

	@Override
	public List<TblBoard> getviewList(Criteria cri) {
		return boardMapper.getviewList(cri);
	}

	@Override
	public List<TblBoard> getNotice() {
		return boardMapper.getNotice();
	}




	

}
