
/**********************************/
/* Table Name: 식단 카테고리 */
/**********************************/
CREATE TABLE EATCATE(
		EATCATENO                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		IMAGE                         		VARCHAR2(10)		 NOT NULL,
		NAME                          		VARCHAR2(10)		 NOT NULL,
		NAMESUB                       		VARCHAR2(10)		 DEFAULT '-'		 NOT NULL,
		VISIBLE                       		CHAR(1)		 DEFAULT 'N'		 NOT NULL,
		EDATE                         		DATE		 NOT NULL,
		ADMINNO                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (ADMINNO) REFERENCES ADMIN (ADMINNO)
);

COMMENT ON TABLE EATCATE is '식단 카테고리';
COMMENT ON COLUMN EATCATE.EATCATENO is '식단 번호';
COMMENT ON COLUMN EATCATE.IMAGE is '식품 이미지';
COMMENT ON COLUMN EATCATE.NAME is '중분류';
COMMENT ON COLUMN EATCATE.NAMESUB is '소분류';
COMMENT ON COLUMN EATCATE.VISIBLE is '출력모드';
COMMENT ON COLUMN EATCATE.EDATE is '등록일';
COMMENT ON COLUMN EATCATE.ADMINNO is '관리자 번호';


/**********************************/
/* Table Name: 식단추천 */
/**********************************/
CREATE TABLE FOODRECOM(
		FOODRECOMNO                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		CONTENTS                      		VARCHAR2(4000)		 NOT NULL,
		EATCATENO                     		NUMBER(10)		 NOT NULL,
		GOALSNO                       		NUMBER(10)		 NOT NULL,
		MHNO                          		NUMBER(10)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
  FOREIGN KEY (EATCATENO) REFERENCES EATCATE (EATCATENO),
  FOREIGN KEY (GOALSNO) REFERENCES GOALS (GOALSNO)
);

COMMENT ON TABLE FOODRECOM is '식단추천';
COMMENT ON COLUMN FOODRECOM.FOODRECOMNO is '식단추천번호';
COMMENT ON COLUMN FOODRECOM.CONTENTS is '식단추천내용';
COMMENT ON COLUMN FOODRECOM.EATCATENO is '식단 번호';
COMMENT ON COLUMN FOODRECOM.GOALSNO is '목표 번호';
COMMENT ON COLUMN FOODRECOM.MHNO is '회원건강 정보 번호';
COMMENT ON COLUMN FOODRECOM.RDATE is '날짜';


