
/* 게시물태그 */
DROP TABLE BRD_TAG 
	CASCADE CONSTRAINTS;

/* 사용자태그 */
DROP TABLE USER_TAG 
	CASCADE CONSTRAINTS;
	
/* 댓글 */
DROP TABLE CMTS 
	CASCADE CONSTRAINTS;
	
/* 게시물 */
DROP TABLE BRDS 
	CASCADE CONSTRAINTS;
	
/* 사용자 */
DROP TABLE USERS 
	CASCADE CONSTRAINTS;
	
/* 사용자 */
CREATE TABLE USERS (
	USER_ID INTEGER NOT NULL, /* 사용자 일련번호 */
	EMAIL VARCHAR2(40) NOT NULL, /* 이메일 */
	PWD VARCHAR(255) NOT NULL /* 비밀번호 */
);

ALTER TABLE USERS
	ADD
		CONSTRAINT PK_USERS
		PRIMARY KEY (
			USER_ID
		);

ALTER TABLE USERS
	ADD
		CONSTRAINT UK_USERS
		UNIQUE (
			EMAIL
		);

/* 게시물 */
CREATE TABLE BRDS (
	BRD_ID INTEGER NOT NULL, /* 게시물 일련번호 */
	USER_ID INTEGER NULL, /* 사용자 일련번호 */
	TLE VARCHAR2(50) NOT NULL, /* 제목 */
	DES       CLOB         NULL, /* 내용 */
	FILE_PATH VARCHAR2(255) NOT NULL, /* 파일경로 */
	FILE_NAME VARCHAR2(255) NOT NULL, /* 파일경로 */
	FILE_LENGTH INTEGER NULL,
	CATE VARCHAR2(50), /* 카테고리 */
	REG_DATE DATE NOT NULL /* 등록시간 */
);

ALTER TABLE BRDS
	ADD
		CONSTRAINT PK_BRDS
		PRIMARY KEY (
			BRD_ID
		);

ALTER TABLE BRDS
	ADD
		CONSTRAINT UK_BRDS
		UNIQUE (
			TLE
		);

/* 댓글 */
CREATE TABLE CMTS (
	CMT_ID INTEGER NOT NULL, /* 댓글 일련번호 */
	USER_ID INTEGER NOT NULL, /* 사용자 일련번호 */
	BRD_ID INTEGER NOT NULL, /* 게시물 일련번호 */
	DES      CLOB    NOT NULL, /* 내용 */
	REG_DATE DATE NOT NULL /* 등록시간 */
);

ALTER TABLE CMTS
	ADD
		CONSTRAINT PK_CMTS
		PRIMARY KEY (
			CMT_ID
		);

/* 게시물태그 */
CREATE TABLE BRD_TAG (
	TAG_ID INTEGER NOT NULL, /* 태그 일련번호 */
	BRD_ID INTEGER NOT NULL, /* 게시물 일련번호 */
	TAG_NAME VARCHAR2(50) /* 태그명 */
);

ALTER TABLE BRD_TAG
	ADD
		CONSTRAINT PK_BRD_TAG
		PRIMARY KEY (
			TAG_ID
		);

/* 사용자태그 */
CREATE TABLE USER_TAG (
	TAG_ID INTEGER NOT NULL, /* 태그일련번호 */
	USER_ID INTEGER NOT NULL, /* 사용자 일련번호 */
	TAG_NAME VARCHAR2(50) /* 태그명 */
);

ALTER TABLE USER_TAG
	ADD
		CONSTRAINT PK_USER_TAG
		PRIMARY KEY (
			TAG_ID
		);

ALTER TABLE BRDS
	ADD
		CONSTRAINT FK_USERS_TO_BRDS
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USERS (
			USER_ID
		);

ALTER TABLE CMTS
	ADD
		CONSTRAINT FK_USERS_TO_CMTS
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USERS (
			USER_ID
		);

ALTER TABLE CMTS
	ADD
		CONSTRAINT FK_BRDS_TO_CMTS
		FOREIGN KEY (
			BRD_ID
		)
		REFERENCES BRDS (
			BRD_ID
		);

ALTER TABLE BRD_TAG
	ADD
		CONSTRAINT FK_BRDS_TO_BRD_TAG
		FOREIGN KEY (
			BRD_ID
		)
		REFERENCES BRDS (
			BRD_ID
		);

ALTER TABLE USER_TAG
	ADD
		CONSTRAINT FK_USERS_TO_USER_TAG
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USERS (
			USER_ID
		);
		
DROP SEQUENCE SEQ_USER;
DROP SEQUENCE SEQ_BRD;
DROP SEQUENCE SEQ_USER_TAG;
DROP SEQUENCE SEQ_BRD_TAG;
DROP SEQUENCE SEQ_BRD_CMT;

CREATE SEQUENCE SEQ_USER START WITH 10000 INCREMENT BY 1;
CREATE SEQUENCE SEQ_BRD START WITH 10000 INCREMENT BY 1;
CREATE SEQUENCE SEQ_USER_TAG START WITH 10000 INCREMENT BY 1;
CREATE SEQUENCE SEQ_BRD_TAG START WITH 10000 INCREMENT BY 1;
CREATE SEQUENCE SEQ_BRD_CMT START WITH 10000 INCREMENT BY 1;

DROP TRIGGER TRG_USER;
DROP TRIGGER TRG_BRD;
DROP TRIGGER TRG_USER_TAG;
DROP TRIGGER TRG_BRD_TAG;
DROP TRIGGER TRG_BRD_CMT;

CREATE TRIGGER TRG_USER BEFORE INSERT ON USERS FOR EACH ROW
BEGIN
	SELECT SEQ_USER.NEXTVAL INTO:NEW.USER_ID FROM DUAL;
	END;
	/

CREATE TRIGGER TRG_BRD BEFORE INSERT ON BRDS FOR EACH ROW
BEGIN
	SELECT SEQ_BRD.NEXTVAL INTO:NEW.BRD_ID FROM DUAL;
	END;
	/

CREATE TRIGGER TRG_USER_TAG BEFORE INSERT ON USER_TAG FOR EACH ROW
BEGIN
	SELECT SEQ_USER_TAG.NEXTVAL INTO:NEW.TAG_ID FROM DUAL;
	END;
	/

CREATE TRIGGER TRG_BRD_TAG BEFORE INSERT ON BRD_TAG FOR EACH ROW
BEGIN
	SELECT SEQ_BRD_TAG.NEXTVAL INTO:NEW.TAG_ID FROM DUAL;
	END;
	/

CREATE TRIGGER TRG_BRD_CMT BEFORE INSERT ON CMTS FOR EACH ROW
BEGIN
	SELECT SEQ_BRD_CMT.NEXTVAL INTO:NEW.CMT_ID FROM DUAL;
	END;
	/
	
commit;