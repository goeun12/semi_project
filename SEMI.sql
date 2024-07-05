-- 미리 테이블 만들어두었다면 주석 풀어서 테이블, 시퀀스 삭제
--drop table reply;
--drop table recipe;
--drop table image;
--drop table board;
--drop table member;
--drop sequence seq_member;

-- 한글 1글자 = 2or3Byte  -> 3바이트로 생각하고 최대 잡기
CREATE TABLE MEMBER(
    ID VARCHAR2(30) PRIMARY KEY,
    NAME VARCHAR2(18) NOT NULL,
    PWD VARCHAR2(100) NOT NULL,
    PHONE VARCHAR2(30) NOT NULL,
    IS_ADMIN CHAR(1) DEFAULT 'N' CHECK(IS_ADMIN IN('Y', 'N')),
    STATUS CHAR(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
    JOIN_DATE DATE DEFAULT SYSDATE
);

CREATE TABLE BOARD(
    BOARD_NO NUMBER PRIMARY KEY,
    BOARD_GENRE VARCHAR2(10) NOT NULL,
    WRITER VARCHAR2(30) NOT NULL,
    TITLE VARCHAR2(60) NOT NULL,
    CONTENT VARCHAR2(4000) NOT NULL, -- CLOB는 글이 잘려서 나올 수 있음 차라리 VARCHAR2 최대값 넣기 / 대신 최대 1333자까지 가능(아마도)
    CREATE_DATE DATE DEFAULT SYSDATE,
    UPDATE_DATE DATE DEFAULT SYSDATE,
    STATUS CHAR(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
    FOREIGN KEY(WRITER) REFERENCES MEMBER
);

CREATE TABLE REPLY(
    REPLY_NO NUMBER PRIMARY KEY,
    WRITER VARCHAR2(30) NOT NULL,
    BOARD_NO NUMBER NOT NULL,
    CONTENT VARCHAR2(300) NOT NULL,
    CREATE_DATE DATE DEFAULT SYSDATE,
    UPDATE_DATE DATE DEFAULT SYSDATE,
    STATUS CHAR(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
    FOREIGN KEY(WRITER) REFERENCES MEMBER,
    FOREIGN KEY(BOARD_NO) REFERENCES BOARD
);

CREATE TABLE RECIPE(
    RECIPE_NO NUMBER PRIMARY KEY,
    BOARD_NO NUMBER NOT NULL,
    INTRO VARCHAR2(120),
    NATION VARCHAR2(20) NOT NULL,
    DIFFICULTY VARCHAR2(5) NOT NULL,
    INGREDIENTS VARCHAR2(1500) NOT NULL,
    FOREIGN KEY(BOARD_NO) REFERENCES BOARD
);

CREATE TABLE IMAGE(
    IMAGE_NO NUMBER PRIMARY KEY,
    RECIPE_NO NUMBER NOT NULL,
    IMAGE_URL VARCHAR2(100) UNIQUE,
    IMAGE_NAME NUMBER NOT NULL,
    TITLE_IMG NUMBER DEFAULT 1 CHECK(TITLE_IMG IN(1, 0)),
    FOREIGN KEY(RECIPE_NO) REFERENCES IMAGE
);

CREATE SEQUENCE SEQ_BOARD NOCACHE;
CREATE SEQUENCE SEQ_REPLY NOCACHE;
CREATE SEQUENCE SEQ_RECIPE NOCACHE;
CREATE SEQUENCE SEQ_IMAGE NOCACHE;

-- MEMBER-BOARD VIEW: 멤버 ID를 받아와 BOARD 보여줘야 하니까? -> 필요없을수도?.. WRITER에 들어있어서 -> WRITER 번호라 VIEW작성
-- BOARD-RECIPE-IMAGE VIEW: 한번에 3군데에 있는 칼럼들을 뽑아야 하니까? -> 수업참고


-- 비번 암호화 안되어있어서 이대로 등록하면 로그인 안됨 -> java코드로 bcrpyt.encode입력해서 암호화된 키로 입력
insert into member values('user01', '가가가', 'pass01', '01011112222', default, default, sysdate);
insert into member values('user02', '나나나', 'pass02', '01022223333', default, default, sysdate);
insert into member values('user03', '다다다', 'pass03', '01033334444', default, default, sysdate);
insert into member values('user04', '라라라', 'pass04', '01044445555', default, default, sysdate);
insert into member values('admin', '관리자', 'admin123', '01055556666', 'Y', default, sysdate);

insert into board values(seq_board.nextval, '레시피', 'user01', '떡라면', '냄비에 물을 붓고 끓인다.§§●스프를 끓는 물에 넣는다.§§●떡과 라면, 후레이크를 넣고 끓인다.', sysdate, sysdate, default);
insert into board values(seq_board.nextval, '꿀팁', 'user01', '라면에 계란 넣어서 먹어봐', '근데 넣고 풀지말고 냄비 가운데에 넣고 면으로 덮어둔 다음에 조금 끓이고 먹으면 치즈라면 맛남', sysdate, sysdate, default);
insert into board values(seq_board.nextval, '꿀팁', 'user02', '제로 탕후루 진짜 맛있었음', '얼음 띄운 물에 그냥 냉동과일 넣어서 얼려 먹는건데 탕후루 식감나서 좋았어. 설탕도 안들어있으니까 탕후루 먹고 싶으면 이렇게 하면 될듯', sysdate, sysdate, default);
insert into board values(seq_board.nextval, '공지', 'admin', '혼밥심 사이트 동작이 시작되었습니다.', '안녕하세요, 관리자 admin입니다. 저희 혼밥심은 혼자서 식사할 때 저렴한 비용, 짧은 조리 시간 등을 고려한 식사 레시피를 올리는 곳입니다. 그 외에도 무엇을 먹는지 추천하는 랜덤 요리 메뉴와 사용자 간의 커뮤니케이션을 위해 꿀팁 게시판이라는 커뮤니티를 열어두고 있으니 많이 참여해주세요.', sysdate, sysdate, default);
insert into board values(seq_board.nextval, '레시피', 'user04', '계란말이', '계란 3개를 풀어낸 뒤 소금 2꼬집과 후추 1꼬집을 넣는다.§§●팬에 기름을 바른 뒤, 중약불로 계란물을 얇게 붓는다.§§●계란물이 익으면 돌돌 말아낸 뒤, 다시 계란물을 부어 반복한다.', sysdate, sysdate, default);

-- board_no 다르면 실행 안됨
insert into recipe values(seq_recipe.nextval, 1, '맛있는 라면에 떡사리를 추가해 더욱 맛있게 먹을 수 있다.', '한식', '하', '봉지 라면, 떡');
insert into recipe values(seq_recipe.nextval, 5, '포슬포슬한 계란말이다. 맛있다.', '한식', '하', '계란 3개, 소금, 후추');

