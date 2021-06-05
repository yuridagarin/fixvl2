
tDropNum = {5,4,3,2,1,1,1,1}

Include("\\script\\gongcheng\\city_manage\\manage_head.lua")
Include("\\script\\gongcheng\\personal_task\\task_head.lua")

function tong_task_killed()
	local npcIndex, npcTemplete, npcName = GetTriggeringUnit()
	local nMulti = 2
	if npcName == "Binh s� H�i Phong tr�i" then
		return
	elseif npcName == "Tinh anh H�i Phong tr�i" then
		nMulti = 1
	elseif npcName == "Th�ng l�nh H�i Phong tr�i" then
		nMulti = 5
	end

	local tItem = {2,0,764}
	local nTeamSize = GetTeamSize()
	if nTeamSize == 0 or nTeamSize == 1 then	-- û��ӻ��߾�һ����
		player_task_clear()
		map_task(npcName)
		local nDLCount, nSJCount, nJHCount, nSJCountView = CustomDataRead("tongcitywar_person_task")
		if nDLCount < 600 then
			local nDrop = tDropNum[1] * nMulti
			local nDiff = nDrop + nDLCount - 600
			if nDiff > 0 then
				nDrop = nDrop - nDiff
			end
			
			if GetFreeItemRoom() > 0 then
				AddItem(tItem[1],tItem[2],tItem[3],nDrop)
				CustomDataSave("tongcitywar_person_task", "dddd", nDLCount+nDrop, nSJCount, nJHCount, nSJCountView)
				if nDiff > 0 then
					Msg2Player("Chi�m th�nh trong tu�n b�n �� thu �u�c 600 ��ch Binh H� Gi�p, kh�ng th� l�y nhi�u h�n n�a.")
				end
			end
		else
			Msg2Player("Chi�m th�nh trong tu�n b�n �� thu �u�c 600 ��ch Binh H� Gi�p, kh�ng th� l�y nhi�u h�n n�a.")
		end
	else
		local nKillMapID = GetWorldPos()
		local nOldPlayer = PlayerIndex
		for i=1, nTeamSize do
			PlayerIndex = GetTeamMember(i)
			if PlayerIndex > 0 then
				player_task_clear()
				map_task(npcName)
				local nMapID = GetWorldPos()
				if IsPlayerDeath() == 0 and nKillMapID == nMapID then
					local nDLCount, nSJCount, nJHCount, nSJCountView = CustomDataRead("tongcitywar_person_task")
					if nDLCount < 600 then
						local nDrop = tDropNum[nTeamSize] * nMulti
						local nDiff = nDrop + nDLCount - 600
						if nDiff > 0 then
							nDrop = nDrop - nDiff
						end
						if GetFreeItemRoom() > 0 then
							AddItem(tItem[1],tItem[2],tItem[3],nDrop)
							CustomDataSave("tongcitywar_person_task", "dddd", nDLCount+nDrop, nSJCount, nJHCount, nSJCountView)
							if nDiff > 0 then
								Msg2Player("Chi�m th�nh trong tu�n b�n �� thu �u�c 600 ��ch Binh H� Gi�p, kh�ng th� l�y nhi�u h�n n�a.")
							end
						end
					else
						Msg2Player("Chi�m th�nh trong tu�n b�n �� thu �u�c 600 ��ch Binh H� Gi�p, kh�ng th� l�y nhi�u h�n n�a.")
					end
				end
			end
		end
	end
end

function map_task(npcName)
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nTask1 == nil then
		return
	end
	local nNow = tonumber(date("%y%j"))
	if nNow > nDate then		-- ��������������
		CustomDataSave("tongcitywar_person_map_task", "ddddddd", 0, 0, 0, 0, 0, 0, nNow)
		return
	end
	
	if npcName == "Th� v� tr�i ng�a" then
		if nTask1 == 1 and _11 == 0 then
			_11 = 1
			if _12 == 0 then
				Msg2Player("B�n �� ti�u di�t Th� v� tr�i ng�a, c�n ph�i ti�u di�t Th� v� kho l��ng m�i c� th� ho�n th�nh nhi�m v� n�y")
			else
				Msg2Player("B�n �� ti�u di�t Th� v� tr�i ng�a")
			end
		end
	elseif npcName == "Th� v� kho l��ng" then
		if nTask1 == 1 and _12 == 0 then
			_12 = 1
			if _11 == 0 then
				Msg2Player("B�n �� ti�u di�t Th� v� kho l��ng, c�n ph�i ti�u di�t Th� v� tr�i ng�a!")
			else
				Msg2Player("B�n �� ti�u di�t Th� v� kho l��ng")
			end
		end
	elseif npcName == "Th� v� Kho�ng tr��ng" then
		if nTask2 == 1 and _21 == 0 then
			_21 = 1
			if _22 == 0 then
				Msg2Player("B�n �� ti�u di�t Th� v� Kho�ng tr��ng, c�n ph�i ti�u di�t Th� v� M�c tr��ng!")
			else
				Msg2Player("B�n �� ti�u di�t Th� v� Kho�ng tr��ng")
			end
		end
	elseif npcName == "Th� v� M�c tr��ng" then
		if nTask2 == 1 and _22 == 0 then
			_22 = 1
			if _21 == 0 then
				Msg2Player("B�n �� ti�u di�t Th� v� M�c tr��ng, c�n ph�i ti�u di�t Th� v� Kho�ng tr��ng!")
			else
				Msg2Player("B�n �� ti�u di�t Th� v� M�c tr��ng")
			end
		end
	else
		return
	end
	
	CustomDataSave("tongcitywar_person_map_task", "ddddddd", nTask1,_11,_12,nTask2,_21,_22,nDate)
	if nTask1 == 1 and _11 == 1 and _12 == 1 and (npcName == "Th� v� tr�i ng�a" or npcName == "Th� v� kho l��ng") then
		Msg2Player("B�n �� ho�n th�nh nhi�m v� ti�u di�t Th� v� tr�i ng�a v� Th� v� kho l��ng")
	elseif nTask2 == 1 and _21 == 1 and _22 == 1 and (npcName == "Th� v� Kho�ng tr��ng" or npcName == "Th� v� M�c tr��ng") then
		Msg2Player("B�n �� ho�n th�nh nhi�m v� ti�u di�t Th� v� Kho�ng tr��ng v� Th� v� M�c tr��ng")
	end
end

function Enter_Map()
	RemoveTrigger(GetRunningTrigger())
	init_fight()
end

function Leave_Map()
	RemoveTrigger(GetRunningTrigger())
	uninit_fight()
end