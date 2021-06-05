
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\jpz_event\\first_tong\\first_tong_head.lua")
Include("\\script\\online\\jpz_event\\first_tong\\mission_head.lua");

function main()
	if is_first_tong_jpz_open() == 0 then
		return
	end
	
	if GetPlayerRoute() == 0 then
		Say("Ng��i ch�a gia nh�p m�n ph�i kh�ng th� m� b�o r��ng!", 0)
		return
	end
	
	if IsTongMember() == 0 then
		Say("Ph�i gia nh�p bang h�i m�i nh�t ���c b�o r��ng!", 0)
		return
	end

	local box_index = GetTargetNpc()
	SetGlbValue(501,box_index)
	local task_start_time =	START_TIME + PREPARE_TIME
	local time_diff = task_start_time - Zgc_pub_today_sec_num_rtn()

	if time_diff > 0 then
		Talk(1,"","Ho�t ��ng bang h�i tinh anh v�n ch�a b�t ��u, xin m�i ��i! "..Zgc_pub_time_sec_change(time_diff,0).."  m�i c� th� m� b�o r��ng!")
		return
	end
	
	local nMissionState = mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,HUASHAN_MAP_ID)
	if nMissionState == 3 or nMissionState == 0 then
		Talk(1,"","Ho�t ��ng bang h�i tinh anh �� k�t th�c, xin m�i ��i l�n t�i.")
		return
	elseif nMissionState == 1 then
		Talk(1,"","Ho�t ��ng bang h�i tinh anh v�n ch�a b�t ��u, b�y gi� kh�ng th� m� b�o r��ng!")
		return
	elseif nMissionState ~= 2 then
		WriteLog(g_LogTitle.."[Error]: In huashan_box_npc.lua, the value of nMissionState is error, the error value is : "..nMissionState)
		return
	end

	if GetUnitCurStates(box_index,4) >= zgc_pub_day_turn(1) then
		Talk(1,"","Ho�t ��ng bang h�i tinh anh �� k�t th�c, xin m�i ��i l�n t�i.")
		return
	end
	if Zgc_pub_goods_add_chk(5,300) == 0 then
		return
	end
	if GetUnitCurStates(box_index,2) ~= 1 or (GetTime() - GetUnitCurStates(box_index,1)) > OPENBOX_TIME then
		SetUnitCurStates(box_index,1,GetTime())
		SetUnitCurStates(box_index,2,1)
		DoWait(1,2,OPENBOX_TIME)				--�������
	else
		Talk(1,"","Hi�n �� c� ng��i s� d�ng <color=red>Hoa S�n b�o r��ng<color>.")
		return
	end
end
