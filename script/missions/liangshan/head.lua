Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\missions\\liangshan\\string_liangshan.lua")
Include("\\script\\lib\\globalfunctions.lua");
--2011008����
Include("\\script\\online_activites\\award.lua")

--201207���˻
Include("\\script\\online\\olympic\\oly_head.lua")

--׷����������ս
Include("\\script\\online\\dazitie\\dzt_head.lua")

Include("\\script\\missions\\liangshan\\runtime_data_stat.lua")
Include("\\script\\missions\\liangshan\\npc\\box_jingli.lua")

Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")

--=================
do return end
LS_EXP_ADD_RATE = min(VNG_CFG_LS_EXP_EXT_ADD_RATE or 0, 2) --����ӳ�ϵ��
T_ROUTE_CNT_EXP_ADD_RATE = {
	0,0,0,0,0.2,0.4,0.6,1
}
function getRouteCount()
	local tRoute = {}
	local nRouteCnt = 0
	local OldPlayerIndex = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if PlayerIndex > 0 then
			local nRoute = GetPlayerRoute();
			if not tRoute[nRoute] then
				tRoute[nRoute] = 1
				nRouteCnt = nRouteCnt + 1
			end
		end
	end
	PlayerIndex = OldPlayerIndex
	return nRouteCnt
end
--ÿ�ؾ��齱��
T_LS_AWARD_EXP_STAGE = {
	[1] = 2000000,
	[2] = 2500000,
	[3] = 3000000,
	[4] = 3500000,
	[5] = 4000000,
	[6] = 4000000,
	[7] = 4000000,
	[8] = 4500000,
}

--===�峤��2011-2-18���������ļ���ز���
Include("\\script\\class\\ktabfile.lua")
LUONGSON_LOG_TITLE = "Vuot ai Luong Son Bac"
--�����ļ���Ϣ
SZ_INI_FILE_WAY = "\\settings\\missions\\liangshan\\liangshan.ini"
g_objLSRule = ff_GetIniFileObj(SZ_INI_FILE_WAY)
if g_objLSRule:Open() ~= 1 then
	gf_WriteLog("SystemError","load ini file error! file path:"..SZ_INI_FILE_WAY)
end
--�ؼ�����Ϣ
IniPosKey="pos_info"				--ȡ�������õĹؼ���
IniLoginQuanliKey="login_quanli"	--���������ؼ���
IniItemKey="item_info"				--��Ʒ��Ϣ
IniMissionKey="mission_info"		--�ؿ��ؼ�����Ϣ
IniStage1Key="stage1_rule"			--�ؿ�����ؼ���
IniPrizeChgKey="prize_change"		--�����һ�����
--����������Ϣ
NTeamMemberMin = g_objLSRule:GetNum(IniLoginQuanliKey,"TeamMemberMin")
NPlayerLevelMin = g_objLSRule:GetNum(IniLoginQuanliKey,"PlayerLevelMin")
TTGLInfo = g_objLSRule:GetMixTable(IniItemKey,"TianGangLing")
TJYLInfo = g_objLSRule:GetMixTable(IniItemKey,"JuYiLing")
LSTaskBag1 = g_objLSRule:GetMixTable(IniItemKey,"LsPrizeBag1")
LSTaskBag2 = g_objLSRule:GetMixTable(IniItemKey,"LsPrizeBag2")
LSTaskBag3 = g_objLSRule:GetMixTable(IniItemKey,"LsPrizeBag3")
TStageBaseInfo =g_objLSRule:GetNumTable(IniPosKey,"StageBasePos")
	--������ʯ��Ʒ��Ϣ
LsPrizeWXXS = g_objLSRule:GetMixTable(IniItemKey,"LsPrizeWXXS")
	--��Ʒ�һ���Ϣ
TJiuzhouChgInfo = g_objLSRule:GetMixTable(IniPrizeChgKey,"JiuzhouSets")
TXuanyuanChgInfo = g_objLSRule:GetMixTable(IniPrizeChgKey,"XuanyuanSets")
TOthersChgInfo = {
	g_objLSRule:GetMixTable(IniPrizeChgKey,"OtherItems1"),
	g_objLSRule:GetMixTable(IniPrizeChgKey,"OtherItems2"),
}
nWXXSGetEveryDayMax = g_objLSRule:GetNum(IniPrizeChgKey,"WXXSGetEveryDayMax")
--===end
g_RealMapId = 6007;		--ԭ��ͼid
MISSION_ID	= 55;		--MISSION_ID��Ҫ����
TIMER_ID	= 85;		--������ID
ALL_CAMP	= 0;
DAY_SECOND_NUM = 24*3600

--��½�ؿ�����
entryPos = g_objLSRule:GetNumTable(IniPosKey,"EnterMsPos")
--�뿪�ؿ�����
local LeavePos = g_objLSRule:GetNumTable(IniPosKey,"LeaveMsPos")
returnPos = {
	[LeavePos[1][1]] = {LeavePos[1][2], LeavePos[1][3]},
	[LeavePos[2][1]] = {LeavePos[2][2], LeavePos[2][3]},
	[LeavePos[3][1]] = {LeavePos[3][2], LeavePos[3][3]},
}
--����װ��
TJiuzhouHead = {
	{
		{"Long ��ng T� H�i Qu�n",0,103,3056,0},{"Long ��ng T� H�i Qu�n",0,103,3057,0},{"Long ��ng T� H�i Qu�n",0,103,3058,0},{"Long ��ng T� H�i Qu�n",0,103,3059,0}
	},{
		{"Ph�ng V� C�u Thi�n Qu�n",0,103,3060,0},{"Ph�ng V� C�u Thi�n Qu�n",0,103,3061,0},{"Ph�ng V� C�u Thi�n Qu�n",0,103,3062,0},{"Ph�ng V� C�u Thi�n Qu�n",0,103,3063,0}
	}
}
TJiuzhouCloth = {
	{
		{"Long ��ng T� H�i Y",0,100,3056,0},{"Long ��ng T� H�i Y",0,100,3057,0},{"Long ��ng T� H�i Y",0,100,3058,0},{"Long ��ng T� H�i Y",0,100,3059,0}
	},{
		{"Ph�ng V� C�u Thi�n Y",0,100,3060,0},{"Ph�ng V� C�u Thi�n Y",0,100,3061,0},{"Ph�ng V� C�u Thi�n Y",0,100,3062,0},{"Ph�ng V� C�u Thi�n Y",0,100,3063,0}
	}
}
TJiuzhouShoes = {
	{
		{"Long ��ng T� H�i Trang",0,101,3056,0},{"Long ��ng T� H�i Trang",0,101,3057,0},{"Long ��ng T� H�i Trang",0,101,3058,0},{"Long ��ng T� H�i Trang",0,101,3059,0}
	},{
		{"Ph�ng V� C�u Thi�n Trang",0,101,3060,0},{"Ph�ng V� C�u Thi�n Trang",0,101,3061,0},{"Ph�ng V� C�u Thi�n Trang",0,101,3062,0},{"Ph�ng V� C�u Thi�n Trang",0,101,3063,0}
	}
}

THaoNguyet_need = 
{
	[1] = {2, "1 N�n Tinh Kh�c, 1 N�n Thi�n Ngh�a", {{0,103,3033,1},{0,103,3039,1},{0,103,3045,1},{0,103,3051,1},{0,103,3036,1},{0,103,3042,1},{0,103,3048,1},{0,103,3054,1}},{{0,103,3034,1},{0,103,3040,1},{0,103,3046,1},{0,103,3052,1},{0,103,3037,1},{0,103,3043,1},{0,103,3049,1},{0,103,3055,1}}},
	[2] = {2, "1 �o Tinh Kh�c, 1 �o Thi�n Ngh�a", {{0,100,3033,1},{0,100,3039,1},{0,100,3045,1},{0,100,3051,1},{0,100,3036,1},{0,100,3042,1},{0,100,3048,1},{0,100,3054,1}},{{0,100,3034,1},{0,100,3040,1},{0,100,3046,1},{0,100,3052,1},{0,100,3037,1},{0,100,3043,1},{0,100,3049,1},{0,100,3055,1}}},
	[3] = {2, "1 Qu�n Tinh Kh�c, 1 Qu�n Thi�n Ngh�a", {{0,101,3033,1},{0,101,3039,1},{0,101,3045,1},{0,101,3051,1},{0,101,3036,1},{0,101,3042,1},{0,101,3048,1},{0,101,3054,1}},{{0,101,3034,1},{0,101,3040,1},{0,101,3046,1},{0,101,3052,1},{0,101,3037,1},{0,101,3043,1},{0,101,3049,1},{0,101,3055,1}}},
	[4] = {2, "1Trang S�c Tinh Kh�c, 1 Trang S�c Thi�n Ngh�a", {{0,102,3121,1},{0,102,3124,1},{0,102,3127,1},{0,102,3130,1},{0,102,3133,1},{0,102,3122,1},{0,102,3125,1},{0,102,3128,1},{0,102,3131,1},{0,102,3134,1}}, {}},
	[5] = {2, "1 V� Kh� Tinh Kh�c, 1 V� Kh� Thi�n Ngh�a", {{0,0,8874,1},{0,0,8875,1},{0,1,8879,1},{0,2,8884,1},{0,2,8885,1},{0,3,8892,1},{0,4,8897,1},{0,5,8900,1},{0,6,8903,1},{0,7,8906,1},{0,8,8909,1},{0,9,8913,1},{0,10,8918,1},{0,11,8922,1},{0,0,8876,1},{0,0,8877,1},{0,1,8880,1},{0,2,8887,1},{0,2,8888,1},{0,3,8894,1},{0,4,8898,1},{0,5,8901,1},{0,6,8904,1},{0,7,8907,1},{0,8,8910,1},{0,9,8915,1},{0,10,8919,1},{0,11,8924,1},{0,2,8886,1},{0,13,8930,1},{0,12,8927,1},{0,2,8889,1},{0,13,8931,1},{0,12,8928,1}}, {}},
}

THaoNguyet_suc = 
{
	[1] = 
			{	
				[2] = {"H�o Nguy�t - N�n Thi�u L�m T�c", {{0,103,3064, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3065, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[3] = {"H�o Nguy�t - N�n Thi�u L�m Thi�n", {{0,103,3068, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3069, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[4] = {"H�o Nguy�t - N�n Thi�u L�m V�", {{0,103,3066, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3067, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[6] = {"H�o Nguy�t - N�n ���ng M�n", {{0,103,3070, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3071, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3072, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3073, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[8] = {"H�o Nguy�t - N�n Nga My Ph�t", {" ", " ", {0,103,3074, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3075, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[9] = {"H�o Nguy�t - N�n Nga My T�c", {" ", " ", {0,103,3076, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3077, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[11] = {"H�o Nguy�t - N�n C�i Bang T�nh", {{0,103,3078, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3079, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3080, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3081, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[12] = {"H�o Nguy�t - N�n C�i Bang �", {{0,103,3082, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3083, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3084, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3085, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[14] = {"H�o Nguy�t - N�n V� �ang ��o", {{0,103,3086, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3087, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3088, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3089, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[15] = {"H�o Nguy�t - N�n V� �ang T�c", {{0,103,3090, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3091, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3092, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3093, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[17] = {"H�o Nguy�t - N�n D��ng M�n Th��ng", {{0,103,3094, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3095, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3096, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3097, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[18] = {"H�o Nguy�t - N�n D��ng M�n Cung", {{0,103,3098, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3099, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3100, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3101, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[20] = {"H�o Nguy�t - N�n Hi�p ��c", {{0,103,3102, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3103, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3104, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3105, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[21] = {"H�o Nguy�t - N�n T� ��c", {{0,103,3106, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3107, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3108, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3109, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[23] = {"H�o Nguy�t - N�n C�n L�n", {{0,103,3110, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3111, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[29] = {"H�o Nguy�t - N�n Th�y Y�n V� Ti�n", {" ", " ", {0,103,3124, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3125, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[30] = {"H�o Nguy�t - N�n Th�y Y�n Linh N�", {" ", " ", {0,103,3126, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3127, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
			},
	[2] = 
			{	
				[2] = {"H�o Nguy�t - Thi�u L�m T�c", {{0,100,3064, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3065, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[3] = {"H�o Nguy�t - Thi�u L�m Thi�n", {{0,100,3068, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3069, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[4] = {"H�o Nguy�t - Thi�u L�m V�", {{0,100,3066, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3067, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[6] = {"H�o Nguy�t - ���ng M�n", {{0,100,3070, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3071, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3072, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3073, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[8] = {"H�o Nguy�t - Nga My Ph�t", {" ", " ", {0,100,3074, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3075, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[9] = {"H�o Nguy�t - Nga My T�c", {" ", " ", {0,100,3076, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3077, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[11] = {"H�o Nguy�t - C�i Bang T�nh", {{0,100,3078, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3079, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3080, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3081, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[12] = {"H�o Nguy�t - C�i Bang �", {{0,100,3082, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3083, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3084, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3085, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[14] = {"H�o Nguy�t - V� �ang ��o", {{0,100,3086, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3087, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3088, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3089, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[15] = {"H�o Nguy�t - V� �ang T�c", {{0,100,3090, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3091, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3092, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3093, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[17] = {"H�o Nguy�t - D��ng M�n Th��ng", {{0,100,3094, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3095, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3096, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3097, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[18] = {"H�o Nguy�t - D��ng M�n Cung", {{0,100,3098, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3099, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3100, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3101, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[20] = {"H�o Nguy�t - Hi�p ��c", {{0,100,3102, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3103, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3104, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3105, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[21] = {"H�o Nguy�t - T� ��c", {{0,100,3106, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3107, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3108, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3109, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[23] = {"H�o Nguy�t - C�n L�n", {{0,100,3110, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3111, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[29] = {"H�o Nguy�t - Th�y Y�n V� Ti�n", {" ", " ", {0,100,3124, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3125, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[30] = {"H�o Nguy�t - Th�y Y�n Linh N�", {" ", " ", {0,100,3126, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3127, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
			},
	[3] = 
			{	
				[2] = {"H�o Nguy�t - Trang Thi�u L�m T�c", {{0,101,3064, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3065, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[3] = {"H�o Nguy�t - Trang Thi�u L�m Thi�n", {{0,101,3068, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3069, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[4] = {"H�o Nguy�t - Trang Thi�u L�m V�", {{0,101,3066, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3067, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[6] = {"H�o Nguy�t - Trang ���ng M�n", {{0,101,3070, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3071, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3072, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3073, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[8] = {"H�o Nguy�t - Trang Nga My Ph�t", {" ", " ", {0,101,3074, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3075, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[9] = {"H�o Nguy�t - Trang Nga My T�c", {" ", " ", {0,101,3076, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3077, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[11] = {"H�o Nguy�t - Trang C�i Bang T�nh", {{0,101,3078, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3079, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3080, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3081, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[12] = {"H�o Nguy�t - Trang C�i Bang �", {{0,101,3082, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3083, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3084, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3085, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[14] = {"H�o Nguy�t - Trang V� �ang ��o", {{0,101,3086, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3087, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3088, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3089, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[15] = {"H�o Nguy�t - Trang V� �ang T�c", {{0,101,3090, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3091, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3092, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3093, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[17] = {"H�o Nguy�t - Trang D��ng M�n Th��ng", {{0,101,3094, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3095, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3096, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3097, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[18] = {"H�o Nguy�t - Trang D��ng M�n Cung", {{0,101,3098, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3099, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3100, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3101, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[20] = {"H�o Nguy�t - Trang Hi�p ��c", {{0,101,3102, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3103, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3104, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3105, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[21] = {"H�o Nguy�t - Trang T� ��c", {{0,101,3106, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3107, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3108, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3109, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},	
				[23] = {"H�o Nguy�t - Trang C�n L�n", {{0,101,3110, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3111, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[29] = {"H�o Nguy�t - Trang Th�y Y�n V� Ti�n", {" ", " ", {0,101,3124, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3125, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[30] = {"H�o Nguy�t - Trang Th�y Y�n Linh N�", {" ", " ", {0,101,3126, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3127, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
			},
	[4] = 
	     		{
				[1] = {"TS H�o Nguy�t - X�ch T��c", {0, 102, 3181, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[2] = {"TS H�o Nguy�t - T� Giao", {0, 102, 3177, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[3] = {"TS H�o Nguy�t - V�n H�", {0, 102, 3179, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[4] = {"TS H�o Nguy�t - � L�n", {0, 102, 3175, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[5] = {"TS H�o Nguy�t - B�ch Quy", {0, 102, 3183, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			},
	[5] = 
			{	
				[2] = {"H�o Nguy�t - VK Thi�u L�m T�c", {0, 3, 8972, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[3] = {"H�o Nguy�t - VK Thi�u L�m Thi�n", {0, 8, 8974, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[4] = {"H�o Nguy�t - VK Thi�u L�m V�", {0, 0, 8973, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[6] = {"H�o Nguy�t - VK ���ng M�n", {0, 1, 8975, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[8] = {"H�o Nguy�t - VK Nga My Ph�t", {0, 2, 8976, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[9] = {"H�o Nguy�t - VK  Nga My T�c", {0, 10, 8977, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[11] = {"H�o Nguy�t - VK C�i Bang T�nh", {0, 0, 8978, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[12] = {"H�o Nguy�t - VK C�i Bang �", {0, 5, 8979, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[14] = {"H�o Nguy�t - VK V� �ang ��o", {0, 2, 8980, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[15] = {"H�o Nguy�t - VK V� �ang T�c", {0, 9, 8981, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[17] = {"H�o Nguy�t - VK D��ng M�n Th��ng", {0, 6, 8982, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[18] = {"H�o Nguy�t - VK D��ng M�n Cung", {0, 4, 8983, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[20] = {"H�o Nguy�t - VK Hi�p ��c", {0, 7, 8984, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[21] = {"H�o Nguy�t - VKT� ��c", {0, 11, 8985, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[23] = {"H�o Nguy�t - VKC�n L�n", {0, 2, 8986, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[29] = {"H�o Nguy�t - VKV� Ti�n", {0, 13, 8990, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[30] = {"H�o Nguy�t - VKLinh N�", {0, 12, 8991, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			},
}


tItem_need = 
{
	[1] = {30000000, 500, 250},
	[2] = {30000000, 500, 250},
	[3] = {30000000, 500, 250},
	[4] = {50000000, 700, 350},
	[5] = {40000000, 600, 300},
}

TJiuzhouWeapon = {
	[2]={"C�u Ch�u-L�u Ly Gi�i �ao",0,3,8932,0,670,1},
	[3]={"C�u Ch�u-Kinh L�i Thi�n Tr��ng",0,8,8934,0,672,1},
	[4]={"C�u Ch�u-L�i �m Nang Th�",0,0,8933,0,672,1},
	[6]={"C�u Ch�u-�m D��ng Xuy�n �nh",0,1,8935,0,671,1},
	[8]={"C�u Ch�u-T� H�n �m Ki�m",0,2,8936,0,672,1},
	[9]={"C�u Ch�u-C�u Ho�n B�i C�m",0,10,8937,0,672,1},
	[11]={"C�u Ch�u-Quy L�n H� Th�",0,0,8938,0,670,1},
	[12]={"C�u Ch�u-Tr�n Ng�o C�n",0,5,8939,0,671,1},
	[14]={"C�u Ch�u-Thu�n Phong Ki�m",0,2,8940,0,672,1},
	[15]={"C�u Ch�u-Tinh ��u Chuy�n B�t",0,9,8941,0,673,1},
	[17]={"C�u Ch�u-Ph� Qu�n Tr�n Th��ng",0,6,8942,0,670,1},
	[18]={"C�u Ch�u-Truy M�nh Cung",0,4,8943,0,671,1},
	[20]={"C�u Ch�u-Thi�p C�t Huy�t �ao",0,7,8944,0,671,1},
	[21]={"C�u Ch�u-Luy�n H�n Huy�t Tr�o",0,11,8945,0,673,1},
	[23]={"C�u Ch�u-Ng� Thi�n Phong Ki�m",0,2,8946,0,672,1},
	[25]={"C�u Ch�u-Th�n Di�m Thi�n �ao",0,3,8947,0,670,1,1},
	[26]={"C�u Ch�u-Th�n Phong Ph�n B�t",0,9,8948,0,673,1},
	[27]={"C�u Ch�u-Th�n Linh Ch� Tr�o",0,11,8949,0,671,1},
	[29]={"C�u Ch�u-Linh Lung Chi",0,13,8950,0,671,1},
	[30]={"C�u Ch�u-C�u Ti�u S�o",0,12,8951,0,673,1},
}
TJiuzhouRing = {
	{
		[2] = {"C�u Ch�u-Ng�ng Ng�c Th� Ho�n",0,102,3135,},
		[3] = {"C�u Ch�u-Ng�ng Ng�c Th� Ho�n",0,102,3137,},
		[4] = {"C�u Ch�u-Nguy�t Hoa Th�y B�i",0,102,3139,},
		[6] = {"C�u Ch�u-Ph� Th�y M�c ��i",0,102,3141,},
		[8] = {"C�u Ch�u-Ng�ng Ng�c Th� Ho�n",0,102,3143,},
		[9] = {"C�u Ch�u-Ph� Th�y M�c ��i",0,102,3145,},
		[11] = {"C�u Ch�u-Ng�ng Ng�c Th� Ho�n",0,102,3147,},
		[12] = {"C�u Ch�u-Ph� Th�y M�c ��i",0,102,3149,},
		[14] = {"C�u Ch�u-Nguy�t Hoa Th�y B�i",0,102,3151,},
		[15] = {"C�u Ch�u-C�u �u H�a Gi�i",0,102,3153,},
		[17] = {"C�u Ch�u-Ng�ng Ng�c Th� Ho�n",0,102,3155,},
		[18] = {"C�u Ch�u-Ph� Th�y M�c ��i",0,102,3157,},
		[20] = {"C�u Ch�u-Ph� Th�y M�c ��i",0,102,3159,},
		[21] = {"C�u Ch�u-C�u �u H�a Gi�i",0,102,3161,},
		[23] = {"C�u Ch�u-Nguy�t Hoa Th�y B�i",0,102,3163,},
		[25] = {"C�u Ch�u-C�u �u H�a Gi�i",0,102,3165,},
		[26] = {"C�u Ch�u-C�u �u H�a Gi�i",0,102,3167,},
		[27] = {"C�u Ch�u-Ng�ng Ng�c Th� Ho�n",0,102,3169,},
		[29] = {"C�u Ch�u-Ph� Th�y M�c ��i",0,102,3171,},
		[30] = {"C�u Ch�u-Ng�ng Ng�c Th� Ho�n",0,102,3173,},
	},
	{
		[2] = {"C�u Ch�u-Huy�n Th�ch Kim Ng�c",0,102,3136,},
		[3] = {"C�u Ch�u-Nguy�t Hoa Th�y B�i",0,102,3138,},
		[4] = {"C�u Ch�u-Ph� Th�y M�c ��i",0,102,3140,},
		[6] = {"C�u Ch�u-Huy�n Th�ch Kim Ng�c",0,102,3142,},
		[8] = {"C�u Ch�u-Nguy�t Hoa Th�y B�i",0,102,3144,},
		[9] = {"C�u Ch�u-Nguy�t Hoa Th�y B�i",0,102,3146,},
		[11] = {"C�u Ch�u-Huy�n Th�ch Kim Ng�c",0,102,3148,},
		[12] = {"C�u Ch�u-C�u �u H�a Gi�i",0,102,3150,},
		[14] = {"C�u Ch�u-C�u �u H�a Gi�i",0,102,3152,},
		[15] = {"C�u Ch�u-Ph� Th�y M�c ��i",0,102,3154,},
		[17] = {"C�u Ch�u-Huy�n Th�ch Kim Ng�c",0,102,3156,},
		[18] = {"C�u Ch�u-Huy�n Th�ch Kim Ng�c",0,102,3158,},
		[20] = {"C�u Ch�u-Nguy�t Hoa Th�y B�i",0,102,3160,},
		[21] = {"C�u Ch�u-Nguy�t Hoa Th�y B�i",0,102,3162,},
		[23] = {"C�u Ch�u-C�u �u H�a Gi�i",0,102,3164,},
		[25] = {"C�u Ch�u-Huy�n Th�ch Kim Ng�c",0,102,3166,},
		[26] = {"C�u Ch�u-Ph� Th�y M�c ��i",0,102,3168,},
		[27] = {"C�u Ch�u-Ph� Th�y M�c ��i",0,102,3170,},
		[29] = {"C�u Ch�u-Huy�n Th�ch Kim Ng�c",0,102,3172,},
		[30] = {"C�u Ch�u-C�u �u H�a Gi�i",0,102,3174,},
	}
}
TJiuzhouEquip = {
	TJiuzhouHead,TJiuzhouCloth,TJiuzhouShoes,TJiuzhouRing,TJiuzhouWeapon
}
--��ԯװ��
	--��ԯ����
TXuanyuanWeapon = {
	[2] = {{"Hi�n Vi�n To�i V� �ao",0,3,8801},{"Hi�n Vi�n To�i V� C�n",0,5,8802}},
	[3] = {"Hi�n Vi�n C�u Nh� Tr��ng",0,8,8803},
	[4] = {"Hi�n Vi�n H�o Nhi�n Th�",0,0,8804},
	[6] = {"Hi�n Vi�n Gi�i T� Kim",0,1,8805},
	[8] = {"Hi�n Vi�n T� Tinh Ki�m",0,2,8806},
	[9] = {"Hi�n Vi�n Ph�ng Ho�ng C�m",0,10,8807},
	[11] = {"Hi�n Vi�n Ng� Nh�c Th�",0,0,8808},
	[12] = {"Hi�n Vi�n Ph� Thi�n C�n",0,5,8809},
	[14] = {"Hi�n Vi�n H�ng Qu�n Ki�m",0,2,8810},
	[15] = {"Hi�n Vi�n Sinh T� B�t",0,9,8811},
	[17] = {"Hi�n Vi�n Ph� Qu�n Th��ng",0,6,8812},
	[18] = {"Hi�n Vi�n Khai Thi�n Cung",0,4,8813},
	[20] = {"Hi�n Vi�n �m D��ng Nh�n",0,7,8814},
	[21] = {"Hi�n Vi�n U Minh Tr�o",0,11,8815},
	[23] = {"Hi�n Vi�n L�i Minh Ki�m",0,2,8816,},
	[25] = {"Hi�n Vi�n Tr�m Vi�m �ao",0,3,8817,},
	[26] = {"Hi�n Vi�n Quang Minh B�t",0,9,8818,},
	[27] = {"Hi�n Vi�n Ch�  �n Tr�o",0,11,8819,},
	[29] = {"Hi�n Vi�n L�ng Ti�u Phi�n",0,13,8820,},
	[30] = {"Hi�n Vi�n Ph�n Hoa ��ch",0,12,8821,},
}
	--��ԯս
TXuanyuanZhan = {
	[2] = {"Hi�n Vi�n Chi�n",0,102,8801},
	[3] = {"Hi�n Vi�n Chi�n",0,102,8803},
	[4] = {"Hi�n Vi�n Chi�n",0,102,8805},
	[6] = {"Hi�n Vi�n Chi�n",0,102,8807},
	[8] = {"Hi�n Vi�n Chi�n",0,102,8809},
	[9] = {"Hi�n Vi�n Chi�n",0,102,8811},
	[11] = {"Hi�n Vi�n Chi�n",0,102,8813},
	[12] = {"Hi�n Vi�n Chi�n",0,102,8815},
	[14] = {"Hi�n Vi�n Chi�n",0,102,8817},
	[15] = {"Hi�n Vi�n Chi�n",0,102,8819},
	[17] = {"Hi�n Vi�n Chi�n",0,102,8821},
	[18] = {"Hi�n Vi�n Chi�n",0,102,8823},
	[20] = {"Hi�n Vi�n Chi�n",0,102,8825},
	[21] = {"Hi�n Vi�n Chi�n",0,102,8827},
	[23] = {"Hi�n Vi�n Chi�n",0,102,8829},
	[25] = {"Hi�n Vi�n Chi�n",0,102,8831},
	[26] = {"Hi�n Vi�n Chi�n",0,102,8833},
	[27] = {"Hi�n Vi�n Chi�n",0,102,8835},
	[29] = {"Hi�n Vi�n Chi�n",0,102,8837},
	[30] = {"Hi�n Vi�n Chi�n",0,102,8839},
}
	--��ԯ��
TXuanyuangDou = {
	[2] = {"Hi�n Vi�n ��u",0,102,8802},
	[3] = {"Hi�n Vi�n ��u",0,102,8804},
	[4] = {"Hi�n Vi�n ��u",0,102,8806},
	[6] = {"Hi�n Vi�n ��u",0,102,8808},
	[8] = {"Hi�n Vi�n ��u",0,102,8810},
	[9] = {"Hi�n Vi�n ��u",0,102,8812},
	[11] = {"Hi�n Vi�n ��u",0,102,8814},
	[12] = {"Hi�n Vi�n ��u",0,102,8816},
	[14] = {"Hi�n Vi�n ��u",0,102,8818},
	[15] = {"Hi�n Vi�n ��u",0,102,8820},
	[17] = {"Hi�n Vi�n ��u",0,102,8822},
	[18] = {"Hi�n Vi�n ��u",0,102,8824},
	[20] = {"Hi�n Vi�n ��u",0,102,8826},
	[21] = {"Hi�n Vi�n ��u",0,102,8828},
	[23] = {"Hi�n Vi�n ��u",0,102,8830},
	[25] = {"Hi�n Vi�n ��u",0,102,8832},
	[26] = {"Hi�n Vi�n ��u",0,102,8834},
	[27] = {"Hi�n Vi�n ��u",0,102,8836},
	[29] = {"Hi�n Vi�n ��u",0,102,8838},
	[30] = {"Hi�n Vi�n ��u",0,102,8848},
}
TXuanyuanEquip = {
	TXuanyuanZhan,TXuanyuangDou,TXuanyuanWeapon
}


SS_WAITING		= 0;
SS_FIGHTING 	= 1;
SS_PASSING		= 2;
SS_FISH			= 3;
SS_WAITING_2	= 4;

frame_per_second 	= 18;
WAITING_TIME		= 15 * frame_per_second;
FIGHT_TIME			= 30 * frame_per_second;
FIGHT_TIME_2		= 15 * frame_per_second;
PASS_TIME			= 15 * frame_per_second;

MV_TIME_LOOP		= 1;
MV_MAPID			= 2;
MV_STAGE_STATE		= 3;	-- �ؿ�״̬
MV_STAGE_LEVEL		= 4;	-- ��n��
MV_MAP_INDEX		= 5;	-- ��ͼidx
MV_STAGE_LEVEL_OLD	= 6;	-- �����Ĺؿ�
MV_BOSSDEATH_FLAG	= 7;	-- BOSS������־
MV_CUR_BOSS_ID		= 8;
MV_BOSS_COUNT		= 9;	-- boss��ɱboss��
MV_FISH_COUNT		= 10;	-- ���fish��
MV_FISH_COUNT_2		= 11;	-- ���廨��fish��
MV_FISH_TIME		= 12;	-- ���fish��ʱ��
MV_ROBOT_TYPE		= 13;	-- ��ǰ�����Ļ�������
MV_LOOP				= 14;	-- ��ǰtimerѭ������
MV_CREATE_MYFISH_TIME	= 15;	-- �ϴ�Ԯ��ʱ��
MV_RETURN_MAP_ID	= 16;	-- ���ص�ͼid
MV_STAGE_START_TIME	= 17;
MV_BOSS_CREATE_TIME	= 18;
MV_SHOW_WELCOME		= 19;	-- ��ӭ�� 1 ��show 0 δshow
MV_MATCH_COUNT		= 20;	-- ����2
MV_MATCH_WIN		= 21;	-- ����2
MV_MATCH_AWARD		= 22;	-- ����2
MV_DAYE				= 23;	-- ib�ػ�Ǯ��playerindex
MV_LAO_ER			= 24;	-- ����ʰȡ��playerindex
MV_LOOT_ID			= 25;	--
MV_DAYE_2			= 26;	-- ��Ǯ��������playerindex
MV_LAO_ER_2			= 27;	-- ����ʰȡ��playerindex
MV_LOOT_ID_2		= 28;	--
MV_CUR_BOSS_ID_2	= 29;	-- ���ӵ�BOSS
MV_LS_OPEN_JINGLI_BOX_FLAG = 30 --�������������־
MV_LS_ROUTE_COUNT = 31 --���ɸ���
MV_END				= 31;	-- ��������

CampPlaye = "camp_player"; --����������Ӫ���ͣ�����npc
CampEnemy = "camp_enemy";  --������ͽ��Ӫ���ͣ�����npc
CampNeutral = "camp_evil";		--����npc��Ӫ����

POS_1				= 1;
POS_2				= 2;
POS_3				= 3;
POS_4				= 4;
POS_5				= 5;
POS_6				= 6;
POS_7				= 7;
POS_8				= 8;
POS_9				= 9;
POS_BOSS			= 10;
POS_WAIT_1			= 11;
POS_WAIT_2			= 12;
POS_PASS			= 13;

-----------------------------------------------------------------------
HIDEMISSION_BEGIN = 20;
HIDEMISSION_END = 21;
OPEN_HIDE_STAGE = 1;

_nextstage = {
	[1] = 2,
	[2] = 3,
	[3] = 4,
	[4] = 6,
	[5] = 6,
	[6] = 0,
	[7] = 5,
	[8] = 9,
	[9] = 0,
}

resetPos = {
	[3]		= {
		[SS_WAITING_2]	= POS_BOSS,
	},
	[5]		= {
		[SS_WAITING]	= {1650, 3130},
	},
}

function getStage()
	local lv = GetMissionV(MV_STAGE_LEVEL);
	local s = _stage[lv];
	assert(s, format("lv=%d, s=%s", lv, tostring(s)));
	return s;
end

function nextStage()
	if GetMissionV(MV_DAYE) ~= 0 or GetMissionV(MV_DAYE_2) ~= 0 then
		Talk(1,"",LSSysTalk[1]);
		return
	end
	
	remove_jingli_box()--�Ƴ���������
	remove_tong_box()
	remove_yin_box()
	remove_gold_box()

	local nMapId = gf_GetCurMapID();
	ClearMapNpc(nMapId);
	local lv = GetMissionV(MV_STAGE_LEVEL);
	if lv >= HIDEMISSION_BEGIN then	-- ���عؿ�����һ��
		lv = GetMissionV(MV_STAGE_LEVEL_OLD);
	end
	
	if lv == 4 then
		_stat_when_first_4_stage_pass()
	end
	
	local n = _nextstage[lv];
	if n == 0 then
		Msg2MSAll(MISSION_ID, LSMsgToTeam[1]);
		CloseMission(MISSION_ID);
		return
	end
	SetMissionV(MV_STAGE_LEVEL_OLD, n);
	if (n >= 1 and n <= 4) and random(100) < 10 and OPEN_HIDE_STAGE == 1 then
		n = random(HIDEMISSION_BEGIN,HIDEMISSION_END);
	end
	SetMissionV(MV_STAGE_LEVEL, n);
	Msg2MSAll(MISSION_ID,LSMsgToTeam[2]);
	getStage():init();
end

function resetMissionV()
	for i = 1, MV_END do
		SetMissionV(i, 0);
	end
end

function getResetPosition()
	local m, x, y = nil, nil, nil;
	local nState		= GetMissionV(MV_STAGE_STATE);
	local nOldStage	= GetMissionV(MV_STAGE_LEVEL_OLD);
	if resetPos and resetPos[nOldStage] and resetPos[nOldStage][nState] then
		local tPos = resetPos[nOldStage][nState];
		if type(tPos) == 'table' then
			m = gf_GetCurMapID();
			x = tPos[1];
			y = tPos[2];
		else
			m, x, y = tStageBase:getMapPos(tPos);
		end
	elseif nState ~= SS_PASSING and nState ~= SS_WAITING and nState ~= SS_WAITING_2 then
		m, x, y = tStageBase:getMapPos(POS_BOSS);
	end

	return m, x, y;
end

function resetPosition()
	local m, x, y = getResetPosition();

	if m and x and y then
		local f_resetPos = function()
			NewWorld(%m, %x, %y);
		end;
		mf_OperateAllPlayer(MISSION_ID, f_resetPos, nil, 1);
	end
end
-----------------------------------------------------------------------
function gf_GetCurMapID()
	return SubWorldIdx2ID(SubWorld);
end;

function LM_StartTimeGuage(szInfo, nDuration, bRepeat, nCustomID, tbPlayer)
	if tbPlayer == nil then --Ĭ�����������
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID, ALL_CAMP);
	end;
	local funTimeGuage = function(tbArg)
		StartTimeGuage(%szInfo,%nDuration,%bRepeat,%nCustomID);
	end;
	gf_OperatePlayers(tbPlayer,funTimeGuage,{});
end

function LM_StopTimeGuage(nCustomID, tbPlayer)
	if tbPlayer == nil then --Ĭ�����������
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funTimeGuage = function(tbArg)
		StopTimeGuage(%nCustomID);
	end;
	gf_OperatePlayers(tbPlayer,funTimeGuage,{});
end;

function LM_Talk(SentenceNum, CallBack_Fun, SentenceTab, tbPlayer)
	if tbPlayer == nil then --Ĭ�����������
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funTalk = function(tbArg)
		Talk(%SentenceNum, %CallBack_Fun, %SentenceTab);
	end;
	gf_OperatePlayers(tbPlayer,funTalk,{});
end;

function LM_Say(szCaption, nArg, tArg, tbPlayer)
	if tbPlayer == nil then --Ĭ�����������
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funSay = function(tbArg)
		Say(%szCaption, %nArg, %tArg);
	end;
	gf_OperatePlayers(tbPlayer,funSay,{});
end;

------------------------------------------------------
-- MU_Msg2Team from cangjian
function MU_Msg2Team(msg, msgtype)
    local num = GetTeamSize()
    msg = tostring(msg)
    if (num < 1) then
    	if msgtype == 2 then
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
        return
    end
    OldPlayer = PlayerIndex
    for i=1, num do
        PlayerIndex = GetTeamMember(i)
    	if msgtype == 2 then
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
    end
    PlayerIndex = OldPlayer
end
--============talk��������
function temp_Talk(self, nPage)
	if type(self) == "string" then
		self = GetTable(self);
	end
	if not self then return end
	if self.check and self.check(self) == nil then return end

	nPage = nPage or 0;
	local commonSel = self.commonSel or 0;
	local nLinePerPage = self.nLinePerPage or gLinePerPage or 10;
	local tSel = {}
	local nMin = 1 + nPage * nLinePerPage;
	local nMax = min( nMin + nLinePerPage - 1, getn(self.sel) - commonSel);
	for i=nMin, nMax do
		local callback = getcallback(self.sel[i][2], self);
		if callback then
			if self.makeSure
				and ((commonSel == 0 and i < getn(self.sel) - commonSel)
					or (commonSel > 0 and i <= getn(self.sel) - commonSel)) then
				callback = format('#makeSure("%s", %d, "%s")', HashTable(self), i, callback);
			end
			tinsert(tSel, format("%s/%s", self.sel[i][1], callback));
		end
	end
	local bReturn = 0;
	if nPage > 0 then
		tinsert(tSel, format("Trang tr��c".."/#temp_Talk('%s', %d)", HashTable(self), nPage - 1));
	end
	if nMax < getn(self.sel) - commonSel then
		tinsert(tSel, format("Trang k�".."/#temp_Talk('%s', %d)", HashTable(self), nPage + 1));
	end
	for i = getn(self.sel) - commonSel + 1,  getn(self.sel) do
		tinsert(tSel, format("%s/%s", self.sel[i][1], getcallback(self.sel[i][2], self)));
	end
	suSay( self.msg, getn(tSel), tSel);
end
function getcallback(cb, t)
	local tp = type(cb);
	if tp == "string" then return cb end
	if tp == "table" then return format("#temp_Talk('%s')",HashTable(cb)) end
	if tp == "function" then return cb(t) end
end
function HashTable(t)
	g_TableHash = g_TableHash or {};
	local s = strsub(tostring(t), 8);
	g_TableHash[s] = t;
	return s;
end
function GetTable(s)
	return g_TableHash and g_TableHash[s];
end
-- suSay: �Զ���ҳsay, ǰ��ҳֻ����/��ѡ��,���ҳ���Զ�ѡ��
--	������Sayһ��
PAGE_SIZE = 450;
function suSay(szMsg, n, ...)
	if strlen(szMsg) < PAGE_SIZE then
		Say(szMsg, n, gf_UnPack(arg))
		return
	end
	tTalkMsg = {}
	nTalkMsg = 1;

	szMsg = gsub(szMsg, "\\p", "\n\\p");
	gsub(szMsg, "(%C+)", procTalk);

	if type(arg[1]) == "table" then
		arg = arg[1];
	end
	g_PlayerTalkTmp[GetName()] = {
		msg = tTalkMsg,
		sel = arg,
	}
	suSayCB();
end

function suSayCB(nPage)
	nPage = nPage or 1;
	tMsg = g_PlayerTalkTmp[GetName()];
	if not tMsg then
		gf_warning("[WARNING] [suSayCB] [date error] [role:"..GetName().."]");
		return
	end
	local tArg = new(tMsg.sel);
	if getn(tMsg.msg) > nPage then
		tArg = { format("Trang k�/#suSayCB(%d)", nPage+1)};
	end
	if nPage > 1 then
		tinsert(tArg, 1, format("Trang tr��c/#suSayCB(%d)", nPage-1));
	end

	Say(tMsg.msg[nPage], getn(tArg), tArg);
end

function nothing()
end
--==========================================================