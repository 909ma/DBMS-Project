









--CREATE-----------------------------------------------------------------------------------------------------------------------
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
������  - FK�� ������
���ɰ���  - FK�� ������
���νð���
�ڰ���
�з� --Fk�� �����°� ��������
ȸ�� ���(ex. �л�, ����, ���л�, ������ ���) --Fk�� �����°� ��������
*/
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

INSERT INTO education_level (id, name) VALUES (1, '�ʵ��б� ����');
INSERT INTO education_level (id, name) VALUES (2, '���б� ����');
INSERT INTO education_level (id, name) VALUES (3, '����б� ����');
INSERT INTO education_level (id, name) VALUES (4, '�������� ����');
INSERT INTO education_level (id, name) VALUES (5, '���б� ����');
INSERT INTO education_level (id, name) VALUES (6, '���п� ���� �̻�');

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
--�Ʒ��� user1�� ���ִ� �����Դϴ�.
BEGIN
    delete_user('user01');
END;

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


*/