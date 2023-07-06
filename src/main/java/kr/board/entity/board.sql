screate table board(
	idx number not null,
	memID varchar2(20) not null,  
	title varchar2(100) not null,
	content varchar2(2000) not null,
	writer varchar2(30) not null,
	indate date default sysdate,
	count number default 0,
	primary key(idx)
);
create table board1(
	idx number not null,
	memID varchar2(20) not null,  
	title varchar2(100) not null,
	content varchar2(2000) not null,
	indate date default sysdate,
	count number default 0,
	primary key(idx)
);
create sequence board1_idx;
drop table board;

select * from board;

insert into board1(idx, title, content, memID)
values(board1_idx.nextval, '게시판','test내용','test관리자');
delete board;
--시퀸스 조회 및 삭제
SELECT * FROM USER_SEQUENCES;
DROP SEQUENCE board_idx;

insert into board(idx, title, content, writer)
	values(board_idx.nextval, '스프링게시판','스프링게시판','관리자');
insert into board(idx, title, content, writer)
	values(board_idx.nextval, '스프링게시판','스프링게시판','배민재');
insert into board(idx, title, content, writer)
	values(board_idx.nextval, '스프링게시판','스프링게시판','손님');
select * from board order by idx desc

--조회 및 삭제
select * from board;
drop table board;


create table member(
  memIdx int, 
  memID varchar(20) not null,  
  memPassword varchar(20) not null,
  memName varchar(20) not null,
  memAge int,
  memGender varchar(20),
  memEmail varchar(50),
  memProfile varchar(50),
  primary key(memIdx)
);

create sequence member_idx;

drop table member;
DROP SEQUENCE member_idx;
delete member;
delete tblBoard;
delete tblreply;
select * from member;

		select * 
		from tblBoard 
		where content like '%ㅓㅓ%'
		order by boardGroup desc;
SELECT * 
		FROM TBLBOARD 
		WHERE 1=1
			AND content LIKE '%ㅓㅓ%'
		ORDER BY boardGroup DESC;

select *
from (
	select *
	from board
	order by count desc
)
where rownum <=3;

	select *
		from (
			select *
			from TBLBOARD
			order by count desc
		)
	where rownum lte 3

	SELECT memID, COUNT(memID) FROM board
	GROUP BY memID
	HAVING COUNT(memID) >= 0
	
	
SELECT *
FROM TBLBOARD
WHERE content LIKE '%' || 11 || '%'
ORDER BY boardGroup DESC;
	
DELETE TBLBOARD WHERE IDX=11;

select * from TBLBOARD;
delete TBLBOARD;
commit;

SELECT *   
FROM TBLBOARD   
WHERE 1=1         
AND title LIKE '%13%'        
ORDER BY boardGroup DESC;

create sequence TBLBOARD_seq;


    SELECT *
    FROM TBLBOARD
    WHERE 1 = 1
    <choose>
        <when test="searchType == 'writer'">
            AND writer LIKE '%' || :keyword || '%'
        </when>
        <when test="searchType == 'title'">
            AND title LIKE '%' || :keyword || '%'
        </when>
        <when test="searchType == 'content'">
            AND content LIKE '%' || :keyword || '%'
        </when>
    </choose>
    ORDER BY boardGroup DESC;
    
    
    
    select *
    from tblBoard
    where idx = 2;
    
    select * from tblBoard where idx = 2;
    
    
    		SELECT *
		  FROM TBLBOARD;
		 WHERE IDX = 0;
		 
 select *
    from tblBoard
    where count = 4;
    
    SELECT COUNT(boardGroup) FROM tblBoard;
    
    
    create table tblreply (
    idx number not null,
    rno number not null,
    content varchar2(1000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    primary key(idx, rno)
);

alter table tblreply add constraint tblreply_idx foreign key(idx)
references tblBoard(idx);

create sequence tblreply_seq START WITH 1 MINVALUE 0;

commit;

 select * from tblreply;
 
 
 SELECT
			RNO, CONTENT, WRITER, REGDATE
		FROM TBLREPLY
		
		
		insert into tblreply(idx, rno, content, writer)
    values(1, tblreply_seq.nextval, '테스트댓글', '테스트 작성자');

select *
  from tblreply;
  
   INSERT INTO tblReply (idx
						, rno
						, content
						, writer
						, regdate) 
		VALUES (2
			 , (SELECT NVL(MAX(rno), 0)+1 
			 	FROM tblReply 
			 	WHERE idx = 2)
			 , #{content}
			 , #{writer}
			 , SYSDATE);
			 
    INSERT INTO tblReply (idx
						, rno
						, content
						, writer
						, regdate) 
		VALUES (2
			 , tblreply_seq.NEXTVAL
			 , 'sqltest'
			 , '관리자'
			 , SYSDATE);
			 
			 
 SELECT *
  FROM all_sequences
 WHERE sequence_name = 'tblreply_seq';
			 
 
 select *
		from (
			select *
			from tblBoard
			order by count desc
		)
	where rownum <= 5
			

SELECT * FROM (
              SELECT ROWNUM AS RNUM, A.* FROM (
                       SELECT
                             *
                         FROM
                             TBLBOARD 
                         ORDER BY boardGroup DESC, boardSequence ASC  
             ) A WHERE ROWNUM <![CDATA[ <= ]]> 1 * 10
         ) WHERE RNUM > (1-1) * 10
         
         
         	select count(*) from tblBoard
         	select * from tblBoard
         	select * from tblmember
         	
         	SELECT COUNT(*) FROM TBLBOARD WHERE BOARDGROUP = 25;
         	
         	
         	ALTER TABLE TBLBOARD ADD boardType VARCHAR2(50);
         	ALTER TABLE TBLBOARD DROP COLUMN boardType;
         	UPDATE TBLBOARD SET boardType = 'free';
         	SELECT * from TBLBOARD;
         	
         	ALTER TABLE tblreply ADD elapsedTime VARCHAR2(10);
         	ALTER TABLE tblreply DROP COLUMN elapsedTime;
         	alter table TBLBOARD modify content null;
         	
         	SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'TBLBOARD';
         	
COMMIT;
         	
SELECT * FROM TBLBOARD;

UPDATE TBLBOARD SET CONTENT1 = CONTENT;  