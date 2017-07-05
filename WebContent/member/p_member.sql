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

INSERT INTO p_member(mem_num,id,pwd,name,phone,email,addr,regdate) VALUES(p_member_seq.NEXTVAL,'aaa','aaa','aaa','aaa','aaa','aaa',SYSDATE);

