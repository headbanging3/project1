
/*
 * 
 * 회원 테이블 p_member
 * 고객센터 테이블 p_service
 * 
 * 고객센터 테이블 따로만듬 ㅜㅜ
 * 참조키 : p_member.mem_num 컬럼하고 p_service.mem_num  
 * 
*/

SELECT * FROM p_member;

CREATE TABLE p_member
(
   mem_num NUMBER(20) PRIMARY KEY,
   id VARCHAR2(20) UNIQUE NOT NULL,
   pwd VARCHAR2(20) NOT NULL,
   name VARCHAR2(20) NOT NULL,
   phone VARCHAR2(20) NOT NULL,
   email VARCHAR2(20),
   addr VARCHAR2(100),
   regdate DATE
);

CREATE SEQUENCE p_member_seq;

/*
 * 여기부터 고객센터 테이블 테이블만 만들면 됨
 */

SELECT * FROM p_service;
DROP TABLE p_service;

CREATE TABLE p_service
(
	mem_num NUMBER(20),
	s_content VARCHAR2(200),
	CONSTRAINT FK_p_s_num FOREIGN KEY (mem_num)
    REFERENCES p_member(mem_num)
);

INSERT INTO P_SERVICE (mem_num, s_content)
VALUES(2, '테스트');

SELECT p_service.mem_num, p_service.mem_num, s_content from p_service
INNER JOIN p_member ON p_member.mem_num=p_service.mem_num;
