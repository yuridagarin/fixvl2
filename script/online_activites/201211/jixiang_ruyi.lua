Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\misc\\taskmanager.lua")

VET_ACTIVITY_JIXIANG_RUYI = 78

VET_ACTIVITY_JIXIANG_RUYI_TASK = TaskManager:Create(6,4)
VET_ACTIVITY_JIXIANG_RUYI_TASK.Count = 1;
VET_ACTIVITY_JIXIANG_RUYI_TASK.DaySeq = 2;

TABLE_JIXIANG_RUYI = {
		"Mua Ti�u Nh� � (c�n 1 Xu v�t ph�m)/Buy_XiaoRuYi",
		"D�ng Ti�u Nh� � ��i th��ng (ti�u hao 10 Ti�u Nh� � + 3 Xu v�t ph�m)/Use_XiaoRuYi_Deal",
		"D�ng C�t T��ng Th�ch ��i gi�i th��ng n�m m�i 2013/Use_JiXiangShi",
		"T�i h� ch� xem qua th�i/nothing",
};

TABLE_XIAORUYI_AWARD  = {
    {1, 2222, "M�c R��ng", {2, 1, 30340, 1}, 0},
    {1, 279, "C�t t��ng th�ch", {2, 1, 30015, 1}, 0},
    {2, 1000, 100000, 1},
    {2, 1000, 200000, 1},
    {2, 1000, 500000, 1},
    {3, 2200, 10000, 1},
    {4, 850, 5, 1},
    {5, 850, 5, 1},
    {28, 599, 1, 1},
};

TABLE_JIXIANG_AWARD = {
		{1, "Ma �ao Th�ch c�p 1", {2, 1, 30428, 1, 1}, 4, 30 * 24 * 3600, "(H�n s� d�ng 30 ng�y, c� th� giao d�ch)"},
		{1, "Ma ��o Th�ch c�p 2", {2, 1, 30429, 1, 1}, 6, 30 * 24 * 3600, "(H�n s� d�ng 30 ng�y, c� th� giao d�ch)"},	
		{1, "Ma �ao Th�ch c�p 3", {2, 1, 30430, 1, 1}, 9, 30 * 24 * 3600, "(H�n s� d�ng 30 ng�y, c� th� giao d�ch)"},
		{1, "C��ng h�a quy�n 12", {2, 1, 30424, 1, 1}, 39, 30 * 24 * 3600, "(H�n s� d�ng 30 ng�y, c� th� giao d�ch)"},
		{1, "C��ng h�a quy�n 13", {2, 1, 30425, 1, 1}, 60, 30 * 24 * 3600, "(H�n s� d�ng 30 ng�y, c� th� giao d�ch)"},
		{1, "C��ng h�a quy�n 14", {2, 1, 30426, 1, 1}, 99, 30 * 24 * 3600, "(H�n s� d�ng 30 ng�y, c� th� giao d�ch)"},
		{1, "C��ng h�a quy�n 15", {2, 1, 30427, 1, 1}, 79, 30 * 24 * 3600, "(H�n s� d�ng 30 ng�y, c� th� giao d�ch)"},
		{1, "b�nh �t B�c B�o", {2, 1, 1125, 10, 4}, 66, 0, "(Kh�ng th� giao d�ch)"},
		{2, "Ni�n th�", {0, 105, 33, 1, 4, -1, -1, -1, -1, -1, -1}, 18, 7 * 24 * 3600, "(H�n s� d�ng 7 ng�y, kh�ng th� giao d�ch)"},
		{2, "Ni�n th�", {0, 105, 33, 1, 3, -1, -1, -1, -1, -1, -1}, 888, 0, "(V�nh vi�n, c� th� giao d�ch)"},
		{3, "1.800.000.000Exp", 1800000000, 2003, 0, " "},
		{4, "88.000 �i�m qu�n c�ng", 88000, 1989, 0, " "},
};

function Buy_XiaoRuYi()
		local nNum1 = GetItemCount(2, 1, 30230);
		local nNum2 = GetFreeItemRoom() * 999;
		AskClientForNumber("Buy_XiaoRuYi_Deal", 1, min(nNum1, nNum2), "Nh�p s� l��ng","");
end

function Buy_XiaoRuYi_Deal(nNum)
		if GetFreeItemRoom() < ceil(nNum/999) then
			Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
			return
		end
		if nNum > GetItemCount(2, 1, 30230) then
			Talk(1,"",format("S� l��ng Xu v�t ph�m kh�ng �� <color=red>%d<color>",nNum));
			return
		end
		if DelItem(2, 1, 30230, nNum) == 1 then
			AddItem(2, 1, 30030, nNum);
			gf_WriteLogEx("NIEN THU NHU Y", "mua  th�nh c�ng", nNum, "Ti�u Nh� �")
		end
end

function Use_XiaoRuYi()
	Say("X�c ��nh d�ng 10 Ti�u Nh� � v� 3 Xu v�t ph�m ��i th��ng?", 2, "��ng �/Use_XiaoRuYi_Deal", "T�i h� ch� xem qua th�i/nothing");
end

function Use_XiaoRuYi_Deal()
	if GetFreeItemRoom() < 4 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return
	end
	if GetItemCount(2, 1, 30030) < 10 then
		Talk(1,"","S� l��ng Ti�u Nh� � kh�ng �� <color=red>10<color>");
		return
	end
	if GetItemCount(2, 1, 30230) < 3 then
		Talk(1,"",format("S� l��ng Xu v�t ph�m kh�ng �� <color=red>%d<color>",3));
		return
	end
	if VET_ACTIVITY_JIXIANG_RUYI_TASK:GetTask(VET_ACTIVITY_JIXIANG_RUYI_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_ACTIVITY_JIXIANG_RUYI_TASK:SetTask(VET_ACTIVITY_JIXIANG_RUYI_TASK.DaySeq, zgc_pub_day_turn());
		VET_ACTIVITY_JIXIANG_RUYI_TASK:SetTask(VET_ACTIVITY_JIXIANG_RUYI_TASK.Count, 0);
	end
	if VET_ACTIVITY_JIXIANG_RUYI_TASK:GetTask(VET_ACTIVITY_JIXIANG_RUYI_TASK.Count) >= 100 then
		Talk(1,"","M�i ng��i m�i ng�y c� th� ��i t�i �a 100 l�n");
		return
	end
	if DelItem(2, 1, 30030, 10) == 1 and DelItem(2, 1, 30230, 3) == 1 then
		gf_Modify("Exp", 2500000);
		gf_EventGiveRandAward(TABLE_XIAORUYI_AWARD, 10000, 1, "NIEN THU NHU Y", "Ph�n th��ng Ti�u Nh� �");
		VET_ACTIVITY_JIXIANG_RUYI_TASK:SetTask(VET_ACTIVITY_JIXIANG_RUYI_TASK.Count, VET_ACTIVITY_JIXIANG_RUYI_TASK:GetTask(VET_ACTIVITY_JIXIANG_RUYI_TASK.Count) + 1);
	end
end

function Use_JiXiangShi()
	local tSayTable = {}
	local strTemp = ""
	for i = 1, getn(TABLE_JIXIANG_AWARD) do
		if TABLE_JIXIANG_AWARD[i][1] == 1 or TABLE_JIXIANG_AWARD[i][1] == 2 then
			strTemp = format("D�ng %d C�t T��ng Th�ch ��i %sx%d%s/#Use_JiXiangShi_Deal(%d)", TABLE_JIXIANG_AWARD[i][4], TABLE_JIXIANG_AWARD[i][2], TABLE_JIXIANG_AWARD[i][3][4], TABLE_JIXIANG_AWARD[i][6], i);
		else
			strTemp = format("D�ng %d C�t T��ng Th�ch ��i %s/#Use_JiXiangShi_Deal(%d)", TABLE_JIXIANG_AWARD[i][4], TABLE_JIXIANG_AWARD[i][2], i);
		end
		tinsert(tSayTable, strTemp);
	end
	tinsert(tSayTable, "T�i h� ch� xem qua th�i/nothing");
	Say("C�c h� x�c ��nh d�ng C�t T��ng Th�ch ��i ph�n th��ng n�m m�i 2013?", getn(tSayTable), tSayTable);
end

function Use_JiXiangShi_Deal(nIndex)
	local tAward = TABLE_JIXIANG_AWARD[nIndex];
	if not tAward or not tAward[3] then return end
--	if GetFreeItemRoom() < 2 then  	-- type(tAward[3]) == table and 
	if gf_Judge_Room_Weight(2, 100) ~= 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return
	end
	if GetItemCount(2, 1, 30015) < tAward[4] then
		Talk(1,"",format("S� l��ng C�t T��ng Th�ch kh�ng �� <color=red>%d<color>", tAward[4]));
		return
	end
	if DelItem(2, 1, 30015, tAward[4]) ~= 1 then
		return
	end
	if tAward[1] == 1 then
		--��õ���
		local nRet, nIndex = AddItem(tAward[3][1], tAward[3][2], tAward[3][3], tAward[3][4], tAward[3][5]);
		if tAward[5] ~= 0 then
			SetItemExpireTime(nIndex, tAward[5]);
		end
	elseif tAward[1] == 2 then
		--���װ��
		local nRet, nIndex = AddItem(tAward[3][1], tAward[3][2], tAward[3][3], tAward[3][4], tAward[3][5], tAward[3][6], tAward[3][7], tAward[3][8], tAward[3][9], tAward[3][10], tAward[3][11]);
		if tAward[5] ~= 0 then
			SetItemExpireTime(nIndex, tAward[5]);
		end
	elseif tAward[1] == 3 then
		--��þ���
		gf_Modify("Exp", tAward[3]);
	elseif tAward[1] == 4 then
		--��þ���
		if GetTask(701) >= 0 then
    			SetTask(701, GetTask(701) + tAward[3])
	  	else
	  		SetTask(701, GetTask(701) - tAward[3])
	  	end
	  	local szMsg2Player = format("C�c h� nh�n ���c %d �i�m qu�n c�ng", tAward[3])
    		Msg2Player(szMsg2Player);        
	end 
	gf_WriteLogEx("NIEN THU NHU Y", "nh�n th�nh c�ng", 1, "Nh�n th��ng 2013: "..tAward[2])	
end
