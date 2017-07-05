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

SELECT * FROM p_service;
DROP TABLE p_service;

CREATE TABLE p_service
(
	mem_num NUMBER(20) PRIMARY KEY,
	s_content CLOB,
	CONSTRAINT FK_p_s_num FOREIGN KEY (mem_num)
    REFERENCES p_member(mem_num)
);

INSERT INTO P_SERVICE (mem_num, s_content)
VALUES(2, '테스트');

SELECT p_service.mem_num, p_service.mem_num, s_content from p_service
INNER JOIN p_member ON p_member.mem_num=p_service.mem_num;


ALTER TABLE p_member ADD
(
	CONSTRAINT FK_SERNUM
	FOREIGN KEY (mem_num)
		REFERENCES p_service(mem_num)
);









