Include("\\script\\lib\\date.lua")
Include("\\script\\lib\\sdb.lua")
Include("\\script\\online\\tong_feast\\tf_define.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task_access_code_def.lua")

--��Ƿ���
function tf_IsOpen()
	local today = Date();
	if today:week() ~= 6 and today:week() ~= 0 then
		return 0;
	end
	local nHour = tonumber(date("%H"));
	DebugOutput("nHour =", nHour);
	if nHour >= 21 or nHour < 18 then
		return 0;
	end
	return 1;
end

--��λnpc������
function tf_GetNpcTablePos(npcIndex)
	npcIndex = npcIndex or GetTargetNpc();
	local nMapId, nX, nY = GetNpcWorldPos(npcIndex);
	for i = 1, getn(TF_NPC_POS) do
		for j = 1, 3 do
			if TF_NPC_POS[i][j][1] == nMapId and TF_NPC_POS[i][j][2] == nX and TF_NPC_POS[i][j][3] == nY then
				return i, j;
			end
		end
	end
	return 0,0;
end

--ʱ���
function tf_GetTimestamp()
	return tonumber(date("%m%d%H"));
end

--�Ƿ��ǰ�����
function tf_IsTongManager()
	local nDuty = GetTongDuty();
	if nDuty == 1 or nDuty == 2 or nDuty == 3 then
		return 1;
	end
	return 0;
end

--��������
function tf_CheckCondition()
	if IsTongMember() == 0 then
		Talk(1,"","��i hi�p ng��i ch�a gia nh�p bang h�i!")
		return 0;
	end
	local nCurTime = GetTime();
	local nJoinTime = GetJoinTongTime();
	DebugOutput("nCurTime, nJoinTime", nCurTime, nJoinTime, nCurTime-nJoinTime)
	if TF_ISFORTEST ~= 1 and nCurTime - nJoinTime < 7 * 24 * 3600 then
		Talk(1,"","��i hi�p ng��i gia nh�p bang h�i ch�a �� B�y ng�y, ch�a th� tham gia y�n ti�c bang h�i!");
		return 0;
	end
	if gf_CheckBaseCondition(80) == 0 then
		return 0;
	end
	return 1;
end

--����Ԥ�������ʱ��
--ǰ10min��Ԥ�����ʱ��
function tf_IsChefTime()
	local nMinute = tonumber(date("%M"));
	if nMinute >= 0 and nMinute <= 10 then
		return 1;
	end
	return 0;
end

--�����Ͻ����ϵ�ʱ��
--ֻҪԤ���˴��15min�ڶ������Ͻ�ʳ��
function tf_IsHangInTime()
	local nMinute = tonumber(date("%M"));
	if nMinute >= 0 and nMinute <= 15 then
		return 1;
	elseif nMinute > 15 and nMinute <= 20 then
		return 2;
	else
		return 0;
	end
end

--����ʱ��
function tf_IsStartTime()
	local nMinute = tonumber(date("%M"));
	if nMinute > 20 and nMinute <= 35 then
		return 1;
	end
	return 0;
end

--����ʳ������ȡ������������Ҫ�Ͻ��Ĳ�����
function tf_GetTableNum(nPig, nCow, nSheep, nBacon)
	local nMin = min(min(min(nPig, nCow), min(nSheep, nBacon)), TF_HAND_IN_MAX);
	local nRet1 = min(floor(nMin / 45), 16);
	local nRet2 = ((nRet1 - 3 >= 0) and (nRet1 - 3)) or 0;
	DebugOutput("nRet1, nRet2",nRet1, nRet2);
	return nRet1, nRet2;
end

function tf_ResetTask_Everyday()
end

function tf_ResetTask_Weekly()
	SetTask(TF_TASK_1, 0, TASK_ACCESS_CODE_TONG_FEAST);
	SetTask(TF_TASK_2, 0, TASK_ACCESS_CODE_TONG_FEAST);
	SetTask(TF_TASK_3, 0, TASK_ACCESS_CODE_TONG_FEAST);
	SetTask(TF_TASK_4, 0, TASK_ACCESS_CODE_TONG_FEAST);
	SetTask(TF_TASK_6, 0, TASK_ACCESS_CODE_TONG_FEAST);
	SetTask(TF_TASK_8, 0, TASK_ACCESS_CODE_TONG_FEAST);
	SetTask(TF_TASK_9, 0, TASK_ACCESS_CODE_TONG_FEAST);
end

function tf_SetPig(nNum)
	if not nNum or nNum < 0 then
		print("UDERROR: nNum is illegality")
		return 0;
	end
	gf_SetMyTaskByte(TF_TASK_1, 1, 2, nNum, TASK_ACCESS_CODE_TONG_FEAST);
end

function tf_GetPig()
	return gf_GetMyTaskByte(TF_TASK_1, 1, 2);
end

function tf_SetCow(nNum)
	if not nNum or nNum < 0 then
		print("UDERROR: nNum is illegality")
		return 0;
	end
	gf_SetMyTaskByte(TF_TASK_1, 3, 4, nNum, TASK_ACCESS_CODE_TONG_FEAST);
end

function tf_GetCow()
	return gf_GetMyTaskByte(TF_TASK_1, 3, 4);
end

function tf_SetSheep(nNum)
	if not nNum or nNum < 0 then
		print("UDERROR: nNum is illegality")
		return 0;
	end
	gf_SetMyTaskByte(TF_TASK_2, 1, 2, nNum, TASK_ACCESS_CODE_TONG_FEAST);
end

function tf_GetSheep()
	return gf_GetMyTaskByte(TF_TASK_2, 1, 2);
end

function tf_SetBacon(nNum)
	if not nNum or nNum < 0 then
		print("UDERROR: nNum is illegality")
		return 0;
	end
	gf_SetMyTaskByte(TF_TASK_2, 3, 4, nNum, TASK_ACCESS_CODE_TONG_FEAST);
end

function tf_GetBacon()
	return gf_GetMyTaskByte(TF_TASK_2, 3, 4);
end

function tf_SetWine(nNum)
	if not nNum or nNum < 0 then
		print("UDERROR: nNum is illegality")
		return 0;
	end
	gf_SetMyTaskByte(TF_TASK_3, 1, 2, nNum, TASK_ACCESS_CODE_TONG_FEAST);
end

function tf_GetWine()
	return gf_GetMyTaskByte(TF_TASK_3, 1, 2);
end

function tf_SetTc(nNum)
	if not nNum or nNum < 0 then
		print("UDERROR: nNum is illegality")
		return 0;
	end
	gf_SetMyTaskByte(TF_TASK_3, 3, 4, nNum, TASK_ACCESS_CODE_TONG_FEAST);
end

function tf_GetTc()
	return gf_GetMyTaskByte(TF_TASK_3, 3, 4);
end

function tf_SetCooker(nNum)
	if not nNum or nNum < 0 then
		print("UDERROR: nNum is illegality")
		return 0;
	end
	gf_SetMyTaskByte(TF_TASK_4, 1, 2, nNum, TASK_ACCESS_CODE_TONG_FEAST);
end

function tf_GetCooker()
	return gf_GetMyTaskByte(TF_TASK_4, 1, 2);
end

function tf_SetDinnerKind(nNum)
	if not nNum or nNum < 0 then
		print("UDERROR: nNum is illegality")
		return 0;
	end
	gf_SetTaskByte(TF_TASK_6, 1, nNum, TASK_ACCESS_CODE_TONG_FEAST);
end

function tf_GetDinnerKind()
	return gf_GetTaskByte(TF_TASK_6, 1);
end

function tf_SetIsDinner(nNum)
	if not nNum or nNum < 0 then
		print("tf_SetIsDinner UDERROR: nNum is illegality")
		return 0;
	end
	gf_SetTaskByte(TF_TASK_6, 2, nNum, TASK_ACCESS_CODE_TONG_FEAST);
end

function tf_GetIsDinner()
	return gf_GetTaskByte(TF_TASK_6, 2);
end

function tf_SetTimerStep(nNum)
	if not nNum or nNum < 0 then
		print("tf_SetTimerStep UDERROR: nNum is illegality")
		return 0;
	end
	gf_SetTaskByte(TF_TASK_6, 3, nNum, TASK_ACCESS_CODE_TONG_FEAST);
end

function tf_GetTimerStep()
	return gf_GetTaskByte(TF_TASK_6, 3);
end

function tf_SetIsUseTw(nNum)
	if not nNum or nNum < 0 then
		print("UDERROR: nNum is illegality")
		return 0;
	end
	gf_SetTaskByte(TF_TASK_6, 4, nNum, TASK_ACCESS_CODE_TONG_FEAST);
end

function tf_GetIsUseTw()
	return gf_GetTaskByte(TF_TASK_6, 4);
end

function tf_SetTcNpcIndex(nNum)
	if not nNum or nNum < 0 then
		print("UDERROR: nNum is illegality")
		return 0;
	end
	gf_SetMyTaskByte(TF_TASK_4, 3, 4, nNum, TASK_ACCESS_CODE_TONG_FEAST);
end

function tf_GetTcNpcIndex()
	return gf_GetMyTaskByte(TF_TASK_4, 3, 4);
end

function tf_SetWineUseCD(nNum)
	if not nNum or nNum < 0 then
		print("UDERROR: nNum is illegality")
		return 0;
	end
	SetTask(TF_TASK_8, nNum, TASK_ACCESS_CODE_TONG_FEAST);
end

function tf_GetWineUseCD()
	return GetTask(TF_TASK_8);
end

function tf_SetBuffTime(nNum)
	if not nNum or nNum < 0 then
		print("UDERROR: nNum is illegality")
		return 0;
	end
	SetTask(TF_TASK_9, nNum, TASK_ACCESS_CODE_TONG_FEAST);
end

function tf_GetBuffTime()
	return GetTask(TF_TASK_9);
end

function tf_Award_JingZhiCooker()
	gf_ModifyExp(10000000);
	gf_AddItemEx2({TF_ITEM_TONG_TOKEN_CHIP[1], TF_ITEM_TONG_TOKEN_CHIP[2], TF_ITEM_TONG_TOKEN_CHIP[3], 15}, TF_ITEM_TONG_TOKEN_CHIP[4], 
			"Y�n Ti�c Bang H�i", "D�ng t�ng B� N�u B�p", 0, 1);
end

function tf_Award_ShiCai(nTotal)
	if not nTotal or nTotal <= 0 then
		return 0;
	end
	gf_ModifyExp(10000*nTotal);
	local nCurTotal = tf_GetPig() + tf_GetCow() + tf_GetSheep() + tf_GetBacon();
	local nLastTotal = nCurTotal - nTotal;
	DebugOutput("nLastTotal,nCurTotal =",nLastTotal,nCurTotal)
	local nNum = 0;
	if nLastTotal < 350 then
		if nCurTotal >= 350 and nCurTotal < 700 then
			nNum = 5;
		elseif nCurTotal >= 700 and nCurTotal < 1000 then
			nNum = 10;
		elseif nCurTotal >= 1000 then
			nNum = 15;
		end
	elseif nLastTotal >= 350 and nLastTotal < 700 then
		if nCurTotal >= 700 and nCurTotal < 1000 then
			nNum = 5;
		elseif nCurTotal >= 1000 then
			nNum = 10;
		end
	elseif nLastTotal >= 700 and nLastTotal < 1000 then
		if nCurTotal >= 1000 then
			nNum = 5;
		end
	elseif nLastTotal >= 1000 then
		nNum = 0;
	end
	gf_AddItemEx2({TF_ITEM_TONG_TOKEN_CHIP[1], TF_ITEM_TONG_TOKEN_CHIP[2], TF_ITEM_TONG_TOKEN_CHIP[3], nNum}, TF_ITEM_TONG_TOKEN_CHIP[4], 
		"Y�n Ti�c Bang H�i", "D�ng t�ng �� �n", 0, 1);
end

function tf_Award_JingzhiTableChair()
	gf_ModifyExp(3000000);
end

--ͳ��һ��������ͬһ�����������1�ĳ��ִ���
--1,2,3,4,5,6,7,8
function tf_StaticTongNum(nWhichRaid)
	DebugOutput("tf_StaticTongNum", nWhichRaid);
	local tTong = {
		--[TongName] = TongCount
	};
	local oldPlayerIndex = PlayerIndex;
	for i = 1, gf_GetTeamSize() do
		PlayerIndex = gf_GetTeamMember(i);
		if IsTongMember() ~= 0 then
			local szTongName = GetTongName();
			DebugOutput("szTongName =",szTongName)
			if tTong[szTongName] == nil then
				DebugOutput("tTong[szTongName] == nil")
				tTong[szTongName] = 1;
			elseif tTong[szTongName] > 0 then
				DebugOutput("tTong[szTongName] > 0");
				tTong[szTongName] = tTong[szTongName] + 1;
			end
		end
	end
	PlayerIndex = oldPlayerIndex;
	DebugOutput("getn(tTong) =", getn(tTong));
	DebugOutput(tTong[GetTongName()]);
	for k, v in tTong do
		DebugOutput("StaticTongNum", nWhichRaid, k, v);
		AddRuntimeStat(7, tonumber(nWhichRaid), tonumber(v), 1);
	end
end


function tf_TeamTongNum()
	local nRet = 0;
	local oldPlayerIndex = PlayerIndex;
	local szTongName = GetTongName();
	for i = 1, gf_GetTeamSize() do
		PlayerIndex = gf_GetTeamMember(i);
		if IsTongMember() ~= 0 and GetTongName() == szTongName then
			nRet = nRet + 1;
		end
	end
	PlayerIndex = oldPlayerIndex;
	return nRet;
end

function tf_raiddrop()
	if TF_SWITH ~= 1 then
		return 0;
	end
	local nIndex = tf_TeamTongNum();
	if not TF_RAIDDROP_PB[nIndex] then
		return 0;
	end
	if random(100) < TF_RAIDDROP_PB[nIndex] then
		return 1;
	end
	return 0;
end

function tf_raiddrop_wine(nPlb)
	if TF_SWITH ~= 1 then
		return 0;
	end
	if GetFreeItemRoom() < 1 then
		return 0;
	end
	if IsTongMember() ~= 0 and random(1000) <= nPlb then
		AddItem(TF_ITEM_WINE[1], TF_ITEM_WINE[2], TF_ITEM_WINE[3], 1);
		return 1;
	end 	
	return 0;
end

function tf_raiddrop_cjsz()
	if GetFreeItemRoom() < 1 then
		return 0;
	end
	if tf_raiddrop() == 1 then
		AddItem(TF_ITEM_PIG[1], TF_ITEM_PIG[2], TF_ITEM_PIG[3], 1);
		AddRuntimeStat(7, 1, 0, 1);
	end
	if tf_raiddrop_wine(5) == 1 then
		AddRuntimeStat(7, 2, 0, 1);
	end
	if GetName() == gf_GetCaptainName() then
		tf_StaticTongNum(19);
	end
end

function tf_raiddrop_wjz_14()
	if GetFreeItemRoom() < 1 then
		return 0;
	end
	if tf_raiddrop() == 1 then
		AddItem(TF_ITEM_PIG[1], TF_ITEM_PIG[2], TF_ITEM_PIG[3], 1);
		AddRuntimeStat(7, 3, 0, 1);
	end
	if tf_raiddrop_wine(2) == 1 then
		AddRuntimeStat(7, 4, 0, 1);
	end
	if GetName() == gf_GetCaptainName() then
		tf_StaticTongNum(20);
	end
end

function tf_raiddrop_ls_14()
	if GetFreeItemRoom() < 1 then
		return 0;
	end
	if tf_raiddrop() == 1 then
		AddItem(TF_ITEM_COW[1], TF_ITEM_COW[2], TF_ITEM_COW[3], 1);
		AddRuntimeStat(7, 5, 0, 1);
	end
	if tf_raiddrop_wine(3) == 1 then
		AddRuntimeStat(7, 6, 0, 1);
	end
	if GetName() == gf_GetCaptainName() then
		tf_StaticTongNum(21);
	end
end

function tf_raiddrop_ls_ib()
	if GetFreeItemRoom() < 1 then
		return 0;
	end
	if tf_raiddrop() == 1 then
		AddItem(TF_ITEM_COW[1], TF_ITEM_COW[2], TF_ITEM_COW[3], 1);
		AddRuntimeStat(7, 5, 0, 1);
	end
	if tf_raiddrop_wine(10) == 1 then
		AddRuntimeStat(7, 5, 0, 1);
	end
	if GetName() == gf_GetCaptainName() then
		tf_StaticTongNum(21);
	end
end

function tf_raiddrop_dxg_13()
	if GetFreeItemRoom() < 1 then
		return 0;
	end
	if tf_raiddrop() == 1 then
		AddItem(TF_ITEM_COW[1], TF_ITEM_COW[2], TF_ITEM_COW[3], 1);
		AddRuntimeStat(7, 7, 0, 1);
	end
	if tf_raiddrop_wine(2) == 1 then
		AddRuntimeStat(7, 8, 0, 1);
	end
	if GetName() == gf_GetCaptainName() then
		tf_StaticTongNum(22);
	end
end

function tf_raiddrop_dxg_ib()
	if GetFreeItemRoom() < 1 then
		return 0;
	end
	if tf_raiddrop() == 1 then
		AddItem(TF_ITEM_COW[1], TF_ITEM_COW[2], TF_ITEM_COW[3], 1);
		AddRuntimeStat(7, 7, 0, 1);
	end
	if tf_raiddrop_wine(10) == 1 then
		AddRuntimeStat(7, 8, 0, 1);
	end
	if GetName() == gf_GetCaptainName() then
		tf_StaticTongNum(22);
	end
end

function tf_raiddrop_tx()
	if GetFreeItemRoom() < 1 then
		return 0;
	end
	if tf_raiddrop() == 1 then
		AddItem(TF_ITEM_SHEEP[1], TF_ITEM_SHEEP[2], TF_ITEM_SHEEP[3], 1);
		AddRuntimeStat(7, 9, 0, 1);
	end
	if tf_raiddrop_wine(2) == 1 then
		AddRuntimeStat(7, 10, 0, 1);
	end
	if GetName() == gf_GetCaptainName() then
		tf_StaticTongNum(23);
	end
end

function tf_raiddrop_ttd_17()
	if GetFreeItemRoom() < 1 then
		return 0;
	end
	if tf_raiddrop() == 1 then
		AddItem(TF_ITEM_SHEEP[1], TF_ITEM_SHEEP[2], TF_ITEM_SHEEP[3], 1);
		AddRuntimeStat(7, 11, 0, 1);
	end
	if tf_raiddrop_wine(5) == 1 then
		AddRuntimeStat(7, 12, 0, 1);
	end
	if GetName() == gf_GetCaptainName() then
		tf_StaticTongNum(24);
	end
end

function tf_raiddrop_kfbattle()
	if GetFreeItemRoom() < 1 then
		return 0;
	end
	AddItem(TF_ITEM_BACON[1], TF_ITEM_BACON[2], TF_ITEM_BACON[3], 5);
	AddRuntimeStat(7, 13, 0, 1);
	if tf_raiddrop_wine(2) == 1 then
		AddRuntimeStat(7, 14, 0, 1);
	end
end

function tf_raiddrop_slbattle()
	if GetFreeItemRoom() < 1 then
		return 0;
	end
	AddItem(TF_ITEM_BACON[1], TF_ITEM_BACON[2], TF_ITEM_BACON[3], 3);
	AddRuntimeStat(7, 15, 0, 1);
	if tf_raiddrop_wine(2) == 1 then
		AddRuntimeStat(7, 16, 0, 1);
	end
end

function tf_raiddrop_tmz()
	if GetFreeItemRoom() < 1 then
		return 0;
	end
	AddItem(TF_ITEM_BACON[1], TF_ITEM_BACON[2], TF_ITEM_BACON[3], 3);
	AddRuntimeStat(7, 17, 0, 1);
	if tf_raiddrop_wine(2) == 1 then
		AddRuntimeStat(7, 18, 0, 1);
	end
end

--������ϯ
function tf_OpenBanquet_Pre(x, y)
	local s = SDB(TF_FEAST_CHEF, 0, 3);
	s:apply2(callout(tf_OpenBanquet, x, y));
end

--������ϯ
function tf_OpenBanquet(x, y, nCount, sdb)
	--��������
	local sData = sdb[GetTongName()];
	local nTotalTc, nNeedTc = tf_GetTableNum(sData[1] or 0, sData[2] or 0,sData[3] or 0,sData[4] or 0);
	local nCreateTcNum = nTotalTc - (nNeedTc - (sData[6] or 0));
	nCreateTcNum = min(16, nCreateTcNum);
	DebugOutput("nCreateTcNum =", nCreateTcNum);
	--��������
	local tTableName;
	if sData[7] and sData[7] > 0 then
		tTableName = {
			{1, 75, "Y�n Ti�c Linh ��nh"},
			{1, 25, "Y�n Ti�c H�o Hoa"},
		}
	else
		tTableName = {
			{1, 90, "Y�n ti�c"},
			{1, 8, "Y�n Ti�c Linh ��nh"},
			{1, 2, "Y�n Ti�c H�o Hoa"},
		}
	end
	local npcPos = TF_NPC_POS[x];
	if not npcPos then return 0; end
	local npcPosSub = npcPos[y];
	if not npcPosSub then return 0; end
	if getn(TF_NPC_POS_OFFSET) ~= 16 then
		return 0;
	end
	local tNpcIndex = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
	local nIndex = gf_GetRandItemByTable(tTableName, 100, 1);
	for i = 1, 16 do
		local npcIndex = 0;
		if i <= nCreateTcNum then
			npcIndex = CreateNpc("M�m c�",tTableName[nIndex][3], npcPosSub[1], npcPosSub[2] + TF_NPC_POS_OFFSET[i][1], npcPosSub[3] + TF_NPC_POS_OFFSET[i][2]);
			SetNpcScript(npcIndex, "\\script\\online\\tong_feast\\npc\\npc_tableware.lua");
			SetNpcLifeTime(npcIndex, 20 * 60);
		end
		tNpcIndex[i] = npcIndex;
	end
	local s = SDB(TF_FEAST_CHEF, 0, 2);
	s[GetTongName()] = {TF_SHAREDATA_STRING02, tNpcIndex[1], tNpcIndex[2], tNpcIndex[3], tNpcIndex[4], tNpcIndex[5],
		tNpcIndex[6], tNpcIndex[7], tNpcIndex[8], tNpcIndex[9], tNpcIndex[10], tNpcIndex[11], tNpcIndex[12], tNpcIndex[13],
		tNpcIndex[14], tNpcIndex[15], tNpcIndex[16]};
	------------------------------------------
	if nCreateTcNum <= 0 then
		local s1 = SDB(TF_FEAST_CHEF, 0, 0);
		s1:apply2(callout(tf_OpenBanquet_ret, 2));
		Talk(1,"","<color=red> Do s� l��ng d�ng t�ng �� �n kh�ng ��, kh�ng th� m� ���c Y�n Ti�c! <color>");
		return 0;
	end
	local s1 = SDB(TF_FEAST_CHEF, 0, 0);
	s1:apply2(callout(tf_OpenBanquet_ret, 1));
	Talk(1,"","Y�n ti�c bang h�i �� m�, m�i c�c ch� v� ��i hi�p c�ng th��ng th�c!");
	Msg2Tong("Bang h�i �� m� ti�c th�nh c�ng, m�i c�c ch� v� quan kh�ch c�ng nhau n�ng ch�n!");
end

function tf_OpenBanquet_ret(nRet, nCount, sdb)
	if nCount <= 0 then
		print("UDERROR:OpenBanquet failed!!!")
		return 0;
	end
	local sData = sdb[GetTongName()];
	if not sData[1] then
		print("UDERROR:OpenBanquet failed!!!")
		return 0;
	end
	if sData[4] ~= 0 then
		print("UDERROR:OpenBanquet failed!!!")
		return 0;
	end
	local s = SDB(TF_FEAST_CHEF, 0, 0);
	s[GetTongName()] = {TF_SHAREDATA_STRING00, sData[1], sData[2], sData[3], nRet};
end

function tf_RemoveBuff()
	for i = 1, getn(TF_AWARD_BUFF) do
		RemoveState(TF_AWARD_BUFF[i][5]);
	end
end

function tf_AddBuff(nBuffTime)
	tf_RemoveBuff();
	for i = 1, getn(TF_AWARD_BUFF) do 
		CastState(TF_AWARD_BUFF[i][1], TF_AWARD_BUFF[i][2], nBuffTime or TF_AWARD_BUFF[i][3], TF_AWARD_BUFF[i][4], TF_AWARD_BUFF[i][5], TF_AWARD_BUFF[i][6]);
	end
	SyncCustomState(1, TF_AWARD_BUFF[1][5], 1, "BUFF Y�n Ti�c Bang H�i");
	if not nBuffTime then
		tf_SetBuffTime(GetTime());
		local szMsg = "Ng��i nh�n ���c %s, n�i ngo�i c�ng t�ng %d%%, n�i ngo�i ph�ng t�ng %d%%, Sinh l�c t�ng %d%%,"
		szMsg = format(szMsg, "BUFF Y�n Ti�c Bang H�i", 5, 5, 10);
		Msg2Player(szMsg);
		szMsg1 = "T�c �� di chuy�n t�ng %d%%, t�c �� xu�t chi�u t�ng %d%%, kinh nghi�m nh�n ���c khi ��nh qu�i t�ng %d%%.";
		szMsg1 = format(szMsg1, 10, 5, 300);
		Msg2Player(szMsg1);
		SetCurrentNpcSFX(PIdx2NpcIdx(), 921,1,0,18*3);
	end
end

--�����Ƿ��buff
function tf_PlayerLoginAddBuff()
	if TF_SWITH ~= 1 then
		return 0;
	end
	local nVersion,nCurGs = GetRealmType();
	if 1 == nCurGs then
		return 0;
	end
	if tf_GetBuffTime() == 0 then
		return 0;
	end
	local nKind = tf_GetDinnerKind();
	if nKind < 1 or nKind > 3 then
		tf_SetBuffTime(0);
		return 0;
	end
	local nCurTime = GetTime();
	local nTime = nCurTime - tf_GetBuffTime();
	if nTime <= 0 or nTime > 2*3600 then
		tf_SetBuffTime(0);
		return 0;
	end
	tf_AddBuff((2*3600 - nTime)*18);
end

--�ò�
function tf_HaveDinner()
	if GetTrigger(1533*2) ~= 0 then
		Talk(1,"","��i hi�p �ang d�ng ti�c!")
		return 0;
	end
	if tf_GetIsDinner() ~= 0 then
		Talk(1,"","��i hi�p �� d�ng ti�c r�i!")
		return 0;
	end
	--�õ�����һ��
	local tTableName = {
			{1, "Y�n ti�c"},
			{2, "Y�n Ti�c Linh ��nh"},
			{3, "Y�n Ti�c H�o Hoa"},
	}
	local nKind = 0;
	local npcIndex = GetTargetNpc();
	local npcLevel = GetNpcLevel(npcIndex);
	if npcLevel >= 10 then
		Talk(1,"","D�ng ti�c th�t b�i, B�n ti�c n�y �� c� 10 ng��i r�i, quan kh�ch kh�ng th� d�ng ti�c t�i ��y, ch�t qu� r�i!") 
		return 0;
	end
	local npcName = GetNpcName(npcIndex);
	for i = 1, getn(tTableName) do 
		if tTableName[i][2] == npcName then
			nKind = tTableName[i][1];
		end
	end
	if nKind == 0 then
		return 0;
	end
	tf_SetDinnerKind(nKind);
	tf_SetIsDinner(1);
	tf_SetTimerStep(1);
	tf_SetTcNpcIndex(npcIndex);
	AddUnitStates(npcIndex, 0, 1); --npc�ȼ���1
	DebugOutput("***Npc Level =", GetNpcLevel());
	--��npc index��¼playerindex
	local s = SDB(TF_FEAST_CHEF, 0, 4);
	s:apply2(callout(tf_RecordPlayerIdxTable, npcIndex, npcLevel + 1, PlayerIndex));
	--��ʼ��
	CreateTrigger(1, 1533, 1533*2);
	ContinueTimer(GetTrigger(1533*2));
	Msg2Player("D�ng ti�c th�nh c�ng!");
	SetCurrentNpcSFX(PIdx2NpcIdx(), 921,1,0,18*3);
end

function tf_RecordPlayerIdxTable(npcIndex, npcLevel, nPlayerIdx, nCount, sdb)
	DebugOutput("tf_RecordPlayerIdxTable",	npcIndex, npcLevel, nPlayerIdx, nCount, sdb);
	local sData = sdb[tostring(npcIndex)];
	DebugOutput(sData, sData[1], sData[2], sData[3], sData[4], sData[5], 
			sData[6], sData[7], sData[8], sData[9], sData[10])
	if not sData[1] then
		DebugOutput("tostring(npcIndex), nPlayerIdx =",tostring(npcIndex), nPlayerIdx)
		local s = SDB(TF_FEAST_CHEF, 0, 4);
		s[tostring(npcIndex)] = {TF_SHAREDATA_STRING04, nPlayerIdx, 0, 0, 0, 0, 0, 0, 0, 0, 0};
		return 1;
	end
	if sData[npcLevel] and sData[npcLevel] <= 0 then
		sData[npcLevel] = nPlayerIdx;
		local s = SDB(TF_FEAST_CHEF, 0, 4);
		s[tostring(npcIndex)] = {TF_SHAREDATA_STRING04, sData[1], sData[2], sData[3], sData[4], sData[5], 
			sData[6], sData[7], sData[8], sData[9], sData[10]};
		DebugOutput(sData[1], sData[2], sData[3], sData[4], sData[5], 
			sData[6], sData[7], sData[8], sData[9], sData[10])
		return 1;
	end
	DebugOutput("ERROR:tf_RecordPlayerIdxTable!!!");
end

--�����
g_tf_npcIndexTime = {
--	[mapid]	= {
--		[npcIndex] = time,
--		...	
--	},
}

function tf_ClearNpcIndexTime()
	g_tf_npcIndexTime = {};
end

--����
function tf_Toast()
	local s = SDB(TF_FEAST_CHEF, 0, 3);
	s:apply2(tf_Toast_CB);
end

function tf_Toast_CB(nCount, sdb)
	if nCount <= 0 then
		print("ERROR:tf_Toast_CB nCount <= 0")
		return 0;
	end
	local sData = sdb[GetTongName()];
	if not sData[1] then
		print("ERROR:tf_Toast_CB sData is nil")
		return 0;
	end
	local nTime = GetTime();
	local nMapId,nX,nY = GetWorldPos();
	local npcIndex = GetTargetNpc();
	if g_tf_npcIndexTime[nMapId] and g_tf_npcIndexTime[nMapId][npcIndex] and nTime - g_tf_npcIndexTime[nMapId][npcIndex] < TF_TOAST_USE_CD then
		Talk(1,"",format("Th�i gian CD s� d�ng r��u l� %ds, li�n t�c ch�c r��u r�t d� b� say!", TF_TOAST_USE_CD));
		return 0;
	end
	if GetTime() - tf_GetWineUseCD() < TF_TOAST_USE_CD then
		Talk(1,"",format("Th�i gian CD s� d�ng m� t�u l� %ds, th��ng xuy�n c�n ly v�i th�nh vi�n trong bang h�i r�t d� say x�n!", TF_TOAST_USE_CD));
		return 0;
	end
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	if DelItem(TF_ITEM_WINE[1], TF_ITEM_WINE[2], TF_ITEM_WINE[3], 1) ~= 1 then
		Talk(1,"","Trong h�nh trang kh�ng c� r��u!")
		return 0;
	end
	tf_SetWine(tf_GetWine() + 1);
	local s = SDB(TF_FEAST_CHEF, 0, 3);
	s[GetTongName()] = {TF_SHAREDATA_STRING03, sData[1], sData[2], sData[3], sData[4], sData[5] + 1,
		sData[6], sData[7], sData[8]};
	Msg2Tong("T�t c� anh em trong bang n�ng ly n�o, 1,2,3 dzzooo c�n ly!");
	tf_SetWineUseCD(nTime);
	if not g_tf_npcIndexTime[nMapId] then
		g_tf_npcIndexTime[nMapId] = {};
	end
	g_tf_npcIndexTime[nMapId][npcIndex] = nTime;
	--����
	AddItem(TF_ITEM_TONG_TOKEN_CHIP[1], TF_ITEM_TONG_TOKEN_CHIP[2], TF_ITEM_TONG_TOKEN_CHIP[3], 3);
	local s1 = SDB(TF_FEAST_CHEF , 0, 4);
	s1:apply2(callout(tf_Toast_Tong_Award, GetName(), GetTargetNpc()));
end

function tf_Toast_Tong_Award(szName, npcIndex, nCount, sdb)
	DebugOutput("tf_Toast_Tong_Award",szName, npcIndex, nCount, sdb)
	local sData = sdb[tostring(npcIndex)];
	if not sData[1] then
		DebugOutput("ERROR:tf_Toast_Tong_Award sData is nil!")
		return 0;
	end
	DebugOutput(sData[1], sData[2], sData[3], sData[4], sData[5], sData[6],
		sData[7], sData[8], sData[9], sData[10]);
	local oldPlayerIndex = PlayerIndex;
	for i =1, 10 do
		if sData[i] > 0 then
			PlayerIndex = sData[i];
			if GetTask(TF_TASK_8) ~= nil then --ȷ�������ɫ�Ǵ��ڵ�
				DebugOutput("tf_GetTcNpcIndex(), PlayerIndex =",tf_GetTcNpcIndex(), PlayerIndex)
				if tf_GetTcNpcIndex() == npcIndex and PlayerIndex ~= oldPlayerIndex then
					if GetFreeItemRoom() > 0 and GetTrigger(1533*2) ~= 0 then
						AddItem(TF_ITEM_TONG_TOKEN_CHIP[1], TF_ITEM_TONG_TOKEN_CHIP[2], TF_ITEM_TONG_TOKEN_CHIP[3], 1);
						Talk(1,"",format("Ng��i anh em trong bang %s ch�c r��u ��i hi�p, ng��i nh�n ���c M�nh L�nh B�i Bang H�i x 1", szName));
					else
						Talk(1,"",format("Kh�ng gian h�nh trang kh�ng ��, kh�ng th� nh�n ���c ph�n th��ng ch�c r��u c�a %s ng��i anh em trong bang", szName));
					end
				end
			end
		end
	end	
end

function tf_UseIBtw()
	local s = SDB(TF_FEAST_CHEF, 0, 3);
	s:apply2(tf_UseIBtw_CB);
end

--ʹ�þ��µĲ;�
function tf_UseIBtw_CB(nCount, sdb)
	local sData = sdb[GetTongName()];
	if not sData then
		print("UDERROR:tf_UseIBtw_CB sData is nil!");
		return 0;
	end
	if sData[8] and sData[8] == 1 then
		Talk(1,"","��i hi�p �� s� d�ng B� �� �n r�i!");
		return 0;
	end
	if DelItem(TF_ITEM_TABLEWARE[1], TF_ITEM_TABLEWARE[2], TF_ITEM_TABLEWARE[3], 1) ~= 1 then
		Talk(1,"","Trong h�nh trang kh�ng c� B� �� �n");
		return 0;
	end
	tf_SetIsUseTw(1);
	local _s = SDB(TF_FEAST_CHEF, 0, 3);
	_s[GetTongName()] = {TF_SHAREDATA_STRING03, sData[1], sData[2], sData[3], sData[4],
		sData[5], sData[6], sData[7], 1};
	Talk(1,"","Sau khi s� d�ng B� �� �n th�i gian gi�n c�ch nh�n th��ng 1 ph�t s� gi�m xu�ng c�n 45 gi�y");
end

--����NPC
function tf_CreateChef()
	if TF_SWITH ~= 1 then
		return 0;
	end
	for i = 1, getn(TF_NPC_POS) do
		for j = 1, getn(TF_NPC_POS[i]) do
			local npcIndex = CreateNpc("Ng� Tr�", "��u b�p bang h�i", TF_NPC_POS[i][j][1], TF_NPC_POS[i][j][2], TF_NPC_POS[i][j][3]);
			SetNpcScript(npcIndex, "\\script\\online\\tong_feast\\tf_npc.lua");
		end
	end
end

--���ߴ���
function tf_PlayerLogout()
	if GetTrigger(1533*2) ~= 0 then
		RemoveTrigger(GetTrigger(1533*2));
	end
	tf_SetTcNpcIndex(0);
end