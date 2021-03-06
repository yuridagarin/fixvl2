--策划人：陈公子
--代码开发人：村长
--代码开发时间：2007-08-06
	MS_boss_index = 10
	grass_index_TasktempID = 188		--存放草的索引
	grass_id_state = 0					--存放该草目前的状态，0为初始状态，1为使用拔出状态
	grass_id_sys_time = 1			--存放该操上次操作的时间，与上一条配合完成占有机制
	grass_kill_num = 1424			--拔除了多少药人草
	Tb_grass_crt_info = {
		{1584,3170,80},
		{1610,3157,80},
		{1588,3233,80},
		{1623,3229,80},
		{1599,3199,80},
	}
function stage4_boss_create()
	local map_id =  SubWorldIdx2ID(SubWorld)
	local npc_index = CreateNpc(Tb_Monster_info[4][1][1],Tb_Monster_info[4][1][2],map_id,Tb_Monster_info[4][1][3],Tb_Monster_info[4][1][4])
	SetNpcScript(npc_index,Main_Npc_Script_way)
	SetMissionV(MS_boss_index,npc_index)
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"K誸 th骳 vt 秈 c遪\",1830,0,1)")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Th阨 gian Dc Nh﹏ Th秓 xu蕋 hi謓\",30,0,2)")
end
--药人草创建
function stage4_grass_crt()
	local boss_index = GetMissionV(MS_boss_index)
	NpcChat(boss_index,"C竎 ngi mu鑞 di謙 Dc Nh﹏ Th秓 c馻 ta, ng l? m? gi鱝 ban ng祔!")
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Dc Nh﹏ Th秓 產ng t╪g trng m筺h, Dc Vng h譶h nh?  h祅h ng, c莕 nhanh ch鉵g ti猽 h駓. Dc Nh﹏ Th秓 c鵦 c, n誹 b? d輓h v祇 th? ph秈 c萵 th薾.\")")
	local map_id =  SubWorldIdx2ID(SubWorld)
	local palyer_num = GetMissionV(MS_PLAYER_NUM)
	--随机出主创建坐标
	local main_crt_coordinate_seq = random(1,getn(Tb_grass_crt_info))
	for i = 1,getn(Tb_grass_crt_info) do
		local grass_num,grass_index = 0,{}
		if i == main_crt_coordinate_seq then
			grass_num,grass_index = CreateNpc(Tb_Monster_info[4][2][1],Tb_Monster_info[4][2][2],map_id,Tb_grass_crt_info[i][1],Tb_grass_crt_info[i][2],-1,(palyer_num*6),1,Tb_grass_crt_info[i][3])
		else
			grass_num,grass_index = CreateNpc(Tb_Monster_info[4][2][1],Tb_Monster_info[4][2][2],map_id,Tb_grass_crt_info[i][1],Tb_grass_crt_info[i][2],-1,floor(palyer_num*6/4),1,Tb_grass_crt_info[i][3])
		end
		for i = 0,getn(grass_index) do
			SetNpcScript(grass_index[i],Main_Npc_Script_way)
		end
	end
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Th阨 gian ch? t筼 Dc Nh﹏ Vng\",120,0,2)")
end
--药人草转换药人
function stage4_grass_chg()
	--是否需要创建药人判断
	local map_id =  SubWorldIdx2ID(SubWorld)
	local npc_total_index = GetMapNpcIdx(map_id)
	local grass_num = 0
	--统计药草数量
	for i = 1,getn(npc_total_index) do
		if GetNpcName(npc_total_index[i]) == "Dc Nh﹏ Th秓"  then
			grass_num = grass_num + 1
			SetNpcLifeTime(npc_total_index[i],0)
		end
	end
	--刷药人王
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Th阨 gian tr飊g sinh Dc Nh﹏ Th秓\",180,0,2)")
	if grass_num > 0 then
		local player_index_total = mf_GetMSPlayerIndex(MS_ID,0,map_id)
		local devil_gress_num = min(stage_devil_restrict(),floor(grass_num * 1.5))
		for i = 1, devil_gress_num do
			PlayerIndex = player_index_total[mod(i,getn(player_index_total))+1]
			local mapID,att_x,att_y = GetWorldPos()
			if map_id == mapID then
				local npc_inex = CreateNpc(Tb_Monster_info[4][3][1],Tb_Monster_info[4][3][2],mapID,att_x,att_y,-1,1,1,30)
				SetNpcScript(npc_inex,Main_Npc_Script_way)
			end
		end
		local boss_index = GetMissionV(MS_boss_index)
		NpcChat(boss_index,"Ch? c? Dc Nh﹏ m韎 c? m譶h ng da s総!")
		Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Dc Vng ch? Dc Nh﹏ Th秓 th祅h Dc Nh﹏ Vng, uy l鵦 kh玭g y誹! Nhanh ti猽 di謙 甶!\")")
	end
end
--boss死亡调用函数，过关
function stage4_boss_death()
	--奖励给于函数
	--发消息
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Ti猽 di謙 'Dc Vng', i ng? vt 秈 th祅h c玭g!\")")
	
	local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex ~= 0 then
		AddGlobalNews("T筰"..GetName().."Chi課 u gian kh?, cu鑙 c飊g nh b筰 'Dc Vng', vt 秈 th祅h c玭g"..Stage_info[stage_seq].stage_name..".")
	end
	
	--拔药草数量清0
	Zgc_pub_mission_fun(MS_ID,"SetTask("..grass_kill_num..",0)")
	--删除buff
	Zgc_pub_mission_fun(MS_ID,"RemoveState(19801223)")
	--删除称号
	for i = 21,25 do
		Zgc_pub_mission_fun(MS_ID,"RemoveTitle(60,"..i..")")
	end
	--准备关卡结束
	local nMapID = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(nMapID)
	--test
	local mission_count = GetMapTaskTemp(nMapID,1)
	WriteLog("[秈 T﹜ B綾] th鑞g k? qua 秈: ID 秈	"..stage_seq..":"..nMapID..":"..mission_count.."	Th阨 gian qua 秈	"..Zgc_pub_time_sec_change(((189-GetMissionV(MS_TIMMER_LOOP_ID))* 10),1))
	Zgc_pub_mission_fun(MS_ID,"Ms_stage_prize()")
	SetMissionV(MS_TIMMER_LOOP_ID,6)
	--stage_mission_fail(4)
end
	--药人死亡脚本
function stage4_devil_death()
	local map_id =  SubWorldIdx2ID(SubWorld)
	local npc_total_index = GetMapNpcIdx(map_id)
	local devil_num = 0 
	for i = 1,getn(npc_total_index) do
		if GetNpcName(npc_total_index[i]) == "Dc Nh﹏" and IsNpcDeath(npc_total_index[i]) ~= 1  then
			devil_num = devil_num + 1
		end
	end 
	if devil_num > 1 then
		return
	end
	--删除buff
	Zgc_pub_mission_fun(MS_ID,"RemoveState(19801223)")
	--拔药草数量清0
	Zgc_pub_mission_fun(MS_ID,"SetTask("..grass_kill_num..",0)")
	--删除称号
	for i = 21,25 do
		Zgc_pub_mission_fun(MS_ID,"RemoveTitle(60,"..i..")")
	end
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Х h駓 to祅 b? 'Dc Nh﹏ Vng' do Dc Vng t筼 ra, c c馻 Dc Nh﹏ Th秓  gi秈!\")")
end
	--药人草对话函数
function stage4_grass_dia()
	--草索引的获取和检测
	local npc_index = GetTargetNpc()
	if npc_index == 0 then
		return
	end
	if GetNpcName(npc_index) ~= "Dc Nh﹏ Th秓" then
		return
	end
	--占有判断和设置
	if GetUnitCurStates(npc_index,grass_id_state) == 1 and (GetTime() - GetUnitCurStates(npc_index,grass_id_sys_time)) <= 10 then
		Talk(1,"","<color=green>Nh綾 nh?<color>: уng i  d鋘 <color=yellow>Dc Nh﹏ Th秓<color> n祔, "..Zgc_pub_sex_name().."Sao kh玭g i c﹜ kh竎!")
		return
	end
	SetTaskTemp(grass_index_TasktempID,npc_index)
	SetUnitCurStates(npc_index,grass_id_state,1)
	SetUnitCurStates(npc_index,grass_id_sys_time,GetTime())
	DoWait(11,12,10)
end
