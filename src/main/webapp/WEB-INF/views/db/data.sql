-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.
-- DROP SEQUENCES
DROP SEQUENCE WISHLIST_SEQ;
DROP SEQUENCE FAQ_SEQ;
DROP SEQUENCE NOTICE_SEQ;
DROP SEQUENCE REVIEW_SEQ;
DROP SEQUENCE RESERVATION_SEQ;
DROP SEQUENCE REPLY_SEQ;
DROP SEQUENCE CLUBLIST_SEQ;
DROP SEQUENCE PLACEOPTION_SEQ;
DROP SEQUENCE PLACE_SEQ;
DROP SEQUENCE SELLER_SEQ;
DROP SEQUENCE PLACECATEGORY_SEQ;
DROP SEQUENCE CLUB_SEQ;
DROP SEQUENCE MEMBER_SEQ;
DROP SEQUENCE CATEGORY_SEQ;

-- DROP TABLES

DROP TABLE WISHLIST;
DROP TABLE FAQ;
DROP TABLE NOTICE; 
DROP TABLE REVIEW;
DROP TABLE RESERVATION;
DROP TABLE REPLY;
DROP TABLE CLUBLIST;
DROP TABLE PLACEOPTION;
DROP TABLE PLACE;
DROP TABLE SELLER;
DROP TABLE PLACECATEGORY;
DROP TABLE CLUB;
DROP TABLE CATEGORY;
DROP TABLE MEMBER;


-- DROP SEQUENCES
DROP SEQUENCE WISHLIST_SEQ;
DROP SEQUENCE FAQ_SEQ;
DROP SEQUENCE NOTICE_SEQ;
DROP SEQUENCE REVIEW_SEQ;
DROP SEQUENCE RESERVATION_SEQ;
DROP SEQUENCE REPLY_SEQ;
DROP SEQUENCE CLUBLIST_SEQ;
DROP SEQUENCE PLACEOPTION_SEQ;
DROP SEQUENCE PLACE_SEQ;
DROP SEQUENCE SELLER_SEQ;
DROP SEQUENCE PLACECATEGORY_SEQ;
DROP SEQUENCE CLUB_SEQ;
DROP SEQUENCE MEMBER_SEQ;

-- DROP TABLES

DROP TABLE WISHLIST;
DROP TABLE FAQ;
DROP TABLE NOTICE; 
DROP TABLE REVIEW;
DROP TABLE RESERVATION;
DROP TABLE REPLY;
DROP TABLE CLUBLIST;
DROP TABLE PLACEOPTION;
DROP TABLE PLACE;
DROP TABLE SELLER;
DROP TABLE PLACECATEGORY;
DROP TABLE CLUB;
DROP TABLE MEMBER;

select * from member;
select * from place;
select * from placeoption;
select * from review
update review set rv_postdate where 
update place set p_img = '["P_IMG01.jpg", "P_IMG02.jpg", "P_IMG03.jpg"]' where p_no=7;

-- MEMBER Table Create SQL
CREATE TABLE MEMBER
(

    M_NO NUMBER PRIMARY KEY, 
    M_ID VARCHAR2(100) NOT NULL UNIQUE, 
    M_PW VARCHAR2(100) NOT NULL, 
    M_PHONE VARCHAR2(20) NOT NULL UNIQUE , 
    M_NAME VARCHAR2(50) NOT NULL, 
    M_BIRTH VARCHAR2(20) NOT NULL, 
    M_NICK VARCHAR2(100) NOT NULL UNIQUE , 
    M_EMAIL VARCHAR2(100) NOT NULL UNIQUE , 
    M_REGDATE DATE NOT NULL, 
    M_AGREEMENT NUMBER NOT NULL
);

CREATE SEQUENCE MEMBER_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL , 'aaaa' , '1111' , '010-1111-2222', '홍길동',  '1992-07-03', '길동1','hong1@naver.com' , SYSDATE , 1 , 2);
INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL , 'bbbb' , '2222' , '010-1111-2223', '김길동',  '1992-07-04', '길동2','hong2@naver.com' , SYSDATE , 2 , 3);
INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL , 'cccc' , '3333' , '010-1111-2224', '이길동',  '1992-07-05', '길동3','hong3@naver.com' , SYSDATE , 3 , 4);
INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL , 'dddd' , '4444' , '010-1111-2225', '박길동',  '1992-07-06', '길동4','hong4@naver.com' , SYSDATE , 4 , 5);
INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL , 'eeee' , '5555' , '010-1111-2226', '최길동',  '1992-07-07', '길동5','hong5@naver.com' , SYSDATE , 5 , 6);
INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL , 'ffff' , '6666' , '010-1111-2227', '정길동',  '1992-07-08', '길동6','hong6@naver.com' , SYSDATE , 6 , 7);
INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL , 'gggg' , '7777' , '010-1111-2228', '한길동',  '1992-07-09', '길동7','hong7@naver.com' , SYSDATE , 7 , 8);
INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL , 'hhhh' , '8888' , '010-1111-2229', '곽길동',  '1992-07-10', '길동8','hong8@naver.com' , SYSDATE , 8 , 9);
INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL , 'iiii' , '9999' , '010-1111-2210', '강길동',  '1992-07-11', '길동9','hong9@naver.com' , SYSDATE , 9 , 10);
SELECT * FROM MEMBER
-- CLUB Table Create SQL
CREATE TABLE CLUB
(
    C_NO           NUMBER           PRIMARY KEY, 
    M_NO           NUMBER            NULL, 
    C_TITLE        VARCHAR2(100)     NOT NULL, 
    C_DESC         VARCHAR2(300)     NOT NULL, 
    C_CONTENT      VARCHAR2(4000)    NULL, 
    C_POSTDATE     DATE             NOT NULL,
    C_STARTDATE    DATE    			 NOT NULL, 
    C_ENDDATE      DATE              NOT NULL, 
    C_MIN          NUMBER            NOT NULL, 
    C_MAX          NUMBER            NOT NULL, 
    C_MAINIMG	   VARCHAR2(1000)	 NOT NULL,
    C_IMG1		   VARCHAR2(1000)    NULL, 
    C_IMG2		   VARCHAR2(1000)    NULL, 
    C_IMG3		   VARCHAR2(1000)    NULL, 
    C_SUBCONTENT1  VARCHAR2(1000)	 NULL,
    C_SUBCONTENT2  VARCHAR2(1000)	 NULL,
    C_SUBCONTENT3  VARCHAR2(1000)	 NULL,
    C_DELETE       NUMBER            NOT NULL,
    C_PART         NUMBER            NOT NULL,
    CONSTRAINT FK_MEMBER_CLUB FOREIGN KEY (M_NO) REFERENCES MEMBER(M_NO) ON DELETE SET NULL
);

CREATE SEQUENCE CLUB_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- PLACECATEGORY Table Create SQL
CREATE TABLE PLACECATEGORY
(
    PC_NO      NUMBER           PRIMARY KEY, 
    PC_NAME    VARCHAR2(100)    NULL
);

CREATE SEQUENCE PLACECATEGORY_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- SELLER Table Create SQL
CREATE TABLE SELLER
(
    S_NO           NUMBER           PRIMARY KEY, 
    S_ID           VARCHAR2(100)    NOT NULL UNIQUE, 
    S_PW           VARCHAR2(100)    NOT NULL, 
    S_PHONE        VARCHAR2(20)     NOT NULL UNIQUE, 
    S_NAME         VARCHAR2(50)     NOT NULL, 
    S_BIRTH        VARCHAR2(20)     NOT NULL, 
    S_EMAIL        VARCHAR2(100)    NOT NULL UNIQUE , 
    S_REGDATE      DATE             NOT NULL, 
    S_AGREEMENT    NUMBER           NOT NULL, 
    S_COMPANYNO    VARCHAR2(50)     NOT NULL
);
INSERT INTO SELLER VALUES (SELLER_SEQ.NEXTVAL , '판매자1', '1111', '010-1111-1111','김철수','1992-01-01','seller1@naver.com',SYSDATE,1,1,'111-00-11111');
INSERT INTO SELLER VALUES (SELLER_SEQ.NEXTVAL , '판매자2', '1111', '010-1111-1112','김철수','1992-01-01','seller2@naver.com',SYSDATE,1,1,'111-00-11112');
INSERT INTO SELLER VALUES (SELLER_SEQ.NEXTVAL , '판매자3', '1111', '010-1111-1113','김철수','1992-01-01','seller3@naver.com',SYSDATE,1,1,'111-00-11113');
INSERT INTO SELLER VALUES (SELLER_SEQ.NEXTVAL , '판매자4', '1111', '010-1111-1114','김철수','1992-01-01','seller4@naver.com',SYSDATE,1,1,'111-00-11114');
INSERT INTO SELLER VALUES (SELLER_SEQ.NEXTVAL , '판매자5', '1111', '010-1111-1115','김철수','1992-01-01','seller5@naver.com',SYSDATE,1,1,'111-00-11115');
INSERT INTO SELLER VALUES (SELLER_SEQ.NEXTVAL , '판매자6', '1111', '010-1111-1116','김철수','1992-01-01','seller6@naver.com',SYSDATE,1,1,'111-00-11116');
INSERT INTO SELLER VALUES (SELLER_SEQ.NEXTVAL , '판매자7', '1111', '010-1111-1117','김철수','1992-01-01','seller7@naver.com',SYSDATE,1,1,'111-00-11117');
INSERT INTO SELLER VALUES (SELLER_SEQ.NEXTVAL , '판매자8', '1111', '010-1111-1118','김철수','1992-01-01','seller8@naver.com',SYSDATE,1,1,'111-00-11118');
INSERT INTO SELLER VALUES (SELLER_SEQ.NEXTVAL , '판매자9', '1111', '010-1111-1119','김철수','1992-01-01','seller9@naver.com',SYSDATE,1,1,'111-00-11119');

CREATE SEQUENCE SELLER_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- PLACE Table Create SQL
CREATE TABLE PLACE
(
    P_NO            NUMBER            PRIMARY KEY, 
    S_NO            NUMBER            , 
    PC_NO           NUMBER            , 
    P_TITLE         VARCHAR2(100)     NOT NULL, 
    P_NAME          VARCHAR2(50)      NOT NULL, 
    P_DESC          VARCHAR2(300)     NOT NULL, 
    P_CONTENT       VARCHAR2(4000)    NOT NULL, 
    P_INFO          VARCHAR2(1000)    NOT NULL, 
    P_ADDR          VARCHAR2(200)     NOT NULL, 
    P_BNAME         VARCHAR2(20)      NOT NULL, 
    P_ADDRDETAIL    VARCHAR2(100)     NULL, 
    P_IMG           VARCHAR2(1000)    NOT NULL, 
    P_CONFIRM       VARCHAR2(40)      NOT NULL, 
    P_URL           VARCHAR2(100)     NULL, 
    P_REMARK        VARCHAR2(1000)    NOT NULL, 
    P_DELETE        NUMBER            NOT NULL,
    CONSTRAINT FK_S_P FOREIGN KEY (S_NO) REFERENCES SELLER(S_NO) ON DELETE SET NULL,
    CONSTRAINT FK_PC_P FOREIGN KEY (PC_NO) REFERENCES PLACECATEGORY(PC_NO) ON DELETE SET NULL
);
INSERT INTO PLACE VALUES(PLACE_SEQ.NEXTVAL,'김밥천국' ,'외식업' , '서울시 마포구', '신촌동 1000-1', '1');
INSERT INTO PLACE VALUES(PLACE_SEQ.NEXTVAL,'김밥나라' ,'외식업' , '서울시 마포구', '신촌동 1000-1', '1');
INSERT INTO PLACE VALUES(PLACE_SEQ.NEXTVAL,'김밥나라1' ,'외식업' , '서울시 마포구', '신촌동 1000-1','1');
SELECT * FROM PLACE
UPDATE PLACE SET P_CONFIRM = '1' WHERE S_NO = 2;

CREATE SEQUENCE PLACE_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- PLACEOPTION Table Create SQL
CREATE TABLE PLACEOPTION
(
    PO_NO          NUMBER           PRIMARY KEY, 
    P_NO           NUMBER           , 
    PO_NAME        VARCHAR2(100)   NOT NULL, 
    PO_MIN         NUMBER           NOT NULL, 
    PO_MAX         NUMBER           NOT NULL, 
    PO_DAYPRICE    NUMBER           NOT NULL, 
    PO_HOLIDAY     NUMBER           NOT NULL, 
    PO_IMG         VARCHAR2(100)    NOT NULL, 
    PO_FXILITY     VARCHAR2(200)    NULL,
    CONSTRAINT FK_P_PO FOREIGN KEY (P_NO) REFERENCES PLACE(P_NO) ON DELETE CASCADE
);
CREATE SEQUENCE PLACEOPTION_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- CLUBLIST Table Create SQL
CREATE TABLE CLUBLIST
(
    CL_NO      NUMBER    PRIMARY KEY, 
    C_NO       NUMBER    , 
    M_NO       NUMBER    , 
    CL_CARD    NUMBER    NULL,
    CONSTRAINT FK_C_CL FOREIGN KEY (C_NO) REFERENCES CLUB(C_NO) ON DELETE SET NULL,
    CONSTRAINT FK_M_CL FOREIGN KEY (M_NO) REFERENCES MEMBER(M_NO) ON DELETE CASCADE
);

CREATE SEQUENCE CLUBLIST_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- REPLY Table Create SQL
CREATE TABLE REPLY
(
    R_NO          NUMBER            PRIMARY KEY, 
    C_NO          NUMBER            , 
    M_NO          NUMBER            , 
    R_CONTENT     VARCHAR2(4000)    NOT NULL, 
    R_DELETE      NUMBER            NOT NULL, 
    R_POSTDATE    DATE              NOT NULL,
    CONSTRAINT FK_C_R FOREIGN KEY (C_NO) REFERENCES CLUB(C_NO) ON DELETE SET NULL,
    CONSTRAINT FK_M_R FOREIGN KEY (M_NO) REFERENCES MEMBER(M_NO) ON DELETE SET NULL
);
INSERT INTO REPLY VALUES (REPLY_SEQ.NEXTVAL, '좋아요' , SYSDATE);
INSERT INTO REPLY VALUES (REPLY_SEQ.NEXTVAL, '좋아요1' , SYSDATE);
INSERT INTO REPLY VALUES (REPLY_SEQ.NEXTVAL, '좋아요2' , SYSDATE);
INSERT INTO REPLY VALUES (REPLY_SEQ.NEXTVAL, '좋아요3' , SYSDATE);
INSERT INTO REPLY VALUES (REPLY_SEQ.NEXTVAL, '좋아요4' , SYSDATE);
INSERT INTO REPLY VALUES (REPLY_SEQ.NEXTVAL, '좋아요5' , SYSDATE);

CREATE SEQUENCE REPLY_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;


-- RESERVATION Table Create SQL
CREATE TABLE RESERVATION
(
    RES_NO        NUMBER          PRIMARY KEY, 
    M_NO          NUMBER          , 
    PO_NO         NUMBER          , 
    RES_DATE      DATE            NOT NULL, 
    RES_PEOPLE    NUMBER          NOT NULL, 
    RES_STATE     VARCHAR2(20)    NULL,
    RES_EMAIL	  VARCHAR2(50)	  NULL,
    RES_PRICE	  NUMBER		  NULL,
    RES_APPLYNUM  NUMBER		  NULL,
    RES_PURPOSE   VARCHAR2(100)	  NULL,
    RES_REQUIREMENT VARCHAR2(500) NULL,
    CONSTRAINT FK_M_RES FOREIGN KEY (M_NO) REFERENCES MEMBER(M_NO) ON DELETE SET NULL,
    CONSTRAINT FK_PO_RES FOREIGN KEY (PO_NO) REFERENCES PLACEOPTION(PO_NO) ON DELETE SET NULL
);

CREATE SEQUENCE RESERVATION_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- REVIEW Table Create SQL
CREATE TABLE REVIEW
(
    RV_NO         NUMBER            PRIMARY KEY, 
    M_NO          NUMBER            , 
    P_NO          NUMBER            , 
    RV_DELETE     NUMBER           NOT NULL, 
    RV_STAR       NUMBER           NOT NULL,
    RV_IMG        VARCHAR2(500)    NULL,
    RV_POSTDATE	 DATE NOT NULL,
    RV_MODIFYDATE DATE NOT NULL,
    RV_CONTENT    VARCHAR2(2000)   NOT NULL,
    CONSTRAINT FK_M_RV FOREIGN KEY (M_NO) REFERENCES MEMBER(M_NO) ON DELETE SET NULL,
    CONSTRAINT FK_P_RV FOREIGN KEY (P_NO) REFERENCES PLACE(P_NO) ON DELETE SET NULL
);

INSERT INTO REVIEW VALUES (REVIEW_SEQ.NEXTVAL, '또 올게요');
INSERT INTO REVIEW VALUES (REVIEW_SEQ.NEXTVAL, '또 올게요1');
INSERT INTO REVIEW VALUES (REVIEW_SEQ.NEXTVAL, '또 올게요2');
INSERT INTO REVIEW VALUES (REVIEW_SEQ.NEXTVAL, '또 올게요3');
INSERT INTO REVIEW VALUES (REVIEW_SEQ.NEXTVAL, '또 올게요4');

CREATE SEQUENCE REVIEW_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- NOTICE Table Create SQL
CREATE TABLE NOTICE
(
    N_NO          NUMBER            PRIMARY KEY, 
    N_TITLE       VARCHAR2(100)     NOT NULL, 
    N_CONTENT     VARCHAR2(4000)    NOT NULL, 
    N_POSTDATE    DATE              NOT NULL
);

CREATE SEQUENCE NOTICE_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

INSERT INTO NOTICE VALUES (NOTICE_SEQ.NEXTVAL , '두번째 공지' , '나다라마바사' , SYSDATE);
INSERT INTO NOTICE VALUES (NOTICE_SEQ.NEXTVAL , '세번째 공지' , '다라마바사' , SYSDATE);
INSERT INTO NOTICE VALUES (NOTICE_SEQ.NEXTVAL , '네번째 공지' , '라마바사' , SYSDATE);
INSERT INTO NOTICE VALUES (NOTICE_SEQ.NEXTVAL , '다섯번째 공지' , '마바사' , SYSDATE);
INSERT INTO NOTICE VALUES (NOTICE_SEQ.NEXTVAL , '여섯번째 공지' , '바사' , SYSDATE);
INSERT INTO NOTICE VALUES (NOTICE_SEQ.NEXTVAL , '일곱번째 공지' , '사가나다라' , SYSDATE);
INSERT INTO NOTICE VALUES (NOTICE_SEQ.NEXTVAL , '여덟번째 공지' , '사가나다라마' , SYSDATE);

SELECT * FROM NOTICE;

-- FAQ Table Create SQL
-- FAQTable Create SQL
CREATE TABLE FAQ
(
    F_NO          NUMBER            PRIMARY KEY, 
    F_TITLE       VARCHAR2(100)     NOT NULL, 
    F_CONTENT     VARCHAR2(4000)    NOT NULL, 
    F_REGDATE     DATE              NOT NULL, 
    F_CATEGORY    NUMBER            NOT NULL
);

INSERT INTO FAQ VALUES (FAQ_SEQ.NEXTVAL , '바라온 환불정책' , '바라온은 아래와 같은 환불정책을 따릅니다.' , SYSDATE, 1);
INSERT INTO FAQ VALUES (FAQ_SEQ.NEXTVAL , '바라온 환불정책' , '바라온은 아래와 같은 환불정책을 따릅니다.' , SYSDATE, 2);
INSERT INTO FAQ VALUES (FAQ_SEQ.NEXTVAL , '탈퇴는 어떻게하나요?' , '더보기 => 내 정보 => 탈퇴하기' , SYSDATE, 1);
INSERT INTO FAQ VALUES (FAQ_SEQ.NEXTVAL , '탈퇴는 어떻게하나요?' , '더보기 => 내 정보 => 탈퇴하기' , SYSDATE, 3);
INSERT INTO FAQ VALUES (FAQ_SEQ.NEXTVAL , '정기vs번개' , '편한걸로' , SYSDATE, 1);
INSERT INTO FAQ VALUES (FAQ_SEQ.NEXTVAL , '정기vs번개' , '편한걸로' , SYSDATE, 4);



SELECT * FROM FAQ;
SELECT F_TITLE,F_REGDATE FROM FAQ WHERE F_CATEGORY BETWEEN 1 AND 4;

SELECT * FROM FAQ WHERE F_CATEGORY IN (1,2,3,4);

CREATE SEQUENCE FAQ_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- WISHLIST Table Create SQL
CREATE TABLE WISHLIST
(
    W_NO    NUMBER    PRIMARY KEY, 
    C_NO    NUMBER    , 
    M_NO    NUMBER    ,
    CONSTRAINT FK_C_W FOREIGN KEY (C_NO) REFERENCES CLUB(C_NO) ON DELETE SET NULL,
    CONSTRAINT FK_M_W FOREIGN KEY (M_NO) REFERENCES MEMBER(M_NO) ON DELETE CASCADE
);

CREATE SEQUENCE WISHLIST_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

CREATE TABLE EVENT
(
    E_NO    		NUMBER    			PRIMARY KEY, 
    E_TITLE			VARCHAR2(300),
    E_CONTENT    	VARCHAR2(4000),    
    E_FILENAME   	VARCHAR2(300),    
	E_POSTDATE		DATE 		
);

CREATE SEQUENCE EVENT_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

SELECT * FROM EVENT;
DROP TABLE EVENT;
DROP SEQUENCE EVENT_SEQ;

