Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\function\\lucky_box\\lb_define.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\script\\class\\ktabfile.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

--�������ñ�-----------------------------------------------
g_LuckyBoxAwardTab = ff_GetTabFileTable(LB_AWARD_CONFIG, 3);
if not g_LuckyBoxAwardTab then
	print("ERROR:can not read \\script\\function\\lucky_box\\lucky_box.txt!!!");
end

g_LuckyBoxFreeAward = {};
for i = 1, getn(g_LuckyBoxAwardTab) do
	g_LuckyBoxFreeAward[i] = {i, g_LuckyBoxAwardTab[i][6]};
end

g_LuckyBoxIBAward = {};
for i = 1, getn(g_LuckyBoxAwardTab) do
	g_LuckyBoxIBAward[i] = {i, g_LuckyBoxAwardTab[i][10]};
end
------------------------------------------------------------
--�������������1-28
--ʧ�ܷ���0
--"Free"��Ѹ���
--"IB"�շѸ���
function lb_RandomOneAward(nType)
	if not g_LuckyBoxAwardTab then
		DebugOutput("g_LuckyBoxAwardTab is nil")
		return 0;
	end
	if "string" ~= type(nType) then
		DebugOutput("'string' ~= type(nType)")
		return 0;
	end
	if "Free" == nType then
		return gf_GetRandItemByTable(g_LuckyBoxFreeAward, gf_SumRandBase(g_LuckyBoxFreeAward), 0);
	elseif "IB" == nType then
		return gf_GetRandItemByTable(g_LuckyBoxIBAward, gf_SumRandBase(g_LuckyBoxIBAward), 0);
	end
	return 0;
end

--������
function _lb_DoAward(nLotteryType)
	if not g_LuckyBoxAwardTab then
		g_LuckyBoxAwardTab = ff_GetTabFileTable(LB_AWARD_CONFIG, 3);
	end
	if not g_LuckyBoxAwardTab or getn(g_LuckyBoxAwardTab) ~= 28 then
		WriteLog(format("[luckybox][Error][Name:%s] _lb_DoAward(%d) can not read lucky_box.txt TaskValue = %d", GetName(), nLotteryType, GetTask(TASKID_LUCKYBOX_LOTTERY)));
		gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 2, 0, TASK_ACCESS_CODE_LUCKY_BOX);
		return 0;
	end
	local nIndex = gf_GetMyTaskBit(TASKID_LUCKYBOX_LOTTERY, 9, 13);
	local nIBOrFreeType = gf_GetMyTaskBit(TASKID_LUCKYBOX_LOTTERY, 14, 16);
	local tCell = g_LuckyBoxAwardTab[nIndex]
	if not tCell or getn(tCell) < 13 then
		WriteLog(format("[luckybox][Error][Name:%s] _lb_DoAward(%d) not tCell or getn(tCell) ~= 13 TaskValue = %d", GetName(), nLotteryType, GetTask(TASKID_LUCKYBOX_LOTTERY)));
		gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 2, 0, TASK_ACCESS_CODE_LUCKY_BOX);
		return 0;
	end
	--���ó齱���
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 2, 0, TASK_ACCESS_CODE_LUCKY_BOX);
	if nIBOrFreeType == 0 then
		DebugOutput(tCell[1],tCell[2],tCell[3],tCell[4],tCell[5],tCell[6],tCell[7],tCell[8],tCell[9],tCell[10],tCell[11],tCell[12],tCell[13])
		if GetFreeItemRoom() > 0 then
			gf_AddItemEx2({tonumber(tCell[2]), tonumber(tCell[3]), tonumber(tCell[4]), tonumber(tCell[5]), tonumber(tCell[8])},
				 tCell[1], "B�ch B�o R��ng May M�n", "FREE", tonumber(tCell[7]) * 24 *3600, 1);
			if tonumber(tCell[9]) == 1 then
				Msg2Global(format("Ch�c m�ng [%s] � R��ng B�ch B�o May M�n r�t ���c ph�n th��ng [%s]*%d, th�t l� may m�n!", GetName(), tCell[1], tonumber(tCell[5])));
			end
--			--ͳ�Ʋ���
--			local szItemName = GetItemName(tonumber(tCell[2]), tonumber(tCell[3]), tonumber(tCell[4]));
--			DebugOutput("szItemName =", szItemName);
--			if "�����" == szItemName then
--				AddRuntimeStat(17, 7, 0, 1);
--			elseif "���Ž���" == szItemName then
--				AddRuntimeStat(17, 8, 0, 1);
--			elseif "�׻�����" == szItemName then
--				AddRuntimeStat(17, 9, 0, 1);
--			end
		else
			Msg2Player("H�nh trang ho�c s�c l�c kh�ng ��, xin s�p x�p l�i!");
			gf_WriteLogEx("luckybox", "lack of free room");
		end
	elseif nIBOrFreeType == 1 then
		DebugOutput(tCell[1],tCell[2],tCell[3],tCell[4],tCell[5],tCell[6],tCell[7],tCell[8],tCell[9],tCell[10],tCell[11],tCell[12],tCell[13])
		if GetFreeItemRoom() > 0 then
			gf_AddItemEx2({tonumber(tCell[2]), tonumber(tCell[3]), tonumber(tCell[4]), tonumber(tCell[5]), tonumber(tCell[12])},
				 tCell[1], "B�ch B�o R��ng May M�n", "IB", tonumber(tCell[11]) * 24 *3600, 1);
			if tonumber(tCell[13]) == 1 then
				Msg2Global(format("Ch�c m�ng [%s] � R��ng B�ch B�o May M�n r�t ���c ph�n th��ng [%s]*%d, th�t l� may m�n!", GetName(), tCell[1], tonumber(tCell[5])));
			end
			local szItemName = GetItemName(tonumber(tCell[2]), tonumber(tCell[3]), tonumber(tCell[4]));
			DebugOutput("szItemName =", szItemName);
--			--ͳ�Ʋ���
--			if "�����" == szItemName then
--				AddRuntimeStat(17, 10, 0, 1);
--			elseif "���Ž���" == szItemName then
--				AddRuntimeStat(17, 11, 0, 1);
--			elseif "�׻�����" == szItemName then
--				AddRuntimeStat(17, 12, 0, 1);
--			end
		else
			Msg2Player("H�nh trang ho�c s�c l�c kh�ng ��, xin s�p x�p l�i!");
			gf_WriteLogEx("luckybox", "lack of free room");
		end
		--������һ��
		local nLotteryCount = gf_GetTaskByte(TASKID_LUCKYBOX_LOTTERY, 3);
		if nLotteryCount - 1 > 0 then --�Ƿ�Ϊ10������
			lb_CostMoreIBItem(nLotteryType, nLotteryCount - 1);
		end
	end
end

--��ǹ�����
function lb_IsOpen()
	--����Ϊ�����-----
	if 1 then
		return 0
	end
	---------------------
	local nCurrTime = GetTime();
	local nStartTime = MkTime(LB_START_TIME[1],LB_START_TIME[2],LB_START_TIME[3],LB_START_TIME[4],LB_START_TIME[5],LB_START_TIME[6]);
	local nEndTime = MkTime(LB_STOP_TIME[1],LB_STOP_TIME[2],LB_STOP_TIME[3],LB_STOP_TIME[4],LB_STOP_TIME[5],LB_STOP_TIME[6]);
	if nCurrTime >= nStartTime and nCurrTime <= nEndTime then
		return 1;
	end
	return 0;
end

--�����������
function lb_CheckCondition()
	if GetLevel() < 90 then
		Talk(1,"",format("Nh�n v�t ch�a ��t c�p <color=red>%d<color>", 90));
		return 0;
	end
	if gf_Judge_Room_Weight(2, 10," ") ~= 1 then
		return 0;
	end
	return 1;
end

--ÿ������
function lb_DailyClear()
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 1, LB_FREE_USE_MAX, TASK_ACCESS_CODE_LUCKY_BOX);
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 4, LB_IB_ITEM_USE_MAX, TASK_ACCESS_CODE_LUCKY_BOX);
end

--�򿪹رս���ʱ����
function _lb_UIChange_Clean()
	DebugOutput("_lb_UIChange_Clean()")
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 2, 0, TASK_ACCESS_CODE_LUCKY_BOX);
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 3, 0, TASK_ACCESS_CODE_LUCKY_BOX);
end

--����һ����ѳ齱
function lb_CostOneLuckyCoin(nLotteryType, nLotteryCount)
	DebugOutput("nLotteryType, nLotteryCount =", nLotteryType, nLotteryCount)
	if gf_Judge_Room_Weight(1, 10," ") ~= 1 then
		return 0;
	end
	if GetItemCount(LB_FREE_COST_ITEM[1], LB_FREE_COST_ITEM[2], LB_FREE_COST_ITEM[3]) < LB_FREE_COST_ITEM[4] then
		Talk(1,"",format("S� l��ng <color=red>%s<color> trong t�i kh�ng �� <color=red>%d<color> c�i", LB_FREE_COST_ITEM[5], LB_FREE_COST_ITEM[4]));
		return 0;
	end
	local nRet = lb_RandomOneAward("Free");
	if nRet <= 0 or nRet > 28 then
		WriteLog(format("[luckybox][Error][Name:%s] lb_CostOneLuckyCoin(%d, %d) nRet = %d", GetName(), nLotteryType, nLotteryCount, nRet));
		return 0;
	end
	if gf_GetTaskByte(TASKID_LUCKYBOX_LOTTERY, 2) ~= 0 then
		Talk(1,"","H�y ngh� ng�i r�i th� l�i!");
		return 0;
	end
	if DelItem(gf_UnPack(LB_FREE_COST_ITEM)) ~= 1 then
		Talk(1,"",format("Ti�u hao <color=yellow>%s*%d<color> xu�t hi�n b�t th��ng, h�y th� l�i!", LB_FREE_COST_ITEM[5], LB_FREE_COST_ITEM[4]));
		return 0;
	end
--	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, LB_FREE_COST_ITEM)
	Msg2Player(format("Ti�u hao [%s]*%d", LB_FREE_COST_ITEM[5], LB_FREE_COST_ITEM[4]));
	local nCount = gf_GetTaskByte(TASKID_LUCKYBOX_LOTTERY, 1);
	--ͳ����ѿ�������
	if LB_FREE_USE_MAX == nCount then
		AddRuntimeStat(17, 14, 0, 1);
	end
	AddRuntimeStat(17, 13, 0, 1);
	--��Ѵ����Լ� 
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 1, nCount - 1, TASK_ACCESS_CODE_LUCKY_BOX);
	--��¼�齱���
	gf_SetMyTaskBit(TASKID_LUCKYBOX_LOTTERY, 14, 16, 0, TASK_ACCESS_CODE_LUCKY_BOX);
	gf_SetMyTaskBit(TASKID_LUCKYBOX_LOTTERY, 9, 13, nRet, TASK_ACCESS_CODE_LUCKY_BOX);
	--��¼�����齱ʣ�����
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 3, 0, TASK_ACCESS_CODE_LUCKY_BOX);
	
	StartLuckyBox(nLotteryType, nLotteryCount);
end

--����һ��IB�齱
function lb_CostOneIBItem(nLotteryType, nLotteryCount)
	DebugOutput("nLotteryType, nLotteryCount =", nLotteryType, nLotteryCount)
	local nIBTimes = gf_GetTaskByte(TASKID_LUCKYBOX_LOTTERY, 4);
	if nIBTimes <= 0 then
		Talk(1,"",format("H�m nay c� th� d�ng %s v�i s� l�n l� %d, hi�n t�i c�n %d", "R�t th��ng H�nh V�n", LB_IB_ITEM_USE_MAX, nIBTimes));
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10," ") ~= 1 then
		return 0;
	end
	if GetItemCount(LB_IB_COST_ITEM[1], LB_IB_COST_ITEM[2], LB_IB_COST_ITEM[3]) < LB_IB_COST_ITEM[4] then
		Talk(1,"",format("S� l��ng <color=red>%s<color> trong t�i kh�ng �� <color=red>%d<color> c�i", LB_IB_COST_ITEM[5], LB_IB_COST_ITEM[4]));
		return 0;
	end
	local nRet = lb_RandomOneAward("IB");
	if nRet <= 0 or nRet > 28 then
		WriteLog(format("[luckybox][Error][Name:%s] lb_CostOneIBItem(%d, %d) nRet = %d", GetName(), nLotteryType, nLotteryCount, nRet));
		return 0;
	end
	if gf_GetTaskByte(TASKID_LUCKYBOX_LOTTERY, 2) ~= 0 then
		Talk(1,"","H�y ngh� ng�i r�i th� l�i!");
		return 0;
	end
	if DelItem(gf_UnPack(LB_IB_COST_ITEM)) ~= 1 then
		Talk(1,"",format("Ti�u hao <color=yellow>%s*%d<color> xu�t hi�n b�t th��ng, h�y th� l�i!", LB_IB_COST_ITEM[5], LB_IB_COST_ITEM[4]));
		return 0;
	end
	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, LB_IB_COST_ITEM)
	Msg2Player(format("Ti�u hao [%s]*%d", LB_IB_COST_ITEM[5], LB_IB_COST_ITEM[4]));
		
	--��¼�齱���
	gf_SetMyTaskBit(TASKID_LUCKYBOX_LOTTERY, 14, 16, 1, TASK_ACCESS_CODE_LUCKY_BOX);
	gf_SetMyTaskBit(TASKID_LUCKYBOX_LOTTERY, 9, 13, nRet, TASK_ACCESS_CODE_LUCKY_BOX);
	--��¼�����齱ʣ�����
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 3, nLotteryCount, TASK_ACCESS_CODE_LUCKY_BOX);
	--ʹ��һ������ҡ��
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 4, nIBTimes - 1, TASK_ACCESS_CODE_LUCKY_BOX);
		
	StartLuckyBox(nLotteryType, nLotteryCount);
	
	--������
	if LB_IB_ITEM_USE_MAX == nIBTimes then
		AddRuntimeStat(17, 16, 0, 1);
	end
	--�ܴ���
	AddRuntimeStat(17, 15, 0, 1);
end

--���ж��IB�齱
function lb_CostMoreIBItem(nLotteryType, nLotteryCount)
	DebugOutput("nLotteryType, nLotteryCount =", nLotteryType, nLotteryCount)
	if 10 == nLotteryCount then
		--��ʼ����ǰ�ж��Ƿ�10������
		if gf_Judge_Room_Weight(10, 100, " ") ~= 1 then
			return 0;
		end
	end
	if gf_GetTaskByte(TASKID_LUCKYBOX_LOTTERY, 2) ~= 0 then
		Talk(1,"","H�y ngh� ng�i r�i th� l�i!");
		StartLuckyBox(0, 0);
		return 0;
	end
	local nRet = lb_RandomOneAward("IB");
	if nRet <= 0 or nRet > 28 then
		WriteLog(format("[luckybox][Error][Name:%s] lb_CostMoreIBItem(%d, %d) nRet = %d", GetName(), nLotteryType, nLotteryCount, nRet));
		StartLuckyBox(0, 0);
		return 0;
	end
	--�۳�����
	local nIBTimes = gf_GetTaskByte(TASKID_LUCKYBOX_LOTTERY, 4);
	if nIBTimes <= 0 then
		Talk(1,"",format("H�m nay c� th� d�ng %s v�i s� l�n l� %d, hi�n t�i c�n %d", "R�t th��ng H�nh V�n", LB_IB_ITEM_USE_MAX, nIBTimes));
		StartLuckyBox(0, 0);
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		StartLuckyBox(0, 0);
		return 0;
	end
	if GetItemCount(LB_IB_COST_ITEM[1], LB_IB_COST_ITEM[2], LB_IB_COST_ITEM[3]) < LB_IB_COST_ITEM[4] then
		Talk(1,"",format("S� l��ng <color=red>%s<color> trong t�i kh�ng �� <color=red>%d<color> c�i", LB_IB_COST_ITEM[5], LB_IB_COST_ITEM[4]));
		StartLuckyBox(0, 0);
		return 0;
	end
	if DelItem(gf_UnPack(LB_IB_COST_ITEM)) ~= 1 then
		Talk(1,"",format("Ti�u hao <color=yellow>%s*%d<color> xu�t hi�n b�t th��ng, h�y th� l�i!", LB_IB_COST_ITEM[5], LB_IB_COST_ITEM[4]));
		StartLuckyBox(0, 0);
		return 0;
	end
	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, LB_IB_COST_ITEM)
	Msg2Player(format("Ti�u hao [%s]*%d", LB_IB_COST_ITEM[5], LB_IB_COST_ITEM[4]));
	
	--ʹ��1���콾��
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 4, nIBTimes - 1, TASK_ACCESS_CODE_LUCKY_BOX);
	--��¼�齱���
	gf_SetMyTaskBit(TASKID_LUCKYBOX_LOTTERY, 14, 16, 1, TASK_ACCESS_CODE_LUCKY_BOX);
	gf_SetMyTaskBit(TASKID_LUCKYBOX_LOTTERY, 9, 13, nRet, TASK_ACCESS_CODE_LUCKY_BOX);
	--��¼�����齱ʣ�����
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 3, nLotteryCount, TASK_ACCESS_CODE_LUCKY_BOX);
	
	StartLuckyBox(nLotteryType, nLotteryCount);
	
	--������
	if LB_IB_ITEM_USE_MAX == nIBTimes then
		AddRuntimeStat(17, 16, 0, 1);
	end
	--�ܴ���
	AddRuntimeStat(17, 15, 0, 1);
end
			
--gs���ýӿ�LuckyBox.cpp----------------------
function _lb_OnLottery(nLotteryType, nLotteryCount)
	DebugOutput("nLotteryType, nLotteryCount =", nLotteryType, nLotteryCount)
	if lb_CheckCondition() ~= 1 then
		return 0;
	end
	--��һ��
	if 1 == nLotteryType then
		local nFreeTimes = gf_GetTaskByte(TASKID_LUCKYBOX_LOTTERY, 1);
		if nFreeTimes > 0 then
			lb_CostOneLuckyCoin(nLotteryType, nLotteryCount); --���һ��
			return 1;
		else	
			--����û����Ѵ���
			lb_CostOneIBItem(nLotteryType, nLotteryCount); --IBһ��
			return 1;
		end
	--��10��
	elseif 2 == nLotteryType then
		Say(format("<color=green>R��ng b�ch b�o may m�n: <color>%s mu�n m� 10 l�n kh�ng?", gf_GetPlayerSexName()), 2,
					format("\nX�c nh�n/#lb_CostMoreIBItem(%d, %d)", nLotteryType, nLotteryCount),  --IB һ��
					"\n�� ta suy ngh� l�i/nothing");
		return 1;
	end
	return 0;
end

--�NPC����------------------------------------
LB_NPC_TITLE = "�� ch�o m�ng phi�n b�n m�i, ��i S� �� chu�n b� cho m�i ng��i 1 R��ng B�ch B�o May M�n, h�y nhanh ch�ng tham gia �� nh�n ph�n th��ng phong ph� n�o!"

LB_NPC_DIALOG = {
	"Tham gia ho�t ��ng R��ng B�ch B�o May M�n/lb_JoinActivity",
	"H��ng d�n ho�t ��ng/lb_ActivityInfo",
	"Ngu�n v�t ph�m ho�t ��ng/lb_ItemDorp",
}

function lb_JoinActivity()
	if lb_IsOpen() ~= 1 then
		Talk(1,"","Ho�t ��ng �� k�t th�c");
		return 0;
	end		
	SendScript2Client("Open[[luckybox]]");	
end

function lb_ActivityInfo()
	local strTitle = "Trong th�i gian ho�t ��ng, gamer c� th� ��n ch� ��i S� Ho�t ��ng tham gia R��ng B�ch B�o May M�n. Ng��i ch�i c� th� d�ng Ti�n May M�n �� m� r��ng 8 l�n. B�t ��u t� l�n th� 9 s� ph�i ti�u hao1Thi�n Ki�u L�nh, ng��i ch�i ch� c�n nh�p b�t ��u �� m� r��ng, ph�n th��ng s� t� ��ng ��a v�o t�i. \n####D�ng Ti�n May M�n nh�n ���c ph�n th��ng �a s� ��u b� kh�a, d�ng Thi�n Ki�u L�nh nh�n ���c ph�n th��ng �a s� ��u kh�ng kh�a\n    Ngo�i tr� m� r��ng ��n l�, ng��i ch�i c�n c� th� m� r��ng li�n t�c 10 l�n, sau khi nh�p m� 10 l�n, h� th�ng s� t� ��ng ti�n h�nh m� r��ng. N�u d�ng Thi�n Ki�u L�nh m� 10 l�n , s� ti�u hao 10 Thi�n Ki�u L�nh. N�u t�i c�a ng��i kh�ng �� ch� tr�ng ho�c ti�u hao h�t Thi�n Ki�u L�nh, th� s� t� ��ng ng�ng r�t th��ng. \n    Ti�u di�t Sa M�c H�nh Nh�n, T�m B�o Nh�n � M� Cung Sa M�c v� T�y H� V� S�, T�y H� D�ng S� � D��c V��ng C�c s� nh�n ���c Ti�n May M�n. \n    <color=red>11:00-13:00 v� 20:00-22:00 h�ng ng�y, ��nh qu�i s� c� x�c su�t r�i ra Ti�n May M�n cao h�n g�p ��i<color>";
	local tbSay = {};
	tbSay.msg = "<color=green> ��i S� ho�t ��ng: <color>"..strTitle;
	tbSay.sel = {
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function lb_ItemDorp()
	local strTitle = "Ngu�n g�c c�a Ti�n May M�n: Ti�u di�t Sa M�c H�nh Nh�n, T�m B�o Nh�n � M� Cung Sa M�c v� T�y H� V� S�, T�y H� D�ng S� � D��c V��ng C�c s� nh�n ���c Ti�n May M�n.<color=red>11:00-13:00 v� 20:00-22:00 h�ng ng�y, ��nh qu�i s� c� x�c su�t r�i ra Ti�n May M�n cao h�n g�p ��i<color>";
	local tbSay = {};
	tbSay.msg = "<color=green> ��i S� ho�t ��ng: <color>".."��y l� v�t ph�m m�i c�a ho�t ��ng l�n n�y, h�y xem th� l�m sao c� ���c!".."\n"..strTitle;
	tbSay.sel = {
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

--���˱ҵ��䲿��-------------------------------------
--ϵͳ�������
function main()
	if lb_IsOpen() ~= 1 then
		return 0;
	end
	local nHour = tonumber(date("%H"))
	local msg = ""
	if nHour >= 11 and nHour <= 12 then
		msg = "11:00-13:00 ��n M� Cung Sa M�c v� D��c V��ng C�c ti�u di�t qu�i s� c� x�c su�t r�i ra Ti�n May M�n cao h�n g�p ��i!"
		Msg2Global(msg);
		AddGlobalNews(msg, 1);
	elseif nHour >= 20 and nHour <= 21 then
		msg = "20:00-22:00 ��n M� Cung Sa M�c v� D��c V��ng C�c ti�u di�t qu�i s� c� x�c su�t r�i ra Ti�n May M�n cao h�n g�p ��i!"
		Msg2Global(msg);
		AddGlobalNews(msg, 1);
	end
end

--���˱ҵ���
function lb_OnKiller(szNpcName)
	if lb_IsOpen() ~= 1 then
		return 0;
	end
	if szNpcName ~= "Sa M�c H�nh Nh�n" and szNpcName ~= "T�m B�o Nh�n" 
		and szNpcName ~= "T�y H� V� S�" and szNpcName ~= "T�y H� D�ng S�" then
		return 0;
	end
	local nRand = 3;
	local nHour = tonumber(date("%H"))
	if (nHour >= 11 and nHour <= 12) or (nHour >= 20 and nHour <= 21) then
		nRand = 8
	end
	if random(100) > nRand then
		return 0;
	end
	local nMapID, nX, nY = GetWorldPos()
	gf_TeamOperateEX(function ()
		if %nMapID ~= GetWorldPos() then
			return
		end
		if GetFreeItemRoom() > 0 then
			AddItem(2, 1, 30664, 1);
		end
	end)
end