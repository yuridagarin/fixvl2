--������ͷ�ļ�
--by vivi
--2009-07-15

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\lib\\topscorelib.lua");
--Include("\\script\\lib\\xoyobi.lua");
Include("\\script\\lib\\sdb.lua");
Include("\\script\\misc\\observer\\observer_head.lua")

Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")
THIENMON_LOG_TITLE = "Chien truong Thien Mon Tran"

CampOne_Name = "Qu�n T�ng";
CameTwo_Name = "Qu�n Li�u";

ALL_ID = 0;
CampOne_ID = 1;	--����������mission����Ӫ
CampTwo_ID = 2;	--������ͽ��mission����Ӫ

tCampName = {"Qu�n T�ng","Qu�n Li�u"};

CampOne_Type = "camp_player"; --����������Ӫ���ͣ�����npc
CampTwo_Type = "camp_enemy";  --������ͽ��Ӫ���ͣ�����npc
Neutral_Type = "camp_evil";		--����npc��Ӫ����

TMZ_EXP_EXT_RATE = min(VNG_CFG_TMZ_EXP_EXT_ADD_RATE or 0, 2)--����ӳ�ϵ��
TMZ_JUNGONG_EXT_RATE = min(VNG_CFG_TMZ_JUNGONG_EXT_ADD_RATE or 0, 2)--�����ӳ�ϵ��

tCampType = {
	[0] = "camp_evil",
	[1] = "camp_player",
	[2] = "camp_enemy",};

--===============ȫ�ֱ���==========================
g_NpcName = "<color=green>phi�u k� t��ng qu�n Qu�ch Qu�n B�ng<color>: ";

MAP_ID = 6006;

PLAY_NEED_LV = 70;      --������С�ȼ�

PLAYER_NEED_NUM = 6;    --����˫����Ҫ����������
PLAYER_MAX_NUM = 16;    --����˫���ɼ�����������

MAX_ROOM_COUNT = 40;   --��ͼ���ɼ�����
--local nVersion,nCurGs = GetRealmType();
--if nCurGs == 1 then
--	MAX_ROOM_COUNT = 10;
--end

DEAD_BODY_TIME = 5;			--ʬ�����ʱ��

APPEAR_FLAG_POINT = 500; --500�ֵ�ʱ����ִ�����
BROKEN_FLAG_POINT = 200; --��������õ�200��
BROKEN_EYE_POINT = 5; --�������۵õ�5��
OVER_GAME_POINT = 1000;  --��һ����ս��ﵽ1000��ʱ����ս����

GIVE_AWARD_MARK = 20; --�μ�һ�ε�ȫ�����
MAX_MARK = 6000; --��������
MAX_HUFU = 8;  --��ѻ�����

CURE_ALL_PLAYER = 0;						--�Ƿ��������к�ƽ״̬�����
DRIVE_PLAYER_OUTOF_SHELTER = 1;	--�Ƿ��ǿ�ƴ��ͺ�Ӫͣ�����õ���ҵĹ���
INVINCIBILITY_TIME = 5;			--������Ӫ���޵�ʱ�䣬��λ��

DEATH_SCRIPT = "\\script\\missions\\tianmenzhen\\playerdeath.lua";
NPC_DEATH_SCRIPT = "\\script\\missions\\tianmenzhen\\npc_death.lua";
TMZ_VM_SCRIPT = "\\script\\missions\\tianmenzhen\\tmz_npc.lua";
TMZ_TONG_RELAY_KEY_1 = "TMZ_TONG_SOCRE_RANK"; --�ڿ������������ÿ����
TMZ_TONG_RELAY_KEY_2 = "TMZ_TONG_RANK_SHOW";  --��ʾ������ϵģ�������ı���
TMZ_TONG_RELAY_KEY_3 = "TMZ_TONG_RELAY_DATA"; --���ڱ���������

--��Ծ�����
TMZ_ACTIVE_PVP_DEATH_NUM = 6
TMZ_ACTIVE_PVP_LIMIT = 3
TMZ_ACTIVE_DAMAGE_LIMIT = 200000
TMZ_ACTIVE_HEAL_LIMIT = 100000
TMZ_ACTIVE_PVE_LIMIT = 6
TMZ_ACTIVE_EYE_LIMIT = 1
TMZ_ACTIVE_FLAG_LIMIT = 1

--ÿ�ղμ�����
TMZ_DAILY_JOIN_LIMIT = 4

--ÿ���콱����
TMZ_DAILY_AWARD_LIMIT = 4

--===============�������=========================
--��define�ж���

--=====================��ʱ����==================================
PTT_DIE_LOOP = 201;				--��¼�����ս��������ʱ�򣬵�ǰ��ʱ����ѭ����
TASK_TEMP_DIE_TIME = 202; --��¼�������ʱʱ�䣬����GetTime()����������10s����ܳ�ȥս��

--===============mission���======================
MISSION_ID = 54; --mission id
TIMER_ID = 84; --time id
LOG_ID = 404;					--��½��������ID
LOG_TRIGGER_ID = 304;			--��½�������Զ���ID

FRAME_PER_SECOND = 18;
FRAME_PER_MIN = 60*FRAME_PER_SECOND;

PEACE_TIME = 5*FRAME_PER_SECOND;--�ȴ��������������ʱ���ı�ʱ�����5��
PEACE_TIMER_LOOP = (15*FRAME_PER_MIN/PEACE_TIME)-1;--�ȴ��������������ʱ����ʱ������15���ӣ�
READY_TIME = 5*FRAME_PER_SECOND;--��ս׼��ʱ���ʱ���ı�ʱ�����5��
READY_TIMER_LOOP = (1*FRAME_PER_MIN/READY_TIME)-1;--��ս׼��ʱ���ʱ����ʱ������1���ӣ�
FIGHT_TIME = 15*FRAME_PER_SECOND;			--����ʱ���ʱ���ı�ʱ�����15��
FIGHT_TIMER_LOOP = (40*FRAME_PER_MIN/FIGHT_TIME)-1;	--����ʱ���ʱ���ı�ʱ������40���ӣ�
WAITOUT_TIME = 15*FRAME_PER_SECOND;		--�ȴ�����ʱ���ʱ���ı�ʱ���
WAITOUT_TIMER_LOOP = (0.5*FRAME_PER_MIN/WAITOUT_TIME)-1; --�ȴ�����ʱ���ʱ���ı�ʱ����������ӣ�

--==============����missionV����===================
MV_TMZ_LOAD = 1;   --�Ƿ��Ѿ����ؿ���
MV_TMZ_STATE = 2;  --��¼ս����״̬
MV_TMZ_MAP_ID = 3;        --�����������MAPID
MV_TMZ_MAP_INDEX = 4;    --�����������MAP����
MV_TMZ_CAMPONE_EYE = 5; --��¼��ǰ��Ӫһ��������
MV_TMZ_CAMPTWO_EYE = 6; --��¼��ǰ��Ӫ����������
MV_TMZ_CAMPONE_POINT = 7; --��¼��ǰ��Ӫһ��ս��ʱ�䣨���֣�
MV_TMZ_CAMPTWO_POINT = 8; --��¼��ǰ��Ӫ����ս��ʱ�䣨���֣�
MV_TMZ_APPEAR_FLAG = 9;   --��¼�Ƿ��Ѵ�����ս��
MV_TMZ_WINNER_CAMP = 10;   --��¼˭Ӯ��
MV_TMZ_SHOWDATA_IDX = 11;  --��¼���ζ�����TMZ_ShowData�еڼ���
MV_TIMER_LOOP = 12;				--��¼TIMER�ı�ʱ����
MV_TMZ_LOG_TIME = 13;     --��¼������ʱ�� ��ʽ��%m%d%H%M%S
MV_TMZ_GAME_LOOP = 14;    --��¼GetGameLoop()
MV_TMZ_ERROR_NUM = 15;    --��¼���´����������Ĵ������ﵽһ��������ȥ������
MV_TMZ_TONG_CAMPONE_MAX = 16; --��Ӫһ���ɽ�ȥ�������
MV_TMZ_TONG_CAMPTWO_MAX = 17; --��Ӫ�����ɽ�ȥ�������
MV_TMZ_TONG_CAMPONE_USEFUL = 18; --��Ӫһ��Ч������������
MV_TMZ_TONG_CAMPTWO_USEFUL = 19; --��Ӫ����Ч������������
MV_TMZ_TONG_CAMPONE_SCORE = 20;--��Ӫһ��ǰ�������
MV_TMZ_TONG_CAMPTWO_SCORE = 21;--��Ӫ����ǰ�������
MV_TMZ_TONG_CAMPONE_LV = 22;--��Ӫһ��ǰ����ȼ�
MV_TMZ_TONG_CAMPTWO_LV = 23;--��Ӫ����ǰ����ȼ�
MV_TMZ_TONG_CAMPONE_WEEK_WIN = 24;--��Ӫһ���ܶ�սʤ����
MV_TMZ_TONG_CAMPTWO_WEEK_WIN = 25;--��Ӫ�����ܶ�սʤ����
MV_TMZ_TONG_CAMPONE_WEEK_LOSE = 26;--��Ӫһ���ܶ�ս������
MV_TMZ_TONG_CAMPTWO_WEEK_LOSE = 27;--��Ӫ�����ܶ�ս������
MV_TMZ_TONG_CAMPONE_TOTAL_WIN = 28;--��Ӫһ�ܶ�սʤ����
MV_TMZ_TONG_CAMPTWO_TOTAL_WIN = 29;--��Ӫ���ܶ�սʤ����
MV_TMZ_TONG_CAMPONE_TOTAL_LOSE = 30;--��Ӫһ�ܶ�ս������
MV_TMZ_TONG_CAMPTWO_TOTAL_LOSE = 31;--��Ӫ���ܶ�ս������
MV_TMZ_TONG_CAMPONE_LAST_WIN = 32;--��Ӫһ�ϳ�ʤ��
MV_TMZ_TONG_CAMPTWO_LAST_WIN = 33;--��Ӫ���ϳ�ʤ��
MV_TMZ_TONG_CAMPONE_HUFU = 34;--��Ӫһ������
MV_TMZ_TONG_CAMPTWO_HUFU = 35;--��Ӫ��������

--==============����missionS����===================
MV_TMZ_TONG_CAMPONE_NAME = 1; --��¼��Ӫһ�������
MV_TMZ_TONG_CAMPTWO_NAME = 2; --��¼��Ӫ���������

--==============������ս����״̬===================
MS_STATE_PEACE = 0;				--�ȴ������׶�
MS_STATE_READY = 1;				--׼��״̬��������ȴ���ս�׶�
MS_STATE_FIGHT = 2;				--��ս״̬
MS_STATE_COMPLETE = 3;		--ս������״̬

tPositionNpcA = {
--���Ϊ��Ʒ������
	{"Hoa Nam H�","Hoa Nam H�",1792,3745},
	{"Hoa Nam ti�u �u","Hoa Nam ti�u �u",1791,3742},
	{"Hoa Nam ti�u �u","Hoa Nam ti�u �u",1785,3743},
	{"S�i c�i","S�i c�i",1780,3341},
	{"S�i con","S�i con",1786,3349},
	{"S�i con","S�i con",1781,3352},
	{"Ti�u t�c ","Ti�u t�c ",1770,3656},
	{"Ti�u t�c ","Ti�u t�c ",1765,3658},
	{"Ti�u t�c ","Ti�u t�c ",1772,3657},
	{"L� Qu�","L� Qu�",1767,3416},
	{"Th�i Tu�n","Th�i Tu�n",1768,3423},
	{"La Kinh","La Kinh",1759,3419},
	{{50,150,250,350},{"��u kh�",2,1,3849},{"D�y bu�c ng�a",2,1,3850},{"B�nh nhi�n li�u",2,1,3849},{"V� chu�i",2,1,3850}},
};

tPositionNpcB = {
	{"Ng��i g�","Ng��i g�",1863,3419},
	{"Ng��i g�","Ng��i g�",1691,3636},
	{{200,400,600,800},{"B�y k�p",2,1,3851},{"D�y bu�c ng�a",2,1,3850},{"B�nh nhi�n li�u",2,1,3849},{"V� chu�i",2,1,3850}}	
};

tPositionNpcC = {
	{"T� Tam D�nh","T� Tam D�nh",1898,3557},
	{"L� Nh� N��ng","L� Nh� N��ng",1890,3559},
	{"M�c Kinh Phong","M�c Kinh Phong",1903,3598},
	{"Vong h�n D��ng Di�n Li�t","Vong h�n D��ng Di�n Li�t",1654,3325},
	{"L� Tu�n S�n","L� Tu�n S�n",1661,3519},
	{"��i v��ng S�i Phong","��i v��ng S�i Phong",1646,3487},
	{"Nh� v��ng V� N��ng","Nh� v��ng V� N��ng",1666,3488},
	{{200},{"M�n ph�i �m ti�u",2,1,3852}}
};

tPositionNpcS = {
	{"C��ng ��o La La","C��ng ��o La La"},
	{{1844,3621},{1841,3633},{1834,3628},{1835,3619},{1839,3612},{1842,3614},{1716,3627},{1712,3635},{1704,3631},{1704,3619},{1709,3612},
	 {1714,3613},{1729,3446},{1726,3436},{1717,3442},{1718,3452},{1718,3452},{1729,3456},{1854,3430},{1850,3442},{1844,3439},{1843,3426},
	 {1848,3418},{1853,3421}},	
};

tPositionNpcBOSS = { -- �𳬹��ĸ�
	{{"Cu�ng t��ng Minh Nh�t","Cu�ng t��ng Minh Nh�t",1776,3528},{3,25,250},{150,TASKID_TMZ_BOSS}},
	{{"Ng�y t��ng �m Nguy�t","Ng�y t��ng �m Nguy�t",1776,3528},{0,10,0},{50,TASKID_TMZ_BOSS}},
};

--����Ч��
tPositionBox = {--ģ���� npc�� ״̬���� Ч������ ħ�������ַ��� ��ֵ ����ʱ��
	{"Gi� v� kh�","Gi� v� kh�",1787,3508,"D�ng M�nh","t�ng l�c c�ng k�ch 100%, duy tr� 30 gi�y","state_p_attack_percent_add",100,30,"state_m_attack_percent_add",100,30},
	{"Gi� v� kh�","Gi� v� kh�",1754,3543,"D�ng M�nh","t�ng l�c c�ng k�ch 100%, duy tr� 30 gi�y","state_p_attack_percent_add",100,30,"state_m_attack_percent_add",100,30},
	{"Gi� khi�n","Gi� khi�n",1775,3411,"Hung h�n","T�ng l�c ph�ng ng� 100%, duy tr� 30 gi�y","state_receive_half_damage",100,30},
	{"L� th�o d��c","L� th�o d��c",1775,3666,"Tr� th��ng","M�i gi�y h�i ph�c 10% sinh m�nh, duy tr� 30 gi�y","state_life_per_per8f",500,30},
	{"Gi�y gi�","Gi�y gi�",1851,3527,"Ng�y b�","�n th�n, duy tr� 30 gi�y","state_illusion_latent",0,30},
	{"Gi�y gi�","Gi�y gi�",1686,3528,"Ng�y b�","�n th�n, duy tr� 30 gi�y","state_illusion_latent",0,30},
};

tPositionNpcEye = {--ģ������npc���������
	[0] = {
		{"C�n c� 1","Sinh M�n (ch�a chi�m l�nh)",1840,3622},
		{"C�n c� 2","T� M�n (ch�a chi�m l�nh)",1710,3626},
		{"C�n c� 3","C�nh M�n (ch�a chi�m l�nh)",1724,3447},
		{"C�n c� 4","Di�t M�n (ch�a chi�m l�nh)",1849,3431},		
	},
	[1] = {
		{"Sinh m�n t�m","Sinh M�n ("..CampOne_Name..")",1840,3622},
		{"T� m�n t�m","T� M�n ("..CampOne_Name..")",1710,3626},
		{"C�nh m�n t�m","C�nh M�n ("..CampOne_Name..")",1724,3447},
		{"Di�t m�n t�m","Di�t M�n ("..CampOne_Name..")",1849,3431},				
	},
	[2] = {
		{"Sinh m�n lam","Sinh M�n ("..CameTwo_Name..")",1840,3622},
		{"T� m�n lam","T� M�n ("..CameTwo_Name..")",1710,3626},
		{"C�nh m�n lam","C�nh M�n ("..CameTwo_Name..")",1724,3447},
		{"Di�t m�n lam","Di�t M�n ("..CameTwo_Name..")",1849,3431},				
	},	
};

tPositionNpcFlag = {--ģ������npc��������� 
	[1] = {
		{"Tr�n k� t�m","��i tr�n k� ("..CampOne_Name..")",1820,3347},
		{"B�i k� t�m","Tr�n K� h� t�n ("..CampOne_Name..")",1820,3347},		
	},
	[2] = {
		{"Tr�n k� lam","��i tr�n k� ("..CameTwo_Name..")",1737,3726},
		{"B�i k� lam","Tr�n K� h� t�n ("..CameTwo_Name..")",1737,3726},		
	},
};

--�˸����λ��
tPositionFo = {
	{"Nga Mi ti�u s� t� 1","Nga Mi ti�u s� t� ",1907,3367,1645,3666},
	{"Nga Mi ti�u s� t� 2","Nga Mi ti�u s� t� ",1913,3367,1652,3665},
	{"Nga Mi ti�u s� t� 3","Nga Mi ti�u s� t� ",1908,3390,1652,3689},
	{"Nga Mi ti�u s� t� 4","Nga Mi ti�u s� t� ",1914,3389,1642,3687}
}

tPositionCamp = { --��Ӫ����� ǰӪս���� �ֿ����Ա �뿪npc ����npc
	{{1912,3377},{{1855,3435},{1831,3335}},{1901,3356},{1891,3349},{1891,3361}},
	{{1643,3675},{{1703,3618},{1725,3737}},{1664,3715},{1657,3709},{1660,3689}},
};

--������ʾ
--TMZ_ShowData = TMZ_ShowData or {
--	CurN = 0,
--	name = "������",
--	title = {"����","��Ӫ","����","ɱ����","������","����"},
--	szFormat = "%-17s%-9s%-9s%-7s%-7s%-6s",
--};
--TMZ_LoadData();

--���鷭������Ʒ
tAwardItem = 
{
	[0] = {},
	[1] = {"Qu�n C�ng Ch��ng",2,1,9999,1},
	[2] = {"Qu�n C�ng ��i",2,1,9998,1},
	[3] = {"Qu�n C�ng Huy Ho�ng",2,1,9977,1},
	[4] = {"qu�n c�ng ch��ng vinh d� ",2,1,30642,1},
};
tMocRuong = 
{
	[0] = {"Kh�ng", 1},
	[1] = {"Qu�n C�ng Ch��ng", 3},
	[2] = {"Qu�n C�ng ��i", 6},
	[3] = {"Qu�n C�ng Huy Ho�ng", 10},
	[4] = {"VIP", 0},	
};


g_tWinExtraAward =--ʤ��ר������
{
	{ {"Thi�t Tinh c�p 1", {2,1,30533,1}, nil,nil, {1, 100}}, 2400},
	{ {"Thi�t Tinh c�p 2", {2,1,30534,1}, nil,nil, {1, 100}}, 500},
	{ {"Thi�t Tinh c�p 3", {2,1,30535,1}, nil,nil, {1, 100}}, 100},
	{ {"Ma �ao Th�ch c�p 1", {2,1,30428,1}, nil,nil, {1, 100}}, 600},
	{ {"Ma ��o Th�ch c�p 2", {2,1,30429,1}, nil,nil, {1, 100}}, 300},
	{ {"Ma �ao Th�ch c�p 3", {2,1,30430,1}, nil,nil, {1, 100}}, 100},
    {{MA_GiveMoney, {10000}}, 3000},
    {{MA_GiveMoney, {40000}}, 2000},
    {{MA_GiveMoney, {100000}}, 900},
    {{MA_GiveMoney, {1000000}}, 100},
};

--Qu�n C�ng
tbQuanCong_HP = {
	[0] = {400, 200},
	[1] = {800, 400},
	[2] = {2000, 900},
	[3] = {4000, 1800},
	[4] = {4800, 2400},
}

--�ظ�����
g_tWinExtraAward2 = {
	[0] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,400,1},--����
			{1,"Hu�n ch��ng anh h�ng",{2,1,30499,2},0,1},
			--{1,"��ʿ����",{2,1,30498,1},0,1},
		},
	},
	[1] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,800,1},--����
			{1,"Hu�n ch��ng anh h�ng",{2,1,30499,3},0,1},
			--{1,"��ʿ����",{2,1,30498,1},0,1},
		},
	},
	[2] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,2000,1},--����
			{1,"Hu�n ch��ng anh h�ng",{2,1,30499,4},0,1},
			--{1,"��ʿ����",{2,1,30498,1},0,1},
		},
	},
	[3] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,4000,1},--����
			{1,"Hu�n ch��ng anh h�ng",{2,1,30499,5},0,1},
			--{1,"��ʿ����",{2,1,30498,1},0,1},
		},
	},
	[4] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,4800,1},--����
			{1,"Hu�n ch��ng anh h�ng",{2,1,30499,6},0,1},
			--{1,"��ʿ����",{2,1,30498,1},0,1},
		},
	},
};
g_tLoseExtraAward2 = {
	[0] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,200,1},--����
			--{1,"��ʿ����",{2,1,30498,1},0,1},
		},
	},
	[1] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,400,1},--����
			--{1,"��ʿ����",{2,1,30498,2},0,1},
			{1,"Hu�n ch��ng anh h�ng",{2,1,30499,1},0,1},
		},
	},
	[2] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,900,1},--����
			--{1,"��ʿ����",{2,1,30498,3},0,1},
			{1,"Hu�n ch��ng anh h�ng",{2,1,30499,2},0,1},
		},
	},
	[3] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,1800,1},--����
			--{1,"��ʿ����",{2,1,30498,4},0,1},
			{1,"Hu�n ch��ng anh h�ng",{2,1,30499,3},0,1},
		},
	},
	[4] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,2400,1},--����
			--{1,"��ʿ����",{2,1,30498,5},0,1},
			{1,"Hu�n ch��ng anh h�ng",{2,1,30499,4},0,1},
		},
	},
};

tbNormalAward = 
{
	[0] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,4000000,1},
			--{1,"�Ǻ���Ƭ",{2,1,30299,2},0,1},
			--{1,"Ӣ��ѫ��",{2,1,30499,0},0,1},
		},
	},
	[1] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,6000000,1},
			--{1,"��������",{2,1,30321,1},0,1},
			--{1,"Ӣ��ѫ��",{2,1,30499,1},0,1},
		},
	},
	[2] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,9000000,1},
			--{1,"��������",{2,1,30321,2},0,1},
			--{1,"Ӣ��ѫ��",{2,1,30499,2},0,1},
		},
	},
	[3] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,12000000,1},
			--{1,"��������",{2,1,30321,4},0,1},
			--{1,"Ӣ��ѫ��",{2,1,30499,3},0,1},
		},
	},
	[4] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,18000000,1},
			--{1,"��������",{2,1,30321,4},0,1},
			--{1,"Ӣ��ѫ��",{2,1,30499,3},0,1},
		},
	},
}
 tbAcvtiveDesc = 
{
	{"<color=green>C�p th�p<color>", "<color=green>T�m th��ng<color>",},
	{"<color=green>C�p h� trung<color>", "<color=green>B�nh th��ng<color>",},
	{"<color=yellow>C�p trung<color>", "<color=yellow>T��ng ��i t�t<color>",},
	{"<color=yellow>C�p th��ng trung<color>", "<color=yellow>D�ng m�nh<color>",},
	{"<color=red>C�p cao<color>", "<color=red>L�y 1 ch�i 10<color>",},
	{"<color=red>C�p si�u cao<color>", "<color=red>L�p l�nh s�ng ng�i<color>",},
}

tbAcvtiveWinAward = 
{
	[1] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
		},
	},
	[2] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,6000000,1},
			--{28,180,1},--����
			--{1,"�Ǻ���Ƭ",{2,1,30299,3},0,1},
		},
	},
	[3] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,9000000,1},
			--{28,240,1},--����
			--{1,"�Ǻ���Ƭ",{2,1,30299,6},0,1},
		},
	},
	[4] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,12000000,1},
			--{28,300,1},--����
			--{1,"�Ǻ���Ƭ",{2,1,30299,12},0,1},
			--{1,"��������",{2,1,30321,1},0,1},
		},
	},
	[5] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,14400000,1},
			--{28,360,1},--����
			--{1,"�Ǻ���Ƭ",{2,1,30299,18},0,1},
			--{1,"��������",{2,1,30321,2},0,1},
		},
	},
	[6] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,18000000,1},
			--{28,420,1},--����
			--{1,"�Ǻ���Ƭ",{2,1,30299,24},0,1},
			--{1,"��������",{2,1,30321,4},0,1},
		},
	},
}

tbAcvtiveLossAward = 
{
	[1] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
		},
	},
	[2] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,2000000,1},
			--{28,60,1},--����
			--{1,"�Ǻ���Ƭ",{2,1,30299,1},0,1},
		},
	},
	[3] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,3000000,1},
			--{28,80,1},--����
			--{1,"�Ǻ���Ƭ",{2,1,30299,2},0,1},
		},
	},
	[4] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,4000000,1},
			--{28,100,1},--����
			--{1,"�Ǻ���Ƭ",{2,1,30299,4},0,1},
		},
	},
	[5] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,4800000,1},
			--{28,120,1},--����
			--{1,"�Ǻ���Ƭ",{2,1,30299,6},0,1},
		},
	},
	[6] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,6000000,1},
			--{28,140,1},--����
			--{1,"�Ǻ���Ƭ",{2,1,30299,8},0,1},
			--{1,"��������",{2,1,30321,1},0,1},
		},
	},
}

tAwardCloth = {
	--1Ϊ��1�� 2Ϊ��2�� 3Ϊ��3�� 4Ϊ��4��
	--�ȷֲ�λ�ٷ���װ����1�������ף���������
	--���� id �һ�����Ҫ���� ���һ���Ƕһ�����װ������Ҫ�Ļ���
	[1] = {
		{{{"C�u D��ng Qu�n",0,103,3032,0,3200},{"C�u D��ng Qu�n",0,103,3038,0,3200},{"C�u D��ng Qu�n",0,103,3044,0,3200},{"C�u D��ng Qu�n",0,103,3050,0,3200}},{{"C�u D��ng Qu�n",0,103,3035,0,3200},{"C�u D��ng Qu�n",0,103,3041,0,3200},{"C�u D��ng Qu�n",0,103,3047,0,3200},{"C�u D��ng Qu�n",0,103,3053,0,3200}}},
		{{{"C�u D��ng Y",0,100,3032,0,3200},{"C�u D��ng Y",0,100,3038,0,3200},{"C�u D��ng Y",0,100,3044,0,3200},{"C�u D��ng Y",0,100,3050,0,3200}},{{"C�u D��ng Y",0,100,3035,0,3200},{"C�u D��ng Y",0,100,3041,0,3200},{"C�u D��ng Y",0,100,3047,0,3200},{"C�u D��ng Y",0,100,3053,0,3200}}},
		{{{"C�u D��ng trang",0,101,3032,0,3200},{"C�u D��ng trang",0,101,3038,0,3200},{"C�u D��ng trang",0,101,3044,0,3200},{"C�u D��ng trang",0,101,3050,0,3200}},{{"C�u D��ng trang",0,101,3035,0,3200},{"C�u D��ng trang",0,101,3041,0,3200},{"C�u D��ng trang",0,101,3047,0,3200},{"C�u D��ng trang",0,101,3053,0,3200}}},
	},
	[2] = {
		{{{"Tinh Kh�c-C�u D��ng Nh�t Qu�n",0,103,3033,1600,1600},{"Tinh Kh�c-C�u D��ng Nh�t Qu�n",0,103,3039,1600,1600},{"Tinh Kh�c-C�u D��ng Nh�t Qu�n",0,103,3045,1600,1600},{"Tinh Kh�c-C�u D��ng Nh�t Qu�n",0,103,3051,1600,1600}},{{"Tinh Kh�c-C�u �m Nguy�t Qu�n",0,103,3036,1600,1600},{"Tinh Kh�c-C�u �m Nguy�t Qu�n",0,103,3042,1600,1600},{"Tinh Kh�c-C�u �m Nguy�t Qu�n",0,103,3048,1600,1600},{"Tinh Kh�c-C�u �m Nguy�t Qu�n",0,103,3054,1600,1600}}},
		{{{"Tinh Kh�c-C�u D��ng H�a Y",0,100,3033,1600,1600},{"Tinh Kh�c-C�u D��ng H�a Y",0,100,3039,1600,1600},{"Tinh Kh�c-C�u D��ng H�a Y",0,100,3045,1600,1600},{"Tinh Kh�c-C�u D��ng H�a Y",0,100,3051,1600,1600}},{{"Tinh Kh�c-C�u �m Th�y Y",0,100,3036,1600,1600},{"Tinh Kh�c-C�u �m Th�y Y",0,100,3042,1600,1600},{"Tinh Kh�c-C�u �m Th�y Y",0,100,3048,1600,1600},{"Tinh Kh�c-C�u �m Th�y Y",0,100,3054,1600,1600}}},
		{{{"Tinh Kh�c-C�u D��ng Long Trang",0,101,3033,1600,1600},{"Tinh Kh�c-C�u D��ng Long Trang",0,101,3039,1600,1600},{"Tinh Kh�c-C�u D��ng Long Trang",0,101,3045,1600,1600},{"Tinh Kh�c-C�u D��ng Long Trang",0,101,3051,1600,1600}},{{"Tinh Kh�c-C�u �m Ph�ng Trang",0,101,3036,1600,1600},{"Tinh Kh�c-C�u �m Ph�ng Trang",0,101,3042,1600,1600},{"Tinh Kh�c-C�u �m Ph�ng Trang",0,101,3048,1600,1600},{"Tinh Kh�c-C�u �m Ph�ng Trang",0,101,3054,1600,1600}}},
	},
	[3] = {
		{{{"Thi�n Ngh�a-C�u D��ng Nh�t Qu�n",0,103,3034,1600,0},{"Thi�n Ngh�a-C�u D��ng Nh�t Qu�n",0,103,3040,1600,0},{"Thi�n Ngh�a-C�u D��ng Nh�t Qu�n",0,103,3046,1600,0},{"Thi�n Ngh�a-C�u D��ng Nh�t Qu�n",0,103,3052,1600,0},},{{"Thi�n Ngh�a-C�u �m Nguy�t Qu�n",0,103,3037,1600,0},{"Thi�n Ngh�a-C�u �m Nguy�t Qu�n",0,103,3043,1600,0},{"Thi�n Ngh�a-C�u �m Nguy�t Qu�n",0,103,3049,1600,0},{"Thi�n Ngh�a-C�u �m Nguy�t Qu�n",0,103,3055,1600,0}}},
		{{{"Thi�n Ngh�a-C�u D��ng H�a Y",0,100,3034,1600,0},{"Thi�n Ngh�a-C�u D��ng H�a Y",0,100,3040,1600,0},{"Thi�n Ngh�a-C�u D��ng H�a Y",0,100,3046,1600,0},{"Thi�n Ngh�a-C�u D��ng H�a Y",0,100,3052,1600,0}},{{"Thi�n Ngh�a-C�u �m Th�y Y",0,100,3037,1600,0},{"Thi�n Ngh�a-C�u �m Th�y Y",0,100,3043,1600,0},{"Thi�n Ngh�a-C�u �m Th�y Y",0,100,3049,1600,0},{"Thi�n Ngh�a-C�u �m Th�y Y",0,100,3055,1600,0}}},
		{{{"Thi�n Ngh�a-C�u D��ng Long Trang",0,101,3034,1600,0},{"Thi�n Ngh�a-C�u D��ng Long Trang",0,101,3040,1600,0},{"Thi�n Ngh�a-C�u D��ng Long Trang",0,101,3046,1600,0},{"Thi�n Ngh�a-C�u D��ng Long Trang",0,101,3052,1600,0}},{{"Thi�n Ngh�a-C�u �m Ph�ng Trang",0,101,3037,1600,0},{"Thi�n Ngh�a-C�u �m Ph�ng Trang",0,101,3043,1600,0},{"Thi�n Ngh�a-C�u �m Ph�ng Trang",0,101,3049,1600,0},{"Thi�n Ngh�a-C�u �m Ph�ng Trang",0,101,3055,1600,0}}},
	},
	[4] = {
		{{{"Long ��ng T� H�i Qu�n",0,103,3056,0},{"Long ��ng T� H�i Qu�n",0,103,3057,0},{"Long ��ng T� H�i Qu�n",0,103,3058,0},{"Long ��ng T� H�i Qu�n",0,103,3059,0}},{{"Ph�ng V� C�u Thi�n Qu�n",0,103,3060,0},{"Ph�ng V� C�u Thi�n Qu�n",0,103,3061,0},{"Ph�ng V� C�u Thi�n Qu�n",0,103,3062,0},{"Ph�ng V� C�u Thi�n Qu�n",0,103,3063,0}}},
		{{{"Long ��ng T� H�i Y",0,100,3056,0},{"Long ��ng T� H�i Y",0,100,3057,0},{"Long ��ng T� H�i Y",0,100,3058,0},{"Long ��ng T� H�i Y",0,100,3059,0}},{{"Ph�ng V� C�u Thi�n Y",0,100,3060,0},{"Ph�ng V� C�u Thi�n Y",0,100,3061,0},{"Ph�ng V� C�u Thi�n Y",0,100,3062,0},{"Ph�ng V� C�u Thi�n Y",0,100,3063,0}}},
		{{{"Long ��ng T� H�i Trang",0,101,3056,0},{"Long ��ng T� H�i Trang",0,101,3057,0},{"Long ��ng T� H�i Trang",0,101,3058,0},{"Long ��ng T� H�i Trang",0,101,3059,0}},{{"Ph�ng V� C�u Thi�n Trang",0,101,3060,0},{"Ph�ng V� C�u Thi�n Trang",0,101,3061,0},{"Ph�ng V� C�u Thi�n Trang",0,101,3062,0},{"Ph�ng V� C�u Thi�n Trang",0,101,3063,0}}},
	},
};

tAwardWeapon = {
	[2] = {{"L�u Ly Gi�i �ao",0,3,8890,800,5200},{"Tinh Kh�c-L�u Ly Gi�i �ao",0,3,8892,2600,2600},{"Thi�n Ngh�a-L�u Ly Gi�i �ao",0,3,8894,2600,0},{"C�u Ch�u-L�u Ly Gi�i �ao",0,3,8932,0,670,1}},
	[3] = {{"Kinh L�i Thi�n Tr��ng",0,8,8908,800,5200},{"Tinh Kh�c-Kinh L�i Thi�n Tr��ng",0,8,8909,2600,2600},{"Thi�n Ngh�a-Kinh L�i Thi�n Tr��ng",0,8,8910,2600,0},{"C�u Ch�u-Kinh L�i Thi�n Tr��ng",0,8,8934,0,672,1}},
	[4] = {{"L�i �m Nang Th�",0,0,8872,800,5200},{"Tinh Kh�c-L�i �m Nang Th�",0,0,8874,2600,2600},{"Thi�n Ngh�a-L�i �m Nang Th�",0,0,8876,2600,0},{"C�u Ch�u-L�i �m Nang Th�",0,0,8933,0,672,1}},
	[6] = {{"�m D��ng Xuy�n �nh",0,1,8878,800,5200},{"Tinh Kh�c-�m D��ng Xuy�n �nh",0,1,8879,2600,2600},{"Thi�n Ngh�a-�m D��ng Xuy�n �nh",0,1,8880,2600,0},{"C�u Ch�u-�m D��ng Xuy�n �nh",0,1,8935,0,671,1}},
	[8] = {{"T� H�n �m Ki�m",0,2,8881,800,5200},{"Tinh Kh�c-T� H�n �m Ki�m",0,2,8884,2600,2600},{"Thi�n Ngh�a-T� H�n �m Ki�m",0,2,8887,2600,0},{"C�u Ch�u-T� H�n �m Ki�m",0,2,8936,0,672,1}},
	[9] = {{"C�u Ho�n B�i C�m",0,10,8917,800,5200},{"Tinh Kh�c-C�u Ho�n B�i C�m",0,10,8918,2600,2600},{"Thi�n Ngh�a-C�u Ho�n B�i C�m",0,10,8919,2600,0},{"C�u Ch�u-C�u Ho�n B�i C�m",0,10,8937,0,672,1}},
	[11] = {{"Quy L�n H� Th�",0,0,8873,800,5200},{"Tinh Kh�c-Quy L�n H� Th�",0,0,8875,2600,2600},{"Thi�n Ngh�a-Quy L�n H� Th�",0,0,8877,2600,0},{"C�u Ch�u-Quy L�n H� Th�",0,0,8938,0,670,1}},
	[12] = {{"Tr�n Ng�o C�n",0,5,8899,800,5200},{"Tinh Kh�c-Tr�n Ng�o C�n",0,5,8900,2600,2600},{"Thi�n Ngh�a-Tr�n Ng�o C�n",0,5,8901,2600,0},{"C�u Ch�u-Tr�n Ng�o C�n",0,5,8939,0,671,1}},
	[14] = {{"Thu�n Phong Ki�m",0,2,8882,800,5200},{"Tinh Kh�c-Thu�n Phong Ki�m",0,2,8885,2600,2600},{"Thi�n Ngh�a-Thu�n Phong Ki�m",0,2,8888,2600,0},{"C�u Ch�u-Thu�n Phong Ki�m",0,2,8940,0,672,1}},
	[15] = {{"Tinh ��u Chuy�n B�t",0,9,8911,800,5200},{"Tinh Kh�c-Tinh ��u Chuy�n B�t",0,9,8913,2600,2600},{"Thi�n Ngh�a-Tinh ��u Chuy�n B�t",0,9,8915,2600,0},{"C�u Ch�u-Tinh ��u Chuy�n B�t",0,9,8941,0,673,1}},
	[17] = {{"Ph� Qu�n Tr�n Th��ng",0,6,8902,800,5200},{"Tinh Kh�c-Ph� Qu�n Tr�n Th��ng",0,6,8903,2600,2600},{"Thi�n Ngh�a-Ph� Qu�n Tr�n Th��ng",0,6,8904,2600,0},{"C�u Ch�u-Ph� Qu�n Tr�n Th��ng",0,6,8942,0,670,1}},
	[18] = {{"Truy M�nh Cung",0,4,8896,800,5200},{"Tinh Kh�c-Truy M�nh Cung",0,4,8897,2600,2600},{"Thi�n Ngh�a-Truy M�nh Cung",0,4,8898,2600,0},{"C�u Ch�u-Truy M�nh Cung",0,4,8943,0,671,1}},
	[20] = {{"Thi�p C�t Huy�t �ao",0,7,8905,800,5200},{"Tinh Kh�c-Thi�p C�t Huy�t �ao",0,7,8906,2600,2600},{"Thi�n Ngh�a-Thi�p C�t Huy�t �ao",0,7,8907,2600,0},{"C�u Ch�u-Thi�p C�t Huy�t �ao",0,7,8944,0,671,1}},
	[21] = {{"Luy�n H�n Huy�t Tr�o",0,11,8920,800,5200},{"Tinh Kh�c-Luy�n H�n Huy�t Tr�o",0,11,8922,2600,2600},{"Thi�n Ngh�a-Luy�n H�n Huy�t Tr�o",0,11,8924,2600,0},{"C�u Ch�u-Luy�n H�n Huy�t Tr�o",0,11,8945,0,673,1}},
	[23] = {{"Ng� Thi�n Phong Ki�m",0,2,8883,800,5200},{"Tinh Kh�c-Ng� Thi�n Phong Ki�m",0,2,8886,2600,2600},{"Thi�n Ngh�a-Ng� Thi�n Phong Ki�m",0,2,8889,2600,0},{"C�u Ch�u-Ng� Thi�n Phong Ki�m",0,2,8946,0,672,1}},
	[25] = {{"Th�n Di�m Thi�n �ao",0,3,8891,800,5200},{"Tinh Kh�c-Th�n Di�m Thi�n �ao",0,3,8893,2600,2600},{"Thi�n Ngh�a-Th�n Di�m Thi�n �ao",0,3,8895,2600,0},{"C�u Ch�u-Th�n Di�m Thi�n �ao",0,3,8947,0,670,1,1}},
	[26] = {{"Th�n Phong Ph�n B�t",0,9,8912,800,5200},{"Tinh Kh�c-Th�n Phong Ph�n B�t",0,9,8914,2600,2600},{"Thi�n Ngh�a-Th�n Phong Ph�n B�t",0,9,8916,2600,0},{"C�u Ch�u-Th�n Phong Ph�n B�t",0,9,8948,0,673,1}},
	[27] = {{"Th�n Linh Ch� Tr�o",0,11,8921,800,5200},{"Tinh Kh�c-Th�n Linh Ch� Tr�o",0,11,8923,2600,2600},{"Thi�n Ngh�a-Th�n Linh Ch� Tr�o",0,11,8925,2600,0},{"C�u Ch�u-Th�n Linh Ch� Tr�o",0,11,8949,0,671,1}},
	[29] = {{"Linh Lung Chi",0,13,8929,800,5200},{"Tinh Kh�c-Linh Lung Chi",0,13,8930,2600,2600},{"Thi�n Ngh�a-Linh Lung Chi",0,13,8931,2600,0},{"C�u Ch�u-Linh Lung Chi",0,13,8950,0,671,1}},
	[30] = {{"C�u Ti�u S�o",0,12,8926,800,5200},{"Tinh Kh�c-C�u Ti�u S�o",0,12,8927,2600,2600},{"Thi�n Ngh�a-C�u Ti�u S�o",0,12,8928,2600,0},{"C�u Ch�u-C�u Ti�u S�o",0,12,8951,0,673,1}},
};

tTongScoreLv = {
	{150,1,8},
	{190,2,12},
	{99999,3,16},
};

--- Add Qu�n C�ng -
tbQuanCongTMT =
{
	{300,100},
	{600,200},
	{1500,500},
	{3000,1000},
	{3600, 1200},
}
