--�Ժ�ģ������¼��������(��ű����������һ�汾��С�ű�����ݣ�L.S)
--2013-03-31 version 1.0 modify by liubo
Include("\\script\\online_activites\\head\\acitivity_additional_define.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\online_activites\\activity_head.lua")

function aah_GetSayDialog(nActivityId)
	local tSayDialog = {};
	if not nActivityId then return tSayDialog; end
	if gf_CheckEventDateEx(nActivityId) == 1 then
		local tMainTable = VET_ACITIVUTY_ADDITIONAL_TABLE[nActivityId];
		if not tMainTable then return tSayDialog; end
		if getn(tMainTable.tSayDialog) > 9 then 
			print("UDERROR:acitivity_additional_define.lua config error");
		else
			for j = 1, getn(tMainTable.tSayDialog) do
					tinsert(tSayDialog, tMainTable.tSayDialog[j].."/#aah_Execfunc("..nActivityId..","..j..")");
			end
			if tMainTable.bUdIsExist and tMainTable.bUdIsExist == 1 then
				tinsert(tSayDialog, tMainTable.tUdAward.szTitle.."/#aah_Ud_VipAward("..nActivityId..")");
				if tMainTable.tPointAward then
					tinsert(tSayDialog, tMainTable.tPointAward.szTitle.."/#aah_Ud_PointAward("..nActivityId..")");
				end
			end
			--���ص�һ�������Ļ
			return tSayDialog;
		end
	end
	return tSayDialog;
end

function aah_Execfunc(nActivityId, nNum)
	local tMainTable = VET_ACITIVUTY_ADDITIONAL_TABLE[nActivityId];
	if not tMainTable then return 0; end
	--�������������
	aah_IsReSetTaskGroup(nActivityId);
	--�����ռ��ж�
	local nFreeRoom = 2;
	local nFreeWeight = 100;
	if tMainTable.tFreeRoom and tMainTable.tFreeRoom[nNum] then
		nFreeRoom = tMainTable.tFreeRoom[nNum];
	end
	if tMainTable.tFreeWeight and tMainTable.tFreeWeight[nNum] then
		nFreeWeight = tMainTable.tFreeWeight[nNum];
	end
	if gf_Judge_Room_Weight(nFreeRoom, nFreeWeight, " ") ~= 1 then
		return 0;
	end
	--���ܵȼ��ж�
--	if gf_CheckBaseCondition(79, 0) ~= 1 then
--		return 0;
--	end
	local g_TaskGroup = TaskManager:Create(tMainTable.tTaskGroup[1], tMainTable.tTaskGroup[2]);
	if not g_TaskGroup then return 0; end
	--��������
	if g_TaskGroup:GetTask(nNum + 1) >= tMainTable.tMaxUseCount[nNum] then
		Talk(1,"",format("M�i ng��i m�i ng�y c� th� ho�n th�nh t�i �a <color=green>%d<color>l�n", tMainTable.tMaxUseCount[nNum]));
		return 0;
	end
	--������
	local tCostTable = tMainTable.tCostTable[nNum];
	if not tCostTable then return 0; end
	for i = 1, getn(tCostTable) do
		local tCostList = tCostTable[i];
		if not tCostList then return 0; end
		--����Ҫ�жϵ���
		if getn(tCostList) == 5 then
			if GetItemCount(tCostList[1], tCostList[2], tCostList[3]) < tCostList[4] then
  			Talk(1,"",format("S� l��ng %s trong h�nh trang kh�ng �� <color=green>%d c�i <color>", tCostList[5], tCostList[4]));
  			return 0;
  		end
		end
		--����Ҫ�жϽ��
		if getn(tCostList) == 1 then
			if GetCash() < tCostList[1] * 10000 then
			  Talk(1,"",format("S� v�ng trong h�nh trang kh�ng �� <color=green>%d<color>v�ng", tCostList[1]));
				return 0;
  		end
		end
	end
	--��ʼ����
	for i = 1, getn(tCostTable) do
		local tCostList = tCostTable[i];
		if not tCostList then return 0; end
		--����Ҫ���ĵ���
		if getn(tCostList) == 5 then
			if DelItem(tCostList[1], tCostList[2], tCostList[3], tCostList[4]) ~= 1 then
  			return 0;
  		end
		end
		--����Ҫ���Ľ��
		if getn(tCostList) == 1 then
			if tCostList[1] ~= 0 and Pay(tCostList[1] * 10000) ~= 1 then
				return 0;
  		end
		end
	end
	--������
	g_TaskGroup:SetTask(nNum + 1, g_TaskGroup:GetTask(nNum + 1) + 1);
	--���̶�����
	if not tMainTable.tFinalAward or getn(tMainTable.tFinalAward) == 0 or g_TaskGroup:GetTask(nNum + 1) < tMainTable.tMaxUseCount[nNum] then
		if tMainTable.tNormalAward[nNum] and tMainTable.tNormalAward[nNum] > 0 then
			gf_Modify("Exp", tMainTable.tNormalAward[nNum]);
		end
		if tMainTable.tZhenQiAward[nNum] and tMainTable.tZhenQiAward[nNum] > 0 then
			AwardGenuineQi(tMainTable.tZhenQiAward[nNum]);
		end
		gf_WriteLogEx("Nop Nguyen Lieu Thang 11/2014", "��i ph�n th��ng", 1, "��i th��ng lo�i "..nNum);	
		--gf_WriteLogEx("Event phu 1 thang 2 nam 2014", "��i ph�n th��ng", 1, "��i th��ng lo�i "..nNum);		
		if tMainTable.tXuAward[nNum] and tMainTable.tXuAward[nNum] > 0 then
			gf_AddItemEx2({2,1,30230, tMainTable.tXuAward[nNum]}, "XU", tMainTable.nActivityName, "Ph�n th��ng ho�t ��ng ph�", 0, 1);
		end
	else
		if tMainTable.tFinalAward[nNum] and tMainTable.tFinalAward[nNum] > 0 then 
			gf_Modify("Exp", tMainTable.tFinalAward[nNum]);
		end
		if tMainTable.tZhenQiFinalAward[nNum] and tMainTable.tZhenQiFinalAward[nNum] > 0 then
			AwardGenuineQi(tMainTable.tZhenQiFinalAward[nNum]);
		end
		if tMainTable.tXuFinalAward[nNum] and tMainTable.tXuFinalAward[nNum] > 0 then
			gf_AddItemEx2({2,1,30230, tMainTable.tXuFinalAward[nNum]}, "XU", tMainTable.nActivityName, "Ph�n th��ng ho�t ��ng ph�", 0, 1);
		end
		gf_WriteLogEx("Nop Nguyen Lieu Thang 11/2014", "��i ph�n th��ng", 1, "��i th��ng lo�i "..nNum);	
--		gf_WriteLogEx("Event phu 1 thang 2 nam 2014", "��i ph�n th��ng", 1, "��i th��ng lo�i "..nNum);	
	end
	--���������
	if tMainTable.tConditionItemAward and tMainTable.tConditionItemAward[nNum] == 1 then
		--ÿ�ζ�������߱���------------------
		if aah_IsUpperLimit(tMainTable.tTaskCondition[nNum]) == 1 then
			gf_EventGiveRandAward(tMainTable.tItemFinalAwardOverLimit[nNum], gf_SumRandBase(tMainTable.tItemFinalAwardOverLimit[nNum]), 1, tMainTable.nActivityName, "Ph�n th��ng ho�t ��ng ph�");
		else
			gf_EventGiveRandAward(tMainTable.tItemFinalAward[nNum], gf_SumRandBase(tMainTable.tItemFinalAward[nNum]), 1, tMainTable.nActivityName, "Ph�n th��ng ho�t ��ng ph�");
		end	
	else
		--���һ�β�������߱���----------------
		if g_TaskGroup:GetTask(nNum + 1) >= tMainTable.tMaxUseCount[nNum] then
			if aah_IsUpperLimit(tMainTable.tTaskCondition[nNum]) == 1 then
				gf_EventGiveRandAward(tMainTable.tItemFinalAwardOverLimit[nNum], gf_SumRandBase(tMainTable.tItemFinalAwardOverLimit[nNum]), 1, tMainTable.nActivityName, "Ph�n th��ng ho�t ��ng ph� �� ��t gi�i h�n");
			else
				gf_EventGiveRandAward(tMainTable.tItemFinalAward[nNum], gf_SumRandBase(tMainTable.tItemFinalAward[nNum]), 1, tMainTable.nActivityName, "Ph�n th��ng ho�t ��ng ph� �� ��t gi�i h�n");
			end
		end
	end
	if tMainTable.tMsg2Player and tMainTable.tMsg2Player[nNum] then
		Msg2Player(format(tMainTable.tMsg2Player[nNum], g_TaskGroup:GetTask(nNum + 1), tMainTable.tMaxUseCount[nNum]));
	end
end

function aah_IsReSetTaskGroup(nActivityId)
	local tMainTable = VET_ACITIVUTY_ADDITIONAL_TABLE[nActivityId];
	if not tMainTable then return 0; end
	local g_TaskGroup = TaskManager:Create(tMainTable.tTaskGroup[1], tMainTable.tTaskGroup[2]);
	if g_TaskGroup:GetTask(1) ~= zgc_pub_day_turn() then
		g_TaskGroup:SetTask(1, zgc_pub_day_turn());
		for i = 2, 10 do
			if g_TaskGroup:GetTaskBit(i,31) ~= 1 then --mark
				g_TaskGroup:SetTask(i, 0);
			end
		end
	end
end

function aah_IsUpperLimit(tTaskCondition)
	if not tTaskCondition then 
		return 0; 
	end
	local bFlag = 1;
	for i = 1, getn(tTaskCondition) do
		if getn(tTaskCondition[i]) ~= 2 then 
			bFlag = 0;
			break;	
		end
		if GetTask(tTaskCondition[i][1]) < tTaskCondition[i][2] then
			bFlag = 0;
			break;
		end
	end
	return bFlag;	
end

function aah_Ud_VipAward(nActivityId)
	local tMainTable = VET_ACITIVUTY_ADDITIONAL_TABLE[nActivityId];
	if not tMainTable then return 0; end
	if not tMainTable.bUdIsExist or tMainTable.bUdIsExist ~= 1 then return 0; end
	local tUdAward = tMainTable.tUdAward;
	--�������������
	aah_IsReSetTaskGroup(nActivityId);
	local g_TaskGroup = TaskManager:Create(tMainTable.tTaskGroup[1], tMainTable.tTaskGroup[2]);
	if not g_TaskGroup then return 0; end
	--��������
	if g_TaskGroup:GetTask(tUdAward.nTaskSeq) >= tUdAward.nMaxCount then
		Talk(1,"",format("M�i ng��i m�i ng�y c� th� ho�n th�nh t�i �a <color=green>%d<color>l�n", tUdAward.nMaxCount));
		return 0;
	end
	if gf_Judge_Room_Weight(4, 100, " ") ~= 1 then
		return 0;
	end	
	--�����ռ��ж�
	if tUdAward.nFreeRoom and GetFreeItemRoom() < tUdAward.nFreeRoom then
		Talk(1,"",format("Kh�ng gian h�nh trang kh�ng ��, c�n %d � h�nh trang", tUdAward.nFreeRoom));
		return 0;
	end
	--�Ƿ����еĶ�����
	for i = 1, getn(tMainTable.tSayDialog) do
		if g_TaskGroup:GetTask(i + 1) < tMainTable.tMaxUseCount[i] then
			Talk(1,"",format("M�i ng�y ho�n th�nh %d l�n ��i th��ng m�i c� th� nh�n ph�n th��ng VIP", tUdAward.nTimesLimit));
			return 0;
		end
	end
	g_TaskGroup:SetTask(tUdAward.nTaskSeq, g_TaskGroup:GetTask(tUdAward.nTaskSeq) + 1);
	--������
	if tUdAward.uFunc then
		dostring(tUdAward.uFunc..format("(%d)",nActivityId));
	end
	--gf_WriteLogEx(tMainTable.nActivityName, tMainTable.nActivityName, "VIP_AWARD", "");	
	gf_WriteLogEx("Event phu 1 thang 3 nam 2014", "��i ph�n th��ng cu�i c�ng", 1, "VIP_AWARD");	
end

function aah_Ud_PointAward(nActivityId)
	local tMainTable = VET_ACITIVUTY_ADDITIONAL_TABLE[nActivityId];
	if not tMainTable then return 0; end
	if not tMainTable.bUdIsExist or tMainTable.bUdIsExist ~= 1 then return 0; end
	local tPointAward = tMainTable.tPointAward;
	local tSay = {}
	for i = 1, getn(tPointAward.uFunc) do
		tinsert(tSay, format(tPointAward.uFunc[i], nActivityId));
	end
	tinsert(tSay, "Ra kh�i/nothing");
	Say(tPointAward.szTitle, getn(tSay), tSay)
end

--------------�Զ��庯��-------------------------
function Ud_GiveVipAward_201306()
	AddItem(2,1,30340,666);
	ahf_GetNFruits(66);
	AddItem(2,1,30230,66);
end

function give_30_fruits()
	for i = 1, 30 do
		ahf_GetAFruits()
	end
end

function Ud_GiveVipAward_201307()
	AddItem(2,1,30340,200);
	ahf_GetNFruits(20);
	AddItem(2,1,30230,22);
	AwardGenuineQi(200);
end

function Ud_GiveVipAward_201308()
	AwardGenuineQi(2000);
	AddItem(2,1,30230,20);
	Msg2Player(format("Ng��i nh�n ���c %sx%d", "XU", 20));
	AddItem(2,1,30368,20);
	Msg2Player(format("Ng��i nh�n ���c %sx%d", "C� Linh Th�ch", 20));
	AddItem(2,1,30369,20);
	Msg2Player(format("Ng��i nh�n ���c %sx%d", "C� Linh Ng�c", 20));
end

function Ud_GiveVipAward_201309()
	ModifyExp(20000000);
	AddItem(2,1,30368,20);
	Msg2Player(format("Ng��i nh�n ���c %sx%d", "C� Linh Th�ch", 20));
	AddItem(2,1,30369,20);
	Msg2Player(format("Ng��i nh�n ���c %sx%d", "C� Linh Ng�c", 20));
	local tAward = {
		{1, 45, "b�nh �t ng�i h��ng", {2,1,1123,6,4}, 0},
		{1, 45, "B�nh �t Ch�n G�", {2,1,1124,6,4}, 0},
		{1, 10, "b�nh �t B�c B�o", {2,1,1125,6,4}, 0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "", "");
end

function Ud_GiveVipAward_201310(nActivityId)
	ModifyExp(20000000);
	AddItem(2,1,30132,2010);
	Msg2Player(format("Ng��i nh�n ���c %sx%d", "V� L�m B�o H�p", 2010));
	AddItem(2,1,30340,200);
	Msg2Player(format("Ng��i nh�n ���c %sx%d", "M�c R��ng", 200));
	AddItem(2,1,30368,20);
	Msg2Player(format("Ng��i nh�n ���c %sx%d", "C� Linh Th�ch", 20));
	AddItem(2,1,30369,20);
	Msg2Player(format("Ng��i nh�n ���c %sx%d", "C� Linh Ng�c", 20));
	AddItem(2,1,30497,20);
	Msg2Player(format("Ng��i nh�n ���c %sx%d", "Ma Tinh", 20));
	if nActivityId then
		local tPoint = {
			{31, 39, format("Ud_GiveVipAward_201310_1(%d,1)", nActivityId), ""},
			{31, 39, format("Ud_GiveVipAward_201310_1(%d,2)", nActivityId), ""},
			{31, 19, format("Ud_GiveVipAward_201310_1(%d,3)", nActivityId), ""},
			{31,  9, format("Ud_GiveVipAward_201310_1(%d,4)", nActivityId), ""},
		}
		gf_EventGiveRandAward(tPoint, gf_SumRandBase(tPoint), 1, "Ph�n th��ng ho�t ��ng ph�", "T�ch l�y ph�n th��ng")
	end
end

function Ud_GiveVipAward_201310_1(nActivityId, nPoint)
	if not nActivityId or not nPoint then
		return 0;
	end
	local nID = tonumber(nActivityId);
	local nPt = tonumber(nPoint);
	local tMainTable = VET_ACITIVUTY_ADDITIONAL_TABLE[nActivityId];
	if not tMainTable then return 0; end
	local g_TaskGroup = TaskManager:Create(tMainTable.tTaskGroup[1], tMainTable.tTaskGroup[2]);
	if not g_TaskGroup then return 0; end
	--mark
	g_TaskGroup:SetTaskBit(tMainTable.tUdAward.nTaskSeq+1, 31, 1);
	--deal
	local nTaskID = g_TaskGroup:GetTaskId(tMainTable.tUdAward.nTaskSeq+1);
	if not nTaskID then return 0; end
	local nValue = gf_GetMyTaskBit(nTaskID,1,30)
	gf_SetMyTaskBit(nTaskID,1,30,nValue+nPoint);
	Msg2Player(format("Ng��i nh�n ���c %d �i�m t�ch l�y ph�n th��ng",nPoint));
end

function Ud_Check_Point(nActivityId)
	local tMainTable = VET_ACITIVUTY_ADDITIONAL_TABLE[nActivityId];
	if not tMainTable then return 0; end
	local g_TaskGroup = TaskManager:Create(tMainTable.tTaskGroup[1], tMainTable.tTaskGroup[2]);
	if not g_TaskGroup then return 0; end
	local nTaskID = g_TaskGroup:GetTaskId(tMainTable.tUdAward.nTaskSeq+1);
	if not nTaskID then return 0; end
	Talk(1,"",format("Ng��i �� t�ch l�y ���c <color=green>%d<color> �i�m", gf_GetMyTaskBit(nTaskID, 1, 30)));
end

function Ud_Use_Exchange_Point(nActivityId)
	local tSay = {
		[1] = "Ta mu�n s� d�ng �i�m t�ch l�y �� ��i th��ng",
		[2] =  format("01 Di�u D��ng To�i Ho�ng � L�n B�o Gi�i (%d �i�m t�ch l�y)/#Ud_Use_Exchange_Point_1(%d,1)", 39, nActivityId),
		[3] =  format("01 Di�u D��ng To�i Ho�ng T� Giao Ng�c B�i (%d �i�m t�ch l�y)/#Ud_Use_Exchange_Point_1(%d,2)", 39, nActivityId),
		[4] =  format("01 Di�u D��ng To�i Ho�ng V�n H� L�nh (%d �i�m t�ch l�y)/#Ud_Use_Exchange_Point_1(%d,3)", 39, nActivityId),
		[5] =  format("01 Di�u D��ng To�i Ho�ng X�ch T��c Ho�n (%d �i�m t�ch l�y)/#Ud_Use_Exchange_Point_1(%d,4)", 39, nActivityId),
		[6] =  format("01 Di�u D��ng To�i Ho�ng B�ch Quy Li�n (%d �i�m t�ch l�y)/#Ud_Use_Exchange_Point_1(%d,5)", 39, nActivityId),
		[7] =  format("9999 V� L�m B�o H�p (%d �i�m t�ch l�y)/#Ud_Use_Exchange_Point_1(%d,6)", 1, nActivityId),
		[8] =  format("03 Ch�a Kh�a V�ng (%d �i�m t�ch l�y)/#Ud_Use_Exchange_Point_1(%d,7)", 9, nActivityId),
		[9] =  format("15  S�ch K� N�ng B�n ��ng H�nh c�p 1 (%d �i�m t�ch l�y)/#Ud_Use_Exchange_Point_1(%d,8)", 15, nActivityId),
		[10] = format("15  S�ch K� N�ng B�n ��ng H�nh c�p 2 (%d �i�m t�ch l�y)/#Ud_Use_Exchange_Point_1(%d,9)", 20, nActivityId),
		[11] = format("15  S�ch K� N�ng B�n ��ng H�nh c�p 3 (%d �i�m t�ch l�y)/#Ud_Use_Exchange_Point_1(%d,10)", 35, nActivityId),
		[12] = format("15  S�ch K� N�ng B�n ��ng H�nh c�p 4 (%d �i�m t�ch l�y)/#Ud_Use_Exchange_Point_1(%d,11)", 35, nActivityId),
		[13] = format("20 T�y T�m Kho�ng Th�ch (%d �i�m t�ch l�y)/#Ud_Use_Exchange_Point_1(%d,12)", 2, nActivityId),
		[14] = format("20 Luy�n L� Thi�t Kho�ng (%d �i�m t�ch l�y)/#Ud_Use_Exchange_Point_1(%d,13)", 2, nActivityId),
		[15] = format("03 T�y T�m Th�ch c�p 3 (%d �i�m t�ch l�y)/#Ud_Use_Exchange_Point_1(%d,14)", 3, nActivityId),
		[16] = format("03 Luy�n L� Thi�t c�p 3 (%d �i�m t�ch l�y)/#Ud_Use_Exchange_Point_1(%d,15)", 3, nActivityId),
		[17] = format("500 Ma Tinh (%d �i�m t�ch l�y)/#Ud_Use_Exchange_Point_1(%d,16)", 45, nActivityId),
		[18] = "T�i h� ch� xem qua th�i/nothing",
	}
	gf_Say(tSay)
end 

function Ud_Use_Exchange_Point_1(nActivityId, nIndex)
	local tMainTable = VET_ACITIVUTY_ADDITIONAL_TABLE[nActivityId];
	if not tMainTable then return 0; end
	local g_TaskGroup = TaskManager:Create(tMainTable.tTaskGroup[1], tMainTable.tTaskGroup[2]);
	if not g_TaskGroup then return 0; end
	local nTaskID = g_TaskGroup:GetTaskId(tMainTable.tUdAward.nTaskSeq+1);
	if not nTaskID then return 0; end
	local tFreeRoom = {1,1,1,1,1,11,3,15,15,15,15,1,1,1,1,1};
	if gf_Judge_Room_Weight(tFreeRoom[nIndex], 100, " ") ~= 1 then
		return 0;
	end
	local tPoint = {39,39,39,39,39,1,9,15,20,35,35,2,2,3,3,45};
	local nPoint = gf_GetMyTaskBit(nTaskID, 1, 30);
	if nPoint < tPoint[nIndex] then
		Talk(1,"","�i�m t�ch l�y ph�n th��ng kh�ng ��, ��i th�t b�i !");
		return 0;
	end
	gf_SetMyTaskBit(nTaskID, 1, 30, nPoint-tPoint[nIndex]);
	Msg2Player(format("Ng��i ti�u hao %d �i�m t�ch l�y ph�n th��ng", tPoint[nIndex]));
	if nIndex == 1 then
		gf_AddItemEx2({0, 102, 3185, 1, 1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng To�i Ho�ng-� L�n B�o Gi�i", "Ph�n th��ng ho�t ��ng ph�", "��i t�ch l�y", 0, 1);
	elseif nIndex == 2 then
		gf_AddItemEx2({0, 102, 3186, 1, 1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng To�i Ho�ng-T� Giao Ng�c B�i", "Ph�n th��ng ho�t ��ng ph�", "��i t�ch l�y", 0, 1);
	elseif nIndex == 3 then
		gf_AddItemEx2({0, 102, 3187, 1, 1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng To�i Ho�ng-V�n H� L�nh", "Ph�n th��ng ho�t ��ng ph�", "��i t�ch l�y", 0, 1);
	elseif nIndex == 4 then
		gf_AddItemEx2({0, 102, 3188, 1, 1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng To�i Ho�ng-X�ch T��c Ho�n", "Ph�n th��ng ho�t ��ng ph�", "��i t�ch l�y", 0, 1);
	elseif nIndex == 5 then
		gf_AddItemEx2({0, 102, 3189, 1, 1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng To�i Ho�ng-B�ch Quy Li�n", "Ph�n th��ng ho�t ��ng ph�", "��i t�ch l�y", 0, 1);
	elseif nIndex == 6 then
		AddItem(2, 1, 30132, 9999);
		gf_WriteLogEx("Ph�n th��ng ho�t ��ng ph�","��i t�ch l�y",9999,"V� L�m B�o H�p");
	elseif nIndex == 7 then	
		gf_AddItemEx2({2, 1, 30133, 3}, "Ch�a Kh�a V�ng", "Ph�n th��ng ho�t ��ng ph�", "��i t�ch l�y", 0, 1);
	elseif nIndex == 8 then
		give_all_pet_book(1);
	elseif nIndex == 9 then
		give_all_pet_book(2);
	elseif nIndex == 10 then
		give_all_pet_book(3);
	elseif nIndex == 11 then
		give_all_pet_book(4);
	elseif nIndex == 12 then
		gf_AddItemEx2({2, 1, 30536, 20}, "T�y T�m Th�ch Kho�ng", "Ph�n th��ng ho�t ��ng ph�", "��i t�ch l�y", 0, 1); 
	elseif nIndex == 13 then
		gf_AddItemEx2({2, 1, 30537, 20}, "Luy�n L� Thi�t Kho�ng", "Ph�n th��ng ho�t ��ng ph�", "��i t�ch l�y", 0, 1); 
	elseif nIndex == 14 then
		gf_AddItemEx2({2, 1, 30523, 3}, "C�p 3 T�y T�m Th�ch", "Ph�n th��ng ho�t ��ng ph�", "��i t�ch l�y", 0, 1); 
	elseif nIndex == 15 then
		gf_AddItemEx2({2, 1, 30529, 3}, "C�p 3 Luy�n L� Thi�t", "Ph�n th��ng ho�t ��ng ph�", "��i t�ch l�y", 0, 1); 
	elseif nIndex == 16 then
		gf_AddItemEx2({2, 1, 30497, 500}, "Ma Tinh", "Ph�n th��ng ho�t ��ng ph�", "��i t�ch l�y", 0, 1); 
	end
end

function give_all_pet_book(nLevel)
	if not nLevel or nLevel < 1 or nLevel > 4 then
		return 0;
	end
	local tP = {1,5,9,13,17,21,25,29,33,37,41,45,49,53,57};
	for i = 1, getn(tP) do
		gf_AddItemEx2({2,150,tP[i]+nLevel-1,1}, GetItemName(2,150,tP[i]+nLevel-1), "Ph�n th��ng ho�t ��ng ph�", "��i t�ch l�y", 0, 1);
	end
	return 1;
end

function Ud_GiveVipAward_201311(nActivityId)
	local nRet, nIndex = AddItem(2,1,30497,4,4);
	Msg2Player(format("Ng��i nh�n ���c %sx%d",GetItemName(2,1,30497),4));
	local nRet, nIndex = AddItem(2,0,554,4);
	SetItemExpireTime(nIndex, 7*24*3600)
	Msg2Player(format("Ng��i nh�n ���c %sx%d",GetItemName(2,0,554),4));
	local nRet, nIndex = AddItem(2,1,30602,1000);
	Msg2Player(format("Ng��i nh�n ���c %sx%d",GetItemName(2,1,30602),1000));
	local nRet, nIndex = AddItem(2,1,30535,1);
	Msg2Player(format("Ng��i nh�n ���c %sx%d",GetItemName(2,1,30535),1));
end

function Ud_GiveAward_106_1()
	--��ʥ����װ
	local tChrismas = {
		{{"N�n gi�ng sinh chu�n", {0,108,109,1}}, {"N�n gi�ng sinh kh�i ng�", {0,108,110,1}}, {"N�n gi�ng sinh g�i c�m", {0,108,112,1}}, {"N�n gi�ng sinh nh�", {0,108,111,1}}},
		{{"Th��ng y gi�ng sinh chu�n", {0,109,109,1}}, {"Gi�ng sinh kh�i ng�", {0,109,110,1}}, {"Th��ng y gi�ng sinh g�i c�m", {0,109,112,1}}, {"Th��ng y gi�ng sinh Ki�u n�", {0,109,111,1}}},
		{{"H� y Gi�ng sinh chu�n", {0,110,73,1}}, {"Trang ph�c gi�ng sinh kh�i ng�", {0,110,74,1}}, {"H� y gi�ng sinh n� g�i c�m", {0,110,76,1}}, {"Gi�ng sinh Ki�u n�", {0,110,75,1}}},
	};
	local nBody = GetBody();
	local nSize = getn(tChrismas);
	for i = 1, nSize do
		gf_AddItemEx2(tChrismas[i][nBody][2], tChrismas[i][nBody][1], "Event ph� th�ng12", "Nh�n ngo�i trang Noel", 24 * 3600, 1)
	end
end

function Ud_GiveAward_106_2()
	gf_AddItemEx2({0, 105, 35, 1, 1, -1, -1, -1, -1, -1, -1}, "Tu�n L�c", "Event ph� th�ng12", "Nh�n Tu�n L�c", 24 * 3600, 1);
end

function Ud_GiveAward_106_3()
	gf_AddItemEx2({0, 105, 30041, 1, 1, -1, -1, -1, -1, -1, -1}, "Xe Tu�n L�c m�u ��", "Event ph� th�ng12", "Nh�n Xe Tu�n L�c", 24 * 3600, 1);
end

function Ud_GiveAward_106_4()
	gf_AddItemEx2({0, 105, 30042, 1, 1, -1, -1, -1, -1, -1, -1}, "Xe Tu�n L�c  xanh l�c", "Event ph� th�ng12", "Nh�n Xe Tu�n L�c", 24 * 3600, 1)
end

function Ud_GiveAward_106_5()
	gf_AddItemEx2({0, 105, 30043, 1, 1, -1, -1, -1, -1, -1, -1}, "Xe Tu�n L�c m�u v�ng", "Event ph� th�ng12", "Nh�n Xe Tu�n L�c", 24 * 3600, 1)
end

function Ud_GiveAward_106_6()
	gf_Modify("Exp", 24122013);
	gf_EventGiveCustomAward(4, 24, 1, "Event ph� th�ng12");
  gf_EventGiveCustomAward(3, 24, 1, "Event ph� th�ng12");
  gf_EventGiveCustomAward(27, 24, 1, "Event ph� th�ng12", "", 1);
  gf_EventGiveCustomAward(31, 24, 1, "Event ph� th�ng12");
  gf_AddItemEx2({2,1,30170,24}, "D�u", "Event ph� th�ng12");
end

function Ud_GiveAward_108_1()
	--�����ڷ�װ
	local tSpring = {
		{{"Trang ph�c xu�n chu�n", {0,109,113,1}}, {"Trang ph�c xu�n kh�i ng�", {0,109,114,1}}, {"Trang ph�c xu�n g�i c�m", {0,109,116,1}}, {"Trang ph�c xu�n Ki�u n�", {0,109,115,1}}},
	};
	local nBody = GetBody();
	local nSize = getn(tSpring);
	for i = 1, nSize do
		gf_AddItemEx2(tSpring[i][nBody][2], tSpring[i][nBody][1], "Event ph� 1 th�ng 1", "Nh�n ngo�i trang N�m M�i", 72 * 3600, 1)
	end
end

function Ud_GiveAward_108_2()
	gf_AddItemEx2({0, 105, 33, 1, 4, -1, -1, -1, -1, -1, -1}, "Ni�n th�", "Event ph� 1 th�ng 1", "", 72*3600, 1);
end

function Ud_GiveAward_108_3()
	gf_Modify("Exp", 20142014);
	gf_EventGiveCustomAward(4, 24, 1, "Event ph� 1 th�ng 1");
  gf_EventGiveCustomAward(3, 24, 1, "Event ph� 1 th�ng 1");
  gf_EventGiveCustomAward(27, 24, 1, "Event ph� 1 th�ng 1", "", 1);
  gf_EventGiveCustomAward(31, 24, 1, "Event ph� 1 th�ng 1");
  gf_AddItemEx2({2,1,30172,24}, "Xo�i", "Event ph� 1 th�ng 1", "", 0, 1);
  gf_AddItemEx2({2,95,208,4,4}, "T� Ngh�a L�nh", "Event ph� 1 th�ng 1", "", 0, 1);
  gf_AddItemEx2({2,1,30409,4,4}, "Th�ng Thi�n L�nh", "Event ph� 1 th�ng 1", "", 0, 1);
end

function Ud_GiveAward_113_1()
	gf_Modify("Exp", 5000000);
	gf_EventGiveCustomAward(3, 50, 1, "Ho�t ��ng ph� 1 th�ng 2");
  gf_EventGiveCustomAward(4, 50, 1, "Ho�t ��ng ph� 1 th�ng 2");
end

function Ud_GiveAward_113_2()
	gf_Modify("Exp", 44000000);
	gf_EventGiveCustomAward(31, 44, 1, "Ho�t ��ng ph� 1 th�ng 2");
	gf_AddItemEx2({2,1,30497,10, 4}, "Ma Tinh", "Ho�t ��ng ph� 1 th�ng 2", "", 0, 1);
end

function Ud_GiveAward_113_3()
	gf_Modify("Exp", 39000000);
	AwardGenuineQi(100)
	gf_AddItemEx2({2,1,30497,20,4}, "Ma Tinh", "Ho�t ��ng ph� 1 th�ng 2", "", 0, 1);
end

function Ud_GiveLastAward_201402()
	gf_AddItemEx2({2,1,9977,2,4}, "Qu�n C�ng Huy Ho�ng", "Ho�t ��ng ph� 1 th�ng 2", "", 7*24*3600, 1);
	ahf_Get70GaojiMiji(1, 2, 1)
end

function Ud_GiveAward_116_1()
	gf_Modify("Exp", 5555555);
	gf_EventGiveCustomAward(3, 55, 1, "Event ph� th�ng 3");
  gf_EventGiveCustomAward(4, 55, 1, "Event ph� th�ng 3");
  AwardGenuineQi(55)
end

function Ud_GiveAward_116_2()
	gf_Modify("Exp", 47444777);
	gf_EventGiveCustomAward(31, 44, 1, "Event ph� th�ng 3");
	gf_AddItemEx2({2,1,30497,10,4}, "Ma Tinh", "Event ph� th�ng 3", "", 0, 1);
end

function Ud_GiveAward_116_3()
	gf_Modify("Exp", 39888666);
	AwardGenuineQi(100)
	gf_AddItemEx2({2,1,30497,20,4}, "Ma Tinh", "Event ph� th�ng 3", "", 0, 1);
end

function Ud_GiveLastAward_201403()
	gf_AddItemEx2({2,1,9998,2,4}, "Qu�n C�ng ��i", "Event ph� th�ng 3", "", 7*24*3600, 1);
	gf_AddItemEx2({2,1,9977,2,4}, "Qu�n C�ng Huy Ho�ng", "Event ph� th�ng 3", "", 7*24*3600, 1);
	gf_AddItemEx2({2,1,30636,4}, "8/3 t�n v�t", "Event ph� th�ng 3", "", 0, 1);
	ahf_Get70GaojiMiji(0, 1, 1)
end

function Ud_GiveAward_120_1()
	gf_Modify("Exp", 5000000);
	gf_EventGiveCustomAward(3, 50, 1, "ho�t ��ng ph� th�ng 4 ");
  gf_EventGiveCustomAward(4, 50, 1, "ho�t ��ng ph� th�ng 4 ");
  AwardGenuineQi(50)
end

function Ud_GiveAward_120_2()
	gf_Modify("Exp", 44000000);
	gf_EventGiveCustomAward(31, 44, 1, "ho�t ��ng ph� th�ng 4 ");
	gf_AddItemEx2({2,1,30497,10,4}, "Ma Tinh", "ho�t ��ng ph� th�ng 4 ", "", 0, 1);
end

function Ud_GiveAward_120_3()
	gf_Modify("Exp", 39000000);
	AwardGenuineQi(100)
	gf_AddItemEx2({2,1,30497,20,4}, "Ma Tinh", "ho�t ��ng ph� th�ng 4 ", "", 0, 1);
end

function Ud_GiveLastAward_201404()
	gf_AddItemEx2({2,1,9998,2,4}, "Qu�n C�ng ��i", "ho�t ��ng ph� th�ng 4 ", "", 7*24*3600, 1);
	gf_AddItemEx2({2,1,9977,2,4}, "Qu�n C�ng Huy Ho�ng", "ho�t ��ng ph� th�ng 4 ", "", 7*24*3600, 1);
	gf_AddItemEx2({2,1,30641,4}, "t� s�c b�o th�ch ", "ho�t ��ng ph� th�ng 4 ", "", 0, 1);
	ahf_GetGaojiZhenjuan(1, 3, 1)
end

function Ud_GiveAward_124_1()
	gf_Modify("Exp", 5900000);
	gf_EventGiveCustomAward(3, 50, 1, "Event ph� th�ng 5");
  gf_EventGiveCustomAward(4, 50, 1, "Event ph� th�ng 5");
  AwardGenuineQi(50)
  gf_WriteLogEx("Hoat dong phu thang 5 nam 2014", "��i ph�n th��ng cu�i c�ng", 1, "Ph�n th��ng d�ng 1");
end

function Ud_GiveAward_124_2()
	gf_Modify("Exp", 69000000);
	gf_EventGiveCustomAward(31, 49, 1, "Event ph� th�ng 5");
	local tAward = {
		{1, 10, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 0},
		{1, 5, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 1}, 7 * 24 * 3600},
		{1, 5, "��i Nh�n s�m", {2, 0, 553, 1}, 7 * 24 * 3600},
		{1, 5, "Th�n N�ng ��n", {2, 1, 343, 1}, 7 * 24 * 3600},
		{1, 5, "Ti�u Ki�p t�n", {2, 0, 141, 1}, 7 * 24 * 3600},
		{2, 32, 1000000, 1},
		{2, 25, 2000000, 1},
		{32, 1, 1000, 1},
		{4, 6, 50, 1},
		{5, 6, 50, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "ho�t ��ng ph� th�ng 4 ", "ho�t ��ng ph� th�ng 4 ")
	gf_WriteLogEx("Hoat dong phu thang 5 nam 2014", "��i ph�n th��ng cu�i c�ng", 1, "Ph�n th��ng d�ng 2");
end

function Ud_GiveLastAward_201405()
	ahf_GetGaojiZhenjuan(1, 2, 1)
	gf_AddItemEx2({2, 1, 9998, 2, 4}, "Qu�n C�ng ��i", "ho�t ��ng ph� th�ng 4 ", "ho�t ��ng ph� th�ng 4 ", 7 * 24 * 3600, 1)
	gf_AddItemEx2({2, 1, 9977, 2, 4}, "Qu�n C�ng Huy Ho�ng", "ho�t ��ng ph� th�ng 4 ", "ho�t ��ng ph� th�ng 4 ", 7 * 24 * 3600, 1)
	gf_AddItemEx2({2, 1, 30369, 10, 4}, "C� Linh Ng�c", "ho�t ��ng ph� th�ng 4 ", "ho�t ��ng ph� th�ng 4 ", 0, 1)
end

function Ud_GiveAward_127_1()
	gf_Modify("Exp", 6900000);
	gf_EventGiveCustomAward(3, 50, 1, "Ho�t ��ng ph� th�ng 6");
  gf_EventGiveCustomAward(4, 50, 1, "Ho�t ��ng ph� th�ng 6");
  AwardGenuineQi(50)
  gf_WriteLogEx("Nop Nguyen Lieu Thang 6/2014", "��i ph�n th��ng d�ng 1", 1, "Ph�n th��ng d�ng 1");
end

function Ud_GiveAward_127_2()
	gf_Modify("Exp", 69000000);
	gf_EventGiveCustomAward(31, 50, 1, "Ho�t ��ng ph� th�ng 6");
	local tAward = {
		{2, 20, 5000000, 1},
		{2, 25, 10000000, 1},
		{1, 10, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 0},
		{1, 5, "��i Nh�n s�m", {2, 0, 553, 1}, 7 * 24 * 3600},
		{1, 10, "Ti�u Nh�n s�m qu�", {2, 0, 552, 1}, 7 * 24 * 3600},
		{1, 7, "Th�n N�ng ��n", {2, 1, 343, 1}, 7 * 24 * 3600},
		{1, 10, "Ti�u Ki�p t�n", {2, 0, 141, 1}, 7 * 24 * 3600},
		{32, 1, 1000, 1},
		{4, 6, 200, 1},
		{5, 6, 200, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Ho�t ��ng ph� th�ng 6", "Ho�t ��ng ph� th�ng 6")
	gf_WriteLogEx("Nop Nguyen Lieu Thang 6/2014", "��i ph�n th��ng d�ng 2&3", 1, "Ph�n th��ng d�ng 2&3");
end

function Ud_GiveLastAward_201406()
	ahf_GetGaojiZhenjuan(1, 2, 1)
	gf_AddItemEx2({2, 1, 9998, 2}, "Qu�n C�ng ��i", "Ho�t ��ng ph� th�ng 6", "Ho�t ��ng ph� th�ng 6", 7 * 24 * 3600, 1)
	gf_AddItemEx2({2, 1, 9977, 2}, "Qu�n C�ng Huy Ho�ng", "Ho�t ��ng ph� th�ng 6", "Ho�t ��ng ph� th�ng 6", 7 * 24 * 3600, 1)
	gf_AddItemEx2({2, 1, 30369, 10}, "C� Linh Ng�c", "Ho�t ��ng ph� th�ng 6", "Ho�t ��ng ph� th�ng 6", 0, 1)
	gf_WriteLogEx("Nop Nguyen Lieu Thang 6/2014", "��i ph�n th��ng cu�i c�ng", 1, "Ph�n th��ng cu�i");
end

function Ud_GiveAward_130_1()
	gf_Modify("Exp", 6900000);
	gf_EventGiveCustomAward(3, 40, 1, "Ho�t ��ng ph� th�ng 7");
  gf_EventGiveCustomAward(4, 40, 1, "Ho�t ��ng ph� th�ng 7");
  AwardGenuineQi(40)
end

function Ud_GiveAward_130_2()
	gf_Modify("Exp", 21000000);
	gf_EventGiveCustomAward(31, 50, 1, "Ho�t ��ng ph� th�ng 7");
	local tAward = {
		{2, 25, 5000000, 1},
		{2, 20, 10000000, 1},
		{1, 15, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 0},
		{1, 7, "��i Nh�n s�m", {2, 0, 553, 1}, 7 * 24 * 3600},
		{1, 10, "Ti�u Nh�n s�m qu�", {2, 0, 552, 1}, 7 * 24 * 3600},
		{1, 7, "Th�n N�ng ��n", {2, 1, 343, 1}, 7 * 24 * 3600},
		{1, 10, "Ti�u Ki�p t�n", {2, 0, 141, 1}, 7 * 24 * 3600},
		{1, 1, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
		{1, 2, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
		{1, 3, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Ho�t ��ng ph� th�ng 7", "Ho�t ��ng ph� th�ng 7")
end

function Ud_GiveLastAward_201407()
	ahf_GetGaojiZhenjuan(1, 4, 1)
	gf_EventGiveCustomAward(3, 350, 1, "Ho�t ��ng ph� th�ng 7");
  gf_EventGiveCustomAward(4, 350, 1, "Ho�t ��ng ph� th�ng 7");
  gf_AddItemEx2({2, 1, 9977, 1}, "Qu�n C�ng Huy Ho�ng", "Ho�t ��ng ph� th�ng 7", "Ho�t ��ng ph� th�ng 7", 7 * 24 * 3600, 1)
end

function Ud_GiveAward_132_1()
	gf_Modify("Exp", 6900000);
	gf_EventGiveCustomAward(3, 40, 1, "Ho�t ��ng ph� 08/2014");
  gf_EventGiveCustomAward(4, 40, 1, "Ho�t ��ng ph� 08/2014");
  AwardGenuineQi(40)
end

function Ud_GiveAward_132_2()
	gf_Modify("Exp", 21000000);
	gf_EventGiveCustomAward(31, 50, 1, "Ho�t ��ng ph� th�ng 7");
	local tAward = {
		{2, 25, 5000000, 1},
		{2, 20, 10000000, 1},
		{1, 15, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 0},
		{1, 7, "��i Nh�n s�m", {2, 0, 553, 1}, 7 * 24 * 3600},
		{1, 10, "Ti�u Nh�n s�m qu�", {2, 0, 552, 1}, 7 * 24 * 3600},
		{1, 7, "Th�n N�ng ��n", {2, 1, 343, 1}, 7 * 24 * 3600},
		{1, 10, "Ti�u Ki�p t�n", {2, 0, 141, 1}, 7 * 24 * 3600},
		{1, 1, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
		{1, 2, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
		{1, 3, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Ho�t ��ng ph� 08/2014", "Ho�t ��ng ph� 08/2014")
end

function Ud_GiveLastAward_201408()
	ahf_GetGaojiZhenjuan(1, 4, 1)
	gf_EventGiveCustomAward(3, 350, 1, "Ho�t ��ng ph� 08/2014");
  gf_EventGiveCustomAward(4, 350, 1, "Ho�t ��ng ph� 08/2014");
  gf_AddItemEx2({2, 1, 9977, 1}, "Qu�n C�ng Huy Ho�ng", "Ho�t ��ng ph� 08/2014", "Ho�t ��ng ph� 08/2014", 7 * 24 * 3600, 1)
end

function Ud_GiveAward_134_1()
	gf_Modify("Exp", 6900000);
	gf_EventGiveCustomAward(3, 20, 1, "Ho�t ��ng ph� 09/2014");
  gf_EventGiveCustomAward(4, 20, 1, "Ho�t ��ng ph� 09/2014");
  AwardGenuineQi(40)
end

function Ud_GiveAward_134_2()
	gf_Modify("Exp", 21000000);
	AwardGenuineQi(60)
	local tAward = {
		{2, 25, 5000000, 1},
		{2, 20, 10000000, 1},
		{1, 15, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 0},
		{1, 7, "��i Nh�n s�m", {2, 0, 553, 1}, 7 * 24 * 3600},
		{1, 10, "Ti�u Nh�n s�m qu�", {2, 0, 552, 1}, 7 * 24 * 3600},
		{1, 7, "Th�n N�ng ��n", {2, 1, 343, 1}, 7 * 24 * 3600},
		{1, 10, "T�y T�y linh ��n", {2, 0, 137, 1}, 7 * 24 * 3600},
		{1, 1, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
		{1, 2, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
		{1, 3, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Ho�t ��ng ph� 09/2014", "Ho�t ��ng ph� 09/2014")
end

function Ud_GiveLastAward_201409()
	ahf_GetGaojiZhenjuan(1, 4, 1)
	gf_EventGiveCustomAward(3, 350, 1, "Ho�t ��ng ph� 09/2014");
  gf_EventGiveCustomAward(4, 350, 1, "Ho�t ��ng ph� 09/2014");
  gf_AddItemEx2({2, 1, 9977, 1}, "Qu�n C�ng Huy Ho�ng", "Ho�t ��ng ph� 09/2014", "Ho�t ��ng ph� 09/2014", 7 * 24 * 3600, 1)
end

function Ud_GiveAward_136_1()
	gf_Modify("Exp", 6900000);
	AwardGenuineQi(40);
	gf_EventGiveCustomAward(3, 20, 1, "Ho�t ��ng ph� th�ng 10/2014");
	gf_EventGiveCustomAward(4, 20, 1, "Ho�t ��ng ph� th�ng 10/2014");
end

function Ud_GiveAward_136_2()
	gf_Modify("Exp", 21000000);
	AwardGenuineQi(100);
	local tAward = {
		{2, 25, 6000000, 1},
		{2, 20, 12000000, 1},
		{1, 15, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 0},
		{1, 7, "��i Nh�n s�m", {2, 0, 553, 1}, 7 * 24 * 3600},
		{1, 10, "Ti�u Nh�n s�m qu�", {2, 0, 552, 1}, 7 * 24 * 3600},
		{1, 7, "Th�n N�ng ��n", {2, 1, 343, 1}, 7 * 24 * 3600},
		{1, 10, "T�y T�y linh ��n", {2, 0, 137, 1}, 7 * 24 * 3600},
		{1, 1, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
		{1, 2, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
		{1, 3, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Ho�t ��ng ph� th�ng 10/2014", "Ho�t ��ng ph� th�ng 10/2014")
end

function Ud_GiveLastAward_201410()
	ahf_GetGaojiZhenjuan(1, 4, 1)
	AwardGenuineQi(1000)
	gf_EventGiveCustomAward(3, 350, 1, "Ho�t ��ng ph� th�ng 10/2014");
	gf_EventGiveCustomAward(4, 350, 1, "Ho�t ��ng ph� th�ng 10/2014");
	gf_AddItemEx2({2, 1, 9977, 2}, "Qu�n C�ng Huy Ho�ng", "Ho�t ��ng ph� th�ng 10/2014", "Ho�t ��ng ph� th�ng 10/2014", 7 * 24 * 3600, 1)
end

function Ud_GiveAward_139_1()
	gf_Modify("Exp", 6900000);
	AwardGenuineQi(30);
	gf_EventGiveCustomAward(3, 20, 1, "Ho�t ��ng ph� 11/2014");
	gf_EventGiveCustomAward(4, 20, 1, "Ho�t ��ng ph� 11/2014");
end

function Ud_GiveAward_139_2()
	gf_Modify("Exp", 32000000);
	AwardGenuineQi(150);
	local tAward = {
		{2, 20, 10000000, 1},
		{2, 15, 20000000, 1},
		{32, 15, 1000, 1},
		{33, 5, 1000, 1},
		{1, 10, "C�u chuy�n h�i h�n ��n", {1, 0, 32, 2}, 0},
		{1, 5, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 2}, 7 * 24 * 3600},
		{1, 5, "��i Nh�n s�m", {2, 0, 553, 1}, 7 * 24 * 3600},
		{1, 5, "Th�n N�ng ��n", {2, 1, 343, 1}, 7 * 24 * 3600},
		{1, 5, "B�t B�o T�y T�y Ti�n ��n", {2, 0, 138, 1}, 7 * 24 * 3600},
		{1, 5, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
		{1, 5, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
		{1, 5, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Ho�t ��ng ph� 11/2014", "Ho�t ��ng ph� 11/2014")
end

function Ud_GiveLastAward_201411()
	AwardGenuineQi(1000)
	gf_EventGiveCustomAward(3, 350, 1, "Ho�t ��ng ph� 11/2014");
	gf_EventGiveCustomAward(4, 350, 1, "Ho�t ��ng ph� 11/2014");
	gf_AddItemEx2({2, 1, 9977, 3}, "Qu�n C�ng Huy Ho�ng", "Ho�t ��ng ph� 11/2014", "Ho�t ��ng ph� 11/2014", 7 * 24 * 3600, 1)
end