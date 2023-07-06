package kr.board.mapper;

import java.util.List;   

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import kr.board.entity.Board;
import kr.board.entity.Criteria;
import kr.board.entity.TblBoard;

@Mapper 
public interface BoardMapper {
	
	//게시판
	public List<TblBoard> getList(Criteria cri);
	public void insertSelectKey(TblBoard vo);
	public void register(TblBoard vo);
	public TblBoard read(int idx);
	public int count(int idx);
	public void update(TblBoard vo);
	public int hasReplies(int boardGroup);
	public void temp(int idx);
	public void delTemp(int idx);
	public void delete(int idx);
	public void deleteReply(int idx);
	public void replySeqUpdate(TblBoard parent);
	public void replyInsert(TblBoard vo);
	public int totalCount(Criteria cri);
	public List<TblBoard> getviewList(Criteria cri);
	public List<TblBoard> getbestnotice();
	public List<TblBoard> getNotice();
	
	//QnA 게시판
	public List<Board> getLists(); 
	public void boardInsert(Board vo);
	public Board boardContent(int idx);
	public void boardDelete(int idx);
	public void boardUpdate(Board vo);
	@Update("update board set count=count+1 where idx=#{idx}")	//조회수
	public void boardCount(int idx);
	public List<Board> getbestList();
	
	
	
	
	
	
}

