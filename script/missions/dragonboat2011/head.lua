--�ű����ܣ���������սͷ�ļ�
--������ƣ����ܡ�С����
--���ܿ������������峤
--���ܲ��ԣ�С�ܡ�����
--����ʱ�䣺2011-8-23
--�޸ļ�¼��
Include("\\script\\missions\\dragonboat2011\\string.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\lib\\npccmdhead.lua")

PLAYER_DEATH_SCRIPT = "\\script\\missions\\dragonboat2011\\npc\\death_palyer.lua"

LONGCHAU_LOG_TITLE = "Hai Chien Long Chau"

--===========�������ñ���Ϣ=====================
MAPID = 6008 --��ͼ�ɣ�
MISSIONID = 56 --mission ID
TIMERID = 86 --ʱ�䴥���� �ɣ�
tMsLogInPos = {
	[1] = {1486,3294},
	[2] = {1627,3102},
} --�����
tMsFightPos = {
	[1] = {1516,3275},
	[2] = {1610,3159},
}--ս����
tMsLogOutPos = {
	[1] = {150,1694,3140},--{300,1648,3534},
	[2] = {150,1694,3140},--{300,1648,3534},
} --�ǳ���
tMsOpenTime = {
	[1] = {1000,1100},
	[2] = {1600,1700},
	[3] = {2200,2300},
} --����ʱ��
tMsNpcPos = {
	[1] = {1478,3293},--�����
	[2] = {1627,3095},
	[3] = {1499,3306},--�캽Ա
	[4] = {1639,3117},
	[5] = {1541,3219},--������
	[6] = {1589,3219},--��̩
}
tMsPlayerRev = {
	[1] = {1526,3329},
	[2] = {1663,3134},
} --������
tMsFireBoat = {
	[1] = {1523,3283},
	[2] = {1603,3151},
} --�𴬳��ֵ�
tMsBox = {
	[1] = {1580,3168},
	[2] = {1546,3188},
	[3] = {1511,3238},
	[4] = {1569,3186},
	[5] = {1605,3194},
	[6] = {1598,3239},
	[7] = {1552,3273},
	[8] = {1581,3249},
	[9] = {1556,3209},
	[10] = {1565,3246},
	[11] = {1525,3208},
	[12] = {1547,3239},
	[13] = {1583,3211},
	[14] = {1535,3242},
	[15] = {1537,3254},
	[16] = {1571,3233},
}--Ư��������
tMsBoxCopy = tMsBox ----Ư�������꿽��

tMsSongBoat = {
	[1] = {1523,3283},
	[2] = {1619,3167},
}
tMsLiaoBoat = {
	[1] = {1603,3151},
	[2] = {1509,3270},
}
--==============ȫ�ֱ���=========================
PLAY_NEED_LV = 77   --������С�ȼ�
WIN_AWARD = 2000000 --ʤ����õľ���
FAIL_AWARD = 1000000 -- ʧ�ܻ�õľ���
MAX_AWARD_DAY = 6000000 --һ���õľ�������
MAX_ROOM_COUNT = 40   --��ͼ���ɼ�����
PLAYER_MAX_NUM = 16 --�����������
PLAYER_NEED_NUM = 8   --����˫����Ҫ����������
OVER_GAME_POINT = 100 --��������
FIRE_BOAT_TIME_ONE = 10 --�����𴬵ķ���
FIRE_BOAT_TIME_TWO = 60 --�����𴬵ķ���
ERROR_ALLOW_POINT = 4 --�������ֵ
INCREASE_POINT = 10 --�Զ�������ֵ
REGIST_FEES = 60000  --��������
FIREBOAT_POINT = 30 --�𴬵����õķ���
--================�������===============
PLAYER_STATUS = 1715;	--��¼����ǹ��ڻ��ǲ���ѡ�֡�0ʲô�����ǣ�1Ϊ���ڣ�2Ϊ����ѡ��
						--����������������Ϊ2��������
--==========��Ӫ========================================
ALL_ID = 0 
CampSong_ID = 1 --��
CampLiao_ID = 2 --��
tCampName = {"Qu�n T�ng","Qu�n Li�u"}

CampSong_Type = "camp_player" --����������Ӫ���ͣ�����npc
CampLiao_Type = "camp_enemy"  --������ͽ��Ӫ���ͣ�����npc
Neutral_Type = "camp_evil"		--����npc��Ӫ����

tCampType = {
	[0] = "camp_evil",
	[1] = "camp_player",
	[2] = "camp_enemy",
}

--=====================����������=================
LOG_ID = 3300 					--��½��������ID
LOG_TRIGGER_ID = 3040 			--��½�������Զ���ID

--==============������ս����״̬===================
MS_STATE_PEACE = 0				--�ȴ������׶�
MS_STATE_READY = 1   			--׼��״̬��������ȴ���ս�׶�
MS_STATE_FIGHT = 2				--��ս״̬
MS_STATE_COMPLETE = 3		    --ս������״̬

--==============����missionV����===================
MV_LZZ_LOAD = 1    --�Ƿ��Ѿ����ؿ���
MV_LZZ_STATE = 2   --��¼ս����״̬
MV_LZZ_MAP_ID = 3         --������MAPID
MV_LZZ_MAP_INDEX = 4     --������MAP����
MV_LZZ_CAMPONE_POINT = 7  --��¼��ǰ��Ӫһ��ս��ʱ�䣨���֣�
MV_LZZ_CAMPTWO_POINT = 8  --��¼��ǰ��Ӫ����ս��ʱ�䣨���֣�
MV_LZZ_WINNER_CAMP = 10    --��¼˭Ӯ��
MV_TIMER_LOOP = 12 				--��¼TIMER�ı�ʱ����
MV_LZZ_LOG_TIME = 13      --��¼������ʱ�� ��ʽ��%m%d%H%M%S
MV_LZZ_GAME_LOOP = 14     --��¼GetGameLoop()
MV_LZZ_ERROR_NUM = 15     --��¼���´����������Ĵ������ﵽһ��������ȥ������
MV_LZZ_SONGBOAT_IDX = 16 --�λ�����
MV_LZZ_LIAOBOAT_IDX = 17 --�λ�����
MV_LZZ_SONGFIREBOAT_TAG1 =18 --�λ𴬵�һ��ˢ��
MV_LZZ_SONGFIREBOAT_TAG2 =19 --�λ𴬵ڶ���ˢ��
MV_LZZ_LIAOFIREBOAT_TAG1 =20 --�ɻ𴬵�һ��ˢ��
MV_LZZ_LIAOFIREBOAT_TAG2 =21 --�ɻ𴬵ڶ���ˢ��

--====================Timer��صı���=========================
PEACE_TIME_ATOM = 5 --5min
READY_TIME_ATOM = 1 --1min
FIGHT_TIME_ATOM = 40 --40min
WAITOUT_TIME_ATOM = 0.5 --0.5min
------------------------------------------------------------
FRAME_PER_SECOND = 18  --һ���ڵ�֡��Ϊ18֡���̶�����
FRAME_PER_MIN = 60*FRAME_PER_SECOND 

PEACE_TIME = 5*FRAME_PER_SECOND --time.lua����������ȴ��������������ʱ���ı�ʱ�����5��
PEACE_TIMER_LOOP = (PEACE_TIME_ATOM*FRAME_PER_MIN/PEACE_TIME)-1 --�ȴ��������������ʱ����ʱ������5���ӣ�
READY_TIME = 5*FRAME_PER_SECOND --time.lua�����������ս׼��ʱ���ʱ���ı�ʱ�����5��
READY_TIMER_LOOP = (READY_TIME_ATOM*FRAME_PER_MIN/READY_TIME)-1 --��ս׼��ʱ���ʱ����ʱ������1���ӣ�
FIGHT_TIME = 15*FRAME_PER_SECOND --time.lua�������������ʱ���ʱ���ı�ʱ�����5��
FIGHT_TIMER_LOOP = (FIGHT_TIME_ATOM*FRAME_PER_MIN/FIGHT_TIME)-1 	--����ʱ���ʱ���ı�ʱ������40���ӣ�
WAITOUT_TIME = 5*FRAME_PER_SECOND 	--time.lua����������ȴ�����ʱ���ʱ���ı�ʱ�����5��
WAITOUT_TIMER_LOOP = (WAITOUT_TIME_ATOM*FRAME_PER_MIN/WAITOUT_TIME)-1  --�ȴ�����ʱ���ʱ���ı�ʱ����������ӣ�
JOIN_TIMER_ALLOW = (0.2*(FIGHT_TIMER_LOOP+1)) --�������ʱ��ֵ80%ս��ʱ��
FIGHT_TIMER_YQX = FIGHT_TIMER_LOOP-(2*FRAME_PER_MIN/FIGHT_TIME)  --�η�������ˢ������ʱ���loop����
FIGHT_TIMER_XT = FIGHT_TIMER_LOOP-(2*FRAME_PER_MIN/FIGHT_TIME) --�ɷ���̩�������ʱ���loop����


--=====================ħ�����Լӳ�================================
CONTINUE_TIME = 45*60*60 --ħ�����Գ���ʱ��45min
QINGLONG_LIFE = 75000 --������������ֵ
XUANWU_LFTE = 125000  --������������ֵ
BAIHU_LFTE = 50000  --�׻���������ֵ
ZHUQUE_LFTE = 50000 --��ȸ��������ֵ

tbQuanCong =
{
	[0] = {250,100},
	[1] = {500,200},
	[2] = {1250,500},
	[3] = {2500,1000},
}

tAwardItemNeed = 
{
	[0] = {},
	[1] = {"Qu�n C�ng Ch��ng",2,1,9999,1},
	[2] = {"Qu�n C�ng ��i",2,1,9998,1},
	[3] = {"Qu�n C�ng Huy Ho�ng",2,1,9977,1},
};

tAwardAll = 
{
	{3, 49490, 30000, 1},
	{3, 14940, 180000, 1},
	{1, 3990, "Thi�n Th�ch Tinh Th�ch", {2, 1, 1009, 1, 1}, 0 },
	{31, 10910, "vaf_GiveFactionBook45()", ""},
	{31, 5559, "vaf_GiveFactionBook70()", ""},
	{31, 110, "vaf_GiveSpecialBook70()", ""},
	{1, 5000, "B�nh �t Ng�i H��ng", {2, 1, 1123, 1, 4}, 0 },
	{1, 5000, "B�nh �t Ch�n G�", {2, 1, 1124, 1, 4}, 0 },
	{1, 5000, "B�nh �t B�t B�o", {2, 1, 1125, 1, 4}, 0 },
	{1, 1, "��ng Ph��ng Long Ch�u", {0, 102, 24, 1, 1, -1, -1, -1, -1, -1, -1}, 0 },
}

-- ch�a add t� l�
tFactionBook45 = 
{
	{1, 357, "Kim Cang Ph�c Ma kinh",{0,107,1, 1}, 0},	
	{1, 357, "Kim Cang Ph�c Ma T�m Ph�p",{0,107,2, 1}, 0},
	{1, 357, "Ti�m Long M�t t�ch",{0,107,3, 1},	0},
	{1, 357, "Ti�m Long T�m Ph�p",{0,107,4, 1}, 0},
	{1, 357, "V� Tr�n M�t t�ch",{0,107,5, 1}, 0},	
	{1, 357, "V� Tr�n T�m Ph�p",{0,107,6, 1},	 0},
	{1, 357, "Thi�n La M�t T�ch",{0,107,7, 1}, 0},
	{1, 357, "Thi�n La T�m Ph�p",{0,107,8, 1}, 0},	
	{1, 357, "Nh� � M�t T�ch",{0,107,9, 1}, 0},	
	{1, 357, "Nh� � T�m Ph�p",{0,107,10, 1}, 0},
	{1, 357, "B�ch H�i Ph�",{0,107,11, 1}, 0},
	{1, 357, "B�ch H�i T�m Ph�p",{0,107,12, 1}, 0},
	{1, 357, "H�n ��n M�t t�ch",{0,107,13, 1}, 0},
	{1, 357, "H�n ��n T�m Ph�p",{0,107,14, 1}, 0},
	{1, 357, "Qu� Thi�n M�t t�ch",{0,107,15, 1}, 0},
	{1, 357, "Qu� Thi�n T�m Ph�p",{0,107,16, 1}, 0},
	{1, 357, "Huy�n �nh M�t t�ch",{0,107,17, 1}, 0},
	{1, 357, "Huy�n �nh T�m Ph�p",{0,107,18, 1}, 0},
	{1, 357, "Qu�n T� M�t t�ch",{0,107,19, 1}, 0},
	{1, 357, "Qu�n T� T�m Ph�p",{0,107,20, 1}, 0},
	{1, 357, "Tr�n Qu�n M�t t�ch",{0,107,21, 1}, 0},
	{1, 357, "Tr�n Qu�n T�m Ph�p",{0,107,22, 1}, 0},
	{1, 357, "Xuy�n V�n M�t t�ch",{0,107,23, 1}, 0},
	{1, 357, "Xuy�n V�n T�m Ph�p",{0,107,24, 1}, 0},
	{1, 357, "U Minh Qu� L�c",{0,107,25, 1}, 0},
	{1, 357, "U Minh T�m Ph�p",{0,107,26, 1}, 0},
	{1, 359, "Linh C� M�t t�ch",{0,107,27, 1}, 0},
	{1, 359, "Linh C� T�m Ph�p",{0,107,28, 1}, 0},
}

tFactionBook70 = {
	{1, 714, "Kim Cang B�t Nh� Kinh",{0,107,166, 1}, 0},
	{1, 714, "Ti�m Long T�ch Di�t Kinh",{0,107,167, 1}, 0},
	{1, 714, "V� Tr�n B� �� Kinh",{0,107,168, 1}, 0},
	{1, 714, "Thi�n La Li�n Ch�u L�c",{0,107,169, 1}, 0},
	{1, 714, "Nh� � Kim ��nh M�t T�ch",{0,107,170, 1}, 0},
	{1, 714, "B�ch H�i Tuy�t �m Ph�",{0,107,171, 1}, 0},
	{1, 714, "H�n ��n Tr�n Nh�c M�t T�ch",{0,107,172, 1}, 0},
	{1, 714, "Qu� Thi�n Du Long M�t T�ch",{0,107,173, 1}, 0},
	{1, 714, "Huy�n �nh M� Tung M�t T�ch",{0,107,174, 1}, 0},
	{1, 714, "Qu�n T� Ti�t Phong M�t T�ch",{0,107,175, 1}, 0},
	{1, 714, "Tr�n Qu�n Phi Long Th��ng Ph�",{0,107,176, 1}, 0},
	{1, 714, "Xuy�n V�n L�c H�ng M�t T�ch",{0,107,177, 1}, 0},
	{1, 716, "U Minh Phong Ma L�c",{0,107,178, 1}, 0},
	{1, 716, "Linh C� Huy�n T� L�c",{0,107,179, 1}, 0},
	{1, 0, "C�u Thi�n Phong L�i Quy�t",{0,107,198, 1}, 0},
	{1, 0, "H�ng Tr�n T�y M�ng Ph�",{0,107,202, 1}, 0},
	{1, 0, "Phong Hoa Thi�n Di�p Ph�",{0,107,203, 1}, 0},
};

tSpecialBook70 = {
	{1, 888, "Kim Cang B�t Nh� Ch�n Quy�n",{0,107,204, 1}, 0},
	{1, 568, "Ti�m Long T�c Di�t Ch�n Quy�n",{0,107,205, 1}, 0},
	{1, 714, "V� Tr�n B� �� Ch�n Quy�n",{0,107,206, 1}, 0},
	{1, 888, "Thi�n La Li�n Ch�u Ch�n Quy�n",{0,107,207, 1}, 0},
	{1, 568, "Nh� � Kim ��nh Ch�n Quy�n",{0,107,208, 1}, 0},
	{1, 568, "B�ch H�i Tuy�t �m Ch�n Quy�n",{0,107,209, 1}, 0},
	{1, 888, "H�n ��n Tr�n Nh�c Ch�n Quy�n",{0,107,210, 1}, 0},
	{1, 668, "Qu� Thi�n Du Long Ch�n Quy�n",{0,107,211, 1}, 0},
	{1, 668, "Huy�n �nh M� T�ng Ch�n Quy�n",{0,107,212, 1}, 0},
	{1, 714, "Qu�n T� ��i Phong Ch�n Quy�n",{0,107,213, 1}, 0},
	{1, 668, "Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n",{0,107,214, 1}, 0},
	{1, 668, "Xuy�n V�n L�c H�ng Ch�n Quy�n",{0,107,215, 1}, 0},
	{1, 888, "Huy�n Minh Phong Ma Ch�n Quy�n",{0,107,216, 1}, 0},
	{1, 644, "Linh C� Huy�n T� Ch�n Quy�n",{0,107,217, 1}, 0},
	{1, 0, "C�u Thi�n Phong L�i Ch�n Quy�n", {0, 107, 218, 1}, 0},
	{1, 0, "H�ng Tr�n T�y M�ng Ch�n Quy�n", {0, 107, 222, 1}, 0},
	{1, 0, "Phong Hoa Thi�n Di�p Ch�n Quy�n", {0, 107, 223, 1}, 0},
};


function vaf_GiveFactionBook45()
	gf_EventGiveRandAward(tFactionBook45,10000,1)
end

function vaf_GiveFactionBook70()
	gf_EventGiveRandAward(tFactionBook70,10000,1)
end

function vaf_GiveSpecialBook70()
	gf_EventGiveRandAward(tSpecialBook70,10000,1)
end