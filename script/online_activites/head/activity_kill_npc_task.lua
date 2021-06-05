Include("\\script\\online_activites\\head\\activity_kill_npc_define.lua")
Include("\\script\\online_activites\\activity_head.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")

--�����ɷ���
function g_akct_ShowDialog(id, bTag)
	if bTag then return nil end
	if not id then return	nil end
	local nActivityID = tonumber(id)
	local tAkcd = AKCD_TABLE[nActivityID]
	if not tAkcd then return nil end
 	if gf_CheckEventDateEx(nActivityID) ~= 1 then
		return nil
	end
	akct_DailyReset(nActivityID)
	local tSay = {
		format("nh�n %s nhi�m v� /#akct_GetTask(%d)", tAkcd.szTaskName, nActivityID),	
		format("Nh�n ph�n th��ng nhi�m v�/#akct_GetAward(%d)", nActivityID),	
		format("\n t�i ph�i gi�i quy�t nh�ng vi�c kh�c /#main(%d)", 1),
		"T�i h� ch� xem qua th�i/nothing",
	}
	Say(format("<color=green>%s:<color> %s xin h�i c� vi�c g�?",GetNpcName(GetTargetNpc()), gf_GetPlayerSexName()), getn(tSay), tSay)
	return 1
end

--ÿһ������
function g_akct_GetTaskStep(bTag)
	if bTag then return nil end
	local targetNpc = GetNpcName(GetTargetNpc())
	local nActivityID = GetTask(TASKID_ACTIVITY_KILLNPC_ID)
	if 0 == nActivityID then return	end
	if gf_CheckEventDateEx(nActivityID) ~= 1 then	return nil end
	akct_DailyReset(nActivityID)
	local tAkcd = AKCD_TABLE[nActivityID]
	if not tAkcd then return end
	local tg = akct_GetTaskGroup(nActivityID)
	if not tg then return end
	local nTaskStatus = tg:GetTask(tAkcd.nTaskStatus)
	local tTaskStep = tAkcd.tTaskStep[nTaskStatus]
	if not tTaskStep then return end
	if tTaskStep.szTargetNpcName ~= targetNpc then
		Talk(1, "", format("� ��y c� r�t nhi�u th�ng tin, nhanh �i �i <color=green>%s<color> t�m <color=gold>%s<color>T�m hi�u t�nh h�nh �i !", 
			tTaskStep.szNpcPosName, tTaskStep.szTargetNpcName))
		TaskTip(format("� ��y c� r�t nhi�u th�ng tin, nhanh �i �i %s t�m %s T�m hi�u t�nh h�nh �i !", tTaskStep.szNpcPosName, tTaskStep.szTargetNpcName))
		return 1
	end
	local nRebornIdx = akct_GetRebornIndex()
	if not tTaskStep.KillNpc or getn(tTaskStep.KillNpc) ~= 3 then return end
	local tKillNpc = tTaskStep.KillNpc[nRebornIdx]
	local IsShow = 1
	local IsComplete = 1
	for i = 1, getn(tKillNpc) do
		if not tTaskStep.tTaskIndex[i] then
			print("UDERROR: tTaskStep.tTaskIndex[i] is nil")
			return
		end
		if tg:GetTask(tTaskStep.tTaskIndex[i]) ~= 0 then
			IsShow = nil
		end
		if tg:GetTask(tTaskStep.tTaskIndex[i]) < tKillNpc[i][1] then
			IsComplete = nil
		end
	end
	if tTaskStep.DropItem and getn(tTaskStep.DropItem) == 3 then
		local tDropItem = tTaskStep.DropItem[nRebornIdx]
		for k, v in tDropItem do
			if v and getn(v) == 4 and getn(v[3]) == 3 then
				if GetItemCount(v[3][1], v[3][2], v[3][3]) < v[1] then
					IsComplete = nil
				end
			end
		end
	end
	if IsComplete then
		if tTaskStep.DropItem and getn(tTaskStep.DropItem) == 3 then
			local tDropItem = tTaskStep.DropItem[nRebornIdx]
			for k, v in tDropItem do
				if v and getn(v) == 4 and getn(v[3]) == 3 then
					DelItem(v[3][1], v[3][2], v[3][3], v[1])
				end
			end
		end
		if tTaskStep.tAward and tTaskStep.tAward.bIsOpen == 1 then
			if gf_Judge_Room_Weight(tTaskStep.tAward.nFreeRoom[1], tTaskStep.tAward.nFreeRoom[2], " ") ~= 1 then
				return
			end
			dostring(tTaskStep.tAward.sAwardFunc)
		end
		tg:SetTask(tAkcd.nTaskStatus, tg:GetTask(tAkcd.nTaskStatus) + 1);
		--
		local nextStep = tAkcd.tTaskStep[tg:GetTask(tAkcd.nTaskStatus)]
		if not nextStep then
			Talk(1, "", tTaskStep.szTargetNpcTitle.."\n"..format("<color=green>Nhi�m v� �� k�t th�c<color>, h�y v� t�m<color=gold>%s<color> ��i ph�n th��ng!", tAkcd.szStartName))
			Msg2Player(format("  nhi�m v� �� k�t th�c #mau ch�ng �i  t�m %s ��i ph�n th��ng th�i !", tAkcd.szStartName))
			return 1
		else
			Talk(1, "", tTaskStep.szTargetNpcTitle.."\n"..format("nhi�m v� �� ho�n th�nh, mau �i <color=green>%s<color> t�m <color=gold>%s<color> T�m hi�u t�nh h�nh �i !", 
				nextStep.szNpcPosName, nextStep.szTargetNpcName))
			TaskTip(format("nhi�m v� �� ho�n th�nh, mau �i %s t�m %sT�m hi�u t�nh h�nh �i !", nextStep.szNpcPosName, nextStep.szTargetNpcName))
			return 1
		end
	end
	local msg = tTaskStep.szTargetNpcTitle
	for i = 1, getn(tKillNpc) do
		local str = format("ti�u di�t %d  %s(%s)", tKillNpc[i][1], tKillNpc[i][2], tKillNpc[i][3])
		local str1 = format("ti�u di�t %d/%d %s(%s)", tg:GetTask(tTaskStep.tTaskIndex[i]), 
			tKillNpc[i][1], tKillNpc[i][2], tKillNpc[i][3])
		if IsShow then
			TaskTip(str)
			Msg2Player(str)
		end
		msg = msg.."\n\t<color=red>"..str1.."<color>"
	end
	if tTaskStep.DropItem and getn(tTaskStep.DropItem) == 3 then
		local tDropItem = tTaskStep.DropItem[nRebornIdx]
		for k, v in tDropItem do
			if v and getn(v) == 4 and getn(v[3]) == 3 then
				local str = format("thu th�p %s  %d c�i %s", k, v[1], v[2])
				local str1 = format("thu th�p %s  %d/%d c�i%s", k, GetItemCount(v[3][1], v[3][2], v[3][3]), v[1], v[2])
				if IsShow then
					TaskTip(str)
					Msg2Player(str)
				end
				msg = msg.."\n\t<color=red>"..str1.."<color>"
			end
		end
	end
	local tSay = {
		format("\n t�i ph�i gi�i quy�t nh�ng vi�c kh�c /#main(%d)", 1),
		"T�i h� ch� xem qua th�i/nothing",
	}
	Say(msg, getn(tSay), tSay)
	return 1
end

function g_akct_KillTrigger(szName)
	local nActivityID = GetTask(TASKID_ACTIVITY_KILLNPC_ID)
	if 0 == nActivityID then return	end
	if gf_CheckEventDateEx(nActivityID) ~= 1 then	return nil end
	akct_DailyReset(nActivityID)
	local nMapID, nX, nY = GetWorldPos()
	gf_TeamOperateEX(function ()
		if %nMapID ~= GetWorldPos() then
			return
		end	
		local tAkcd = AKCD_TABLE[%nActivityID]
		if not tAkcd then return end
		local tg = akct_GetTaskGroup(%nActivityID)
		if not tg then return end
		local nTaskStatus = tg:GetTask(tAkcd.nTaskStatus)
		local tTaskStep = tAkcd.tTaskStep[nTaskStatus]
		if not tTaskStep then return end
		local nRebornIdx = akct_GetRebornIndex()
		if not tTaskStep.KillNpc or getn(tTaskStep.KillNpc) ~= 3 then return end
		local tKillNpc = tTaskStep.KillNpc[nRebornIdx]
		local bIsShow = nil
		local npcName = nil
		for i = 1, getn(tKillNpc) do
			if not tTaskStep.tTaskIndex[i] then
				print("UDERROR: not tTaskStep.tTaskIndex[i]")
				return
			end
			local nCount = tg:GetTask(tTaskStep.tTaskIndex[i])
			if strfind(%szName, tKillNpc[i][2]) ~= nil then
				npcName = tKillNpc[i][2]
				if nCount < tKillNpc[i][1] then
					tg:SetTask(tTaskStep.tTaskIndex[i], nCount + 1);
					if nCount + 1 == tKillNpc[i][1] then
						Msg2Player(format("ti�u di�t%s %d/%d", npcName, nCount + 1, tKillNpc[i][1]).."(Ho�n th�nh)")
						bIsShow = 1
					else
						Msg2Player(format("ti�u di�t%s %d/%d", npcName, nCount + 1, tKillNpc[i][1]))
					end
				end
			end
		end
		if npcName and tTaskStep.DropItem and getn(tTaskStep.DropItem) == 3 then
			local tDropItem = tTaskStep.DropItem[nRebornIdx]
			if tDropItem[npcName] and getn(tDropItem[npcName]) == 4 and getn(tDropItem[npcName][3]) == 3 then
				local nItemCount = GetItemCount(tDropItem[npcName][3][1], tDropItem[npcName][3][2], tDropItem[npcName][3][3])
				if nItemCount < tDropItem[npcName][1] and gf_Judge_Room_Weight(1,1, " ") == 1 then
					if random(100) <= tDropItem[npcName][4] then
						AddItem(tDropItem[npcName][3][1], tDropItem[npcName][3][2], tDropItem[npcName][3][3], 1)
						if tDropItem[npcName][1] == nItemCount + 1 then
							Msg2Player(format("v�t ph�m %s thu th�p th�nh c�ng ", tDropItem[npcName][2]))
							bIsShow = 1
						end
					end
				end
			end
		end
		local bIsAllComplete = 1
		for i = 1, getn(tKillNpc) do
			local nCount = tg:GetTask(tTaskStep.tTaskIndex[i])
			if nCount < tKillNpc[i][1] then
				bIsAllComplete = nil
				break
			end
		end
		if bIsAllComplete and tTaskStep.DropItem and getn(tTaskStep.DropItem) == 3 then
			local tDropItem = tTaskStep.DropItem[nRebornIdx]
			for k, v in tDropItem do
				if v and getn(v) == 4 and getn(v[3]) == 3 and GetItemCount(v[3][1], v[3][2], v[3][3]) < v[1] then
					bIsAllComplete = nil 
					break
				end
			end
		end
		if bIsAllComplete and bIsShow then
			Say(format("Ng��i �� ti�u di�t t�t c� qu�i, h�y v� <color=green>%s<color> t�m <color=gold>%s<color> ho�n th�nh nhi�m v�!", tTaskStep.szNpcPosName, tTaskStep.szTargetNpcName), 0)
			Msg2Player(format("Ng��i �� ti�u di�t t�t c� qu�i, h�y v� %s t�m %s ho�n th�nh nhi�m v�!", tTaskStep.szNpcPosName, tTaskStep.szTargetNpcName))
		end
	end)
end

function akct_GetTaskGroup(id)
	if not id or type(id) ~= "number" then return nil end
	local tAkcd = AKCD_TABLE[id]
	if not tAkcd then return nil end
	local ret = TaskManager:Create(tAkcd.tTaskGroup[1], tAkcd.tTaskGroup[2]);
	if not ret then return nil end
	return ret
end

function akct_DailyReset(id)
	local tg = akct_GetTaskGroup(id)
	if not tg then return nil end
	if tg:GetTask(1) ~= zgc_pub_day_turn() then
		tg:SetTask(1, zgc_pub_day_turn())
		for i = 2, 10 do
			tg:SetTask(i, 0)
		end
		SetTask(TASKID_ACTIVITY_KILLNPC_ID, 0, TASK_ACCESS_CODE_ACTIVITY_KILLTASK)
	end
end

--return 1, 2, 3
function akct_GetRebornIndex()
	local nLevel = gf_GetPlayerRebornCount()
	local nKind = 1
	if nLevel <= 0 then
		return nKind
	end
	if nLevel > 0 and nLevel <= 5 then
		nKind = 2
	end
	if nLevel > 5 then
		nKind = 3
	end
	return nKind
end

function akct_GetTask(id)
	local tAkcd = AKCD_TABLE[tonumber(id)]
	if not tAkcd then return end
	local tg = akct_GetTaskGroup(tonumber(id))
	if not tg then return end
	local nTaskStatus = tg:GetTask(tAkcd.nTaskStatus)
	if nTaskStatus >= 1 and nTaskStatus <= getn(tAkcd.tTaskStep) then
		Talk(1,"",format("nhi�m v� �ang th�c hi�n, mau �i <color=green>%s<color> t�m <color=gold>%s<color> hi�u t�nh h�nh �i !", 
			tAkcd.tTaskStep[nTaskStatus].szNpcPosName, tAkcd.tTaskStep[nTaskStatus].szTargetNpcName))
		return
	elseif nTaskStatus > getn(tAkcd.tTaskStep) then
		Talk(1,"","h�m nay b�n �� ho�n th�nh nhi�m v�, ng�y mai l�i ��n nh� !")
		return
	end
	if GetTask(TASKID_ACTIVITY_KILLNPC_ID) ~= 0 then
		Talk(1,"","B�n h�y ho�n th�nh nhi�m v� �ang l�m tr��c �i")
		return
	end
	tg:SetTask(tAkcd.nTaskStatus, 1);
	SetTask(TASKID_ACTIVITY_KILLNPC_ID, tonumber(id), TASK_ACCESS_CODE_ACTIVITY_KILLTASK)
	local szMsg = ""
	if tAkcd.szSayWhat then
		szMsg = tAkcd.szSayWhat.."\n"
	end
	Talk(1, "", szMsg..format("nh�n nhi�m v�, mau ch�ng �i  <color=green>%s<color> t�m <color=gold>%s<color> hi�u t�nh h�nh �i !", 
		tAkcd.tTaskStep[1].szNpcPosName, tAkcd.tTaskStep[1].szTargetNpcName))
	TaskTip(format("nh�n nhi�m v�, mau ch�ng %s t�m %sT�m hi�u t�nh h�nh �i !", tAkcd.tTaskStep[1].szNpcPosName, tAkcd.tTaskStep[1].szTargetNpcName))
end

function akct_GetAward(id)
	local tAkcd = AKCD_TABLE[tonumber(id)]
	if not tAkcd then return end
	local tg = akct_GetTaskGroup(tonumber(id))
	if not tg then return end
	local nTaskStatus = tg:GetTask(tAkcd.nTaskStatus)
	local tAward = tAkcd.tAward
	if not tAward then return end
	local tSay = {}
	for i = 1, getn(tAward.tDialog) do
		tinsert(tSay, format("%s/#akct_GetAward_Deal(%d, %d)", tAward.tDialog[i], tonumber(id), i))
	end
	if tAward.tSpecial and tAward.tSpecial.bIsOpen == 1 then
		tinsert(tSay, format("%s/#akct_GetAward_Deal_Special(%d)", tAward.tSpecial.sTitle, tonumber(id)))
	end
	tinsert(tSay, "\n T�i h� ch� xem qua th�i/nothing")
	Say(format("<color=green>%s:<color> %s mu�n nh�n ph�n th��ng n�o ?",GetNpcName(GetTargetNpc()), gf_GetPlayerSexName()), getn(tSay), tSay)
	return 1
end

function akct_GetAward_Deal(id, index)
	local tAkcd = AKCD_TABLE[tonumber(id)]
	if not tAkcd then return end
	local tg = akct_GetTaskGroup(tonumber(id))
	if not tg then return end
	local nTaskStatus = tg:GetTask(tAkcd.nTaskStatus)
	if nTaskStatus <= getn(tAkcd.tTaskStep) then
		Talk(1,"",format("b�n ch�a ho�n th�nh xong %s nhi�m v� , kh�ng th� nh�n th��ng ", tAkcd.szTaskName))
		return
	end
	local tAward = tAkcd.tAward
	if not tAward then return end
	if tg:GetTask(tAward.nAwardTag) ~= 0 then
		Talk(1,"","b�n �� nh�n th��ng r�i, ng�y mai quay l�i nh� ")
		return
	end
	if gf_Judge_Room_Weight(tAward.tFreeRoom[index] , tAward.tFreeRoom[index], " ") ~= 1 then
		return
	end
	for k, v in tAward.tCost[index] do
		if getn(v) == 1 then
			if GetCash() < v[1] then
				Talk(1,"",format("Ng�n l��ng kh�ng �� %d v�ng", ceil(v[1] / 10000)))
				return
			end
		end
		if getn(v) == 5 then
			if GetItemCount(v[1], v[2], v[3]) < v[4] then
				Talk(1,"",format("v�t ph�m trong t�i  %s s� l��ng kh�ng �� %d c�i", v[5], v[4]))
				return
			end
		end
	end
	local bIsSuc = 1
	for k, v in tAward.tCost[index] do
		if getn(v) == 1 then
			if Pay(v[1]) ~= 1 then
				bIsSuc = nil
				break
			end
		end
		if getn(v) == 5 then
			if DelItem(v[1], v[2], v[3], v[4]) ~= 1 then
				bIsSuc = nil
				break
			end
		end
	end
	if bIsSuc then
		dostring(tAward.tAwardFunc[index])
		tg:SetTask(tAward.nAwardTag, 1)
	end
end

function akct_GetAward_Deal_Special(id)
	local tAkcd = AKCD_TABLE[tonumber(id)]
	if not tAkcd then return end
	local tg = akct_GetTaskGroup(tonumber(id))
	if not tg then return end
	local nTaskStatus = tg:GetTask(tAkcd.nTaskStatus)
	local tAward = tAkcd.tAward
	if not tAward then return end	
	local nAwardStatus = tg:GetTask(tAward.nAwardTag)
	if nAwardStatus == 2 then
		Talk(1,"","m�t ng�y ch� c� th� nh�n m�t l�n th��ng kh�ng th� nh�n c�ng ph�n th��ng ")
		return
	end
	if nAwardStatus ~= 1 then
		Talk(1,"","ch�a nh�n b�t c� ph�n th��ng n�o ph�a tr�n kh�ng th� nh�n ph�n th��ng ��c bi�t")
		return
	end
	if tAward.tSpecial.nRebornLimitUp and gf_GetPlayerRebornCount() < tAward.tSpecial.nRebornLimitUp then
		Talk(1,"",format(" ch� c� nh�n v�t chuy�n sinh %d tr� l�n m�i c� th� s� d�ng ph�n th��ng n�y ", tAward.tSpecial.nRebornLimitUp))
		return
	end
	if gf_Judge_Room_Weight(tAward.tSpecial.nFreeRoom[1],tAward.tSpecial.nFreeRoom[2]," ") ~= 1 then
		return
	end
	local tCost = tAward.tSpecial.tCost
	for k, v in tCost do
		if getn(v) == 1 then
			if GetCash() < v[1] then
				Talk(1,"",format("Ng�n l��ng kh�ng �� %d v�ng", ceil(v[1] / 10000)))
				return
			end
		end
		if getn(v) == 5 then
			if GetItemCount(v[1], v[2], v[3]) < v[4] then
				Talk(1,"",format("v�t ph�m trong t�i  %s s� l��ng kh�ng �� %d c�i", v[5], v[4]))
				return
			end
		end
	end
	local bIsSuc = 1
	for k, v in tCost do
		if getn(v) == 1 then
			if Pay(v[1]) ~= 1 then
				bIsSuc = nil
				break
			end
		end
		if getn(v) == 5 then
			if DelItem(v[1], v[2], v[3], v[4]) ~= 1 then
				bIsSuc = nil
				break
			end
		end
	end
	if bIsSuc then
		dostring(tAward.tSpecial.sAwardFunc)
		tg:SetTask(tAward.nAwardTag, 2)
	end
end

--�Զ��影������--------------------------------------------
function fakct_Award201404_TaskStep_1()
	ahf_GetAFruits(10)
end

function fakct_Award201404_TaskStep_2()
	ahf_GetAFruits(12)
	gf_AddItemEx({2,1,30132,100}, "V� L�m B�o H�p");
end

function fakct_Award201404_GetAward_1()
	gf_Modify("Exp", 100000000);
	gf_EventGiveCustomAward(3, 19, 1, "ho�t ��ng ph� th�ng 4 ");
	gf_EventGiveCustomAward(4, 19, 1, "ho�t ��ng ph� th�ng 4 ");
	ahf_GetPetBook(1)
	gf_WriteLogEx("Hoat dong phu 1 thang 4 nam 2014", "��i ph�n th��ng cu�i c�ng", 1, "Ph�n th��ng d�ng 1");	
end

function fakct_Award201404_GetAward_2()
	gf_Modify("Exp", 555555555);
	gf_EventGiveCustomAward(3, 55, 1, "ho�t ��ng ph� th�ng 4 ");
	gf_EventGiveCustomAward(4, 55, 1, "ho�t ��ng ph� th�ng 4 ");
	AwardGenuineQi(55);
	ahf_GetPetBook(2)
	ahf_GetPetBook(2)
	gf_WriteLogEx("Hoat dong phu 1 thang 4 nam 2014", "��i ph�n th��ng cu�i c�ng", 1, "Ph�n th��ng d�ng 2");	
end

function fakct_Award201404_GetAward_3()
	gf_Modify("Exp", 1789789789);
	gf_EventGiveCustomAward(3, 500, 1, "ho�t ��ng ph� th�ng 4 ");
	gf_EventGiveCustomAward(4, 200, 1, "ho�t ��ng ph� th�ng 4 ");
	gf_AddItemEx2({2,1,30497,100,4}, "Ma Tinh", "ho�t ��ng ph� th�ng 4 1", "", 0, 1);
--	AwardGenuineQi(55);
	gf_AddItemEx2({2,1,9977,1}, "Qu�n C�ng Huy Ho�ng", "ho�t ��ng ph� th�ng 4 1", "", 15*24*3600, 1);
	ahf_GetPetBook(3);
	ahf_GetPetBook(4);
	AddItem(2,1, 30637, 2000)
	AddItem(2,1, 30638, 2000)
	gf_WriteLogEx("Hoat dong phu 1 thang 4 nam 2014", "��i ph�n th��ng cu�i c�ng", 1, "Ph�n th��ng d�ng 3");	
end

function fakct_Award201404_GetSpecialAward()
	gf_Modify("Exp", 1789789789);
	gf_AddItemEx2({2,1,30499,9}, "Hu�n ch��ng anh h�ng", "ho�t ��ng ph� th�ng 4 1", "", 0, 1);
	gf_WriteLogEx("Hoat dong phu 1 thang 4 nam 2014", "��i ph�n th��ng cu�i c�ng", 1, "Ph�n th��ng cu�i");	
end



function fakct_Award201405_GetAward_1()
	local tExp = {
		{1, 40, 50000000},
		{1, 25, 80000000},
		{1, 25, 100000000},
		{1, 10, 200000000},
	}
	local index = gf_GetRandItemByTable(tExp, gf_SumRandBase(tExp), getn(tExp))
	gf_Modify("Exp", tExp[index][3]);
	gf_EventGiveCustomAward(3, 9, 1, "Event ph� th�ng 5");
	gf_EventGiveCustomAward(4, 9, 1, "Event ph� th�ng 5");
	AwardGenuineQi(19);
	--pet value by vet
	Vet_Update_Pet_DanhQuai(20)
	--
end

function fakct_Award201405_GetAward_2()
	gf_Modify("Exp", 299000000);
	gf_EventGiveCustomAward(3, 39, 1, "Event ph� th�ng 5");
	gf_EventGiveCustomAward(4, 39, 1, "Event ph� th�ng 5");
	AwardGenuineQi(39);
	--pet value by vet
	Vet_Update_Pet_DanhQuai(5)
	--
end
function Vet_Update_Pet_DanhQuai(nPoint)
	if not nPoint or nPoint <= 0 then
		return 0;
	end
	--Interface, complete by vet!
	--do something
	if nPoint == 20 then
		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (20 * 100)) --�i�m n�ng c�p
		WriteLogEx(EVENT_LOG_TITLE, "nh�n th��ng s� d�ng v�t ph�m event ", 1, "20 �i�m n�ng c�p")
		Msg2Player("B�n nh�n ���c 20 �i�m N�ng C�p B�n ��ng H�nh")
	end
	if nPoint == 5 then
		Pet_AddGP(5)
		WriteLogEx(EVENT_LOG_TITLE, "nh�n th��ng s� d�ng v�t ph�m event ", 1, "5 �i�m linh l�c")
		Msg2Player("B�n nh�n ���c 5 �i�m Linh L�c B�n ��ng H�nh")
	end
end
function Pet_AddGP(nPoint)
	if IsPlayerDeath() == 1 then
		return
	end
	tRequireElement =
	{
				[1] = {0},
				[2] = {200},
				[3] = {600},
				[4] = {30000},
	}
	local nCurGodPoint = floor(GetTask(TASK_VNG_PET_GODPOINT)/100)
	local nQuestGPCount = mod(GetTask(TASK_VNG_PET_GODPOINT),100)
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurGodPoint + nPoint <= tRequireElement[nCurLevel][1] then
		nCurGodPoint = nCurGodPoint +nPoint
		SetTask(TASK_VNG_PET_GODPOINT,nCurGodPoint*100 + nQuestGPCount)
	else
		nCurGodPoint = tRequireElement[nCurLevel][1]
		SetTask(TASK_VNG_PET_GODPOINT,nCurGodPoint*100 + nQuestGPCount)
		Msg2Player("B�n ��ng H�nh �� ��t ���c �i�m Linh L�c t�i �a c�a c�p, kh�ng th� t�ng th�m.")
	end
end

function fakct_Award201406_GetAward_1()
	gf_Modify("Exp", 100000000);
	gf_EventGiveCustomAward(3, 19, 1, "Ho�t ��ng ph� th�ng 6");gf_EventGiveCustomAward(4, 19, 1, "Ho�t ��ng ph� th�ng 6");
	gf_AddItemEx2({2, 1, 30368, 10}, "C� Linh Ng�c", "Ho�t ��ng ph� th�ng 6", "Ho�t ��ng ph� th�ng 6", 0, 1)
	gf_WriteLogEx("GIAI CUU DAI SOAI Thang 6/2014", "��i ph�n th��ng ph� th�ng", 1, "Ph�n th��ng ph� th�ng");
end

function fakct_Award201406_GetAward_2()
	gf_Modify("Exp", 299000000);
	gf_EventGiveCustomAward(3, 39, 1, "Ho�t ��ng ph� th�ng 6");
	gf_EventGiveCustomAward(4, 39, 1, "Ho�t ��ng ph� th�ng 6");
	AwardGenuineQi(39);
	local tAward = {
		{1, 25, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
		{1, 10, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
		{1, 5, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
		{31, 15, "ahf_GetGaojiZhenjuan(1, 4, 1)", 1},
		{1, 15, "Minh Nguy�t D�", {1, 1, 17, 10}, 0},
		{1, 15, "B�nh B�t v�ng", {1, 1, 15, 10}, 0},
		{1, 15, "T�y B�c V�ng", {1, 1, 19, 10}, 0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Ho�t ��ng ph� th�ng 6", "Ho�t ��ng ph� th�ng 6")
	gf_WriteLogEx("GIAI CUU DAI SOAI Thang 6/2014", "��i ph�n th��ng �u ��i", 1, "Ph�n th��ng �u ��i");
end

function fakct_Award201411_GetAward_1()
	gf_Modify("Exp", 100000000);
	AwardGenuineQi(100);
	gf_WriteLogEx("Hoat dong phu thang 11//2014", "��i ph�n th��ng �u ��i", 1, "Ph�n th��ng �u ��i 1");
end

function fakct_Award201411_GetAward_2()
	gf_Modify("Exp", 399399399);
	AwardGenuineQi(150);
	local tAward = {
		{1, 4, "Hu�n ch��ng anh h�ng", {2, 1, 30499, 1}, 0},
		{1, 10, "Thi�n Ki�u L�nh", {2, 97, 236, 1, 4}, 0},
		{31, 10, "gf_VnGiveActivityPetGrowAward(50)", 1},
		{31, 10, "gf_VnGiveActivityPetMpAward(10)", 1},
		{1, 25, "Nghi�n M�c", {2, 1, 30742, 2000}, 0},
		{1, 10, "Minh Nguy�t D�", {1, 1, 17, 10}, 0},
		{1, 10, "B�nh B�t v�ng", {1, 1, 15, 10}, 0},
		{1, 10, "T�y B�c V�ng", {1, 1, 19, 10}, 0},
		{1, 10, "C�u chuy�n h�i h�n ��n", {1, 0, 32, 10}, 0},
		{1, 1, "Thi�n Th�ch Tinh Th�ch", {2, 1, 1009, 1, 4}, 7 * 24 * 3600},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Ho�t ��ng ph� 11/2014", "Ho�t ��ng ph� 11/2014")
	gf_WriteLogEx("Hoat dong phu thang 11//2014", "��i ph�n th��ng �u ��i", 1, "Ph�n th��ng �u ��i 2");
end