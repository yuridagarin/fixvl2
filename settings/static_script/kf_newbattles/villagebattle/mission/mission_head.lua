Include("\\settings\\static_script\\kf_newbattles\\functions.lua");

POINT_LIMITED = 500;	--���˻�������
if IB_VERSION == 1 then
	if tonumber(date("%y%m%d")) >= 081010 and tonumber(date("%y%m%d")) <= 081020 then
		EXP_AWARD_WIN = 7000;	--ʤ�������齱������
		EXP_AWARD_LOSE = 7000;	--ʧ�ܷ����齱������
		EXP_AWARD_DRAW = 5000;	--ƽ�־��齱������
	else
		EXP_AWARD_WIN = 7000;	--ʤ�������齱������
		EXP_AWARD_LOSE = 3000;	--ʧ�ܷ����齱������
		EXP_AWARD_DRAW = 5000;	--ƽ�־��齱������
	end
else
	EXP_AWARD_WIN = 6000;	--ʤ�������齱������
	EXP_AWARD_LOSE = 3000;	--ʧ�ܷ����齱������
	EXP_AWARD_DRAW = 4500;	--ƽ�־��齱������
end;
GOLDENEXP_AWARD_WIN = 900000;	--ʤ��������ת���齱������
GOLDENEXP_AWARD_LOSE = 300000;	--ʧ�ܷ�����ת���齱������
GOLDENEXP_AWARD_DRAW = 600000;	--ƽ�ֽ���ת���齱������
--ȫ�ֳ���
MAPID = VILLAGE_MAP_ID;	--��ͼID
MAPID_SONG = MAPID;
MAPID_LIAO = MAPID;
RANDOM_PLACE = GLB_RANDOM_PLACE_VILL;
MISSION_ID = VILLAGE_MISSION_ID;

WINNER_BONUS = 300;	--ʤ����
DRAW_BONUS = 200;	--ƽ����
LOSER_BONUS = 100;	--������

MAX_PLAYER = SUB_BATTLE_MAX_PLAYER;		--����ս������Ӫ���֧�������
SIGNUP_MAX_PLAYER = SUB_BATTLE_SIGNUP_MAX_PLAYER;	--���֧�ֱ��������
LEAST_PLAYER = 0;		--����ս������Ӫ����Ҫ������

PLAYERCOUNT_DIFF = SUB_BATTLE_PLAYER_DIFF;	--����ս���������
SIGNUP_PLAYERCOUNT_DIFF = SUB_BATTLE_SIGNUP_PLAYER_DIFF;	--�������������
--������Mission����
--===================MissionS==========================================
MSTR_SONG_TARGETNAME = 1;	--��¼�η�Ŀ��NPC������
MSTR_LIAO_TARGETNAME = 2;	--��¼�ɷ�Ŀ��NPC������
MSTR_SONG_ONE	= 3;	--��¼˫��������ѡ����˵�����
MSTR_LIAO_ONE	= 4;
MSTR_SONG_TWO   = 5;
MSTR_LIAO_TWO	= 6;	
MSTR_SONG_THREE	= 7;
MSTR_LIAO_THREE = 8;
--===================MissionV================================================
MV_HEADER_APPEAR = 31;	--��������NPC������ֵΪ0��ʾ���컹û���֡�
MV_SONG_TASKSTEP = 32;	--��¼˫���������Ĳ���
MV_LIAO_TASKSTEP = 33;

MV_SONG_KILL_SONG = 34;	--��¼�η�ɱ���η�Ŀ��֪���˵�����
MV_LIAO_KILL_LIAO = 35 	--��¼�ɷ�ɱ���ɷ�Ŀ��֪���˵�����

MV_SONG_KILL_LIAO = 36;	--��¼�η�ɱ���ɷ�Ŀ��֪���˵�����
MV_LIAO_KILL_SONG = 37	--��¼�ɷ�ɱ���η�Ŀ��֪���˵�����

MV_TASK_NPCINDEX_SONG = 38;	--��¼Ŀ��NPC������
MV_TASK_NPCINDEX_LIAO = 39;

MV_KNOWMAN_SONG_BEGIN = 40;	--��¼֪����NPC������
MV_KNOWMAN_SONG_END = 49;
MV_KNOWMAN_LIAO_BEGIN = 50;
MV_KNOWMAN_LIAO_END = 59;

MV_POS_INDEX_SONG_BEGIN = 60;	--��¼�ѱ�ռ�õ�λ������
MV_POS_INDEX_SONG_END = 70;
MV_POS_INDEX_LIAO_BEGIN = 71;
MV_POS_INDEX_LIAO_END = 81;

MV_TARGET_NPC_STATE_SONG = 82;	--��¼�η�Ŀ��NPC��״̬��0Ϊ�Ի�״̬��1Ϊս��״̬
MV_TARGET_NPC_STATE_LIAO = 83;	--��¼�ɷ�Ŀ��NPC��״̬��0Ϊ�Ի�״̬��1Ϊս��״̬

MV_NPC_FIGHT_BEGIN_SONG = 84;	--��¼�η�Ŀ��NPC���ս��NPCʱ��ʱ���ļ���ֵ
MV_NPC_FIGHT_BEGIN_LIAO = 85;	--��¼�ɷ�Ŀ��NPC���ս��NPCʱ��ʱ���ļ���ֵ

MV_FIGHT_NPC_TYPE_SONG = 86;	--��¼�η�ս��NPC�����ͣ�1Ϊ��ޣ�2Ϊ��ŭ��3Ϊ��
MV_FIGHT_NPC_TYPE_LIAO = 87;	--��¼�ɷ�ս��NPC�����ͣ�1Ϊ��ޣ�2Ϊ��ŭ��3Ϊ��
--===========================================================================
TIMER_ID = 102;	--Timer��ID
--===========================================================================
READY_TIME = 30*FRAME_PER_SECOND;--����׼��ʱ���ʱ���ı�ʱ�����������
READY_TIMER_LOOP = (15*FRAME_PER_MIN/READY_TIME)-1;--����׼��ʱ���ʱ����ʱ������15���ӣ�
FIGHT_TIME = 20*FRAME_PER_SECOND;			--����ʱ���ʱ���ı�ʱ���
FIGHT_TIMER_LOOP = (30*FRAME_PER_MIN/FIGHT_TIME)-1;	--����ʱ���ʱ���ı�ʱ������30���ӣ�
WAITOUT_TIME = 30*FRAME_PER_SECOND;		--�ȴ�����ʱ���ʱ���ı�ʱ���
WAITOUT_TIMER_LOOP = (0.5*FRAME_PER_MIN/WAITOUT_TIME)-1; --�ȴ�����ʱ���ʱ���ı�ʱ����������ӣ�
--===========================================================================
FIGHT_NPC_TIMEOUT1 = 9;		--���NPC����ʱ�䣬������һ����λ
FIGHT_NPC_TIMEOUT2 = 12;	--��ŭNPC����ʱ��
FIGHT_NPC_TIMEOUT3 = 15;	--��NPC����ʱ��
--===========================================================================
