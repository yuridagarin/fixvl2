
DEBUG_VERSION = 0;	--1��ʾ���԰汾��0��ʾ���������汾
IB_VERSION = 1		--1��ʾ���������0��ʾ�շ���
--============================================================================
g_szInfoHead = "<color=green>��c s� ��i H�i V� l�m<color>:"
--============================================================================
GAME_ID_GUESS = 1;	--��ϷID
GAME_ID_BOX = 2;
GAME_ID_LIGHT = 3;
--============================================================================
g_tbGameName = 
{
	[GAME_ID_GUESS] = "Thi�n C� Th�n To�n",
	[GAME_ID_BOX] = "�o�t B�o K� Binh",
	[GAME_ID_LIGHT] = "�i�m ��ng H�i",
}
--============================================================================
g_tbGameSchedule =
{
	[0] = {"�i�m ��ng H�i",GAME_ID_LIGHT},
	[1] = {"Thi�n C� Th�n To�n",GAME_ID_GUESS},
	[2] = {"�o�t B�o K� Binh",GAME_ID_BOX},
	[3] = {"Thi�n C� Th�n To�n",GAME_ID_GUESS},
	[4] = {"�o�t B�o K� Binh",GAME_ID_BOX},
	[5] = {"Thi�n C� Th�n To�n",GAME_ID_GUESS},
	[6] = {"�o�t B�o K� Binh",GAME_ID_BOX},
}
--============================================================================
g_nGameBeginDate = 20081113;	--������Ϸ��ʼʱ��
g_nGameEndDate = 20090107;		--������Ϸ����ʱ��
g_nAwardEndDate = 20090114;		--���ֻ���������ʱ��
g_nQiXiBeginDate = 20080807;	--��Ϧ���ʼʱ��
g_nQiXiEndDate = 20080809;		--��Ϧ�����ʱ��
g_nEquipPoint = 20;				--25���ֻ�һ��װ��
g_nJifenMax = 200;        --����ۻ�200����
g_nExpNum = 21;				--ÿ�ܻ�ȡ�ľ������
g_nBoxNum = 100;      --���侭��ֻ�ܻ���������

g_nYearsBeginDate = 20081118;  --��ʮ������ƺ���ȡ��ʼʱ��
g_nYearsEndDate = 20081124;    --�ƺ���ȡ����ʱ��
g_nYearsDays = 7;              --�������ʱ�䣺��
g_nYearsExpNums = 60;          --ÿ����Ч�����������

--============================================================================
g_tbAward = 	--������Ϣ
{--��������   �շ�    	���
--		��������,���� 	���� ��λ����  ��ʯ�������� ����
	[1] = {{400,200},	{500},			6,			5},
	[2] = {{400,100},	{420},			5,			4},
	[3] = {{350,100},	{380},			4,			3},
	[4] = {{300,100},	{350},			3,			2},
	[5] = {{250,100},	{300},			2,			1},
}
g_tbTitleName = 
{
	[GAME_ID_GUESS] = "Thi�n C� Th�n To�n",
	[GAME_ID_BOX] = "�o�t B�o K� Binh",
	[GAME_ID_LIGHT] = "Hoa ��ng v��ng",
};
--�������1986-1987=====================================================================
TSK_WEAPON_TYPE = 1987;					--�����������׼����ˡ���¼ѡ����ǵ����ǹ�
TSK_AOYUN_GET_TICKET_DATE = 1989;		--��¼��ȡ�����Ʊ������
TSK_AOYUN_POINT = 1351;					--��¼�����
TSK_AOYUN_AWARD_WEEK = 1361;      --��¼�ܵ�����
TSK_AOYUN_EXP_NUM = 1353;         --��ȡ����Ĵ��� ÿ��һ��
TSK_AOYUN_BOX_NUM = 1354;         --���俪���������
TSK_AOYUN_YI_EXP = 1355;          --1�ھ���ÿ��ֻ��1��
TSK_YEARS_BEGIN_DATE = 1357;      --��ʮ������ƺ���ȡ��ʼʱ�� 
TSK_YEARS_END_DATE = 1358;        --��ʮ������ƺ���ȡ����ʱ��
TSK_YEARS_EXP_DATE = 1359;        --�����Ƿ������˾���
TSK_YEARS_EXP_NUM = 1360;         --������˶��ٴξ���

tJifenAward = {
	[10] = {"R��ng k� ni�m 20 n�m",2,0,1085,1,2000000},
	[50] = {"R��ng k� ni�m 20 n�m",2,0,1085,8,5000000},
	[200] = {"R��ng k� ni�m 20 n�m",2,0,1085,35,10000000}
};

tMijiName = {
		{"T� Linh Chi�n � Ph�",0,107,159},
		{"T� Linh Thi�n � Ph�",0,107,160},
		{"T� Linh T� � Ph�",0,107,161}
};

tGaojiMiji = {
	[0] = {{"Kim Cang B�t Nh� Kinh",0,107,166},{"V� Tr�n B� �� Kinh",0,107,168},{"Ti�m Long T�ch Di�t Kinh",0,107,167},{"Thi�n La Li�n Ch�u L�c",0,107,169},{"Nh� � Kim ��nh M�t T�ch",0,107,170},{"B�ch H�i Tuy�t �m Ph�",0,107,171},{"H�n ��n Tr�n Nh�c M�t T�ch",0,107,172},{"Qu� Thi�n Du Long M�t T�ch",0,107,173},{"Huy�n �nh M� Tung M�t T�ch",0,107,174},{"Qu�n T� Ti�t Phong M�t T�ch",0,107,175},{"Tr�n Qu�n Phi Long Th��ng Ph�",0,107,176},{"Xuy�n V�n L�c H�ng M�t T�ch",0,107,177},{"U Minh Phong Ma L�c",0,107,178},{"Linh C� Huy�n T� L�c",0,107,179}},
	[1] = {{"Kim Cang B�t Nh� Kinh",0,107,166},{"V� Tr�n B� �� Kinh",0,107,168},{"Ti�m Long T�ch Di�t Kinh",0,107,167}},
	[2] = {{"Kim Cang B�t Nh� Kinh",0,107,166}},
	[3] = {{"V� Tr�n B� �� Kinh",0,107,168}},
	[4] = {{"Ti�m Long T�ch Di�t Kinh",0,107,167}},
	[5] = {{"Thi�n La Li�n Ch�u L�c",0,107,169}},
	[6] = {{"Thi�n La Li�n Ch�u L�c",0,107,169}},
	[7] = {{"Nh� � Kim ��nh M�t T�ch",0,107,170},{"B�ch H�i Tuy�t �m Ph�",0,107,171}},
	[8] = {{"Nh� � Kim ��nh M�t T�ch",0,107,170}},
	[9] = {{"B�ch H�i Tuy�t �m Ph�",0,107,171}},
	[10] = {{"H�n ��n Tr�n Nh�c M�t T�ch",0,107,172},{"Qu� Thi�n Du Long M�t T�ch",0,107,173}},
	[11] = {{"H�n ��n Tr�n Nh�c M�t T�ch",0,107,172}},
	[12] = {{"Qu� Thi�n Du Long M�t T�ch",0,107,173}},
	[13] = {{"Huy�n �nh M� Tung M�t T�ch",0,107,174},{"Qu�n T� Ti�t Phong M�t T�ch",0,107,175}},
	[14] = {{"Huy�n �nh M� Tung M�t T�ch",0,107,174}},
	[15] = {{"Qu�n T� Ti�t Phong M�t T�ch",0,107,175}},
	[16] = {{"Tr�n Qu�n Phi Long Th��ng Ph�",0,107,176},{"Xuy�n V�n L�c H�ng M�t T�ch",0,107,177}},
	[17] = {{"Tr�n Qu�n Phi Long Th��ng Ph�",0,107,176}},
	[18] = {{"Xuy�n V�n L�c H�ng M�t T�ch",0,107,177}},
	[19] = {{"U Minh Phong Ma L�c",0,107,178},{"Linh C� Huy�n T� L�c",0,107,179}},
	[20] = {{"U Minh Phong Ma L�c",0,107,178}},
	[21] = {{"Linh C� Huy�n T� L�c",0,107,179}},
	[23] = {{"C�u Thi�n Phong L�i Quy�t",0,107,198}},	
	[29] = {{"H�ng Tr�n T�y M�ng Ph�",0,107,202}},
	[30] = {{"Phong Hoa Thi�n Di�p Ph�",0,107,203}},	
};

tItemName = {
	{"B�ch Ngh�a",0,105,49},
	{"Hi�p D�c",0,105,50},
	{"Chi�n M� Nguy�n So�i cao c�p (tr�ng)",0,105,51},
	{"Chi�n M� Nguy�n So�i cao c�p (�en)",0,105,52},
	{"Thi�n Qu�i Th�ch",2,0,1084},
	{"R��ng k� ni�m 20 n�m",2,0,1085},
	{"Ch�a kh�a ��ng k� ni�m",2,0,1086},
	{"Ch�a kh�a b�c k� ni�m",2,0,1087},
	{"Ch�a kh�a v�ng k� ni�m",2,0,1088},
	{"T�ch l�y b�i",2,0,1089},
	{"H��ng d�n ho�t ��ng k� ni�m 20 n�m",2,0,1090},
	{"��nh H�n Thi�n Th�ch Th�n Th�ch",2,1,1067},
	{"Thi�n Th�ch linh th�ch",2,1,1068},
	{"M�nh Thi�n th�ch",2,2,7},
	{"Thi�n th�ch",2,2,8},
	{"Huy Ho�ng Chi Th�y",0,102,8840},
	{"Vinh D� Chi Th�y",0,102,8841}
};

tAwardGailvIB = { --���
	{12,120,30,12,30,6},
	{60,600,150,60,150,30},
	{1200,10000,3000,1200,3000,600}
};

tAwardGailv = { --�շ�
	{12,120,30,12,60,6},
	{60,600,150,60,300,30},
	{1200,10000,3000,1200,6000,600}
};

tYearsExp = {--ÿ�θ������ྭ�飬����IB_VERSIONΪ����
	[0] = {1420226},
	[1] = {676188}
};
