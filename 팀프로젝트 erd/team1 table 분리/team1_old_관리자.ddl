/**********************************/
/* Table Name: 관리자 */
/**********************************/
DROP TABLE ADMIN CASCADE CONSTRAINTS; 

CREATE TABLE ADMIN(
		ADMINNO                       		NUMBER(10)		 NULL 		 PRIMARY KEY,
		ADMINID                       		VARCHAR(30)		 NOT NULL,
		PASSWORD                      		VARCHAR(60)		 NOT NULL,
		GRADE                         		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE ADMIN is '관리자';
COMMENT ON COLUMN ADMIN.ADMINNO is '관리자 번호';
COMMENT ON COLUMN ADMIN.ADMINID is '관리자 아이디';
COMMENT ON COLUMN ADMIN.PASSWORD is '관리자 패스워드';
COMMENT ON COLUMN ADMIN.GRADE is '관리자 등급';

DROP SEQUENCE ADMIN_seq;

CREATE SEQUENCE ADMIN_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지


--1) id 중복 확인(null 값을 가지고 있으면 count에서 제외됨)
SELECT COUNT(ADMINID)
FROM admin
WHERE ADMINID='admin1';


--1. 등록
INSERT INTO ADMIN(adminno, adminid, PASSWORD,  grade)
VALUES (ADMIN_seq.nextval, 'admin1', '1234', 1);

-- 2. 목록
 
SELECT adminno, adminid, PASSWORD,  grade
FROM admin
ORDER BY grade ASC, adminid ASC;


SELECT ADMINNO, ADMINID, passwd, mname, tel, zipcode, address1, address2, mdate, grade
FROM member
ORDER BY grade ASC, id ASC;

SELECT COUNT(*) as cnt
FROM admin
WHERE id=id AND passwd=passwd

-- 관리자 정보
SELECT adminno, adminid, PASSWORD, grade
FROM admin
WHERE adminno = 1;

--adminno를 통한 회원 정보

SELECT adminno, adminid, PASSWORD, grade 
FROM admin
WHERE adminno=adminno



