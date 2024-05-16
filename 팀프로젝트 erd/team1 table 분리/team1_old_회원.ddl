
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




