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
char* subject[] = {"����","����","����","Ž��"};

    // ���� ���� �� ���ڿ� ���
/*
DECLARE
  P_STUDY_ID study_time.ID%TYPE := 'test1';
  P_SUBJECT study_time.SUBJECT%TYPE := 'math';
  P_STUDY_TIME study_time.STUDY_TIME%TYPE := 120;
BEGIN
  insert_study_time(
  P_STUDY_ID, 
  P_SUBJECT, 
  P_STUDY_TIME);
END;
/

BEGIN
  insert_study_time(
  '1001',
  'Math',
  120,
  TO_DATE('2023-03-17', 'YYYY-MM-DD')
END;

*/
	srand(time(NULL));  // ���� ������ �ʱ�ȭ
    
    int random;
    
    FILE *fp = fopen("output.sql", "w");
    if(fp == NULL) {
        printf("������ ������ �� �����ϴ�.");
        return -1;
    }
    for(int i=0; i<300; i++) {
    	for(int j = 0; j < 50 ; j ++){
    		fprintf(fp,"BEGIN\n");
    		fprintf(fp,"insert_study_time(\n");
    	
    		random = rand()%50;
        	fprintf(fp, "'%s',\n", strings[j]);//���̵� 
        
        	random = rand()%4;
    		fprintf(fp,"'%s',\n",subject[random]);//����  
    	
    		random = rand()%3+1;
    		fprintf(fp,"%d,\n",random);//���� �ð�  
    		
    		random = rand()%31+1;
    		fprintf(fp,"TO_DATE('2023-03-%02d', 'YYYY-MM-DD')\n",random);//���� ��¥ 
    	
    		fprintf(fp,");\n");
    		fprintf(fp,"END;\n/\n");
    	}
    }

    fclose(fp);
    return 0;
}

