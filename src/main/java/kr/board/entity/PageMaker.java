package kr.board.entity;
//페이징 처리 클래스(vo)

import lombok.Data;

@Data
public class PageMaker {
	private Criteria cri;
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum=10;	//최대 페이징 번호 10개
	
	//총게시글 수를 구하는 메서드
	public void setTotalCount(int totalCount) {
		this.totalCount=totalCount;
		makePaging();
	}

	private void makePaging() {
		//1. 화면에 보여질 마지막 페이지 번호
		endPage=(int) (Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum);
		//2. 화면에 보여질 시작 페이지 번호
		startPage=(endPage-displayPageNum)+1;
		if(startPage<=0) startPage=1;
		//3. 전체 마지막 페이지
		int tempEndPage =(int) Math.ceil(totalCount/(double)cri.getPerPageNum());
		//4. 유효성 체크
		if(tempEndPage<endPage) {
			endPage=tempEndPage;
		}
		//5. 이전페이지 및 다음페이지 버튼
		prev=(startPage==1) ? false : true;
		next=(endPage<tempEndPage)? true : false;
		
	}
}
