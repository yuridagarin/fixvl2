-- Created by TuanNA5
-- 31/05/2010
-- T�i nguy�n chi�n

Include("\\script\\newbattles\\newresourcebattle\\newres_functions.lua")

box_belong_ID = 2
box_open_time_ID = 5

function gather_res()
	if GetPlayerRoute() == 0 then
		Talk(1,"","Gia nh�p m�n ph�i m�i c� th� tham gia chi�n d�ch!")
		return 0
	end	
	if GetLevel() < 77 then
		Talk(1,"","��ng c�p 77 tr� l�n m�i c� th� tham gia chi�n d�ch!")
		return 0
	end	
	if abs(GetTask(701)) < 15000 then
		Talk(1,"","�i�m c�ng tr�ng ph�i ��t 15000 tr� l�n m�i c� th� tham gia chi�n d�ch!")
		return 0
	end	
	if GetPKFlag() == 0 or GetFightState() == 0 then
		Talk(1,"","D�ng th�c luy�n c�ng kh�ng th� nh�n ���c t�i nguy�n n�y!")
		return 0
	end	
	if  gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE)  == 0 then
		Talk(1,"","B�n ph�i nh�n nhi�m v� m�i c� th� thu th�p t�i nguy�n n�y!")
		return 0		
	end	
	if  gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE)  == 2 then
		Talk(1,"","B�n �� ho�n th�nh nhi�m v� thu th�p. Mau �i l�nh th��ng!")
		return 0		
	end	
	if Zgc_pub_npc_distance() > 10 then
		Talk(1,"","C� ly qu� xa, kh�ng th� thu th�p!")
		return 0
	end	
	BT_ResetTask()
	if  gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE)  == 1 then
		local npc_index = GetTargetNpc()
		local map_id = GetWorldPos()
		if map_id ~= 606 then
			return 0
		end		
		local nToolCount = GetItemCount(tItem[RES_TYPE][2][1],tItem[RES_TYPE][2][2],tItem[RES_TYPE][2][3])
		if nToolCount <= 0 then
			-------------------------
			local tResNew = {
								[1] = {6},
								[2] = {7},
								[3] = {8},
								[4] = {9},
						}
			local RES_TYPE = tResNew[RES_TYPE][1]
			local nToolCountNew = GetItemCount(tItem[RES_TYPE][2][1],tItem[RES_TYPE][2][2],tItem[RES_TYPE][2][3])
			if nToolCountNew <= 0 then
			-------------------------
				Talk(1,"","B�n kh�ng c� d�ng c� th��ng ho�c d�ng c� cao c�p �� thu th�p t�i nguy�n n�y!")
				return 0
			end
		end
		if GetUnitCurStates(npc_index,box_belong_ID) ~= 1 and (GetTime() - GetUnitCurStates(npc_index,box_open_time_ID)) < 6 then
			Talk(1,"","�� c� ng��i kh�c �ang thu th�p t�i nguy�n n�y!")
			return 0
		end	
		if SetUnitCurStates(npc_index,box_belong_ID,2) ~= 1 then
			return
		end
		SetUnitCurStates(npc_index,box_open_time_ID,GetTime())		
		SetTaskTemp(TSK_TMP_NEWRES,npc_index)	
		AbradeDigTool(tItem[RES_TYPE][3][1],tItem[RES_TYPE][3][2],tItem[RES_TYPE][3][3])
		local nWaitTime = 5		
		local nPetLevel = mod(GetTask(TASK_VNG_PET), 100)
		local nIsPS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10),10)
		if GetFollower() > 0 then
			if nPetLevel == 2 or nPetLevel == 3 then -- n�u B�n ��ng H�nh c�p 2, 3
				nWaitTime = 4
			elseif nPetLevel == 4 then -- n�u B�n ��ng H�nh c�p 4 
				nWaitTime = 3
			end
		end
		if nIsPS >= 1 then
			nWaitTime = 2
		end
		DoWait(19,20,nWaitTime)
	end
end;

function Zgc_pub_npc_distance()
	local npc_index = GetTargetNpc()
	local npc_map_id,npc_att_x,npc_att_y = GetNpcWorldPos(npc_index)
	local player_map_id,player_att_x,player_att_y = GetWorldPos()
	return (abs(npc_att_x - player_att_x) + abs(npc_att_y - player_att_y))
end

function SetUnitCurStates(Npc_index,att_seq,number)
	if number > 99 and att_seq ~= 1 and att_seq ~= 4 and att_seq ~= 5 and att_seq ~= 6 then
		return 0
	end
	local num_save = GetUnitCurStates(Npc_index,att_seq)
	num_save = number - num_save
	AddUnitStates(Npc_index,att_seq,num_save)
	return 1
end