Include("\\script\\newbattles\\functions.lua");
POINT_LIMITED = 1000;	--��������

if IB_VERSION == 1 then
	if tonumber(date("%y%m%d")) >= 081010 and tonumber(date("%y%m%d")) <= 081020 then
		EXP_AWARD_WIN = 25000;	--ʤ�������齱������
		EXP_AWARD_LOSE = 25000;	--ʧ�ܷ����齱������
		EXP_AWARD_DRAW = 17000;	--ƽ�־��齱������
	else
		EXP_AWARD_WIN = 25000;	--ʤ�������齱������
		EXP_AWARD_LOSE = 9000;	--ʧ�ܷ����齱������
		EXP_AWARD_DRAW = 17000;	--ƽ�־��齱������
	end
else
	EXP_AWARD_WIN = 35000;	--ʤ�������齱������
	EXP_AWARD_LOSE = 25000;	--ʧ�ܷ����齱������
	EXP_AWARD_DRAW = 30000;	--ƽ�־��齱������
end;
GOLDENEXP_AWARD_WIN = 3000000;	--ʤ��������ת���齱������
GOLDENEXP_AWARD_LOSE = 1000000;	--ʧ�ܷ�����ת���齱������
GOLDENEXP_AWARD_DRAW = 2000000;	--ƽ�ֽ���ת���齱������
--ȫ�ֳ���
MAPID = MAIN_MAP_ID;	--��ͼID
MAPID_SONG = MAPID;
MAPID_LIAO = MAPID;
RANDOM_PLACE = GLB_RANDOM_PLACE_MAIN;
MISSION_ID = MAINBATTLE_MISSION_ID;

WINNER_BONUS = 600;	--ʤ����
DRAW_BONUS = 400;	--ƽ����
LOSER_BONUS = 200;	--������

MAX_PLAYER = MAIN_BATTLE_MAX_PLAYER;		--��ս��������Ӫ���֧�������
SIGNUP_MAX_PLAYER = MAIN_BATTLE_SIGNUP_MAX_PLAYER;	--���֧�ֱ��������
LEAST_PLAYER = 0;		--��ս��������Ӫ����Ҫ������

PLAYERCOUNT_DIFF = MAIN_BATTLE_PLAYER_DIFF;	--��ս�����������
SIGNUP_PLAYERCOUNT_DIFF = MAIN_BATTLE_SIGNUP_PLAYER_DIFF;	--�������������
--������Mission����
--===================MissionS==========================================

--===================MissionV================================================
MV_FRONT_TRAP_SONG = 31;	--��¼�η��Ƿ������ǰӪTRAP��
MV_FRONT_TRAP_LIAO = 32;	--��¼�ɷ��Ƿ������ǰӪTRAP��
MV_MID_TRAP_SONG = 33;	--��¼�η��Ƿ��������ӪTRAP��
MV_MID_TRAP_LIAO = 34;	--��¼�ɷ��Ƿ��������ӪTRAP��

MV_FIGHTING_ROOM1 = 35;	--��¼�������ص�״̬��
MV_FIGHTING_ROOM2 = 36;
MV_FIGHTING_ROOM3 = 37;
MV_FIGHTING_ROOM4 = 38;

MV_KILL_SONG_LOOEY_COUNT = 39;	--�ɷ�ɱ���η�Уξ���������������ƣ�
MV_KILL_LIAO_LOOEY_COUNT = 40;
MV_KILL_SONG_CAPTAIN_COUNT = 41;
MV_KILL_LIAO_CAPTAIN_COUNT = 42;
MV_KILL_SONG_PIONEER_COUNT = 43;
MV_KILL_LIAO_PIONEER_COUNT = 44;
MV_KILL_SONG_GENERAL_COUNT = 45;
MV_KILL_LIAO_GENERAL_COUNT = 46;

MV_NPC_TYPE_SONG = 47;	--��¼˫����ǰ���ֵ�NPC���ͣ���Ϊδ������Ϊ�ȷ棬��Ϊ��������ΪԪ˧��
MV_NPC_TYPE_LIAO = 48;	--

MV_HELP_REFUGEE_COUNT_SONG = 49;	--��¼˫���������������
MV_HELP_REFUGEE_COUNT_LIAO = 50;

MV_EMPLACEMENT0_POSSESSION = 51;	--��¼������̨��ӵ����,0,1,2�ֱ��Ӧ��ս���ϵ������ң������ɣ�������̨
MV_EMPLACEMENT1_POSSESSION = 52;	--ֵ��ʾ����̨�����ĸ���Ӫ
MV_EMPLACEMENT2_POSSESSION = 53;

MV_KILL_BOX_COUNT = 54			--��¼ɱ�˶��ٸ�����
MV_KILL_VILLAGER_COUNT = 55		--��¼ɱ�����������
MV_KILL_SONG_SOLDIER_COUNT = 56	--��¼�η�ʿ����������
MV_KILL_LIAO_SOLDIER_COUNT = 57	--��¼�ɷ�ʿ����������

MV_FIGHTER_GROUP1_1 = 58		--��¼��������ҵ�����
MV_FIGHTER_GROUP1_2 = 59
MV_FIGHTER_GROUP2_1 = 60
MV_FIGHTER_GROUP2_2 = 61
MV_FIGHTER_GROUP3_1 = 62
MV_FIGHTER_GROUP3_2 = 63
MV_FIGHTER_GROUP4_1 = 64
MV_FIGHTER_GROUP4_2 = 65

MV_HEADER_DEATH = 66			--���������Ƿ�����
MV_HERO_DEATH = 67				--�����佫�Ƿ�����

MV_MARSHAL_SONG = 68;			--�η�Ԫ˧����
MV_MARSHAL_LIAO = 69;			--�ɷ�Ԫ˧����
--===========================================================================
TIMER_ID = 53;					--Timer��ID
--===========================================================================
READY_TIME = 30*FRAME_PER_SECOND;--����׼��ʱ���ʱ���ı�ʱ�����������
READY_TIMER_LOOP = (15*FRAME_PER_MIN/READY_TIME)-1;--����׼��ʱ���ʱ����ʱ������15���ӣ�
FIGHT_TIME = 20*FRAME_PER_SECOND;			--����ʱ���ʱ���ı�ʱ���
FIGHT_TIMER_LOOP = (45*FRAME_PER_MIN/FIGHT_TIME)-1;	--����ʱ���ʱ���ı�ʱ������45���ӣ�
WAITOUT_TIME = 30*FRAME_PER_SECOND;		--�ȴ�����ʱ���ʱ���ı�ʱ���
WAITOUT_TIMER_LOOP = (0.5*FRAME_PER_MIN/WAITOUT_TIME)-1; --�ȴ�����ʱ���ʱ���ı�ʱ����������ӣ�
--===========================================================================
INJURE_TIMER_ID = 57;			--������̨���˵�Timer ID

INTERVAL_TIME = 10*18;			--ˢ�¼��ʱ��
--===========================================================================
ROOM_STATE_IDLE = 0;
ROOM_STATE_READY = 1;
ROOM_STATE_FIGHT = 2;
ROOM_STATE_END = 3;
--===========================================================================


