
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



