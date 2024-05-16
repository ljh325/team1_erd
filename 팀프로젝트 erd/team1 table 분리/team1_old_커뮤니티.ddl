
/**********************************/
/* Table Name: 커뮤티니 */
/**********************************/
CREATE TABLE CONTENTS(
		CONTENTSNO                    		NUMBER(50)		 NOT NULL		 PRIMARY KEY,
		CATENO                        		NUMBER(10)		 NOT NULL,
		TITLE                         		VARCHAR2(100)		 NOT NULL,
		CONTENT                       		CLOB(4000)		 NOT NULL,
		RECOM                         		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		VIEWCNT                       		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		COMMENTCNT                    		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		PASSWD                        		VARCHAR2(15)		 NOT NULL,
		TAG                           		VARCHAR2(100)		 NULL ,
		RDATE                         		DATE		 NOT NULL,
		FILE1                         		VARCHAR2(1000)		 NULL ,
		FILE1SAVED                    		VARCHAR2(1000)		 NULL ,
		THUMB1                        		VARCHAR2(1000)		 NULL ,
		SIZE1                         		NUMBER(10)		 NULL ,
		YOUTUBE                       		VARCHAR2(1000)		 NULL ,
		MEMBERNO                      		NUMBER(10)		 NULL ,
		ADMINNO                       		NUMBER(10)		 DEFAULT 1		 NOT NULL,
  FOREIGN KEY (CATENO) REFERENCES CATE (CATENO),
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO),
  FOREIGN KEY (ADMINNO) REFERENCES ADMIN (ADMINNO)
);

COMMENT ON TABLE CONTENTS is '커뮤티니';
COMMENT ON COLUMN CONTENTS.CONTENTSNO is '컨텐츠 번호';
COMMENT ON COLUMN CONTENTS.CATENO is '카테고리 번호';
COMMENT ON COLUMN CONTENTS.TITLE is '제목';
COMMENT ON COLUMN CONTENTS.CONTENT is '내용';
COMMENT ON COLUMN CONTENTS.RECOM is '추천수';
COMMENT ON COLUMN CONTENTS.VIEWCNT is '조회수';
COMMENT ON COLUMN CONTENTS.COMMENTCNT is '댓글수';
COMMENT ON COLUMN CONTENTS.PASSWD is '패스워드';
COMMENT ON COLUMN CONTENTS.TAG is '태그';
COMMENT ON COLUMN CONTENTS.RDATE is '등록일';
COMMENT ON COLUMN CONTENTS.FILE1 is '메인 이미지';
COMMENT ON COLUMN CONTENTS.FILE1SAVED is '실제 저장된 메인 이미지';
COMMENT ON COLUMN CONTENTS.THUMB1 is '메인 이미지 Preview';
COMMENT ON COLUMN CONTENTS.SIZE1 is '메인 이미지 크기';
COMMENT ON COLUMN CONTENTS.YOUTUBE is 'YOUTUBE 영상';
COMMENT ON COLUMN CONTENTS.MEMBERNO is '회원 번호';
COMMENT ON COLUMN CONTENTS.ADMINNO is '관리자 번호';





/**********************************/
/* Table Name: 댓글 */
/**********************************/
CREATE TABLE COMMENT(
		COMMENTNO                     		NUMBER(50)		 NOT NULL		 PRIMARY KEY,
		COMMENT_CONTENTS              		VARCHAR2(1000)		 NOT NULL,
		COMMENT_RDATE                 		DATE		 NOT NULL,
		MEMBERNO                      		NUMBER(10)		 NOT NULL,
		CONTENTSNO                    		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO),
  FOREIGN KEY (CONTENTSNO) REFERENCES CONTENTS (CONTENTSNO)
);

COMMENT ON TABLE COMMENT is '댓글';
COMMENT ON COLUMN COMMENT.COMMENTNO is '댓글번호';
COMMENT ON COLUMN COMMENT.COMMENT_CONTENTS is '댓글내용';
COMMENT ON COLUMN COMMENT.COMMENT_RDATE is '등록일';
COMMENT ON COLUMN COMMENT.MEMBERNO is '회원 번호';
COMMENT ON COLUMN COMMENT.CONTENTSNO is '컨텐츠 번호';


/**********************************/
/* Table Name: 리뷰 */
/**********************************/
CREATE TABLE REIVIEW(
		REVIEWNO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		STAR                          		NUMBER(10)		 DEFAULT 10		 NOT NULL,
		CONTENTS                      		VARCHAR2(10)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
		CNT                           		NUMBER(10)		 DEFAULT 1		 NOT NULL,
		MEMBERNO                      		NUMBER(10)		 NOT NULL,
		EATNO                         		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

COMMENT ON TABLE REIVIEW is '리뷰';
COMMENT ON COLUMN REIVIEW.REVIEWNO is '리뷰번호';
COMMENT ON COLUMN REIVIEW.STAR is '별점';
COMMENT ON COLUMN REIVIEW.CONTENTS is '내용';
COMMENT ON COLUMN REIVIEW.RDATE is '등록일';
COMMENT ON COLUMN REIVIEW.CNT is '리뷰수';
COMMENT ON COLUMN REIVIEW.MEMBERNO is '회원 번호';
COMMENT ON COLUMN REIVIEW.EATNO is '식품 번호';


/**********************************/
/* Table Name: 대댓글 */
/**********************************/
CREATE TABLE REPLY(
		REPLYNO                       		NUMBER(50)		 NOT NULL		 PRIMARY KEY,
		REPLY_CONTENTS                		VARCHAR2(1000)		 NOT NULL,
		REPLY_RDATE                   		DATE		 NOT NULL,
		MEMBERNO                      		NUMBER(10)		 NOT NULL,
		CONTENTSNO                    		NUMBER(10)		 NOT NULL,
		COMMENTNO                     		NUMBER(50)		 NULL ,
  FOREIGN KEY (COMMENTNO) REFERENCES COMMENT (COMMENTNO)
);

COMMENT ON TABLE REPLY is '대댓글';
COMMENT ON COLUMN REPLY.REPLYNO is '대댓글번호';
COMMENT ON COLUMN REPLY.REPLY_CONTENTS is '대댓글내용';
COMMENT ON COLUMN REPLY.REPLY_RDATE is '등록일';
COMMENT ON COLUMN REPLY.MEMBERNO is '회원 번호';
COMMENT ON COLUMN REPLY.CONTENTSNO is '컨텐츠 번호';
COMMENT ON COLUMN REPLY.COMMENTNO is '댓글번호';
