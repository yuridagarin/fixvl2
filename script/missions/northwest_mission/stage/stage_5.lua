--脚本名称：五行阵关卡脚本
--脚本功能：西北区关卡第五关五行阵相关脚本
--策划人：陈公子
--代码开发人：村长
--代码开发时间：2007-11-26
--五行阵坐标定义及相生、相克关系
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
--npc信息
	Tb_5_element_coordinate = {
	--中心x坐标-中心Y坐标-相生行-相克行-NPC模板-NPC名称-索引存放位置-小怪模板名-小怪npc名
	{1613,3204,2,3,"秈 Ng? H祅h Kim S?","Kim s?",MS_boss_index_gold,		"Kim K? S?",	"Kim K? S?"},		--金
	{1626,3230,3,4,"秈 Ng? H祅h Th駓 S?","Th駓 s?",MS_boss_index_water,	"Th駓 K? S?",	"Th駓 K? S?"},		--水
	{1602,3258,4,5,"秈 Ng? H祅h M閏 S?","M閏 s?",MS_boss_index_wood,	"M閏 K? S?",	"M閏 K? S?"},		--木
	{1577,3230,5,1,"秈 Ng? H祅h H醓 S?","H醓 s?",MS_boss_index_fire,		"H醓 K? S?",	"H醓 K? S?"},		--火
	{1592,3202,1,2,"秈 Ng? H祅h Th? S?","Th? s?",MS_boss_index_soil,		"Th? K? S?",	"Th? K? S?"},		--土
}
	--npc喊话内容
stage5_npc_chat_alive = {
	"Cho ngi bi誸 th? n祇 l? tr薾 ph竝 m筺h nh蕋! Ng? H祅h Lu﹏ H錳-Sinh!",
	"H藆 qu? xem thng Ng? H祅h Tr薾! Ng? H祅h Lu﹏ H錳-Sinh!",
	"N鏸 s? h穒 產ng bao tr飉 l猲 c竎 ngi! Ng? H祅h Lu﹏ H錳-Sinh!",
	"H鱱 d騨g v? m璾, th藅 ng ti誧! Ng? H祅h Lu﹏ H錳-Sinh!",
}
stage5_npc_chat_death = {
	"Cho ngi bi誸 th? n祇 l? tr薾 ph竝 m筺h nh蕋! Ng? H祅h Lu﹏ H錳-Kh綾!",
	"H藆 qu? xem thng Ng? H祅h Tr薾! Ng? H祅h Lu﹏ H錳-Kh綾!",
	"N鏸 s? h穒 產ng bao tr飉 l猲 c竎 ngi! Ng? H祅h Lu﹏ H錳-Kh綾!",
	"H鱱 d騨g v? m璾, th藅 ng ti誧! Ng? H祅h Lu﹏ H錳-Kh綾!?",
}
--五行生时boss增加的血量（百分比）
Boss_life_reduce_percent = 30
--五行克时玩家减少的血量（百分比）
Player_life_reduce_percent = 50
--每十秒创建的小怪数量
Devilkin_crt_num_per10s = 1
--第五关的时间触发函数
--因为需要对time_loop_num进行跟踪，所以单独处理
function stage5_timmer_fun()
	local time_loop_num = GetMissionV(MS_TIMMER_LOOP_ID)
	if mod((186 - time_loop_num),30) == 0  and time_loop_num >= 66 then
		if GetMissionV(Ms_boss_crt_state) <= (floor((186 - time_loop_num)/30))  then
			element_crt()
		end
	end
	local loop_num_now = (GetMissionV(Ms_stage5_loop_num)+1)
	if loop_num_now == 3 then
		--五行转换
		element_seq_chg()
	else
		if mod(loop_num_now,12) == 6 then	--五行轮回：生
			element_alive()
		elseif mod(loop_num_now,12) == 0 then --五行轮回：克
			element_death()
		end
	end
	SetMissionV(Ms_stage5_loop_num,loop_num_now)
	if mod(loop_num_now,2) == 0 then
		element_devilkin_crt()
	end
end
--boss创建函数
--本阶段创建的为对话boss
function stage5_boss_create()
	--boss创建
	local map_id =  SubWorldIdx2ID(SubWorld)
	local boss_index = 0
	for i = 1,getn(Tb_5_element_coordinate) do
		boss_index = CreateNpc(Tb_5_element_coordinate[i][5],Tb_5_element_coordinate[i][6],map_id,Tb_5_element_coordinate[i][1],Tb_5_element_coordinate[i][2],6)
		AddUnitStates(boss_index,7,0)
		SetNpcScript(boss_index,Main_Npc_Script_way)
		SetMissionV((10+i),boss_index)
		boss_index = CreateNpc("Ng? H祅h Tr薾 蕁"," ",map_id,Tb_5_element_coordinate[i][1],Tb_5_element_coordinate[i][2])
		SetMissionV(Tb_Ms_effect_index[i],boss_index)
		SetCurrentNpcSFX(boss_index,Tb_effect_id[i],2,1)
	end
	--第五关loop_num初始化
	--SetMissionV(Ms_stage5_loop_num,0)
	--时间进度条显示
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"秈 b総 u c遪\",30,0,2)")
end
--关卡正式开始
function stage5_start()
	--激活顺序开启
	local tb_element_seq = {1,2,3,4,5}
	local ran_seq = 0
	for i = getn(tb_element_seq),1,-1 do
		ran_seq = random(1,i)
		SetMissionV((20+i),tb_element_seq[ran_seq])
		tb_element_seq[ran_seq] = tb_element_seq[i]
	end
	--将npc进行对应的处理
	for i = 1,getn(Tb_5_element_coordinate) do
		if i == GetMissionV(21) then
			ChangeNpcToFight(GetMissionV(10+i))
		else
			SetNpcLifeTime(GetMissionV(10+i),0)
			SetMissionV((10+i),0)
		end
	end
	SetMissionV(Ms_boss_crt_state,1)
	--五行初始位置设置
	SetMissionV(Ms_element_gold_seq,random(0,4))
	--时间进度条显示
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"K誸 th骳 vt 秈 c遪\",1800,0,1)")
end
--五行方位变化函数
function element_seq_chg()
	SetMissionV(Ms_element_gold_seq,(mod( (GetMissionV( Ms_element_gold_seq ) +1 ),5)))
	--特效旋转
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
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Ng? H祅h Lu﹏ H錳: Sinh\",30,0,2)")
end
--五行轮回相生处理
function element_alive()
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Ng? H祅h Lu﹏ H錳: Kh綾\",60,0,2)")
	local element_index = 0
	--阻止五行轮回发生的玩家索引
	local stop_player_index = 0
	for i = MS_boss_index_gold,MS_boss_index_soil do
		element_index = GetMissionV(i)
		if element_index  ~= 0 and element_index ~= nil then
			NpcChat(element_index,stage5_npc_chat_alive[random(1,getn(stage5_npc_chat_alive))])
			stop_player_index = player_5_element_doa_chk((i-10),3) 
			if stop_player_index == 0 then
				Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Ng? H祅h Lu﹏ H錳 tng 'Sinh' k輈h ho箃, t╪g sinh l鵦 t蕋 c? S? gi? ng? h祅h"..Player_life_reduce_percent.."%！\")")
				element_alive_deal()
			else
				Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName(stop_player_index).."Th祅h c玭g c秐 tr? Ng? H祅h Lu﹏ H錳 tng sinh k輈h ho箃!\")")
			end
		end
	end
end
--五行轮回相克处理
function element_death()
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Ng? H祅h Lu﹏ H錳: Sinh\",60,0,2)")
	local element_index = 0
	--阻止五行轮回发生的玩家索引
	local stop_player_index = 0
	for i = MS_boss_index_gold,MS_boss_index_soil do
		element_index = GetMissionV(i)
		if element_index  ~= 0 and element_index ~= nil then
			NpcChat(element_index,stage5_npc_chat_death[random(1,getn(stage5_npc_chat_death))])
			stop_player_index = player_5_element_doa_chk((i-10),4) 
			if stop_player_index == 0 then
				Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Ng? H祅h Lu﹏ H錳 tng 'Kh綾' k輈h ho箃, gi秏 sinh l鵦 t蕋 c? ngi ch琲"..Boss_life_reduce_percent.."%！\")")
				element_death_deal()
			else
				Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName(stop_player_index).."Th祅h c玭g c秐 tr? Ng? H祅h Lu﹏ H錳 tng kh綾 k輈h ho箃!\")")
			end
		end
	end	
end
--小怪创建函数
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
--玩家五行阵中站位检测
--传入参数：doa_flag相生为3，相克为4
function player_5_element_doa_chk(element_seq,doa_flag)
	local map_id = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,map_id)
	local player_att_x,player_att_y = 0,0
	local att_x_distance_num,att_y_distance_num = 0,0
	--加上方位的旋转
	local element_gold_seq = GetMissionV(Ms_element_gold_seq)
	local doa_element_seq = mod((Tb_5_element_coordinate[element_seq][doa_flag] + element_gold_seq),5)
	if doa_element_seq == 0 then
		doa_element_seq = 5
	end
	for i = 1, getn(player) do
		PlayerIndex = player[i]
		map_id,player_att_x,player_att_y = GetWorldPos()
		--改行相生相克对应的X\Y坐标获取
		att_x_distance_num = abs(player_att_x - Tb_5_element_coordinate[doa_element_seq][1])
		att_y_distance_num = abs(player_att_y - Tb_5_element_coordinate[doa_element_seq][2])
		--玩家是否在相生相克位置判断
		if att_x_distance_num <= 5 and att_y_distance_num <= 5 and  (abs(att_x_distance_num) + abs(att_y_distance_num)) <= 5 then
			return PlayerIndex
		end
	end 
	return 0
end
--五行生发生
function element_alive_deal()
	local boss_index = 0
	for i = MS_boss_index_gold,MS_boss_index_soil do
		boss_index = GetMissionV(i)
		if boss_index ~= 0 and boss_index ~= nil then
			Zgc_pub_mission_boss_life_chg(boss_index,1,Boss_life_reduce_percent)
		end
	end
end
--五行克发生
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
--新的五行阵使创建
--在系统触发器调用的时候也要检测是否可以创建新的五行使者
function element_crt()
	--创建的五行使者的序号
	local map_id =  SubWorldIdx2ID(SubWorld)
	--清除小怪
	local npc_total_index = GetMapNpcIdx(map_id)
	local npc_num = getn(npc_total_index)
	if npc_num > 1 then
		for i = 1,npc_num do
			local npc_name = GetNpcName(npc_total_index[i])
			if strsub(npc_name,3,6) == "K? s?" then
				SetNpcLifeTime(npc_total_index[i],0)
			end		
		end
	end
	local element_crt_seq = GetMissionV(20+(GetMissionV(Ms_boss_crt_state)+1))
	local boss_index = CreateNpc(Tb_5_element_coordinate[element_crt_seq][5],Tb_5_element_coordinate[element_crt_seq][6],map_id,Tb_5_element_coordinate[element_crt_seq][1],Tb_5_element_coordinate[element_crt_seq][2])
	SetNpcScript(boss_index,Main_Npc_Script_way)
	--存索引
	SetMissionV((10 + element_crt_seq),boss_index)
	--创建顺序+1
	SetMissionV(Ms_boss_crt_state,(GetMissionV(Ms_boss_crt_state) + 1))
	--第五关loop_num初始化
	SetMissionV(Ms_stage5_loop_num,0)
	Zgc_pub_mission_fun(MS_ID,"StopTimeGuage(2)")
end
--主死亡脚本
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
--死亡处理脚本
function stage5_element_death(element_seq)
	--如果已经干掉完了
	if GetMissionV(Ms_element_killed_num) == 4 then
		Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"To祅 b? 'Ng? H祅h Tr薾 S?' b? ti猽 di謙, qua 秈 n祔!\")")
		
		local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
		PlayerIndex = GetTeamMember(0)
		if PlayerIndex ~= 0 then
			AddGlobalNews("T筰"..GetName().."Chi課 u gian kh?, cu鑙 c飊g nh b筰 'Ng? H祅h Tr薾 S?', vt 秈 th祅h c玭g"..Stage_info[stage_seq].stage_name..".")
		end
		
		local nMapID = SubWorldIdx2ID(SubWorld)
		ClearMapNpc(nMapID)
		--准备关结束
		--test
		local mission_count = GetMapTaskTemp(nMapID,1)
		WriteLog("[秈 T﹜ B綾] th鑞g k? qua 秈: ID 秈	"..stage_seq..":"..nMapID..":"..mission_count.."	Th阨 gian qua 秈	"..Zgc_pub_time_sec_change(((189-GetMissionV(MS_TIMMER_LOOP_ID))* 10),1))
		Zgc_pub_mission_fun(MS_ID,"Ms_stage_prize()")
		SetMissionV(MS_TIMMER_LOOP_ID,6)
		--stage_mission_fail(5)
	else
		--死掉的五行阵使数量+1
		SetMissionV(Ms_element_killed_num,(GetMissionV(Ms_element_killed_num)+1))
		--去掉对应的索引
		SetMissionV((10 + element_seq),0)
		--创建下一阶段的五行阵使（要注意区分由流程创建和死亡脚本创建的）
		--判断下一阶段的NPC是否已经由流程创建完毕，如果没有则创建
		--进行是否还有五行使存在的判断
		--五行使被杀死是否创建的条件为：是否还有五行使存在，如果没有则创建，反之亦然
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
--NPC对话信息
--五行使者的对话
function stage5_5_element_dia()
	Talk(1,"","<color=green>"..GetTargetNpcName().."<color>: C竎 ngi h玬 nay ch誸 trong tay ta, c騨g kh玭g oan u鎛g!")
end
