CREATE TABLE education_level (
  education_level_id VARCHAR2(50) PRIMARY KEY, -- �з¼��� ID
  education_level_name VARCHAR2(50) NOT NULL -- �з¼��� �̸�
);

INSERT INTO education_level (id, name) VALUES (0, '���б� ����');
INSERT INTO education_level (id, name) VALUES (1, '����б� ����');
INSERT INTO education_level (id, name) VALUES (2, '�������� ����');
INSERT INTO education_level (id, name) VALUES (3, '���б� ����');
INSERT INTO education_level (id, name) VALUES (4, '���п� ���� �̻�');