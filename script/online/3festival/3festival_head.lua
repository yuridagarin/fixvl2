--File name:3festival_head.lua 
--Describe:��������ͷ�ļ��ű�
--Create Date:2006-8-22
--Author:yanjun
--2369��2500�����������
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");

IB_VERSION = 1;		--1��ʾ���������0��ʾ�շ���

--============================================================================
TASK_MAIN_RES = 2369;			--��¼���ӵ�����
TASK_SUB_RES = 2370;			--��¼���ӵĸ���
TASK_FIREUP_TIME = 2371;		--��¼�����ʱ��
TASK_ADD_FUEL_TIME = 2372;		--��¼�ϴ���Ӳ���ʱ��
TASK_TEMPERATURE_CHECKED = 2373	--��¼�Ƿ�鿴���¶�
TASK_TEMPERATURE = 2374			--��¼����ȼ�Ϻ��¯���¶�
TASK_GOT_ITEM_TIME = 2375;		--��¼����ϴ��õ�СBOSS��Ʒ��ʱ��
TASK_GOT_RESOURCE = 2376;		--��¼�����ȡ���±����ϵ�����
TASK_GOT_MOONCATE = 2377;		--��¼�����ȡ�±�������
TASK_HEALTHYEXP = 2378;			--��¼���ĳ���ܹ��õ������ٽ�������
TASK_HEALTHYEXP_DATE = 2379;	--��¼��һ�ý�������ʱ������
--=========================08���===========================================
ABLUEMOON_LUCK_DATE = 617; --���������� ��ʽ��%y%m%d
ABLUEMOON_LUCK = 618; --ÿ�������ֵ 1��7��ʾ���� 1��ʾ���ף�7��ʾ��
TASK_CHANGE_YUEBING = 929;    --��¼��Ҷһ��±�������4�ֽڣ��ֱ��ʾʢ����÷�����¡�ʢ������˫���¡�ʢ�����������¡�ʢ���ٻ�ʲ����
TASK_CHANGE_EXCHANGE = 930;		--��¼����ý�ɽ�϶�ˮ���»�ȡ�����Ĵ���
TASK_GOT_ANNIVERSARY_REWARD = 931;	--��¼����Ƿ���ȡ�����꽱��
TASK_WULIN_IS_AWARD = 932; 		--��¼�����Ƿ��Ѿ���������˽������洢����ʱ��
TASK_WULIN_AWARD_NUM = 933; 		--��¼�콱����
TASK_WULIN_SHUANGBEI = 934;			--�����Ƿ���ȡ��˫��ʱ�佱��
TASK_BAIJU_SB_TIME = 935;			--�׾���˫��ʱ�䣬��λ������
TASK_GENSUI_TOTAL = 936; 			--��ý����Ĵ���
TASK_GENSUI_DATE = 937; 			--��ý������¼����
TASK_GOT_MOONCANT_COUNT = 938;		--��¼��ȡ�±��Ĵ���
TASK_USE_HHDYB = 939;				--ʹ��HHDYB����
TASK_USE_JSHTYB = 940;				--ʹ��JSHTYB����
TASK_USE_JSJHYB= 941;				--ʹ��JSJHYB����
TASK_USE_JSMWYB = 942;				--ʹ��JSMWYB����
TASK_USE_JSYB = 943;				--ʹ��JSYB����
TASK_USE_CARD_20 = 944;			--ʹ��2���ſ��������Ĵ���
TASK_USE_CARD_40 = 945;			--ʹ��4���ſ��������Ĵ���
TASK_USE_TIE_BOX = 946;     --��ҿ��������ӵĴ��� ������߼�Ʒ����
TASK_USE_TONG_BOX = 947;     --��ҿ���ͭ���ӵĴ��� ������߼�Ʒ����
TASK_USE_YIN_BOX = 948;     --��ҿ��������ӵĴ��� ������߼�Ʒ����
TASK_USE_JIN_BOX = 949;     --��ҿ��������ӵĴ��� ������߼�Ʒ����
TASK_QIXING_EXCHANGE = 950;		--��¼����ý�ɽ���ǰ���»�ȡ�����Ĵ���
--==============��ͼ�������===============================================	
MAP_NPC_INDEX = 1;
MAP_ACTION_INDEX = 2;
MAP_NPC_CHAT_TIME = 3;
--===============��ʱ����===================================================
TT_MAIN_RES = 70;				--��¼����ӵ�����
TT_SUB_RES = 71;				--��¼����ӵĸ���
TT_FIRE_SEED = 72;				--��¼����ӵ�ȼ��
TT_AWARD_STATE = 73;			--��¼������ý��������
TT_TIMER_LOOP = 74;				--��¼��Ҵ�������ǰѭ��ʣ�����
TT_FIREWORKS_MAPID = 75;		--��¼��ҷŵ��̻��λ�õĵ�ͼID	
TT_FIREWORKS_MAPX = 76;			--��¼��ҷŵ��̻��λ�õĵ�ͼX����
TT_FIREWORKS_MAPY = 77;			--��¼��ҷŵ��̻��λ�õĵ�ͼY����
TT_FIREWORKS_TIME = 78;			--��¼��ҷ��̻�ʱ��ʱ��
TT_FIREWORKS_INDEX = 79;		--��¼��ҷŵ��̻��NPC����

--==========================================================================
CUTE_BOSS_COUNT = 50;			--��BOSS�����е�СBOSS��Ŀ
BEST_TEMP = 180;				--ȡ���±�������¶�
COOKING_TIME = 5*60;			--�����±������ʱ��

TIMER_LOOP = 9;				--ʱ�䴥����ִ�д�����ִ��9�βŻ��10�ν���

GOOD_AWARD = 100;					--����1��������
BETTER_AWARD = 300;				--����2��������
BEST_AWARD = 600;				--����3��������

DISTANCE = 20;					--Ҫ��ý������飬��ô���̻�ľ��벻�ܴ����������λ��NewWorld����ʹ�õĵ�λ

MAX_MOONCAKE_COUNT = 50;		--һ���������ɷ��ŵ��±�����

BOX_PROB_INCREASE = 0.05;   --�����Ӽ�Ʒ���ʵ������
--===========================================================================
TRIGGER_TIMER = 3;				--ʱ�䴥����ID			
TRIGGER_LOGOUT = 402;			--�ǳ�������ID
TRIGGER_LOGIN = 403;			--��½������ID
TRIGGER_TIMER_CID = 54;			--ʱ�䴥�����Զ���ID
TRIGGER_LOGOUT_CID = 55;		--�ǳ��������Զ���ID
TRIGGER_LOGIN_CID = 56;			--��½�������Զ���ID
--============================================================================
NEW_CEHUA_LIFETIME = 600;--�²߻�����ʱ�䣬10����

--�����˴�����	 
tWuLinAward = {
		 --����һ(���飺��)  �������ӣ�  ����Կ�ף�    ������id,����,����    ������......
	[1]={100,{"H�p Ng�c B�i Huy Ho�ng",2,0,1076,3,100},{"Ch�a Kh�a Ng�c Huy Ho�ng",2,0,1072,1,3},{"H�p ��ng B�i Huy Ho�ng",2,0,1077,3,7500},{"Ch�a Kh�a ��ng Huy Ho�ng",2,0,1073,1,889},{"H�p Ng�n B�i Vinh D�",2,0,1078,1,1500},{"Ch�a Kh�a B�c Vinh D�",2,0,1074,1,10},{"H�p Kim B�i Vinh D�",2,0,1079,1,100},{"Ch�a Kh�a V�ng Vinh D�",2,0,1075,1,1}}, 
	[2]={150,{"H�p Ng�c B�i Huy Ho�ng",2,0,1076,4,100},{"Ch�a Kh�a Ng�c Huy Ho�ng",2,0,1072,2,4},{"H�p ��ng B�i Huy Ho�ng",2,0,1077,4,7500},{"Ch�a Kh�a ��ng Huy Ho�ng",2,0,1073,1,889},{"H�p Ng�n B�i Vinh D�",2,0,1078,1,1500},{"Ch�a Kh�a B�c Vinh D�",2,0,1074,1,10},{"H�p Kim B�i Vinh D�",2,0,1079,1,100},{"Ch�a Kh�a V�ng Vinh D�",2,0,1075,1,1}},
	[3]={200,{"H�p Ng�c B�i Huy Ho�ng",2,0,1076,6,100},{"Ch�a Kh�a Ng�c Huy Ho�ng",2,0,1072,3,6},{"H�p ��ng B�i Huy Ho�ng",2,0,1077,5,7500},{"Ch�a Kh�a ��ng Huy Ho�ng",2,0,1073,2,889},{"H�p Ng�n B�i Vinh D�",2,0,1078,1,1500},{"Ch�a Kh�a B�c Vinh D�",2,0,1074,1,10},{"H�p Kim B�i Vinh D�",2,0,1079,1,100},{"Ch�a Kh�a V�ng Vinh D�",2,0,1075,1,1}}	 
	}

--���佱��
tAboutBoxIB = {--ǰ��Ϊ��Ȼ��ã�����Ϊ���ʻ��
	{{"<color=yellow>1<color> th� k� ni�m JX2 tr�n 3 n�m","C�p 1-5 ng�u nhi�n <color=yellow>1<color> Linh th�ch"},{"C�i ��","H�p ��ng B�i Huy Ho�ng","Thi�n Th�i Ch� Gi�i ","Ng� H�nh M�t t�ch","1 T�ng Ki�m B�o R��ng","Vi�m Ho�ng Thi�t H�n"}},
	{{"<color=yellow>2<color> th� k� ni�m JX2 tr�n 3 n�m","C�p 1-6 ng�u nhi�n <color=yellow>1<color> Linh th�ch"},{"M�t h�m s� m�n","H�p Ng�n B�i Vinh D�","Thi�n Th�i Ch� Gi�i ","Ng� H�nh M�t t�ch","1 T�ng Ki�m B�o R��ng","Hi�n Vi�n Chi�n","Vi�m Ho�ng Thi�t H�n"}},
	{{"<color=yellow>50<color> th� k� ni�m JX2 tr�n 3 n�m"},{"C�p 6-7 ng�u nhi�n <color=yellow>1<color> Linh th�ch","M�t t�ch L�ng Ba Vi B�","��nh H�n Thi�n Th�ch Th�n Th�ch","H�p Kim B�i Vinh D�","Hi�n Vi�n Chi�n","Hi�n Vi�n ��u","Vi�m Ho�ng Thi�t H�n"}},
	{{"<color=yellow>300<color> th� k� ni�m JX2 tr�n 3 n�m"},{"C�p 7 ng�u nhi�n <color=yellow>3<color> Linh th�ch","��nh H�n Thi�n Th�ch Th�n Th�ch","Nguy�n cu�n m�t t�ch L�ng Ba Vi B�","Hi�n Vi�n Chi�n","Hi�n Vi�n ��u","Ho�ng �� v� kh�","Vi�m Ho�ng Thi�t H�n"}}
	}
	
--���佱�����շ�����
tAboutBox = {--ǰ��Ϊ��Ȼ��ã�����Ϊ���ʻ��
	{{"<color=yellow>1<color> th� k� ni�m JX2 tr�n 3 n�m","C�p 1-5 ng�u nhi�n <color=yellow>1<color> Linh th�ch"},{"C�i ��","H�p ��ng B�i Huy Ho�ng","Thi�n Th�i Ch� Gi�i ","Ng� H�nh M�t t�ch","1 T�ng Ki�m B�o R��ng","Vi�m Ho�ng Thi�t H�n"}},
	{{"<color=yellow>2<color> th� k� ni�m JX2 tr�n 3 n�m","C�p 1-6 ng�u nhi�n <color=yellow>1<color> Linh th�ch"},{"M�t h�m s� m�n","H�p Ng�n B�i Vinh D�","Thi�n Th�i Ch� Gi�i ","Ng� H�nh M�t t�ch","1 T�ng Ki�m B�o R��ng","Hi�n Vi�n Chi�n","Vi�m Ho�ng Thi�t H�n"}},
	{{"<color=yellow>50<color> th� k� ni�m JX2 tr�n 3 n�m"},{"C�p 6-7 ng�u nhi�n <color=yellow>1<color> Linh th�ch","M�t t�ch L�ng Ba Vi B�","��nh H�n Thi�n Th�ch Th�n Th�ch","H�p Kim B�i Vinh D�","Hi�n Vi�n Chi�n","Hi�n Vi�n ��u","Vi�m Ho�ng Thi�t H�n"}},
	{{"<color=yellow>300<color> th� k� ni�m JX2 tr�n 3 n�m"},{"C�p 7 ng�u nhi�n <color=yellow>3<color> Linh th�ch","��nh H�n Thi�n Th�ch Th�n Th�ch","Nguy�n cu�n m�t t�ch L�ng Ba Vi B�","Hi�n Vi�n Chi�n","Hi�n Vi�n ��u","Ho�ng �� v� kh�","Vi�m Ho�ng Thi�t H�n"}}
	}	

tNewCehua = {--ģ���� npc�� �ط� id 
	{"V� n� Ba T�","Vi�n L�u L�u","Th�y Y�n",404,{1550,1630,1648},{2746,2736,2947}},
	{"Ch� c�m �� Trung Nguy�n","Ti�u C��ng","C�n L�n",509,{1452,1551,1576},{3363,3243,3107}},
	{"Th� sinh","V� c�ng t�","Quang Minh ��nh",508,{1631,1558,1641},{3031,3157,3236}}
	}

--===========================================================================================
tSex = {"Thi�u hi�p","N� hi�p "};
--tBossInfo��tItemInfo��tBossPos�����Ӧ,˳������
tBossInfo = {	--BOSSģ����,СBOSSģ����,	ˢ��ʱ��
		[1] = {"Thi�t D��ng","Ti�u Thi�t D��ng","Thi�t D��ng","Thu�c h� c�a Thi�t D��ng",21},
		[2] = {"�m Minh","Ti�u �m Minh","Ti�u Bi�n Nhi","Thu�c h� c�a Ti�u Bi�n Nhi",19},
		[3] = {"H�u Thu�n","Ti�u H�u Thu�n","Kh� m�p","Thu�c h� c�a Kh� m�p",16},
		[4] = {"B�t H�ng","Ti�u B�t H�ng","B�t H�ng","Thu�c h� c�a B�t H�ng",21},
		[5] = {"H� Thi�n","Ti�u H� Thi�n","Ti�u Thi�n Thi�n","Thu�c h� c�a Ti�u Thi�n Thi�n",19},
		[6] = {"Quang V� C�c","Ti�u Quang V� C�c","C�u Tuy�t Ki�m Kh�","Thu�c h� c�a C�u Tuy�t Ki�m Kh�",21},
		[7] = {"A Vi","Ti�u A Vi","Tr�n C�ng t�","Thu�c h� c�a Tr�n C�ng t�",16},
		}
		
tItemInfo = {
		[1] = {"D��ng H�a Phi�n",2,0,506},
		[2] = {"Y�n ��i",2,0,509},
		[3] = {"H�a Chi�t T�",2,0,508},
		[4] = {"Tr�c M�",2,0,511},
		[5] = {"M�c h�i",2,0,510},
		[6] = {"Thu�t C�u Ch��ng",2,0,513},
		[7] = {"Loan Ph�ng Ng�c B�i",2,0,512},
		[8] = {"D��ng H�a C�",2,0,507},	--07�����ڲ�����
		[9] = {"Thi�n Th�ch Ch�y",2,0,514},	--07�����ڲ�����
		[10] = {"Kh�nh �i�n di�m h�a",2,0,515},
		[11] = {"H��ng d�n",2,0,1030},
		[12] = {"Bao thu�c c�a Nguy�t L��ng Th�",0,102,41},
		[13] = {"H�ng Nga Nguy�t V� ��i",0,102,42},
		[14] = {"H�u Ngh� L�c Nh�t Ho�n",0,102,43},
		[15] = {"H�p Ng�c B�i Huy Ho�ng",2,0,1076},
		[16] = {"H�p ��ng B�i Huy Ho�ng",2,0,1077},
		[17] = {"H�p Ng�n B�i Vinh D�",2,0,1078},
		[18] = {"H�p Kim B�i Vinh D�",2,0,1079},
		[19] = {"Th� k� ni�m m�ng V� L�m tr�n 2 n�m",2,0,1081},
		[20] = {"Ch�a Kh�a Ng�c Huy Ho�ng",2,0,1072},
		[21] = {"Ch�a Kh�a ��ng Huy Ho�ng",2,0,1073},
		[22] = {"Ch�a Kh�a B�c Vinh D�",2,0,1074},
		[23] = {"Ch�a Kh�a V�ng Vinh D�",2,0,1075},
		[24] = {"B�ng Lai Ti�n L�",2,0,109},
		[25] = {"Vi�m Ho�ng Thi�t H�n",2,1,1146},
		[26] = {"C�i ��",2,1,1090},
		[27] = {"Thi�n Th�i Ch� Gi�i ",2,1,3210},
		[28] = {"Ng� H�nh M�t t�ch",0,107,155},
		[29] = {"M�t t�ch ng� h�nh to�n t�p",0,107,157},
		[30] = {"L�ng Ba Vi B�",0,112,78},
		[31] = {"L�ng Ba Vi B� to�n t�p",0,112,158},
		[32] = {"M�t h�m s� m�n",2,1,1020},
		[33] = {"B�o r��ng T�ng Ki�m ��u qu�n",2,1,1059},
		[34] = {"B�o r��ng T�ng Ki�m y gi�p",2,1,1060},
		[35] = {"B�o r��ng T�ng Ki�m hoa kh�",2,1,1061},
		[36] = {"B�o r��ng T�ng Ki�m trang s�c",2,1,1062},
		[37] = {"B�o r��ng T�ng Ki�m v� kh�",2,1,1063},
		[38] = {"��nh H�n Thi�n Th�ch Th�n Th�ch",2,1,1067},
		[39] = {"Thi�n Th�ch linh th�ch",2,1,1068}
		}

tMaterial = {
		[1] = {"Ng.li�u ch�nh 1",2,0,518},
		[2] = {"Ng.li�u ch�nh 2",2,0,519},
		[3] = {"Ng.li�u ch�nh 3",2,0,520},
		[4] = {"Ng.li�u ph� 1",2,0,521},
		[5] = {"Ng.li�u ph� 2",2,0,522},
		[6] = {"Ng.li�u ph� 3",2,0,523},
		[7] = {"Than nhi�t �� cao",2,0,524},
		[8] = {"C�i nhi�t �� th�p",2,0,525},
		[9] = {"L� n��ng b�nh Trung Thu",2,0,517},
		}

tBossPos = {
		[1] = {"B�c Th�nh ��",308,1461,3156},
		[2] = {"Nam Th�nh ��",304,1494,2986},
		[3] = {"B�c Tuy�n Ch�u",108,1521,3060},	
		[4] = {"T�y Tuy�n Ch�u",105,1545,3008},	
		[5] = {"B�c Ph�ng T��ng",504,1487,3006},
		[6] = {"Long M�n tr�n",507,1682,3360},
		[7] = {"Ph�ng T��ng ph� Nam ",501,1436,2952},
		}

tMoonCake = {
		[1] = {"B�nh Trung Thu Giang S�n",2,0,1000},
		[2] = {"B�nh Trung Thu ch�n g� Giang S�n",2,0,1002},
		[3] = {"B�nh Trung Thu th�t m�n Giang S�n",2,0,1003},
		[4] = {"B�nh Trung Thu Kim Hoa Giang S�n",2,0,1004},
		[5] = {"B�nh Trung Thu Li�n Dung Giang S�n",1,0,231},
		[6] = {"B�nh Trung Thu Nh�n T�o Giang S�n",1,0,232},
		[7] = {"B�nh Trung Thu Nh�n ��u Giang S�n",1,0,233},
		[8] = {"B�nh Trung Thu Xo�i Giang S�n",2,0,1005},
		[9] = {"B�nh Trung Thu S�u Ri�ng Giang S�n",2,0,1006},
		[10] = {"B�nh Trung Thu Xo�i Giang S�n",2,0,1007},	
		[11] = {"Th�nh Th� Mai H�n H��ng Nguy�t",2,0,1008},	
		[12] = {"Th�nh Th� B�ch Ng�c Song Nguy�t",2,0,1009},	
		[13] = {"Th�nh Th� K� H��ng Ng� Nh�n Nguy�t",2,0,1010},	
		[14] = {"Th�nh Th� B�ch Hoa Th�p C�m Nguy�t",2,0,1011},	
		[15] = {"Th�nh Th� Th�t Tinh B�n Qu�n Nguy�t",2,0,1012},	
		[16] = {"Th�nh Th� H�ng Nga Th�y Tinh Nguy�t",2,0,1013},
		[17] = {"B�nh Trung Thu Giang S�n M� V� ",2,0,1001},		
		[18] = {"B�nh trung thu n��ng",2,0,1014},	
		[19] = {"B�nh trung thu kh�t",2,0,1015},	
		}

tMappingTemp = {	--�¶�����
		[1] = 1,
		[2] = 31,
		[3] = 61,
		[4] = 121,
		[5] = 151,
		[6] = 176,
		[7] = 180,
		[8] = 181,
		[9] = 186,
		[10] = 211,
		[11] = 241,
		[12] = 301,
		[13] = 361,
		[14] = 451,
		}

--������һ����ά���飬��һάΪ�������ͣ��ڶ�άΪ�������ͣ�����άΪ�±�����
tMappingMoonCake = {	
	[1] = {
		[1] = {	--���������±�������ż�����ǵõ�ĳ���±��Ļ��ʣ���{17,75,2,100}��ʾ��75�����ʵõ��±�17,�У�100��75�����Ļ��ʵõ��±�2
				{1,100},{17,50,1,100},{17,100},{17,75,2,100},	--�¶�����1��4
				{17,25,2,100},{2,40,12,90,15,100},{12,50,15,80,16,100},{2,40,12,90,15,100},	--�¶�����5��8
				{17,25,2,100},{17,75,2,100},{17,100},{17,33,18,100},	--�¶�����9��12
				{18,100},{19,100},	--�¶�����13��14
				},
		[2] = {
				{1,100},{17,50,1,100},{17,100},{17,75,3,100},	--�¶�����1��4
				{17,25,3,100},{3,40,12,90,15,100},{12,50,15,80,16,100},{3,40,12,90,15,100},	--�¶�����5��8
				{17,25,3,100},{17,75,3,100},{17,100},{17,33,18,100},	--�¶�����9��12
				{18,100},{19,100},	--�¶�����13��14
				},
		[3] = {
				{1,100},{17,50,1,100},{17,100},{17,75,4,100},	--�¶�����1��4
				{17,25,4,100},{4,40,12,90,15,100},{12,50,15,80,16,100},{4,40,12,90,15,100},	--�¶�����5��8
				{17,25,4,100},{17,75,4,100},{17,100},{17,33,18,100},	--�¶�����9��12
				{18,100},{19,100},	--�¶�����13��14
				},
		},
	[2] = {
		[1] = {
				{1,100},{1,100},{1,100},{1,75,5,100},	--�¶�����1��4
				{1,25,5,100},{5,50,13,100},{13,100},{5,50,13,100},	--�¶�����5��8
				{1,25,5,100},{1,75,5,100},{1,100},{1,33,18,100},	--�¶�����9��12
				{19,100},{19,100},	--�¶�����13��14
				},
		[2] = {
				{1,100},{1,100},{1,100},{1,75,6,100},	--�¶�����1��4
				{1,25,6,100},{6,50,13,100},{13,100},{6,50,13,100},	--�¶�����5��8
				{1,25,6,100},{1,75,6,100},{1,100},{1,33,18,100},	--�¶�����9��12
				{19,100},{19,100},	--�¶�����13��14
				},
		[3] = {
				{1,100},{1,100},{1,100},{1,75,7,100},	--�¶�����1��4
				{1,25,7,100},{7,50,13,100},{13,100},{7,50,13,100},	--�¶�����5��8
				{1,25,7,100},{1,75,7,100},{1,100},{1,33,18,100},	--�¶�����9��12
				{19,100},{19,100},	--�¶�����13��14
				}
		},
	[3] = {
		[1] = {
				{1,100},{1,100},{1,100},{1,75,8,100},	--�¶�����1��4
				{1,25,8,100},{8,50,14,100},{14,100},{8,50,14,100},	--�¶�����5��8
				{1,25,8,100},{1,75,8,100},{1,100},{1,33,18,100},	--�¶�����9��12
				{19,100},{19,100},	--�¶�����13��14
				},
		[2] = {
				{1,100},{1,100},{1,100},{1,75,9,100},	--�¶�����1��4
				{1,25,9,100},{9,50,14,100},{14,100},{9,50,14,100},	--�¶�����5��8
				{1,25,9,100},{1,75,9,100},{1,100},{1,33,18,100},	--�¶�����9��12
				{19,100},{19,100},	--�¶�����13��14
				},
		[3] = {
				{1,100},{1,100},{1,100},{1,75,10,100},	--�¶�����1��4
				{1,25,10,100},{10,50,14,100},{14,100},{10,50,14,100},	--�¶�����5��8
				{1,25,10,100},{1,75,10,100},{1,100},{1,33,18,100},	--�¶�����9��12
				{19,100},{19,100},	--�¶�����13��14
				},
		},
	}

tSexName = {"Thi�u hi�p","N� hi�p "};

tWeapon = {
	{"V�n Nh�n ch�a gi�m ��nh",2,1,375},
	{"H�a Tinh ch�a gi�m ��nh",2,1,376},
	{"Li�t Di�m ch�a gi�m ��nh",2,1,377},
	{"M�n Thi�n Hoa V� ch�a gi�m ��nh",2,1,378},
	{"C� ��nh ch�a gi�m ��nh",2,1,379},
	{"Hi Nh�n C�m ch�a gi�m ��nh",2,1,380},
	{"Th�n H�nh ch�a gi�m ��nh",2,1,381},
	{"A La H�n Tr��ng ch�a gi�m ��nh",2,1,382},
	{"��i H�o L�i Th��ng ch�a gi�m ��nh",2,1,383},
	{"Th�n Cung ch�a gi�m ��nh",2,1,384},
	{"M�nh H� ch�a gi�m ��nh",2,1,385},
	{"L�ng Phong ch�a gi�m ��nh",2,1,386},
}

tHuangDiWeapon = 
{
	[0] = {{"Hi�n Vi�n To�i V� �ao",0,3,8801},{"Hi�n Vi�n To�i V� C�n",0,5,8802},{"Hi�n Vi�n C�u Nh� Tr��ng",0,8,8803},{"Hi�n Vi�n H�o Nhi�n Th�",0,0,8804},{"Hi�n Vi�n Gi�i T� Kim",0,1,8805},{"Hi�n Vi�n T� Tinh Ki�m",0,2,8806},{"Hi�n Vi�n Ph�ng Ho�ng C�m",0,10,8807},{"Hi�n Vi�n Ng� Nh�c Th�",0,0,8808},{"Hi�n Vi�n Ph� Thi�n C�n",0,5,8809},{"Hi�n Vi�n H�ng Qu�n Ki�m",0,2,8810},{"Hi�n Vi�n Sinh T� B�t",0,9,8811},{"Hi�n Vi�n Ph� Qu�n Th��ng",0,6,8812},{"Hi�n Vi�n Khai Thi�n Cung",0,4,8813},{"Hi�n Vi�n �m D��ng Nh�n",0,7,8814},{"Hi�n Vi�n U Minh Tr�o",0,11,8815}},
	[1] = {{"Hi�n Vi�n To�i V� �ao",0,3,8801},{"Hi�n Vi�n To�i V� C�n",0,5,8802},{"Hi�n Vi�n C�u Nh� Tr��ng",0,8,8803},{"Hi�n Vi�n H�o Nhi�n Th�",0,0,8804}},
	[2] = {{"Hi�n Vi�n To�i V� �ao",0,3,8801},{"Hi�n Vi�n To�i V� C�n",0,5,8802}},
	[3] = {{"Hi�n Vi�n C�u Nh� Tr��ng",0,8,8803}},
	[4] = {{"Hi�n Vi�n H�o Nhi�n Th�",0,0,8804}},
	[5] = {{"Hi�n Vi�n Gi�i T� Kim",0,1,8805}},
	[6] = {{"Hi�n Vi�n Gi�i T� Kim",0,1,8805}},
	[7] = {{"Hi�n Vi�n T� Tinh Ki�m",0,2,8806},{"Hi�n Vi�n Ph�ng Ho�ng C�m",0,10,8807}},
	[8] = {{"Hi�n Vi�n T� Tinh Ki�m",0,2,8806}},
	[9] = {{"Hi�n Vi�n Ph�ng Ho�ng C�m",0,10,8807}},
	[10] = {{"Hi�n Vi�n Ng� Nh�c Th�",0,0,8808},{"Hi�n Vi�n Ph� Thi�n C�n",0,5,8809}},
	[11] = {{"Hi�n Vi�n Ng� Nh�c Th�",0,0,8808}},
	[12] = {{"Hi�n Vi�n Ph� Thi�n C�n",0,5,8809}},
	[13] = {{"Hi�n Vi�n H�ng Qu�n Ki�m",0,2,8810},{"Hi�n Vi�n Sinh T� B�t",0,9,8811}},
	[14] = {{"Hi�n Vi�n H�ng Qu�n Ki�m",0,2,8810}},
	[15] = {{"Hi�n Vi�n Sinh T� B�t",0,9,8811}},
	[16] = {{"Hi�n Vi�n Ph� Qu�n Th��ng",0,6,8812},{"Hi�n Vi�n Khai Thi�n Cung",0,4,8813}},
	[17] = {{"Hi�n Vi�n Ph� Qu�n Th��ng",0,6,8812}},
	[18] = {{"Hi�n Vi�n Khai Thi�n Cung",0,4,8813}},
	[19] = {{"Hi�n Vi�n �m D��ng Nh�n",0,7,8814},{"Hi�n Vi�n U Minh Tr�o",0,11,8815}},
	[20] = {{"Hi�n Vi�n �m D��ng Nh�n",0,7,8814}},
	[21] = {{"Hi�n Vi�n U Minh Tr�o",0,11,8815}},
}

tbHuangDiRing1 = 
{
	[0] = {{"Hi�n Vi�n Chi�n",0,102,8801},{"Hi�n Vi�n Chi�n",0,102,8803},{"Hi�n Vi�n Chi�n",0,102,8805},{"Hi�n Vi�n Chi�n",0,102,8807},{"Hi�n Vi�n Chi�n",0,102,8809},{"Hi�n Vi�n Chi�n",0,102,8811},{"Hi�n Vi�n Chi�n",0,102,8813},{"Hi�n Vi�n Chi�n",0,102,8815},{"Hi�n Vi�n Chi�n",0,102,8817},{"Hi�n Vi�n Chi�n",0,102,8819},{"Hi�n Vi�n Chi�n",0,102,8821},{"Hi�n Vi�n Chi�n",0,102,8823},{"Hi�n Vi�n Chi�n",0,102,8825},{"Hi�n Vi�n Chi�n",0,102,8827}},
	[1] = {{"Hi�n Vi�n Chi�n",0,102,8801},{"Hi�n Vi�n Chi�n",0,102,8803},{"Hi�n Vi�n Chi�n",0,102,8805}},
	[2] = {{"Hi�n Vi�n Chi�n",0,102,8801}},
	[3] = {{"Hi�n Vi�n Chi�n",0,102,8803}},
	[4] = {{"Hi�n Vi�n Chi�n",0,102,8805}},
	[5] = {{"Hi�n Vi�n Chi�n",0,102,8807}},
	[6] = {{"Hi�n Vi�n Chi�n",0,102,8807}},
	[7] = {{"Hi�n Vi�n Chi�n",0,102,8809},{"Hi�n Vi�n Chi�n",0,102,8811}},
	[8] = {{"Hi�n Vi�n Chi�n",0,102,8809}},
	[9] = {{"Hi�n Vi�n Chi�n",0,102,8811}},
	[10] = {{"Hi�n Vi�n Chi�n",0,102,8813},{"Hi�n Vi�n Chi�n",0,102,8815}},
	[11] = {{"Hi�n Vi�n Chi�n",0,102,8813}},
	[12] = {{"Hi�n Vi�n Chi�n",0,102,8815}},
	[13] = {{"Hi�n Vi�n Chi�n",0,102,8817},{"Hi�n Vi�n Chi�n",0,102,8819}},
	[14] = {{"Hi�n Vi�n Chi�n",0,102,8817}},
	[15] = {{"Hi�n Vi�n Chi�n",0,102,8819}},
	[16] = {{"Hi�n Vi�n Chi�n",0,102,8821},{"Hi�n Vi�n Chi�n",0,102,8823}},
	[17] = {{"Hi�n Vi�n Chi�n",0,102,8821}},
	[18] = {{"Hi�n Vi�n Chi�n",0,102,8823}},
	[19] = {{"Hi�n Vi�n Chi�n",0,102,8825},{"Hi�n Vi�n Chi�n",0,102,8827}},
	[20] = {{"Hi�n Vi�n Chi�n",0,102,8825}},
	[21] = {{"Hi�n Vi�n Chi�n",0,102,8827}},
}

tbHuangDiRing2 = 
{
	[0] = {{"Hi�n Vi�n ��u",0,102,8802},{"Hi�n Vi�n ��u",0,102,8804},{"Hi�n Vi�n ��u",0,102,8806},{"Hi�n Vi�n ��u",0,102,8808},{"Hi�n Vi�n ��u",0,102,8810},{"Hi�n Vi�n ��u",0,102,8812},{"Hi�n Vi�n ��u",0,102,8814},{"Hi�n Vi�n ��u",0,102,8816},{"Hi�n Vi�n ��u",0,102,8818},{"Hi�n Vi�n ��u",0,102,8820},{"Hi�n Vi�n ��u",0,102,8822},{"Hi�n Vi�n ��u",0,102,8824},{"Hi�n Vi�n ��u",0,102,8826},{"Hi�n Vi�n ��u",0,102,8828}},
	[1] = {{"Hi�n Vi�n ��u",0,102,8802},{"Hi�n Vi�n ��u",0,102,8804},{"Hi�n Vi�n ��u",0,102,8806}},
	[2] = {{"Hi�n Vi�n ��u",0,102,8802}},
	[3] = {{"Hi�n Vi�n ��u",0,102,8804}},
	[4] = {{"Hi�n Vi�n ��u",0,102,8806}},
	[5] = {{"Hi�n Vi�n ��u",0,102,8808}},
	[6] = {{"Hi�n Vi�n ��u",0,102,8808}},
	[7] = {{"Hi�n Vi�n ��u",0,102,8810},{"Hi�n Vi�n ��u",0,102,8812}},
	[8] = {{"Hi�n Vi�n ��u",0,102,8810}},
	[9] = {{"Hi�n Vi�n ��u",0,102,8812}},
	[10] = {{"Hi�n Vi�n ��u",0,102,8814},{"Hi�n Vi�n ��u",0,102,8816}},
	[11] = {{"Hi�n Vi�n ��u",0,102,8814}},
	[12] = {{"Hi�n Vi�n ��u",0,102,8816}},
	[13] = {{"Hi�n Vi�n ��u",0,102,8818},{"Hi�n Vi�n ��u",0,102,8820}},
	[14] = {{"Hi�n Vi�n ��u",0,102,8818}},
	[15] = {{"Hi�n Vi�n ��u",0,102,8820}},
	[16] = {{"Hi�n Vi�n ��u",0,102,8822},{"Hi�n Vi�n ��u",0,102,8824}},
	[17] = {{"Hi�n Vi�n ��u",0,102,8822}},
	[18] = {{"Hi�n Vi�n ��u",0,102,8824}},
	[19] = {{"Hi�n Vi�n ��u",0,102,8826},{"Hi�n Vi�n ��u",0,102,8828}},
	[20] = {{"Hi�n Vi�n ��u",0,102,8826}},
	[21] = {{"Hi�n Vi�n ��u",0,102,8828}},
}

--���ĸ����ӵĽ���
tBoxAward = {
	{{"Th� k� ni�m V� L�m 2 tr�n 2 n�m",2,0,1081,1},{1,4,70,1,4,100},{"Nguy�t Hoa ",2,1,2002,1,10},{"H�p ��ng B�i Huy Ho�ng",2,0,1077,1,1000},{"Hi�n Vi�n Chi�n",5}},
	{{"Th� k� ni�m V� L�m 2 tr�n 2 n�m",2,0,1081,5},{1,5,70,1,5,100},{"Nguy�t Hoa ",2,1,2002,1,50},{"H�p Ng�n B�i Vinh D�",2,0,1078,1,500},{"Hi�n Vi�n Chi�n",10}},
	{{"Th� k� ni�m V� L�m 2 tr�n 2 n�m",2,0,1081,50},{3,5,70,3,6,100},{"Nguy�t Hoa ",2,1,2002,2,200},{"H�p Kim B�i Vinh D�",2,0,1079,1,500},{"Hi�n Vi�n Chi�n",100,"Hi�n Vi�n ��u",200}},
	{{"Th� k� ni�m V� L�m 2 tr�n 2 n�m",2,0,1081,100},{4,5,70,4,7,100},{"Nguy�t Hoa ",2,1,2002,3,500},{"Hi�n Vi�n Chi�n",1000,"Hi�n Vi�n ��u",2000,"Ho�ng �� v� kh�",3000}}
	}

--���Ӽ�Ʒ�����볣�����
tBoxProb = {{20,950000},{100,950000},{10000,950000},{150000,1000000}};

--���ӳ�����ʷֲ� ��������
tBoxChangGui = {{800,990,991,1000},{800,990,995,1000},{960,980,1000},{700,850,1000}};

--������ ��Ӧ�ϱ����
tBoxTie = {{{"C�i ��",2,1,1090}},{{"Thi�n Th�i Ch� Gi�i ",2,1,3210}},{{"Ng� H�nh M�t t�ch",0,107,155}},{{"B�o r��ng T�ng Ki�m ��u qu�n",2,1,1059},{"B�o r��ng T�ng Ki�m y gi�p",2,1,1060},{"B�o r��ng T�ng Ki�m hoa kh�",2,1,1061},{"B�o r��ng T�ng Ki�m trang s�c",2,1,1062},{"B�o r��ng T�ng Ki�m v� kh�",2,1,1063}}};

--ͭ����
tBoxTong = {{{"M�t h�m s� m�n",2,1,1020}},{{"Thi�n Th�i Ch� Gi�i ",2,1,3210}},{{"Ng� H�nh M�t t�ch",0,107,155}},{{"B�o r��ng T�ng Ki�m ��u qu�n",2,1,1059},{"B�o r��ng T�ng Ki�m y gi�p",2,1,1060},{"B�o r��ng T�ng Ki�m hoa kh�",2,1,1061},{"B�o r��ng T�ng Ki�m trang s�c",2,1,1062},{"B�o r��ng T�ng Ki�m v� kh�",2,1,1063}}};

function Get_3festival_State()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 080911 and nDate <= 081007 then	--9��11��10��7��
		return 1;
	else
		return 0;
	end;
end;
--�ж�����̨�������ϣ���Ȫ�ݵĻ��ͷ���1�����꾩�Ļ��ͷ���2���ڳɶ��Ļ��ͷ���3���������������򷵻�100
function Get_Server_Index()
	if SubWorldID2Idx(100) >= 0 then
		return 1;
	elseif SubWorldID2Idx(200) >= 0 then
		return 2;
	elseif SubWorldID2Idx(300) >= 0 then
		return 3;
	else
		return 100;
	end;
end;
--�õ������ĳһ����ľ���
function Get_Distance(nX,nY)
	local _,nPosX,nPosY = GetWorldPos();
	local nDis = floor(sqrt((nPosX-nX)^2+(nPosY-nY)^2));
	return nDis;
end;
--�õ�������ý���������������Ƿ���ֵ����Ӧ�������
--  0:��ʾ��û���й���������
--  1:��ʾ���ý�������Ϊ1
-- 10:��ʾ���ý�������Ϊ2
-- 11:��ʾ���ý�������Ϊ3
--100:��ʾ����ȡ������
function Get_Award_State()
	local nExtPoint0 = GetExtPoint(0);
	local nResult = 0;
	for i=3,5 do 
		nResult = nResult + GetBit(nExtPoint0,i)*(10^(i-3));
	end;
	return nResult;
end;
--�������ϡ����Ϻ��¶ȸ�һ���±����
function Give_MoonCake(nMainRes,nSubRes,nCurTemp)
	if nCurTemp <= 0 or nMainRes > 3 or nMainRes < 1 or nSubRes > 3 or nSubRes < 1 then
		WriteLog("[L�i Tam ti�t li�n th�ng]: L�i tham s� nh�p v�o trong h�m s� Give_MoonCake, tham s� nh�p v�o l�:"..nMainRes..","..nSubRes..","..nCurTemp);
		return 0;
	end;
	local nCakeIndex = 0;
	local nRand = random(1,100);
	local nTempIndex = 0;
	local nRetCode = 0;
	for i=getn(tMappingTemp),1,-1 do
		if nCurTemp >= tMappingTemp[i] then
			nTempIndex = i;	--�õ��¶�����
			break;
		end;
	end;
	local nTabSize = getn(tMappingMoonCake[nMainRes][nSubRes][nTempIndex]);
	if mod(nTabSize,2) ~= 0 then
		WriteLog("[L�i Tam ti�t li�n th�ng]: Lo�i b�nh l�n nh� table l� s� l�");
		nCakeIndex = 1;
	else
		for i=1,nTabSize/2 do
			if nRand <= tMappingMoonCake[nMainRes][nSubRes][nTempIndex][i*2] then
				nCakeIndex = tMappingMoonCake[nMainRes][nSubRes][nTempIndex][i*2-1];
				break;
			end;
		end;
	end;
	nRetCode = AddItem(tMoonCake[nCakeIndex][2],tMoonCake[nCakeIndex][3],tMoonCake[nCakeIndex][4],1);
	if nRetCode == 1 then
		Say("Khi nhi�t �� b�p c�a b�n ��t <color=yellow>"..nCurTemp.."<color> �� m� b�p, b�n nh�n ���c 1 <color=yellow>"..tMoonCake[nCakeIndex][1].."<color>!",0);
		WriteLog("[Tam ti�t li�n th�ng]:"..GetName().."Nh�n ���c 1 c�i b�nh Trung Thu, m� s� b�nh Trung Thu:"..nCakeIndex);
	else
		WriteLog("[L�i Tam ti�t li�n th�ng]:"..GetName().."L�i tr� quay l�i AddItem khi nh�n b�nh Trung Thu, tr� s� l�i:"..nRetCode);
	end;
end;

function Msg2_LeiTai(szItemName)
	Msg2MSAll(4,GetName().."S� d�ng 1	"..szItemName);
	Msg2MSAll(23,GetName().."S� d�ng 1	"..szItemName);
	Msg2MSAll(29,GetName().."S� d�ng 1	"..szItemName);
	Msg2MSAll(30,GetName().."S� d�ng 1	"..szItemName);
end;

--�������ƣ���Ʒ��Ӽ�麯��
--��        �ܣ��Ե�ǰ��ҿɷ����������Ʒ���м��
--�峤 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
	if GetFreeItemRoom() < goods_num then
		Talk (1,"","<color=red>kho�ng tr�ng<color> trong h�nh trang kh�ng ��!")
		return 0
	elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--�ж���Ҹ��غͿռ�
		Talk (1,"","<color=red>S�c l�c<color> c�a b�n kh�ng ��!")
		return 0
	else 
		return 1
	end
end

function nothing()

end;

