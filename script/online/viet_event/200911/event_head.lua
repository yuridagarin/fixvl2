--=============================================
--create by baiyun 2009.10.13
--describe:Խ�ϰ�11�·ݻ ͷ�ļ�
--=============================================
Include("\\script\\lib\\globalfunctions.lua");

VIET_0911_TASK_SHANGXIAN_AWORD = 2100;	--ÿ����ȡ���߽���������
VIET_0911_TASK_JUHUACHA_COUNT = 2075;		--ʹ�þջ���Ĵ���
VIET_0911_TASK_ZHENZHU_COUNT = 2076;		--ʹ������Ĵ���
VIET_0911_TASK_ZHANGMEN_DATE = 2077;		--�������Ͷ���������
VIET_0911_TASK_ZHANGMEN_COUNT = 2078;		--�Ѿ��������Ͷ����Ĵ���
VIET_0911_TASK_ZHANGMEN_TIME = 2079;		--�������Ͷ�����ʱ�䣬ʱ���GetTime()
VIET_0911_TASK_SHIMENG_DATE = 2080;			--ʦ������õ��ջ�������
VIET_0911_TASK_SHIMENG_NUM = 2089;			--ʦ������õ��ջ�������
VIET_0911_TASK_YANHUO_DATE = 2098;			--ʹ���̻������
VIET_0911_TASK_YANHUO_NUM = 2099;				--�����Ѿ�ʹ���̻�Ĵ���
VIET_0911_TASK_LAST_USE_TIME = 2116;		--�ϴ�ʹ���̻��ʱ��GetTime()
VIET_0911_TASK_TONG_AWARD_DATE = 2189;	--��ȡ���影������(%Y%W)

VIET_0911_JUHUACHA_MAX_COUNT = 2400;		--���ʹ�þջ���Ĵ���
VIET_0911_ZHENZHU_MAX_COUNT = 100;			--���ʹ������Ĵ���
VIET_0911_YANHUO_MAX_COUNT = 16;				--ÿ�����ʹ�õ��̻�ĸ���

VIET_0911_LOG_TITLE = "Hoat dong thang 11"

--���߽���
tbVIET_0911_SHANGXIAN_AWORD = {
	{3000, 3999, 200000},
	{4000, 4999, 300000},
	{5000, 5999, 400000},
	{6000, 6999, 500000},
	{7000, 7999, 600000},
	{8000, 8999, 700000},
	{9000, 9999, 800000},
	{10000, 10999, 900000},
	{11000, 14999, 1000000},
	{15000, 19999, 1100000},
	{20000, 24999, 1200000},
	{25000, 0, 1300000},
};
--���߽������ľջ�����
tbVIET_0911_SHANGXIAN_AWARD2 = {
	[1] = 30,
	[2] = 30,
	[3] = 30,
	[4] = 40,
	[5] = 40,
	[6] = 40,
	[7] = 40,
	[8] = 50,
	[9] = 50,
	[10] = 50,
	[11] = 50,
	[12] = 50,
};

--ͨ��ʦ�������õľջ�������
tVIET_0911_SHIMEN_JUHUA = {
	[1] = 15,
	[2] = 15,
	[3] = 15,
	[4] = 20,
	[5] = 20,
	[6] = 20,
	[7] = 30,
	[8] = 30,
	[9] = 30,
};

--�����佱��
tbVIET_0911_YUTUXIANG = {
	{"M�nh Thi�n th�ch", 10, {2, 2, 7, 1}, 0},
	{"Thi�n th�ch", 10, {2, 2, 8, 1}, 0},
	{"Ti�u Ki�p t�n", 10, {2, 0, 141, 1}, 7 * 24 * 3600},
	{"��u h�n", 4, {2, 1, 1157, 1}, 7 * 24 * 3600},
	{"Money", 37, 10000},
	{"Rep", 12, 1},
	{nil, 12},
	{"Exp", 5, 20000}
};

tbVIET_0911_JUHUACHA_AWARD = {
	{"M�nh Thi�n th�ch", 60000, {2, 2, 7, 1}, 0},
	{"Thi�n th�ch", 60000, {2, 2, 8, 1}, 0},
	{"M�nh B�ng th�ch", 20000, {2, 1, 148, 1},  0},
	{"B�ng th�ch", 30000, {2, 1, 149, 1}, 0},
	{"T�y T�y linh ��n", 100, {2, 0, 137, 1}, 15 * 24 * 3600},
	{"��ng Ti�n V�ng", 5000, {2, 1, 30094, 1}, 0},
	{"Tu Ch�n Y�u Quy�t", 70000, {2, 0, 554, 1}, 15 * 24 * 3600},
	{"R��ng B� K�p", 1000, {2, 1, 30093, 1}, 30 * 24 * 3600},
	{"��u h�n", 10000, {2, 1, 1157, 1}, 15 * 24 * 3600},
	{"Th�n N�ng ��n", 14000, {2, 1, 343, 1}, 15 * 24 * 3600},
	{"V�n C�m H�p", 500, {2, 1, 1100, 1}, 15 * 24 * 3600},
	{"Qu�n C�ng Ch��ng", 5000, {2, 1, 9999, 1}, 15 * 24 * 3600},
	{"Th�i H� �a M�t Qu� ", 5000, {2, 1, 387, 1}, 15 * 24 * 3600},
	{"S� m�n t�nh nguy�n th�", 5000, {2, 1, 1019, 1}, 15 * 24 * 3600},
	{"S� m�n l�nh th�", 5000, {2, 1, 1016, 1}, 15 * 24 * 3600},
--	{"�ng B�ng Gi�y", 140999, {2, 1, 30092, 1}, 0},
	{"B�o R��ng ��c Bi�t", 1, {2, 1, 30091, 1}, 30 * 24 * 3600},
	{"R��ng Tr�n Ph�i", 1000, {2, 1, 30113, 1}, 30 * 24 * 3600},
	{nil, 320000},
	{nil, 347399},
	{"Ti�u Ki�p t�n", 10000, {2, 0, 141, 1}, 15 * 24 * 3600},
--	{"Ng�c Trai", 83300, {2, 1, 30122, 1}, 15 * 24 * 3600},
	{"T� Linh Thi�n � Ph�", 3000, {0, 107, 160, 1}, 0},
	{"T� Linh T� � Ph�", 3000, {0, 107, 161, 1}, 0},
	{"T� Linh Chi�n � Ph�", 3000, {0, 107, 159, 1}, 0},
	{"B�n Long B�ch", 2000, {2, 1, 1000, 1}, 15 * 24 * 3600},
	{"Ti�u nh�n s�m qu�", 20000, {2, 0, 552, 1}, 15 * 24 * 3600},
};

tbVIET_0911_JUHUACHA_AWARD_2 = {
	{"Tu Ch�n Y�u Quy�t", 230000, {2, 0, 554, 1}, 15 * 24 * 3600},
	{"R��ng B� K�p", 40000, {2, 1, 30093, 1}, 30 * 24 * 3600},
	{"Qu�n C�ng Ch��ng", 170000, {2, 1, 9999, 1}, 15 * 24 * 3600},
	{"R��ng Tr�n Ph�i", 20000, {2, 1, 30113, 1}, 30 * 24 * 3600},
	{"Ti�u Ki�p t�n", 210000, {2, 0, 141, 1}, 15 * 24 * 3600},
	{"T� Linh Thi�n � Ph�", 40000, {0, 107, 160, 1}, 0},
	{"T� Linh T� � Ph�", 40000, {0, 107, 161, 1}, 0},
	{"T� Linh Chi�n � Ph�", 40000, {0, 107, 159, 1}, 0},
	{"B�n Long B�ch", 210000, {2, 1, 1000, 1}, 15 * 24 * 3600},
};

tbVIET_0911_JUHUACHA_AWARD_FULL = {
	{"Thi�n Th�ch Linh Th�ch", 7800, {2, 1, 1068, 1}, 15 * 24 * 3600},
	{"Thi�n Th�ch Tinh Th�ch", 453000, {2, 1, 1009, 1}, 0},
	{"��nh H�n Thi�n Th�ch Th�n Th�ch", 3100, {2, 1, 1067, 1}, 7 * 24 * 3600},
	{"L�ng Ba Vi B�", 31300, {0, 112, 78, 1}, 0},
	{"Huy hi�u chi�n c�ng (Huy ho�ng)", 4700, {2, 1, 9977, 1}, 7 * 24 * 3600},
	{"M� B�i", 500100, {2, 1, 371, 1}, 30 * 24 * 3600},
}

--���影�����������
tbVIET_0911_TONG_AWARD1 = {
	[1] = 
	{
		{1, "Ng� d�ng b�ch ng�c th�ch", {2, 1, 1024, 15}, 7 * 24 * 3600},
		{1, "R��ng Y�u Quy�t_Cao C�p", {2, 1, 30112, 3}, 7 * 24 * 3600},
		{1, "Bao m�nh Thi�n Th�ch", {2, 1, 1049, 1}, 7 * 24 * 3600},
		{1, "Bao Thi�n Th�ch", {2, 1, 1050, 1}, 7 * 24 * 3600},
		{1, "1 bao X�ch Thi�t Tinh", {2, 1, 2651, 1}, 7 * 24 * 3600},
		{1, "Ng� H�nh M�t t�ch", {0, 107, 155, 2}, 0},
		{1, "Thi�n Th�ch linh th�ch", {2, 1, 1068, 1}, 7* 24 * 3600},
		{1, "N� Oa Tinh Th�ch", {2, 1, 504, 3}, 7* 24 * 3600},
		{2, "ModifyExp(10000000)", "C�c h� thu ���c 10000000 kinh nghi�m"},
		{2, "ModifyReputation(1000, 1)", "C�c h� thu ���c 1000 �i�m danh v�ng"},
	},
	[2] = 
	{
		{1, "Ng� d�ng b�ch ng�c th�ch", {2, 1, 1024, 10}, 7 * 24 * 3600},
		{1, "R��ng Y�u Quy�t_Cao C�p", {2, 1, 30112, 2}, 7 * 24 * 3600},
		{1, "Bao m�nh Thi�n Th�ch", {2, 1, 1049, 1}, 7 * 24 * 3600},
		{1, "Bao Thi�n Th�ch", {2, 1, 1050, 1}, 7 * 24 * 3600},
		{1, "1 bao X�ch Thi�t Tinh", {2, 1, 2651, 1}, 7 * 24 * 3600},
		{1, "Ng� H�nh M�t t�ch", {0, 107, 155, 1}, 0},
		{1, "N� Oa Tinh Th�ch", {2, 1, 504, 2}, 7* 24 * 3600},
		{2, "ModifyExp(7000000)", "C�c h� thu ���c 7000000 �i�m kinh nghi�m"},
		{2, "ModifyReputation(700, 1)", "C�c h� thu ���c 700 danh v�ng"},
	},
	[3] = 
	{
		{1, "Ng� d�ng b�ch ng�c th�ch", {2, 1, 1024, 5}, 7 * 24 * 3600},
		{1, "R��ng Y�u Quy�t_Cao C�p", {2, 1, 30112, 1}, 7 * 24 * 3600},
		{1, "Bao m�nh Thi�n Th�ch", {2, 1, 1049, 1}, 7 * 24 * 3600},
		{1, "Bao Thi�n Th�ch", {2, 1, 1050, 1}, 7 * 24 * 3600},
		{1, "1 bao X�ch Thi�t Tinh", {2, 1, 2651, 1}, 7 * 24 * 3600},
		{1, "N� Oa Tinh Th�ch", {2, 1, 504, 1}, 7* 24 * 3600},
		{2, "ModifyExp(5000000)", "C�c h� thu ���c 5000000 �i�m kinh nghi�m"},
		{2, "ModifyReputation(500, 1)", "C�c h� thu ���c 700 danh v�ng"},
	}
};

--���影����������ͳ��Ͻ���
tbVIET_0911_TONG_AWARD2 = {
	[1] = 
	{
		{2, "ModifyExp(7000000)", "C�c h� thu ���c 7000000 �i�m kinh nghi�m"},
		{2, "ModifyReputation(700, 1)", "C�c h� thu ���c 700 danh v�ng"},
	},
	[2] = 
	{
		{2, "ModifyExp(5000000)", "C�c h� thu ���c 5000000 �i�m kinh nghi�m"},
		{2, "ModifyReputation(500, 1)", "C�c h� thu ���c 500 danh v�ng"},
	},
	[3] =
	{
		{2, "ModifyExp(2000000)", "C�c h� thu ���c 2000000 �i�m kinh nghi�m"},
		{2, "ModifyReputation(200, 1)", "C�c h� thu ���c 200 danh v�ng"},
	},
};

--���影�����������������
tbVIET_0911_TONG_AWARD3 = {
	[1] = 
	{
		{2, "ModifyExp(5000000)", "C�c h� thu ���c 5000000 �i�m kinh nghi�m"},
		{2, "ModifyReputation(500, 1)", "C�c h� thu ���c 500 danh v�ng"},
	},
	[2] = 
	{
		{2, "ModifyExp(2000000)", "C�c h� thu ���c 2000000 �i�m kinh nghi�m"},
		{2, "ModifyReputation(200, 1)", "C�c h� thu ���c 200 danh v�ng"},
	},
	[3] =
	{
		{2, "ModifyExp(1000000)", "C�c h� thu ���c 1000000 �i�m kinh nghi�m"},
		{2, "ModifyReputation(100, 1)", "C�c h� thu ���c 100 danh v�ng"},
	},
};

--���影�����ͨ���ڽ���
tbVIET_0911_TONG_AWARD4 = {
	[1] = 
	{
		{2, "ModifyExp(2000000)","C�c h� thu ���c 2000000 �i�m kinh nghi�m"},
		{2, "ModifyReputation(200, 1)", "C�c h� thu ���c 200 danh v�ng"},
	},
	[2] = 
	{
		{2, "ModifyExp(1000000)","C�c h� thu ���c 1000000 �i�m kinh nghi�m"},
		{2, "ModifyReputation(100, 1)","C�c h� thu ���c 100 danh v�ng"},
	},
	[3] =
	{
		{2, "ModifyExp(500000)","C�c h� thu ���c 500000 �i�m kinh nghi�m"},
		{2, "ModifyReputation(50, 1)","C�c h� thu ���c 50 danh v�ng"},
	},
};

tbVIET_0911_TANGQUASUPHU ={
	{nil, 50250},
	{"��u H�n", 26000, {2, 1, 1157, 1}, 15 * 24 * 3600},
	{"M�nh Ti�t Ho�nh Th�", 1000, {2, 0, 738, 1}, 0},
	{"Th��ng C� K� L�n Huy�t", 1000, {2, 0, 739, 1}, 0},
	{"Nguy�t Hoa Chi Tinh", 100, {2, 1, 3219, 1}, 0},
	{"Nguy�t Hoa", 10000, {2, 1, 2002, 1}, 0},
	{"L�ng Ba Vi B�", 100, {0, 112, 78, 1}, 0},
	{"R��ng V� Kh� B�c", 5000, {2, 1, 1147, 1}, 15 * 24 * 3600},
	{"��ng Ti�n V�ng", 2000, {2, 1, 30094, 1}, 0},
	{"Th�y Ho�ng B� Chi�u", 1000, {2, 1, 1047, 1}, 15 * 24 * 3600},
	{"L�c L�m Lang Y�n", 1000, {2, 1, 1014, 1}, 15 * 24 * 3600},
	{"Uy�n ��ng Kim Ti B�c", 1000, {2, 1, 1048, 1}, 15 * 24 * 3600},
	{"Huy hi�u chi�n c�ng (huy ho�ng)", 250, {2, 1, 9977, 1}, 15 * 24 * 3600},
	{"Thi�n Th�ch Tinh Th�ch", 1300, {2, 1, 1009, 1},0}
}

tbVIET_0911_TANGQUASUPHU_2 = {
	{0, 4000, 125000},
	{4001, 8000, 150000},
	{8001, 9000, 175000},
	{9001, 99999, 200000},
};

tbVIET_0911_WEAPON = {
	[2]= 	{"C� ��nh",0,3,64,200},
	[3]= 	{"A La H�n Tr��ng",0,8,97,100},
	[4]=	 {"V�n Nh�n",0,0,14,220},
	[6]= 	{"M�n Thi�n Hoa V�",0,1,53,130},	
	[8]= 	{"H�a Tinh",0,2,36,90},	
	[9]= 	{"Hi Nh�n C�m",0,10,75,140},
	[11]= {"V�n Nh�n",0,0,14,220},
	[12]= {"Li�t Di�m",0,5,40,200},
	[14]= {"H�a Tinh",0,2,36,90},	
	[15]= {"Th�n H�nh",0,9,86,130},	
	[17]= {"��i H�o L�i Th��ng",0,6,108,130},	
	[18]= {"Th�n Cung",0,4,119,130},
	[20]= {"L�ng Phong",0,7,12,200},
	[21]= {"M�nh h�",0,11,12,200},
}

function get_full_skill_level()
	local nPlayerRoute = GetPlayerRoute()
	local nSkillID = TB_55_SKILL_INFO[nPlayerRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= 7 then
			return 1
		else
			return 0;
		end;
	end;
end;


-- ���55�������Ƿ��Ѿ�ѧ����
TB_55_SKILL_INFO = {
	[0] = 0,--"��������",
	[1] = 0,--����
	[2] = 31,--"�׼�",
	[3] = 56,--"��ɮ",
	[4] = 43,--"��ɮ",
	[5] = 0,--"����",
	[6] = 73,--"����",
	[7] = 0,--"����",
	[8] = 88,--"���ҷ��",
	[9] = 101,--"�����׼�",
	[10] = 0,--"ؤ��",
	[11] = 112,--"ؤ�ﾻ��",
	[12] = 123,--"ؤ������",
	[13] = 0,--"�䵱",
	[14] = 145,--"�䵱����",
	[15] = 158,--"�䵱�׼�",
	[16] = 0,--"����",
	[17] = 731,--"����ǹ��",
	[18] = 744,--"���Ź���",
	[19] = 0,--"�嶾",
	[20] = 377,--"�嶾а��",
	[21] = 363,--"�嶾��ʦ",
}

--��ȡ���߽���
function Viet0911_Give_ShangXian_Aword()
	if tonumber(date("%y%m%d")) < 091106 or tonumber(date("%y%m%d")) > 091206 then
		Talk(1, "", "Ho�t ��ng �� qu� h�n");
		return 0;
	end
	local nDayWeek = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	if nDayWeek == 2 or nDayWeek == 3 or nDayWeek == 4 then
		Talk(1, "", "Ch� c� th� 2, 6, 7 ch� nh�t m�i c� th� nh�n ph�n th��ng l�n m�ng");
		return 0;
	end
	if nHour < 16 then
		Talk(1, "", "Th�i gian nh�n online nh�n th��ng v�o m�i ng�y t� 16 ��n 24 gi�");
		return 0;
	end
	if GetLevel() < 73 or GetPlayerRoute() == 0 then
		Talk(1, "", "Th�p h�n c�p 73 v� ch�a v�o m�n ph�i th� kh�ng th� nh�n lo�i ph�n th��ng n�y");
		return 0;
	end
	if GetTask(VIET_0911_TASK_SHANGXIAN_AWORD) >= tonumber(date("%y%m%d")) then
		Talk(1, "", "H�m nay ��i hi�p �� nh�n ph�n th��ng, xin h�y ��i ng�y mai");
		return 0;
	end
	local nExp = 0;
	local nRep = GetReputation();
	local nFac = GetTask(336);
	local nRepLevel = viet0911_get_aword_level(nRep, tbVIET_0911_SHANGXIAN_AWORD);
	local nFacLevel = viet0911_get_aword_level(nFac, tbVIET_0911_SHANGXIAN_AWORD);
	if nRepLevel == 0 and nFacLevel == 0 then
		Talk(1, "", "�i�m danh v�ng v� c�ng hi�n s� m�n kh�ng �� nh�n ph�n th��ng n�y.");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then 
		return 0;
	end
	if nRepLevel ~= 0 then
		ModifyExp(tbVIET_0911_SHANGXIAN_AWORD[nRepLevel][3]);
		Msg2Player("B�n nh�n ���c "..tbVIET_0911_SHANGXIAN_AWORD[nRepLevel][3].." �i�m kinh nghi�m");
		WriteLog(GetName() .. "Nh�n ���c "..tbVIET_0911_SHANGXIAN_AWORD[nRepLevel][3] .. "  �i�m kinh nghi�m")
		gf_AddItemEx({2, 1, 30118, tbVIET_0911_SHANGXIAN_AWARD2[nRepLevel]}, "Hoa C�c");
	end
	if nFacLevel ~= 0 then
		ModifyExp(tbVIET_0911_SHANGXIAN_AWORD[nFacLevel][3]);
		Msg2Player("B�n nh�n ���c "..tbVIET_0911_SHANGXIAN_AWORD[nFacLevel][3].." �i�m kinh nghi�m");
		WriteLog(GetName() .. "Nh�n ���c "..tbVIET_0911_SHANGXIAN_AWORD[nFacLevel][3] .. "  �i�m kinh nghi�m")
		gf_AddItemEx({2, 1, 30118, tbVIET_0911_SHANGXIAN_AWARD2[nFacLevel]}, "Hoa C�c");
	end
	SetTask(VIET_0911_TASK_SHANGXIAN_AWORD, tonumber(date("%y%m%d")));
end

--�ж����ڵ�������ʦ�Ź��׶ȿ��Ի�õڼ�������
function viet0911_get_aword_level(nValue, tAword)
	for i = getn(tAword), 1, -1 do
		if tAword[i][2] == 0 then
			if nValue >= tAword[i][1] then
				return i;
			end
		else
			if nValue >= tAword[i][1] and nValue <= tAword[i][2] then
				return i;
			end
		end
	end
	return 0;
end

--���ջ���
function Viet_0911_GetJuHuaCha()
	if GetItemCount(2, 1, 30118) < 2 or GetItemCount(2, 1, 30121) < 1 then
		Say("��i hi�p mang nguy�n li�u kh�ng �� xin h�y ki�m tra l�i", 1, "Th�t ng�i qu�! Ta s� quay l�i sau./viet_0911_nothing");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then 
		return 0;
	end
	if DelItem(2, 1, 30118, 2) == 1 and DelItem(2, 1, 30121, 1) == 1 then
		gf_SetLogCaption(VIET_0911_LOG_TITLE);
		gf_AddItemEx({2, 1, 30119, 1}, "Tr� Hoa C�c");
		WriteLogEx(VIET_0911_LOG_TITLE,"h�p th�nh",1,"Tr� Hoa C�c")
		gf_SetLogCaption("");
	end
	SelectSay();
end

--���ٻ���
function Viet0911_Give_Exchange_Baihuabing()
	if GetItemCount(2, 1, 30118) < 2 then
		Say("��i hi�p mang nguy�n li�u kh�ng �� xin h�y ki�m tra l�i", 1, "Th�t ng�i qu�! Ta s� quay l�i sau./viet_0911_nothing");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then 
		return 0;
	end
	
	if Pay(10000) == 0 then
		Talk(1, "", "Ng�n l��ng c�a b�n kh�ng ��!");
		return
	end
	if DelItem(2, 1, 30118, 2) == 1 then
		gf_SetLogCaption(VIET_0911_LOG_TITLE);
		gf_AddItemEx({2, 1, 30120, 1}, "B�nh B�ch Hoa");
		WriteLogEx(VIET_0911_LOG_TITLE,"h�p th�nh",1,"B�nh B�ch Hoa")
		gf_SetLogCaption("");
	end
	SelectSay();
end

--��ȡ����ǰ�������Ľ���
function get_123tong_award()
	local tb_dialog = {
		"Nh�n ph�n ph�n th��ng bang ch�/#get_tong_award(1)",
		"Nh�n ph�n th��ng c�a ph� bang ch� v� tr��ng l�o/#get_tong_award(2)",
		"Nh�n ph�n th��ng c�a ���ng ch� v� h��ng ch�/#get_tong_award(3)",
		"Nh�n ph�n th��ng bang ch�ng/#get_tong_award(4)",
	};
	Say("<color=green>Kim S�n ch��ng m�n nh�n<color>: Th�nh vi�n c�a 3 bang h�i ��ng ��u ��u c� th� ��n ��y nh�n th��ng!<enter><color=red>Ch� �: Sau 24:00 th� 7 n�u nh� ��ng ��o kh�ng ��n nh�n, ph�n th��ng s� b� x�a �i<color>", 
		getn(tb_dialog), 
		tb_dialog
	);
end

function get_tong_award(nType)
	local nCurDate = tonumber(date("%Y%W"));
	local nLastDate = GetTask(VIET_0911_TASK_TONG_AWARD_DATE);
	SetTaskTemp(105, nType);
	if nLastDate >= nCurDate then
		Talk(1, "", "<color=green>Kim S�n ch��ng m�n nh�n<color>: Tu�n n�y c�c h� �� nh�n ph�n th��ng bang h�i r�i.");
		return 0;
	end
	local nLevel = IsTongMember();
	if nLevel == 0 then
		Talk(1, "", "<color=green>Kim S�n ch��ng m�n nh�n<color>: C�c h� v�n ch�a gia nh�p bang h�i, kh�ng th� nh�n ph�n th��ng n�y.");
		return 0;
	end
	if GetLevel() < 73 then
		Talk(1, "", "<color=green>Kim S�n ch��ng m�n nh�n<color>: C�p b�c ch�a �� 73, kh�ng th� nh�n ph�n th��ng n�y ���c");
		return 0;
	end
	if get_full_skill_level() == 0 then
		Talk(1, "", "<color=green>Kim S�n ch��ng m�n nh�n<color>: Ch�a h�c ��y �� chi�u th�c 55, kh�ng th� nh�n ph�n th��ng n�y ���c");
		return 0;
	end
	if viet_0911_get_join_tong_day() < 7 then
		Talk(1, "", "<color=green>Kim S�n ch��ng m�n nh�n<color>: C�c h� gia nh�p bang h�i ch�a �� 7 ng�y, kh�ng th� nh�n th��ng!")
		return 0;
	end
	if GetTongLevel() < 5 then
		Talk(1, "", "<color=green>Kim S�n ch��ng m�n nh�n<color>: Bang h�i c�c h� ch�a ��t ��n c�p 5, kh�ng th� nh�n th��ng.");
		return 0;
	end
	if GetTongPopulation() < 1000000 then
		Talk(1, "", "<color=green>Kim S�n ch��ng m�n nh�n<color>: C�c h� �ang � bang h�i c� nh�n kh� kh�ng �� 1000000, kh�ng th� nh�n th��ng.");
		return 0;
	end
	local nTongLadder = GetTongPopuLadder();
	if nTongLadder > 3 or nTongLadder <= 0 then
		Talk(1, "", "<color=green>Kim S�n ch��ng m�n nh�n<color>: Bang h�i c�a c�c h� x�p h�ng nh�n kh� kh�ng ph�i 3 bang h�i ��ng ��u, kh�ng th� nh�n th��ng")
		return 0;
	end
	if gf_Judge_Room_Weight(5, 50, " ") ~= 1 then 
		return 0;
	end
	local nLevelName = {
		{1, 1, "Bang ch�"},
		{2, 2, "Ph� bang"},
		{3, 2, "Tr��ng l�o"},
		{4, 3, "���ng ch�"},
		{5, 3, "H��ng ch�"},
		{6, 4, "bang ch�ng ph� th�ng"},
	};
	
	local szName = "";
	if nLevelName[nLevel][2] ~= nType then
		if nType == 2 or nType == 3 then
			szName = "ph� bang ch� ho�c tr��ng l�o";
		elseif nType == 4 or nType == 5 then
			szName = "���ng ch� ho�c h��ng ch�";
		else
			szName = nLevelName[nType][3];
		end
		Talk(1, "", "<color=green>Kim S�n ch��ng m�n nh�n<color>: ��a v� trong bang h�i c�a ��i hi�p kh�ng ph�i l� "..szName..", kh�ng th� nh�n ph�n th��ng n�y ���c.");
		return 0;
	end
	ApplyRelayShareData("viet0911_tongmaster_award", 0, nType, VIET_0911_FILE_NAME, "get_tongmaster_award_callback");
end

function get_tongmaster_award_callback(szKey, nKey1, nKey2, nCount)
	local nType = GetTaskTemp(105);
	local nLevel = IsTongMember();
	local nLevelName = {
		{1, 1, "Bang ch�"},
		{2, 2, "Ph� bang"},
		{3, 2, "Tr��ng l�o"},
		{4, 3, "���ng ch�"},
		{5, 3, "H��ng ch�"},
		{6, 4, "bang ch�ng ph� th�ng"},
	};
	
	--�������ȡ����������
	local nNumLimit = {1, 2, 42, 261};--ÿ���ȼ����˿�����ȡ������
	local nMaxNum = nNumLimit[nType];--��������ȡ������
	local nTongLadder = GetTongPopuLadder();
	local szName = "";
	if nLevelName[nLevel][2] ~= nType then
		if nType == 2 or nType == 3 then
			szName = "ph� bang ch� ho�c tr��ng l�o";
		elseif nType == 4 or nType == 5 then
			szName = "���ng ch� ho�c h��ng ch�";
		else
			szName = nLevelName[nType][3];
		end
		Talk(1, "", "<color=green>Kim S�n ch��ng m�n nh�n<color>: ��a v� trong bang h�i c�a ��i hi�p kh�ng ph�i l� "..szName..", kh�ng th� nh�n ph�n th��ng n�y ���c.");
		return 0;
	end
	
	if nCount ~= 0 then
		local nDate, nNum = GetRelayShareDataByKey(szKey, nKey1, nKey2, GetTongName());
		DelRelayShareDataCopy(szKey, nKey1, nKey2);
		if not nDate then
			Say("<color=green>Kim S�n ch��ng m�n nh�n<color>: C�c h� �ang � bang h�i nh�n kh� h�ng "..nTongLadder.." , ��a v� c�a ��i hi�p trong bang h�i l� "..nLevelName[nLevel][3].."��i hi�p x�c nh�n mu�n nh�n ph�n th��ng n�y?",
					2,
			 		"Ta mu�n nh�n th��ng/#confirm_get_tong_award("..nTongLadder..", "..nLevelName[nLevel][2]..","..(nMaxNum - 1)..")",
					"�� ta ngh� l�i/viet_0911_nothing"
			 );
		else
			if nDate >= tonumber(date("%Y%W")) then
				if nNum <= 0 then
					Talk(1, "", "<color=green>Kim S�n ch��ng m�n nh�n<color>: Tu�n n�y c�c h� �� nh�n ph�n th��ng bang h�i r�i.");
					return 0;
				else
					Say("<color=green>Kim S�n ch��ng m�n nh�n<color>: C�c h� �ang � bang h�i nh�n kh� h�ng "..nTongLadder.." , ��a v� c�a ��i hi�p trong bang h�i l� "..nLevelName[nLevel][3].."��i hi�p x�c nh�n mu�n nh�n ph�n th��ng n�y?",
							2,
					 		"Ta mu�n nh�n th��ng/#confirm_get_tong_award("..nTongLadder..", "..nLevelName[nLevel][2]..","..(nNum - 1)..")",
							"�� ta ngh� l�i/viet_0911_nothing"
					 );
				end
			else
				Say("<color=green>Kim S�n ch��ng m�n nh�n<color>: C�c h� �ang � bang h�i nh�n kh� h�ng "..nTongLadder.." , ��a v� c�a ��i hi�p trong bang h�i l� "..nLevelName[nLevel][3].."��i hi�p x�c nh�n mu�n nh�n ph�n th��ng n�y?",
						2,
				 		"Ta mu�n nh�n th��ng/#confirm_get_tong_award("..nTongLadder..", "..nLevelName[nLevel][2]..","..(nMaxNum - 1)..")",
						"�� ta ngh� l�i/viet_0911_nothing"
				 );
			end
		end
	else
		Say("<color=green>Kim S�n ch��ng m�n nh�n<color>: C�c h� �ang � bang h�i nh�n kh� h�ng "..nTongLadder.." , ��a v� c�a ��i hi�p trong bang h�i l� "..nLevelName[nLevel][3].."��i hi�p x�c nh�n mu�n nh�n ph�n th��ng n�y?",
				2,
		 		"Ta mu�n nh�n th��ng/#confirm_get_tong_award("..nTongLadder..", "..nLevelName[nLevel][2]..","..(nMaxNum - 1)..")",
				"�� ta ngh� l�i/viet_0911_nothing"
		 );
	end
end
	 
function confirm_get_tong_award(nTongLadder, nType, nSaveNum)
	--nTongLadder�ǰ��������nType����ȡ��һ���Ľ���
	local tbAward;
	if nType == 1 then
		tbAward = tbVIET_0911_TONG_AWARD1[nTongLadder];
	elseif nType == 2 then
		tbAward = tbVIET_0911_TONG_AWARD2[nTongLadder];
	elseif nType == 3 then
		tbAward = tbVIET_0911_TONG_AWARD3[nTongLadder];
	else
		tbAward = tbVIET_0911_TONG_AWARD4[nTongLadder];
	end
	for i = 1, getn(tbAward) do
		if tbAward[i][1] == 1 then
			gf_SetLogCaption(VIET_0911_LOG_TITLE);
			
			for j = 1, tbAward[i][3][4] do
				local nRetCode, nIndex = gf_AddItemEx({tbAward[i][3][1], tbAward[i][3][2], tbAward[i][3][3], 1}, tbAward[i][2]);
				if nRetCode == 1 and tbAward[i][4] ~= 0 then
					SetItemExpireTime(nIndex, tbAward[i][4]);
				end
			end
			
			gf_SetLogCaption("");
		else
			dostring(tbAward[i][2]);
			Msg2Player(tbAward[i][3]);
		end
	end
	SetTask(VIET_0911_TASK_TONG_AWARD_DATE, tonumber(date("%Y%W")));
	
	--�����ѵ�ǰ�����ڴ�ع������
	AddRelayShareData("viet0911_tongmaster_award", 0, nType, VIET_0911_FILE_NAME, "viet_0911_nothing", 0, GetTongName(), "dd", tonumber(date("%Y%W")), nSaveNum);
end

function viet_0911_get_join_tong_day()
	local nJoinTime = GetJoinTongTime();
	if nJoinTime == 0 then	--���û�м�����
		return 0;
	end;
	local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	return nDayCount;
end

function viet_0911_nothing()

end