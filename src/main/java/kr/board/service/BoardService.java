package kr.board.service;

import java.util.List;

import kr.board.entity.Criteria;
import kr.board.entity.TblBoard;

public interface BoardService {
	public List<TblBoard> getList(Criteria cri);
	public void register(TblBoard vo);
	public TblBoard get(Integer idx);
	public int count(int idx);
	public void modify(TblBoard vo);
	public void temp(Integer idx);
	public void delTemp(Integer idx);
	public void remove(int idx);
	public void reply(TblBoard vo);
	public int totalCount(Criteria cri);
	public int hasReplies(int boardGroup);
	public List<TblBoard> getviewList(Criteria cri);
	public List<TblBoard> getNotice();
	
}
