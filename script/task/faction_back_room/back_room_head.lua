--���ߣ��Ͼ�
--�������ڣ�07��11��13��14:50
--ʦ�Źؿ���������ű��ļ�
Include("\\script\\task\\faction_back_room\\stage_info.lua");
DEBUG_VERSION = 0;
IB_VERSION = 1;
UNCOMPLETED_VERSION = 0;	--�������汾��ָ���Ǻ���һЩ�������
--==================================================================================
BACKROOM_RELAY_KEY = " backroom_timerecord";	--���ݿ����ؼ���
LOG_HEADER = "[S� m�n m�t th�t]:";
LOG_ERR_HEADER = "[S� m�n m�t th�t b� l�i]:";
MISSION_NAME = "S� m�n m�t th�t 080129";
--==================================================================================
LOGIN_ID = 1107;	--��½�����������������崻������
LOGIN_TRIGGER_ID = 3019;
--==================================================================================
MAX_DIFFICULTY_LEVEL = 9;	--���ѭ��
MAX_STAGE = 9;				--ÿѭ�����ؿ���
MAX_ATTEND_TIMES = 3;		--ÿ����󴳹ش���
MAX_FAILURE_TIMES = 1;		--ÿ�����ʧ�ܴ���
MAX_FREE_READ_RECORD_TIMES = 2;	--ÿ�������Ѷ�������
MAX_ROOM_COUNT = 100;		--�������ܿ����ĵ�̨��������󷿼���
MAX_ROUTE_ROOM_COUNT = 10;	--������󷿼���

NEED_NUM_JIEGUAN = 2;		--�ӹ������������
--��ʹ�÷�Χ1121-1140==============================================================
--�������1121--1125================================================================
TSK_ATTEND_WEEK = 1121;			--�ϴδ��ص�ʱ�䣨���ܣ�

TSK_ENTER_TYPE = 1123;			--��¼�������ͣ�0��ʾ�������룬1��ʾ�������롣�˱�����ĳѭ����һ��ʱ������0
TSK_TAG1 = 1124;				--���1�������������ڵ������1������
--�������1126--1130��ÿ��һ�壩==================================================
TSK_WC_BEGIN = 1126;
TSK_WC_ATTEND_TIMES = 1126;	--���ܴ����ܴ���
TSK_WC_FAIL_TIMES = 1127;		--���ܴ���ʧ�ܴ������嵵������
TSK_WC_READ_RECORD_TIMES = 1128;	--���ܶ�������
TSK_WC_LAST_RECORD = 1129;		--��¼���ܴ��ؽ��ȡ���λ��ʮλ��¼С�أ���λ���ϼ�¼�Ѷ�

TSK_WC_END = 1130;
--��¼ÿѭ�����ʱ��1131��1139��9������
TSK_BEST_RECORD_BEGIN = 1131;
TSK_BEST_RECORD_END = 1139;
--�������1936--1940���˳��ؿ�ʱ��0��=================================================
TSK_NC_BEGIN = 1140;
TSK_NC_END = 1140;
--��ʱ�������======================================================================
TTSK_BEGIN = 0;
TTSK_END = 0;
TTSK_NORMAL_ITEM_TYPE = 18;		--�һ���Ʒʱ��¼ѡ�����������Ʒ
--��ͼ����==========================================================================
MAP_TSK_BEGIN = 1;
MAP_TSK_END = 1;
--=========================================================================================
CAMP_ALL = 0;
CAMP_PLAYER = 1;
CAMP_ENEMY = 2;
CAMP_EVIL = 3;
TB_CAMP_NAME =
{
	[0] = "",
	[1] = "camp_player",
	[2] = "camp_enemy",
	[3] = "camp_evil",
}
--�ؿ���Ʒ��Ϣ
TB_ITEM = 
{
	[1] = {"S� m�n m�t th�t l�nh",2,0,1048},
}
--����Ʒ��Ϣ
TB_NORMAL_ITEM = 
{	--���֣�ID1��ID2��ID3��������Ʒ���������Ľ�ң���λ��
	[1] = {"Ph�n Quang Th�n Sa",2,1,3333,15,0},
	[2] = {"Ng� Hoa T� Nguy�n T�n (s�c m�nh)",1,0,261,5,0},
	[3] = {"Ng� Hoa T� Nguy�n T�n (n�i c�ng)",1,0,262,5,0},
	[4] = {"Ng� Hoa T� Nguy�n T�n (g�n c�t)",1,0,263,5,0},
	[5] = {"Ng� Hoa T� Nguy�n T�n (th�n ph�p)",1,0,264,5,0},
	[6] = {"Ng� Hoa T� Nguy�n T�n (nhanh nh�n)",1,0,265,5,0},
	[7] = {"Th�t Hoa T� Nguy�n T�n (s�c m�nh, g�n c�t)",1,0,266,8,50},
	[8] = {"Th�t Hoa T� Nguy�n T�n (s�c m�nh, th�n ph�p)",1,0,267,8,50},
	[9] = {"Th�t Hoa T� Nguy�n T�n (s�c m�nh, nhanh nh�n)",1,0,268,8,50},
	[10] = {"Th�t Hoa T� Nguy�n T�n (s�c m�nh, n�i c�ng)",1,0,269,8,50},
	[11] = {"Th�t Hoa T� Nguy�n T�n (n�i c�ng, g�n c�t)",1,0,270,8,50},
	[12] = {"Th�t Hoa T� Nguy�n T�n (n�i c�ng, th�n ph�p)",1,0,271,8,50},
	[13] = {"Th�t Hoa T� Nguy�n T�n (n�i c�ng, nhanh nh�n)",1,0,272,8,50},
	[14] = {"Th�t Hoa T� Nguy�n T�n (th�n ph�p, g�n c�t)",1,0,273,8,50},
	[15] = {"Th�t Hoa T� Nguy�n T�n (th�n ph�p, nhanh nh�n)",1,0,274,8,50},
	[16] = {"Th�t Hoa T� Nguy�n T�n (nhanh nh�n, g�n c�t)",1,0,275,8,50},
}
TEMP_STATE_BEGIN = 2600001;
TEMP_STATE_END = 2600020;
--===================================================================================
--Mission��س�������======================================================================
MISSION_ID = 41;									--Mission��ID
TIMER_ID = 70;										--��ʱ����ID
--=========================================================================================
FRAME_PER_SECOND = 18;								--��Ϸ�����ٶȣ�ÿ�룱��֡
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--ÿ������Ϸ֡��
--��������׶εĳ���ʱ�䣬=================================================================
READY_TIME = 5;										--׼��ʱ�䣬5����
STARTED_TIME = 10;									--����ʱ��ʱ�䣬10����
SHORT_PAUSE_TIME = 1/6;								--Ĭ�ϵĴ���ʱ��							
ENDING_TIME = 2;									--�ȴ�����ʱ�䣬5����
--��������׶μ�ʱ���Ĵ������=============================================================
READY_TIMER_INTERVAL = 1;							--��ʱ��������ʱ��������λ����
READY_TIMER_COUNT = (READY_TIME/READY_TIMER_INTERVAL)-1;	
STARTED_TIMER_INTERVAL = 1/12;	--5��					
STARTED_TIMER_COUNT = (STARTED_TIME/STARTED_TIMER_INTERVAL)-1;
SHORT_PAUSE_TIMER_INTERVAL = 1/12;	--5��
SHORT_PAUSE_TIMER_COUNT = (SHORT_PAUSE_TIME/SHORT_PAUSE_TIMER_INTERVAL)-1;
ENDING_TIMER_INTERVAL = 1/2;
ENDING_TIMER_COUNT = (ENDING_TIME/ENDING_TIMER_INTERVAL)-1;	
--MissionS����=============================================================================
MS_MISSION_NAME = 1;								--��¼Mission�����֣�������ͼ����
MS_MISSION_STRING = 10;								--Mission�ַ�����Ҳ������ͼ���
--MissionV����=============================================================================
MV_MISSION_STATE = 1;								--��¼Mission״̬
MV_TIMER_LOOP = 2;									--��¼��ʱ���ļ���
MV_MISSION_UID = 3;									--��¼Mission��ΨһID
MV_CUR_DIFF = 4;									--��ǰ���ڵڼ�ѭ��
MV_CUR_STAGE = 5;									--��ǰ���ڵڼ���
MV_TOTAL_TIME = 6;									--ͨ��ĳһѭ�����õ���ʱ��
MV_MAPID = 7;										--��¼���صĵ�ͼID
MV_MAPIDX = 8;										--��¼���صĵ�ͼ����
MV_FACTION = 9;										--��¼��������������ĸ����ɵ�
MV_ROUTE = 10;										--��¼��ҵ�·��
MV_PLAYERINDEX = 11;								--��¼��ҵ�����
MV_BEGIN_TIME = 12;									--��¼ĳС�ؿ�ʼ���ص�ʱ��
MV_ENTRY_MAPID = 13;								--��¼��ҽ�������ʱ�����ĵ�ͼID
MV_MAP_TYPE = 14;									--��¼�������͡����Ϊ0��ʾ�ó����Ƿ������������ҵ�ͼ�����������ֵ��ʾ�ó������ĸ����ɵ�
--ÿС�������Mission����==================================================================
MV_NSC_BEGIN = 71
MV_NSC_REMOVE_NPC_BODY = 71;						--NPC����ʱ���Ƿ�����ɾ��ʬ��
MV_NSC_BOSS_INDEX = 72;								--��¼BOSS������
MV_NSC_KILL_NPC_COUNT = 73;							--��¼��ǰɱNPC����
MV_NSC_NEED_KILL_NUMBER = 74;						--��¼����ɱNPC����
MV_NSC_REFLASH_KILL_NUMBER = 75;					--��¼ˢ��ǰ��ɱ��NPC����

MV_NSC_VALUE1 = 80;									--�������
MV_NSC_END = 80
--��¼NPC�����ı���========================================================================
MV_NPC_INDEX_BEGING = 81;							--������¼NPC������ռ�ã�����������
MV_NPC_INDEX_END = 100;
--Mission״̬��============================================================================
MS_STATE_IDEL = 0;									--���ؿ���
MS_STATE_READY = 1;									--�ȴ�״̬��������ʼ�ȴ���浵�ȴ���
MS_STATE_STARTED = 2;								--����״̬
MS_STATE_SHORT_PAUSE = 3;							--С����С��֮�����ͣ
MS_STATE_END_WAITING = 4;							--����״̬���ȴ��볡��
--=========================================================================================
