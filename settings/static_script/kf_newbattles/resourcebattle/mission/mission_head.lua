Include("\\settings\\static_script\\kf_newbattles\\functions.lua");

POINT_LIMITED = 500;	--��������
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
MAPID = RESOURCE_MAP_ID;	--��ͼID
MAPID_SONG = MAPID;
MAPID_LIAO = MAPID;
RANDOM_PLACE = GLB_RANDOM_PLACE_RESO;
MISSION_ID = RESOURCE_MISSION_ID;

WINNER_BONUS = 300;	--ʤ����
DRAW_BONUS = 200;	--ƽ����
LOSER_BONUS = 100;	--������

MAX_PLAYER = SUB_BATTLE_MAX_PLAYER;		--��Դս������Ӫ���֧�������
SIGNUP_MAX_PLAYER = SUB_BATTLE_SIGNUP_MAX_PLAYER;	--���֧�ֱ��������
LEAST_PLAYER = 0;		--��Դս������Ӫ����Ҫ������

PLAYERCOUNT_DIFF = SUB_BATTLE_PLAYER_DIFF;	--��Դս���������
SIGNUP_PLAYERCOUNT_DIFF = SUB_BATTLE_SIGNUP_PLAYER_DIFF;	--�������������

BASE_RESOURCE = 10000;	--��ʼ��Դ����

DRUM_COUNT = 10;
--===========================================================================
--������Mission����
--===========================================================================
MV_RESOURCE_SONG = 31;	--��¼�η�������
MV_RESOURCE_LIAO = 32;	--��¼�ɷ�������

--MV_REFLASH_TIMER_LOOP = 33;	--��¼����ˢ��Timer�ı�ʱ����

MV_RESOURCE_POS_BEGIN = 34;	--��¼����NPC��λ����Ϣ����λ���ǣ�һ��Ҫ121λ��ֵ����ʾ��λ����NPC������ʾû��NPC
MV_RESOURCE_POS_END = 37;	--Ҫ��121��λ�ã�ÿ�������У���λ�����Ҫ4��������4��������128��

MV_CHANGEDRUMLEFT_SONG = 38;		--��ǰ�η��ɻ�ȡս��ʣ�����
MV_CHANGEDRUMLEFT_LIAO = 39;		--��ǰ�η��ɻ�ȡս��ʣ�����

MV_DRUM_USE_TIME_SONG = 40;	--�η��ϴ�ʹ��ս�ĵ�ʱ��
MV_DRUM_USE_TIME_LIAO = 41;	--�ɷ��ϴ�ʹ��ս�ĵ�ʱ��

MV_STONE_COUNT_SONG = 42;	--�η��Ͻ���ʯͷ����
MV_STONE_COUNT_LIAO = 43;	--�ɷ��Ͻ���ʯͷ����
--===========================================================================
TIMER_ID = 103;	--Timer��ID
--===========================================================================
READY_TIME = 30*FRAME_PER_SECOND;--����׼��ʱ���ʱ���ı�ʱ�����������
READY_TIMER_LOOP = (15*FRAME_PER_MIN/READY_TIME)-1;--����׼��ʱ���ʱ����ʱ������15���ӣ�
FIGHT_TIME = 20*FRAME_PER_SECOND;			--����ʱ���ʱ���ı�ʱ���
FIGHT_TIMER_LOOP = (30*FRAME_PER_MIN/FIGHT_TIME)-1;	--����ʱ���ʱ���ı�ʱ������30���ӣ�
WAITOUT_TIME = 30*FRAME_PER_SECOND;		--�ȴ�����ʱ���ʱ���ı�ʱ���
WAITOUT_TIMER_LOOP = (0.5*FRAME_PER_MIN/WAITOUT_TIME)-1; --�ȴ�����ʱ���ʱ���ı�ʱ����������ӣ�
--===========================================================================
CATERAN_TIMER_ID = 104;	--ɽ���¼�TImer

CATERAN_TIME = 1*18;	--ˢ�¼��ʱ��
CATERAN_TIMER_LOOP = 60	--1����
--===================������Timer״̬=========================================
TM_STATE_CATERAN_SONG = 1;	--��ʾ��ǰ��ɽ�������η���״̬��
TM_STATE_CATERAN_LIAO = 2;	--��ʾ��ǰ��ɽ�������ɷ���״̬��