--create date:2007-07-04
--author:yanjun
--describe:���ؿ�ͷ�ļ�
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\missions\\tong_mission\\fields.lua");
Include("\\script\\missions\\tong_mission\\position.lua");
Include("\\script\\missions\\tong_mission\\stage\\npc_info.lua");
Include("\\script\\missions\\tong_mission\\stage\\stage1.lua");
Include("\\script\\missions\\tong_mission\\stage\\stage2.lua");
Include("\\script\\missions\\tong_mission\\stage\\stage3.lua");
Include("\\script\\missions\\tong_mission\\stage\\stage4.lua");
Include("\\script\\missions\\tong_mission\\stage\\stage5.lua");
Include("\\script\\missions\\tong_mission\\stage\\stage6.lua");
DEBUG_VERSION = 0;		--���԰汾��
LIMIT_VERSION = 1;		--���ư汾��
--==========������Mission��صĳ�������====================================================
MISSION_ID = 36;									--Mission��ID
ALL_CAMP = 0;
TIMER_ID = 64;										--��ʱ����ID
ASSI_TIMER_ID = 65;									--������ʱ��ID
LOG_ID = 206;										--��½������ID
LOG_CUSTOM_ID = 262;								--��½�������Զ�����
--=========================================================================================
FRAME_PER_SECOND = 18;								--��Ϸ�����ٶȣ�ÿ�룱��֡
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--ÿ������Ϸ֡��
--��������׶εĳ���ʱ�䣬ֻ������������λΪ��=============================================
READY_TIME = 2*60;									--׼��ʱ��
STARTED_TIME = 0;									--����ʱ��ʱ�䣬���ʾ����ʱ
ENDING_TIME = 1*60;									--�ȴ�����ʱ��
--��������׶μ�ʱ���Ĵ������=============================================================
READY_TIMER_INTERVAL = 1*60;							--��ʱ��������ʱ��������λ��
READY_TIMER_COUNT = (READY_TIME/READY_TIMER_INTERVAL)-1;	
STARTED_TIMER_INTERVAL = 5;					
STARTED_TIMER_COUNT = (STARTED_TIME/STARTED_TIMER_INTERVAL)-1;	
ENDING_TIMER_INTERVAL = 1*60;
ENDING_TIMER_COUNT = (ENDING_TIME/ENDING_TIMER_INTERVAL)-1;	
--MissionS����=============================================================================
MS_TONG_NAME = 1;									--��¼��������
--MissionV����=============================================================================
MV_MISSION_STATE = 1;								--��¼Mission״̬
MV_TIMER_LOOP = 2;									--��¼��ʱ���ļ���
MV_MISSION_UID = 3;									--��¼Mission��ΨһID
MV_WEEK = 4											--��¼��ʼ�ؿ�ʱ������week
MV_KILL_SUB_NPC = 5;								--��¼ɱ���油��NPC������
MV_TIMER_TRIGGER_STATE = 6;							--��¼�ؿ��Զ����ʱ�䴥������״̬��1��ʾ�����У�0��ʾֹͣ
MV_GET_BOX = 7;										--��¼�Ƿ�ʰȡ�˱���
MV_APPLY_TIME = 8;									--��¼�ϴ������������ʱ��
MV_ENTER_TIME = 9;									--��¼�ϴ���ҽ������õ�ʱ��
MV_CHECK_POINT = 10;								--����
MV_STAGE = 11;										--��¼��ǰ���ڵڼ���
MV_STAGE_OVER = 12;									--��ǵ�ǰ�Ƿ����
MV_STAGE_START_TIME = 13;							--��¼�ؿ���ʼʱ��
MV_BOSS1 = 14;										--BOSS1������
MV_BOSS2 = 15;										--BOSS2������
MV_NPC_COUNT = 16;									--��¼NPC������
MV_FAC_NPC_COUNT = 17;								--��¼������NPC������
MV_BOSS_COUNT = 18;									--��¼BOSS������
MV_STAGE_STARTED = 19;								--����Ƿ�����ʽ��ʼ�ؿ�(��������е���࣬��ʱû������)
MV_CITY_MAP_ID = 20;								--��¼����ؿ������ĸ����е�

MV_VALUE1 	= 21;									--STAGE�Ĺ��ñ���
MV_VALUE2 	= 22;									--��ͬ�ؿ��в�ͬ������
MV_VALUE3 	= 23;									--ʹ��ʱ���ڽű��б�����ֵ�ĺ���
MV_VALUE4 	= 24;
MV_VALUE5 	= 25;
MV_VALUE6 	= 26;
MV_VALUE7 	= 27;
MV_VALUE8 	= 28;
MV_VALUE9 	= 29;
MV_VALUE10 	= 30;

--Mission״̬��============================================================================
MS_STATE_IDEL = 0;									--���ؿ���
MS_STATE_READY = 1;									--׼���׶�
MS_STATE_STARTED = 2;								--��ʼ�׶�
MS_STATE_ENDING = 3;								--�ȴ������׶�
--=========================================================================================
--===========�����ǹؿ����ó���============================================================
MAX_STAGE = 6;					--���ؿ���
MAX_AREA = 2;					--ÿ̨��������������
MAX_FIELD = 3;					--ÿ�����ĳ�������
MAX_NORMAL_PLAYER_COUNT = 16;	--�����ѡ�����
MAX_PLAYER_COUNT = 150;			--�����������������ȥ��ѡ����������油�����
MAX_ROUTE_PLAYER_COUNT = 3;		--���������ְͬҵ�������
MIN_ENTER_INTERVAL = 2*60;		--��С����ʱ����
MIN_APPLY_INTERVAL = 60;		--������С����ʱ����
MIN_MS_APPLY_INTERVAL = 30;		--Mission����С����ʱ����
MIN_TEAM_MEMBER = 8;			--��С��������
MIN_LEVEL = 70;					--��СҪ��ȼ�
MIN_JOIN_TONG_DAY = 0;			--��С���ʱ��
MIN_PLAYER_COUNT = 8;			--���������
MIN_KILL_SUB_NPC_COUNT = 300;	--������ý���Ҫɱ����������С������
KILL_SUB_NPC_POINT = 100;		--ɱ����С������Ķ������
SUB_NPC_COUNT = 20;				--����С��ˢ������
--=========================================================================================

--Relay��������key=========================================================================
KEY_WEEK = "tong_mission_key_week";	--����������һ��ͨ���ˣ������������ɵ����ݣ�
KEY_STAGE = "tong_mission_key_stage";	--�����ᵱǰ�ؿ�
KEY_ATTEND = "tong_mission_key_attend"	--���봳�ص����������
--===================�������������(650-660)========================================================
TSK_BEGIN = 650;
TSK_WEEK = 650;				--��¼�ϴδ����ǽ���ĵڼ���
TSK_APPLY_TIME = 651;		--��¼�ϴ�����������õ�ʱ��
TSK_POINT = 652;			--��¼��Ҹ��˹ؿ�����
TSK_ATTEND_STAGE_1 = 653;	--��¼ÿ��ͨ����1�صĴ���
TSK_ATTEND_STAGE_2 = 654;	--��¼ÿ��ͨ����2�صĴ���
TSK_ATTEND_STAGE_3 = 655;	--��¼ÿ��ͨ����3�صĴ���
TSK_ATTEND_STAGE_4 = 656;	--��¼ÿ��ͨ����4�صĴ���
TSK_ATTEND_STAGE_5 = 657;	--��¼ÿ��ͨ����5�صĴ���
TSK_ATTEND_STAGE_6 = 658;	--��¼ÿ��ͨ����6�صĴ���
TSK_END = 660;
--===================��������ʱ�������(61-69)====================================================
TEMP_BEGIN = 61;
TSK_TEMP_STATUS = 61;								--��������ݣ�0Ϊ�油��1Ϊ��ѡ
TSK_TEMP_AREA_IDX = 62;								--��¼��������
TSK_TEMP_FIELD_IDX = 63;							--��¼��������
TSK_TEMP_MAP_ID = 64;								--��¼����ʱ�ĵ�ͼID
TSK_TEMP_HELPER = 65;								--����Ƿ�Ϊ��Ԯ
TEMP_END = 69;
--=========================================================================================
TONG_MISSIONEX = "tong_mission";	--missionEx������
--=========================================================================================
GLB_CLEAR_FIELD = 81;				--��������������¼�Ƿ��������
--=========================================================================================
TB_BOSS_INFO = 
{
	[0] = "Ch��ng kh� c�a Th��ng C� Th�n Th� t� l�i th�nh b�ng ng��i, mu�n ti�u di�t ph�i d�ng m�n ph�i ��i �ng, n�u kh�ng s� h�i sinh. N�u nh� �� b�ng h� v� t� t�p qu� nhi�u s� d�n ��n v��t �i th�t b�i.",
	[1] = "\nThu�c t�nh v� k� n�ng ��c th� c�a Boss: l�m m�t m�u ph�m vi l�n\nTi�u qu�i ��c th�: Li Ph� N� T��ng (S� d�ng k� n�ng ��c s�t � ph�m vi nh�), m�i m�t giai �o�n s� hi�n th�m Li Y�n h� tr�. \nB�ng h� v� c�: ",
	[2] = "\nThu�c t�nh v� k� n�ng ��c th� c�a Boss: H�i sinh (Trong su�t th�i gian � �i n�y Boss s� s� d�ng Gia y Th�n C�ng �� h�i sinh b�n th�n, t�ng th�i gian h�i sinh l� 3 l�n, n�u nh� trong th�i gian nh�t ��nh m� ��nh ch�t Boss 4 l�n s� kh�ng h�i sinh th�m n�a, n�u kh�ng v��t �i s� th�t b�i).\nTi�u qu�i ��c th�: C�m V� Binh (S� s� d�ng k� n�ng c��ng l�c �� c�ng k�ch v� v�y c�n ph�i nhanh ch�ng ti�u di�t) \nB�ng h� v� c�: ",
	[3] = "\nThu�c t�nh v� k� n�ng ��c th� c�a Boss: \nHai tay nh� m�t (M�i giai �o�n s� l�m ng��i ch�i m�t 50% sinh l�c, kho�ng c�ch hai boss h�n 30 s� h�y b�)\nV�t ��i sao d�i (M�i giai �o�n th�i gian s� l�m ng��i ch�i m�t 5% sinh l�c v� duy tr� trong v�ng 20 gi�y,  khi hai boss c� kho�ng c�ch l�n h�n 10 th� s� h�y b� b�c ph�t) \nTi�u qu�i ��c th�: T� ��i  Ti�n Nh�n (N�u m�t trong b�n con ch�t th� ph�i gi�t h�t c�n l�i n�u kh�ng s� h�i sinh nh� c�) \nB�ng h� v� c�: ",
	[4] = "\nThu�c t�nh v� k� n�ng ��c th� c�a Boss: L�i ��nh Nh�t K�ch (M�i l�n ph�ng ra s� g�y m�t 10% sinh l�c, v� s� l�m t�t c� m�i ng��i ��nh th�n 1 �o�n th�i gian \nC� quan thu�t:  Kh�p n�i ���ng s� c� ��y r�y nh�ng c� quan, theo tu�n t� t� tr�i sang ph�i ho�t ��ng \nB�ng h� v� c�:",
	[5] = "\nThu�c t�nh v� k� n�ng ��c th� c�a Boss: Kh�ng c�\nTi�u qu�i ��c th�: C� quan (Khi c� quan ph� h�y s� t�o th�nh 5% t�n th��ng c�c c� quan xung quanh), �c khuy�n \nB�ng h� v�: kh�ng",
	[6] = "\nThu�c t�nh v� k� n�ng ��c th� c�a Boss: \nH�a V�: m�i 20 gi�y sinh l�c h�i ph�c 1%\nL�u Quang: M�i 20 gi�y sinh l�c gi�m 1%\nDi Hoa Ti�p M�c: M�i m�t �o�n th�i gian H�a V� s� chuy�n cho L�u Quang 6% sinh l�c\nPh�i h�p sai v� �m d��ng: Khi ph�n tr�m sinh l�c c�a H�a V� v� L�u Quang kh�ng b�ng nhau s� t�o cho ng��i ch�i ch�u m�t l�c s�t th��ng li�n ti�p, ch�nh l�ch c�ng cao th� s�t th��ng c�ng m�nh.\nB�ng h� v� c�: ",
}

TB_STAGE = 			--�����ؿ�����Ӧ���ࣨ��table��
{
	[1] = CSTAGE1,
	[2] = CSTAGE2,
	[3] = CSTAGE3,
	[4] = CSTAGE4,
	[5] = CSTAGE5,
	[6] = CSTAGE6,
}