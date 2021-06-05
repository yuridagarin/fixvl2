Include("\\script\\newbattles\\battleactivity_head.lua");
Include("\\script\\newbattles\\battlepoint_head.lua");
Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")

DEBUG_VERSION = 0;	--���԰汾��
IB_VERSION = 1;		--IB�汾��

BATTLE_JUNGONG_EXT_RATE = min(VNG_CFG_NB_JUNGONG_EXT_ADD_RATE or 0, 4)
BATTLE_EXP_EXT_RATE =  min(VNG_CFG_NB_EXP_EXT_ADD_RATE or 0, 6)
--========================================================================================
ALL_ID = 0
SONG_ID = 1						--�η���Ӫ��mission�е�ID
LIAO_ID = 2						--�ɷ���Ӫ��mission�е�ID
SONGLIAO_ID = SONG_ID+LIAO_ID;	--�η�ID���ɷ�ID�������Ҫ������������ж���Ӫ�ģ��ж���Ӫ��SONGLIAO_ID����ǰ��ӪID
--============ս��ϵͳ�ű�ȫ�ֱ���=========================================================
DRIVE_PLAYER_OUTOF_SHELTER = 0;	--�Ƿ��ǿ�ƴ��ͺ�Ӫͣ�����õ���ҵĹ���
CURE_ALL_PLAYER = 0;			--�Ƿ��������к�ƽ״̬�����
ALLOW_SIGNUP = 0;				--�Ƿ����������ս����ʼ���Կɱ��������б������������£�
FORBIDENT_CREATE_TEAM = 1;		--�Ƿ��ֹս����ͬ��Ӫ��ӣ���Ա�ɹ�����֡���Ϊ��ֹ����Ϊ����
RANDOM_CAMP_PLACE = 0;			--�Ƿ�������Ӫ���ܡ���Ϊ�򿪣���Ϊ�رա������Ӫָ��������˫�����Եĺ�Ӫ��ս��������ǲ��̶��ġ�
STATISTIC_OPEN = 1;				--�Ƿ��ս��ͳ�ƹ���
SERIES_KILL_OPEN = 1;			--�Ƿ����ն���ּӳɹ���
--============������ȫ�ֱ���=========================================================
GLB_FORBIDBATTLE = 31			--����ֵ1ʱ��ʾֹͣս�۵�����
GLB_NEW_BATTLESTATE = 32		--��ս����״̬����λΪ1��ʾ��ս�������У�2Ϊ��ս����ս�У�3Ϊ��ս�������У�4Ϊ��ս����ս��
GLB_VILLAGE =33;				--��¼����ս�Ľ����0Ϊƽ�֣�1Ϊ��Ӯ��2Ϊ��Ӯ����ͬ
GLB_RESOURCE = 34;				--��¼��Դս�Ľ��
GLB_EMPLACEMENT = 35;			--��¼��̨ս�Ľ��
GLB_MAINBATTLE = 36;			--��¼��ս���Ľ��
GLB_SIGN_UP_VILL_SONG = 37;		--��¼����ս��˫����������
GLB_SIGN_UP_VILL_LIAO = 38;
GLB_SIGN_UP_RESO_SONG = 39;
GLB_SIGN_UP_RESO_LIAO = 40;
GLB_SIGN_UP_EMPL_SONG = 41;
GLB_SIGN_UP_EMPL_LIAO = 42;
GLB_SIGN_UP_MAIN_SONG = 43;
GLB_SIGN_UP_MAIN_LIAO = 44;
GLB_RANDOM_PLACE_VILL = 45;		--�������˫���������Ӫ������ʾĬ�ϣ��������ң�������ʾ�෴λ��
GLB_RANDOM_PLACE_RESO = 46;
GLB_RANDOM_PLACE_EMPL = 47;
GLB_RANDOM_PLACE_MAIN = 48;
--============һЩս��ȫ������=======================================================
VILLAGE_MAP_ID = 881;			--��ͼID
RESOURCE_MAP_ID = 882;
EMPLACEMENT_MAP_ID = 883;
MAIN_MAP_ID = 884;
--===================================================================================
SUB_BATTLE_MAX_PLAYER = 50		--��ս��������������
MAIN_BATTLE_MAX_PLAYER = 200	--��ս��������������
SUB_BATTLE_PLAYER_DIFF = 5		--��ս�����������
MAIN_BATTLE_PLAYER_DIFF = 5	--��ս�����������
SUB_BATTLE_SIGNUP_MAX_PLAYER = 70	--��ս������������������
MAIN_BATTLE_SIGNUP_MAX_PLAYER = 200	--��ս������������������
SUB_BATTLE_SIGNUP_PLAYER_DIFF = 5	--��ս���������������
MAIN_BATTLE_SIGNUP_PLAYER_DIFF = 5	--��ս���������������

TEAM_MEMBER_DISTANCE = 50;		--��Ա֮���û��ֵ�������
TEAM_POINT_ATTENUATION = 0.6;	--������ֵ�˥����������

DEAD_BODY_TIME = 5;				--ʬ�����ʱ��

MAX_CHANGE_CAMP = 3;			--������ת����Ӫ����

ACTIVITY_ADJUSTOR = 20;			--ս����Ծϵͳ���������������ʲô��������Ĭ�ϻ�Ծϵ����

FRAME_PER_SECOND = 18;			--��Ϸ�����ٶȣ�ÿ�룱��֡
FRAME_PER_MIN = 60*FRAME_PER_SECOND;--ÿ������Ϸ֡��

EMPEROR_AWARD_EXP = 100000;		--�ʵۼν�����
EMPEROR_AWARD_POINT = 10;		--�ʵۼν�����
BATTLE_STAR_AWARD_EXP = 200000;	--ս��֮�ǽ�������
BATTLE_STAR_AWARD_POINT = 20;	--ս��֮�ǽ�������
INVINCIBILITY_TIME = 5;			--������Ӫ���޵�ʱ�䣬��λ��
--============ս��Mission ID=========================================================
VILLAGE_MISSION_ID = 25			--��������ս������ս����Mission ID��
RESOURCE_MISSION_ID = 26		--�ݹ�����ս
EMPLACEMENT_MISSION_ID = 27		--��̨����ս
MAINBATTLE_MISSION_ID = 28		--��ս��
--============ս��ID=================================================================
VILLAGE_ID = 1					--��������ս������ս����ID�����Ա�ʶ������ĸ�ս�����棩
RESOURCE_ID = 2					--�ݹ�����ս
EMPLACEMENT_ID = 3				--��̨����ս
MAINBATTLE_ID = 4				--��ս��
--==================���а�ID=========================================================
RANK_RESOURCE = 0; 				--����սӢ�۰�=0
RANK_VILLAGE = 1;				--����սӢ�۰�=1
RANK_EMPLACEMENT = 2;			--��̨սӢ�۰�=2
RANK_MAIN = 3;					--���Ź�Ӣ�۰�=3
RANK_BATTLE_POINT = 4;			--��������=4
RANK_BATTLE_CONTRIBUTION = 5;	--��������=5
RANK_SINGLE_FIGHT = 6;			--����Ӣ�۰�=6
RANK_BATTLE_STAR = 7;			--ս��֮��=7
--===============һЩtable============================================================
tBTMSInfo = 					--ս��ID��Mission ID�͵�ͼID�Ķ�Ӧ��ϵ
{
	[VILLAGE_ID] = {VILLAGE_MISSION_ID,VILLAGE_MAP_ID},
	[RESOURCE_ID] = {RESOURCE_MISSION_ID,RESOURCE_MAP_ID},
	[EMPLACEMENT_ID] = {EMPLACEMENT_MISSION_ID,EMPLACEMENT_MAP_ID},
	[MAINBATTLE_ID] = {MAINBATTLE_MISSION_ID,MAIN_MAP_ID},
}
tCampNameP = 					--��Ӫ���֣�ƴ������������Ӫ��ʱ���õ�
{
	[ALL_ID] = "noaligned",
	[SONG_ID] = "dasong",
	[LIAO_ID] = "daliao",
}

tCampNameZ =					--��Ӫ���֣����ģ�����ʾ�Ի���ʱ���õ�
{
	[ALL_ID] = "",
	[SONG_ID] = "T�ng",
	[LIAO_ID] = "Li�u",
}

tSexName = {"Thi�u hi�p","N� hi�p "};
tRankName = {"Binh s�","Hi�u �y","�� th�ng","Ti�n phong","��i T��ng","Nguy�n So�i"};
tCampNickName = {"Ng��i T�ng","Ng��i Li�u"};

tBattleName =					--ս������
{
	[0]	= "",
	[VILLAGE_ID] = "Gi�i C�u N�ng Trang",				--"Nh�n M�n Quan-chi�n d�ch Th�n trang",
	[RESOURCE_ID] = "Thu Th�p L��ng Th�o", 		--"Nh�n M�n Quan-chi�n d�ch th�o c�c",
	[EMPLACEMENT_ID] = "B�o V� Th�nh Tr�",			--"Nh�n M�n Quan-chi�n d�ch ph�o ��i",
	[MAINBATTLE_ID] = "Nh�n M�n R�c L�a",			--"Nh�n M�n Quan-chi�n d�ch ch�nh",
}

tBattleChannel = 
{								--Ƶ��������ID
	[VILLAGE_ID] = {"Gi�i C�u N�ng Trang",12},
	[RESOURCE_ID] = {"Thu Th�p L��ng Th�o",13},
	[EMPLACEMENT_ID] = {"B�o V� Th�nh Tr�",14},
	[MAINBATTLE_ID] = {"Nh�n M�n R�c L�a",15},
}
tCampChannel = 					--ս����˫�����Ե�����Ƶ��
{
	[1] = {"Gi�i C�u N�ng Trang phe T�ng",16},
	[2] = {"Gi�i C�u N�ng Trang phe Li�u",17},
	[3] = {"Thu Th�p L��ng Th�o phe T�ng",18},
	[4] = {"Thu Th�p L��ng Th�o phe Li�u",19},
	[5] = {"B�o V� Th�nh Tr� phe T�ng",20},
	[6] = {"B�o V� Th�nh Tr� phe Li�u",21},
	[7] = {"Nh�n M�n R�c L�a phe T�ng",22},
	[8] = {"Nh�n M�n R�c L�a phe Li�u",23},
}

tFaction = 						--����
{
	[0] = "V� m�n ph�i",
	[1] = "Thi�u L�m",
	[2] = "V� �ang",
	[3] = "Nga My",
	[4] = "C�i Bang",
	[5] = "���ng M�n",
	[6] = "D��ng M�n",
	[7] = "Ng� ��c",
	[8] = "Th�y Y�n",
	[9] = "C�n L�n",
	[10] = "Minh gi�o",
}

tRoute = 						--·��
{
	[0] = "V� m�n ph�i",
	[1] = "Thi�u L�m",
	[2] = "T�c gia",
	[3] = "Thi�n t�ng",
	[4] = "V� t�ng",
	[5] = "���ng M�n",
	[6] = "���ng M�n",
	[7] = "Nga My",
	[8] = "Nga My ph�t gia",
	[9] = "Nga My t�c gia",
	[10] = "C�i Bang",
	[11] = "C�i Bang T�nh y",
	[12] = "C�i Bang � Y",
	[13] = "V� �ang",
	[14] = "V� �ang ��o gia",
	[15] = "V� �ang t�c gia",
	[16] = "D��ng M�n",
	[17] = "D��ng M�n th��ng K�",
	[18] = "D��ng M�n Cung K�",
	[19] = "Ng� ��c",
	[20] = "Hi�p ��c",
	[21] = "T� ��c",
	[22] = "C�n L�n",
	[23] = "C�n L�n Thi�n S�",
	[24] = "Minh gi�o",
	[25] = "Minh Gi�o Th�nh Chi�n",
	[26] = "Minh Gi�o Tr�n Binh",
	[27] = "Minh Gi�o Huy�t Nh�n",
	[28] = "Th�y Y�n",
	[29] = "Th�y Y�n V� Ti�n",
	[30] = "Th�y Y�n Linh N�",
	[31] = "���ng M�n Nh�m Hi�p",
	[32] = "C�n L�n Ki�m T�n",
}

tBattleItem = {					--ս����Ʒ�б�
--		��Ʒ�������ࡡС�ࣱ��С�ࣲ���˳�ս���Ƿ�ɾ��
	[1]  = {"L��ng th�o-s� c�p",2,0,588,1},
	[2]  = {"L��ng th�o-trung c�p",2,0,589,1},
	[3]  = {"L��ng th�o-cao c�p",2,0,590,1},
	[4]	 = {"Cu�c l��ng th�o",2,0,591,1},
	[5]  = {"H��ng d�n chi�n tr��ng",2,0,595,0},
	[6]  = {"Huy�n thi�t kho�ng th�ch",2,0,594,1},
	[7]  = {"S�n t�c-binh k�",2,0,593,1},
	[8]  = {"S�n t�c-chi�n c�",2,0,592,1},
	[9]  = {"Sinh Sinh H�a T�n",1,0,205,1},
	[10] = {"Ng�c Cao t�n",1,0,204,1},
	[11] = {"V�n V�t Quy Nguy�n ��n",1,0,206,1}
}

tBattleMed = --ս��ר��PKҩ
{--            ��Ʒ�� ���� С��1 С��2 �������     ҩЧ˵��         �������
	[1]  = {"Ch�nh Nguy�n H�i T�m ��n(c.tr��ng)",1,0,207,80,	"ph�c h�i t�t c� nh�ng k� n�ng b� ��ng b�ng",	 0},
	[2]  = {"Ng� Chuy�n Linh B�o ��n (c.tr��ng)",1,0,208,50,	"Xu�t chi�u+5, duy tr� trong 10 gi�y",	 	 0},
	[3]  = {"Th�n Gi�p ��n (chi�n tr��ng)",	 1,0,209,50,	"Ngo�i ph�ng 100%, duy tr� trong 5 gi�y",	 0},
	[4]  = {"Th�n Tr�o ��n (chi�n tr��ng)",	 1,0,210,50,	"N�i ph�ng 100%, duy tr� 5 gi�y",	 0},
	[5]  = {"Th�ng C�n T�n (chi�n tr��ng)",	 1,0,211,50,	"Mi�n d�ch l�m ch�m, duy tr� trong 10 gi�y",	 0},
	[6]  = {"Ho�t Huy�t T�n (chi�n tr��ng)",	 1,0,212,50,	"Mi�n d�ch gi�m t�c, duy tr� trong 10 gi�y",	 0},
	[7]  = {"S��ng L�c T�n (chi�n tr��ng)",	 1,0,213,50,	"Mi�n d�ch t� li�t, duy tr� trong 10 gi�y",	 0},
--	[8]  = {"ս��ר���ζ�ɢ",	 1,0,214,50,	"���߷��У�����10��",	 0},
	[8]  = {"C� Th�ch T�n (chi�n tr��ng)",	 1,0,215,50,	"Mi�n d�ch ��y lui, duy tr� trong 10 gi�y",	 0},
	[9] = {"Kim Cang T�n (chi�n tr��ng)",	 1,0,216,50,	"Mi�n d�ch ��nh ng�, duy tr� trong 10 gi�y",	 0},
	[10] = {"�� Th�n T�n (chi�n tr��ng)",	 1,0,217,50,	"Mi�n d�ch m� man, duy tr� trong 10 gi�y",	 0},
	[11] = {"Ng�ng H�n T�n (chi�n tr��ng)",	 1,0,218,50,	"Mi�n d�ch h�n lo�n, duy tr� trong 10 gi�y",	 0},
	[12] = {"Th�n Phong T�n (chi�n tr��ng)",	 1,0,219,50,	"Mi�n d�ch ��nh th�n, duy tr� trong 10 gi�y",	 0},
	[13] = {"V� �y T�n (chi�n tr��ng)",	 1,0,220,50,	"Mi�n cho�ng, duy tr� trong 10 gi�y",	 0},
--	[15] = {"ս��ר�ö���ɢ",	 1,0,221,50,	"�����Ի󣬳���10��",	 0},
--	[16] = {"ս��ר��������Ԫ��",1,0,222,120,	"�������и��棬����10��",0},
	[14] = {"Th�t X�o Linh ��n (chi�n tr��ng)",	 1,0,223,200,	"Ti�u v� ��ch, duy tr� trong 3 gi�y",		 0},
	[15] = {"V� C�c Ti�n ��n (chi�n tr��ng)",	 1,0,224,500,	"��i v� ��ch, duy tr� trong 6 gi�y",		 0},
	[16] = {"Sinh Sinh H�a T�n",1,0,205,10,	"Nhanh ch�ng ph�c h�i sinh l�c v� n�i l�c",	 0},
	[17] = {"Ng�c Cao t�n",1,0,204,10,	"Nhanh ch�ng ph�c h�i sinh l�c",			 0},
	[18] = {"V�n V�t Quy Nguy�n ��n",1,0,206,8,		"Nhanh ch�ng ph�c h�i n�i l�c",			 0},
	[19] = {"Th�t Khi�u Nguy�n B�o ��n(ctr��ng)",1,0,225,500,	"Xu�t chi�u+10, duy tr� trong 15 gi�y", 	 4},
--	[23] = {"ս��ר��������Ԫ��",1,0,226,500,	"�������и��棬����20��",4},
	[20] = {"Th�ng Thi�n V� C�c ��n (ctr��ng)",1,0,227,1000,	"V� ��ch, duy tr� trong 9 gi�y",		 4},
}

tPKMed = --PKҩ
{--         ��Ʒ�� ���� С��1 С��2 ������� ҩЧ˵��        �������
	[1]  = {"Ch�nh Nguy�n H�i T�m ��n",1,0,50,1500,	"Lo�i b� t�t c� k� n�ng CD",	 	 0},
	[2]  = {"Ng� Chuy�n Linh B�o ��n",1,0,53,1000,	"Xu�t chi�u+5",				 0},
	[3]  = {"Th�n Gi�p ��n",	 1,0,54,1000,	"Ngo�i ph�ng 100%, duy tr� trong 5 gi�y",	 0},
	[4]  = {"Th�n Tr�o ��n",	 1,0,55,1000,	"N�i ph�ng 100%, duy tr� 5 gi�y",	 0},
	[5]  = {"Th�ng C�n t�n",	 1,0,56,1000,	"Mi�n d�ch l�m ch�m, duy tr� trong 10 gi�y",	 0},
	[6]  = {"Ho�t Huy�t t�n",	 1,0,57,1000,	"Mi�n d�ch gi�m t�c, duy tr� trong 10 gi�y",	 0},
	[7]  = {"S��ng L�c t�n",	 1,0,58,1000,	"Mi�n d�ch t� li�t, duy tr� trong 10 gi�y",	 0},
--	[8]  = {"�ζ�ɢ",	 1,0,59,1000,	"���߷��У�����10��",	 0},
	[8]  = {"C� Th�ch t�n",	 1,0,60,1000,	"Mi�n d�ch ��y lui, duy tr� trong 10 gi�y",	 0},
	[9] = {"Kim Cang t�n",	 1,0,61,1000,	"Mi�n d�ch ��nh ng�, duy tr� trong 10 gi�y",	 0},
	[10] = {"�� Th�n t�n",	 1,0,62,1000,	"Mi�n d�ch m� man, duy tr� trong 10 gi�y",	 0},
	[11] = {"Ng�ng H�n t�n",	 1,0,63,1000,	"Mi�n d�ch h�n lo�n, duy tr� trong 10 gi�y",	 0},
	[12] = {"Th�n Phong t�n",	 1,0,64,1000,	"Mi�n d�ch ��nh th�n, duy tr� trong 10 gi�y",	 0},
	[13] = {"V� �y t�n",	 1,0,65,1000,	"Mi�n cho�ng, duy tr� trong 10 gi�y",	 0},
--	[15] = {"����ɢ",	 1,0,66,1000,	"�����Ի󣬳���10��",	 0},
--	[16] = {"������Ԫ��",1,0,67,1500,	"�������и��棬����10��",0},
	[14] = {"Th�t X�o Linh ��n",	 1,0,68,2000,	"Ti�u v� ��ch, duy tr� trong 3 gi�y",		 0},
	[15] = {"V� C�c Ti�n ��n",	 1,0,69,5000,	"��i v� ��ch, duy tr� trong 6 gi�y",		 0},
	[16] = {"Th�t Khi�u Nguy�n B�o ��n",1,0,228,6000,	"Xu�t chi�u+10, duy tr� trong 15 gi�y",	 4},
--	[20] = {"������Ԫ��",1,0,229,8000,	"�������и��棬����20��",4},
	[17] = {"Th�ng Thi�n V� C�c ��n",1,0,230,10000,	"V� ��ch, duy tr� trong 9 gi�y",		 4},
}

EXIT_POINT = 	--�˳���
{
	[ALL_ID] = {100,1456,2789},	--�����õ�
	[SONG_ID] = {808,1748,3060},
	[LIAO_ID] = {808,1635,3192},
}
--========================================================================================
RELAY_DATA_BATTLE = "battle_statistic";	--�������ݿ���ַ�����ʶ
RELAY_CALLBACK_SCRIPT = "\\script\\newbattles\\battlestatistic.lua";	--Relay�������ݿ�ص��ű�·��
--========================================================================================
BATTLE_OFFSET = 700				--ս�����������ƫ����
--=========ս���������===================================================================
PT_RANKPOINT = 1				--��¼��ҵĵ�ǰ�������η���ֵΪ�����ɷ���ֵΪ��
PT_MAX_RANKPOINT_SONG = 2		--��¼��ҵ��η���߾���
PT_MAX_RANKPOINT_LIAO = 3		--��¼��ҵ��ɷ���߾���
PT_CURRANK = 4					--��¼��ҵĵ�ǰ���Σ��η�Ϊ�����ɷ�Ϊ��
PT_BATTLE_TYPE = 5;				--��¼����������ĸ�ս����1Ϊ���䣬2Ϊ��Դ��3Ϊ��̨��4Ϊ��ս����0������һս��
PT_MULTIPLE_JUNGONG = 6;		--N���������
PT_TOTALPOINT = 7				--��¼����ܵ�ս�����֣��������ģ��ή��
PT_EMPEROR_AWARD_COUNT = 8		--�ʵۼν�����
PT_BATTLE_STAR_COUNT = 9		--��Ϊս��֮�Ǵ���
PT_LAST_RESULT = 10;			--��¼��Ҳμӵ���һ��ս���Ľ��
PT_SIGN_UP = 11					--��¼��ұ����μ��ĸ�Сս����һ��Ӫ����λ��¼��Ӫ��ʮλ��¼ս��
PT_BATTLE_DATE = 12				--��¼����ϴα����μ�ս��������(format:yymmdd)
PT_VILLAGE_WIN = 13				--��¼��ҲμӴ���սӮ�Ĵ��������ƽ�ֲ���¼��
PT_RESOURCE_WIN = 14			--��¼��Ҳμ���ԴսӮ�Ĵ��������ƽ�ֲ���¼��
PT_EMPLACEMENT_WIN = 15			--��¼��Ҳμ���̨սӮ�Ĵ��������ƽ�ֲ���¼��
PT_MAIN_WIN = 16				--��¼��Ҳμ���ս��Ӯ�Ĵ��������ƽ�ֲ���¼��
PT_ATTEND_VILLAGE = 17			--�μӴ���ս�Ĵ�������ս����������Ϊ�μӱ�׼��
PT_ATTEND_RESOURCE = 18			--�μ���Դս�Ĵ�������ս����������Ϊ�μӱ�׼��
PT_ATTEND_EMPLACEMENT = 19		--�μ���̨ս�Ĵ�������ս����������Ϊ�μӱ�׼��
PT_ATTEND_MAIN = 20				--�μ���ս���Ĵ�������ս����������Ϊ�μӱ�׼��
PT_VILL_POINT = 21				--����ڴ���ս��������õĸ��˻���
PT_RESO_POINT = 22				--�������Դս��������õĸ��˻���
PT_EMPL_POINT = 23				--�������̨ս��������õĸ��˻���
PT_MAIN_POINT = 24				--�������ս��������õĸ��˻���
PT_FIND_HEADER = 25				--�ҵ��������
PT_HANDIN_RESOURCE = 26			--�Ͻ���������
PT_KILL_EMPLACEMENT = 27		--��ȡ��̨����
PT_HELP_REFUGEE = 28			--��Ԯ��������
PT_KILL_PIONEER = 29			--ɱ���ȷ�����
PT_KILL_GENERAL = 30			--ɱ�д�
PT_KILL_MARSHAL = 31			--ɱ��Ԫ˧
PT_KILL_SONG_PLAYER = 32		--ɱ���η���Ҵ���
PT_KILL_LIAO_PLAYER = 33		--ɱ���ɷ���Ҵ���
PT_LAST_CAMP = 34;				--��һ��ս������Ӫ
PT_BEST_SERIES_KILL = 35		--�����ն��
PT_KILL_BY_SONG = 36			--���η����ɱ������
PT_KILL_BY_LIAO = 37			--���ɷ����ɱ������
PT_SINGLE_WIN = 38				--����Ӯ����������������������ֵ������ã�Ӯһ�����֣�ƽ���֣������֣�
PT_SINGLE_LOSE = 39				--���������
PT_SINGLE_DRAW = 40				--������ƽ����
PT_HAVE_REFUGEE = 41			--����ʱ�Ƿ����������
PT_SPYCLOTH_TIME = 42			--ʹ�ü��װ����ʱ��
PT_MAX_KILL = 43;				--��ս�����ɱ�˼�¼
PT_MAX_DEATH = 44;				--��ս�����������¼	
PT_MAX_CURRANK_SONG = 45;		--�������η�����
PT_MAX_CURRANK_LIAO = 46;		--�������ɷ�����
PT_OLD_BATTLE_POINT = 47;		--��ս���ܻ���
PT_1MIN2TYPE = 48;				--��¼��ʼʱ�䣺һ�����ڲ�ȡ�Ķ����м�����
PT_1MIN3TYPE = 49;				--��¼��ʼʱ�䣺һ�����ڲ�ȡ�Ķ��Ǹ߼�����
PT_1MIN3TYPEDOUBLE = 50;		--��¼��ʼʱ�䣺һ�����ڲ�ȡ�Ķ���2���߼�����
PT_1MINDOUBLE = 51;				--��¼��ʼʱ�䣺һ�����ڲ�ȡ�Ķ���2������
PT_3MINDOUBLE = 52;				--��¼��ʼʱ�䣺�������ڲ�ȡ�Ķ���2������
PT_EXP_AWARD = 53;				--��¼����õľ��齱��
PT_POINT_AWARD = 54;			--��¼����õĻ��ֽ���	
PT_JUNGONG_AWARD = 55;			--��¼����õľ�������
PT_GOLDENEXP_AWARD = 56;		--��¼����õĽ�������ת����Ľ�����ֵ
PT_EXCHANGE_EXP_COUNT = 57;		--��¼���컻ȡ���澭�齱���Ĵ���
PT_EXCHANGE_EXP_DATE = 58;		--��¼��ȡ���澭�齱��������
PT_CHANGE_CAMP_COUNT = 59;		--��¼���ת����Ӫ�Ĵ���
PT_GET_EXP_AWARD_COUNT = 60;	--��¼������ȡ��ս�����齱���Ĵ���
PT_GET_EXP_AWARD_DATE = 61;		--��¼��ȡ��ս�����齱��������
PT_LAST_BATTLE = 62;			--��¼��һ���μӵ�����һ��ս��
--==================��ұ�����ֻ�ڽ��벻ͬ��ս��ʱ�����=======================================
PTNC_KILL = 80;					--����ս��ɱ����Ŀ
PTNC_DEATH = 81;				--����ս����ɱ��Ŀ
PTNC_SERIES_KILL = 82			--����ս����ǰ��ն��
PTNC_ACTIVITY = 83				--����ս����Ծϵ��
PTNC_BATTLEPOINT = 84			--����ս�۵Ļ���
PTNC_KILL_VILLAGER_POINT = 85	--��ս��ɱ��������õĻ���
PTNC_KILL_SOLDIER_POINT = 86	--��ս��ɱʿ������õĻ���
PTNC_GOT_MEDICINE= 87			--����Ƿ���ȡ��ս�����ҩ
PTNC_HELP_REFUGEE = 88			--����������������
PTNC_USE_HOE_TIMES = 89			--�ݹȳ�ʹ�ó�ͷ�Ĵ���

PT_TAG_CLEARED = 100			--��־ս��������û�б������0��ʾû�����1��ʾ���
--====================ս�������õ�����ʱ����===============================================
PTT_BEGIN = 20					--��һ����ʱ����
PTT_KILLERINDEX = 20			--��¼ɱ�������ҵ�INDEX
PTT_KILLERID = 21				--��¼ɱ�������ҵ�ID
PTT_KILLEDINDEX = 22			--��¼����ɱ������ҵ�INDEX
PTT_KILLEDID = 23				--��¼����ɱ������ҵ�ID
PTT_LOCK = 24					--��¼�Ƿ��������״̬��(���������л��ߵ�����)
PTT_ROOMINDEX = 25				--��¼���ĸ��������أ�0��ʾ���ڵ�������
PTT_FOLLOWER = 26				--�ǲ��Ǵ������񣬣��ǣ���
PTT_FIGHT_STATE = 27			--�ڵ������ص�״̬

PTT_PUBLIC_POINT = 29			--�������֣���������󱨸����
PTT_RESULT_POINT = 30			--ʤ�����֣���������󱨸����
PTT_SELECTED = 31				--��ʶ����ǲ��Ǳ�ѡ�е���
PTT_DIE_LOOP = 32				--��¼�����ս��������ʱ�򣬵�ǰ��ʱ����ѭ����
PTT_OPERATE_TIME = 33			--����������ս�������������ӳ٣���λ��
PTT_TITLE = 34;					--�����ʱս���ƺ�
PTT_IN_TASK_AREA = 35;					--�ڷ�������
PTT_END = 35;					--���һ����ʱ����
--====================ս�������õ�����ʱ����===============================================
PTT_SNAPSHOOT = 49				--һ������ʱ��ܶ��ݵ���ʱ������������������֮��Ĳ�������
--====================Custom Data==========================================================
tCustomDataString = 			--��¼CustomData���ַ�������һ��Ԫ��Ϊ����ʾ�˳�ս��ʱ�������������ʾҪ���
{								--���������ʱ��û�б�ʹ��
	[1] = {0,"bt_yj_enemyname"},	--��ս������ʱ������¼�Է������ֵ�
	[2] = {1,"bts_village"},		--��ս����ͳ������
	[3] = {1,"bts_resource"},
	[4] = {1,"bts_emplacement"},
	[5] = {1,"bts_mainbattle"},
}
CD_ENEMY_NAME = tCustomDataString[1][2];
CD_BTS_VILLAGE = tCustomDataString[2][2];
CD_BTS_RESOURCE = tCustomDataString[3][2];
CD_BTS_EMPLACEMENT = tCustomDataString[4][2];
CD_BTS_MAINBATTLE = tCustomDataString[5][2];
--==========ս������MissionV����������������========================================
MV_BATTLE_STATE = 1;			--��¼ս��Ŀǰ״̬
MV_BATTLE_ID = 2;				--��¼ս����ΨһID
MV_BATTLE_POINT_SONG = 3;		--��¼�η��Ĺ�������
MV_BATTLE_POINT_LIAO = 4;		--��¼�ɷ��Ĺ�������
MV_WINNER = 5;					--��¼ʤ������Ϊ�η�Ӯ����Ϊ�ɷ�Ӯ����Ϊ��ƽ
MV_TIMER_LOOP = 6;				--��¼TIMER�ı�ʱ����
MV_SP_TIMER_STATE = 7;			--��¼�����ʱ����״̬������״̬��mission_head.lua����
MV_SP_TIMER_LOOP = 8;			--��¼�����ʱ���ı�ʱ����
MV_DEATH_COUNT_SONG = 9			--�η������������
MV_DEATH_COUNT_LIAO = 10		--�ɷ������������
MV_FACTION_PLAYER_COUNT1 = 11;	--��¼ս����������������������������ɣ�������������ÿ���������ĸ����ɣ�����������
MV_FACTION_PLAYER_COUNT2 = 12;
MV_FACTION_PLAYER_COUNT3 = 13;
--==========������ս����״̬=======================================================
MS_STATE_PEACE = 0;				--��ƽ״̬����ս����û��ʼ����
MS_STATE_READY = 1;				--׼��״̬
MS_STATE_FIGHT = 2;				--��ս״̬
MS_STATE_COMPLETE = 3;			--ս������״̬
--===========================================================================
LOG_ID = 1108;					--��½��������ID
LOG_TRIGGER_ID = 3121;			--��½�������Զ���ID 
--===========================================================================

--=========================�����ǵ�����س���==========================================
ITEM_SPYCLOTH_TIME = 3*3600			--���װ����Чʱ�䣬��λ��