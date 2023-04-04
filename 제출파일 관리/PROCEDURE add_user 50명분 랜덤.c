#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
    // ���ڿ� 50��
    char *strings[] = {
        "studious_123",
        "smartgirl_456",
        "bookworm_789",
        "genius_kid123",
        "studysquad_246",
        "mathwhiz_135",
        "englishpro_567",
        "sciencegeek_890",
        "studybuddy_1234",
        "historybuff_5678",
        "pinkunicorn123",
        "galaxytraveler22",
        "bookworm_librarian",
        "nightowl_student",
        "sunnybeachlover",
        "techgeek2022",
        "musicjunkie88",
        "sweettoothbaker",
        "yogafitnessfan",
        "adventureseeker21",
        "candy_lover",
        "blue_moon",
        "star_dreamer",
        "velvet_echo",
        "mystic_garden",
        "silver_wings",
        "midnight_rider",
        "honey_bloom",
        "ocean_whisper",
        "golden_glory",
        "happy_day123",
        "future_plan567",
        "study_hard789",
        "peaceful_mind111",
        "success_story555",
        "learning_way222",
        "knowledge_hub999",
        "growth_mindset333",
        "challenge_accepted4",
        "explore_more777",
        "happyhiker33",
        "coffeeaddict99",
        "bookwormgal",
        "musicjunkie22",
        "wanderlustguru",
        "doglover2023",
        "fitnessfreak88",
        "plantmama77",
        "adventureseeker10",
        "foodieforever999"
    };
char* names[] = {"Emma", "Liam", "Olivia", "Noah", "Ava", "William", "Sophia", "James", "Isabella", "Oliver", "Mia", "Benjamin", "Charlotte", "Elijah", "Amelia", "Lucas", "Harper", "Mason", "Evelyn", "Logan", "Abigail", "Alexander", "Emily", "Ethan", "Elizabeth", "Jacob", "Mila", "Michael", "Ella", "Daniel", "Avery", "Henry", "Sofia", "Jackson", "Camila", "Sebastian", "Aria", "Aiden", "Scarlett", "Matthew", "Victoria", "Samuel", "Madison", "David", "Luna", "Joseph", "Grace", "Carter", "Chloe", "Owen", "Penelope"};
char* sex[] = {"����","����"};
    // ���� ���� �� ���ڿ� ���
    /*
    BEGIN
  add_user(
    'studious_123', -- ���̵�
    'password1', -- ��й�ȣ
    'test1@test.com', -- �̸���
    'ȫ�浿', -- �̸�
    TO_DATE('19900101', 'YYYY-MM-DD'), -- �������
    '����', -- ����
    '010-1234-5678', -- ����ó1
    '02-123-4567', -- ����ó2
    NULL, -- ������
    NULL, -- ���� ����
    NULL, -- ���� �ð���
    NULL, -- �ڰ���
    NULL, -- �з�
    '1' -- ȸ�� ���
  );
END;
*/
	srand(time(NULL));  // ���� ������ �ʱ�ȭ
    
    int start_year = 1900;  // �⵵ ���� ����
    int end_year = 2023;    // �⵵ ���� ��
    int year = rand() % (end_year - start_year + 1) + start_year;  // �������� �⵵ ����
    
    int month = rand() % 12 + 1;  // �������� �� ����
    int day = rand() % 31 + 1;  // �������� �� ����
    int first_part;
    int second_part;
    //printf("%d�� %d�� %d��\n", year, month, day);
    
    FILE *fp = fopen("output.sql", "w");
    if(fp == NULL) {
        printf("������ ������ �� �����ϴ�.");
        return -1;
    }
    for(int i=0; i<50; i++) {
    	fprintf(fp,"BEGIN\n");
    	fprintf(fp,"add_user(\n");
        fprintf(fp, "'%s',\n", strings[i]);//���̵�  
    	fprintf(fp,"'password%d',\n",i+1);
    	fprintf(fp,"'test%d@test.com',\n",i+1);//�̸���
    	fprintf(fp,"'%s',\n",names[i]);//�̸� 
    	
    	year = rand() % (end_year - start_year + 1) + start_year;  // �������� �⵵ ����
    	month = rand() % 12 + 1;  // �������� �� ����
    	day = rand() % 31 + 1;  // �������� �� ����
    	fprintf(fp,"TO_DATE('%d-%d-%d','YYYY-MM-DD'),\n",year,month,day);//������� 
    	
    	fprintf(fp,"'%s',\n",sex[i%2]);//���� 
    	first_part = rand() % 10000;  // 0���� 9999 ������ ���� ���� ����
    	second_part = rand() % 10000;  // 0���� 9999 ������ ���� ���� ����
    	fprintf(fp,"'010-%04d-%04d',\n",first_part,second_part);//����ó 1
    	
    	first_part = rand() % 1000;  // 0���� 999 ������ ���� ���� ����
    	second_part = rand() % 10000;  // 0���� 9999 ������ ���� ���� ����
    	fprintf(fp,"'02-%03d-%04d',\n",first_part,second_part);//����ó2 
    	
    	fprintf(fp,"NULL,\n");//������ 
    	fprintf(fp,"NULL,\n");//���ɰ��� 
    	fprintf(fp,"NULL,\n");//���νð��� 
    	fprintf(fp,"NULL,\n");//�ڰ��� 
    	fprintf(fp,"NULL,\n");//�з� 
    	fprintf(fp,"'1'\n");//ȸ����� 
    	fprintf(fp,");\n");
    	fprintf(fp,"END;\n/\n");
    }

    fclose(fp);
    return 0;
}

