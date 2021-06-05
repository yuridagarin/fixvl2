--���з�����
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")
Include("\\script\\online\\zgc_public_fun.lua")

WXFLS_ID = 122

WXLS_TASKGROUP = TaskManager:Create(4, 11)
WXLS_TASKGROUP.DaySeq = 1
WXLS_TASKGROUP.TimesCap = 2
WXLS_TASKGROUP.Times = 3
WXLS_TASKGROUP.Final = 4

function wxfls_AddItemPlayerlogin()
	if gf_CheckEventDateEx(WXFLS_ID) ~= 1 then
		return
	end
	if GetItemCount(2,1,30643) < 1 and GetFreeItemRoom() > 0 then
		AddItem(2,1,30643,1)
	end
end

function OnUse(nItem)
	do 
	Talk(1, "", "Hi�n t�i ch�a c� nguy�n li�u")
	return 
	end
	if gf_CheckEventDateEx(WXFLS_ID) ~= 1 then
		Talk(1,"","b�y gi� kh�ng ph�i l� th�i gian ho�t ��ng ")
		return
	end
	local nLevel = GetLevel()
	if nLevel < 79 then
		Talk(1, "", "��i hi�p kh�ng �� level 79 !!!!")
		return
	end
--	if gf_CheckBaseCondition(79) ~= 1 then
--		return 
--	end
	
	local oldPlayerIndex = PlayerIndex
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if WXLS_TASKGROUP:GetTask(WXLS_TASKGROUP.DaySeq) ~= zgc_pub_day_turn() then
			WXLS_TASKGROUP:SetTask(WXLS_TASKGROUP.DaySeq, zgc_pub_day_turn())
			WXLS_TASKGROUP:SetTask(WXLS_TASKGROUP.TimesCap, 0)
			WXLS_TASKGROUP:SetTask(WXLS_TASKGROUP.Times, 0)
			WXLS_TASKGROUP:SetTask(WXLS_TASKGROUP.Final, 0)
		end
	end
	PlayerIndex = oldPlayerIndex
	local tSay = {
		"xem xem y�u c�u ng� h�nh ng�y h�m nay /look_for_wuxing",
		"k�ch ho�t ph�n th��ng /activating_award",
		"nh�n ph�n th��ng m�t �i�n ng� h�nh ph�c h� /get_final_award",
		"T�i h� ch� xem qua th�i/nothing",
	}
	Say("thu�t ng� h�nh ph�c h� !", getn(tSay), tSay)
end

function look_for_wuxing()
	local tCurrWuXing = get_curr_wuxing()
	if not tCurrWuXing then return end
	local tHanzi = {
		[1] = " Kim ",
		[2] = "M�c",
		[3] = "Th�y",
		[4] = "H�a",
		[5] = "Th�",
	}
	local msg = format("y�u c�u ng� h�nh h�m nay l�  <color=gold>%s,%s,%s,%s,%s<color>\n",
		tHanzi[tCurrWuXing[1]], tHanzi[tCurrWuXing[2]], tHanzi[tCurrWuXing[3]], tHanzi[tCurrWuXing[4]], tHanzi[tCurrWuXing[5]])
	msg = msg.."  ng� h�nh kim: thi�u l�m \n  ng� h�nh m�c : ���ng m�n, ng� ��c  \n  ng� h�nh th�y : nga mi, th�y y�n  \n  ng� h�nh h�a : c�i bang, d��ng m�n  \n  ng� h�nh th� : v� �ang, c�n l�n "
	Say(msg, 0)
end

function activating_award()
	local tSay = {
		"ph�n th��ng mi�n ph� /activating_award_1",
		"ph�n th��ng cao c�p /activating_award_2",
		"ph�n th��ng VIP/activating_award_3",
		"T�i h� ch� xem qua th�i/nothing",	
	}
	Say(format("%s c�n nh�n ph�n th��ng n�o ? ", gf_GetPlayerSexName()), getn(tSay), tSay)
end

function activating_award_1()
	if GetCaptainName() ~= GetName() then
		Talk(1,"","b�n kh�ng ph�i l� ��i tr��ng, kh�ng th� th�c hi�n thao t�c n�y ")
		return 
	end
	if check_wuxing() ~= 1 then
		Talk(1,"","��i vi�n m�n ph�i kh�ng �� y�u c�u ng� h�nh h�m nay, kh�ng th� nh�n th��ng")
		return
	end
	if check_route_diff() ~= 1 then
		Talk(1,"","T�t c� c�c th�nh vi�n ��u ph�i kh�c h� ph�i ")
		return
	end
	if WXLS_TASKGROUP:GetTask(WXLS_TASKGROUP.TimesCap) >= 5 then
		Talk(1,"",format("��i tr��ng m�i ng�y ch� c� th� k�ch ho�t  %d l�n th��ng ", 5))
		return
	end
	local oldPlayerIndex = PlayerIndex
	local nCheck = 1
	msg = format("c�c th�nh vi�n trong ��i k�ch ho�t s� l�n th��ng v��t qu� %d l�n th��ng \n<color=red>",5)
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetCaptainName() ~= GetName() and
			WXLS_TASKGROUP:GetTask(WXLS_TASKGROUP.Times) >= 5 then
			Say(format("��i tr��ng m�i ng�y ch� k�ch ho�t  %d l�n th��ng ", 5), 0)
			msg = msg..GetName().."\n"
			nCheck = nil 
		end	
	end
	if not nCheck then
		msg = msg.."<color>"
		Say(msg, 0)
		return
	end
	PlayerIndex = oldPlayerIndex
	msg = format("c�c th�nh vi�n t�ch l�y th�i gian online kh�ng �� %d h :\n<color=red>", 2)
	for i = 1, GetTeamSize() do 
		PlayerIndex = GetTeamMember(i)
		if gf_GetAccTime() < 2 * 60 then
			msg = msg..GetName().."\n"
			nCheck = nil
			Say(format("t�ch l�y th�i gian online kh�ng �� %d h, kh�ng ���c nh�n th��ng ", 2), 0)
		end
	end
	PlayerIndex = oldPlayerIndex
	if not nCheck then
		msg = msg.."<color>"
		Say(msg, 0)
		return
	end
	PlayerIndex = oldPlayerIndex
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		gf_SetAccTime(gf_GetAccTime() - 2 * 60)
	end
	PlayerIndex = oldPlayerIndex
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		gf_Modify("Exp", cal_total_level() * 304)
		if GetCaptainName() ~= GetName() then
			WXLS_TASKGROUP:SetTask(WXLS_TASKGROUP.Times, WXLS_TASKGROUP:GetTask(WXLS_TASKGROUP.Times) + 1)
		else
			WXLS_TASKGROUP:SetTask(WXLS_TASKGROUP.TimesCap, WXLS_TASKGROUP:GetTask(WXLS_TASKGROUP.TimesCap) + 1)
		end
	end
	PlayerIndex = oldPlayerIndex
end

function activating_award_2()
	if GetCaptainName() ~= GetName() then
		Talk(1,"","b�n kh�ng ph�i l� ��i tr��ng, kh�ng th� th�c hi�n thao t�c n�y ")
		return 
	end
	if check_wuxing() ~= 1 then
		Talk(1,"","��i vi�n m�n ph�i kh�ng �� y�u c�u ng� h�nh h�m nay, kh�ng th� nh�n th��ng")
		return
	end
	if check_route_diff() ~= 1 then
		Talk(1,"","T�t c� c�c th�nh vi�n ��u ph�i kh�c h� ph�i ")
		return
	end
	if WXLS_TASKGROUP:GetTask(WXLS_TASKGROUP.TimesCap) >= 5 then
		Talk(1,"",format("��i tr��ng m�i ng�y ch� c� th� k�ch ho�t  %d l�n th��ng ", 5))
		return
	end
	local oldPlayerIndex = PlayerIndex
	local nCheck = 1
	local msg = "t�i c�a c�c th�nh vi�n d��i ��y kh�ng �� :\n<color=red>"
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
			msg = msg..GetName().."\n"
			nCheck = nil 
		end	
	end
	PlayerIndex = oldPlayerIndex
	if not nCheck then
		msg = msg.."<color>"
		Say(msg, 0)
		return
	end
	PlayerIndex = oldPlayerIndex
	msg = format("c�c th�nh vi�n trong ��i k�ch ho�t s� l�n th��ng v��t qu� %d l�n th��ng \n<color=red>",5)
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetCaptainName() ~= GetName() and
			WXLS_TASKGROUP:GetTask(WXLS_TASKGROUP.Times) >= 5 then
			Say(format("��i tr��ng m�i ng�y ch� k�ch ho�t  %d l�n th��ng ", 5), 0)
			msg = msg..GetName().."\n"
			nCheck = nil 
		end	
	end
	PlayerIndex = oldPlayerIndex
	if not nCheck then
		msg = msg.."<color>"
		Say(msg, 0)
		return
	end
	PlayerIndex = oldPlayerIndex
	msg = "s� v�ng trong t�i c�a c�c th�nh vi�n d��i ��y kh�ng �� :\n<color=red>"
	for i = 1, GetTeamSize() do 
		PlayerIndex = GetTeamMember(i)
		if GetCaptainName() ~= GetName() then
			if GetCash() < 440000 then
				msg = msg..GetName().."\n"
				nCheck = nil
				Say(format("S� v�ng trong t�i kh�ng �� %d v�ng ", 44), 0)
			end
		else
			if GetCash() < 2030000 then
				msg = msg..GetName().."\n"
				nCheck = nil
				Say(format("S� v�ng trong t�i kh�ng �� %d v�ng ", 203), 0)
			end
		end
	end
	PlayerIndex = oldPlayerIndex
	if not nCheck then
		msg = msg.."<color>"
		Say(msg, 0)
		return
	end
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetCaptainName() ~= GetName() then
			if Pay(440000) ~= 1 then
				nCheck = nil
			end
		else
			if Pay(2030000) ~= 1 then
				nCheck = nil
			end
		end
	end
	PlayerIndex = oldPlayerIndex
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetCaptainName() ~= GetName() then
			gf_Modify("Exp", cal_total_level() * 666)
			gf_AddItemEx2({2, 95, 208, 1, 4}, "T� Ngh�a L�nh", "event ph� 2 th�ng 4", "thu�t ng� h�nh ph�c h� ", 0, 1)
			WXLS_TASKGROUP:SetTask(WXLS_TASKGROUP.Times, WXLS_TASKGROUP:GetTask(WXLS_TASKGROUP.Times) + 1)
		else
			gf_Modify("Exp", cal_total_level() * 3333)
			gf_AddItemEx2({2, 95, 208, 1, 4}, "T� Ngh�a L�nh", "event ph� 2 th�ng 4", "thu�t ng� h�nh ph�c h� ", 0, 1)
			WXLS_TASKGROUP:SetTask(WXLS_TASKGROUP.TimesCap, WXLS_TASKGROUP:GetTask(WXLS_TASKGROUP.TimesCap) + 1)
		end
	end
	PlayerIndex = oldPlayerIndex
end

function activating_award_3()
	if GetCaptainName() ~= GetName() then
		Talk(1,"","b�n kh�ng ph�i l� ��i tr��ng, kh�ng th� th�c hi�n thao t�c n�y ")
		return 
	end
	if check_wuxing() ~= 1 then
		Talk(1,"","��i vi�n m�n ph�i kh�ng �� y�u c�u ng� h�nh h�m nay, kh�ng th� nh�n th��ng")
		return
	end
	if check_route_diff() ~= 1 then
		Talk(1,"","T�t c� c�c th�nh vi�n ��u ph�i kh�c h� ph�i ")
		return
	end
	if WXLS_TASKGROUP:GetTask(WXLS_TASKGROUP.TimesCap) >= 5 then
		Talk(1,"",format("��i tr��ng m�i ng�y ch� c� th� k�ch ho�t  %d l�n th��ng ", 5))
		return
	end
	local oldPlayerIndex = PlayerIndex
	local nCheck = 1
	local msg = "t�i c�a c�c th�nh vi�n d��i ��y kh�ng �� :\n<color=red>"
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if gf_Judge_Room_Weight(3, 30, " ") ~= 1 then
			msg = msg..GetName().."\n"
			nCheck = nil 
		end	
	end
	PlayerIndex = oldPlayerIndex
	if not nCheck then
		msg = msg.."<color>"
		Say(msg, 0)
		return
	end
	PlayerIndex = oldPlayerIndex
	msg = format("c�c th�nh vi�n trong ��i k�ch ho�t s� l�n th��ng v��t qu� %d l�n th��ng \n<color=red>",5)
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetCaptainName() ~= GetName() and
			WXLS_TASKGROUP:GetTask(WXLS_TASKGROUP.Times) >= 5 then
			Say(format("��i tr��ng m�i ng�y ch� k�ch ho�t  %d l�n th��ng ", 5), 0)
			msg = msg..GetName().."\n"
			nCheck = nil 
		end	
	end
	PlayerIndex = oldPlayerIndex
	if not nCheck then
		msg = msg.."<color>"
		Say(msg, 0)
		return
	end
	PlayerIndex = oldPlayerIndex
	msg = "s� l��ng ng�c ti�u dao trong t�i c�a c�c th�nh vi�n sau kh�ng �� :\n<color=red>"
	for i = 1, GetTeamSize() do 
		PlayerIndex = GetTeamMember(i)
		if GetCaptainName() ~= GetName() then
			if GetItemCount(2,1,30603) < 29 then
				msg = msg..GetName().."\n"
				nCheck = nil
				Say(format("s� l��ng ng�c ti�u dao trong t�i kh�ng �� %d c�i", 29), 0)
			end
		else
			if GetItemCount(2,1,30603) < 203 then
				msg = msg..GetName().."\n"
				nCheck = nil
				Say(format("s� l��ng ng�c ti�u dao trong t�i kh�ng �� %d c�i", 203), 0)
			end
		end
	end
	PlayerIndex = oldPlayerIndex
	if not nCheck then
		msg = msg.."<color>"
		Say(msg, 0)
		return
	end
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetCaptainName() ~= GetName() then
			if DelItem(2,1,30603, 29) ~= 1 then
				nCheck = nil
			end
		else
			if DelItem(2,1,30603, 203) ~= 1 then
				nCheck = nil
			end
		end
	end
	PlayerIndex = oldPlayerIndex
	if not nCheck then
		return
	end
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetCaptainName() ~= GetName() then
			gf_Modify("Exp", cal_total_level() * 1331)
			gf_AddItemEx2({2, 95, 208, 1, 4}, "T� Ngh�a L�nh", "event ph� 2 th�ng 4", "thu�t ng� h�nh ph�c h� ", 0, 1)
			gf_AddItemEx2({2, 1, 30409, 1, 4}, "Th�ng Thi�n L�nh", "event ph� 2 th�ng 4", "thu�t ng� h�nh ph�c h� ", 0, 1)
			ahf_GetAFruits(10)
			WXLS_TASKGROUP:SetTask(WXLS_TASKGROUP.Times, WXLS_TASKGROUP:GetTask(WXLS_TASKGROUP.Times) + 1)
		else
			gf_Modify("Exp", cal_total_level() * 9999)
			gf_AddItemEx2({2, 95, 208, 1, 4}, "T� Ngh�a L�nh", "event ph� 2 th�ng 4", "thu�t ng� h�nh ph�c h� ", 0, 1)
			gf_AddItemEx2({2, 1, 30409, 1, 4}, "Th�ng Thi�n L�nh", "event ph� 2 th�ng 4", "thu�t ng� h�nh ph�c h� ", 0, 1)
			ahf_GetAFruits(10)
			WXLS_TASKGROUP:SetTask(WXLS_TASKGROUP.TimesCap, WXLS_TASKGROUP:GetTask(WXLS_TASKGROUP.TimesCap) + 1)
		end
	end
	PlayerIndex = oldPlayerIndex
end

function get_final_award()
	if WXLS_TASKGROUP:GetTask(WXLS_TASKGROUP.Final) ~= 0 then
		Talk(1,"","b�n �� nh�n th��ng r�i, ng�y mai l�i ��n nh� !")
		return
	end
	if WXLS_TASKGROUP:GetTask(WXLS_TASKGROUP.Times) < 5 then
		Talk(1,"",format("ch� c� %s k�ch ho�t ph�n th��ng  %d l�n m�i nh�n ���c ph�n th��ng n�y ", "��i vi�n ", 5))
		return
	end
	if WXLS_TASKGROUP:GetTask(WXLS_TASKGROUP.TimesCap) < 5 then
		Talk(1,"",format("ch� c� %s k�ch ho�t ph�n th��ng  %d l�n m�i nh�n ���c ph�n th��ng n�y ", "��i tr��ng", 5))
		return
	end
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
		return
	end
	if GetItemCount(2, 1, 30603) < 1357 then
		Talk(1,"",format("Trong h�nh trang %s s� l��ng kh�ng �� %d", "Ti�u Dao Ng�c", 1357))
		return
	end
	if DelItem(2, 1, 30603, 1357) ~= 1 then
		return
	end
	gf_AddItemEx2({2, 1, 30499, 10}, "Hu�n ch��ng anh h�ng", "event ph� 2 th�ng 4", "nh�n th��ng m�t �i�n ng� h�nh ph�c l�ng ", 0, 1)
	gf_AddItemEx2({2, 1, 30133, 1}, "Ch�a kh�a v�ng", "event ph� 2 th�ng 4", "nh�n th��ng m�t �i�n ng� h�nh ph�c l�ng ", 0, 1)
	WXLS_TASKGROUP:SetTask(WXLS_TASKGROUP.Final, 1)
end

function get_curr_wuxing()
	local tWuXing = {
		{1, 2, 3, 4, 5},	
		{1, 1, 1, 4, 4},
		{1, 1, 1, 5, 5},
		{1, 1, 1, 4, 5},
		{2, 2, 2, 3, 1},
		{2, 2, 2, 3, 5},	
		{2, 2, 5, 5, 3},
		{2, 2, 5, 3, 3},
		{3, 3, 3, 3, 1},
		{3, 3, 3, 3, 5},
		{3, 3, 3, 4, 4},
		{3, 3, 3, 2, 2},
		{4, 4, 4, 4, 1},
		{4, 4, 4, 1, 2},
		{4, 4, 1, 2, 3},
		{4, 4, 2, 2, 5},
		{5, 5, 5, 4, 1},
		{5, 5, 5, 1, 3},
		{5, 5, 5, 3, 2},
		{5, 5, 5, 2, 2},		
	}
	local nTotalDays = floor(GetTime()/(3600*24))
	local nIndex = mod(nTotalDays, getn(tWuXing))
	if nIndex == 0 then
		nIndex = getn(tWuXing)
	end
	if tWuXing[nIndex] then
		return tWuXing[nIndex]
	end
end

function check_wuxing()
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 6 then
		return nil
	end
	local oldPlayerIndex = PlayerIndex
	local tFaction = {}
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		local nFaction = GetPlayerFaction()
		if GetCaptainName() ~= GetName() and (nFaction > 0 and nFaction <= 10) then	--and gf_CheckBaseCondition(79, 1) == 1
			tinsert(tFaction, GetPlayerFaction())
		end
	end
	PlayerIndex = oldPlayerIndex
	if getn(tFaction) ~= 5 then
		return nil
	end
	
	local tCurrWuXing = get_curr_wuxing()
	if not tCurrWuXing or getn(tCurrWuXing) ~= 5 then
		return nil 
	end

	local tFactionToWuxing = {
		[1] = 1,
		[2] = 5,
		[3] = 3,
		[4] = 4,
		[5] = 2,
		[6] = 4,
		[7] = 2,
		[8] = 5,
		[9] = 1,
		[10] = 3,	
	}
	for i = 1, 5 do
		local idx = tFaction[i]
		local wx = tFactionToWuxing[idx]
		for j = 1, 5 do
			if wx == tCurrWuXing[j] then
				tremove(tCurrWuXing, j)
				break
			end
		end
	end
	if getn(tCurrWuXing) == 0 then
		return 1
	end
	return nil 
end

function cal_total_level()
	local totalLevel = 0
	local oldPlayerIndex = PlayerIndex 
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		totalLevel = totalLevel + GetLevel()
		local nReborn = gf_GetPlayerRebornCount()
		for j = 1, nReborn do
			if j <= 5  then
				totalLevel = totalLevel + 100
			else
				totalLevel = totalLevel + 120
			end
		end
	end
	PlayerIndex = oldPlayerIndex
	return totalLevel
end

function check_route_diff()
	local oldPlayerIndex = PlayerIndex
	local tRet = {
		0,0,0,0,0,
		0,0,0,0,0,
		0,0,0,0,0,
		0,0,0,0,0,
		0,0,0,0,0,
		0,0,0,0,0,
	}
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetCaptainName() ~= GetName() then
			local nRoute = GetPlayerRoute()
			if not tRet[nRoute] then
				PlayerIndex = oldPlayerIndex
				return 0
			end
			tRet[nRoute] = tRet[nRoute] + 1
		end
	end
	PlayerIndex = oldPlayerIndex
	for i = 1, getn(tRet) do
		if tRet[i] > 1 then
			return 0
		end
	end
	return 1
end