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

