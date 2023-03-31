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
--TABLE-------------------------------------------------------------------------------------------------------
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

-- ȸ�� ��� ���̺� �߰�
CREATE TABLE grade (
  GRADE_CODE VARCHAR2(20) PRIMARY KEY,
  GRADE VARCHAR2(20) NOT NULL
);
--ALTER-------------------------------------------------------------------------------------------------------
--education_level�� �����
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
REFERENCES INTEREST_CODE;

ALTER TABLE USERS
ADD CONSTRAINT FK_GRADE_CODE
FOREIGN KEY(GRADE)
REFERENCES GRADE(GRADE_CODE);
--INSERT-------------------------------------------------------------------------------------------------------
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

INSERT INTO GRADE VALUES(1, '�л�');
INSERT INTO GRADE VALUES(2, '������');
INSERT INTO GRADE VALUES(3, '���л�');
INSERT INTO GRADE VALUES(4, '���ػ�');
INSERT INTO GRADE VALUES(5, '������');
INSERT INTO GRADE VALUES(6, '�����');
INSERT INTO GRADE VALUES(7, '������');

--PROCEDURE-------------------------------------------------------------------------------------------------------
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