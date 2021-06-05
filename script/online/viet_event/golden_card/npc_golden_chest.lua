Include("\\script\\online\\viet_event\\golden_card\\golden_head.lua")

function main()	
	local nzTaskVal = 0
	local nTaskCheck = TASK_DIG_COUNT_1
	local nMapID = GetWorldPos()
	local nLevel = GetLevel()
	local nDate = tonumber(date("%y%m%d"))
	local npc_index = GetTargetNpc()
	local nChestID  = GetUnitCurStates(npc_index,2)
	if CheckAccount() <= 0 then
		Talk(1, "", "T�i kho�n c�a c�c h� kh�ng c� Ho�ng Kim L�nh B�i.");
		return
	end
	if Zgc_pub_npc_distance() > 15 then
		Talk(1,"","C� ly qu� xa, kh�ng th� m� r��ng!")
		return 0
	end	
	if GetPlayerRoute() == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ch�a gia nh�p h� ph�i, kh�ng th� nh�n th��ng.");
		return
	end	
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: V� c�ng h� ph�i ch�a h�c ��y ��, kh�ng th� nh�n th��ng.");
		return
	end
	if GetItemCount(0,200,25) < 1 then
		Talk(1, "", "Ph�i c� Cu�c Vi�m �� trong ng��i m�i c� th� m� r��ng.");
		return
	end
	if nLevel < 80 then
		if nMapID ~= 108 and nMapID ~= 301 then
			Talk(1, "", "��ng c�p c�a c�c h� kh�ng th�ch h�p m� r��ng t�i ��y. H�y t�m n�i kh�c.");
			return
		end
	elseif nLevel >= 80 and nLevel <= 89 then
		if nMapID ~= 513 then
			Talk(1, "", "��ng c�p c�a c�c h� kh�ng th�ch h�p m� r��ng t�i ��y. H�y t�m n�i kh�c.");
			return
		end
	elseif nLevel >= 90 then
		if nMapID ~= 514 then
			Talk(1, "", "��ng c�p c�a c�c h� kh�ng th�ch h�p m� r��ng t�i ��y. H�y t�m n�i kh�c.");
			return
		end
	end	
	local nChestType = CheckDigLevel()
	if nChestType <= 0 then
		Talk(1, "", "C�c h� kh�ng �� �i�u ki�n m� r��ng. C�c h� ph�i c� t�i kho�n <color=red>V� L�m Ti�n B�i, c� �i�m danh v�ng, �i�m s� m�n v� �i�m c�ng tr�ng theo quy ��nh m�i m� ���c<color>!");
		return	
	end
	
	if (floor(GetTask(TASK_DIG_DATE)/100)) ~= nDate then
		SetTask(TASK_DIG_COUNT_1,0)
		SetTask(TASK_DIG_COUNT_2,0)
		SetTask(TASK_DIG_DATE,nDate*100)	
	end
			
	if mod( GetTask(TASK_DIG_DATE),100)  >=  tbOpenBoxTimes[nChestType]  then
		Talk(1, "", "H�m nay c�c �� s� d�ng h�t s� l�n m� r��ng, mai th� l�i nh�!");
		return
	end
	if GetTime() - GetTask(TASK_DIG_TIME) <= 60 then
		local nRemainTime = 60 - (GetTime() - GetTask(TASK_DIG_TIME))
		Talk(1, "", "Th�i gian gi�a 2 l�n m� r��ng l� 60 gi�y. C�c h� c�n "..nRemainTime.." gi�y m�i c� th� m� ti�p.");
		return
	end
	if nChestID > 31 then
		nChestID = nChestID - 31
		nTaskCheck = TASK_DIG_COUNT_2
	end
	if gf_GetTaskBit(nTaskCheck,nChestID) == 1 then
		Talk(1, "", "M�i r��ng ch� ���c m� 1 l�n, h�y �i t�m r��ng kh�c!");
		return
	end	
		SetTask(TASK_DIG_DATE,GetTask(TASK_DIG_DATE)+1)
		SetTask(TASK_DIG_TIME,GetTime())
		gf_SetTaskBit(nTaskCheck,nChestID,1)		
		SetTask(TASK_DIG_COUNT_ALL,GetTask(TASK_DIG_COUNT_ALL) + 1)
		AbradeDigTool(3,61,10)
		DoWait(21,14,5)
end