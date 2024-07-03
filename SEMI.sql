-- �ѱ� 1���� = 2or3Byte  -> 3����Ʈ�� �����ϰ� �ִ� ���
CREATE TABLE MEMBER(
    MEMBER_NO NUMBER PRIMARY KEY,
    NAME VARCHAR2(15) NOT NULL,
    ID VARCHAR2(30) NOT NULL UNIQUE,
    PWD VARCHAR2(100) NOT NULL,
    PHONE VARCHAR2(30) NOT NULL,
    IS_ADMIN CHAR(1) DEFAULT 'N' CHECK(IS_ADMIN IN('Y', 'N')),
    STATUS CHAR(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
    JOIN_DATE DATE DEFAULT SYSDATE
);

CREATE TABLE BOARD(
    BOARD_NO NUMBER PRIMARY KEY,
    BOARD_GENRE VARCHAR2(10) NOT NULL,
    WRITER NUMBER NOT NULL,
    TITLE VARCHAR2(60) NOT NULL,
    CONTENT VARCHAR2(4000) NOT NULL, -- CLOB�� ���� �߷��� ���� �� ���� ���� VARCHAR2 �ִ밪 �ֱ� / ��� �ִ� 1333�ڱ��� ����(�Ƹ���)
    CREATE_DATE DATE DEFAULT SYSDATE,
    UPDATE_DATE DATE DEFAULT SYSDATE,
    STATUS CHAR(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
    FOREIGN KEY(WRITER) REFERENCES MEMBER
);

CREATE TABLE REPLY(
    REPLY_NO NUMBER PRIMARY KEY,
    WRITER NUMBER NOT NULL,
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

CREATE SEQUENCE SEQ_MEMBER START WITH 100 NOCACHE; -- ������ȣ�� 100������ ����
CREATE SEQUENCE SEQ_BOARD NOCACHE;
CREATE SEQUENCE SEQ_REPLY NOCACHE;
CREATE SEQUENCE SEQ_RECIPE NOCACHE;
CREATE SEQUENCE SEQ_IMAGE NOCACHE;

-- MEMBER-BOARD VIEW: ��� ID�� �޾ƿ� BOARD ������� �ϴϱ�? -> �ʿ��������?.. WRITER�� ����־ -> WRITER ��ȣ�� VIEW�ۼ�
-- BOARD-RECIPE-IMAGE VIEW: �ѹ��� 3������ �ִ� Į������ �̾ƾ� �ϴϱ�? -> ��������

insert into member values(seq_member.nextval, '������', 'user01', 'pass01', '01011112222', default, default, sysdate);
insert into member values(seq_member.nextval, '������', 'user02', 'pass02', '01022223333', default, default, sysdate);
insert into member values(seq_member.nextval, '�ٴٴ�', 'user03', 'pass03', '01033334444', default, default, sysdate);
insert into member values(seq_member.nextval, '����', 'user04', 'pass04', '01044445555', default, default, sysdate);
insert into member values(seq_member.nextval, '������', 'admin', 'admin123', '01055556666', 'Y', default, sysdate);

insert into board values(seq_board.nextval, '������', 106, '�����', '���� ���� �װ� ���δ�.�ססܽ����� ���� ���� �ִ´�.�ססܶ��� ���, �ķ���ũ�� �ְ� ���δ�.', sysdate, sysdate, default);
insert into board values(seq_board.nextval, '����', 108, '��鿡 ��� �־ �Ծ��', '�ٵ� �ְ� Ǯ������ ���� ����� �ְ� ������ ����� ������ ���� ���̰� ������ ġ���� ����', sysdate, sysdate, default);
insert into board values(seq_board.nextval, '����', 107, '���� ���ķ� ��¥ ���־���', '���� ��� ���� �׳� �õ����� �־ ��� �Դ°ǵ� ���ķ� �İ����� ���Ҿ�. ������ �ȵ�������ϱ� ���ķ� �԰� ������ �̷��� �ϸ� �ɵ�', sysdate, sysdate, default);
insert into board values(seq_board.nextval, '����', 109, 'ȥ��� ����Ʈ ������ ���۵Ǿ����ϴ�.', '�ȳ��ϼ���, ������ admin�Դϴ�. ���� ȥ����� ȥ�ڼ� �Ļ��� �� ������ ���, ª�� ���� �ð� ���� ����� �Ļ� �����Ǹ� �ø��� ���Դϴ�. �� �ܿ��� ������ �Դ��� ��õ�ϴ� ���� �丮 �޴��� ����� ���� Ŀ�´����̼��� ���� ���� �Խ����̶�� Ŀ�´�Ƽ�� ����ΰ� ������ ���� �������ּ���.', sysdate, sysdate, default);
insert into board values(seq_board.nextval, '������', 105, '�������', '��� 3���� Ǯ� �� �ұ� 2������ ���� 1������ �ִ´�.�סס��ҿ� �⸧�� �ٸ� ��, �߾�ҷ� ������� ��� �״´�.�ססܰ������ ������ ���� ���Ƴ� ��, �ٽ� ������� �ξ� �ݺ��Ѵ�.', sysdate, sysdate, default);

insert into recipe values(seq_recipe.nextval, 1, '���ִ� ��鿡 ���縮�� �߰��� ���� ���ְ� ���� �� �ִ�.', '�ѽ�', '��', '���� ���, ��');
insert into recipe values(seq_recipe.nextval, 5, '���������� ������̴�. ���ִ�.', '�ѽ�', '��', '��� 3��, �ұ�, ����');

