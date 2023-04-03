/*
ȸ������ ���̺� �ۼ�
�޾ƾ� �Ǵ� ����

����� ���̵�
��й�ȣ
�̸���
�̸�
�������
����
����ó1(Cell Phone)
����ó2(H.P.)
������  - FK address
���ɰ���  - FK INTEREST
���νð���
�ڰ���
�з� --Fk education_level
ȸ�� ���(ex. �л�, ����, ���л�, ������ ���) --Fk grade
*/

/*
users : ȸ�� ���� ���̺�
    grade : ȸ�� ��� ���� ���̺�
    INTEREST : ���� �о� ���� ���̺�
    education_level : �з� ���� ���̺�
    address : �ּ� ���� ���̺�
STUDY_TIME : ���� �ð� ���� ���̺�
RANKING : ���� ���̺�
study_cafe : ���� ���� ���͵� ī�� ���� ���̺�
message2 : ���� ���� ���̺�
user_log : ���� ���� ���̺�
*/
--CREATE-----------------------------------------------------------------------------------------------------------------------
CREATE TABLE users(
  id VARCHAR2(20) PRIMARY KEY, -- ����� ���̵�
  pw VARCHAR2(20) NOT NULL, -- ��й�ȣ
  email VARCHAR2(50) NOT NULL UNIQUE, -- �̸���
  name VARCHAR2(20) NOT NULL, -- �̸�, ���� �Ǹ����� �ǹ��Ƚ��ϴ�... �г� ����
  birthday DATE NOT NULL, -- �������. �̰ɷ� ���� ���
  gender VARCHAR2(10) NOT NULL, -- ����
  phone1 VARCHAR2(20) NOT NULL, -- ��ȭ��ȣ1
  phone2 VARCHAR2(20), -- ��ȭ��ȣ2
  address VARCHAR2(100), -- ������
  interest VARCHAR2(50), -- ���� ����
  hourStudy VARCHAR2(50), -- ���� �ð���
  certificate VARCHAR2(100), -- �ڰ���
  Education_level VARCHAR2(50), -- �з�
  grade VARCHAR2(20) NOT NULL -- ȸ�� ���(ex. �л�, ����, ���л�, ������ ���)
);

--ȸ�� ��� ���̺� �߰�
CREATE TABLE grade (
  GRADE_CODE VARCHAR2(20) PRIMARY KEY,
  GRADE VARCHAR2(20) NOT NULL
);

--���ɺо� ���̺� �߰�
CREATE TABLE INTEREST (
INTEREST_CODE VARCHAR(20) PRIMARY KEY,
INTEREST VARCHAR(20)
);

--���νð� ���̺��߰�
CREATE TABLE STUDY_TIME(
  STUDY_ID VARCHAR2(20) PRIMARY KEY,
  SUBJECT VARCHAR2(20),
  STUDY_TIME INT,
  STUDY_DATE TIMESTAMP DEFAULT SYSDATE
);

--���� ���̺� �߰�
  --"RANK_SCORE" ���� ��ü �ڸ����� 3�̰� ������ 2�� null�� �ƴ� NUMBER ��
  --��, �Ҽ��� ���� �ִ� 2�ڸ��� �����Ͽ� �ִ� �� 3�ڸ��� ���� ���� ����.
  --EX) 0.00, 1.23, 99.99 ��� ���� ���� ����
  -- ����� ������ ����
CREATE TABLE RANKING (
  RANK_CODE VARCHAR2(20) PRIMARY KEY,
  RANK_NAME VARCHAR2(20) NOT NULL,
  RANK_SCORE NUMBER(3,2) NOT NULL
);

CREATE TABLE study_cafe (
  study_cafe_id NUMBER(10) PRIMARY KEY, --���͵�ī�� �ڵ�
  study_cafe_name VARCHAR2(50) NOT NULL, --���͵�ī�� �̸�
  study_cafe_address VARCHAR2(100) NOT NULL, --�ּ�
  study_cafe_phone VARCHAR2(20) NOT NULL, --��ȭ��ȣ
  study_cafe_hours VARCHAR2(50) NOT NULL, --��ð�
  study_cafe_fee NUMBER(10, 2) NOT NULL, --���
  study_cafe_facilities VARCHAR2(100), --�����ü�(��������,��ǻ��,������ ��)
  study_cafe_amenities VARCHAR2(100) --���ǽü�(����,����,�ްԽ� ��)
);

--����
CREATE TABLE message2 (
    message_id INT PRIMARY KEY,
    sender_id VARCHAR2(20),
    receiver_id VARCHAR2(20),
    message_text NVARCHAR2(1000),
	created_date DATE
);

--�з� ���̺�
CREATE TABLE education_level (
  education_level_id VARCHAR2(50) PRIMARY KEY, -- �з¼��� ID
  education_level_name VARCHAR2(50) NOT NULL -- �з¼��� �̸�
);

--�ּ� ���̺�
create table address
(city_number varchar2(60) PRIMARY key,
gwangcity_do varchar2(60),
city_District varchar2(60),
eup_myeon_dong varchar2(60),
Ri_tong varchar2(60));
/*
--ȸ�� Ż�� ���̺�
create table withdraw_id(
id VARCHAR2(20) PRIMARY KEY,--Ż�� ID
date varchar2(20)--Ż�� ��¥ 
);
*/
CREATE TABLE user_log (
    log_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,  -- �α� id
    user_id VARCHAR2(20) NOT NULL, -- ���� ���̵�
    log_time TIMESTAMP(6) NOT NULL, -- �α� �ð�
    log_type VARCHAR2(50) NOT NULL, -- �α� ����(�α���, �α� �ƿ�, ȸ��Ż�� ��)
    log_message VARCHAR2(255), -- �α� �޽��� , ������ � �ൿ�� �� �� ���
    ip_address VARCHAR2(50) NOT NULL -- �α� ip �ּ�.
);
--ALTER-----------------------------------------------------------------------------------------------------------------------
ALTER TABLE users
ADD CONSTRAINT fk_education_level
FOREIGN KEY (Education_level)
REFERENCES education_level (education_level_id);  --�з��� �з����̺��� �����ϰ� ��

--FK_GRADE_CODE"��� �ܷ� Ű ���� ������ "users" ���̺� �߰�
-- "users" ���̺��� "GRADE" ���� "grade"�� "GRADE_CODE" ���� ����
ALTER TABLE USERS
ADD CONSTRAINT FK_GRADE_CODE 
FOREIGN KEY(GRADE)
REFERENCES GRADE(GRADE_CODE);

--���ɺо� ���̺� �ܷ�Ű �߰�
ALTER TABLE USERS
ADD CONSTRAINT FK_INTEREST_CODE
FOREIGN KEY(INTEREST)
REFERENCES INTEREST(INTEREST_CODE);

ALTER TABLE users
ADD CONSTRAINT fk_users_grade
FOREIGN KEY (grade)
REFERENCES grade(grade_id);

--�ּ� �ܷ�Ű �߰�
alter table users add CONSTRAINT fk_city_number
foreign KEY(address) references address(city_number);
--INSERT-----------------------------------------------------------------------------------------------------------------------
--7���� ȸ��������� ����
INSERT INTO GRADE VALUES(1, '�л�');
INSERT INTO GRADE VALUES(2, '������');
INSERT INTO GRADE VALUES(3, '���л�');
INSERT INTO GRADE VALUES(4, '���ػ�');
INSERT INTO GRADE VALUES(5, '������');
INSERT INTO GRADE VALUES(6, '�����');
INSERT INTO GRADE VALUES(7, '������');

INSERT INTO INTEREST VALUES('1','����');--KOREAN_LAN
INSERT INTO INTEREST VALUES('2','����');--ENGLISH);
INSERT INTO INTEREST VALUES('3','����');--;MATHEMATICS);
INSERT INTO INTEREST VALUES('4','����');--COLLEGE
INSERT INTO INTEREST VALUES('5','����');--TOEIC);
INSERT INTO INTEREST VALUES('6','�ֽ�');--REALTOL);
INSERT INTO INTEREST VALUES('7','�۰���');
INSERT INTO INTEREST VALUES('8','�ֽ�');--STOCK);
INSERT INTO INTEREST VALUES('9','���');--EMPLOYMENT);
INSERT INTO INTEREST VALUES('10','â��');--STARTUPS);

/*INSERT INTO study_cafe (cafe_id, cafe_name, address, phone, open_time, close_time, facilities, seats, outlets, wifi, smoking_area, membership, membership_fee)
VALUES ('SC0001', '���� ���͵�ī��', '����Ư���� ���α� ���� 123', '02-123-4567', '09:00', '22:00', '���ĵ�, ȸ�ǽ�, ��Ʈ�� �뿩, ��������', 50, 20, '�������ͳ�', '�и��� ���� ��� �ݿ�', '�����̾� �����', 30000);
INSERT INTO study_cafe (cafe_id, cafe_name, address, phone, open_time, close_time, facilities, seats, outlets, wifi, smoking_area, membership, membership_fee)
VALUES ('SC0002', '���� ���͵�ī��', '����Ư���� ������ ������� 123', '02-234-5678', '10:00', '23:00', '���ĵ�, �����Ӱ� �̿� ������ ����, ��������', 60, 30, '�������ͳ�', '�� ����', '������ �����', 20000);
INSERT INTO study_cafe (cafe_id, cafe_name, address, phone, open_time, close_time, facilities, seats, outlets, wifi, smoking_area, membership, membership_fee)
VALUES ('SC0003', 'ȫ�� ���͵�ī��', '����Ư���� ������ �Ϳ��� 123', '02-345-6789', '08:00', '22:00', '���ĵ�, ��Ʈ�� �뿩, ��������', 40, 15, '�������ͳ�', '�и��� ���� ��� �ݿ�', '�����̾� �����', 35000);
INSERT INTO study_cafe (cafe_id, cafe_name, address, phone, open_time, close_time, facilities, seats, outlets, wifi, smoking_area, membership, membership_fee)
VALUES ('SC0004', '�Ǵ� ���͵�ī��', '����Ư���� ������ �ɵ��� 123', '02-456-7890', '11:00', '02:00', '���ĵ�, ��Ʈ�� �뿩, ��������, �߰� ����', 70, 25, '�������ͳ�', '�� ����', '������ �����', 15000);*/
--�ӽ� �ڷᵵ �ֱ� �ѵ� �������� FK�� �ҷ����°� ������? ���������̺��� �ܼ�ȭ�ؼ� �� ���� ���ô�
INSERT INTO address (city_number, gwangcity_do, city_District) VALUES ('0','�뱸������', '�߱�');
INSERT INTO address (city_number, gwangcity_do, city_District) VALUES ('1', '�뱸������', '����');
INSERT INTO address (city_number, gwangcity_do, city_District) VALUES ('2', '�뱸������', '����');
INSERT INTO address (city_number, gwangcity_do, city_District) VALUES ('3', '�뱸������', '����');
INSERT INTO address (city_number, gwangcity_do, city_District) VALUES ('4', '�뱸������', '�ϱ�');
INSERT INTO address (city_number, gwangcity_do, city_District) VALUES ('5', '�뱸������', '������');
INSERT INTO address (city_number, gwangcity_do, city_District) VALUES ('6', '�뱸������', '�޼���');
INSERT INTO address (city_number, gwangcity_do, city_District) VALUES ('7', '�뱸������', '�޼���');

INSERT INTO education_level (id, name) VALUES (0, '���б� ����');
INSERT INTO education_level (id, name) VALUES (1, '����б� ����');
INSERT INTO education_level (id, name) VALUES (2, '�������� ����');
INSERT INTO education_level (id, name) VALUES (3, '���б� ����');
INSERT INTO education_level (id, name) VALUES (4, '���п� ���� �̻�');
--SELECT-----------------------------------------------------------------------------------------------------------------------
SELECT * FROM users
WHERE TRUNC(MONTHS_BETWEEN(SYSDATE, birthday)/12) BETWEEN 20 AND 30; --20����� 30����� �߷���

SELECT * FROM users
WHERE grade = '�л�'; --ȸ������� '�л�'�� ȸ���� �߷���



SELECT * FROM users
WHERE certificate IS NOT NULL; --�ڰ����� �ִ� ����� �߷���


SELECT * FROM users
WHERE interest LIKE '%����%'; --���ɰ����� '����'�� ��� �߷���

SELECT * FROM users
WHERE Education_level >= '���б� ����'; --'����'�� �߷���
--PROCEDURE-----------------------------------------------------------------------------------------------------------------------
--ȸ�� ����
CREATE OR REPLACE PROCEDURE add_user(
  p_id IN VARCHAR2,
  p_pw IN VARCHAR2,
  p_email IN VARCHAR2,
  p_name IN VARCHAR2,
  p_birthday IN DATE,
  p_gender IN VARCHAR2,
  p_phone1 IN VARCHAR2,
  p_phone2 IN VARCHAR2,
  p_address IN VARCHAR2,
  p_interest IN VARCHAR2,
  p_hourStudy IN VARCHAR2,
  p_certificate IN VARCHAR2,
  p_education_level IN VARCHAR2,
  p_grade IN VARCHAR2
)
IS
BEGIN
  INSERT INTO users(id, pw, email, name, birthday, gender, phone1, phone2, address, interest, hourStudy, certificate, education_level, grade)
  VALUES (p_id, p_pw, p_email, p_name, p_birthday, p_gender, p_phone1, p_phone2, p_address, p_interest, p_hourStudy, p_certificate, p_education_level, p_grade);
END;
/
--���� ������
CREATE OR REPLACE PROCEDURE send_message(
    p_message_id IN INT,
    p_sender_id IN VARCHAR2,
    p_receiver_id IN VARCHAR2,
    p_message_text IN NVARCHAR2,
    p_created_date IN DATE
)
IS
BEGIN
    INSERT INTO message2(message_id, sender_id, receiver_id, message_text, created_date)
    VALUES(p_message_id, p_sender_id, p_receiver_id, p_message_text, p_created_date);
    --COMMIT;
    dbms_output.put_line('Message sent successfully.');
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error while sending message: ' || SQLERRM);
        ROLLBACK;
END;
/
--ȸ�� Ż��
CREATE OR REPLACE PROCEDURE delete_user (
    p_id IN users.id%TYPE
) AS
BEGIN
    DELETE FROM users WHERE id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('User deleted successfully');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('User not found');
END;
/

--���� ���� ���ν���------

--��й�ȣ ������Ʈ ���ν���:
create or replace PROCEDURE update_password(
    p_id IN users.id%TYPE,
    p_new_password IN users.pw%TYPE
) AS
BEGIN
    UPDATE users SET pw = p_new_password WHERE id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Password updated successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating password: ' || SQLERRM);
        ROLLBACK;
END;
/
--�̸� ������Ʈ ���ν���:
CREATE OR REPLACE PROCEDURE update_name(
    p_id IN users.id%TYPE,
    p_new_name IN users.name%TYPE
) AS
BEGIN
    UPDATE users SET name = p_new_name WHERE id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Name updated successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating name: ' || SQLERRM);
        ROLLBACK;
END;
/
--��ȭ��ȣ1 ������Ʈ ���ν���:
CREATE OR REPLACE PROCEDURE update_phone1(
    p_id IN users.id%TYPE,
    p_new_phone1 IN users.phone1%TYPE
) AS
BEGIN
    UPDATE users SET phone1 = p_new_phone1 WHERE id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Phone1 updated successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating phone1: ' || SQLERRM);
        ROLLBACK;
END;
/
--��ȭ��ȣ2 ������Ʈ ���ν���:
CREATE OR REPLACE PROCEDURE update_phone2(
    p_id IN users.id%TYPE,
    p_new_phone2 IN users.phone2%TYPE
) AS
BEGIN
    UPDATE users SET phone2 = p_new_phone2 WHERE id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Phone2 updated successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating phone2: ' || SQLERRM);
        ROLLBACK;
END;
/
--������ ������Ʈ ���ν���:
CREATE OR REPLACE PROCEDURE update_address(
    p_id IN users.id%TYPE,
    p_new_address IN users.address%TYPE
) AS
BEGIN
    UPDATE users SET address = p_new_address WHERE id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Address updated successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating address: ' || SQLERRM);
        ROLLBACK;
END;
/
--���� ���� ������Ʈ ���ν���:
CREATE OR REPLACE PROCEDURE update_interest(
    p_id IN users.id%TYPE,
    p_new_interest IN users.interest%TYPE
) AS
BEGIN
    UPDATE users SET interest = p_new_interest WHERE id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Interest updated successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating interest: ' || SQLERRM);
        ROLLBACK;
END;
/
--���� �ð���(hourStudy) ���� ���ν���
CREATE OR REPLACE PROCEDURE update_hourStudy(
    p_id IN users.id%TYPE,
    p_hourStudy IN users.hourStudy%TYPE
) AS
BEGIN
    UPDATE users
    SET hourStudy = p_hourStudy
    WHERE id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('hourStudy updated successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating hourStudy: ' || SQLERRM);
        ROLLBACK;
END;
/
--�ڰ���(certificate) ���� ���ν���
CREATE OR REPLACE PROCEDURE update_certificate(
    p_id IN users.id%TYPE,
    p_certificate IN users.certificate%TYPE
) AS
BEGIN
    UPDATE users
    SET certificate = p_certificate
    WHERE id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('certificate updated successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating certificate: ' || SQLERRM);
        ROLLBACK;
END;
/
--�з�(Education_level) ���� ���ν���

CREATE OR REPLACE PROCEDURE update_Education_level(
    p_id IN users.id%TYPE,
    p_Education_level IN users.Education_level%TYPE
) AS
BEGIN
    UPDATE users
    SET Education_level = p_Education_level
    WHERE id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Education_level updated successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating Education_level: ' || SQLERRM);
        ROLLBACK;
END;
/
--ȸ�� ���(grade) ���� ���ν���
CREATE OR REPLACE PROCEDURE update_grade(
    p_id IN users.id%TYPE,
    p_grade IN users.grade%TYPE
) AS
BEGIN
    UPDATE users
    SET grade = p_grade
    WHERE id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('grade updated successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating grade: ' || SQLERRM);
        ROLLBACK;
END;
/

--��ü ���� ���ν���(������ ������� �߰��ϸ� ���� �� �մϴ�.)
CREATE OR REPLACE PROCEDURE insert_user(
    p_pw IN users.pw%TYPE,    --��й�ȣ
    p_email IN users.email%TYPE,    --�̸���
    p_name IN users.name%TYPE,    --�̸�
    p_phone1 IN users.phone1%TYPE,    --�ڵ���1
    p_phone2 IN users.phone2%TYPE DEFAULT NULL,   --�ڵ���2
    p_address IN users.address%TYPE DEFAULT NULL,    --������
    p_interest IN users.interest%TYPE DEFAULT NULL,  --���� ����
    p_hourStudy IN users.hourStudy%TYPE DEFAULT NULL,   --���νð���
    p_certificate IN users.certificate%TYPE DEFAULT NULL,    --�ڰ���
    p_Education_level IN users.Education_level%TYPE DEFAULT NULL,   --�з�
    p_grade IN users.grade%TYPE   --ȸ�� ���
) AS
BEGIN
    INSERT INTO users(pw, email, name, phone1, phone2, address, interest, hourStudy, certificate, Education_level, grade)
    VALUES(p_pw, p_email, p_name, p_phone1, p_phone2, p_address, p_interest, p_hourStudy, p_certificate, p_Education_level, p_grade);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('User inserted successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inserting user: ' || SQLERRM);
        ROLLBACK;
END;
/

--��ü ���� ���ν���2(������ ������� �߰��ϸ� ���� �� �մϴ�.)
CREATE OR REPLACE PROCEDURE update_user(
    p_email IN users.email%TYPE,   --�̸���
    p_pw IN users.pw%TYPE DEFAULT NULL,   --��й�ȣ
    p_name IN users.name%TYPE DEFAULT NULL,   --�̸�
    p_phone1 IN users.phone1%TYPE DEFAULT NULL,   --�ڵ���1
    p_phone2 IN users.phone2%TYPE DEFAULT NULL,   --�ڵ���2
    p_address IN users.address%TYPE DEFAULT NULL,   --������
    p_interest IN users.interest%TYPE DEFAULT NULL,   --���ɰ���
    p_hourStudy IN users.hourStudy%TYPE DEFAULT NULL,   --���νð���
    p_certificate IN users.certificate%TYPE DEFAULT NULL,   --�ڰ���
    p_education_level IN users.education_level%TYPE DEFAULT NULL,    --�з�
    p_grade IN users.grade%TYPE DEFAULT NULL   --ȸ�� ���
)
IS
BEGIN
    UPDATE users
    SET pw = NVL(p_pw, pw),   --��й�ȣ
        name = NVL(p_name, name),   --�̸�
        phone1 = NVL(p_phone1, phone1),  --�ڵ���1
        phone2 = NVL(p_phone2, phone2),   --�ڵ���2
        address = NVL(p_address, address),   --������
        interest = NVL(p_interest, interest),   --���ɰ���
        hourStudy = NVL(p_hourStudy, hourStudy),   --���νð���
        certificate = NVL(p_certificate, certificate),   --�ڰ���
        education_level = NVL(p_education_level, education_level),   --�з�
        grade = NVL(p_grade, grade)   --ȸ�����
    WHERE email = p_email;   --�̸���
END;
/

--�α� ������ ���
CREATE SEQUENCE log_id_seq START WITH 1 INCREMENT BY 1;-- log id�� ������ ������ �������� ���� ���� �߽��ϴ�.
CREATE OR REPLACE PROCEDURE add_user_log(
    P_user_id IN VARCHAR2,
    P_log_time IN TIMESTAMP,
    P_log_type IN VARCHAR2,
    P_log_message IN VARCHAR2,
    P_ip_address IN VARCHAR2
)
AS
    log_id NUMBER;
BEGIN
    SELECT log_id_seq.NEXTVAL INTO log_id FROM dual;
    INSERT INTO user_log (user_id, log_time, log_type, log_message, ip_address)
    VALUES (P_user_id, P_log_time, P_log_type, P_log_message, P_ip_address);
END;
/


-- �α� ���ν���

CREATE SEQUENCE log_id_seq START WITH 1 INCREMENT BY 1;-- log id�� ������ ������ �������� ���� ���� �߽��ϴ�.
CREATE OR REPLACE PROCEDURE add_user_log(
    P_user_id IN VARCHAR2,
    P_log_time IN TIMESTAMP,
    P_log_type IN VARCHAR2,
    P_log_message IN VARCHAR2,
    P_ip_address IN VARCHAR2
)
AS
    log_id NUMBER;
BEGIN
    SELECT log_id_seq.NEXTVAL INTO log_id FROM dual;
    INSERT INTO user_log (user_id, log_time, log_type, log_message, ip_address)
    VALUES (P_user_id, P_log_time, P_log_type, P_log_message, P_ip_address);
END;
/
--���� ���ν���
-- RANK_CODE ���� �����ϱ� ���� ������ ����
CREATE SEQUENCE ranking_seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;
-- �������� ����Ͽ� RANKING ���̺� �� ���� �����ϴ� ���� ���ν��� ����
CREATE OR REPLACE PROCEDURE insert_ranking (
  p_rank_name IN RANKING.RANK_NAME%TYPE,
  p_rank_score IN RANKING.RANK_SCORE%TYPE
)
IS
  v_rank_code VARCHAR2(20);
BEGIN
  
  -- ���� �� ���������� ������ �� ���� RANK_CODE�� ���
  SELECT 'R' || LPAD(ranking_seq.NEXTVAL, 3, '0')
  INTO v_rank_code
  FROM DUAL;
  
  
  -- �� ���� RANKING ���̺� ����
  INSERT INTO RANKING (RANK_CODE, RANK_NAME, RANK_SCORE)
  VALUES (v_rank_code, p_rank_name, p_rank_score);
  
  COMMIT;
END;
/

--���� ��� ���ν���
-- RANKING ���̺��� ��� ���� �˻��ϰ� �ֿܼ� ����ϴ� ���� ���ν��� ����
CREATE OR REPLACE PROCEDURE print_ranking IS
BEGIN
 
  -- RANKING ���̺��� ��� �� ����
  FOR row IN (SELECT * FROM RANKING)
  LOOP
    
    -- ���� �ֿܼ� ���
    DBMS_OUTPUT.PUT_LINE(row.RANK_CODE || ' - ' || row.RANK_NAME || ' - ' || row.RANK_SCORE);
  END LOOP;
END;
/

--���νð� ���ν���
-- �� ���� �Է� �Ű������� ����Ͽ� "insert_study_time"�̶�� ���� ���ν����� ����
CREATE OR REPLACE PROCEDURE insert_study_time(
    P_STUDY_ID IN VARCHAR2,
    P_SUBJECT IN VARCHAR2,
    P_STUDY_TIME IN INT,
    P_STUDY_DATE TIMESTAMP DEFAULT SYSDATE
)
--���ν����� �Է� �Ű������� ����Ͽ� "study_time" ���̺� 
--�� ���� ������ ���� Ʈ������� Ŀ���Ͽ� ���� ������ �����ͺ��̽��� ����
IS
BEGIN
    INSERT INTO study_time(STUDY_ID,SUBJECT,STUDY_TIME,STUDY_DATE)
    VALUES(P_STUDY_ID,P_SUBJECT,P_STUDY_TIME,P_STUDY_DATE);
     COMMIT;
END;
/
--���ν��� ����-----------------------------------------------------------------------------------------------------------------------
/*
DECLARE
    message_id NUMBER := 1;
    sender_id VARCHAR2(20) := 'user1';
    receiver_id VARCHAR2(20) := 'user2';
    message_text NVARCHAR2(1000) := '�ȳ��ϼ���. ���� ������ ��� �ǳ���?';
    created_date DATE := SYSDATE;
BEGIN
    send_message(message_id, sender_id, receiver_id, message_text, created_date);
END;


--�Ʒ��� user1�� ���ִ� �����Դϴ�.
BEGIN
    delete_user('user01');
END;


-- �α� ���ν��� ����
DECLARE
    user_id VARCHAR2(20) := 'soo.doe';
    log_time TIMESTAMP := SYSTIMESTAMP;
    log_type VARCHAR2(20) := 'LOGIN';
    log_message VARCHAR2(100) := 'User logged in';
    ip_address VARCHAR2(20) := '192.168.1.100';
BEGIN
    add_user_log(user_id, log_time, log_type, log_message, ip_address);
END;

--���� ���ν��� ����
-- insert_ranking ���ν����� ȣ���Ͽ� RANKING ���̺� �� �� ����
BEGIN
  insert_ranking('1��', 75.5);
END;
/

--���νð� ���ν��� ����
--���ν����� "study_time" ���̺� �� ���� ����
--'ST01', 'Math', 120 �� '2023-03-27'�� ����Ͽ� �ڵ忡�� ȣ��
BEGIN
    insert_study_time('ST01', 'Math', 120,'2023-03-27');
END;

--���� �α� ���ν��� ��� ����
DECLARE
    user_id VARCHAR2(20) := 'john.doe';
    log_time TIMESTAMP := SYSTIMESTAMP;
    log_type VARCHAR2(20) := 'LOGIN';
    log_message VARCHAR2(100) := 'User logged in';
    ip_address VARCHAR2(20) := '192.168.1.100';
BEGIN
    add_user_log(user_id, log_time, log_type, log_message, ip_address);
END;
/
-- ����
DECLARE
    user_id VARCHAR2(20) := 'soo.doe';
    log_time TIMESTAMP := SYSTIMESTAMP;
    log_type VARCHAR2(20) := 'LOGIN';
    log_message VARCHAR2(100) := 'User logged in';
    ip_address VARCHAR2(20) := '192.168.1.100';
BEGIN
    add_user_log(user_id, log_time, log_type, log_message, ip_address);
END;
/
*/