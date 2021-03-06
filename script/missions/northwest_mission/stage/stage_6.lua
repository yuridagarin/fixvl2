--脚本名称：西北关卡第六关
--脚本功能：第六关主逻辑
--功能策划人：陈公子
--功能开发人：村长
--功能测试人：杨聪
--代码开发时间：2007-12-13
--代码修改时间：
MS_boss_index = 10				--boss索引
MS_stage6_boss_life = 11					--boss血量
Ms_stage6_step_boss = 12				--(肉的当前状态)
Ms_stage6_step_shandow = 13 		--(幻影的状态情况:0为当前boss已经死亡，其余为各个步骤的幻影)
Ms_stage6_shandow_index = 14		--幻象索引
Ms_stage6_real_box_seq = 15			--箱子随机序号记录ID
Ms_stage6_shandow_crt_loop = 16	--创建幻象的
Ms_stage6_box_crt_loop = 17			--创建箱子
Tb_boss_life_fun_info = {0.9,0.7,0.5,0.3,0.1}
--幻象的信息
Tb_shadow_info = {
	{"Th鑞g l躰h tng binhHoanTng ","Th鑞g l躰h tng binhHoanTng ",1614,3217},
	{"Huy誸 Ma Nh﹏Hoan Tng ","Huy誸 Ma Nh﹏Hoan Tng ",1614,3217},
	{"Tr蕁 m? Tng qu﹏Hoan Tng ","Tr蕁 m? Tng qu﹏Hoan Tng ",1614,3217},    
	{"Tr蕁 M? Th驢oan Tng ","Tr蕁 M? Th驢oan Tng ",1614,3217},
	{"Qu? Tng uHoan Tng ","Qu? Tng uHoan Tng ",1614,3217},
}
--箱子和寻宝人的坐标
 Tb_box_info = {
	{1620,3206,1629,3225},
	{1624,3245,1601,3252},
	{1581,3243,1574,3223},
	{1583,3199,1600,3194},
 }
 --幻影每10秒扣除的血量百分比
 shadow_reduce_life_per_10s = 0.05

 Tb_stage6_boss_info = {
		{"Sa M筩 Hoan Tng 秈 1","Nguy猲 h譶h 秓 秐h (t躰h m辌h)",1614,3217},
		{"Sa M筩 Hoan Tng 秈 2","Nguy猲 h譶h 秓 秐h (th莕)",1614,3217},
	}
  -------------------------------------------系统逻辑区------------------------------------------
 --第一步：关卡准备
 function stage6_ready()
	--删除破幻镜
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"秈 b総 u c遪\",30,0,1)")
 end
 --第一步：boss创建
 function stage6_boss_crt()
	local boss_diff = 1
	local step_now = GetMissionV(Ms_stage6_step_shandow) 
	if step_now == 5 then
		boss_diff = 2
	end
	--创建boss
	local map_id = SubWorldIdx2ID(SubWorld)
	local boss_index = CreateNpc(Tb_stage6_boss_info[boss_diff][1],Tb_stage6_boss_info[boss_diff][2],map_id,Tb_stage6_boss_info[boss_diff][3],Tb_stage6_boss_info[boss_diff][4])
	SetNpcScript(boss_index,Main_Npc_Script_way)
	SetMissionV(MS_boss_index,boss_index)
	--判断是否是第一次刷出boss，如果不是则需修改血量
	if step_now == 0 or step_now == nil then
		--时间进度条显示 
		Zgc_pub_mission_fun(MS_ID,"BigDelItem(2,0,1041,BigGetItemCount(2,0,1041))")
		Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"K誸 th骳 vt 秈 c遪\",1830,0,1)")
		Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"秓 gi竎 xu蕋 hi謓 c遪\",30,0,2)")
		local time_loop_num = GetMissionV(MS_TIMMER_LOOP_ID)
		--SetMissionV(Ms_stage6_box_crt_loop,0)
		--第一次不刷出幻象，由系统调用刷出
		SetMissionV(Ms_stage6_shandow_crt_loop,-1)
	else
			local life_num = GetMissionV(MS_stage6_boss_life)
			local max_life_num = GetUnitCurStates(boss_index,1)
			local remain_life_num_max = max(life_num,floor(Tb_boss_life_fun_info[step_now]*max_life_num))
			ModifyNpcData(boss_index,0,remain_life_num_max,0)
		if step_now == 5 then
			SetMissionV(Ms_stage6_step_shandow,(step_now + 1))
			NpcChat(boss_index,"C竎 ngi th藅 to gan, xem b穙 c竧 y!")
			Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"秓 秐h sa m筩 hi謓 nguy猲 h譶h, c萵 th薾 i ph?!\")")
		else
			Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"D飊g gng 秓 秐h th祅h c玭g ph? h駓 秓 秐h, 秓 秐h dng nh?  hi謓 nguy猲 h譶h!\")")
		end
	end
 end
 --主逻辑，每10s调用一次，基本逻辑都在里面
 function shadow_reduce_life()
 	local step_now = GetMissionV(Ms_stage6_step_shandow) 
	if step_now > 5 then
		return
	end
	--创建幻象
	local shandow_crt_loop_num = GetMissionV(Ms_stage6_shandow_crt_loop)
	if shandow_crt_loop_num == 0 then
		stage6_shadow_crt()
	end
	SetMissionV(Ms_stage6_shandow_crt_loop,(shandow_crt_loop_num - 1))
	--创建宝箱和扣血
	local box_crt_loop_num = GetMissionV(Ms_stage6_box_crt_loop)
	local shadow_index = GetMissionV(Ms_stage6_shandow_index)
	--是否是幻象时间
	if shadow_index == 0 and shadow_index == nil then
		return
	else
		if mod(box_crt_loop_num,3) == 0  then
			stage6_box_crt()
		end
		SetMissionV(Ms_stage6_box_crt_loop,(box_crt_loop_num - 1))
		--幻象扣血
		local shadow_index = GetMissionV(Ms_stage6_shandow_index)
		if shadow_index == 0 then
			return
		end
		--血量获取和计算
		local max_life_num,life_num = GetUnitCurStates(shadow_index,1)
		local need_reduce_life = floor(max_life_num * shadow_reduce_life_per_10s)
		if need_reduce_life >= life_num  then
			SetNpcLifeTime(shadow_index,0)
			shadow_recrt()
		else		--继续扣血
			ModifyNpcData(shadow_index,0,(life_num - need_reduce_life),0)
		end
	end
 end
 --第二步：创建各个幻象
 function stage6_shadow_crt()
	--信息提示
	local boss_index = GetMissionV(MS_boss_index)
	NpcChat(boss_index,"秓 秐h m? ho芻, c竎 ngi c? th? ph? 秐h trong t﹎ kh玭g? B穙 c竧 產ng k衞 n!")	
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"秓 秐h sa m筩 bi課 h鉧 qua nh鱪g tr筺g th竔 kh竎 nhau, xem ra kh玭g d? ti猽 di謙.\")")
	Zgc_pub_mission_fun(MS_ID,"StopTimeGuage(2)")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"B秓 rng xu蕋 hi謓 c遪\",30,0,2)")
	--幻象步骤
	local step_now = GetMissionV(Ms_stage6_step_shandow) + 1
	--获取boss信息
		--如果boss已经被杀死，则血量保存为0
		SetNpcLifeTime(boss_index,0)
	if GetNpcName(boss_index) ~= Tb_stage6_boss_info[1][2] then
		SetMissionV(MS_stage6_boss_life,0)
	else
		--获得boss的血量
		local max_life_num,life_num = GetUnitCurStates(boss_index,1)
		--在创建的时候再对boss血量进行处理
		SetMissionV(MS_stage6_boss_life,life_num)
	end
	--创建幻象
	local map_id = SubWorldIdx2ID(SubWorld)
	local shadow_index = CreateNpc(Tb_shadow_info[step_now][1],Tb_shadow_info[step_now][2],map_id,Tb_shadow_info[step_now][3],Tb_shadow_info[step_now][4])
 	SetNpcScript(shadow_index,Main_Npc_Script_way)
	SetMissionV(Ms_stage6_step_shandow,step_now)
	SetMissionV(Ms_stage6_shandow_index,shadow_index)
	SetMissionV(Ms_stage6_box_crt_loop,2)
end
--创建寻宝人和宝箱
function stage6_box_crt()
	--创建寻宝人
	local map_id =  SubWorldIdx2ID(SubWorld)
	--创建宝箱
	if break_shadow_goods_chk() == 0  then 
		if GetMissionV(Ms_stage6_shandow_index) ~= 0 then
			--没有破幻镜，继续创建
			Zgc_pub_mission_fun(MS_ID,"StopTimeGuage(2)")
			Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"B秓 rng xu蕋 hi謓 c遪\",30,0,2)")
			--开始创建
			local box_index = 0
			for i = 1,getn(Tb_box_info) do
				box_index = CreateNpc("Sa m筩 b秓 rng","Sa m筩 b秓 rng",map_id,Tb_box_info[i][1],Tb_box_info[i][2])
				SetNpcScript(box_index,Main_Npc_Script_way)
				SetNpcLifeTime(box_index,5)
			end
			--确认开第几个箱子的时候获得破幻镜
			SetMissionV(Ms_stage6_real_box_seq,random(1,4))
		end
	else
		local npc_index = 0
		for i = 1,getn(Tb_box_info) do
			if stage_devil_restrict() ~= 0 then
				npc_index = CreateNpc("秈 T莔 B秓 Nh﹏","T莔 B秓 Nh﹏",map_id,(Tb_box_info[i][3]+random(-2,2)),(Tb_box_info[i][4]+random(-2,2)))
				SetNpcScript(npc_index,Main_Npc_Script_way)
			end
		end
	end
end
 --------------------------------------公共函数区-------------------------------------
 --幻象复活
 function shadow_recrt()
	local map_id =  SubWorldIdx2ID(SubWorld)
	local shadow_step = GetMissionV(Ms_stage6_step_shandow)
	local shadow_index = CreateNpc(Tb_shadow_info[shadow_step][1],Tb_shadow_info[shadow_step][2],map_id,Tb_shadow_info[shadow_step][3],Tb_shadow_info[shadow_step][4])
	SetNpcScript(shadow_index,Main_Npc_Script_way)
	SetMissionV(Ms_stage6_shandow_index,shadow_index)
	NpcChat(shadow_index,"Ngi b? m? ho芻, r蕋 kh? ph? gi秈 t﹎ ma.")
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"秓 秐h l筰 t竔 sinh, ch璦 ti猽 di謙 ho祅 to祅!\")")
 end
--boss喊话
 function stage6_boss_chat()
	NpcChat(GetMissionV(MS_boss_index),Stage_info[6].boss_chat[random(1,getn(Stage_info[6].boss_chat))])
 end
 -------------------------------------------其它处理区------------------------------------------
 --箱子对话
 function stage6_box_dialog()
	local box_index = GetTargetNpc()
	--对话则消失
	SetNpcLifeTime(box_index,0)
	if break_shadow_goods_chk() ~= 0 then
		return
	else
		--是否是增加镜子的箱子
		local box_step = (GetMissionV(Ms_stage6_real_box_seq) - 1)
		if box_step <= 0 then
			if AddItem(2,0,1041,1) == 1 then
				Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().."Trong b秓 rng nh薾 頲 b秓 v藅 gng 秓 秐h d飊g  ph? h駓 秓 秐h.\")")
				Zgc_pub_mission_fun(MS_ID,"StopTimeGuage(2)")
				SetMissionV(Ms_stage6_real_box_seq,-1)
			end
		else
			SetMissionV(Ms_stage6_real_box_seq,box_step)
		end
	end
 end
 --幻象死亡
 function stage6_shadow_death(shadow_seq)
	if PlayerIndex ~= break_shadow_goods_chk() then
		shadow_recrt()
	else
		--创建下一阶段的boss
		BigDelItem(2,0,1041,BigGetItemCount(2,0,1041))
		SetMissionV(Ms_stage6_shandow_index,0)
		SetMissionV(Ms_stage6_shandow_crt_loop,3)
		stage6_boss_crt()
	end
 end
 --boss在沉寂状态死亡
 function stage6_boss_slience_death()
	SetMissionV(MS_boss_index,0)
 end
 --boss死亡
 function stage6_boss_death()
	--奖励给于函数
	--发消息
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Ti猽 di謙 '秓 秐h Nguy猲 H譶h (th莕)', i ng? vt 秈 th祅h c玭g!\")")
	
	local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex ~= 0 then
		AddGlobalNews("T筰"..GetName().."Chi課 u gian kh?, cu鑙 c飊g nh b筰 '秓 秐h Nguy猲 H譶h (th莕)', vt 秈 th祅h c玭g"..Stage_info[stage_seq].stage_name..".")
	end

	local nMapID = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(nMapID)
	--准备关卡结束
	local mission_count = GetMapTaskTemp(nMapID,1)
	WriteLog("[秈 T﹜ B綾] th鑞g k? qua 秈: ID 秈	"..stage_seq..":"..nMapID..":"..mission_count.."	Th阨 gian qua 秈	"..Zgc_pub_time_sec_change(((189-GetMissionV(MS_TIMMER_LOOP_ID))* 10),1))
	Zgc_pub_mission_fun(MS_ID,"Ms_stage_prize()")
	SetMissionV(MS_TIMMER_LOOP_ID,6)
	--stage_mission_fail(6) 
end
 ------------------------------------------------公共函数区--------------------------------------
  --是否有玩家持有破幻镜检测函数
 function break_shadow_goods_chk()
	local map_id =  SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,map_id)
	local player_index_save = PlayerIndex
	for i = 1,getn(player) do
		PlayerIndex = player[i]
		if BigGetItemCount(2,0,1041) ~= 0 then
			PlayerIndex = player_index_save
			return player[i]
		end
	end
	PlayerIndex = player_index_save
	return 0
 end
