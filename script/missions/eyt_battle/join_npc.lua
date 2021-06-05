Include("\\script\\lib\\talktmp.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\eyt_battle\\mission.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\function\\vip_card\\vc_head.lua")

EYT_NPC = "<color=green>Nh�c B�t Qu�n:<color>";

function main()
	if ISEytSystemOpen(2) ~= 1 then
		return 0;
	end
	local tSay = {};
	tSay.msg = EYT_NPC..format("�n O�n ��i ���c ��t � H�ng Li�n S�n, l� n�i �� cho nh�n s� giang h� tranh �o�t ch�n kh� v� gi�i quy�t �n o�n. Sau khi c�c ��i hi�p v�o T� V� �n O�n ��i s� chia th�nh hai ��i, m�i ��i %d ng��i. ��nh b�i ng��i ch�i phe ��ch ho�c �o�t ���c chi�n k� tr�n �n O�n ��i s� nh�n ���c �i�m t�ch l�y, ��i ��t ���c %d �i�m t�ch l�y tr��c ti�n s� gi�nh chi�n th�ng. ��i hi�p mu�n tham gia chi�n ��u kh�ng?", 8, 150);
	tSay.sel = {
		{"�i�u ki�n tham gia ", "eyt_npc_condition"},
		{"B�o danh ��n", "eyt_npc_join"},
		{"B�o danh nh�m (T�i �a 3 ng��i)", "eyt_npc_join_team"},
		{"\nK�t th�c ��i tho�i", "nothing"},
	};
	temp_Talk(tSay);	
end

function eyt_npc_condition()
	local tSay = {};
	tSay.msg = EYT_NPC..format("\nTh�i gian m�: %s", "H�ng ng�y t� 12:00-14:00, 18:00-20:00");
	tSay.msg = tSay.msg.."\nGi�i h�n c�p: Ng��i ch�i ��t chuy�n sinh 5 c�p 96 c� th� b�o danh tham gia";
	tSay.msg = tSay.msg.."\nC�ch th�c b�o danh: C� th� b�o danh ��n ho�c b�o danh nh�m kh�ng qu� 3 ng��i, m�i ng��i tham gia t�i �a 4 l�n/ng�y.";
	tSay.sel = {
		{"\n Ph�n h�i", "main"},
		{"K�t th�c ��i tho�i", "nothing"},
	};
	temp_Talk(tSay);
end

function eyt_npc_join()
	if eyt_npc_check() ~= 1 then
		return 0;
	end
	local nUsableMap = eyt_GetSuitMap(1);
	DebugOutput("nUsableMap =", nUsableMap);
	if nUsableMap ~= 0 then
		local nRed = mf_GetPlayerCount(EYT_MISSION_ID, EYT_CAMP_RED, nUsableMap);
		local nBlue = mf_GetPlayerCount(EYT_MISSION_ID, EYT_CAMP_BLUE, nUsableMap);
		if nRed <= nBlue then
			EYT_MISSION:Enter(nUsableMap, EYT_CAMP_RED);
		else
			EYT_MISSION:Enter(nUsableMap, EYT_CAMP_BLUE);
		end
	else
		if GetMapLoadCount(EYT_MAP_ID) >= EYT_MISSION_MAX then
			Say("Hi�n t�i T� V� �n O�n ��i �� ��y, t�m th�i kh�ng th� v�o, h�y quay l�i sau!", 0);
			return 0;
		end
		local mapID, mapIdx = EYT_MISSION:Create()
		DebugOutput("EYT_MISSION:Create()", mapID, mapIdx);
		EYT_MISSION:Enter(mapID, EYT_CAMP_RED);
	end
end

function eyt_npc_join_team()
	if eyt_npc_check(1) ~= 1 then
		return 0;
	end
	local nUsableMap = eyt_GetSuitMap(GetTeamSize());
	DebugOutput("nUsableMap =", nUsableMap);
	if nUsableMap ~= 0 then
		local nRed = mf_GetPlayerCount(EYT_MISSION_ID, EYT_CAMP_RED, nUsableMap);
		local nBlue = mf_GetPlayerCount(EYT_MISSION_ID, EYT_CAMP_BLUE, nUsableMap);
		if nRed <= nBlue then
			EYT_MISSION:TeamEnter(nUsableMap, EYT_CAMP_RED);
		else
			EYT_MISSION:TeamEnter(nUsableMap, EYT_CAMP_BLUE);
		end
	else
		if GetMapLoadCount(EYT_MAP_ID) >= EYT_MISSION_MAX then
			Say("Hi�n t�i T� V� �n O�n ��i �� ��y, t�m th�i kh�ng th� v�o, h�y quay l�i sau!", 0);
			return 0;
		end
		local mapID, mapIdx = EYT_MISSION:Create()
		DebugOutput("EYT_MISSION:Create()", mapID, mapIdx);
		EYT_MISSION:TeamEnter(mapID, EYT_CAMP_RED);
	end
end

function eyt_npc_check(bTeam)
	--ʱ������
	local nTime = tonumber(date("%H%M"));
	if (not ((1200 <= nTime and nTime < 1400) or (1800 <= nTime and nTime < 2000))) then
		Say(EYT_NPC..format("T� V� �n O�n ��i v�n ch�a m�, m�i %s v�o l�c %s ho�c %s h�y ��n b�o danh tham gia.", gf_GetPlayerSexName(), "12:00", "18:00"), 0);
		return 0;
	end
	--�Ѿ��ж�����
	local nTeamSize = GetTeamSize();
	if not bTeam or bTeam ~= 1 then
		if nTeamSize ~= 0 then
			Say(EYT_NPC..format("%s �� c� t� ��i, kh�ng th� b�o danh ��n �� tham gia T� V� �n O�n ��i", gf_GetPlayerSexName()), 0);
			return 0;
		end
		if gf_CheckLevel(5, 96) ~= 1 then
			Say(EYT_NPC..format("%s ch�a ��t chuy�n sinh %d c�p %d, kh�ng th� v�o T� V� �n O�n ��i", gf_GetPlayerSexName(), 5, 96), 0)
			return 0;
		end
		if eyt_GetJoinTimes() >= EYT_JOIN_TIME_LIMIT then
			Say(EYT_NPC..format("%s h�m nay �� tham gia %d l�n, kh�ng th� v�o T� V� �n O�n ��i", gf_GetPlayerSexName(), EYT_JOIN_TIME_LIMIT), 0)
			return 0;
		end
		local nJoinTime = eyt_GetJoinTime();
		local needTime = EYT_PUNISH_TIME + nJoinTime - GetTime();
		local nMin = floor(needTime/60);
		if needTime > 0 and (nMin <= EYT_PUNISH_TIME/60 and nMin >= 0) then
			Say(EYT_NPC..format("%s tho�t ra gi�a ch�ng trong T� V� �n O�n ��i, %dmin%s sau m�i c� th� ti�p t�c tham gia", gf_GetPlayerSexName(), nMin, mod(needTime,60)), 0);
			return 0;
		end
	else
		if GetName() ~= GetCaptainName() then
			Say(EYT_NPC.."Ch� c� ��i tr��ng m�i ���c bao danh tham gia!", 0)
			return 0;
		end
		if nTeamSize > 3 then
			Say(EYT_NPC..format("%s t� ��i v��t qu� %d ng��i, kh�ng th� b�o danh t� ��i tham gia T� V� �n O�n ��i", gf_GetPlayerSexName(), 3), 0);
			return 0;
		end
		if gf_CheckTeam(
			function ()
				if gf_CheckLevel(5, 96) ~= 1 then
					return 0;
				end
				return 1;
			end, EYT_NPC..format("Th�nh vi�n d��i ��y ch�a ��t chuy�n sinh %d c�p %d, kh�ng th� tham gia T� V� �n O�n ��i:\n", 5, 96)) ~= 1 then
				return 0;
		end
		if gf_CheckTeam(
			function ()
				if eyt_GetJoinTimes() >= EYT_JOIN_TIME_LIMIT then
					return 0;
				end
				return 1;
			end, EYT_NPC..format("Th�nh vi�n d��i ��y h�m nay �� tham gia %d l�n, kh�ng th� tham gia T� V� �n O�n ��i:\n", EYT_JOIN_TIME_LIMIT)) ~= 1 then
				return 0;
		end
		if gf_CheckTeam(
			function ()
				local nJoinTime = eyt_GetJoinTime();
				local needTime = EYT_PUNISH_TIME + nJoinTime - GetTime();
				local nMin = floor(needTime/60);
				if needTime > 0 and (nMin <= EYT_PUNISH_TIME/60 and nMin >= 0) then
					return 0;
				end
				return 1;
			end, EYT_NPC..format("Th�nh vi�n d��i ��y tho�t ra gi�a ch�ng trong tr�n ��u, t�m th�i kh�ng th� tham gia T� V� �n O�n ��i:\n")) ~= 1 then
				return 0;
		end
	end
	return 1;
end

function main_eyt_award()
	local nSucc = eyt_GetSucc()
	local nFail = eyt_GetFail()
	local tSay = {};
	tSay.msg = EYT_NPC..format("%s tham gia T� V� �n O�n ��i t�ng c�ng %d l�n, th�ng %d l�n, th�t b�i %d l�n, hi�n t�i mu�n nh�n th��ng ngay kh�ng? <color=red>(Th�nh t�ch t� v� ch� c� hi�u l�c trong ng�y)<color>", gf_GetPlayerSexName(), nSucc+nFail, nSucc, nFail);
	tSay.sel = {};
	if nSucc + nFail <= 0 then
		tinsert(tSay.sel, {"Hi�n t�i ch�a th� nh�n th��ng", "nothing"});
	else
		if nSucc > 0 then
			tinsert(tSay.sel, {"Nh�n ph�n th��ng th�ng tr�n", "eyt_npc_get_succ_award"});
		end
		if nFail > 0 then
			tinsert(tSay.sel, {"Nh�n ph�n th��ng b�i tr�n", "eyt_npc_get_fail_award"});
		end
	end
	tinsert(tSay.sel, {"K�t th�c ��i tho�i", "nothing"});
	temp_Talk(tSay);
end

function eyt_npc_get_succ_award()
	local nSucc = eyt_GetSucc()
	if nSucc <= 0 then
		Say("Hi�n t�i ch�a th� nh�n th��ng", 0);
		return 0;
	end
	local tSay = {};
	tSay.msg = EYT_NPC..format("%s hi�n t�i � T� V� �n O�n ��i c�n ���c nh�n ph�n th��ng th�ng tr�n %d l�n, hi�n t�i mu�n nh�n th��ng ngay kh�ng? (<color=red>M�i l�n ch� ���c nh�n th��ng c�a 1 tr�n<color>)", gf_GetPlayerSexName(), nSucc);
	tSay.sel = {
		{"L�p t�c nh�n th��ng", "eyt_npc_get_succ_award_do"},
		{"Thi�n Ki�u L�nh nh�n th��ng", "#eyt_npc_get_succ_award_do(1)"},
		{"tr� l�i", "main_eyt_award"},
		{"K�t th�c ��i tho�i", "nothing"},	
	};
	temp_Talk(tSay);
end

function eyt_npc_get_succ_award_do(bUseIb)
	local nSucc = eyt_GetSucc()
	if nSucc <= 0 then
		Say("Hi�n t�i ch�a th� nh�n th��ng", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 10," ") ~= 1 then
		return 0;
	end
	if bUseIb and GetItemCount(2, 97, 236) < 1 then
		Say(format("Trong h�nh trang v�t ph�m %s s� l��ng kh�ng �� %d", "Thi�n Ki�u L�nh", 1), 0);
		return 0;
	end
	if not bUseIb then --ֱ���콱
		local nExp = 10000000 * (1 + EYT_AWARD_COEFFICIENT + GetVipCardParam());
		gf_ModifyExp(nExp);
		gf_AddItemEx2({2,1,30499,1}, "Hu�n ch��ng anh h�ng", "T� V� �n O�n ��i", "Ph�n th��ng th�ng tr�n �n O�n ��i", 0, 1);
		CustomAwardGiveOne(CustomAwardSelectOne("EY_jinbaoxiang_2_free"));
	else --�콾���콱
		if DelItem(2, 97, 236, 1) ~= 1 then
			return 0;
		end
		local nExp = 20000000 * (1 + EYT_AWARD_COEFFICIENT + GetVipCardParam());
		gf_ModifyExp(nExp);
		gf_AddItemEx2({2,1,30499,2}, "Hu�n ch��ng anh h�ng", "T� V� �n O�n ��i", "Ph�n th��ng th�ng tr�n �n O�n ��i (Thi�n Ki�u L�nh)", 0, 1);
		CustomAwardGiveOne(CustomAwardSelectOne("EY_jinbaoxiang_2_IB"));
		Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {2,97,236,1})
	end
	_vc_JoinEytBattle_Win(); --�μӶ�Թ̨ȡʤ����ȡ����
	eyt_ReduceSucc();
	eyt_npc_get_succ_award();
end

function eyt_npc_get_fail_award()
	local nFail = eyt_GetFail()
	if nFail <= 0 then
		Say("Hi�n t�i ch�a th� nh�n th��ng", 0);
		return 0;
	end
	local tSay = {};
	tSay.msg = EYT_NPC..format("%s hi�n t�i � T� V� �n O�n ��i c�n ���c nh�n ph�n th��ng b�n tr�n %d l�n, hi�n t�i mu�n nh�n th��ng ngay kh�ng? (<color=red>M�i l�n ch� ���c nh�n th��ng c�a 1 tr�n<color>)", gf_GetPlayerSexName(), nFail);
	tSay.sel = {
		{"L�p t�c nh�n th��ng", "eyt_npc_get_fail_award_do"},
		{"Thi�n Ki�u L�nh nh�n th��ng", "#eyt_npc_get_fail_award_do(1)"},
		{"tr� l�i", "main_eyt_award"},
		{"K�t th�c ��i tho�i", "nothing"},	
	};
	temp_Talk(tSay);
end

function eyt_npc_get_fail_award_do(bUseIb)
	local nFail = eyt_GetFail()
	if nFail <= 0 then
		Say("Hi�n t�i ch�a th� nh�n th��ng", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 10," ") ~= 1 then
		return 0;
	end
	if bUseIb and GetItemCount(2, 97, 236) < 1 then
		Say(format("Trong h�nh trang v�t ph�m %s s� l��ng kh�ng �� %d", "Thi�n Ki�u L�nh", 1), 0);
		return 0;
	end
	if not bUseIb then --ֱ���콱
		local nExp = 5000000 * (1 + EYT_AWARD_COEFFICIENT + GetVipCardParam());
		gf_ModifyExp(nExp);
		--gf_AddItemEx2({2,1,30499,0}, "Ӣ��ѫ��", "��Թ̨����", "��Թ̨�ܳ�����", 0, 1);
		CustomAwardGiveOne(CustomAwardSelectOne("EY_baoxiang_2"));
	else --�콾���콱
		if DelItem(2, 97, 236, 1) ~= 1 then
			return 0;
		end
		local nExp = 10000000 * (1 + EYT_AWARD_COEFFICIENT + GetVipCardParam());
		gf_ModifyExp(nExp);
		gf_AddItemEx2({2,1,30499,1}, "Hu�n ch��ng anh h�ng", "T� V� �n O�n ��i", "Ph�n th��ng b�i tr�n �n O�n ��i (Thi�n Ki�u L�nh)", 0, 1);
		CustomAwardGiveOne(CustomAwardSelectOne("EY_baoxiang_2_IB"));
		Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {2,97,236,1})
	end
	eyt_ReduceFail();
	eyt_npc_get_fail_award();
end
