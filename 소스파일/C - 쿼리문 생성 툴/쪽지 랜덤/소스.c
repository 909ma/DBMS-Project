#pragma warning(disable:4996)
#include <stdio.h>
#include <stdlib.h>

int main()
{
    // ���ڿ� 50��
    char* strings[] = {
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

    char* message[] = {
    "�ȳ��ϼ���.",
    "���� ���� ��û ��վ��µ�, �ʹ� ��̷Ӱ� �����!",
    "�� ���� ��� Ǫ���� �𸣰ڴµ�, ���� �����ϸ� ���� �� ���Ƽ� ���̾�.",
    "�� ������ ���鼭 ���ο� ������ ����µ�, ��¥ �����ϴ���.",
    "���� ���� ������ ����� ������ ���� �� ���Ƽ� �̸� �����غ��� ������ ���� ���� �� �־�?",
    "���� �ʹ� ������� �����... �� �κ� �� �������ٷ�?",
    "���� Ǭ �������� �� Ʋ���� �����... �ʴ� ��� Ǯ����?",
    "���� ���� ����� ȿ�������� �ñ��ѵ�, �ʴ� � ������� �����ϴ�?",
    "���� ���� ��� ���ƾ�... ��� �������� �� �� �� �� ������?",
    "�� å ���� ���ٰ� ��õ���� �ǵ�, ���� �����鼭 �̾߱��غ���?",
    "���� �߿� �ñ��� �� ���Ƽ�, ���� �� �ϴ� ���ϱ� �ʹ� �������� �̸� �̾���!",
    "���� �����ϴ� ������ � ���ΰ��� ? �Բ� �����غ���� ?",
    "�����ϴٰ� ��� ���� �ð��� �ʿ��� �� � Ȱ���� �Ͻó��� ?",
    "���θ� ������ ������ �����ΰ��� ? �ڽ��� ���� ��ǥ�� �������� �ñ��մϴ�.",
    "���� �о߸� �����ϴµ� �ڽ��� ���ϴ� �κа� ����� �κ��� �ִٸ� � �κ��ΰ��� ?",
    "�������� ���ι� �� �ڽ��� ȿ�����̶�� �����ϴ� ����� �ִٸ� � ���ΰ��� ?",
    "�������� � �о߸� �����ϱ� �����ߴ��� �˷��ֽðھ�� ?",
    "���ο� �Բ� �ϻ� ��Ȱ���� ������ ������ �ִ� ���� �ִٸ� �����ΰ��� ?",
    "���θ� �ϸ鼭 ���� ������ �ִٸ� ��� �غ��Ͻó��� ?",
    "���ݱ��� ���θ� �ϸ鼭 ���� ū ���밨�� ������ ������ �����ΰ��� ?",
    "���ο� ������ ��̻�Ȱ�� �ִٸ� � ���� ���ó��� ? �Բ� ��̻�Ȱ�� ��������� ?",
    "���� �����ε�, �η����� �� �־�. ���� �����ϸ� �� �η��� �� ���Ƽ� �ʶ� ���� ����!",
    "� ���� ����� ȿ�������� �𸣰ھ�. �ʴ� ��� �ϸ� ���� ����� ���� �� �־���?",
    "�����ϴٰ� ���ļ� �� ���� ������, �ʴ� ��� �ؼ� �ڱ��� ������ �����ϴ�?",
    "���� ������ ���� �ʹ� ����־���! �̷� �͵� ������ �� �ִٴ� �ſ� �����.",
    "���� �Ⱓ���� ���� �����ϸ鼭 �����ϴ� �� ���� �� ����. ���� ȭ���� ����!",
    "���� ������ �� ������ �� �ȵ�. �ʴ� ��� �ؼ� ������ �� �����ϴ�?",
    "�̹� ���迡�� ���� ������ �ް� �; ������ �����ϰ� �־�. �ʵ� ���� ���� ���� ����!",
    "������ �� ��Ʈ���� �ްų� �Ҿ������� ��찡 �ִµ�, �׷� ���� ��� �ؾ� ��?",
    "���� ����Ⱓ�̶�� �ص� ���� �Ļ��ϰų� ���� �ð��� ���� �� ���ݾ�? ���� �ð��� Ȱ���ؼ� ��������!"
    };
    // ���� ���� �� ���ڿ� ���
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
/
*/

    FILE* fp = fopen("output.sql", "w");
    if (fp == NULL) {
        printf("������ ������ �� �����ϴ�.");
        return -1;
    }

    srand(time(NULL)); // ���� ������ �ʱ�ȭ

    for (int i = 0; i < 50; i++) {

        int year = rand() % 20 + 2003; // 2003~2022 �⵵ �߿��� ���� ����
        int month = rand() % 12 + 1; // 1~12 �� �߿��� ���� ����
        int day = rand() % 28 + 1; // 1~28 �� �߿��� ���� ���� (2���� ������ ���)

        //fprintf(fp, "DECLARE\n");
        //fprintf(fp, "message_id number:=%d\n", i + 1);
        //fprintf(fp, "sender_id VARCHAR2(20) := '%s'\n", strings[i % 50]);
        //fprintf(fp, "receiver_id VARCHAR2(20) := '%s'\n", strings[(i + 1) % 50]);
        //fprintf(fp, "message_text NVARCHAR2(1000) := '%s'\n", message[i % 30]);
        //fprintf(fp, "created_date DATE := to_date('%04d-%02d-%02d')\n", year, month, day);
        fprintf(fp, "BEGIN\n");
        fprintf(fp, "send_message(\n%d, \n'%s', \n'%s', \n'%s', \n'%04d-%02d-%02d');\n", i + 1, strings[i % 50], strings[(i + 1) % 50], message[i % 30], year, month, day);
        fprintf(fp, "END;\n");
        fprintf(fp, "/\n\n");

    }

    fclose(fp);
    return 0;
}

