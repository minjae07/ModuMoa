package kr.board.entity;

import lombok.Data;

@Data
public class Criteria {
	private int page;	//현재 페이지	
	private int perPageNum;	// 한 페이지에 보여줄 게시글 수
	private int totalCount;	//총게시물 수
	private String boardType;	//게시판 타입
	
	//검색
	private String searchType;
	private String keyWord;
	
	public Criteria() {
		this.page=1;
		this.perPageNum=5;
	}
	
	
	//현재 페이지의 게시글의 시작번호
	public int getPageStart() {
		return (page-1)*perPageNum;
	}
	
	public void setTotalCount(int totalCount) {
	    this.totalCount = totalCount;
	    }

	public int getTotalCount() {
	    return totalCount;
	    }
}
