package kr.board.entity;

import java.util.Date;   

import lombok.Data;

@Data
public class TblReply {
		private int idx;
		private int rno;
		private String content;
		private String writer;
		private Date regdate;
}
