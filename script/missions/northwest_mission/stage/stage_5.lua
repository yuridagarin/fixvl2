--�ű����ƣ�������ؿ��ű�
--�ű����ܣ��������ؿ��������������ؽű�
--�߻��ˣ��¹���
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-11-26
--���������궨�弰��������˹�ϵ
MS_boss_index = 10
MS_boss_index_gold = 11
MS_boss_index_water = 12
MS_boss_index_wood = 13
MS_boss_index_fire = 14
MS_boss_index_soil = 15
Ms_element_start_seq = 16
Ms_element_gold_seq = 17
Ms_stage5_loop_num = 18
Ms_boss_crt_state = 20
Ms_boss_crt_seq_1st = 21
Ms_boss_crt_seq_2nd = 22
Ms_boss_crt_seq_3rd = 23
Ms_boss_crt_seq_4th = 24
Ms_boss_crt_seq_5th = 25
Ms_element_killed_num = 26
Tb_Ms_effect_index = {31,32,33,34,35}
Tb_effect_id = {955,956,957,958,959}
--npc��Ϣ
	Tb_5_element_coordinate = {
	--����x����-����Y����-������-�����-NPCģ��-NPC����-�������λ��-С��ģ����-С��npc��
	{1613,3204,2,3,"�i Ng� H�nh Kim S�","Kim s�",MS_boss_index_gold,		"Kim K� S�",	"Kim K� S�"},		--��
	{1626,3230,3,4,"�i Ng� H�nh Th�y S�","Th�y s�",MS_boss_index_water,	"Th�y K� S�",	"Th�y K� S�"},		--ˮ
	{1602,3258,4,5,"�i Ng� H�nh M�c S�","M�c s�",MS_boss_index_wood,	"M�c K� S�",	"M�c K� S�"},		--ľ
	{1577,3230,5,1,"�i Ng� H�nh H�a S�","H�a s�",MS_boss_index_fire,		"H�a K� S�",	"H�a K� S�"},		--��
	{1592,3202,1,2,"�i Ng� H�nh Th� S�","Th� s�",MS_boss_index_soil,		"Th� K� S�",	"Th� K� S�"},		--��
}
	--npc��������
stage5_npc_chat_alive = {
	"Cho ng��i bi�t th� n�o l� tr�n ph�p m�nh nh�t! Ng� H�nh Lu�n H�i-Sinh!",
	"H�u qu� xem th��ng Ng� H�nh Tr�n! Ng� H�nh Lu�n H�i-Sinh!",
	"N�i s� h�i �ang bao tr�m l�n c�c ng��i! Ng� H�nh Lu�n H�i-Sinh!",
	"H�u d�ng v� m�u, th�t ��ng ti�c! Ng� H�nh Lu�n H�i-Sinh!",
}
stage5_npc_chat_death = {
	"Cho ng��i bi�t th� n�o l� tr�n ph�p m�nh nh�t! Ng� H�nh Lu�n H�i-Kh�c!",
	"H�u qu� xem th��ng Ng� H�nh Tr�n! Ng� H�nh Lu�n H�i-Kh�c!",
	"N�i s� h�i �ang bao tr�m l�n c�c ng��i! Ng� H�nh Lu�n H�i-Kh�c!",
	"H�u d�ng v� m�u, th�t ��ng ti�c! Ng� H�nh Lu�n H�i-Kh�c!?",
}
--������ʱboss���ӵ�Ѫ�����ٷֱȣ�
Boss_life_reduce_percent = 30
--���п�ʱ��Ҽ��ٵ�Ѫ�����ٷֱȣ�
Player_life_reduce_percent = 50
--ÿʮ�봴����С������
Devilkin_crt_num_per10s = 1
--����ص�ʱ�䴥������
--��Ϊ��Ҫ��time_loop_num���и��٣����Ե�������
function stage5_timmer_fun()
	local time_loop_num = GetMissionV(MS_TIMMER_LOOP_ID)
	if mod((186 - time_loop_num),30) == 0  and time_loop_num >= 66 then
		if GetMissionV(Ms_boss_crt_state) <= (floor((186 - time_loop_num)/30))  then
			element_crt()
		end
	end
	local loop_num_now = (GetMissionV(Ms_stage5_loop_num)+1)
	if loop_num_now == 3 then
		--����ת��
		element_seq_chg()
	else
		if mod(loop_num_now,12) == 6 then	--�����ֻأ���
			element_alive()
		elseif mod(loop_num_now,12) == 0 then --�����ֻأ���
			element_death()
		end
	end
	SetMissionV(Ms_stage5_loop_num,loop_num_now)
	if mod(loop_num_now,2) == 0 then
		element_devilkin_crt()
	end
end
--boss��������
--���׶δ�����Ϊ�Ի�boss
function stage5_boss_create()
	--boss����
	local map_id =  SubWorldIdx2ID(SubWorld)
	local boss_index = 0
	for i = 1,getn(Tb_5_element_coordinate) do
		boss_index = CreateNpc(Tb_5_element_coordinate[i][5],Tb_5_element_coordinate[i][6],map_id,Tb_5_element_coordinate[i][1],Tb_5_element_coordinate[i][2],6)
		AddUnitStates(boss_index,7,0)
		SetNpcScript(boss_index,Main_Npc_Script_way)
		SetMissionV((10+i),boss_index)
		boss_index = CreateNpc("Ng� H�nh Tr�n �n"," ",map_id,Tb_5_element_coordinate[i][1],Tb_5_element_coordinate[i][2])
		SetMissionV(Tb_Ms_effect_index[i],boss_index)
		SetCurrentNpcSFX(boss_index,Tb_effect_id[i],2,1)
	end
	--�����loop_num��ʼ��
	--SetMissionV(Ms_stage5_loop_num,0)
	--ʱ���������ʾ
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"�i b�t ��u c�n\",30,0,2)")
end
--�ؿ���ʽ��ʼ
function stage5_start()
	--����˳����
	local tb_element_seq = {1,2,3,4,5}
	local ran_seq = 0
	for i = getn(tb_element_seq),1,-1 do
		ran_seq = random(1,i)
		SetMissionV((20+i),tb_element_seq[ran_seq])
		tb_element_seq[ran_seq] = tb_element_seq[i]
	end
	--��npc���ж�Ӧ�Ĵ���
	for i = 1,getn(Tb_5_element_coordinate) do
		if i == GetMissionV(21) then
			ChangeNpcToFight(GetMissionV(10+i))
		else
			SetNpcLifeTime(GetMissionV(10+i),0)
			SetMissionV((10+i),0)
		end
	end
	SetMissionV(Ms_boss_crt_state,1)
	--���г�ʼλ������
	SetMissionV(Ms_element_gold_seq,random(0,4))
	--ʱ���������ʾ
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"K�t th�c v��t �i c�n\",1800,0,1)")
end
--���з�λ�仯����
function element_seq_chg()
	SetMissionV(Ms_element_gold_seq,(mod( (GetMissionV( Ms_element_gold_seq ) +1 ),5)))
	--��Ч��ת
	local effect_index = 0
	local golden_element_seq = GetMissionV(Ms_element_gold_seq)
	local effect_id = 0
	for i = 1,getn(Tb_Ms_effect_index) do
		effect_id = mod((i +golden_element_seq),5)
		if effect_id == 0 then
			effect_id = 5
		end
		SetCurrentNpcSFX(GetMissionV(30 + effect_id),Tb_effect_id[i],2,1)
	end
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Ng� H�nh Lu�n H�i: Sinh\",30,0,2)")
end
--�����ֻ���������
function element_alive()
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Ng� H�nh Lu�n H�i: Kh�c\",60,0,2)")
	local element_index = 0
	--��ֹ�����ֻط������������
	local stop_player_index = 0
	for i = MS_boss_index_gold,MS_boss_index_soil do
		element_index = GetMissionV(i)
		if element_index  ~= 0 and element_index ~= nil then
			NpcChat(element_index,stage5_npc_chat_alive[random(1,getn(stage5_npc_chat_alive))])
			stop_player_index = player_5_element_doa_chk((i-10),3) 
			if stop_player_index == 0 then
				Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Ng� H�nh Lu�n H�i t��ng 'Sinh' k�ch ho�t, t�ng sinh l�c t�t c� S� gi� ng� h�nh"..Player_life_reduce_percent.."%��\")")
				element_alive_deal()
			else
				Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName(stop_player_index).."Th�nh c�ng c�n tr� Ng� H�nh Lu�n H�i t��ng sinh k�ch ho�t!\")")
			end
		end
	end
end
--�����ֻ���˴���
function element_death()
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Ng� H�nh Lu�n H�i: Sinh\",60,0,2)")
	local element_index = 0
	--��ֹ�����ֻط������������
	local stop_player_index = 0
	for i = MS_boss_index_gold,MS_boss_index_soil do
		element_index = GetMissionV(i)
		if element_index  ~= 0 and element_index ~= nil then
			NpcChat(element_index,stage5_npc_chat_death[random(1,getn(stage5_npc_chat_death))])
			stop_player_index = player_5_element_doa_chk((i-10),4) 
			if stop_player_index == 0 then
				Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Ng� H�nh Lu�n H�i t��ng 'Kh�c' k�ch ho�t, gi�m sinh l�c t�t c� ng��i ch�i"..Boss_life_reduce_percent.."%��\")")
				element_death_deal()
			else
				Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName(stop_player_index).."Th�nh c�ng c�n tr� Ng� H�nh Lu�n H�i t��ng kh�c k�ch ho�t!\")")
			end
		end
	end	
end
--С�ִ�������
function element_devilkin_crt()
	local map_id = SubWorldIdx2ID(SubWorld)
	local npc_index,npc_num,npc_index_total = 0,0,{}  
	local golden_element_seq = GetMissionV(Ms_element_gold_seq)
	local crt_npc_seq = 0
	for i = 1,getn(Tb_5_element_coordinate) do
		crt_npc_seq = mod((i+golden_element_seq),5)
		if crt_npc_seq == 0 then
			crt_npc_seq = 5 
		end
		if stage_devil_restrict() ~= 0 then
			npc_index = CreateNpc(Tb_5_element_coordinate[i][8],Tb_5_element_coordinate[i][9],map_id,(Tb_5_element_coordinate[crt_npc_seq][1] + random(-2,2)),Tb_5_element_coordinate[crt_npc_seq][2]+ random(-2,2))
			SetNpcScript(npc_index,Main_Npc_Script_way)
		end
	end
end
--�����������վλ���
--���������doa_flag����Ϊ3�����Ϊ4
function player_5_element_doa_chk(element_seq,doa_flag)
	local map_id = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,map_id)
	local player_att_x,player_att_y = 0,0
	local att_x_distance_num,att_y_distance_num = 0,0
	--���Ϸ�λ����ת
	local element_gold_seq = GetMissionV(Ms_element_gold_seq)
	local doa_element_seq = mod((Tb_5_element_coordinate[element_seq][doa_flag] + element_gold_seq),5)
	if doa_element_seq == 0 then
		doa_element_seq = 5
	end
	for i = 1, getn(player) do
		PlayerIndex = player[i]
		map_id,player_att_x,player_att_y = GetWorldPos()
		--����������˶�Ӧ��X\Y�����ȡ
		att_x_distance_num = abs(player_att_x - Tb_5_element_coordinate[doa_element_seq][1])
		att_y_distance_num = abs(player_att_y - Tb_5_element_coordinate[doa_element_seq][2])
		--����Ƿ����������λ���ж�
		if att_x_distance_num <= 5 and att_y_distance_num <= 5 and  (abs(att_x_distance_num) + abs(att_y_distance_num)) <= 5 then
			return PlayerIndex
		end
	end 
	return 0
end
--����������
function element_alive_deal()
	local boss_index = 0
	for i = MS_boss_index_gold,MS_boss_index_soil do
		boss_index = GetMissionV(i)
		if boss_index ~= 0 and boss_index ~= nil then
			Zgc_pub_mission_boss_life_chg(boss_index,1,Boss_life_reduce_percent)
		end
	end
end
--���п˷���
function element_death_deal()
	local life_now = 0,0
	local modify_life_num = 0
	local map_id =  SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,map_id)
	for i = 1,getn(player) do
		PlayerIndex = player[i]
		life_now = GetLife()
		modify_life_num = life_now - floor(GetMaxLife() * Boss_life_reduce_percent/100)
		if modify_life_num < 0 then
			ModifyLife(0)
		else
			ModifyLife(modify_life_num)
		end
	end
end
--�µ�������ʹ����
--��ϵͳ���������õ�ʱ��ҲҪ����Ƿ���Դ����µ�����ʹ��
function element_crt()
	--����������ʹ�ߵ����
	local map_id =  SubWorldIdx2ID(SubWorld)
	--���С��
	local npc_total_index = GetMapNpcIdx(map_id)
	local npc_num = getn(npc_total_index)
	if npc_num > 1 then
		for i = 1,npc_num do
			local npc_name = GetNpcName(npc_total_index[i])
			if strsub(npc_name,3,6) == "K� s�" then
				SetNpcLifeTime(npc_total_index[i],0)
			end		
		end
	end
	local element_crt_seq = GetMissionV(20+(GetMissionV(Ms_boss_crt_state)+1))
	local boss_index = CreateNpc(Tb_5_element_coordinate[element_crt_seq][5],Tb_5_element_coordinate[element_crt_seq][6],map_id,Tb_5_element_coordinate[element_crt_seq][1],Tb_5_element_coordinate[element_crt_seq][2])
	SetNpcScript(boss_index,Main_Npc_Script_way)
	--������
	SetMissionV((10 + element_crt_seq),boss_index)
	--����˳��+1
	SetMissionV(Ms_boss_crt_state,(GetMissionV(Ms_boss_crt_state) + 1))
	--�����loop_num��ʼ��
	SetMissionV(Ms_stage5_loop_num,0)
	Zgc_pub_mission_fun(MS_ID,"StopTimeGuage(2)")
end
--�������ű�
function OnDeath(npc_index)
	local npc_name = GetNpcName(npc_index)
	for i = 1,getn(TB_Npc_death_script[5]) do
		if TB_Npc_death_script[5] [i][1] == npc_name then
			dostring(TB_Npc_death_script[5] [i][2])
			break
		end
	end
	SetNpcLifeTime(npc_index,5)
end
--��������ű�
function stage5_element_death(element_seq)
	--����Ѿ��ɵ�����
	if GetMissionV(Ms_element_killed_num) == 4 then
		Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"To�n b� 'Ng� H�nh Tr�n S�' b� ti�u di�t, qua �i n�y!\")")
		
		local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
		PlayerIndex = GetTeamMember(0)
		if PlayerIndex ~= 0 then
			AddGlobalNews("T�i"..GetName().."Chi�n ��u gian kh�, cu�i c�ng ��nh b�i 'Ng� H�nh Tr�n S�', v��t �i th�nh c�ng"..Stage_info[stage_seq].stage_name..".")
		end
		
		local nMapID = SubWorldIdx2ID(SubWorld)
		ClearMapNpc(nMapID)
		--׼���ؽ���
		--test
		local mission_count = GetMapTaskTemp(nMapID,1)
		WriteLog("[�i T�y B�c] th�ng k� qua �i: ID �i	"..stage_seq..":"..nMapID..":"..mission_count.."	Th�i gian qua �i	"..Zgc_pub_time_sec_change(((189-GetMissionV(MS_TIMMER_LOOP_ID))* 10),1))
		Zgc_pub_mission_fun(MS_ID,"Ms_stage_prize()")
		SetMissionV(MS_TIMMER_LOOP_ID,6)
		--stage_mission_fail(5)
	else
		--������������ʹ����+1
		SetMissionV(Ms_element_killed_num,(GetMissionV(Ms_element_killed_num)+1))
		--ȥ����Ӧ������
		SetMissionV((10 + element_seq),0)
		--������һ�׶ε�������ʹ��Ҫע�����������̴����������ű������ģ�
		--�ж���һ�׶ε�NPC�Ƿ��Ѿ������̴�����ϣ����û���򴴽�
		--�����Ƿ�������ʹ���ڵ��ж�
		--����ʹ��ɱ���Ƿ񴴽�������Ϊ���Ƿ�������ʹ���ڣ����û���򴴽�����֮��Ȼ
		local element_alive_chk = 0
		local element_index = 0
		for i = MS_boss_index_gold ,MS_boss_index_soil do
			element_index = GetMissionV(i)
			if element_index ~= 0 and element_index ~= nil then
				element_alive_chk = 1 
				break
			end
		end
		if element_alive_chk == 0 then
			element_crt()
		end
	end
end
--NPC�Ի���Ϣ
--����ʹ�ߵĶԻ�
function stage5_5_element_dia()
	Talk(1,"","<color=green>"..GetTargetNpcName().."<color>: C�c ng��i h�m nay ch�t trong tay ta, c�ng kh�ng oan u�ng!")
end
