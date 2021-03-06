--策划人：陈公子
--代码开发人：村长
--代码开发时间：2007-08-06
	MS_boss_index = 10
	MS_bougie_index_noutheast = 11
	MS_bougie_index_southeast = 12
	MS_bougie_index_southwest = 13
	MS_bougie_index_northwest = 14
	--各个位置烛台状态：0、有蜡烛存活 1、为无蜡烛存活未创建小boss 2、为无蜡烛存活且小boss存活
	Ms_candler_state_noutheast = 15
	Ms_candler_state_southeast = 16
	Ms_candler_state_southwest = 17
	Ms_candler_state_northwest = 18
	--无蜡烛烛台索引存放位置。
	Ms_candler_index_noutheast = 19
	Ms_candler_index_southeast = 20
	Ms_candler_index_southwest = 21
	Ms_candler_index_northwest = 22
	--杀死的各个位置小boss的数量
	Ms_Devilgen_Killed_num ={ 23,24,25,26}
	Tb_Bougie_info = {}
	Tb_Bougie_info[1038] = {"n c莥 l韓","Mang n課 v? ng鋘 畊鑓 (i)"}		--大蜡烛
	Tb_Bougie_info[1039] = {"n c莥 v鮝","Mang n課 v? ng鋘 畊鑓 (trung)"}		--中蜡烛
	Tb_Bougie_info[1040] = {"n c莥 nh?","Mang n課 v? ng鋘 畊鑓 (ti觰)"}		--小蜡烛
		--持续掉血技能：
	Tb_Bougie_buff = {"state_lost_life_per18_monster",200,31860,0,19801250}
		--蜡烛燃烧特效ID
	Bougie_burning_SFX_id = 954
		--各个位置的蜡烛熄灭对BOSS的影响
	Tb_Boss_buff_info_3 = {
		{--攻击提高
			{
				{"state_p_attack_point_add",2000,31860,0,19801252},
				{"state_m_attack_point_add",2000,31860,0,19801253},
			},
			"T╪g t蕁 c玭g","Gi秏 t蕁 c玭g",
		},	
		{--持续回血 
			{
				{"state_life_percent_per10s_anytime",2,31860,0,19801251},
			},
			"Duy tr? h錳 m竨","Ng璶g h錳 m竨",
		},
		{--防御提高	
			{	--魔法buff，可自行添加
				{"state_i_defence_point_add",2000,31860,0,19801254},
				{"state_o_defence_point_add",2000,31860,0,19801255},
			},
			"T╪g ph遪g th?","Gi秏 ph遪g th?",
		},	
		{--移动速度提高       
			{
				{"state_move_speed_percent_add",200,31860,0,19801256},
			},
			"T╪g di chuy觧","Gi秏 di chuy觧",
		},	  
	}

	--关卡开始之前清理所有人的蜡烛
function stage_3_bougie_del()
	for i = 1038,1040 do
			Zgc_pub_mission_fun(MS_ID,"BigDelItem(2,0,"..i..",BigGetItemCount(2,0,"..i.."))")
	end
end
	--关卡开始函数
function stage3_boss_create()
	local map_id =  SubWorldIdx2ID(SubWorld)
	local npc_index = CreateNpc(Tb_Monster_info[3][5][1],Tb_Monster_info[3][5][2],map_id,Tb_Monster_info[3][5][3],Tb_Monster_info[3][5][4])
	SetNpcScript(npc_index,Main_Npc_Script_way)
	SetMissionV(MS_boss_index,npc_index)
	for i = 1,4 do
		public_bougie_crt(i)
	end
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"K誸 th骳 vt 秈 c遪\",1830,0,1)")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Qu? Phong xu蕋 hi謓 c遪\",60,0,2)")
end
--boss吹风技能使用
function stage3_boss_wind_skill()
	local boss_index = GetMissionV(MS_boss_index)
	local bougie_alive_num = 0
	for i = MS_bougie_index_noutheast,MS_bougie_index_northwest do
		bougie_alive_num = bougie_alive_num + GetMissionV(i)
	end
	if bougie_alive_num == 0 then		--如果所有蜡烛熄灭直接创建小怪
		NpcChat(boss_index,"Ch? c? b鉵g t鑙 m韎 c? th? gi髉 nh? vua y猲 gi蔯!")
		stage3_devilkin_crt()
		return
	end
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Qu? Phong xu蕋 hi謓 c遪\",60,0,2)")
	NpcChat(boss_index,"Th藅 to gan, d竚 th緋 竛h s竛g loe lo衪!")
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Qu? Phong bi課 m蕋, b鑞 hng chuy觧 ng, Qu? Tng Qu﹏ g鋓 ra Qu? Phong, n課 b鏽g ph魌 ch竬!\")")
	for i = Ms_candler_state_noutheast,Ms_candler_state_northwest do
		if GetMissionV(i) == 0 then
			local ran_num = random(-20,-10)
			local buogie_index = GetMissionV(i-4)
			if buogie_index ~= 0 then
				if Zgc_pub_mission_boss_life_chg(buogie_index,1,ran_num) == -1 then			--蜡烛被风吹死了。
					--烛台消失
					SetNpcLifeTime(buogie_index,0)
					SetMissionV((i-4),0)
					SetMissionV(i,1)
					--说话
				else		--没有被风吹死
					--说话
				end
			end
		end
	end
	bougie_alive_chk()
end
--蜡烛存活检测/+buff
function bougie_alive_chk()
	local map_id =  SubWorldIdx2ID(SubWorld)
	for i = 	Ms_candler_state_noutheast,Ms_candler_state_northwest do
		local buogie_index = GetMissionV(i-4)
		if buogie_index ~= 0 then
			local max_life_num,life_num = GetUnitCurStates(buogie_index,1)
			if life_num < 10 then
				SetNpcLifeTime(buogie_index,0)
				SetMissionV((i-4),0)
				SetMissionV(i,1)
			end
		end
		if GetMissionV(i) == 1 then
		 	--创建无蜡烛的烛台
			local candler_index = CreateNpc(Tb_Monster_info[3][i-14][6],Tb_Monster_info[3][i-14][2],map_id,Tb_Monster_info[3][i-14][3],Tb_Monster_info[3][i-14][4])
			SetNpcScript(candler_index,Main_Npc_Script_way)
			SetMissionV((i + 4),candler_index)
			--创建小boss
			local devil_num,devil_index = CreateNpc(Tb_Monster_info[3][i-14][7],Tb_Monster_info[3][i-14][8],map_id,Tb_Monster_info[3][i-14][3],Tb_Monster_info[3][i-14][4],-1,(GetMissionV(MS_PLAYER_NUM)*2),1,50)
			for j = 0 ,getn(devil_index) do
				SetNpcScript(devil_index[j],Main_Npc_Script_way)
			end
			SetMissionV(i,2)
			--boss+buff
			local boss_index = GetMissionV(MS_boss_index)
			for j = 1,getn(Tb_Boss_buff_info_3[i-14][1]) do
				CastState2Npc(boss_index,Tb_Boss_buff_info_3[i-14][1][j][1],Tb_Boss_buff_info_3[i-14][1][j][2],Tb_Boss_buff_info_3[i-14][1][j][3],Tb_Boss_buff_info_3[i-14][1][j][4],Tb_Boss_buff_info_3[i-14][1][j][5])
			end
			Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..Tb_Monster_info[3] [i-14][2].."Ch竬 t祅, Qu? Tng Qu﹏ n鎖 gi薾 uy l鵦 gia t╪g ("..Tb_Boss_buff_info_3[i-14][2].."), mau th緋 畊鑓 l猲!! Tr蕁 M? Tng Qu﹏ h譶h nh? c? n課!\")")
		end
	end
	stage3_devilkin_crt()
end
--小怪创建检测
function stage3_devilkin_crt()
	local crt_flag = 0
	--获取boss坐标信息
	local map_id,att_x,att_y= GetNpcWorldPos(GetMissionV(MS_boss_index))
	local nMapID = SubWorldIdx2ID()
	if map_id ~= nMapID then
		return
	end
	for i = Ms_candler_state_noutheast,Ms_candler_state_northwest do
		if GetMissionV(i) ~= 0 then
			crt_flag = 1
			local devilkin_num = min(GetMissionV(MS_PLAYER_NUM) ,stage_devil_restrict())
			if devilkin_num < 2 then
				return
			end
			local suc_crt_num,devilkin_index = CreateNpc(Tb_Monster_info[3][i-14][10],Tb_Monster_info[3][i-14][11],map_id,att_x,att_y,-1,devilkin_num,1,50)
			for j = 0,getn(devilkin_index) do
				SetNpcScript(devilkin_index[j],Main_Npc_Script_way)
			end
		end
	end
	--如果有小怪创建，boss喊话
	if crt_flag == 1 then
		NpcChat(GetMissionV(MS_boss_index),"To gan! Ta s? tr鮪g tr? th輈h ng nh鱪g k? ngang nhi猲 x﹎ ph筸!")
	end
end
--鬼将军死亡脚本
function stage3_boss_death()
	--奖励给于函数
	--发消息
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Ti猽 di謙 'Qu? Tng Qu﹏' th祅h c玭g, i ng? vt 秈 th祅h c玭g!\")")

	local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex ~= 0 then
		AddGlobalNews("T筰"..GetName().."Chi課 u gian kh?, cu鑙 c飊g nh b筰 'Qu? Tng Qu﹏', vt 秈 th祅h c玭g"..Stage_info[stage_seq].stage_name..".")
	end
	
	local nMapID = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(nMapID)
	--清掉蜡烛
	stage_3_bougie_del()
	--准备关卡结束
	--test
	local mission_count = GetMapTaskTemp(nMapID,1)
	WriteLog("[秈 T﹜ B綾] th鑞g k? qua 秈: ID 秈	"..stage_seq..":"..nMapID..":"..mission_count.."	Th阨 gian qua 秈	"..Zgc_pub_time_sec_change(((189-GetMissionV(MS_TIMMER_LOOP_ID))* 10),1))
	Zgc_pub_mission_fun(MS_ID,"Ms_stage_prize()")
	SetMissionV(MS_TIMMER_LOOP_ID,6)
	--stage_mission_fail(3)
end
--小boss死亡脚本
function devil_Gen_death(gen_seq)
	--掉蜡烛
	local killed_num = (GetMissionV(Ms_Devilgen_Killed_num[gen_seq]) + 1)
	SetMissionV(Ms_Devilgen_Killed_num[gen_seq],killed_num)
	--如果杀的数量可以被玩家数量整除，则给奖励
	if mod(killed_num,(GetMissionV(MS_PLAYER_NUM)*2)) == 0 then
		local ran_num = random(1,100)
		for i = 1,getn(Tb_Monster_info[3][gen_seq][9]) do
			if ran_num <= Tb_Monster_info[3][gen_seq][9][i] then
				AddItem(2,0,(1037+i),1)
				Msg2Player("Nh薾 頲 1 "..Tb_Bougie_info[1037+i][1]..", b筺 c? th? i tho筰 v韎 ng鋘 畊鑓  t n課.")
				break
			end
		end
	end
end
--烛台死亡脚本
function player_kill_candler(bougie_seq)
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().." t蕁 c玭g d蒼 n "..Tb_Monster_info[3][bougie_seq][2].." b? t総 n課!\")")
	local buogie_index = GetMissionV(bougie_seq+10)
	SetNpcLifeTime(buogie_index,0)
	SetMissionV((bougie_seq+10),0)
	SetMissionV((bougie_seq+14),1)
	bougie_alive_chk()
end
--NPC对话脚本
--NPC对话函数统一处理
function stage3_bougie_use(bougie_seq)
	--是否有蜡烛的检测
	local bougie_chk_flag = 0
	for i = 1038,1040 do
		if GetItemCount(2,0,i) ~= 0 then
			bougie_chk_flag = 1
			break
		end
	end	
	if bougie_chk_flag == 0 then
		return
	end
	--对话展开
	Say("<color=green>Nh綾 nh?<color> B筺 mu鑞 d飊g n課 th緋 ng鋘 畊鑓 n祔 kh玭g?",
	2,
	"уng ?/#bougie_use_dtm("..bougie_seq..")",
	"Tho竧/end_dialog"
	)
end
--确认使用蜡烛
function bougie_use_dtm(bougie_seq)
	--蜡烛选择确认
	local tb_dilog = {}
	for i = 1038,1040 do
		if GetItemCount(2,0,i) ~= 0 then
			tinsert(tb_dilog,"уng ?"..Tb_Bougie_info[i][1].."Th緋 畊鑓/#bougie_crt("..bougie_seq..","..i..")")
		end
	end
	if getn(tb_dilog) == 0 then
		Talk(1,"","<color=green>Nh綾 nh?<color>: Xin x竎 nh薾 c? mang n課!")
		return
	else
		tinsert(tb_dilog,"в ta suy ngh? l筰/end_dialog")
	end
	Say("<color=green>Nh綾 nh?<color>: Xin ch鋘 n課 mu鑞 d飊g!",
		getn(tb_dilog),
		tb_dilog
	)
end
--蜡烛的创建
function bougie_crt(att_seq,bougie_id)
	--状态检测
	if GetMissionV(att_seq + 14) == 0 then
		Talk(1,"","<color=green>Nh綾 nh?<color>: Hi謓"..Tb_Monster_info[3] [att_seq][2].." n課  th緋!")
		return
	end
	--物品检测
	if GetItemCount(2,0,bougie_id) == 0 then
		Talk(1,"","<color=green>G頸 ? <color>: Xin h穣 x竎 nh薾 b筺  mang theo <color=yellow>"..Tb_Bougie_info[bougie_id][1].."<color>!")
		return
	else
		--物品删除检测
		if DelItem(2,0,bougie_id,1) ~= 1 then
			Talk(1,"","<color=green>G頸 ? <color>: Xin h穣 x竎 nh薾 b筺  mang theo <color=yellow>"..Tb_Bougie_info[bougie_id][1].."<color>!")
			return
		end
	end
	--无蜡烛烛台删除
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().."S? d鬾g "..Tb_Bougie_info[bougie_id][1].."Х th緋"..Tb_Monster_info[3] [att_seq][2].." n課, uy l鵦 'Qu? Tng Qu﹏' gi秏 b韙 ("..Tb_Boss_buff_info_3[att_seq][3].."）！\")")
	local candler_index = GetMissionV(18+att_seq)
	SetNpcLifeTime(candler_index,0)
	SetMissionV((18+att_seq),0)
	--npc创建
	public_bougie_crt(att_seq)
	--boss buff删除
	local boss_index = GetMissionV(MS_boss_index)
	for i = 1,getn(Tb_Boss_buff_info_3[att_seq][1]) do
		RemoveStateFromNpc(boss_index,Tb_Boss_buff_info_3[att_seq][1][i][5])
	end
end
--蜡烛创建函数
function public_bougie_crt(att_seq)
	local map_id =  SubWorldIdx2ID(SubWorld)
	local npc_index = CreateNpc(Tb_Monster_info[3][att_seq][1],Tb_Monster_info[3][att_seq][2],map_id,Tb_Monster_info[3][att_seq][3],Tb_Monster_info[3][att_seq][4])
	SetNpcScript(npc_index,Main_Npc_Script_way)
	SetNpcActivator(npc_index)
	SetMissionV((10+att_seq),npc_index)
	SetMissionV((14+att_seq),0)			--所有烛台的初始状态为0
	--自动扣血buff添加
	CastState2Npc(npc_index,Tb_Bougie_buff[1],Tb_Bougie_buff[2],Tb_Bougie_buff[3],Tb_Bougie_buff[4],Tb_Bougie_buff[5])
	--特效加入
	SetCurrentNpcSFX(npc_index,Bougie_burning_SFX_id,2,1)
end

