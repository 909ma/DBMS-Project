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

/*INSERT INTO study_cafe (cafe_id, cafe_name, address, phone, open_time, close_time, facilities, seats, outlets, wifi, smoking_area, membership, membership_fee)
VALUES ('SC0001', '���� ���͵�ī��', '����Ư���� ���α� ���� 123', '02-123-4567', '09:00', '22:00', '���ĵ�, ȸ�ǽ�, ��Ʈ�� �뿩, ��������', 50, 20, '�������ͳ�', '�и��� ���� ��� �ݿ�', '�����̾� �����', 30000);
INSERT INTO study_cafe (cafe_id, cafe_name, address, phone, open_time, close_time, facilities, seats, outlets, wifi, smoking_area, membership, membership_fee)
VALUES ('SC0002', '���� ���͵�ī��', '����Ư���� ������ ������� 123', '02-234-5678', '10:00', '23:00', '���ĵ�, �����Ӱ� �̿� ������ ����, ��������', 60, 30, '�������ͳ�', '�� ����', '������ �����', 20000);
INSERT INTO study_cafe (cafe_id, cafe_name, address, phone, open_time, close_time, facilities, seats, outlets, wifi, smoking_area, membership, membership_fee)
VALUES ('SC0003', 'ȫ�� ���͵�ī��', '����Ư���� ������ �Ϳ��� 123', '02-345-6789', '08:00', '22:00', '���ĵ�, ��Ʈ�� �뿩, ��������', 40, 15, '�������ͳ�', '�и��� ���� ��� �ݿ�', '�����̾� �����', 35000);
INSERT INTO study_cafe (cafe_id, cafe_name, address, phone, open_time, close_time, facilities, seats, outlets, wifi, smoking_area, membership, membership_fee)
VALUES ('SC0004', '�Ǵ� ���͵�ī��', '����Ư���� ������ �ɵ��� 123', '02-456-7890', '11:00', '02:00', '���ĵ�, ��Ʈ�� �뿩, ��������, �߰� ����', 70, 25, '�������ͳ�', '�� ����', '������ �����', 15000);*/

--�ӽ� �ڷᵵ �ֱ� �ѵ� �������� FK�� �ҷ����°� ������? ���������̺��� �ܼ�ȭ�ؼ� �� ���� ���ô�