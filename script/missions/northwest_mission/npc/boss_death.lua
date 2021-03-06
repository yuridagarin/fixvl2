--脚本名称：西北区关卡boss死亡函数
--脚本功能：boss死亡，主要是奖励的给于mission的相关操作
--策划人：陈公子
--代码开发人：村长
--代码开发时间：2007-08-06
--代码修改记录
--备注：我有我style
Include("\\script\\missions\\northwest_mission\\zgc_mission_pub_fun.lua")
Include("\\script\\missions\\northwest_mission\\mission\\mission_head.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\task\\world\\xibei\\task_head.lua")
Include("\\script\\task\\world\\xibei\\task_main.lua")
Include("\\script\\task\\world\\task_head.lua")

	Tb_boss_script = {
						{"C? Dng Th?","guyang_death_1",""},
						{"Tr蕁 M? Th?","zhenmu_death_1",""},
						{"Qu? Tng Qu﹏","ghost_death_1",""},
						{"Dc Vng","drugking_death_1",""},
						{"Ng? H祅h Kim S?","iron_death_1",""},
						{"Ng? H祅h Th駓 S?","water_death_1",""},
						{"Ng? H祅h M閏 S?","wood_death_1",""},
						{"Ng? H祅h H醓 S?","fire_death_1",""},
						{"Ng? H祅h Th? S?","dust_death_1",""},
						{"Th鑞g l躰h tng binhHoanTng ","binma_yong_death_1",""},
						{"Tr蕁 M? Th驢oan Tng ","zhenmu_jia_death_1",""},
						{"Tr蕁 m? Tng qu﹏Hoan Tng ","zhenmu_jj_death_1",""},
						{"Huy誸 Ma Nh﹏Hoan Tng ","xuemo_death_1",""},
						{"Qu? Tng uHoan Tng ","gui_jj_death_1",""},
						{"Nguy猲 h譶h Hoan Tng","sheng_death_1",""},
						}
	Tb_stage6_boss_info = {
		{"Hoan Tng (Tng l躰h tng)","Th鑞g l躰h tng binhHoanTng ",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Hoan Tng (C? Dng Th?)","Tr蕁 M? Th驢oan Tng ",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Hoan Tng (Tr蕁 m? Tng qu﹏)","Tr蕁 m? Tng qu﹏Hoan Tng ",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Hoan Tng (Huy誸 Ma Nh﹏)","Huy誸 Ma Nh﹏Hoan Tng ",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Hoan Tng (Qu? Tng u)","Qu? Tng uHoan Tng ",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Nguy猲 h譶h Hoan Tng","Nguy猲 h譶h Hoan Tng - Con trai",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
	}
--怪物死亡主函数
function OnDeath(monster_index)
	local monster_name = GetNpcName(monster_index)
	local stage_diff = GetMissionV(MS_DIFF)
	if stage_diff ~= 1 and stage_diff ~= 2 then
		return
	end
	for i = 1,getn(Tb_boss_script) do
		if monster_name == Tb_boss_script[i][1] then
			dostring(Tb_boss_script[i][1+stage_diff].."("..monster_index..","..PlayerIndex..")")
		end
	end
end
--============================普通关卡处理===========================
function guyang_death_1(monster_index)
	local strTalk = {
		"(1 竛h h錸g quang l鉫 l猲 c飊g v韎 ti課g r輙 ch鉯 tai)",
		"Ngi ch琲: ??!? (竛h h祇 quang v? ti課g r輙 l骳 n穣 l? sao? Hay n猲 甶 h醝 Di謕 T? Thu.)",
		}
	SetNpcLifeTime(monster_index,15);--使得尸体消失
	--取得关卡的所有玩家索引
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	for i=1,getn(player) do
	  PlayerIndex = player[i]
		if GetTask(TASK_XB_ID_02) == 17 and IsPlayerDeath() == 0 then
			DelItem(2,0,704,1)--锁妖符
			DelItem(2,0,759,1)--桃木剑
			AddItem(2,0,705,1,1)--血魂晶魄
			TalkEx("",strTalk)
			SetTask(TASK_XB_ID_02,18)
			TaskTip("Х nh b筰 C? Dng Th? , tr? v? C玭 L玭 g苝 Di謕 T? Thu. ")
			Msg2Player("Х nh b筰 C? Dng Th? , tr? v? C玭 L玭 g苝 Di謕 T? Thu. ")
		end
	end
	normal_stage_finish()
end
function zhenmu_death_1(monster_index)
	local strTalk = {
		"M閠 ﹎ thanh l韓 vang l猲, l鑙 v祇 t莕g 2  m?, mau ch鉵g v祇 l蕐 b秓 rng d鵤 theo ch? d蒼 c馻 m藅 h祄 T﹜ H? Ph竝 vng."
		}
	SetNpcLifeTime(monster_index,15);--使得尸体消失
	--取得关卡的所有玩家索引
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作	
	for i=1,getn(player) do
	  PlayerIndex = player[i];
		if GetTask(TASK_XB_ID_01) == 25 and IsPlayerDeath() == 0 then
			TalkEx("",strTalk); 
			SetTask(TASK_XB_ID_01,26);
			TaskTip("Mau v祇 l蕐 b秓 rng d鵤 theo ch? d蒼 c馻 m藅 h祄 T﹜ H? Ph竝 vng.");
			Msg2Player("Mau v祇 l蕐 b秓 rng d鵤 theo ch? d蒼 c馻 m藅 h祄 T﹜ H? Ph竝 vng.");
			GivePlayerAward("Award_XB_32","Easy");
		end
	end
	normal_stage_finish()
end
function ghost_death_1(monster_index)
	local strTalk = {
		"Ch糿g l? y l? M芻 u Ki誱? Ng鋍 b閕 n祔 l? g?? Sao kh玭g th蕐 m藅  Thi猲 H? X? T綾? Tr秓 Vng  n t閕, kh玭g ai c馻 Nh蕋 Ph萴 Л阯g v祇 t莕g 2. Nh鱪g v藅 n祔 nh蕋 nh c? li猲 quan t韎 v? c馻 T? M? ti襫 b鑙, t鑤 nh蕋 n猲 h醝 玭g ta trc."
		};
	SetNpcLifeTime(monster_index,15);--使得尸体消失
	--取得关卡的所有玩家索引
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	for i=1,getn(player) do
		PlayerIndex = player[i];
		if GetTask(TASK_XB_ID_01) == 27 and IsPlayerDeath() == 0 then
			DelItem(2,0,717,1);--删去非常道符
			AddItem(2,0,718,1,1);--获得墨斗
			AddItem(2,0,719,1,1);--获得玉佩
			TalkEx("",strTalk); 
			SetTask(TASK_XB_ID_01,28);
			TaskTip("Mang cho T? M? Minh Phong nh鱪g v藅 c? trong b秓 rng.");
			Msg2Player("Mang cho T? M? Minh Phong nh鱪g v藅 c? trong b秓 rng.");
		end
	end
	normal_stage_finish()
end
function drugking_death_1(monster_index)

	local strTalk = {
		"Ta  chu萵 b? cho ngi 100 dc nh﹏. Dc Nh﹏ dc phng nghi謕  ph鑙 th祅h, u d飊g nguy猲 li猽 Dc Nh﹏ Th秓 trong dc vng ng.",
		"Kh玭g hay r錳, T﹜ H? mu鑞 t筼 ra i qu﹏ Dc Nh﹏, gi? phng thu鑓  n籱 trong tay ta, ph秈 v? g苝  Dng ti襫 b鑙.",
		}

	SetNpcLifeTime(monster_index,15);--使得尸体消失	
	--取得关卡的所有玩家索引
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	for i=1,getn(player) do
		PlayerIndex = player[i];
		if GetTask(TASK_XB_ID_01) == 47 and IsPlayerDeath() == 0 then
			DelItem(2,0,760,1)	--删除药王易容装
			AddItem(2,0,726,1,1);--打倒药王得到药人药方
			AddItem(2,0,727,1,1);--西夏法王书函
			TalkEx("",strTalk); 
			SetTask(TASK_XB_ID_01,48);
			TaskTip("H錳 b竜  Dng H鋋, T﹜ H? C鑓 t譵 phng thu鑓 Dc Vng t筼 ra i qu﹏ Dc Nh﹏, vi謈 n祔 v? c飊g c蕄 b竎h.");
			Msg2Player("H錳 b竜  Dng H鋋, T﹜ H? C鑓 t譵 phng thu鑓 Dc Vng t筼 ra i qu﹏ Dc Nh﹏, vi謈 n祔 v? c飊g c蕄 b竎h.");
		end
	end
	normal_stage_finish()
end
function iron_death_1(monster_index)
	local strTalk = {
		"Х nh b筰 Ng? H祅h S?, v? b竜 l筰 Th竎 B箃 Ho籲g."
		}	
	SetNpcLifeTime(index,15);--使得尸体消失
	--取得关卡的所有玩家索引
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	local boss_kill_num = GetMissionV(MS_BOSS_KILL_NUM)
	SetMissionV(MS_BOSS_KILL_NUM,(boss_kill_num +1))
	if (boss_kill_num +1) >= 5 then
		normal_stage_finish()
	end
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if GetTask(TASK_XB_ID_01) == 58 and IsPlayerDeath() == 0 and (boss_kill_num +1) >= 5 then
			DelItem(2,0,755,1)
			SetTask(TASK_XB_ID_01,59);
			Msg2Player("Khi nh b筰 頲 Ng? H祅h S?, v? h錳 b竜 Th竎 B箃 Ho籲g. ");
			TaskTip("Khi nh b筰 頲 Ng? H祅h S?, v? h錳 b竜 Th竎 B箃 Ho籲g. ");
			TalkEx("",strTalk)
		end
	end
	stage_5_boss_index_deal(monster_index)
end

function water_death_1(monster_index)
	local strTalk = {
			"Х nh b筰 Ng? H祅h S?, v? b竜 l筰 Th竎 B箃 Ho籲g."
			}	
	SetNpcLifeTime(index,15);--使得尸体消失
	--取得关卡的所有玩家索引
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	local boss_kill_num = GetMissionV(MS_BOSS_KILL_NUM)
	SetMissionV(MS_BOSS_KILL_NUM,(boss_kill_num +1))
	if (boss_kill_num +1) >= 5 then
		normal_stage_finish()
	end
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if GetTask(TASK_XB_ID_01) == 58 and IsPlayerDeath() == 0 and (boss_kill_num +1) >= 5 then
			DelItem(2,0,755,1)
			SetTask(TASK_XB_ID_01,59);
			Msg2Player("Khi nh b筰 頲 Ng? H祅h S?, v? h錳 b竜 Th竎 B箃 Ho籲g. ");
			TaskTip("Khi nh b筰 頲 Ng? H祅h S?, v? h錳 b竜 Th竎 B箃 Ho籲g. ");
			TalkEx("",strTalk)
		end
	end
	stage_5_boss_index_deal(monster_index)
end

function wood_death_1(monster_index)

	local strTalk = {
		"Х nh b筰 Ng? H祅h S?, v? b竜 l筰 Th竎 B箃 Ho籲g."
		}	
	SetNpcLifeTime(monster_index,15);--使得尸体消失
	--取得关卡的所有玩家索引
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	local boss_kill_num = GetMissionV(MS_BOSS_KILL_NUM)
	SetMissionV(MS_BOSS_KILL_NUM,(boss_kill_num +1))
	if (boss_kill_num +1) >= 5 then
		normal_stage_finish()
	end
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if GetTask(TASK_XB_ID_01) == 58 and IsPlayerDeath() == 0 and (boss_kill_num +1) >= 5 then
			DelItem(2,0,755,1)
			SetTask(TASK_XB_ID_01,59);
			Msg2Player("Khi nh b筰 頲 Ng? H祅h S?, v? h錳 b竜 Th竎 B箃 Ho籲g. ");
			TaskTip("Khi nh b筰 頲 Ng? H祅h S?, v? h錳 b竜 Th竎 B箃 Ho籲g. ");
			TalkEx("",strTalk)
		end
	end
	stage_5_boss_index_deal(monster_index)
end

function fire_death_1(monster_index)

	local strTalk = {
		"Х nh b筰 Ng? H祅h S?, v? b竜 l筰 Th竎 B箃 Ho籲g."
		}	
	SetNpcLifeTime(monster_index,15);--使得尸体消失
	--取得关卡的所有玩家索引
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	local boss_kill_num = GetMissionV(MS_BOSS_KILL_NUM)
	SetMissionV(MS_BOSS_KILL_NUM,(boss_kill_num +1))
	if (boss_kill_num +1) >= 5 then
		normal_stage_finish()
	end
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if GetTask(TASK_XB_ID_01) == 58 and IsPlayerDeath() == 0 and (boss_kill_num +1) >= 5 then
			DelItem(2,0,755,1)
			SetTask(TASK_XB_ID_01,59);
			Msg2Player("Khi nh b筰 頲 Ng? H祅h S?, v? h錳 b竜 Th竎 B箃 Ho籲g. ");
			TaskTip("Khi nh b筰 頲 Ng? H祅h S?, v? h錳 b竜 Th竎 B箃 Ho籲g. ");
			TalkEx("",strTalk)
		end
	end
	stage_5_boss_index_deal(monster_index)
end

function dust_death_1(monster_index)

	local strTalk = {
		"Х nh b筰 Ng? H祅h S?, v? b竜 l筰 Th竎 B箃 Ho籲g."
		}	
	SetNpcLifeTime(monster_index,15);--使得尸体消失
	--取得关卡的所有玩家索引
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	local boss_kill_num = GetMissionV(MS_BOSS_KILL_NUM)
	SetMissionV(MS_BOSS_KILL_NUM,(boss_kill_num +1))
	if (boss_kill_num +1) >= 5 then
		normal_stage_finish()
	end
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if GetTask(TASK_XB_ID_01) == 58 and IsPlayerDeath() == 0 and (boss_kill_num +1) >= 5 then
			DelItem(2,0,755,1)
			SetTask(TASK_XB_ID_01,59);
			Msg2Player("Khi nh b筰 頲 Ng? H祅h S?, v? h錳 b竜 Th竎 B箃 Ho籲g. ");
			TaskTip("Khi nh b筰 頲 Ng? H祅h S?, v? h錳 b竜 Th竎 B箃 Ho籲g. ");
			TalkEx("",strTalk)
		end
	end
	stage_5_boss_index_deal(monster_index)
end

function binma_yong_death_1(monster_index)
	local nMapId, nX, nY = GetWorldPos()
	SetNpcLifeTime(monster_index,15);--使得尸体消失
	nNpcIndex = CreateNpc("Hoan Tng (C? Dng Th?)","Tr蕁 M? Th驢oan Tng ",nMapId, nX, nY);
	SetMissionV(MS_BOSS_INDEX_1,nNpcIndex)
	SetNpcLifeTime(nNpcIndex,1800);
	SetNpcScript(nNpcIndex,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua");
	--取得关卡的所有玩家索引
	local player = {}
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 0 then	
			TaskTip("Khi  ti猽 di謙 秓 秐h Th鑞g l躰h tng binh m?, Hoan Tng bi課 h鉧 th祅h Tr蕁 M? Th?!");
			Msg2Player("Khi  ti猽 di謙 秓 秐h Th鑞g l躰h tng binh m?, Hoan Tng bi課 h鉧 th祅h Tr蕁 M? Th?!");
		end
	end
end

function zhenmu_jia_death_1(monster_index)
	local nMapId, nX, nY = GetWorldPos()
	SetNpcLifeTime(monster_index,15);--使得尸体消失
	nNpcIndex = CreateNpc("Hoan Tng (Tr蕁 m? Tng qu﹏)","Tr蕁 m? Tng qu﹏Hoan Tng ",nMapId, nX, nY);
	SetMissionV(MS_BOSS_INDEX_1,nNpcIndex)
	SetNpcLifeTime(nNpcIndex,1800);
	SetNpcScript(nNpcIndex,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua");
	--取得关卡的所有玩家索引
	local player = {}
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 0 then	
			TaskTip("Khi  ti猽 di謙 Hoan Tng Tr蕁 M? Th?, Hoan Tng h鉧 th祅h Tr蕁 m? Tng qu﹏!");
			Msg2Player("Khi  ti猽 di謙 Hoan Tng Tr蕁 M? Th?, Hoan Tng h鉧 th祅h Tr蕁 m? Tng qu﹏!");
		end
	end
end

function zhenmu_jj_death_1(monster_index)
	local nMapId, nX, nY = GetWorldPos()
	SetNpcLifeTime(monster_index,15);--使得尸体消失
	nNpcIndex = CreateNpc("Hoan Tng (Huy誸 Ma Nh﹏)","Huy誸 Ma Nh﹏Hoan Tng ",nMapId, nX, nY);
	SetMissionV(MS_BOSS_INDEX_1,nNpcIndex)
	SetNpcLifeTime(nNpcIndex,1800);
	SetNpcScript(nNpcIndex,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua");
	--取得关卡的所有玩家索引
	local player = {}
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 0 then	
			TaskTip("Khi  ti猽 di謙 秓 秐h Tr蕁 m? Tng qu﹏, Hoan Tng h鉧 th祅h Huy誸 Ma Nh﹏!");
			Msg2Player("Khi  ti猽 di謙 秓 秐h Tr蕁 m? Tng qu﹏, Hoan Tng h鉧 th祅h Huy誸 Ma Nh﹏!");
		end
	end
end

function xuemo_death_1(monster_index)
	local nMapId, nX, nY = GetWorldPos()
	SetNpcLifeTime(monster_index,15);--使得尸体消失
	nNpcIndex = CreateNpc("Hoan Tng (Qu? Tng u)","Qu? Tng uHoan Tng ",nMapId, nX, nY);
	SetMissionV(MS_BOSS_INDEX_1,nNpcIndex)
	SetNpcLifeTime(nNpcIndex,1800);
	SetNpcScript(nNpcIndex,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua");
	--取得关卡的所有玩家索引
	local player = {}
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 0 then	
			TaskTip("Khi  ti猽 di謙 秓 秐h Huy誸 Ma Nh﹏, Hoan Tng h鉧 th祅h Qu? Tng u! ");
			Msg2Player("Khi  ti猽 di謙 秓 秐h Huy誸 Ma Nh﹏, Hoan Tng h鉧 th祅h Qu? Tng u! ");
		end
	end
end

function gui_jj_death_1(monster_index)
	local nMapId, nX, nY = GetWorldPos()
	SetNpcLifeTime(monster_index,15);--使得尸体消失
	nNpcIndex = CreateNpc("Nguy猲 h譶h Hoan Tng","Nguy猲 h譶h Hoan Tng",nMapId, nX, nY);
	SetMissionV(MS_BOSS_INDEX_1,nNpcIndex)
	SetNpcLifeTime(nNpcIndex,1800);
	SetNpcScript(nNpcIndex,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua");
	--取得关卡的所有玩家索引
	local player = {}
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 0 then	
			TaskTip("Ti猽 di謙 秓 秐h Qu? Tng u, nguy猲 h譶h c馻 Hoan Tng-Con trai xu蕋 hi謓!!");
			Msg2Player("Ti猽 di謙 秓 秐h Qu? Tng u, nguy猲 h譶h c馻 Hoan Tng-Con trai xu蕋 hi謓!!");
		end
	end
end

function sheng_death_1(monster_index)
	local nMapId, nX, nY = GetWorldPos()
	local strSay = {
		"Khi nh b筰 nguy猲 h譶h c馻 Hoan Tng , theo l阨 c馻 Di謕 T? Thu, l骳 n祔 ph秈 d飊g th莕 ch? phong 蕁 n?. Xin ch鋘 c﹗ th莕 ch? phong 蕁: ",
		HUANXIANG_CURSE[1].."/#Confirm_Curse(1)",
		HUANXIANG_CURSE[2].."/#Confirm_Curse(2)",
		HUANXIANG_CURSE[3].."/#Confirm_Curse(3)",
		}
	SetNpcLifeTime(monster_index,15);--使得尸体消失
	--取得关卡的所有玩家索引
	local player = {}
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	normal_stage_finish()
	--操作
	for i=1,getn(player) do
	  PlayerIndex = player[i];
		if GetTask(TASK_XB_ID_01) == 64 and IsPlayerDeath() == 0 then
			SetPlayerScript("\\script\\missions\\northwest_mission\\npc\\boss_death.lua")
			SelectSay(strSay);
		end
	end
end

--确认咒语
function Confirm_Curse(index)
	local strTalk = {};
	--封印成功
	if GetTask(HUANGXIANG_CURSE_ID) == index then
		SetTask(TASK_XB_ID_01,65);
		strTalk = {
			"Ngi ch琲: Nguy猲 h譶h Hoan Tng  b? phong 蕁 th祅h c玭g, sau khi t苙g ph竝 kh? cho B筩h Thi猲 Th祅h li襫 tr? th竝 phong y猽 cho Di謕 T? Thu. "
			}
		Msg2Player("Sau khi t苙g ph竝 kh? phong 蕁 cho B筩h Thi猲 Th祅h, th? mang tr? th竝 phong 蕁 cho Di謕 T? Thu. ");
		TaskTip("Sau khi t苙g ph竝 kh? phong 蕁 cho B筩h Thi猲 Th祅h, th? mang tr? th竝 phong 蕁 cho Di謕 T? Thu. ");
	--封印失败
	else
		strTalk = {
			"Th莕 ch? kh玭g hi謚 l鵦, nguy猲 h譶h Hoan Tng  ch箉 tho竧!"
			}
	end
	TalkEx("",strTalk);
end
--关卡成功完成
function normal_stage_finish()
	SetMissionV(MS_TIMMER_LOOP_ID,6)
end
--第五关boss索引的更新
function stage_5_boss_index_deal(monster_index)
	local boss_index_att = 0		--临时boss索引变量
	local boss_index_att_0 = 0		--空白索引位置
	for i = MS_BOSS_INDEX_1,MS_BOSS_INDEX_5 do
		if GetMissionV(i) == 0 then
			boss_index_att_0 = i
			break
		elseif monster_index == GetMissionV(i) then
			boss_index_att = i
		end
	end
	SetMissionV(boss_index_att,GetMissionV(boss_index_att_0-1))
	SetMissionV((boss_index_att_0-1),0)
end
--============================复杂关卡处理===========================
--暗日使和明月使
function moon_sun_death(kill_index)
	--如果是古阳兽杀死的不做处理
	if kill_index == 0 then
		return
	end
	--如果是玩家杀死的则减少血魔人的数量
	mf_SetMissionV(MS_ID,MS_BLOOD_MONSTER_NUM,(mf_GetMissionV(MS_ID,MS_BLOOD_MONSTER_NUM) - 1))
end
--血魔人
function blood_monster_death(kill_index)
	--只做减一的处理
	mf_SetMissionV(MS_ID,MS_BLOOD_MONSTER_NUM,(mf_GetMissionV(MS_ID,MS_BLOOD_MONSTER_NUM) - 1))
end
--龙和狐狸
function dragon_fox_death(kill_index)
	--如果是古阳兽杀死的
	if kill_index == 0 then
		local boss_index = mf_GetMissionV(MS_ID,MS_BOSS_INDEX_ID)
		stage_1_boss_add_life(boss_index,1,1)
	end
	mf_SetMissionV(MS_ID,MS_DRAGON_FOX_NUM,(mf_GetMissionV(MS_ID,MS_DRAGON_FOX_NUM)-1))
end
--古阳兽
function stage_1_boss_death()
	--发消息
	Zgc_pub_mission_team_msg("揅? Dng Th髷 b? ti猽 di謙, vt qua 秈!")
	--设置关卡状态
	mf_SetMissionV(MS_ID,MS_STATE_ID,MS_state_wait_end)
	--奖励给于
	--进入关卡完成状态，重新设置触发器
end
