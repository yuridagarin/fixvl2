Include("\\script\\online\\qixi08\\box\\head.lua")
-----------------missionϵͳ���---------------------
Tb_box_time_fun = {
	[60] = "box_misson_start()"
}
for i = 61,340 do
	if mod(i,30) == 0 then
		Tb_box_time_fun[i] = "box_crt()"
	elseif mod((i+10),30) == 0 then
		Tb_box_time_fun[i] = "jiguan_crt()"
	elseif mod((i-10),30) == 0 then
		Tb_box_time_fun[i] = "box_get_chk()"
	end
end
---------------------mission�������--------------------
function OnTimer()
	local time_loop_num = GetMissionV(MS_LOOP_NUM)
	if Tb_box_time_fun[time_loop_num] ~= nil then
		dostring(Tb_box_time_fun[time_loop_num] )
	end
	SetMissionV(MS_LOOP_NUM,(time_loop_num + 1))
end
--�ؿ���ʼ
function box_misson_start()
	local map_id = SubWorldIdx2ID(SubWorld)
	local player_index = mf_GetMSPlayerIndex(MS_ID,0,map_id)
	local player_num = getn(player_index)
	if player_num <  Box_player_min then
		Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"S� ng��i kh�ng ��"..Box_player_min..", h�y ho�t ��ng �o�t b�o l�n n�y! \")")
		box_misson_end()
	else
--		Zgc_pub_mission_fun(MS_ID,"BigDelItem(2,0,1069,1)")
		Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Th�i gian s�p k�t th�c \",10,0,1)")
		Zgc_pub_mission_fun(MS_ID,"Talk(1,\"\",\"B�n �� n�y t�ng c�ng c� <color=yellow>"..(player_num - 1).."<color> ng��i ch�i c�ng �o�t b�o v�i b�n, sau <color=yellow>20<color> gi�y b�t ��u! \")")
	end
end
--���䴴��
function box_crt()
	local map_id = SubWorldIdx2ID(SubWorld)
	local tb_player_index = mf_GetMSPlayerIndex(MS_ID,0,map_id)
	local player_num = getn(tb_player_index)
	if player_num > 2 then
		for i = 1, (player_num -1) do
			box_index = CreateNpc("B�o r��ng c�a B� Phi Y�n","B�o r��ng",map_id,1600,3238,-1,1,1,300)
			SetNpcScript(box_index,"\\script\\online\\qixi08\\box\\function.lua")
			SetNpcLifeTime(box_index,10)
		end
	elseif player_num == 2 then
		local att_x,att_y = 0,0
		for i=1,getn(tb_player_index) do
			PlayerIndex = tb_player_index[i]
			local map_id_temp,att_x_temp,att_y_temp = GetWorldPos()
			att_x = att_x + att_x_temp
			att_y = att_y + att_y_temp
		end
		att_x = floor(att_x/2)
		att_y = floor(att_y/2)
		local box_index = CreateNpc("B�o r��ng c�a B� Phi Y�n","B�o r��ng",map_id,att_x,att_y)--floor(att_x/2),floor(att_x/2))
		SetNpcScript(box_index,"\\script\\online\\qixi08\\box\\function.lua")
		SetNpcLifeTime(box_index,10)
	else
		PlayerIndex = tb_player_index[1] 
		local box_index = CreateNpc("B�o r��ng c�a B� Phi Y�n","B�o r��ng",GetWorldPos())
		SetNpcScript(box_index,"\\script\\online\\qixi08\\box\\function.lua")
		SetNpcLifeTime(box_index,10)
	end
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Th�i gian m�t b�o r��ng \",10,0,1)")
end
--���ش���
function jiguan_crt()
	local map_id = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,map_id)
	local jiguan_num = floor((getn(player)+0.5)/2)
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Th�i gian t�o b�o r��ng \",10,0,1)")
	if jiguan_num > 0 then
		for i = 1,jiguan_num do
			local jiguan_index = CreateNpc("Ti�u s�-��i tho�i","C� quan",map_id,1600,3238,-1,1,1,300)
			SetNpcScript(jiguan_index,"\\script\\online\\qixi08\\box\\function.lua")
			SetNpcLifeTime(jiguan_index,10)
		end
	end
end
-------------------�Ի�����-------------------
Tb_npc_dialog = {
	["C� quan"] = "jiguan_dia_main",
	["B�o r��ng"] = "box_dia_main"
}
function main()
	dostring(Tb_npc_dialog[GetTargetNpcName()].."("..GetTargetNpc()..")")
end
--���ӶԻ�
function box_dia_main(npc_index)
	--һ��ֻ�ܵ�һ������
	local mission_step = floor((GetMissionV(MS_LOOP_NUM) - 60)/30)
	if GetTask(Box_prize_step) == mission_step then
		Talk(1,"","<color=green>Nh�c nh�<color>: Ng��i nh�n ���c b�o r��ng c�a giai �o�n n�y!")
		return
	end
	--����У��
	local map_id_player,att_player_x,att_player_y = GetWorldPos()
	local map_id_npc,att_npc_x,att_npc_y = GetNpcWorldPos(npc_index)
	if (abs(att_player_x-att_npc_x) + abs(att_player_y-att_player_y)) > 16 then
		Msg2Player("Kho�ng c�ch qu� xa, kh�ng th� m� b�o r��ng!")
		return
	end
	--����ռ����У��
	if GetUnitCurStates(npc_index,Npc_unit_attitude) == 1 then
		return
	else
		SetUnitCurStates(npc_index,Npc_unit_attitude,1)
	end	
	SetNpcLifeTime(npc_index,0)
	--��Ҵ���
	SetTask(Box_prize_step,mission_step) 
	if mission_step > GetTask(Box_best_prize) then
		SetTask(Box_best_prize,mission_step)
	end
	Msg2Player("Ch�c m�ng b�n nh�n ���c b�o r��ng l�n"..mission_step.." !")
	if mission_step >= 7 then
		SetTask(Box_prize_9_times,(GetTask(Box_prize_9_times)+1))
	end
	local player_num = getn(mf_GetMSPlayerIndex(MS_ID,0,map_id))
	if player_num <= 2 or mission_step >= 9 then
		box_misson_end()
	end
end
--�رչؿ�
function box_misson_end()
	local map_id = SubWorldIdx2ID(SubWorld)
	local player_index = mf_GetMSPlayerIndex(MS_ID,0,map_id)
	local player_num = getn(player_index)
	for i = 1,player_num do
		PlayerIndex = player_index[i]
		local mapid_save = GetTask(Log_in_mapID)
		NewWorld(mapid_save,Tb_log_out_att[mapid_save][1],Tb_log_out_att[mapid_save][2])
	end
end
--�Ƿ������Ӽ��
function box_get_chk()
	local map_id = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,map_id)
	local player_num = getn(player)
	local suc_num = 0
	local player_index_win  = 0
	local mission_step = floor((GetMissionV(MS_LOOP_NUM) - 60)/30)
	for i = 1, player_num do
		if player_index ~= player[i] then
			PlayerIndex = player[i]
			if GetTask(Box_prize_step) < mission_step then
				if GetTask(Box_prize_9_times) < 10 then
					SetTask(Box_prize_9_times,0)
				end
				Msg2Player("Ng��i b� tr�c xu�t r�i!")
				local mapid_save = GetTask(Log_in_mapID)
				NewWorld(mapid_save,Tb_log_out_att[mapid_save][1],Tb_log_out_att[mapid_save][2])
			else
				suc_num = suc_num + 1
				player_index_win = PlayerIndex
			end
		end
	end 
	if suc_num <= 1 then
		PlayerIndex = player_index_win
		Msg2Player("Ch�c m�ng b�n �� chi�n th�ng!")
		box_misson_end()
	end
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Th�i gian t�o c� quan \",10,0,1)")
end
--���ضԻ�
function jiguan_dia_main(npc_index)
	if GetUnitCurStates(npc_index,Npc_unit_attitude) == 1 then
		return
	else
		SetUnitCurStates(npc_index,Npc_unit_attitude,1)
	end
	SetNpcLifeTime(npc_index,0)
	local ran_num = random(1,(getn(Tb_jiguan_buff) + 1))
	if ran_num > getn(Tb_jiguan_buff) then
		ModifyExp(10000)
		Msg2Player("Ch�c m�ng b�n nh�n ���c 10000 �i�m kinh nghi�m!")
	else
		jigua_buff_add(ran_num)
	end
end
--���˼�״̬
function jigua_buff_add(buff_seq)
	local player_index = PlayerIndex
	local map_id = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,map_id)
	for i = 1, getn(player) do
		if player_index == player[i] then
			tremove(player,i)
		end
	end 
	PlayerIndex = player[random(1,getn(player))]
	CastState(Tb_jiguan_buff[buff_seq],50,180,0,(19801236+buff_seq))
end
