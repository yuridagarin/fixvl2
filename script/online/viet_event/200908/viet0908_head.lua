--=============================================
--create by baiyun 2009.7.16
--describe:Խ�ϰ�8�·ݻͷ�ļ�
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\writelog.lua");

VIET_0908_TASK_KILL_HALL_EXP_DATE = 2081;			--ɱ���þ���������(ֻ��������¼��)
VIET_0908_TASK_KILL_HALL_EXP = 2082;					--ɱ���û�õľ�����(ֻ��������¼��)
VIET_0908_TASK_SHIMEN_GET_PUTAO_DATE = 2083;	--ͨ��ʦ�����������ѵ�����
VIET_0908_TASK_SHIMEN_GET_PUTAO_COUNT = 2084;	--ͨ��ʦ�����������ѵĴ���
VIET_0908_TASK_ALREADY_GET_EXP = 2085;				--�Ѿ���õľ�������
VIET_0908_TASK_SHANGXIAN_AWORD = 2086;				--������߽���������
VIET_0908_TASK_GET_SHAQI_DATE = 2087;					--���ɱ��ֵ������
VIET_0908_TASK_GET_SHAQI_COUNT = 2088;				--���ɱ��ֵ������


VIET_0908_CONST_SHIMEN_GET_MAX = 10;					--ÿ�����ʮ�λ��ʦ���������ѽ���
VIET_0908_CONST_MAX_EXP = 200000000;					--ʹ�ø���������õľ���

--ͨ��ʦ�������õ����ѵ�����
tVIET_SHIMEN_PUTAO = {
	[1] = 10,
	[2] = 10,
	[3] = 10,
	[4] = 10,
	[5] = 50,
	[6] = 60,
	[7] = 70,
	[8] = 70,
	[9] = 80,
};

tVIET_0908_HECHENG = {
	{{{"Nho", 4, 2, 1, 30098}, {"T�i H��ng Li�u", 1, 2, 1, 30101}}, {"K�o Nho", {2, 1, 30102, 1}, "Keo Nho"}},
	{{{"M�ng c�u", 4, 2, 1, 30099}, {"T�i H��ng Li�u", 1, 2, 1, 30101}}, {"K�o M�ng C�u", {2, 1, 30103, 1}, "Keo Mang Cau"}},
	{{{"S�u ri�ng", 4, 2, 1, 30100}, {"T�i H��ng Li�u", 1, 2, 1, 30101}}, {"K�o S�u Ri�ng", {2, 1, 30104, 1}, "Keo Sau Rieng"}},
};

str_VIET_0908_LOG_TITLE = "[Hoat dong thang 8]";

--���߽���
tVIET_0908_SHANGXIAN_AWORD = {
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
--���ɼ���ID
tbViet_0908_SkillID = 
	{
		[0] = 0,
		[1] = 0,	
		[2] = 32,	--�����׼�,�׽
		[3] = 57,	--������ɮ,ϴ�辭
		[4] = 44,	--������ɮ,��������
		[5] = 0,			--����
		[6] = 74,	--����,������
		[7] = 0,			--����
		[8] = 89,	--���ҷ��,������
		[9] = 102,	--�����׼�,���������
		[10] = 0,			--ؤ��
		[11] = 113,--ؤ�ﾻ��,����ʮ����
		[12] = 124,--ؤ������,�򹷹���
		[13] = 0,			--�䵱
		[14] = 146,--�䵱����,����̫����
		[15] = 159,--�䵱�׼�,̫����
		[16] = 0,			--����
		[17] = 732,--����ǹ��,��������ǹ
		[18] = 745,--���Ź���,��������
		[19] = 0,			--�嶾
		[20] = 775,--�嶾а��,����ħ��
		[21] = 774,--�嶾��ʦ,��Ӱħ��
};
	
tVIET_0908_MIJI = {
	{"T� Linh Thi�n � Ph�", 30, {0, 107, 160, 1}},
	{"T� Linh T� � Ph�", 30, {0, 107, 161, 1}},
	{"T� Linh Chi�n � Ph�", 30, {0, 107, 159, 1}},
	{"B�ch Th�o m�t t�ch", 10, {0, 107, 156, 1}},
};

tVIET_0908_MIJI_EXCHANGE = {
	{{0, 107, 64, 4}, {2, 1, 30105, 1}},
	{{0, 107, 65, 4}, {2, 1, 30105, 1}},
	{{0, 107, 66, 2}, {2, 1, 30105, 1}},
};

--�ǽ���
--���ʻ���10000000
--��Ʒ����Ʒ���֣����ʣ�ID�����ͣ���ʧʱ��
--����������࣬���ʣ�������ʽ�����������0
--����>0���=0��Ʒ
tVIET_0908_TANG_AWARD = {
	{"B�n Long b�ch", 625000, {2, 1, 1000, 1}, 0, 7 * 24 * 3600},
	{"M�nh Thi�n th�ch", 1250000, {2, 2, 7, 1}, 0, 0},
	{"Thi�n th�ch", 1250000, {2, 2, 8, 1}, 0, 0},
	{"M�nh B�ng th�ch", 2187500, {2, 1, 148, 1}, 0, 0},
	{"B�ng th�ch", 2187500, {2, 1, 149, 1}, 0, 0},
	{"T�y T�y ��n", 125000, {2, 0, 136, 1}, 0, 7 * 24 * 60 * 60},
	{"B�t B�o T�y T�y Ti�n ��n", 630, {2, 0, 138, 1}, 0, 7 * 24 * 60 * 60},
	{"Ti�u Ki�p t�n", 1250000, {2, 0, 141, 1}, 0, 7 * 24 * 60 * 60},
	{"T�ng Ki�m anh h�ng thi�p", 1250000, {2, 0, 31, 1}, 0, 7 * 24 * 60 * 60},
	{"B�o r��ng T�ng Ki�m ��u qu�n", 12500, {2, 1, 1059, 1}, 0, 30 * 24 * 60 * 60},
	{"B�o r��ng T�ng Ki�m y gi�p", 12500, {2, 1, 1060, 1}, 0, 30 * 24 * 60 * 60},
	{"B�o r��ng T�ng Ki�m hoa kh�", 12500, {2, 1, 1061, 1}, 0, 30 * 24 * 60 * 60},
	{"B�o r��ng T�ng Ki�m trang s�c", 12500, {2, 1, 1062, 1}, 0, 30 * 24 * 60 * 60},
	{"B�o r��ng T�ng Ki�m v� kh�", 12500, {2, 1, 1063, 1}, 0, 30 * 24 * 60 * 60},
	{"B�n Ti�u", 100, {0, 105, 16, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 30 * 24 * 60 * 60},
	{"Phi�u V�", 100, {0, 105, 15, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 30 * 24 * 60 * 60},
	{"��ng V�", 100, {0, 105, 20, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 30 * 24 * 60 * 60},
	{"Si�u Quang", 100, {0, 105, 19, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 30 * 24 * 60 * 60},
	{"��ng Ti�n V�ng", 625000, {2, 1, 30094, 1}, 0, 0},
	{"L� th�y", 17822712, {2, 0, 351, 1}, 0, 0},
	{"Danh v�ng", 625000, "ModifyReputation(%d, 1)", 10, 0},
	{"Danh v�ng", 1250000, "ModifyReputation(%d, 1)", 5, 0},
	{"Danh v�ng", 2500000, "ModifyReputation(%d, 1)", 3, 0},
	{"Danh v�ng", 3125000, "ModifyReputation(%d, 1)", 2, 0},
	{"Danh v�ng", 28765160, "ModifyReputation(%d, 1)", 1, 0},
	{"�i�m s� m�n", 21379660, "SetTask(336, GetTask(336) + %d)", 1, 0},
	{"�i�m s� m�n", 3125000, "SetTask(336, GetTask(336) + %d)", 3, 0},
	{"�i�m s� m�n", 1875000, "SetTask(336, GetTask(336) + %d)", 5, 0},
	{"Thi�n H� M�t t�ch", 1000000, {0, 107, 64, 1}, 0, 0},
	{"T� H� M�t t�ch", 1000000, {0, 107, 65, 1}, 0, 0},
	{"Chi�m Y Ph�", 31250, {0, 107, 66, 1}, 0, 0},
	{"Ti�u Nh�n s�m qu�", 1000000, {2, 0, 552, 1}, 0, 7 * 24 * 60 * 60},
	{"Linh X� Huy�t", 125000, {2, 1, 30105, 1}, 0, 0},
	{"R��ng B� K�p", 62500, {2, 1, 30093, 1}, 0, 30 * 24 * 60 * 60},
	{"B�o R��ng ��c Bi�t", 188, {2, 1, 30091, 1}, 0, 30 * 24 * 60 * 60},
	{"Tu Ch�n Y�u Quy�t", 5000000, {2, 0, 554, 1}, 0, 7 * 24 * 60 * 60},
	{"Th�n N�ng ��n", 500000, {2, 1, 343, 1}, 0, 7 * 24 * 60 * 60}
};



function Viet0908_HeCheng(nType)
	local nCount = 0;
	local nId1 = 0;
	local nId2 = 0;
	local nId3 = 0;
	local nNeedKind = getn(tVIET_0908_HECHENG[nType][1]);
	for i = 1, nNeedKind do
		nCount = tVIET_0908_HECHENG[nType][1][i][2];
		nId1 = tVIET_0908_HECHENG[nType][1][i][3];
		nId2 = tVIET_0908_HECHENG[nType][1][i][4];
		nId3 = tVIET_0908_HECHENG[nType][1][i][5];
		if GetItemCount(nId1, nId2, nId3) < nCount then
			Talk(1, "regainDialog", "��i hi�p mang theo nguy�n li�u kh�ng ��.");
			return
		end
	end
	for i = 1, nNeedKind do
		nCount = tVIET_0908_HECHENG[nType][1][i][2];
		nId1 = tVIET_0908_HECHENG[nType][1][i][3];
		nId2 = tVIET_0908_HECHENG[nType][1][i][4];
		nId3 = tVIET_0908_HECHENG[nType][1][i][5];
		if DelItem(nId1, nId2, nId3, nCount) == 0 then 
			regainDialog();
			return
		end
	end
	gf_SetLogCaption(str_VIET_0908_LOG_TITLE);
	if gf_AddItemEx(tVIET_0908_HECHENG[nType][2][2], tVIET_0908_HECHENG[nType][2][1]) == 1 then
		WriteLogEx("Hoat dong thang 8", "Hop thanh keo trai cay", 1, tVIET_0908_HECHENG[nType][2][3]);
	end
	gf_SetLogCaption("");
	regainDialog();
end

--��ȡ���߽���
function Viet0908_Give_ShangXian_Aword()
	if (tonumber(date("%y%m%d")) < 090911 or tonumber(date("%y%m%d")) > 090914) then
		Talk(1, "", "Ho�t ��ng �� qu� h�n");
		return 0;
	end
	local nDate = tonumber(date("%y%m%d"));
	local nDayWeek = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	
	local nIndependenceEvent = 0;
	if nDate == 090901 or nDate == 090902 then
		nIndependenceEvent = 1;
	end
	
	if (nDayWeek == 2 or nDayWeek == 3 or nDayWeek == 4) and nIndependenceEvent == 0 then
		Talk(1, "", "Ch� c� th� 2, 6, 7 ch� nh�t m�i c� th� nh�n ph�n th��ng l�n m�ng");
		return 0;
	elseif  nHour < 16 and nIndependenceEvent == 0  then
			Talk(1, "", "Ch� nh�n ph�n th��ng l�n m�ng t� 16:00 ��n 24:00");
			return 0;
	end
	if GetLevel() < 73 or GetPlayerRoute() == 0 then
		Talk(1, "", "Th�p h�n c�p 73 v� ch�a v�o m�n ph�i th� kh�ng th� nh�n lo�i ph�n th��ng n�y");
		return 0;
	end
	if GetTask(VIET_0908_TASK_SHANGXIAN_AWORD) >= tonumber(date("%y%m%d")) then
		Talk(1, "", "H�m nay ��i hi�p �� nh�n ph�n th��ng, xin h�y ��i ng�y mai");
		return 0;
	end
	local nExp = 0;
	local nRep = GetReputation();
	local nFac = GetTask(336);
	local nRepLevel = viet0908_get_aword_level(nRep, tVIET_0908_SHANGXIAN_AWORD);
	local nFacLevel = viet0908_get_aword_level(nFac, tVIET_0908_SHANGXIAN_AWORD);
	if nRepLevel == 0 and nFacLevel == 0  and nIndependenceEvent == 0 then
		Talk(1, "", "�i�m danh v�ng v� c�ng hi�n s� m�n kh�ng �� nh�n ph�n th��ng n�y.");
		return 0;
	end
	if nRepLevel ~= 0 then
		ModifyExp(tVIET_0908_SHANGXIAN_AWORD[nRepLevel][3]);
		Msg2Player("B�n nh�n ���c "..tVIET_0908_SHANGXIAN_AWORD[nRepLevel][3].." �i�m kinh nghi�m");
		WriteLog(GetName() .. "get "..tVIET_0908_SHANGXIAN_AWORD[nRepLevel][3] .. "  �i�m kinh nghi�m")
		WriteLogEx("Hoat dong thang 8", "Online nhan thuong");
	end
	if nFacLevel ~= 0 then
		ModifyExp(tVIET_0908_SHANGXIAN_AWORD[nFacLevel][3]);
		Msg2Player("B�n nh�n ���c "..tVIET_0908_SHANGXIAN_AWORD[nFacLevel][3].." �i�m kinh nghi�m");
		WriteLog(GetName() .. "get "..tVIET_0908_SHANGXIAN_AWORD[nFacLevel][3] .. "  �i�m kinh nghi�m")
		WriteLogEx("Hoat dong thang 8", "Online nhan thuong");
	end
	if nIndependenceEvent == 1 and (nDayWeek == 2 or nDayWeek == 3)  then
		ModifyExp(2919450);
		Msg2Player("B�n nh�n ���c 2919450 �i�m kinh nghi�m");
		WriteLog(GetName() .. "get 2919450 �i�m kinh nghi�m")
		WriteLogEx("Hoat dong thang 8", "Online nhan thuong Quoc khanh");
	end
	SetTask(VIET_0908_TASK_SHANGXIAN_AWORD, tonumber(date("%y%m%d")));
end

--�ж����ڵ�������ʦ�Ź��׶ȿ��Ի�õڼ�������
function viet0908_get_aword_level(nValue, tAword)
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

--����һ��ɱ��ֵ
function Viet0908_Add_ShaQi()
	if (tonumber(date("%y%m%d")) >= 091001) then
		Talk(1, "", "Ho�t ��ng �� qu� h�n");
		return 0;
	end
	local nDayWeek = tonumber(date("%w"));
	if nDayWeek == 2 or nDayWeek == 3 or nDayWeek == 4 then
		Talk(1, "", "Ch� t�i th� 2, 6, 7 ch� nh�t m�i c� th� nh�n ���c tr� s�t kh�");
		return 0;
	end
	local nRoute = GetPlayerRoute();
	if tbViet_0908_SkillID[nRoute] == 0 or GetSkillLevel(tbViet_0908_SkillID[nRoute]) == 0 then
		Talk(1, "", "��i hi�p v�n ch�a h�c k� n�ng tr�n ph�i, v� v�y kh�ng th� t�ng tr� s�t kh� ���c.");
		return 0;
	end
	if GetMomentum() >= 10 then
		Talk(1, "", "Tr� s�t kh� hi�n t�i �� ��y, kh�ng th� t�ng th�m �i�m s�t kh� ���c.");
		return 0;
	end
	if GetTask(VIET_0908_TASK_GET_SHAQI_DATE) < tonumber(date("%y%m%d")) then
		SetTask(VIET_0908_TASK_GET_SHAQI_COUNT, 0);
	end
	if GetTask(VIET_0908_TASK_GET_SHAQI_COUNT) >= 10 then
		Talk(1, "", "H�m nay c�c h� �� nh�n tr� s�t kh� 10 l�n r�i, kh�ng th� nh�n th�m ���c n�a.");
		return 0;
	end
	SetMomentum(GetMomentum() + 5);
	SetTask(VIET_0908_TASK_GET_SHAQI_COUNT, GetTask(VIET_0908_TASK_GET_SHAQI_COUNT) + 1);
	SetTask(VIET_0908_TASK_GET_SHAQI_DATE, tonumber(date("%y%m%d")));
	Msg2Player("Nh�n ���c 5 �i�m s�t kh�");
	WriteLogEx("Hoat dong thang 8", "Tran phai Than Khi");
end

--����Ѫ���ؼ�
function Viet0908_LingSheXie_Miji()
	if tonumber(date("%y%m%d")) < 090807 or tonumber(date("%y%m%d")) >= 090907 then
		Talk(1, "", "Ho�t ��ng �� qu� h�n");
		return 0;
	end
	if GetLevel() < 30 then
		Talk(1,"", "C�c h� ch�a �� ��ng c�p c�n thi�t");
	 	return 0;
	end
	
	nType = 1;
	nRand = random(1, 100);
	if  nRand <= 34 then
		nType = 1;
	elseif nRand > 34 and nRand <= 68 then
		nType = 2;
	elseif nRand > 68 then
		nType = 3;
	end
	
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then return end
	local nId11 = tVIET_0908_MIJI_EXCHANGE[nType][1][1];
	local nId12 = tVIET_0908_MIJI_EXCHANGE[nType][1][2];
	local nId13 = tVIET_0908_MIJI_EXCHANGE[nType][1][3];
	local nCount1 = tVIET_0908_MIJI_EXCHANGE[nType][1][4]
	local nId21 = tVIET_0908_MIJI_EXCHANGE[nType][2][1];
	local nId22 = tVIET_0908_MIJI_EXCHANGE[nType][2][2];
	local nId23 = tVIET_0908_MIJI_EXCHANGE[nType][2][3];
	local nCount2 = tVIET_0908_MIJI_EXCHANGE[nType][2][4]
	if GetItemCount(nId21, nId22, nId23) < nCount2 or GetCash() < 1000000 then
		Say("C�c h� kh�ng mang theo �� nh�ng th� ta c�n.", 0);
		return 0;
	end
	if DelItem(nId21, nId22, nId23, nCount2) == 1 and Pay(1000000) == 1 then
		--����Ʒ����
		local nRand = gf_GetRandItemByTable(tVIET_0908_MIJI, 100, 1);
		gf_SetLogCaption(str_VIET_0908_LOG_TITLE);
		if gf_AddItemEx(tVIET_0908_MIJI[nRand][3], tVIET_0908_MIJI[nRand][1]) == 1 then
			WriteLogEx("Hoat dong thang 8", "Doi Mat Tich", 1, tVIET_0908_MIJI[nRand][1]);
		end
		gf_SetLogCaption("");
	end
end

function regainDialog()
	local nDate = tonumber(date("%y%m%d%H"));
	----���ʱ��
	if nDate < 09080700 or nDate >= 09090700 then
		Talk(1, "", "Ho�t ��ng �� qu� h�n th�i gian r�i");
		return 0;
	end
	
	Say(
			"S� ki�n th�ng 8 di�n ra t� ng�y 07-08-2009 ��n h�t 24 gi� ng�y 06-09-2009. Chi ti�t s� ki�n ��ng ��o c� th� tham kh�o tr�n trang ch�: http://volam2.zing.vn",
			7,
			"H�p th�nh K�o Nho (c�n 4 Nho T��i v� 1 T�i H��ng Li�u)/#Viet0908_HeCheng(1)",
			"H�p th�nh K�o M�ng C�u (c�n 4 M�ng C�u v� 1 T�i H��ng Li�u)/#Viet0908_HeCheng(2)",
			"H�p th�nh K�o S�u Ri�ng (c�n 4 S�u Ri�ng v� 1 T�i H��ng Li�u)/#Viet0908_HeCheng(3)",
			"Ta mu�n nh�n ph�n th��ng �i�m kinh nghi�m./Viet0908_Give_ShangXian_Aword",
			"T�ng 5 tr� s�t kh�./Viet0908_Add_ShaQi",
			"Mua 1 L� Th�y (1 L� Th�y = 10 b�c)/BuyWater",
			"K�t th�c ��i tho�i/dialog_over"
		);
end

--����¶ˮ
function BuyWater()
	if gf_Judge_Room_Weight(1, 10, " ") == 0 then
		return
	end
	if Pay(1000) == 0 then
		Talk(1, "", "Ng�n l��ng c�a b�n kh�ng ��!");
		return
	end
	gf_AddItemEx({2, 0, 351, 1}, "L� th�y");
end

function dialog_over()
end