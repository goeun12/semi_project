ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

CREATE USER SEMI IDENTIFIED BY SEMI;

ALTER USER SEMI DEFAULT TABLESPACE SYSTEM QUOTA UNLIMITED ON SYSTEM;

GRANT CONNECT, RESOURCE TO SEMI;

GRANT CREATE VIEW TO SEMI;
