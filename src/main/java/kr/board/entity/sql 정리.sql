--테이블 생성
create table board(
	idx number not null,
	memID varchar2(20) not null,  
	title varchar2(100) not null,
	content varchar2(2000) not null,
	writer varchar2(30) not null,
	indate date default sysdate,
	count number default 0,
	primary key(idx)
);

create sequence board_idx;


create table member(
  memIdx int, 
  memID varchar(30) not null,  
  memPassword varchar(30) not null,
  memName varchar(30) not null,
  memAge int, 
  memGender varchar(20),
  memEmail varchar(50),
  memProfile varchar(100),
  primary key(memIdx)
);

create sequence member_idx;

CREATE TABLE TblBoard (
    idx             NUMBER PRIMARY KEY,         -- INT는 Oracle에서 NUMBER로 대응
    memID           VARCHAR2(255),               -- STRING은 VARCHAR2로 대응
    title           VARCHAR2(255),
    content         CLOB,                        -- 내용이 길어질 수 있기에 CLOB로 설정
    writer          VARCHAR2(255),
    indate          DATE,                        -- DATE는 Oracle의 DATE 타입으로 대응
    count           NUMBER,                      -- INT는 NUMBER로 대응
    boardGroup      NUMBER,
    boardSequence   NUMBER,
    boardLevel      NUMBER,
    boardAvailable  NUMBER,
    boardType       VARCHAR2(50),                -- 필요에 따라 크기 조정
    keyword         VARCHAR2(255),
    searchType      VARCHAR2(50)                 -- 필요에 따라 크기 조정
);

create sequence TBLBOARD_seq;

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
