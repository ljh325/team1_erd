/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE ADMIN(
		ADMINNO                       		NUMBER(10)		 NULL 		 PRIMARY KEY,
		ADMINID                       		VARCHAR2(30)		 NOT NULL,
		PASSWORD                      		VARCHAR2(200)		 NOT NULL,
		GRADE                         		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE ADMIN is '관리자';
COMMENT ON COLUMN ADMIN.ADMINNO is '관리자 번호';
COMMENT ON COLUMN ADMIN.ADMINID is '관리자 아이디';
COMMENT ON COLUMN ADMIN.PASSWORD is '관리자 패스워드';
COMMENT ON COLUMN ADMIN.GRADE is '관리자 등급';


/**********************************/
/* Table Name: 카테고리 */
/**********************************/
CREATE TABLE CATE(
		CATENO                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		NAME                          		VARCHAR2(30)		 NOT NULL,
		NAMESUB                       		VARCHAR2(30)		 NOT NULL,
		CNT                           		NUMBER(7)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
		SEQNO                         		NUMBER(5)		 NOT NULL,
		VISIBLE                       		CHAR(1)		 NOT NULL,
		ADMINNO                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (ADMINNO) REFERENCES ADMIN (ADMINNO)
);

COMMENT ON TABLE CATE is '카테고리';
COMMENT ON COLUMN CATE.CATENO is '카테고리번호';
COMMENT ON COLUMN CATE.NAME is '중분류명';
COMMENT ON COLUMN CATE.NAMESUB is '소분류명';
COMMENT ON COLUMN CATE.CNT is '관련 자료수';
COMMENT ON COLUMN CATE.RDATE is '등록일';
COMMENT ON COLUMN CATE.SEQNO is '출력 순서';
COMMENT ON COLUMN CATE.VISIBLE is '출력 모드';
COMMENT ON COLUMN CATE.ADMINNO is '관리자 번호';


/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE MEMBER(
		MEMBERNO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		ID                            		VARCHAR2(30)		 NOT NULL,
		PASSWD                        		VARCHAR2(200)		 NOT NULL,
		MNAME                         		VARCHAR2(30)		 NOT NULL,
		TEL                           		VARCHAR2(20)		 NOT NULL,
		ZIPCODE                       		VARCHAR2(5)		 NULL ,
		ADDRESS1                      		VARCHAR2(80)		 NULL ,
		ADDRESS2                      		VARCHAR2(50)		 NULL ,
		MDATE                         		DATE		 NOT NULL,
		GRADE                         		NUMBER(2)		 NOT NULL,
		profile                       		VARCHAR2(10)		 NULL ,
		POINT                         		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		BIRTH                         		NUMBER(10)		 NOT NULL,
		SEX                           		CHAR(1)		 DEFAULT 'M'		 NOT NULL,
  CONSTRAINT SYS_C008567 UNIQUE (ID)
);

COMMENT ON TABLE MEMBER is '회원';
COMMENT ON COLUMN MEMBER.MEMBERNO is '회원 번호';
COMMENT ON COLUMN MEMBER.ID is '아이디';
COMMENT ON COLUMN MEMBER.PASSWD is '패스워드';
COMMENT ON COLUMN MEMBER.MNAME is '성명';
COMMENT ON COLUMN MEMBER.TEL is '전화번호';
COMMENT ON COLUMN MEMBER.ZIPCODE is '우편번호';
COMMENT ON COLUMN MEMBER.ADDRESS1 is '주소1';
COMMENT ON COLUMN MEMBER.ADDRESS2 is '주소2';
COMMENT ON COLUMN MEMBER.MDATE is '가입일';
COMMENT ON COLUMN MEMBER.GRADE is '등급';
COMMENT ON COLUMN MEMBER.profile is '회원 프로필 이미지';
COMMENT ON COLUMN MEMBER.POINT is '포인트';
COMMENT ON COLUMN MEMBER.BIRTH is '생년월일';
COMMENT ON COLUMN MEMBER.SEX is '성별';


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
/* Table Name:  회원 로그인 내역 */
/**********************************/
CREATE TABLE MLOGIN(
		MLOGINNO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		IP                            		VARCHAR2(15)		 NOT NULL,
		LOGINDATE                     		DATE		 NOT NULL,
		MEMBERNO                      		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

COMMENT ON TABLE MLOGIN is ' 회원 로그인 내역';
COMMENT ON COLUMN MLOGIN.MLOGINNO is '회원 로그인 번호';
COMMENT ON COLUMN MLOGIN.IP is '접속 ip';
COMMENT ON COLUMN MLOGIN.LOGINDATE is '로그인 날짜';
COMMENT ON COLUMN MLOGIN.MEMBERNO is '회원번호';


/**********************************/
/* Table Name: 운동 카테고리 */
/**********************************/
CREATE TABLE HEALTHCATE(
		HEALTHCATENO                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		NAME                          		VARCHAR2(10)		 NOT NULL,
		NAMESUB                       		VARCHAR2(10)		 DEFAULT '-'		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
		VISIBLE                       		CHAR(1)		 DEFAULT 'N'		 NOT NULL,
		ADMINNO                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (ADMINNO) REFERENCES ADMIN (ADMINNO)
);

COMMENT ON TABLE HEALTHCATE is '운동 카테고리';
COMMENT ON COLUMN HEALTHCATE.HEALTHCATENO is '헬스카테고리번호';
COMMENT ON COLUMN HEALTHCATE.NAME is '중분류';
COMMENT ON COLUMN HEALTHCATE.NAMESUB is '소분류';
COMMENT ON COLUMN HEALTHCATE.RDATE is '등록일';
COMMENT ON COLUMN HEALTHCATE.VISIBLE is '출력모드';
COMMENT ON COLUMN HEALTHCATE.ADMINNO is '관리자 번호';


/**********************************/
/* Table Name: 운동 종류 */
/**********************************/
CREATE TABLE HEALTH(
		HEALTHNO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		RDATE                         		DATE		 NOT NULL,
		HEALTHNAME                    		VARCHAR2(10)		 NOT NULL,
		EXPLAN                        		VARCHAR2(10)		 NOT NULL,
		HEALTHPHOTO                   		VARCHAR2(10)		 NULL ,
		HEALTHYOUTUBE                 		VARCHAR2(1000)		 NULL ,
		HEALTHCATENO                  		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (HEALTHCATENO) REFERENCES HEALTHCATE (HEALTHCATENO)
);

COMMENT ON TABLE HEALTH is '운동 종류';
COMMENT ON COLUMN HEALTH.HEALTHNO is '운동 종류 번호';
COMMENT ON COLUMN HEALTH.RDATE is '등록일';
COMMENT ON COLUMN HEALTH.HEALTHNAME is '운동명';
COMMENT ON COLUMN HEALTH.EXPLAN is '운동설명';
COMMENT ON COLUMN HEALTH.HEALTHPHOTO is '운동사진';
COMMENT ON COLUMN HEALTH.HEALTHYOUTUBE is '운동유튜브주소';
COMMENT ON COLUMN HEALTH.HEALTHCATENO is '헬스카테고리번호';


/**********************************/
/* Table Name: 운동기록 */
/**********************************/
CREATE TABLE HISTORY(
		HISTORYNO                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		STARTT                        		DATE		 NOT NULL,
		ENDT                          		NUMBER(10)		 NULL ,
		MEMBERNO                      		NUMBER(10)		 NULL ,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

COMMENT ON TABLE HISTORY is '운동기록';
COMMENT ON COLUMN HISTORY.HISTORYNO is '운동기록번호';
COMMENT ON COLUMN HISTORY.STARTT is '운동시작시간';
COMMENT ON COLUMN HISTORY.ENDT is '운동종료시간';
COMMENT ON COLUMN HISTORY.MEMBERNO is '회원 번호';


/**********************************/
/* Table Name: 이재호 */
/**********************************/
CREATE TABLE TABLE_15(

);

COMMENT ON TABLE TABLE_15 is '이재호';


/**********************************/
/* Table Name: 박주찬 */
/**********************************/
CREATE TABLE TABLE_16(

);

COMMENT ON TABLE TABLE_16 is '박주찬';


/**********************************/
/* Table Name: 장범조 */
/**********************************/
CREATE TABLE TABLE_17(

);

COMMENT ON TABLE TABLE_17 is '장범조';


/**********************************/
/* Table Name: 한희락 */
/**********************************/
CREATE TABLE TABLE_18(

);

COMMENT ON TABLE TABLE_18 is '한희락';


/**********************************/
/* Table Name: 운동 목표 */
/**********************************/
CREATE TABLE GOALS(
		GOALSNO                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEMBERNO                      		NUMBER(10)		 NULL ,
		GDATE                         		DATE		 NOT NULL,
		KG                            		NUMBER(10)		 NOT NULL,
		CKG                           		NUMBER(10)		 NOT NULL,
		CM                            		NUMBER(10)		 NULL ,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

COMMENT ON TABLE GOALS is '운동 목표';
COMMENT ON COLUMN GOALS.GOALSNO is '목표 번호';
COMMENT ON COLUMN GOALS.MEMBERNO is '회원 번호';
COMMENT ON COLUMN GOALS.GDATE is '등록일';
COMMENT ON COLUMN GOALS.KG is '체중';
COMMENT ON COLUMN GOALS.CKG is '체지방';
COMMENT ON COLUMN GOALS.CM is '신장';


/**********************************/
/* Table Name: 임시 */
/**********************************/
CREATE TABLE TABLE_20(

);

COMMENT ON TABLE TABLE_20 is '임시';


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


/**********************************/
/* Table Name: 회원 건강 정보 */
/**********************************/
CREATE TABLE MH(
		MHNO                          		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		KG                            		NUMBER(10)		 NOT NULL,
		CKG                           		NUMBER(10)		 NOT NULL,
		CM                            		NUMBER(10)		 NOT NULL,
		MUSCLE                        		NUMBER(10)		 NOT NULL,
		MEMBERNO                      		NUMBER(10)		 NULL ,
		INSERTDATE                    		DATE		 NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

COMMENT ON TABLE MH is '회원 건강 정보';
COMMENT ON COLUMN MH.MHNO is '회원건강 정보 번호';
COMMENT ON COLUMN MH.KG is '체중';
COMMENT ON COLUMN MH.CKG is '체지방';
COMMENT ON COLUMN MH.CM is '신장';
COMMENT ON COLUMN MH.MUSCLE is '골격근량';
COMMENT ON COLUMN MH.MEMBERNO is '회원 번호';
COMMENT ON COLUMN MH.INSERTDATE is '등록일';


/**********************************/
/* Table Name: 운동추천 */
/**********************************/
CREATE TABLE HEALTHRECOM(
		HEALTHRECOMNO                 		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		RECOM                         		VARCHAR2(4000)		 NOT NULL,
		HEALTHNO                      		NUMBER(10)		 NOT NULL,
		GOALSNO                       		NUMBER(10)		 NOT NULL,
		MHNO                          		NUMBER(10)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
  FOREIGN KEY (GOALSNO) REFERENCES GOALS (GOALSNO),
  FOREIGN KEY (MHNO) REFERENCES MH (MHNO),
  FOREIGN KEY (HEALTHNO) REFERENCES HEALTH (HEALTHNO)
);

COMMENT ON TABLE HEALTHRECOM is '운동추천';
COMMENT ON COLUMN HEALTHRECOM.HEALTHRECOMNO is '운동추천번호';
COMMENT ON COLUMN HEALTHRECOM.RECOM is '운동추천내용';
COMMENT ON COLUMN HEALTHRECOM.HEALTHNO is '운동 종류 번호';
COMMENT ON COLUMN HEALTHRECOM.GOALSNO is '목표 번호';
COMMENT ON COLUMN HEALTHRECOM.MHNO is '회원 건강진단 번호';
COMMENT ON COLUMN HEALTHRECOM.RDATE is '날짜';


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


/**********************************/
/* Table Name: 관리자 로그인 내역 */
/**********************************/
CREATE TABLE ALOGIN(
		ALOGINNO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		IP                            		VARCHAR2(15)		 NOT NULL,
		LOGINDATE                     		DATE		 NOT NULL,
		ADMINNO                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (ADMINNO) REFERENCES ADMIN (ADMINNO)
);

COMMENT ON TABLE ALOGIN is '관리자 로그인 내역';
COMMENT ON COLUMN ALOGIN.ALOGINNO is '관리자 로그인 번호';
COMMENT ON COLUMN ALOGIN.IP is '접속 IP';
COMMENT ON COLUMN ALOGIN.LOGINDATE is '로그인 날짜';
COMMENT ON COLUMN ALOGIN.ADMINNO is '관리자 번호';


