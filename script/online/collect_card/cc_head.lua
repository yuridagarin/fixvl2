Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\collect_card\\cc_define.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\misc\\taskmanager.lua")

--�ʱ��
--acitivity time
CC_START_TIME = 2013060500
CC_END_TIME = 2013063000

CC_ACTIVITY_TASK_GROUP = TaskManager:Create(6,5);
CC_ACTIVITY_TASK_GROUP.DAYSEQ = 1; --����������
CC_ACTIVITY_TASK_GROUP.ANSWER_TIMES = 2; --����������
CC_ACTIVITY_TASK_GROUP.QUESTION1 = 3;
CC_ACTIVITY_TASK_GROUP.QUESTION2 = 4;
CC_ACTIVITY_TASK_GROUP.QUESTION3 = 5;
CC_ACTIVITY_TASK_GROUP.CARD3_TIMES = 6;--�Ͻ������ֿ�����
CC_ACTIVITY_TASK_GROUP.FLAG_BIT = 7; --��λ���
CC_ACTIVITY_TASK_GROUP.BOSS_BOX_1 = 1; --������
CC_ACTIVITY_TASK_GROUP.BOSS_BOX_2 = 2;
CC_ACTIVITY_TASK_GROUP.BOSS_BOX_3 = 3;
CC_ACTIVITY_TASK_GROUP.BOSS_BOX_4 = 4;
CC_ACTIVITY_TASK_GROUP.CON_TAG = 5;  --������Ա��
CC_ACTIVITY_TASK_GROUP.BOX_AWARD_CARD = 8; --�����ȡ��è������
CC_ACTIVITY_TASK_GROUP.CARD2_TIMES = 9; --�Ͻ��ڶ��ֿ�����
CC_ACTIVITY_TASK_GROUP.ZLPPARK_COUNT = 10; --����Ƭ�����ô���

--��Ƿ���
function cc_activity_isopen()
	return gf_CheckEventDateEx2(CC_START_TIME, CC_END_TIME);
end

function cc_daily_clear()
	if cc_activity_isopen() ~= 1 then
		return 0;
	end
	--��������
	if CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.DAYSEQ) ~= zgc_pub_day_turn() then
		for i = 1, 10 do
			CC_ACTIVITY_TASK_GROUP:SetTask(i, 0);
		end
		CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.DAYSEQ, zgc_pub_day_turn());
	end
end

function cc_answer_question()
	--�ʱ��
	if cc_activity_isopen() ~= 1 then
		Talk(1,"","Event v�n ch�a kh�i ��ng");
		return 0;
	end
	--��������
	if gf_CheckBaseCondition(CC_PLAYER_LEVEL_MIN) ~= 1 then
		return 0;
	end
	--�����ռ�
	if GetFreeItemRoom() < 5 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	if gf_Judge_Room_Weight(5, 50, "") ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0;
	end	
	local tTemp = {
		CC_ACTIVITY_TASK_GROUP.QUESTION1,
		CC_ACTIVITY_TASK_GROUP.QUESTION2,
		CC_ACTIVITY_TASK_GROUP.QUESTION3,
	}
	--��������
	cc_daily_clear();
	--�Ƿ��ǳ���3����
	--��Ŀ������
	local nIndex = CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.ANSWER_TIMES) + 1;
	if nIndex > CC_ANSWER_TIMES then 
		Talk(1,"","S� l�n tr� l�i c�u h�i h�m nay �� s� d�ng h�t, ng�y mai h�y ti�p t�c.")
		return 0;
	end
	--�����������Ŀ
	if nIndex == 1 then
		local tRand = gf_Random(1, getn(CC_QUESTION_LIB), getn(tTemp));
		for i = 1, getn(tRand) do
			CC_ACTIVITY_TASK_GROUP:SetTask(i + CC_ACTIVITY_TASK_GROUP.QUESTION1 - 1, tRand[i]);
		end
	end
	--����Ŀ
	local nTableIndex = CC_ACTIVITY_TASK_GROUP:GetTask(tTemp[nIndex]);
	local tSay = {};
	local tSubTable = CC_QUESTION_LIB[nTableIndex];
	if not tSubTable or getn(tSubTable) ~= 3 then  return 0; end
	for i = 1, getn(tSubTable[2]) do
		if i == tSubTable[3] then
			tinsert(tSay, tSubTable[2][i].."/cc_answer_question_succ")
		else
			tinsert(tSay, tSubTable[2][i].."/cc_answer_question_fail")
		end
	end
	tinsert(tSay, "\n r�t lui/nothing");
	Say(CC_NPC..tSubTable[1]..format("<color=red> ( hi�n t�i �ang tr� l�i l�n th� %d) <color>", nIndex), getn(tSay), tSay);
end

function cc_answer_question_succ()
	local nAnswerTimes = CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.ANSWER_TIMES) + 1;
	CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.ANSWER_TIMES, nAnswerTimes);
	local tAward = {
		[1] = 10000,
		[2] = 15000,
		[3] = 20000,	
	}
	if nAnswerTimes > 1 and nAnswerTimes <= getn(tAward) then 
		if CC_ACTIVITY_TASK_GROUP:GetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.CON_TAG) == 0 then
			--������Խ���
			gf_Modify("Exp", tAward[nAnswerTimes]);
			cc_answer_item_award(nAnswerTimes);
		else
			--��Խ���
			gf_Modify("Exp", tAward[1]);
			cc_answer_item_award(1);
		end
	elseif nAnswerTimes == 1 then
		gf_Modify("Exp", tAward[1]);
		cc_answer_item_award(1);
	end
	--�����
	CC_ACTIVITY_TASK_GROUP:SetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.CON_TAG, 0);
	--��������
	cc_answer_continue(nAnswerTimes);
end

function cc_answer_question_fail()
	local nAnswerTimes = CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.ANSWER_TIMES) + 1;
	CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.ANSWER_TIMES, nAnswerTimes);
	--�����
	CC_ACTIVITY_TASK_GROUP:SetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.CON_TAG, 1);
	--ʧ�ܽ���
	gf_Modify("Exp", 2500);
	--��������
	Say(CC_NPC.."<color=red> th�t ��ng ti�c, ng��i tr� l�i sai r�i ! <color>", 2, "Ti�p t�c tr� l�i/#cc_answer_continue("..nAnswerTimes..")", "��i m�t l�t r�i n�i nh�/nothing");
end

function cc_answer_continue(nAnswerTimes)
	if nAnswerTimes < CC_ANSWER_TIMES then
		cc_answer_question();
	else
		Talk(1, "", "S� l�n tr� l�i c�u h�i h�m nay �� s� d�ng h�t, ng�y mai h�y ti�p t�c.");	
	end
end

function cc_answer_item_award(nKind)
	local tAward = {
		[1] = {
			{1, 85, "L�i T�", {2, 1, 30505, 1}, 0},
			{1, 15, "L�c Hoa Quy�t", {2, 1, 30506, 1}, 0},
		},	
		[2] = {
			{1, 75, "L�i T�", {2, 1, 30505, 1}, 0},
			{1, 25, "L�c Hoa Quy�t", {2, 1, 30506, 1}, 0},
		},	
		[3] = {
			{1, 70, "L�i T�", {2, 1, 30505, 1}, 0},
			{1, 25, "L�c Hoa Quy�t", {2, 1, 30506, 1}, 0},
			{1, 5, "Linh Mi�u V�n", {2, 1, 30507, 1}, 0},
		},
	}
	cc_card_award_func({tAward, nKind, nKind, "Ki�n th�c v�n ��p"});
end

function cc_get_award(nKind)
	--�ʱ��
	if cc_activity_isopen() ~= 1 then
		Talk(1,"","Event v�n ch�a kh�i ��ng");
		return 0;
	end
	--��������
	if nKind < 1 and nKind > 3 then return 0; end
	--��������
	if gf_CheckBaseCondition(CC_PLAYER_LEVEL_MIN) ~= 1 then
		return 0;
	end
	--�����ռ�
	if GetFreeItemRoom() < 5 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	if gf_Judge_Room_Weight(5, 50, "") ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0;
	end
	--�۳���Ʒ
	local tItemDel = {
		[1] = {
			{2,	1, 30505, 1, "L�i T�"},	
		},
		[2] = {
			{2,	1, 30505, 1, "L�i T�"},
			{2,	1, 30506, 1, "L�c Hoa Quy�t"},
		},
		[3] = {
			{2,	1, 30505, 1, "L�i T�"},
			{2,	1, 30507, 1, "Linh Mi�u V�n"},
		},
	}
	for i = 1, getn(tItemDel[nKind]) do 
		if GetItemCount(tItemDel[nKind][i][1], tItemDel[nKind][i][2], tItemDel[nKind][i][3]) < tItemDel[nKind][i][4] then
			Talk(1,"",format("Trong h�nh trang kh�ng c� �� %s", tItemDel[nKind][i][5]));
			return 0;
		end
	end
	for i = 1, getn(tItemDel[nKind]) do
		if DelItem(tItemDel[nKind][i][1], tItemDel[nKind][i][2], tItemDel[nKind][i][3], tItemDel[nKind][i][4]) ~= 1 then
			return 0;
		end
	end
	--�����齱��
	local tExpAward = {
		[1] = 10000,
		[2] = 150000,
		[3] = 300000,	
	}
	gf_Modify("Exp", tExpAward[nKind]);
	--�Ͻ�����
	if nKind == 2 then
		local nCard2Times = CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.CARD2_TIMES) + 1;
		if nCard2Times > CC_CARD2_MAX then
			return 0;
		end
		CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.CARD2_TIMES, nCard2Times)
		--��һ���������
		local nCount = CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.ZLPPARK_COUNT);
		if mod(nCard2Times, 100) == 0 and nCount < CC_ZLP_PARK_MAX then
			gf_AddItemEx2({2, 1, 30540, 1}, "L� Bao Phi�n B�n M�i", CC_LOG_TITLE, "Giao n�p Th� L�i T� + Th� L�c Hoa Quy�t nh�n th��ng ", 0, 1);
			CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.ZLPPARK_COUNT, nCount+1);
		end
		 gf_WriteLogEx(CC_LOG_TITLE, "n�p th�nh c�ng", 1, "N�p L�i T� + Hoa Quy�t l�n th� "..nCard2Times)
	end
	if nKind == 3 then
		local nCard3Times = CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.CARD3_TIMES) + 1;
		CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.CARD3_TIMES, nCard3Times)
		--��һ��������Ƭ���
		if mod(nCard3Times, 100) == 0 then
			gf_AddItemEx2({2, 1, 30540, 1}, "L� Bao Phi�n B�n M�i", CC_LOG_TITLE, "Giao n�p Th� L�i T� + Th� Linh Mi�u V�n nh�n th��ng", 0, 1);
		end
		--��һ��������
		if mod(nCard3Times, 100) == 0 and mod(nCard3Times / 100, 2) == 0 then
			gf_AddItemEx2({2, 1, 30508, 1}, "L� bao Thi�n Cang L�nh", CC_LOG_TITLE, "Giao n�p Th� L�i T� + Th� Linh Mi�u V�n nh�n th��ng", 0, 1);
		end
		--��һ�����Ž������
		if mod(nCard3Times, 100) == 0 and mod(nCard3Times / 100, 3) == 0 then
			gf_AddItemEx2({2, 1, 30509, 1}, "L� bao Thi�n M�n Kim L�nh", CC_LOG_TITLE, "Giao n�p Th� L�i T� + Th� Linh Mi�u V�n nh�n th��ng", 0, 1);
		end
		gf_WriteLogEx(CC_LOG_TITLE, "n�p th�nh c�ng", 1, "N�p L�i T� + Linh Mi�u l�n th� "..nCard3Times)
	end
	local tAwardTable = CC_CARD_AWARD[nKind];
	if tAwardTable then 
		gf_EventGiveRandAward(tAwardTable, gf_SumRandBase(tAwardTable), 1, CC_LOG_TITLE, "Giao n�p Th� B�i nh�n th��ng",nil,1);
	end
end
---------------------------------------------------
function cc_tmz_award_succ()
	local tAward = {
		[1] = {
			{1, 80, "L�i T�", {2, 1, 30505, 1}, 0},
			{1, 15, "L�c Hoa Quy�t", {2, 1, 30506, 1}, 0},
			{1, 5, "Linh Mi�u V�n", {2, 1, 30507, 1}, 0},
		},
	}
	cc_card_award_func({tAward, 1, 3, "Thi�n M�n tr�n"});
end


function cc_tmz_award_fail()
	local tAward = {
		[1] = {
			{1, 80, "L�i T�", {2, 1, 30505, 1}, 0},
			{1, 20, "L�c Hoa Quy�t", {2, 1, 30506, 1}, 0},
		},
	}
	cc_card_award_func({tAward, 1, 1, "Thi�n M�n tr�n"});
end

function cc_wjz_award(nStep)
	local tTemp = {1,1,2,3};
	if not tTemp or not tTemp[nStep] then return 0; end
	cc_card_award_func({CC_COPY_AWARD[1], nStep, tTemp[nStep], "V�n Ki�m Tr�ng"});
end

function cc_ttd_award(nStep)
	local tTemp = {1,1,2,2,3,3,4};
	if not tTemp or not tTemp[nStep] then return 0; end
	cc_card_award_func({CC_COPY_AWARD[2], nStep, tTemp[nStep], "Th�ng Thi�n Huy�n C�nh"});
end

function cc_ls_award(nStep)
	local tTemp = {1,1,1,1,1,1};
	if not tTemp or not tTemp[nStep] then return 0; end
	cc_card_award_func({CC_COPY_AWARD[3], nStep, tTemp[nStep], "C�a �i L��ng S�n "});
end
-------------------------------------------------------
--Relayˢ��
function cc_relay_call_boss(nRandomSeed)
	if cc_activity_isopen() ~= 1 then
		return 0;
	end
	if not nRandomSeed then return 0; end
	randomseed(nRandomSeed);
	local nNpcIndex = random(getn(CC_BOSS_INFO));
	local nMapIndex = random(getn(CC_MAP_ID));
	if not CC_MAP_ID[nMapIndex] then  return 0; end
	local tRandPos = CC_RAND_POS[CC_MAP_ID[nMapIndex][1]];
	if not tRandPos then return 0; end
	local nRandPos = random(getn(tRandPos));
	--�㲥
	local strMsg = format("BOSS mang Ho�ng Kim B�o B�i %s xu�t hi�n t�i %s, c�c v� anh h�ng nhanh ch�ng �i khi�u chi�n!", CC_BOSS_INFO[nNpcIndex][2], CC_MAP_ID[nMapIndex][2]);
	Msg2Global(strMsg);
	AddLocalNews(strMsg);
	--�����ͼ��������������Ͳ�ˢ
	if SubWorldID2Idx(CC_MAP_ID[nMapIndex][1]) == -1 then
		return 0;
	end
	--ˢNPC
	local npcIdx = CreateNpc(CC_BOSS_INFO[nNpcIndex][1], CC_BOSS_INFO[nNpcIndex][2], CC_MAP_ID[nMapIndex][1], tRandPos[nRandPos][1], tRandPos[nRandPos][2]);
	if npcIdx > 0 then
		SetNpcDeathScript(npcIdx, "\\script\\online\\collect_card\\cc_boss_death.lua");
		SetNpcLifeTime(npcIdx, 60*30);
	end
end

function cc_get_allow_tag()
	--��������
	cc_daily_clear();
	local strTime = tonumber(date("%H%M"));
	if strTime >= 0830 and strTime < 1230 then
		return CC_ACTIVITY_TASK_GROUP:GetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.BOSS_BOX_1);
	elseif strTime >= 1230 and strTime < 1730 then
		return CC_ACTIVITY_TASK_GROUP:GetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.BOSS_BOX_2);
	elseif strTime >= 1730 and strTime < 2230 then
		return CC_ACTIVITY_TASK_GROUP:GetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.BOSS_BOX_3);
	elseif strTime > 2230 and strTime < 2359 then
		return CC_ACTIVITY_TASK_GROUP:GetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.BOSS_BOX_4);
	end  
end

function cc_set_allow_tag()
	--��������
	cc_daily_clear();
	local strTime = tonumber(date("%H%M"));
	if strTime >= 0830 and strTime < 1230 then
		CC_ACTIVITY_TASK_GROUP:SetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.BOSS_BOX_1, 1);
	elseif strTime >= 1230 and strTime < 1730 then
		CC_ACTIVITY_TASK_GROUP:SetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.BOSS_BOX_2, 1);
	elseif strTime >= 1730 and strTime < 2230 then
		CC_ACTIVITY_TASK_GROUP:SetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.BOSS_BOX_3, 1);
	elseif strTime > 2230 and strTime < 2359 then
		CC_ACTIVITY_TASK_GROUP:SetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.BOSS_BOX_4, 1);
	end
end

function cc_box_award()
	--�ʱ��
	if cc_activity_isopen() ~= 1 then
		Talk(1,"","Event v�n ch�a kh�i ��ng");
		return 0;
	end
	--��������
	if gf_CheckBaseCondition(CC_PLAYER_LEVEL_MIN) ~= 1 then
		return 0;
	end
	--�����ռ�
	if GetFreeItemRoom() < 5 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	if gf_Judge_Room_Weight(5, 50, "") ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0;
	end	
	if cc_get_allow_tag() ~= 1 then
		cc_set_allow_tag();
		--Exp
		gf_Modify("Exp", 100000);
		--Item
		local nIndex = gf_GetRandItemByTable(CC_BOX_AWARD, gf_SumRandBase(CC_BOX_AWARD), 1);
		if tostring(CC_BOX_AWARD[nIndex][3]) == "Linh Mi�u V�n" then
			local nTimes= CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.BOX_AWARD_CARD);
			if nTimes >= CC_BOX_MAX_LM_CARD then
				nIndex = random(1, max(1, nIndex-1));
			else
				CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.BOX_AWARD_CARD, nTimes + CC_BOX_AWARD[nIndex][4][4]);
			end
		end
		gf_EventGiveRandAward(CC_BOX_AWARD, gf_SumRandBase(CC_BOX_AWARD), 1, CC_LOG_TITLE, "Ho�ng Kim B�o B�i", nIndex);
	else
		Talk(1,"","Ng��i �� nh�n ph�n th��ng r�i, kh�ng th� nh�n th�m n�a.");	
	end
end

function cc_card_award_func(t)
	if cc_activity_isopen() ~= 1 then
		return 0;
	end
	--t = {tAward, nKind, nCount, log_title};
	if not t or type(t) ~= "table" or getn(t) ~= 4 then
		return 0;
	end
	if gf_CheckBaseCondition(80,1) ~= 1 then
		return 0;
	end
	local tAward = t[1];
	local tAwardSub = tAward[t[2]];
	if not tAwardSub then  return 0; end
	for i = 1, t[3] do
		if GetFreeItemRoom() < 1 then
			Msg2Player("Kh�ng gian kh�ng �� kh�ng th� nh�n l�y Th� T�");
			return 0;
		end
		if gf_Judge_Room_Weight(5, 50, "") ~= 1 then
			Msg2Player("Kh�ng gian kh�ng �� kh�ng th� nh�n l�y Th� T�");
			return 0;
		end	
		
		local nIndex = gf_GetRandItemByTable(tAwardSub, gf_SumRandBase(tAwardSub), 1);
		if tostring(tAwardSub[nIndex][3]) == "Linh Mi�u V�n" then
			local nTimes= CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.BOX_AWARD_CARD);
			if nTimes >= CC_BOX_MAX_LM_CARD then
				nIndex = random(1, max(1, nIndex - 1));
			else
				CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.BOX_AWARD_CARD, nTimes + tAwardSub[nIndex][4][4]);
			end
		end
		gf_EventGiveRandAward(tAwardSub, gf_SumRandBase(tAwardSub), 1, CC_LOG_TITLE, t[4], nIndex);
	end
end


