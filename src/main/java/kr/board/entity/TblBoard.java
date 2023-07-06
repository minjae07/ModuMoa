package kr.board.entity;

import java.util.Date; 

import lombok.Data;

@Data
public class TblBoard {
	private int idx;
	private String memID;
	private String title;
	private String content;
	private String writer;
	private Date indate;
	private int count;
	private int boardGroup;
	private int boardSequence;
	private int boardLevel;
	private int boardAvailable;
	private String boardType;
	
	private String keyword;		
	private String searchType;	
}  