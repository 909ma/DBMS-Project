ALTER TABLE users
ADD CONSTRAINT fk_education_level
FOREIGN KEY (Education_level)
REFERENCES education_level (education_level_id);

--ȸ��������̺��� �з��� �з����̺��� ù��° Į���� �����ϰ� ��