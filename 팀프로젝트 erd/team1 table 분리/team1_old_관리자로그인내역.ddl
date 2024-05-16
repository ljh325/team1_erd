
/**********************************/
/* Table Name: 관리자 로그인 내역 */
/**********************************/
CREATE TABLE ALOGIN(
		ALOGINNO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
        ADMINNO                       		NUMBER(10)		 NULL ,
		IP                            		VARCHAR2(15)		 NOT NULL,
		LOGINDATE                     		DATE		 NOT NULL,
		ADMINNO                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (ADMINNO) REFERENCES ADMIN (ADMINNO)
);

COMMENT ON TABLE ALOGIN is '관리자 로그인 내역';
COMMENT ON COLUMN ALOGIN.ADMINNO is '관리자 번호';
COMMENT ON COLUMN ALOGIN.ALOGINNO is '관리자 로그인 번호';
COMMENT ON COLUMN ALOGIN.IP is '접속 IP';
COMMENT ON COLUMN ALOGIN.LOGINDATE is '로그인 날짜';


DROP SEQUENCE ALOGIN_seq;

CREATE SEQUENCE ALOGIN_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지




INSERT INTO alogin(aloginno, adminno, ip, logindate)
VALUES(ALOGIN_SEQ.nextval, 1, 123456, sysdate) 


