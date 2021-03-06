--脚本名称：西北区关卡第一关
--脚本功能：关卡的主要逻辑
--策划人：陈公子
--代码开发人：村长
--代码开发时间：2007-08-06
--==公共变量定义区
	MS_boss_index = 10
	MS_blood_monster_num = 11
	MS_dragon_fox_num = 12
	Monter_num = {5,3}
	Camp_player = "nw_player"			--玩家阵营的字符串
	Camp_monster = "nw_monster"		--怪物阵营的字符串
	Tb_camp_player_attr_add = {		--玩家阵营需要增加的魔法属性
		--魔法属性字符串-属性值-时间（帧）-是否替换-属性ID
		{"state_move_speed_percent_add",250,2160,0,19801224},
		{"state_dispear", 1, 2160, 0,19801225},
		--{"state_shadow_run", 2565, 2160,0,19801226},
	}
	Tb_camp_monster_attr_add = {	--怪物阵营需要增加的魔法属性
		--魔法属性字符串-属性值-时间（帧）-是否替换-属性ID
		--{"state_shadow_run", 2565, 2160,0,19801227},
	}
	Npc_del_name = {" Nh藅 S? ","Minh Nh藅 S?","Li謙 Nhan Li Long","X輈h Luy謓 H醓 H?"}
--第一步：boss创建
function stage1_boss_create()
	local nMapID = SubWorldIdx2ID(SubWorld)
	--关卡状态设置为开始状态
	SetMissionV(MS_STATE_ID,MS_state_running)
	--所有玩家加入"player"阵营
	Zgc_pub_mission_fun(MS_ID,"SetCampToPlayer(\"nw_player\")")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"K誸 th骳 vt 秈 c遪\",1830,0,1)")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Tr筺g th竔 h醓 luy謓 c遪\",30,0,2)")
	--boss创建并加入怪物阵营
	local boss_index = CreateNpc(Tb_Monster_info[1][1][1],Tb_Monster_info[1][1][2],nMapID,Tb_Monster_info[1][1][3],Tb_Monster_info[1][1][4],-1,1,1,Tb_Monster_info[1][1][5])
	SetMissionV(MS_boss_index,boss_index)
	SetNpcScript(boss_index,Main_Npc_Script_way)
	SetCampToNpc(boss_index,Camp_monster)
end
function stage1_boss_add_shadow_buff()
	local boss_index = GetMissionV(MS_boss_index)
	CastState2Npc(boss_index,"state_shadow_run", 2565, 2160,0,19801226)
end
--第二步：修改boss阵营，创建小怪
function sun_moon_monster_create()
	--修改boss为NPC阵营
	boss_camp_chg(Camp_player)
	--怪物创建并加入monster阵营
	local monster_num = ((GetMissionV(MS_PLAYER_NUM)) * 5)
	--初始化写入下一阶段创建血魔人的数量
	SetMissionV(MS_blood_monster_num,monster_num)
	local nMapID = SubWorldIdx2ID(SubWorld)
	for i = 1, monster_num do
		local ran_num = random(3,4)
		local monster_index = CreateNpc(Tb_Monster_info[1][ran_num][1],Tb_Monster_info[1][ran_num][2],nMapID,Tb_Monster_info[1][ran_num][3],Tb_Monster_info[1][ran_num][4],-1,1,1,Tb_Monster_info[1][ran_num][5])
		SetNpcScript(monster_index,Main_Npc_Script_way)
		SetCampToNpc(monster_index,Camp_monster)
	end
	local boss_index = GetMissionV(MS_boss_index)
	NpcChat(boss_index,"T蕋 c? sinh linh trong C? Dng чng, d飊g m竨 c竎 ngi  r鯽 t閕 竎 c馻 ta!")
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"? ch? C? Dng Th? y誹 d莕, tr? n猲 甶猲 cu錸g, r琲 v祇 tr筺g th竔 kh鑞g ch?!\")")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Tr筺g th竔 nh藀 c遪\",120,0,2)")
end
--第三步：清小怪，创建血魔人
function blood_monster_create()
	local nMapID = SubWorldIdx2ID(SubWorld)
	--boss转换
	boss_camp_chg(Camp_monster)
	--小怪清除
	map_npc_clear()
	--血魔人的创建
	local blood_monster_num = GetMissionV(MS_blood_monster_num)
	if blood_monster_num > 1 then
		local monster_num,monster_index = CreateNpc(Tb_Monster_info[1][5][1],Tb_Monster_info[1][5][2],nMapID,Tb_Monster_info[1][5][3],Tb_Monster_info[1][5][4],-1,blood_monster_num,1,Tb_Monster_info[1][5][5])
		for i = 0,getn(monster_index) do
			SetNpcScript(monster_index[i],Main_Npc_Script_way)
			--SetCampToNpc(monster_index[i],Camp_monster)
		end
	elseif blood_monster_num == 1 then
		local monster_index = CreateNpc(Tb_Monster_info[1][5][1],Tb_Monster_info[1][5][2],nMapID,Tb_Monster_info[1][5][3],Tb_Monster_info[1][5][4],-1,blood_monster_num,1,Tb_Monster_info[1][5][5])
		SetNpcScript(monster_index,Main_Npc_Script_way)
	end
	local boss_index = GetMissionV(MS_boss_index)
	NpcChat(boss_index,"Sinh Linh! M竨 c馻 c竎 ngi  h遖 quy謓 v韎 m竨 ta, mau 甶 甶!")
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"C? Dng Th? nh藀 v祇 ngi, bi課 th祅h Huy誸 Ma Nh﹏, ph秈 mau ti猽 di謙!\")")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Tr筺g th竔 h醓 luy謓 c遪\",180,0,2)")
end
--第四步：创建所有小怪
function all_monster_create()
	local nMapID = SubWorldIdx2ID(SubWorld)
	--boss阵营转换
	boss_camp_chg(Camp_player)
	--开始创建怪物
	local player_num = GetMissionV(MS_PLAYER_NUM)
	local monster_num = (player_num * 5)
	local dragon_fox_num = (player_num * 3)
	for i = 1, monster_num do
		local ran_num = random(3,4)
		local monster_index = CreateNpc(Tb_Monster_info[1][ran_num][1],Tb_Monster_info[1][ran_num][2],nMapID,Tb_Monster_info[1][ran_num][3],Tb_Monster_info[1][ran_num][4],-1,1,1,Tb_Monster_info[1][ran_num][5])
		SetNpcScript(monster_index,Main_Npc_Script_way)
		SetCampToNpc(monster_index,Camp_monster)
	end
		--保存怪物的数量，在死亡脚本里面减少
		SetMissionV(MS_blood_monster_num,monster_num)
	for i = 1,dragon_fox_num do
		local ran_num = random(6,7)
		local monster_index = CreateNpc(Tb_Monster_info[1][ran_num][1],Tb_Monster_info[1][ran_num][2],nMapID,Tb_Monster_info[1][ran_num][3],Tb_Monster_info[1][ran_num][4],-1,1,1,Tb_Monster_info[1][ran_num][5])
		SetNpcScript(monster_index,Main_Npc_Script_way)
		SetCampToNpc(monster_index,Camp_monster)
	end
	--保存龙和狐狸的数量，在死亡脚本里面减少
	SetMissionV(MS_dragon_fox_num,dragon_fox_num)
	local boss_index = GetMissionV(MS_boss_index)
	NpcChat(boss_index,"T蕋 c? sinh linh trong C? Dng чng, d飊g m竨 c竎 ngi  r鯽 t閕 竎 c馻 ta!")
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"? ch? C? Dng Th? y誹 d莕, tr? n猲 甶猲 cu錸g, r琲 v祇 tr筺g th竔 kh鑞g ch?!\")")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Tr筺g th竔 nh藀 c遪\",120,0,2)")
end
--第五步，创建血魔人，boss回血（以后一直重复第四步和第五步，直到关卡结束）
function blood_monster_recreate()
	local nMapID = SubWorldIdx2ID(SubWorld)
	--boss阵营转换
	boss_camp_chg(Camp_monster)
	--创建血魔人
	local blood_num = GetMissionV(MS_blood_monster_num)
	if blood_num > 1 then
		local monster_num,monster_index = CreateNpc(Tb_Monster_info[1][5][1],Tb_Monster_info[1][5][2],nMapID,Tb_Monster_info[1][5][3],Tb_Monster_info[1][5][4],-1,blood_num,1,Tb_Monster_info[1][5][5])
		for i = 0,getn(monster_index) do
			SetNpcScript(monster_index[i],Main_Npc_Script_way)
		end
	elseif blood_num == 1 then
		local devil_index = CreateNpc(Tb_Monster_info[1][5][1],Tb_Monster_info[1][5][2],nMapID,Tb_Monster_info[1][5][3],Tb_Monster_info[1][5][4],-1,blood_num,1,Tb_Monster_info[1][5][5])
		SetNpcScript(devil_index,Main_Npc_Script_way)
	end
	--删除掉龙和狐狸后
	map_npc_clear()
	--计算没有被玩家杀掉的龙和狐狸，给boss+血
	local df_num_remain = GetMissionV(MS_dragon_fox_num)
	if df_num_remain ~= 0 then
		Zgc_pub_mission_boss_life_chg(GetMissionV(MS_boss_index),1,df_num_remain)
	end
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"M竨 c馻 sinh v藅 trong C? Dng чng gi髉 C? Dng Th? h錳 ph鬰!\")")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Tr筺g th竔 h醓 luy謓 c遪\",180,0,2)")
end
--第七步：光卡时间结束，所有玩家清理
function stage1_mission_end()
	local nMapID = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	for i = 1,getn(player) do
		Ms_log_out_set_state()
		NewWorld(Stage_info[1].log_out_coordinate[1],Stage_info[1].log_out_coordinate[2],Stage_info[1].log_out_coordinate[3])
	end
end
--boss阵营转换函数
function boss_camp_chg(boss_camp)
	--boss重新创建
	local boss_index = GetMissionV(MS_boss_index)
	--获得boss的血量
	local max_life_num,life_num = GetUnitCurStates(boss_index,1)
	--地图npc清空
	local nMapID = SubWorldIdx2ID(SubWorld)
	--ClearMapNpc(nMapID)
	--修改boss血量
	--确定boss类型
	local boss_diff = 2
	if boss_camp == "nw_monster" then
		boss_diff = 1
	end
	local new_boss_index = CreateNpc(Tb_Monster_info[1][boss_diff][1],Tb_Monster_info[1][boss_diff][2],nMapID,Tb_Monster_info[1][boss_diff][3],Tb_Monster_info[1][boss_diff][4],-1,1,1,Tb_Monster_info[1][boss_diff][5])
	ModifyNpcData(new_boss_index,0,life_num,0)
	SetNpcScript(new_boss_index,Main_Npc_Script_way)
	--修改boss阵营
	SetCampToNpc(new_boss_index,boss_camp)
	--增加boss buff
	if boss_camp == "nw_player" then
		for i = 1,getn(Tb_camp_player_attr_add) do
			CastState2Npc(new_boss_index,Tb_camp_player_attr_add[i][1],Tb_camp_player_attr_add[i][2],Tb_camp_player_attr_add[i][3],Tb_camp_player_attr_add[i][4],Tb_camp_player_attr_add[i][5])
		end
	elseif boss_camp == "nw_monster" then
		for i = 1,getn(Tb_camp_monster_attr_add) do
			CastState2Npc(new_boss_index,Tb_camp_monster_attr_add[i][1],Tb_camp_monster_attr_add[i][2],Tb_camp_monster_attr_add[i][3],Tb_camp_monster_attr_add[i][4],Tb_camp_monster_attr_add[i][5])
		end
	end
	SetMissionV(MS_boss_index,new_boss_index)
	SetNpcLifeTime(boss_index,0)
	return
end
--map:npc清理
function map_npc_clear()
	local nMapID = SubWorldIdx2ID(SubWorld)
	local npc_total_index = GetMapNpcIdx(nMapID)
	local npc_num = getn(npc_total_index)
	if npc_num < 1 then
		return
	else
		for i = 1,npc_num do
			for j = 1,getn(Npc_del_name) do
				if GetNpcName(npc_total_index[i]) == Npc_del_name[j] then
					SetNpcLifeTime(npc_total_index[i],0)
				end
			end
		end
	end
end
--BOSS死亡脚本
function stage1_boss_death()
	--奖励给于函数
	--发消息
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Ti猽 di謙 th祅h c玭g 'C? Dng Th?', i ng? vt 秈 th祅h c玭g!\")")
	
	local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex ~= 0 then
		AddGlobalNews("T筰"..GetName().."Chi課 u gian kh?, cu鑙 c飊g nh b筰 'C? Dng Th?', vt 秈 th祅h c玭g"..Stage_info[stage_seq].stage_name..".")
	end
	
	local nMapID = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(nMapID)
	--准备关卡结束
	local mission_count = GetMapTaskTemp(nMapID,1)
	WriteLog("[秈 T﹜ B綾] th鑞g k? qua 秈: ID 秈	"..stage_seq..":"..nMapID..":"..mission_count.."	Th阨 gian qua 秈	"..Zgc_pub_time_sec_change(((189-GetMissionV(MS_TIMMER_LOOP_ID))* 10),1))
	Zgc_pub_mission_fun(MS_ID,"Ms_stage_prize()")
	SetMissionV(MS_TIMMER_LOOP_ID,6)
end
--暗日使和明月使死亡脚本
function stage1_sun_moon_death()
	--如果是玩家杀死则存在数量-1
	if PlayerIndex > 0 then
		SetMissionV(MS_blood_monster_num,(GetMissionV(MS_blood_monster_num)-1))
	end
	PlayerIndex = 0
end
--狐狸和龙死亡脚本
function stage1_dragon_fox_death(index)
	--如果是玩家杀死则存在数量-1
	if PlayerIndex > 0 then
		SetMissionV(MS_dragon_fox_num,(GetMissionV(MS_dragon_fox_num)-1))
	end
	PlayerIndex = 0
end
