Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua")
Include("\\script\\lib\\define.lua")
Include("\\settings\\static_script\\misc\\data_state\\state.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\settings\\static_script\\misc\\missionaward_head.lua")
Include("\\script\\class\\clause3.lua");
Include("\\settings\\static_script\\lib\\itemfunctions.lua")
Include("\\settings\\static_script\\lib\\val2str.lua");
Include("\\script\\lib\\string.lua");
Include("\\settings\\static_script\\missions\\hunduantongtianding\\ttd_award.lua")
Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

--活动产出头文件包含
Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\online_activites\\award.lua")
--追回字帖大作战
Include("\\script\\online\\dazitie\\dzt_head.lua")
Include("\\script\\online\\collect_card\\cc_head.lua")
Include("\\script\\online\\award_head.lua")

Include("\\settings\\static_script\\missions\\hunduantongtianding\\runtime_data_stat.lua")

thisFile = "\\settings\\static_script\\missions\\hunduantongtianding\\mission.lua";

g_nDebugVersion = 0; --测试版本

VET_CONSUME_MAX = 600; --消费IB道具必出标值

tbHDTTD = { 
	name = "Th玭g Thi猲 Huy詎 C秐h",
	missionID = 58, --\gamesvr\settings\task\missions.txt
	realMapID = 6019,
	dynamicMap = 1, --是否动态加载
	
	TempTask1 = 251, --临时变量，记录噩梦之花的索引

--	timerTriggerID = 101,
--	costomerID = 101,
--以下为missionV变量
	mv1 = 1, --第1关是否作弊模式
	mv2 = 2, --第2关是否作弊模式
	mv3 = 3, --第3关是否作弊模式
	mv4 = 4, --第4关是否作弊模式
	mv5 = 5, --第5关是否作弊模式
	mv6 = 6, --第6关是否作弊模式
	mv7 = 7, --第7关是否作弊模式
	mv8 = 8, --破军上一次生命值
	mv9 = 9, --杀破狼是否出现
	mv10 = 10, --杀破狼技能等级
	mv11 = 11, --伏梦出来了
	mv12 = 12, --与伏梦聊家常
	mv13 = 13, --剑魔江别鹤出来了
	mv14 = 14, --与剑魔江别鹤聊家常	
	mv15 = 15, --九剑死亡数
	mv16 = 16, --黑白长老死亡数
	mv17 = 17, --20秒倒计时
	mv18 = 18, --1表示悲剧结局，2表示喜剧结局
	mv19 = 19, --通天老祖出来了
	mv20 = 20, --与通天老祖聊家常	
	mv21 = 21, --前戏的废话
	mv22 = 22, --第2关的废话
	mv23 = 23, --0能进入下一关，1不能
	
--以下为missionS变量	
	ms1 = 1,  --记录激活的九剑
}
tbHDTTD = gf_CopyInherit(missionHead, tbHDTTD);

-------时间控制器-----------------------------------------------
firePhases = {
	timerID = 88, --\gamesvr\settings\timer_task.txt
	maxsecond = 150*60,
};
firePhases = gf_CopyInherit(phaseBase,firePhases)

-----------------------------------------------------------------

-------一些公共数据---------------------------------------------
tNpcs = {
	wrd = {"Ng? Nh﹏ Чo","Ng? Nh﹏ Чo","\\settings\\static_script\\missions\\hunduantongtianding\\wrd_npc.lua",nil, CampPlayer,0},
	
	qrs = {"Th玭g Thi猲 Nh薽 Doanh Doanh", "Nh薽 Doanh Doanh", thisFile, nil, CampPlayer, 0},
	lf = {"Th玭g Thi猲 Hng V蕁 Thi猲", "Hng V蕁 Thi猲", nil, nil, CampPlayer, 0},

	tyss = {"Th玭g Thi猲 T? V?", "Th玭g Thi猲 T? V?", thisFile, nil, CampEnemy, 0},
	wlrs1 = {"Nh藅 Nguy謙 gi竜  xanh","Th莕 Gi竜 Tinh Anh", thisFile, nil, CampPlayer, 0},
	wlrs2 = {"Nh藅 Nguy謙 gi竜  v祅g","Th莕 Gi竜 Tinh Anh", thisFile, nil, CampPlayer, 0},
	wlrs3 = {"Nh藅 Nguy謙 gi竜  ","Th莕 Gi竜 Tinh Anh", thisFile, nil, CampPlayer, 0},
	wlrs4 = {"Nh藅 Nguy謙 gi竜  tr緉g","Th莕 Gi竜 Tinh Anh", thisFile, nil, CampPlayer, 0},
	wlrs5 = {"Nh藅 Nguy謙 gi竜  甧n","Th莕 Gi竜 Tinh Anh", thisFile, nil, CampPlayer, 0},
	boss1 = {"Huy誸 H莡 Ti猽 Dng","Huy誸 H莡 Ti猽 Dng", thisFile, nil, CampEnemy, 0},
	
	boss2 = {"Th蕋 S竧","Th蕋 S竧", thisFile, nil, CampEnemy, 0},
	boss3 = {"Ph? Qu﹏","Ph? Qu﹏", thisFile, nil, CampEnemy, 0},
	boss4 = {"Tham Lang","Tham Lang", thisFile, nil, CampEnemy, 0},
	
	boss5 = {"Ph鬰 M閚g","Ph鬰 M閚g", thisFile, nil, CampEnemy, 0},
	fish = {"Ng筩 M閚g Chi No穘","Ng筩 M閚g Chi Hoa", thisFile, nil, CampEnemy, 0},
	boss6 = {"T蕋 Y觧","T蕋 Y觧", thisFile, nil, CampEnemy, 0},
	boss7 = {"Ki誱 Ma Giang Bi謙 H筩","Ki誱 Ma Giang Bi謙 H筩", thisFile, nil, CampEnemy, 0},
	J1 = {"B祅 X?","B祅 X?", thisFile, nil, CampEnemy, 0},
	J2 = {"T? 謓","T? 謓", thisFile, nil, CampEnemy, 0},
	J3 = {"筺 th駓","筺 th駓", thisFile, nil, CampEnemy, 0},
	J4 = {"Tri襲 Dng ki誱","Tri襲 Dng ki誱", thisFile, nil, CampEnemy, 0},
	J5 = {"Th筩h Duy謓 ki誱","Th筩h Duy謓 ki誱", thisFile, nil, CampEnemy, 0},
	J6 = {"ч H錸 ki誱","ч H錸 ki誱", thisFile, nil, CampEnemy, 0},
	J7 = {"Hi猲 Vi猲 ki誱","Hi猲 Vi猲 ki誱", thisFile, nil, CampEnemy, 0},
	J8 = {"Truy T譶h ki誱","Truy T譶h ki誱", thisFile, nil, CampEnemy, 0},
	J9 = {"T祅g S竧","T祅g S竧", thisFile, nil, CampEnemy, 0},
	
	boss8 = {"H綾 Trng L穙 Ti猽 Nguy謙","H綾 Trng L穙 Ti猽 Nguy謙", thisFile, nil, CampEnemy, 0},
	boss9 = {"B筩h Trng L穙 T蕋 Thi猲","B筩h Trng L穙 T蕋 Thi猲", thisFile, nil, CampEnemy, 0},
	wlrs6 = {"уng o v? l﹎ 2","Th莕 Gi竜 Tinh Anh", thisFile, nil, CampPlayer, 0},
	
	boss10 = {"Th玭g Thi猲 L穙 T? 7A","Th玭g Thi猲 L穙 T?", thisFile, nil, CampEnemy, 0},
	boss11 = {"Th玭g Thi猲 Nh薽 Ng? H祅h A","T? Nh薽 Ng? H祅h", thisFile, nil, CampEnemy, 0},
	
	boss12 = {"Th玭g Thi猲 L穙 T? 7B","Th玭g Thi猲 L穙 T?", thisFile, nil, CampEnemy, 0},
	boss13 = {"Th玭g Thi猲 Hng V蕁 Thi猲","Hng V蕁 Thi猲", thisFile, nil, CampPlayer, 0},
	boss14 = {"Th玭g Thi猲 Nh薽 Ng? H祅h B", "Nh薽 Ng? H祅h", nil, nil, CampPlayer, 0},
	
	njn1 = {"L? nng l韓","L? luy謓 T祅g Ki誱",nil,nil,CampPlayer,0}
};

tPos = {
	wrd = {{1480,2961}},
	qrs = {{1608,3197}},
	lf = {{1608,3202}},

	tyss = {
		{1643,3173},{1652,3181},{1647,3151},{1662,3164},{1677,3179},{1692,3164},{1700,3137},{1691,3117},{1674,3118},{1674,3139},{1684,3129},{1679,3134},
	},
	wlrs1 = {
		{1650,3151},{1662,3166},
	},
	wlrs2 = {
		{1691,3119},{1676,3119},
	},
	wlrs3 = {
		{1675,3179},{1692,3166},
	},
	wlrs4 = {
		{1704,3137},{1679,3134},
	},
	wlrs5 = {
		{1684,3139},{1674,3129},
	},
	wlrs6 = {
		{1602,2661},{1598,2664},{1606,2657},{1644,2706},{1642,2708},{1648,2703},
	},
	boss1 = {{1679,3134}},
	boss2 = {{1618,3022}},
	boss3 = {{1628,3021}},
	boss4 = {{1633,3050}},
	boss5 = {{1599,2966}},
	
	fish = {
		{1585,2929},{1579,2940},{1571,2946},{1578,2947},{1584,2953},{1584,2961},{1589,2955},{1589,2946},{1594,2944},{1594,2952},	
	},
	boss6 = {{1588,2949}},
	boss7 = {{1533,2820}},
	J1 = {{1515,2810}},
	J2 = {{1526,2798}},
	J3 = {{1537,2805}},
	J4 = {{1552,2815}},
	J5 = {{1557,2839}},
	J6 = {{1550,2853}},
	J7 = {{1539,2850}},
	J8 = {{1531,2862}},
	J9 = {{1515,2847}},
	
	boss8 = {{1617,2679}},
	boss9 = {{1632,2695}},
	boss10 = {{1656,2646}},
	boss11 = {{1656,2654}},
	boss12 = {{1656,2646}},
	boss13 = {{1648,2645}},
	boss14 = {{1656,2654}},
	
	njn1 = {{1531,2823}},
	boss1_init = {{1664,3108}},
};

tbTraps = {
	{{1632,3193},{1639,3202},{1648,3109},{1667,3090}}, --第1关
	{{1655,3125},{1676,3103},{1599,3002},{1619,2983}}, --第2关
	{{1599,3002},{1619,2983},{1576,2941},{1581,2935}}, --第3关
	{{1599,3002},{1619,2983},{1576,2941},{1581,2935}}, --第4关
	{{1533,2892},{1539,2886},{1550,2773},{1557,2781}}, --第5关
	{{1582,2715},{1591,2723}}, --第6关
	{{1582,2715},{1591,2723}}, --第7关
	{{1582,2715},{1591,2723}}, --第7关
};

--trap点resetpos
tbResetPos = {
	{1674,3141},{1627,3033},{1592,2952},{1597,2963},{1556,2779},{1615,2690},{1615,2690},{1652,2660},
};

--闯关失败后的位置
tFildPos = {
	{1592,3201},{1674,3141},{1627,3033},{1592,2952},{1592,2952},{1531,2802},{1615,2690},{1615,2690},
};

--开启关卡传送的位置
tStartPos = {
	{1643,3186},{1632,3048},{1609,2984},{1597,2963},{1531,2851},{1607,2693},{1607,2693},{1652,2660},
};

--任盈盈move到pos开启关卡
tQrsMovePos = {
	{{1640,3194},{1674,3141}},{{1628,3037}},{{1604,2975}},{{1586,2947}},{{1535,2892},{1518,2845},{1528,2826}},{{1593,2707}},{{1647,2656}},{{1647,2656}},
};
--宝箱位置
tTtdBoxAward = {
	{1672,3124},{1620,3007},{1603,2969},{1588,2946},{1547,2788},{1611,2698},{1643,2661},{1643,2661},
};
tRealGod	= {
	tInfo	= {"Thi猲 th莕 h? ph祄", 5, "Duy tr? %d ph髏"},
	tState	= {
		[1] = {9920, "state_life_max_percent_add",	400,	"Sinh l鵦 t╪g t鑙 產 400%"},
		[2] = {9921, "state_immune",			100,		"Tr筺g th竔 mi詎 d辌h  "},
		[3] = {9922, "state_p_attack_percent_add",	300,	"Ngo筰 c玭g t╪g 300%"},
		[4] = {9923, "state_m_attack_percent_add",	300,	"N閕 c玭g t╪g 300%"},
		[5]	=	{9924, "state_o_defence_point_add",	1500, "Ngo筰 ph遪g t╪g 1500 甶觤"},
		[6]	=	{9925, "state_i_defence_point_add",	1500,	"N閕 ph遪g t╪g 1500 甶觤"},		
	},
	tItem = {2,1,30409},
	nNeedNum = 2,
}

--npc缓存表
tNpcInfo = {
--	[65537] = {
--			[8000] = "任盈盈",
--		
--		
--		},	
};
-------------------------------------------------------------------

------------------------一些公共函数------------------------------
function ttd_removeNpc(nNpcIdx)
	SetNpcLifeTime(nNpcIdx,0);
	local m = this.msPosition:getMapID();
	if tNpcInfo[m][nNpcIdx] then
		tNpcInfo[m][nNpcIdx] = nil;
	end
end

function ttd_clearMapNpc(m)
	ClearMapNpc(m);
	if tNpcInfo[m] then
		tNpcInfo[m] = {};
	end
	--没人了，把mission关了
	if GetMSPlayerCount(tbHDTTD.missionID) == 0 then
		CloseMission(tbHDTTD.missionID);
	end
end

function ttd_createNpc(model, name, m, x, y)
	local m = this.msPosition:getMapID();
	local nNpcIdx = CreateNpc(model, name, m, x, y);
	if tNpcInfo[m] then
		tNpcInfo[m][nNpcIdx] = name;
	else
		tNpcInfo[m] = {};
		tNpcInfo[m][nNpcIdx] = name;
	end
--	if self.DEBUG == 1 then
--		gf_PrintTable(tNpcInfo,2);
--	end
	return nNpcIdx;
end

function ttd_createSomeNpc(npc, pos, way, nAiType)
	local model, name = npc[1], npc[2];
	local m = this.msPosition:getMapID();
--	print("ttd_createSomeNpc",m)
	local newnpc = 0;
	if type(pos[1]) ~= "table" then
		pos = {pos};
	end
	for i = 1, getn(pos) do
		local x, y = pos[i][1], pos[i][2];
		newnpc = ttd_createNpc(model, name, m, x, y);
		if npc[3] then
			SetNpcScript(newnpc, npc[3]);
		end
		if npc[4] then
			SetNpcLifeTime(newnpc, npc[4]);
		end
		if npc[5] then
			SetCampToNpc(newnpc, npc[5]);
		end
		if npc[6] then
			SetNpcDir(newnpc, npc[6]);
		end
		if npc[7] then
			SetNpcRemoveScript(newnpc, npc[7]);
		end		
		SetNpcActivator(newnpc);
		if way then
			nAiType = nAiType or AT_SM_ATTACK;
			g_NpcAI:setAI(newnpc, nAiType);
			g_NpcAI:setWayPoint(newnpc, way);
		end
--		if name == "噩梦之花" then
--			SetCurrentNpcSFX(nNpcIDX, 905,0,1,18);
--		end
		if name == "竎 чc Chi Huy誸 Tng Vi" or name == "竔 H? Chi Ph蕁 Mai Kh玦" then
			SetCurrentNpcSFX(newnpc,905,0,0,18*3)
		end
	end	
	return newnpc;
end

function ttd_ChangeNpc2Talk(nNpcIDX)
--	print("nNpcIDX",nNpcIDX)
--	print(GetNpcName(nNpcIDX))
	ChangeNpcToFight(nNpcIDX, 0, 6);
	AddUnitStates(nNpcIDX, 7, 0);
	AddUnitStates(nNpcIDX, 8, -1000); --视野变0，为了防止对话npc乱动！这样做行不行啊！？
end

function ttd_ChangeNpc2Fight(nNpcIDX)
	ChangeNpcToFight(nNpcIDX, 3, 0);
	SetNpcDeathScript(nNpcIDX,thisFile);
	AddUnitStates(nNpcIDX, 7, 3);
	AddUnitStates(nNpcIDX, 8, 1000); --视野变回去，仅适用于此关卡，后人勿乱用
end

function ttd_findNpc(npcName)
	local m = this.msPosition:getMapID();
	if tNpcInfo[m] then
		local nNpcIDX = 0;
		for i,v in tNpcInfo[m] do
			if v == npcName then
				local strIDXName = GetNpcName(i); --再次确定此IDX的npc名字是不是要找的NPC
				if strIDXName == npcName then
					return i;
				end
			end
		end
	end
	--没在缓存里找到就全地图找
	local tNpcs = GetMapNpcIdx(m);
	if tNpcs == nil then
		return 0;
	end
	for i = 1, getn(tNpcs) do
		local nNpcIDX = tNpcs[i];
		if GetNpcName(nNpcIDX) == npcName then
			return nNpcIDX;
		end
	end
	return 0;
end

function ttd_findAllNpc(npcName)
	local npcs = {}
	local m = this.msPosition:getMapID();
	if tNpcInfo[m] then
		local nNpcIDX = 0;
		for i,v in tNpcInfo[m] do
			if v == npcName then
				local strIDXName = GetNpcName(i); --再次确定此IDX的npc名字是不是要找的NPC
				if strIDXName == npcName then
					tinsert(npcs,i);
				end
			end
		end
	end
	if getn(npcs) ~= 0 then
		return npcs;
	end
	--没在缓存里找到就全地图找
	local tNpcs = GetMapNpcIdx(m);
	for i = 1, getn(tNpcs) do
		local nNpcIDX = tNpcs[i];
		if GetNpcName(nNpcIDX) == npcName then
			tinsert(npcs, nNpcIDX);
		end
	end
	return npcs;
end

function ttd_isCaption()
	if PlayerIndex == GetTeamMember(0) then
		return 1;
	end
end

function ttd_reviveAll(nCamp)
	nCamp = nCamp or 0;
	this.msCamp:turnPlayer(nCamp,function ()
		if IsPlayerDeath() ~= 0 or GetLife() <= 1 then
			RevivePlayer(0);
		end
		RestoreAll();
		local m = this.msPosition:getMapID();
		SetTempRevPos(m,1474*32,2961*32); --临时重生点
	end)
end

function ttd_setPos(nPosX,nPosY,nMv)
	SetPos(nPosX,nPosY);
	SetFightState(1); --战斗状态 死亡去了吴仁道那里会清战斗状态
	if nMv and GetMissionV(nMv) == 1 then
		--作弊状态
		ttd_addGodState();
	end
end

function ttd_findRandomPlayer(x,y)
	this.msCamp:reflash();
	local oldPlayerIdx = PlayerIndex;
	local t = {};
	for i, p in this.msCamp.players do
		PlayerIndex = p;
		local m,x1,y1 = GetWorldPos();
		local d = floor(sqrt((x1-x)^2+(y1-y)^2));
		if d < 40 and IsPlayerDeath() == 0 then
			tinsert(t,p);
		end
	end
	PlayerIndex = oldPlayerIdx;
	local nNum = getn(t);
	if nNum ~= 0 then
		local nRand = random(1,nNum);
		return t[nRand];
	else
		return 0;
	end
end

function ttd_createQRS(nCurStage)
	local tQrsPos = {{1664,3115},{1615,3007},{1597,2963},{1577,2937},{1556,2779},{1621,2692},nil,{1647,2656}};
	local tLfPos = {{1667,3113},{1617,3007},{1599,2963},{1579,2937},{1558,2779},{1623,2692},nil,{1649,2656}};
	if tQrsPos[nCurStage] then
		local nNpcIDX = ttd_createSomeNpc(tNpcs.qrs,tQrsPos[nCurStage]); --创建任盈盈
		ttd_ChangeNpc2Talk(nNpcIDX);
		if nCurStage == 1 then
			nNpcIDX = ttd_createSomeNpc(tNpcs.lf,tLfPos[nCurStage]); --创建向问天
			ttd_ChangeNpc2Talk(nNpcIDX);
		end
	end
end

--每关开始后创建吴仁道
function ttd_createWRD()
	local m = this.msPosition:getMapID();
--	print(getn(tNpcInfo[m]))
	for i=1,getn(tNpcInfo[m]) do
		if tNpcInfo[m][i] == tNpcs.wrd[2] then
			--print("不用create无人道")
			return 0;
		end
	end
	ttd_createSomeNpc(tNpcs.wrd,tPos.wrd);
end

--过关了
function ttd_passStage(nStage,strBossName)
	local nCurStage = GetMissionV(MV_STAGE);
	if nCurStage ~= nStage then
		print(format("[ERROR] [ttd_passStage] [nStage=%d, nCurStage=%d]", nStage, nCurStage));
	end
	
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tbResetPos[nStage][1],tbResetPos[nStage][2]);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	local tCurPhase = firePhases:getPhase();
	if tCurPhase then
		if nStage == 7 or nStage == 8 then
			SetMissionV(firePhases.curPhaseLv,GetMissionV(firePhases.curPhaseLv)+1); --跳一关
		else
			---------------------
			--给经验
			this.msCamp:turnPlayer(0,ttd_ModifyExp,nStage); --经验
			--给箱子
			local nNpcIndex = CreateNpc("B秓 rng T礽 nguy猲",format("%s B秓 Rng",strBossName),m,tTtdBoxAward[nStage][1],tTtdBoxAward[nStage][2]);
			SetNpcScript(nNpcIndex,"\\settings\\static_script\\missions\\hunduantongtianding\\head.lua");
			--设置进入下一关开关
			SetMissionV(tbHDTTD.mv23,nNpcIndex);
			---------------------
		end
		tCurPhase:onFinish();
	end
	if nStage == 7 then
		Msg2Global("Ch骳 m鮪g ng o v? l﹎ "..GetCaptainName().."Цnh b筰 T? Nh薽 Ng? H祅h 秈 th? 7 Th玭g Thi猲 жnh, v筩h tr莕 d? t﹎ Th玭g Thi猲 L穙 T?.");
	elseif nStage == 8 then
		--清除通天令牌使用数量
		this.msCamp:turnPlayer(0,MissionAward_CheckAndResetSpecialAwardCouter,ttd_all_award_tb.t_ib_award.t_special); --对所有玩家执行
		Msg2Global("Ch骳 m鮪g ng o v? l﹎ "..GetCaptainName().."Цnh l飅, p tan ﹎ m璾 c馻 Th玭g Thi猲 L穙 T? t筰 c鯽 秈 che d蕌 Th玭g Thi猲 жnh.");
	end
	
	--2Xu活动产出
	this.msCamp:turnPlayer(0,extra_ttd_award);

	--活动产出
	if nStage > 0 and nStage < 4 then
		this.msCamp:turnPlayer(0,qht_raid_ttd_13);
		this.msCamp:turnPlayer(0,dzt_ttd_13);
	elseif nStage >= 4 and nStage <= 8 then
		this.msCamp:turnPlayer(0,qht_raid_ttd_47);
		this.msCamp:turnPlayer(0,dzt_ttd_47);
	end
	
	--新资料片卡牌活动
	this.msCamp:turnPlayer(0,cc_ttd_award,nStage);
	--其他功能获奖励汇总
	this.msCamp:turnPlayer(0,aw_ttd_award,nStage);
	
	_op_on_team(_stat_on_player_when_stage_pass, nStage)
	_stat_when_stage_pass(nStage)
	
end

--检测通天令牌消费额度
function ttd_checkConsume()
	this.msCamp:reflash();
	local oldPlayerIdx = PlayerIndex;
	local t = {};
	for i, p in this.msCamp.players do
		PlayerIndex = p;
		local nCur,nMax = MissionAward_GetSpecialAwardCounter(ttd_all_award_tb.t_ib_award.t_special)
		if nCur and nMax and nCur >= nMax then
			PlayerIndex = oldPlayerIdx;
			return 1;
		end
	end
	PlayerIndex = oldPlayerIdx;	
	return 0;
end

function ttd_addAllGodState()
	local funAddAllGodState = function()
		ttd_addGodState();
	end;
	this.msCamp:turnPlayer(0, funAddAllGodState);
end

function ttd_cleanAllGodState()
	local funAddAllGodState = function()
		ttd_cleanGodState();
	end;
	this.msCamp:turnPlayer(0, funAddAllGodState);
end

function ttd_cleanGodState()
	local tState = tRealGod.tState;
	for i = 1, getn(tState) do
		RemoveState(tState[i][1]);
	end
end

function ttd_addGodState()
	ttd_cleanGodState();
	local tState = tRealGod.tState;
	for i = 1, getn(tState) do
		CastState(tState[i][2], tState[i][3], tRealGod.tInfo[2] * 60 * 18, 1, tState[i][1], 1);
	end
	SyncCustomState(1, tState[1][1], 1, tRealGod.tInfo[1]);
	Talk(1, "", "C竎 h? nh薾 頲<color=yellow>"..tRealGod.tInfo[1].."<color>hi謚 qu?:  \n<color=green>"..ttd_getGodStateInfo().."<color>");
end

function ttd_getGodStateInfo()
	local strInfo	= "";
	local tState	= tRealGod.tState;
	for i = 1, getn(tState) do
		strInfo = strInfo..tState[i][4]..", ";
	end
	strInfo = strInfo..format(tRealGod.tInfo[3], tRealGod.tInfo[2])..".";
	return strInfo;
end

function ttd_askClose()
	Say("C? r阨 kh醝 秈 kh玭g? ",
		2,
		"\nX竎 nh薾/ttd_confirmClose",
		"\nK誸 th骳 i tho筰/nothing")
end

function ttd_confirmClose()
	local nCurStage = GetMissionV(MV_STAGE) or 0;
	gf_WriteLogEx("tongtian mission", format("team leave mission at stage %d member count is %d", nCurStage, GetTeamSize()));
	SetMissionV(MV_MISSION_STATUS,1);
	CloseMission(this.missionID);
end

function ttd_ModifyExp(nStage)
	MissionAward_FixAward(nStage,ttd_all_award_tb);
end

function ttd_CreateTable()
	local tRequire = {};
	for i = 1,8 do
		tinsert(tRequire,{2,1,30409,2});
	end
	return tRequire;
end

function ttd_OpenUi(nStage,tRequire)
	local strFunc = format("ttd_CallBack%d",nStage);

	MA_Mission_OpenUI(tbHDTTD.missionID, 0, "\\settings\\static_script\\missions\\hunduantongtianding\\head.lua", strFunc, tRequire);
end

function ttd_CallBack1(nId)
	ttd_CallBack_Stage(1, nId);
end

function ttd_CallBack2(nId)
	ttd_CallBack_Stage(2, nId);
end

function ttd_CallBack3(nId)
	ttd_CallBack_Stage(3, nId);
end

function ttd_CallBack4(nId)
	ttd_CallBack_Stage(4, nId);
end

function ttd_CallBack5(nId)
	ttd_CallBack_Stage(5, nId);
end

function ttd_CallBack6(nId)
	ttd_CallBack_Stage(6, nId);
end

function ttd_CallBack7(nId)
	ttd_CallBack_Stage(7, nId);
end

function ttd_CallBack8(nId)
	ttd_CallBack_Stage(8, nId);
end

--数据统计回调函数
function _ib_item_stat(g, d, p, n)
	if g == 2 and d == 1 and p == 30370 then--天门金令
		_stat_when_ib_produce_tianmenjinling(n)
	elseif g == 2 and d == 1 and p == 30410 then--天门碎片
		_stat_when_ib_produce_tianmensuipian(n)
	end
end

function ttd_CallBack_Stage(nStage,nId)
	local m = GetWorldPos();
	if m < 65537 then
		SendScript2Client('Open([[ma]])');
		return 0;
	end
	local nRet = MissionAward_RandAward(nStage, nId, ttd_all_award_tb, _ib_item_stat);
	if nId >= 8 and  nRet == 1 then
		ttd_DailyWeeklyTask(2);
	end	
	
	if nRet == 1 then
		if nId < 8 then
    		_stat_when_open_free_card()
    	else
    		_stat_when_open_ib_card()
    	end
	end
	return 1
end

function ttd_AddItemMail(sItemIds, strName, nRoom, nWeight, szTitle)
	if type(sItemIds) ~= "table" then
		WriteLog(format("[%s] [AddItemEx Tham s? sai!] [Role:%s (acc:%s)] [Item:%s]",
			strLog, GetName(), GetAccount(), strName));
		return 0;
	end
	local nCount = sItemIds[4];
	local nAmg = (nCount and 3) or 4;
	if getn(sItemIds) < nAmg then
		WriteLog(format("[%s] [AddItemEx Tham s? sai!] [Role:%s (acc:%s)] [Item:%s]",
			strLog, GetName(), GetAccount(), strName));
		return 0;
	end
	
	nRoom = nRoom or 1;
	nWeight = nWeight or 10;
	
	if gf_Judge_Room_Weight(nRoom, nWeight) == 1 then
		local nRet, nItemIdx = 0;
		if sItemIds[5] ~= nil then
			nRet, nItemIdx = AddItem(sItemIds[1],sItemIds[2],sItemIds[3],nCount,sItemIds[5],sItemIds[6],sItemIds[7],sItemIds[8],sItemIds[9],sItemIds[10],sItemIds[11],sItemIds[12],sItemIds[13],sItemIds[14]);
		else
			nRet, nItemIdx = AddItem(sItemIds[1],sItemIds[2],sItemIds[3],nCount);
		end
		if nRet == 0 then
			WriteLog(format("[%s] [AddItemEx: Th蕋 b筰] [Role:%s (acc:%s)] [Item:%s (%d,%d,%d,%d)]",
				strLog, GetName(),GetAccount(),strName,sItemIds[1],sItemIds[2],sItemIds[3],nCount));
		elseif nRet == 1 then
			Msg2Player("C竎 h? nh薾 頲 ["..strName.."]x"..nCount);
			WriteLog(format("[%s] [AddItemEx:nh薾 v藅 ph萴] [Role:%s (acc:%s)] [Item:%s (%d,%d,%d,%d)]",
				strLog or "", GetName(),GetAccount(),strName,sItemIds[1],sItemIds[2],sItemIds[3],nCount));
		elseif nRet == 2 then
			Msg2Player("C竎 h?  r琲["..strName.."]x"..nCount);
			WriteLog(format("[%s] [AddItemEx:nh r琲 ph莕 thng] [Role:%s (acc:%s)] [Item:%s (%d,%d,%d,%d)]",
				strLog, GetName(),GetAccount(),strName,sItemIds[1],sItemIds[2],sItemIds[3],nCount));
		end
		return nRet, nItemIdx;
	else
		local tMailInfo = 
		{
			szTo				= GetName(),
			szFrom			= "H錸 筺 Th玭g Thi猲 жnh",		-- 32 char
			szTitle			= szTitle or "Nh薾 v藅 ph萴",
			byPRI				= eMAIL_PRI_SUPER,
		};
		local tMailAttachmentInfo = 
		{
			{
				nType		= eMAIL_ATTACHMENT_T_TEXT,
				szContent	= "H祅h trang  y kh玭g th? nh薾 v藅 ph萴!",
			},
			{
				nType		= eMAIL_ATTACHMENT_T_SCRIPT,
				szContent	= format("giveTTDAward(%s)",Val2Str_mini(sItemIds)),
			},
		};
	
		local tMailConditionInfo = 
		{
			{
				nType		= eMAIL_CONDIFION_T_TAKEOUT,
				szContent	= format("#gf_Judge_Room_Weight(%d,%d)",nRoom,nWeight),
			},
		};
		nRet, guid = SendOneMail(tMailInfo, tMailAttachmentInfo, tMailConditionInfo);
		Msg2Player("H祅h trang v? tr鋘g lng kh玭g , v藅 ph萴  g鰅 qua th?, h穣 ki觤 tra!");
		WriteLog(format("[Mail] [%s] [GGUID:%d from:%s to:%s title:%s] [Con:%s Scr:%s Chk:%s]", (nRet >= 1 and "Success") or "Failed",
			guid, tMailInfo.szFrom, tMailInfo.szTo, tMailInfo.szTitle, tMailAttachmentInfo[1].szContent, "giveTTDAward", "gf_Judge_Room_Weight"));
		return nRet;
	end
end

function ttd_IsAllDeath()
	local oldPlayerIndex = PlayerIndex;
	for i = 1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		--print("gf_GetDistance(1474,2961) =",gf_GetDistance(1474,2961))
		--print("PlayerIndex ,",PlayerIndex);
		local m = this.msPosition:getMapID();
		local CurrMap,nX,nY = GetWorldPos();
		--print("m =",m)
		--print("CurrMap =",CurrMap)
		if m == CurrMap and gf_GetDistance(1474,2961) > 16 then
			if PlayerIndex ~= oldPlayerIndex and IsPlayerDeath() == 0 then
				PlayerIndex = oldPlayerIndex;
--				print("somebody is living")
				return 0;
			end
		end
	end
	PlayerIndex = oldPlayerIndex;
	return 1;
end

--通天宝箱
function main()
--	print("GetName =",GetName())
--	print("g_tMAPlayerInfo =",g_tMAPlayerInfo)
--	print("g_tMAPlayerInfo[GetName()] =",g_tMAPlayerInfo[GetName()])
	local nNpcIndex = GetMissionV(tbHDTTD.mv23);
--	print("GetMissionV(mv23) =",nNpcIndex);
	if nNpcIndex == 0 then
		print("ERROR: T礽 nguy猲 B秓 Rng ")
		return 0;
	end
	--是否是队长
	if GetName() ~= GetCaptainName() then
		return 0;
	end
	--开启下一关
	SetMissionV(tbHDTTD.mv23,0);
	--翻牌
	local nStage = GetMissionV(MV_STAGE);
	if nStage < 1 or nStage > 8 then 
		print("nStage = ",nStage);
		return 0 ;
	end;
	local tRequire = ttd_CreateTable();
	ttd_OpenUi(nStage,tRequire);
	--使箱子消失
	SetNpcLifeTime(nNpcIndex,0);
end

function ttd_nothing()
	--do nothing
end

--每日每周任务
function ttd_DailyWeeklyTask(nType)
	if nType == 1 then
		if tGtTask:check_cur_task(83) == 1 and GetTask(VET_TDD_DALIY_TASK_CROSS) ~= 1 then
			SetTask(VET_TDD_DALIY_TASK_CROSS,1);
			Msg2Player(format("Nhi謒 v? ng祔 - th玭g quan Th玭g Thi猲 Huy詎 C秐h%d/1 l莕 (ho祅 th祅h) ",GetTask(VET_TDD_DALIY_TASK_CROSS)));
		end
		if tGtTask:check_cur_task(84) == 1 and GetTask(VET_TDD_WEEK_TASK_CROSS) < 4 then
			SetTask(VET_TDD_WEEK_TASK_CROSS,GetTask(VET_TDD_WEEK_TASK_CROSS) + 1);
			if GetTask(VET_TDD_WEEK_TASK_CROSS) == 4 then
				Msg2Player(format("Nhi謒 v? tu莕 - th玭g quan Th玭g Thi猲 Huy詎 C秐h%d/4 l莕 (ho祅 th祅h) ",GetTask(VET_TDD_WEEK_TASK_CROSS)));
			else
				Msg2Player(format("Nhi謒 v? tu莕 - th玭g quan Th玭g Thi猲 Huy詎 C秐h%d/4 l莕 ",GetTask(VET_TDD_WEEK_TASK_CROSS)));
			end
		end
	elseif nType == 2 then
		if tGtTask:check_cur_task(87) == 1 and GetTask(VET_DALIY_TASK_FANPAI) ~= 1 then
			SetTask(VET_DALIY_TASK_FANPAI,1);
			Msg2Player(format("Nhi謒 v? ng祔 - l藅 b礽 thu ph? %d/1 l莕 (ho祅 th祅h)",GetTask(VET_DALIY_TASK_FANPAI)));
		end
		if tGtTask:check_cur_task(88) == 1 and GetTask(VET_WEEK_TASK_FANPAI) < 15 then
			SetTask(VET_WEEK_TASK_FANPAI,GetTask(VET_WEEK_TASK_FANPAI) + 1);
			if GetTask(VET_WEEK_TASK_FANPAI) == 15 then
				Msg2Player(format("Nhi謒 v? tu莕 - l藅 b礽 thu ph? %d/15 l莕 (ho祅 th祅h)",GetTask(VET_WEEK_TASK_FANPAI)));
			else
				Msg2Player(format("Nhi謒 v? tu莕 - l藅 b礽 thu ph? %d/15 l莕",GetTask(VET_WEEK_TASK_FANPAI)));
			end
		end
	end
end

