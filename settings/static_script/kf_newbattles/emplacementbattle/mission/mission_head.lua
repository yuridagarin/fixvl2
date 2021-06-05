Include("\\settings\\static_script\\kf_newbattles\\functions.lua");

POINT_LIMITED = 500;		--��������
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
MAPID = EMPLACEMENT_MAP_ID;	--��ͼID
MAPID_SONG = MAPID;
MAPID_LIAO = MAPID;
RANDOM_PLACE = GLB_RANDOM_PLACE_EMPL;
MISSION_ID = EMPLACEMENT_MISSION_ID;

WINNER_BONUS = 300;	--ʤ����
DRAW_BONUS = 200;	--ƽ����
LOSER_BONUS = 100;	--������

MAX_PLAYER = SUB_BATTLE_MAX_PLAYER;			--��̨ս������Ӫ���֧�������
SIGNUP_MAX_PLAYER = SUB_BATTLE_SIGNUP_MAX_PLAYER;	--���֧�ֱ��������
LEAST_PLAYER = 0;							--��̨ս������Ӫ����Ҫ������

PLAYERCOUNT_DIFF = SUB_BATTLE_PLAYER_DIFF;	--��̨ս���������
SIGNUP_PLAYERCOUNT_DIFF = SUB_BATTLE_SIGNUP_PLAYER_DIFF;	--�������������
--������Mission����
--===========================================================================
MV_OCCUPY_TIME_SONG = 31;		--��¼�η�ռ����̨����ʱ�䣬��λΪ��
MV_OCCUPY_TIME_LIAO = 32;		--��¼�ɷ�ռ����̨����ʱ�䣬��λΪ��

MV_TAKE_TIME_SONG = 33;			--��¼�η��ϴι�ռ��̨��ʱ��
MV_TAKE_TIME_LIAO = 34;			--��¼�ɷ��ϴι�ռ��̨��ʱ��

MV_KILL_NATIVE_COUNT = 35;		--��¼������������
MV_KILL_GUARD_COUNT = 36;		--��¼��̨������������
MV_KILL_BOX_COUNT = 37;			--��¼�򿪱��������
MV_LENGXL_BOSS_NPXIDX = 38; --��¼�������npcindex

--===========================================================================
TIMER_ID = 105;					--Timer��ID
--===========================================================================
READY_TIME = 30*FRAME_PER_SECOND;--����׼��ʱ���ʱ���ı�ʱ�����������
READY_TIMER_LOOP = (5*FRAME_PER_MIN/READY_TIME)-1;--����׼��ʱ���ʱ����ʱ������5���ӣ�
FIGHT_TIME = 20*FRAME_PER_SECOND;			--����ʱ���ʱ���ı�ʱ���
FIGHT_TIMER_LOOP = (35*FRAME_PER_MIN/FIGHT_TIME)-1;	--����ʱ���ʱ���ı�ʱ������35���ӣ�
WAITOUT_TIME = 30*FRAME_PER_SECOND;		--�ȴ�����ʱ���ʱ���ı�ʱ���
WAITOUT_TIMER_LOOP = (0.5*FRAME_PER_MIN/WAITOUT_TIME)-1; --�ȴ�����ʱ���ʱ���ı�ʱ����������ӣ�
--===========================================================================
INJURE_TIMER_ID = 108;			--������̨���˵�Timer ID

INTERVAL_TIME = 10*18;			--ˢ�¼��ʱ��