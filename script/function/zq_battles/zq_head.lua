Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\zq_battles\\zq_define.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\lib\\talktmp.lua")

--获得阵营
function ZQ_GetCamp()
	local nValue = GetTask(ZQ_CONST_JG_TASK);
	local nCamp = gf_GetTaskByte(ZQ_BATTLE_TASK1, 1);
	if nValue > 0 then
		if nCamp ~= SONG_ID then
			gf_SetTaskByte(ZQ_BATTLE_TASK1, 1, SONG_ID, TASK_ACCESS_CODE_ZQBATTLE);
			ZQ_Task_DelAndClean(LIAO_ID);
		end
		return SONG_ID;
	elseif nValue < 0 then
		if nCamp ~= LIAO_ID then
			gf_SetTaskByte(ZQ_BATTLE_TASK1, 1, LIAO_ID, TASK_ACCESS_CODE_ZQBATTLE);
			ZQ_Task_DelAndClean(SONG_ID);
		end
		return LIAO_ID;
	else
		return ALL_ID;
	end
end

function ZQ_Task_DelAndClean(nCamp)
	local nCampAnother;
	if nCamp == SONG_ID then
		nCampAnother = LIAO_ID;
	elseif nCamp == LIAO_ID then
		nCampAnother = SONG_ID;
	else
		return 0;
	end
	for i = 0, 1 do
		local nIndex = 2 * i + nCamp;
		local tSubTaskList = ZQ_TASK_LIST[nIndex];
		local nIndexAnother = 2 * i + nCampAnother;
		local tSubTaskListAnother = ZQ_TASK_LIST[nIndexAnother];
		if not tSubTaskList then return 0; end
		if not tSubTaskListAnother then return 0; end
		for j = 1, getn(tSubTaskList) do
			local tCeil = tSubTaskList[j];
			if not tCeil or getn(tCeil) ~= ZQ_TASK_TOTAL then return 0; end
			local tCeilAnother = tSubTaskListAnother[j];
			if not tCeilAnother or getn(tCeilAnother) ~= ZQ_TASK_TOTAL then return 0; end
			--复制状态
			gf_SetTaskBit(tCeilAnother[2], tCeilAnother[3], gf_GetTaskBit(tCeil[2], tCeil[3]), TASK_ACCESS_CODE_ZQBATTLE);
			gf_SetTaskBit(tCeilAnother[2], tCeilAnother[4], gf_GetTaskBit(tCeil[2], tCeil[4]), TASK_ACCESS_CODE_ZQBATTLE);
			--删除接了的任务
			if tGtTask:check_cur_task(tCeil[1]) == 1 then
				DirectDeleteTask(tCeil[1]);
				--对应已接置零
				gf_SetTaskBit(tCeilAnother[2], tCeilAnother[4], 0, TASK_ACCESS_CODE_ZQBATTLE);
			end
			--原状态置零
			gf_SetTaskBit(tCeil[2], tCeil[3], 0, TASK_ACCESS_CODE_ZQBATTLE);
			gf_SetTaskBit(tCeil[2], tCeil[4], 0, TASK_ACCESS_CODE_ZQBATTLE);
		end		
	end
end

--保存阵营
function ZQ_SetCamp(nCamp)
	if nCamp ~= SONG_ID and nCamp ~= LIAO_ID then
		print("UERROR:ZQ_SetCamp nCamp illegality")
		return 0;
	end
	if nCamp == SONG_ID and GetTask(ZQ_CONST_JG_TASK) == 0 then
		SetTask(ZQ_CONST_JG_TASK, 1);
	end
	if nCamp == LIAO_ID and GetTask(ZQ_CONST_JG_TASK) == 0 then
		SetTask(ZQ_CONST_JG_TASK, -1);
	end
	gf_SetTaskByte(ZQ_BATTLE_TASK1, 1, nCamp, TASK_ACCESS_CODE_ZQBATTLE);
end

--判断阵营
function ZQ_JugdeCamp(nCamp)
	if ZQ_GetCamp() == nCamp then
		return 1;
	else
		return 0;
	end
end

--地图合法
function ZQ_IsAllowMap()
	local nMapId, nX, nY = GetWorldPos();
	if nMapId ~= ZQ_MAP_ID then
		return 0;
	end
	return 1;
end

--记录进入小关卡前的坐标
function ZQ_RecordPos()
	local nMapId, nX, nY = GetWorldPos();
	gf_SetMyTaskByte(ZQ_BATTLE_TASK10, 1, 2, nX, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK10, 3, 4, nY, TASK_ACCESS_CODE_ZQBATTLE);
end

--出小关卡是调用
function ZQ_OutfromCopy()
	local nX = gf_GetMyTaskByte(ZQ_BATTLE_TASK10, 1, 2);
	local nY = gf_GetMyTaskByte(ZQ_BATTLE_TASK10, 3, 4);
--	if nX == 0 and nY == 0 then
--		local nCamp = ZQ_GetCamp();
--		nX = ZQ_OUTER_EXITPOS[nCamp][1];
--		nY = ZQ_OUTER_EXITPOS[nCamp][2];
--	end
	if nX ~= 0 or nY ~= 0 then
		SetPos(nX, nY);
		gf_SetMyTaskByte(ZQ_BATTLE_TASK10, 1, 2, 0, TASK_ACCESS_CODE_ZQBATTLE);
		gf_SetMyTaskByte(ZQ_BATTLE_TASK10, 3, 4, 0, TASK_ACCESS_CODE_ZQBATTLE);
		gf_SetTaskBit(ZQ_BATTLE_TASK11, 17, 0, TASK_ACCESS_CODE_ZQBATTLE);
		SetFightState(1);
	end
end

--创建地图trap点
function ZQ_CreateTrap()
	local tTraps = {
		{ZQ_MAP_ID, {1574,3787},{1574,3804}, "\\script\\function\\zq_battles\\zq_trap.lua"},
		{ZQ_MAP_ID, {1574,3804},{1588,3804}, "\\script\\function\\zq_battles\\zq_trap.lua"},
		{ZQ_MAP_ID, {1588,3804},{1588,3787}, "\\script\\function\\zq_battles\\zq_trap.lua"},
		{ZQ_MAP_ID, {1588,3787},{1574,3787}, "\\script\\function\\zq_battles\\zq_trap.lua"},
	};
	gf_CreateTraps(tTraps);
	tTraps = {
		{ZQ_MAP_ID, {1900,3280},{1900,3296}, "\\script\\function\\zq_battles\\zq_trap.lua"},
		{ZQ_MAP_ID, {1900,3296},{1910,3296}, "\\script\\function\\zq_battles\\zq_trap.lua"},
		{ZQ_MAP_ID, {1910,3296},{1910,3280}, "\\script\\function\\zq_battles\\zq_trap.lua"},
		{ZQ_MAP_ID, {1910,3280},{1900,3280}, "\\script\\function\\zq_battles\\zq_trap.lua"},
	};
	gf_CreateTraps(tTraps);
end

--npc创建
function ZQ_NpcCreate()
	if IsSubSystemOpen(SYS_SWITCH_ZHENQI_BATTLE) ~= 1 then
		return 0;
	end	
	local nNpcIndex, tNpcPos = {};
	--接引人
	nNpcIndex = CreateNpc("ZM_jieyingren", "Ch﹏ Ma Ti誴 D蒼 S?", 300, 1796, 3358);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_jieyinren.lua");
	--宋军营地
	nNpcIndex = CreateNpc("ZM_songjiangjun", "T鑞g Tng Qu﹏", ZQ_MAP_ID, 1572, 3800);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_jiangjun.lua");
	nNpcIndex = CreateNpc("ZM_chunyangzhenren", "Thu莕 Dng Ch﹏ Nh﹏", ZQ_MAP_ID, 1540, 3772);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\chunyangzhenren.lua");
	nNpcIndex = CreateNpc("ZM_songjunxuguan", "T鑞g Qu﹏ Nhu Quan", ZQ_MAP_ID, 1592, 3827);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\junxuguang.lua");
	nNpcIndex = CreateNpc("ZM_songshangren", "T鑞g Thng Nh﹏", ZQ_MAP_ID, 1532, 3756);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_songsale.lua");
	tNpcPos = {
			{1644, 3765},
			{1645, 3762},
			{1646, 3771},
			{1644, 3782},
			{1640, 3784},
			{1640, 3773},
			{1634, 3772},
			{1634, 3781},
		};
	for i = 1, getn(tNpcPos) do
		nNpcIndex = CreateNpc("ZM_songshangbing", "T鑞g Thng Binh", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
		SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_songshangbing.lua");
	end
	tNpcPos = {
			{1590, 3703},
			{1585, 3706},
			{1574, 3708},
			{1566, 3714},
			{1588, 3722},
			{1562, 3731},
			{1570, 3722},
			{1579, 3717},
			{1594, 3713},
			{1598, 3727},
			{1584, 3730},
			{1576, 3737},
			{1567, 3739},
			{1608, 3731},
			{1598, 3741},
		};
	for i = 1, getn(tNpcPos) do
		nNpcIndex = CreateNpc("ZM_songshibing", "T鑞g S? Binh", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
		SetNpcDeathScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\song_shibing_death.lua");
		SetCampToNpc(nNpcIndex, ZQ_tCampString[SONG_ID]);
	end
	nNpcIndex = CreateNpc("ZM_songxunyingguan", "T鑞g Tu莕 Doanh Quan", ZQ_MAP_ID, 1580, 3793);
	SetCampToNpc(nNpcIndex, ZQ_tCampString[SONG_ID]);
	nNpcIndex = CreateNpc("ZM_songxunyingguan", "T鑞g Tu莕 Doanh Quan", ZQ_MAP_ID, 1617, 3736);
	SetCampToNpc(nNpcIndex, ZQ_tCampString[SONG_ID]);
	nNpcIndex = CreateNpc("ZM_songjiandie", "Gi竛 謕 秐h Phong", ZQ_MAP_ID, 1616, 3823);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\jd_yingfeng.lua");
	nNpcIndex = CreateNpc("ZM_songxianfeng", "T鑞g ti猲 phong", ZQ_MAP_ID, 1622, 3737);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_songxianfeng.lua");
	tNpcPos = {
		{1704, 3753},
		{1599, 3575},
		{1611, 3503},
	}
	for i = 1, getn(tNpcPos) do
		nNpcIndex = CreateNpc("ZM_mohuasongXF", "Ma H鉧 T鑞g Ti猲 Phong", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
	end	
	--辽军营地
	nNpcIndex = CreateNpc("ZM_liaojiangjun", "Li猽 Tng Qu﹏", ZQ_MAP_ID, 1912, 3282);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_jiangjun.lua");
	nNpcIndex = CreateNpc("ZM_jinlunfawang", "Kim Lu﹏ Ph竝 Vng", ZQ_MAP_ID, 1885, 3250);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\jinglunfawang.lua");
	nNpcIndex = CreateNpc("ZM_liaojunxuguan", "Li猽 Qu﹏ Nhu Quan", ZQ_MAP_ID, 1961, 3314);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\junxuguang.lua");
	nNpcIndex = CreateNpc("ZM_liaoshangren", "Li猽 Thng Nh﹏", ZQ_MAP_ID, 1953, 3306);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_liaosale.lua");
	tNpcPos = {
			{1837, 3295},
			{1842, 3299},
			{1847, 3305},
			{1843, 3291},
			{1847, 3298},
			{1848, 3287},
			{1851, 3293},
			{1853, 3301},
		};
	for i = 1, getn(tNpcPos) do
		nNpcIndex = CreateNpc("ZM_liaoshangbing", "Li猽 Thng Binh", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
		SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_liaoshangbing.lua");
	end
	tNpcPos = {
			{1902, 3319},
			{1912, 3328},
			{1903, 3332},
			{1895, 3336},
			{1887, 3355},
			{1894, 3349},
			{1901, 3349},
			{1909, 3343},
			{1916, 3345},
			{1923, 3343},
			{1917, 3359},
			{1910, 3360},
			{1907, 3372},
			{1903, 3363},
			{1895, 3360},
		};
	for i = 1, getn(tNpcPos) do
		nNpcIndex = CreateNpc("ZM_liaoshibing", "Li猽 S? Binh", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
		SetNpcDeathScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\liao_shibing_death.lua");
		SetCampToNpc(nNpcIndex, ZQ_tCampString[LIAO_ID]);
	end
	nNpcIndex = CreateNpc("ZM_liaoxunyingguan", "Li猽 TU莕 Doanh Quan", ZQ_MAP_ID, 1927, 3298);
	SetCampToNpc(nNpcIndex, ZQ_tCampString[LIAO_ID]);
	nNpcIndex = CreateNpc("ZM_liaoxunyingguan", "Li猽 TU莕 Doanh Quan", ZQ_MAP_ID, 1920, 3293);
	SetCampToNpc(nNpcIndex, ZQ_tCampString[LIAO_ID]);
	nNpcIndex = CreateNpc("ZM_liaojiandie", "Gi竛 謕 Kim 猽", ZQ_MAP_ID, 1900, 3252);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\jd_jingdiao.lua");
	nNpcIndex = CreateNpc("ZM_liaoxianfeng", "Li猽 ti猲 phong", ZQ_MAP_ID, 1866, 3331);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_liaoxianfeng.lua");
	tNpcPos = {
		{1753, 3323},
		{1886, 3457},
		{1862, 3563},
	}
	for i = 1, getn(tNpcPos) do
		nNpcIndex = CreateNpc("ZM_mohualiaoXF", "Ma H鉧 Li猽 Ti猲 Phong", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
	end
	--资源点
	tNpcPos = {
			{1728, 3462},
			{1755, 3488},
			{1769, 3486},
			{1778, 3522},
			{1797, 3543},
			{1777, 3572},
			{1748, 3593},
			{1729, 3563},
			{1714, 3558},
			{1701, 3573},
			{1685, 3524},
			{1703, 3491},
		};
	for i = 1, getn(tNpcPos) do
		nNpcIndex = CreateNpc("ZM_zijinmu", "T? Kim M閏", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
		SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\cai_ji.lua");
	end
	tNpcPos = {
			{1697, 3296},
			{1708, 3316},
			{1693, 3327},
			{1676, 3334},
			{1689, 3353},
			{1682, 3376},
			{1696, 3384},
			{1702, 3412},
			{1687, 3420},
			{1673, 3401},
			{1656, 3393},
			{1650, 3413},
	};
	for i = 1, getn(tNpcPos) do
		nNpcIndex = CreateNpc("ZM_jintiekuang", "Kho竛 tinh thi誸", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
		SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\cai_ji.lua");
	end
	tNpcPos = {
			{1852, 3583},
			{1867, 3594},
			{1881, 3610},
			{1866, 3625},
			{1846, 3651},
			{1832, 3665},
			{1820, 3677},
			{1815, 3652},
			{1801, 3633},
			{1861, 3622},
			{1831, 3613},
			{1841, 3602},
	};
	for i = 1, getn(tNpcPos) do
		nNpcIndex = CreateNpc("ZM_qixinghua", "Th蕋 tinh hoa", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
		SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\cai_ji.lua");
	end
	--祭坛
	tNpcPos = {
		{1843, 3466},
		{1719, 3262},
		{1596, 3513},
		{1804, 3697},
	}
	for i = 1, getn(tNpcPos) do
		nNpcIndex = CreateNpc("Th竛h H醓 Уi", "T? Уn", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
		SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_jitan.lua");
	end
	--修复封印
	ZQ_RepairSeal_NpcCreate();
	--邪灵赌约
	nNpcIndex = CreateNpc("ZM_shenmenxieling", "Sinh M玭 T? Linh", ZQ_MAP_ID, 1934, 3685);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\shengmen_xieling.lua");
	--重启封印
	ZQ_RestartSeal_NpcCreate();
	--保卫封印
	ZQ_ProtectSeal_NpcCreate();
	--设置trap点
	ZQ_CreateTrap();
end

--修复封印NPC创建
function ZQ_RepairSeal_NpcCreate()
	local nNpcIndex = CreateNpc("ZM_jinmenzhenling", "C秐h M玭 Tr薾 Linh", ZQ_MAP_ID, 1602, 3303);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\jinmen_zhenling.lua");
	for i = 1, getn(ZQ_REPAIRREAL_NPC) do
		nNpcIndex = CreateNpc(ZQ_REPAIRREAL_NPC[i][2], ZQ_REPAIRREAL_NPC[i][1], ZQ_MAP_ID, ZQ_REPAIRREAL_NPC[i][3], ZQ_REPAIRREAL_NPC[i][4]);
		SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_repairreal_npc.lua");
	end
end

--重启封印
function ZQ_RestartSeal_NpcCreate()
	local npcIndex = CreateNpc("ZM_simenzhenling", "T? M玭 Tr薾 Linh", ZQ_MAP_ID, 1573, 3520);
	SetNpcScript(npcIndex, "\\script\\function\\zq_battles\\npc\\simen_zhenling.lua");
	for i = 1, getn(ZQ_RESTART_REAL_NPC) do
		npcIndex = CreateNpc(ZQ_RESTART_REAL_NPC[i][2], ZQ_RESTART_REAL_NPC[i][1], ZQ_MAP_ID, ZQ_RESTART_REAL_NPC[i][3], ZQ_RESTART_REAL_NPC[i][4]);
		SetNpcScript(npcIndex, "\\script\\function\\zq_battles\\npc\\zm_restartseal.lua");
	end
	for i = 1, getn(ZQ_RESTART_JIGUAN_NPC) do
		npcIndex = CreateNpc(ZQ_RESTART_JIGUAN_NPC[i][2], ZQ_RESTART_JIGUAN_NPC[i][1]..tostring(i), ZQ_MAP_ID, ZQ_RESTART_JIGUAN_NPC[i][3], ZQ_RESTART_JIGUAN_NPC[i][4]);
	end
end

--保护封印
function ZQ_ProtectSeal_NpcCreate()
	local nNpcIndex = CreateNpc("ZM_meimenzhenling", "Di謙 M玭 Tr薾 Linh", ZQ_MAP_ID, 1874, 3491);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\miemen_zhenling.lua");
	for i = 1, getn(ZQ_MMZL_NPC_TABLE) do
		nNpcIndex = CreateNpc(ZQ_MMZL_NPC_TABLE[i][2], ZQ_MMZL_NPC_TABLE[i][1], ZQ_MAP_ID, ZQ_MMZL_NPC_TABLE[i][3], ZQ_MMZL_NPC_TABLE[i][4]);
	end
end

function ZQ_CreateChannel()
	for nChannel, _ in pairs(ZQ_BATTLE_CHANNEL) do
		CreateChannel(ZQ_BATTLE_CHANNEL[nChannel][1], ZQ_BATTLE_CHANNEL[nChannel][2]);
	end
end

function ZQ_SetPlayerState()
	LeaveTeam();
	SetCreateTeam(1);
	local nCamp = ZQ_GetCamp();
	if nCamp ~= SONG_ID and nCamp ~= LIAO_ID then
		return 0;
	end
	ZQ_SetCamp(nCamp);
	SetCampToPlayer(ZQ_tCampString[nCamp]);
	if nCamp == SONG_ID then
		SetPKFlag(1, 0);
	elseif nCamp == LIAO_ID then
		SetPKFlag(1, 1);
	end
	--SetFightState(1);
	SetDeathPunish(0);
	ForbidChangePK(1);
	InteractiveEnable(0);
	UseScrollEnable(0);
	KillFollower();
	SetDeathScript(ZQ_PLAYER_DEATH_SCRIPT);
	EnterChannel(ZQ_BATTLE_CHANNEL[ALL_ID][1]);
	EnterChannel(ZQ_BATTLE_CHANNEL[nCamp][1]);
	--给登出触发器
	if GetTrigger(3009*2) == 0 then
		CreateTrigger(3, 3009, 3009*2);
	end
	SetTempRevPos(ZQ_MAP_ID, ZQ_OUTER_EXITPOS[nCamp][1]*32, ZQ_OUTER_EXITPOS[nCamp][2]*32);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK10, 1, 2, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK10, 3, 4, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskBit(ZQ_BATTLE_TASK11, 17, 0, TASK_ACCESS_CODE_ZQBATTLE);
	ZQ_RepairReal_Clean();
	ZQ_ReStartSeal_Clean();
	ZQ_ProtectSeal_Clean();
	ZQ_EvilBet_Clean();
	ZQ_Trigger_Clean();
	FloatMsg2Player();
end

function ZQ_ResetPlayerState()
	SetCreateTeam(0);
	SetCampToPlayer("");
	SetFightState(0);
	SetDeathPunish(1);
	ForbidChangePK(0);
	SetDeathScript("");
	SetPKFlag(0, 0);
	InteractiveEnable(1);
	UseScrollEnable(1);
	KillFollower();
	LeaveChannel(ZQ_BATTLE_CHANNEL[ALL_ID][1]);
	LeaveChannel(ZQ_BATTLE_CHANNEL[SONG_ID][1]);
	LeaveChannel(ZQ_BATTLE_CHANNEL[LIAO_ID][1]);
	--移除登出触发器
	if GetTrigger(3009*2) ~= 0 then
		RemoveTrigger(GetTrigger(3009*2));
	end
	SetTempRevPos(0,0,0);
	RemvoeTempEffect();
	gf_SetMyTaskByte(ZQ_BATTLE_TASK10, 1, 2, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK10, 3, 4, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskBit(ZQ_BATTLE_TASK11, 17, 0, TASK_ACCESS_CODE_ZQBATTLE);
	ZQ_RepairReal_Clean();
	ZQ_ReStartSeal_Clean();
	ZQ_ProtectSeal_Clean();
	ZQ_EvilBet_Clean();
	ZQ_Trigger_Clean();
	FloatMsg2Player();
	local nCamp = ZQ_GetCamp();
	DelItem(ZQ_ITEM_FLAG[nCamp][1], ZQ_ITEM_FLAG[nCamp][2], ZQ_ITEM_FLAG[nCamp][3], 1);
end

--生成或返回开放的任务SubIndex
function ZQ_GetTaskIndexTable(tTaskCnf, nMax)
	if not tTaskCnf then return nil; end
	local nSize = getn(tTaskCnf);
	if nSize < nMax then return nil; end
	local tRezult = {};
	for i = 1, nSize do
		local nCeil = tTaskCnf[i];
		if not nCeil or getn(nCeil) ~= ZQ_TASK_TOTAL then return nil; end
		if gf_GetTaskBit(nCeil[2], nCeil[3]) == 1 then
			tinsert(tRezult, i);
		end
	end
	local nRezultSize = getn(tRezult);
	if nRezultSize == 0 then
		local nRand = random(nSize);
		for i = 1, nMax do
			tinsert(tRezult, nRand);
			gf_SetTaskBit(tTaskCnf[nRand][2], tTaskCnf[nRand][3], 1, TASK_ACCESS_CODE_ZQBATTLE);
			nRand = nRand + 2;
			if nRand > nSize then
				nRand = mod(nRand, nSize);
			end
		end
	else
		if nMax ~= nRezultSize then
			print("UERROR:\\script\\function\\zq_battles\\zq_head.lua ZQ_GetTaskIndexTable");
			return nil;
		end
	end
	return tRezult;
end

--nIndex 指定那个NPC的表，
--nMax 最大能给的任务数
function ZQ_TaskDialog(nIndex, nMax)
	local tTaskCnf = ZQ_TASK_LIST[nIndex];
	if not tTaskCnf then return nil; end
	local tDialog = {};
	local tIndex = ZQ_GetTaskIndexTable(tTaskCnf, nMax);
	if not tIndex then
		print("UERROR:\\script\\function\\zq_battles\\zq_head.lua ZQ_TaskDialog tIndex is nil");
		return tDialog;
	end
	for i = 1, getn(tIndex) do
		if tIndex[i] < 0 or tIndex[i] > getn(tTaskCnf) then
			return nil
		end
		local strTemp = format("\n%s(%s)/#ZQ_AcceptOrFinish_Task(%d, %d)", tTaskCnf[tIndex[i]][getn(tTaskCnf[tIndex[i]])], ZQ_Return_String(nIndex, tIndex[i]), nIndex, tIndex[i]);
		tinsert(tDialog, strTemp);
	end
	return tDialog;
end

--接取或完成实现
function ZQ_AcceptOrFinish_Task(nIndex, nSubIndex)
	local tTaskCnf = ZQ_TASK_LIST[nIndex];
	if not tTaskCnf then return 0;  end
	local tTaskSubCnf = tTaskCnf[nSubIndex];
	if not tTaskSubCnf or getn(tTaskSubCnf) ~= ZQ_TASK_TOTAL then return 0; end
	--是否接过
	local nIsAccept = gf_GetTaskBit(tTaskSubCnf[2], tTaskSubCnf[4]);
	if nIsAccept ~= 1 then
		if 1 == DirectGetGTask(tTaskSubCnf[1], 2) then
			gf_SetTaskBit(tTaskSubCnf[2], tTaskSubCnf[4], 1, TASK_ACCESS_CODE_ZQBATTLE);
			Msg2Player(format("C竎 h?  nh薾 nhi謒 v? [%s]", tTaskSubCnf[5]));
		end
	else
		local nRet = DirectFinishGTask(tTaskSubCnf[1], 2);
		if nRet == 2 then
			Msg2Player("Nhi謒 v? v蒼 ch璦 ho祅 th祅h!");
			--可以跳过
			if tGtTask:IsCanJump(tTaskSubCnf[1]) == 1 then
				Say(format("<color=green>%s:<color>C竎 h? x竎 nh d飊g <color=red>%d<color> v祅g  h? tr? ho祅 th祅h nhi謒 v??", GetNpcName(GetTargetNpc()), tGtTask:GetJumpTaskCost(tTaskSubCnf[1])/10000), 2, "\nXin gi髉 m譶h ho祅 th祅h/#JumpGTask("..tTaskSubCnf[1]..","..(1)..")", "\nTa mu鑞 t? tay l祄/nothing");
			end
		elseif nRet == -3 then
			Msg2Player("C竎 h?  ho祅 th祅h nhi謒 v? n祔 r錳!");
		end
	end
end

--任务状态
function ZQ_Return_String(nIndex, nSubIndex)
	local tTaskCnf = ZQ_TASK_LIST[nIndex];
	if not tTaskCnf then return 0;  end
	local tTaskSubCnf = tTaskCnf[nSubIndex];
	if not tTaskSubCnf or getn(tTaskSubCnf) ~= ZQ_TASK_TOTAL then return 0; end
	local tString = {"Ch璦 nh薾","Ch璦 ho祅 th祅h","C? th? giao","Ng祔 mai h穣 n", "C? th? b? qua"};
	if gf_GetTaskBit(tTaskSubCnf[2], tTaskSubCnf[4]) ~= 1 then
		return tString[1];
	else
		if tGtTask:check_cur_task(tTaskSubCnf[1]) == 0 then
			return tString[4];
		else
			if DirectIsTaskFinish(tTaskSubCnf[1]) == 1 then
				return tString[3];
			else
				if tGtTask:CheckJumpTask(tTaskSubCnf[1]) == 1 then
					return tString[2].."/"..tString[5];
				else
					return tString[2];
				end
			end
		end
	end
	return "ERROR";
end

--隔天清理任务状态
function ZQ_Everyday_ReSet()
	ZQ_Everyday_ReSet_NewTask_Record();
	ZQ_Everyday_ReSet_NewTask();
	ZQ_Everyday_ReSet_JoinTimes();
end

--重置祭坛进入限制
function ZQ_Everyday_ReSet_JoinTimes()
	gf_SetMyTaskBit(ZQ_BATTLE_TASK6, 10, 15, 0, TASK_ACCESS_CODE_ZQBATTLE);
end

--重置任务系统完成计数标记，这些是特殊处理
function ZQ_Everyday_ReSet_NewTask_Record()
	local tList = {
			{112, ZQ_KILL_PLAYER_SONG},
			{117, ZQ_KILL_PLAYER_LIAO},
			{124, ZQ_CURE_SONG},
			{128, ZQ_CURE_LIAO},
			{129, ZQ_TASK_QXH},
			{130, ZQ_TASK_ZJM},
			{131, ZQ_TASK_JTK},
	}--任务ID与使用的任务变量对应
	for i = 1, getn(tList) do
		if tGtTask:check_cur_task(tList[i][1]) ~= 1 then
				SetTask(tList[i][2], 0);
		end
	end 
end

--重置任务系统的标记
function ZQ_Everyday_ReSet_NewTask()
	local nAllSize = getn(ZQ_TASK_LIST);
	for i = 1, nAllSize do
		local tSubTaskList = ZQ_TASK_LIST[i];
		if 1 == ZQ_GetTaskStatus(tSubTaskList) then
			for j = 1, getn(tSubTaskList) do
				if tGtTask:check_cur_task(tSubTaskList[j][1]) == 0 then
					gf_SetTaskBit(tSubTaskList[j][2], tSubTaskList[j][3], 0, TASK_ACCESS_CODE_ZQBATTLE);
					gf_SetTaskBit(tSubTaskList[j][2], tSubTaskList[j][4], 0, TASK_ACCESS_CODE_ZQBATTLE);
				end
			end
		else
			for j = 1, getn(tSubTaskList) do
				if tGtTask:check_cur_task(tSubTaskList[j][1]) == 0 then
					gf_SetTaskBit(tSubTaskList[j][2], tSubTaskList[j][4], 0, TASK_ACCESS_CODE_ZQBATTLE);
				end
			end
		end
	end
end

--返回~1：说明不用重置3，没有接任务重置4
--返回1：说明全部重置
function ZQ_GetTaskStatus(tSubTaskList)
	if not tSubTaskList then return -1; end
	for i = 1, getn(tSubTaskList) do 
		if getn(tSubTaskList[i]) ~= ZQ_TASK_TOTAL then
			print("UERROR:ZQ_GetTaskStatus getn(tSubTaskList[i]) ~= 5");
			return -1;
		end
		--接过任务
		--if gf_GetTaskBit(tSubTaskList[i][2], tSubTaskList[i][4]) == 1 then
		--没有交
		if tGtTask:check_cur_task(tSubTaskList[i][1]) == 1 then
			return 0;
		end
		--end
	end
	return 1;
end

--采集
function ZQ_Gather()
	local npcIndex = GetTargetNpc();
	local npcName = GetNpcName(npcIndex);
	local tListSrc = ZQ_GATHER_LIST;
	if not tListSrc[npcName] then
		return 0;
	end 
	--背包空间不足
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh玭g gian h祅h trang kh玭g ".."Kh玭g th? thu th藀"..npcName);
		return 0;
	end
	--对应的任务是否接取
	if tGtTask:check_cur_task(tListSrc[npcName][2]) == 0 then
		Msg2Player(format("R蕋 ti誧, c竎 h? v蒼 ch璦 nh薾 nhi謒 v? thu th藀 %s.", npcName));
		return 0;
	end
	--对应的任务是否已完成
	if DirectIsTaskFinish(tListSrc[npcName][2]) == 1 then
		Msg2Player(format("Nhi謒 v? thu th藀 %s  ho祅 th祅h kh玭g th? ti誴 t鬰 thu th藀", npcName));
		return 0;
	end
	--采集次数是否已近有200次了
	if GetTask(tListSrc[npcName][7]) >= 200 then
		Talk(1,"",format("C竎 h?  thu th藀 %d l莕 r錳, kh玭g th? ti誴 t鬰 thu th藀 n鱝.", 200));
		return 0;
	end
	--物品的耐久是够足够
	--local nItemIndex, nWorldItemIndex = GetFirstItem(tListSrc[npcName][5][1], tListSrc[npcName][5][2], tListSrc[npcName][5][3]);
	local nItemIndex = GetItemIndex(tListSrc[npcName][5][1], tListSrc[npcName][5][2], tListSrc[npcName][5][3]);
	if nItemIndex <= 0 then
		Msg2Player(format("Kh玭g th? thu th藀 %s v? trong h祅h trang  b襫 %s kh玭g  ", npcName, tListSrc[npcName][1]));
		return 0;
	end
	if AbradeItem(tonumber(nItemIndex), 0) < tListSrc[npcName][3] then
		Msg2Player(format("ч b襫 c馻 %s  kh玭g  %d, kh玭g th? thu th藀. N誹 h祅h trang c遪 c? %s kh竎, h穣 h駓 b? %s h誸  b襫.", tListSrc[npcName][1], tListSrc[npcName][3], tListSrc[npcName][1], tListSrc[npcName][1]));
		return 0;
	end
	--是否有了触发器
	if GetTrigger(1522 * 2) ~= 0 then
		Msg2Player("Thao t竎 thu th藀 l莕 trc v蒼 ch璦 ho祅 th祅h");
		return 0;
	end
	--是否已有人在采集
	local nCurLevel = GetUnitCurStates(npcIndex, 0);
	if nCurLevel == 99 then
		Msg2Player(format("%s  c? ngi 產ng thu th藀, h穣 th? l筰 sau gi﹜ l竧.", npcName));
		return 0;
	end
	--给读条----------
	ProgressSlot(ZQ_GATHER_TIME * 18, "ZQ_Gather_ProgressSlot");
	local nTriggerIndex = CreateTrigger(1, 1522, 1522 * 2);
	ContinueTimer(nTriggerIndex);
	--记录Item的Index
	gf_SetMyTaskByte(ZQ_BATTLE_TASK3, 1, 3, tonumber(nItemIndex), TASK_ACCESS_CODE_ZQBATTLE);
	--表示npc在被采集
	AddUnitStates(npcIndex, 0, 100);
	local nMapId, nX, nY = GetWorldPos();
	gf_SetMyTaskByte(ZQ_BATTLE_TASK4, 1, 2, nX, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK4, 3, 4, nY, TASK_ACCESS_CODE_ZQBATTLE);
	--计数初始化
	gf_SetTaskByte(ZQ_BATTLE_TASK3, 4, 0, TASK_ACCESS_CODE_ZQBATTLE);
	--记录npc索引
	SetTask(ZQ_BATTLE_TASK5, npcIndex, TASK_ACCESS_CODE_ZQBATTLE);
end

function ZQ_Gather_ProgressSlot()
end

function ZQ_Gather_OnTimer()
	--判断目标是否是资源
	local nNpcIndex = GetTask(ZQ_BATTLE_TASK5);
	local npcName = GetNpcName(nNpcIndex);
	if not npcName or npcName == "" then
		ZQ_Gather_Close(nNpcIndex);
		return 0;
	end 
	local tSubSrc = ZQ_GATHER_LIST[npcName];
	if not tSubSrc then
		ZQ_Gather_Close(nNpcIndex);
		return 0;
	end
	local nItemIndex = gf_GetMyTaskByte(ZQ_BATTLE_TASK3, 1, 3);
	if nItemIndex <= 0 then
		ZQ_Gather_Close(nNpcIndex);
		return 0;
	end
	local nMapId, nX, nY = GetWorldPos();
	if nMapId ~= ZQ_MAP_ID then
		ZQ_Gather_Close(nNpcIndex);
		return 0;
	end
	local nSecond = gf_GetTaskByte(ZQ_BATTLE_TASK3, 4);
	if nSecond < ZQ_GATHER_TIME then
		if abs(gf_GetMyTaskByte(ZQ_BATTLE_TASK4, 1, 2) - nX) > 3 or abs(gf_GetMyTaskByte(ZQ_BATTLE_TASK4, 3, 4) - nY) > 3 then
			ZQ_Gather_Close(nNpcIndex);
			Msg2Player(format("Thu th藀 %s th蕋 b筰!", npcName));
		end
		gf_SetTaskByte(ZQ_BATTLE_TASK3, 4, nSecond + 1, TASK_ACCESS_CODE_ZQBATTLE);
	else
		ZQ_Gather_Close(nNpcIndex);
		--扣耐久给奖励
		if AbradeItem(nItemIndex, 10) >= 0 then
			SetTask(tSubSrc[7], GetTask(tSubSrc[7]) + 1);
			ModifyExp(60 * GetLevel());
			gf_AddItemEx2(tSubSrc[4], npcName, ZQ_szLogTitle, "Gather", 0, 1);
			--自动进行下一次采集
			ZQ_Gather();
		end
	end
end
	
	
function ZQ_Gather_Close(nNpcIndex)
	--删除触发器
	RemoveTrigger(GetTrigger(1522 * 2));
	--停止NPC动作
	--StopFakeGathering();
	ProgressSlotCancle();
	--清楚npc被采集标记
	AddUnitStates(nNpcIndex, 0, -100);
end

function ZQ_OpenTmzPak(nItem, nCost)
	local nItemIndex = tonumber(nItem);
	local nCostIndex = tonumber(nCost);
	local tConstAward = ZQ_TMZ_PAK_AWARD.ConstAward[nCostIndex];
	if not tConstAward then
		return 0;
	end
	local tRandomAward = ZQ_TMZ_PAK_AWARD.RandomAward[nCostIndex];
	if not tRandomAward then
		return 0;
	end
	--条件判断
	if nCostIndex ~= 0 and GetItemCount(2, 1, 30230) < nCostIndex then
		Talk(1,"",format("H祅h trang kh玭g  %dXU", nCostIndex));
		return 0;
	end
	if GetFreeItemRoom() < 2 then
		Talk(1,"","Kh玭g gian h祅h trang kh玭g ");
		return 0;
	end
	--给奖励了
	if DelItemByIndex(nItemIndex, 1) == 1 then
		if nCostIndex ~= 0 then
			if DelItem(2, 1, 30230, nCostIndex) == 1 then
			 	--必得奖励
				for i = 1, getn(tConstAward) do
					gf_EventGiveRandAward(tConstAward, 100, 1, ZQ_szLogTitle, "ZQ_TMZ_PAK_CONSTAWARD", i, 1);
				end
				--随机奖励
				gf_EventGiveRandAward(tRandomAward, 100, 1, ZQ_szLogTitle, "ZQ_TMZ_PAK_RANDOMAWARD", 0, 1);
			end
		else
			--必得奖励
			for i = 1, getn(tConstAward) do
				gf_EventGiveRandAward(tConstAward, 100, 1, ZQ_szLogTitle, "ZQ_TMZ_PAK_CONSTAWARD", i, 1);
			end
			--随机奖励
			gf_EventGiveRandAward(tRandomAward, 100, 1, ZQ_szLogTitle, "ZQ_TMZ_PAK_RANDOMAWARD", 0, 1);
		end
		return 1;
	end
end

--修复阵灵
function ZQ_RepairReal()
	--条件判断
	if GetTrigger(1523 * 2) ~= 0 then
		Talk(1,"","Kh玭g th? l藀 l筰 kh雐 ng tu s鯽 tr薾 linh");
		return 0;
	end
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 31) == 0 then
		return 0;
	end
	local nTrigger = CreateTrigger(1, 1523, 1523 * 2);
	--触发器计数生效
	gf_SetTaskBit(ZQ_BATTLE_TASK1, 31, 1, TASK_ACCESS_CODE_ZQBATTLE);
	--设置倒计时初始值
	gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, ZQ_SEAL_START_TIME, TASK_ACCESS_CODE_ZQBATTLE);
	--启动时间触发器
	ContinueTimer(nTrigger);
end

function ZQ_RepairReal_OnTimer()
	local nTimes = gf_GetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4);
	--最大时限到了
	if nTimes >= ZQ_REPAIRREAL_TIME_MAX then
		--这里是给保底奖励
		if gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 21, 22) == 1 then
			ZQ_RepairReal_Award(getn(ZQ_REPAIRREAL_AWARD));
			gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 21, 22, 0, TASK_ACCESS_CODE_ZQBATTLE);
		end
		ZQ_RepairReal_Clean();
		Talk(1,"ZQ_RepairReal_Fail","Tu s鯽 tr薾 linh th蕋 b筰!");
		return 0;
	end
	--计数失效
	if gf_GetTaskBit(ZQ_BATTLE_TASK1, 31) == 0 then
		return 0;
	end
	--倒计时
	if nTimes < ZQ_SEAL_START_TIME then
		gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, gf_GetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4) + 1, TASK_ACCESS_CODE_ZQBATTLE);
		return 0;
	end
	--这个点给出对话
	if mod(nTimes, ZQ_SEAL_START_TIME) == 0 then
		Msg2Player("Tu s鯽 phong 蕁  b総 u!");
		--设置是第几次了
		if nTimes / ZQ_SEAL_START_TIME > ZQ_REPAIRREAL_COUNT_MAX then
			gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, ZQ_REPAIRREAL_TIME_MAX, TASK_ACCESS_CODE_ZQBATTLE);
			return 0;
		end
		--当前修复阵灵的次数
		gf_SetMyTaskBit(ZQ_BATTLE_TASK2, 21, 22, nTimes / ZQ_SEAL_START_TIME, TASK_ACCESS_CODE_ZQBATTLE);
		--点击NPC计数清零
--		gf_SetMyTaskBit(ZQ_BATTLE_TASK2, 23, 24, 0, TASK_ACCESS_CODE_ZQBATTLE);
		--计数失效
		gf_SetTaskBit(ZQ_BATTLE_TASK1, 31, 0, TASK_ACCESS_CODE_ZQBATTLE);
		--点NPC失效
		gf_SetTaskBit(ZQ_BATTLE_TASK6, 16, 0, TASK_ACCESS_CODE_ZQBATTLE);
		--关闭IB模式
		gf_SetTaskBit(ZQ_BATTLE_TASK6, 9, 0, TASK_ACCESS_CODE_ZQBATTLE);
		--+1
		gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, nTimes + 1, TASK_ACCESS_CODE_ZQBATTLE);
		--给出对话
		ZQ_RepairReal_FindGoalTalk();
		return 0;
	end
	--超时
	local nCount = gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 25, 27);
	local nGoalTime = floor(nTimes/ZQ_SEAL_START_TIME) * ZQ_SEAL_START_TIME + ZQ_FIND_GOAL_TIME + ZQ_SEAL_EX_TIME * nCount + 1;
	if nTimes == nGoalTime then
		gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, ZQ_REPAIRREAL_TIME_MAX, TASK_ACCESS_CODE_ZQBATTLE);
		Msg2Player("Tu s鯽 c秐h m玭 tr薾 linh vt qu? th阨 h筺!");
		return 0;
	end
	--计数
	local nCountTemp = gf_GetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, nCountTemp + 1, TASK_ACCESS_CODE_ZQBATTLE);
end

function ZQ_RepairReal_FindGoalTalk()
	if GetTrigger(1523 * 2) == 0 then
		return 0;
	end
	local nTimes = gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 21, 22);
	local tSay = {
		"\nKh雐 ng tr鵦 ti誴/#ZQ_RepairReal_StartFindGoal(0)",
		--format("\n使用%d颗魔石延长%d秒开始/#ZQ_RepairReal_StartFindGoal(%d)", nTimes, ZQ_SEAL_EX_TIME, nTimes),	
		"S? d鬾g Ma Th筩h k衞 d礽 th阨 gian/ZQ_RepairReal_ACFN",
		"\nT? b?/ZQ_RepairReal_GiveUp",
		--"我只是看看而已/nothing",
	}
	local nSize = getn(ZQ_REPAIRREAL_NPC);
	local tRezult = gf_Random(1, nSize, nTimes);
	if not tRezult or (getn(tRezult) < 1 or getn(tRezult) > 3) then
		print("UDERROR:ZQ_RepairReal_FindGoalTalk tRezult");
		return 0;
	end
	--要的索引存起来
	ZQ_RepairReal_RecordIndex(tRezult);
	--对话给出的目标NPC
	local strGoal = ""
	for i = 1, getn(tRezult) do
		strGoal = strGoal.."<color=green>"..ZQ_REPAIRREAL_NPC[tRezult[i]][1].."<color>";
		if i ~= getn(tRezult) then
			strGoal = strGoal..",";
		end
	end
	Say(ZQ_JMZL_NPC_NAME..format("Зy l? l莕 tu s鯽 phong 蕁 th? <color=green>%d<color>, hi謓 產ng c莕 %s, c竎 h? v蒼 c遪 %d  t譵 m鬰 ti猽, h穣 nhanh ch鉵g h祅h ng.", nTimes, strGoal, ZQ_FIND_GOAL_TIME), getn(tSay), tSay);
end

function ZQ_RepairReal_ACFN()
	if GetTrigger(1523 * 2) == 0 then
		return 0;
	end
	local nNum = GetItemCount(2, 1, 30481);
	AskClientForNumber("ZQ_RepairReal_StartFindGoal", min(1, nNum), min(5, nNum), "H穣 nh藀 s? lng","");
end

function ZQ_RepairReal_StartFindGoal(nCount)
	if GetTrigger(1523 * 2) == 0 then
		return 0;
	end
	if tonumber(nCount) == 0 then
		--关闭IB模式
		gf_SetTaskBit(ZQ_BATTLE_TASK6, 9, 0, TASK_ACCESS_CODE_ZQBATTLE);
		--计数生效
		gf_SetTaskBit(ZQ_BATTLE_TASK1, 31, 1, TASK_ACCESS_CODE_ZQBATTLE);
		--点NPC生效
		gf_SetTaskBit(ZQ_BATTLE_TASK6, 16, 1, TASK_ACCESS_CODE_ZQBATTLE);
		--清零魔石使用的数目
		gf_SetMyTaskBit(ZQ_BATTLE_TASK2, 25, 27, 0, TASK_ACCESS_CODE_ZQBATTLE);
		Msg2Player(format("B総 u m ngc %d gi﹜!", ZQ_FIND_GOAL_TIME));
	else
		if DelItem(ZQ_ITEM_IB[1], ZQ_ITEM_IB[2], ZQ_ITEM_IB[3], nCount) ==  1 then
			--开启IB模式
			gf_SetTaskBit(ZQ_BATTLE_TASK6, 9, 1, TASK_ACCESS_CODE_ZQBATTLE);
			--计数生效
			gf_SetTaskBit(ZQ_BATTLE_TASK1, 31, 1, TASK_ACCESS_CODE_ZQBATTLE);
			--点NPC生效
			gf_SetTaskBit(ZQ_BATTLE_TASK6, 16, 1, TASK_ACCESS_CODE_ZQBATTLE);
			--记录魔石使用的数目
			gf_SetMyTaskBit(ZQ_BATTLE_TASK2, 25, 27, nCount, TASK_ACCESS_CODE_ZQBATTLE);
			Msg2Player(format("B総 u m ngc %d gi﹜!", ZQ_FIND_GOAL_TIME + ZQ_SEAL_EX_TIME * nCount));
		else
			Talk(1, "ZQ_RepairReal_FindGoalTalk", "Ma Th筩h trong h祅h trang kh玭g !");
		end
	end
end

function ZQ_RepairReal_NpcTalk(nNpcIndex)
	--点击是否生效
	if gf_GetTaskBit(ZQ_BATTLE_TASK6, 16) == 0 then
		return 0;
	end
	--当前修复阵灵的次数
	local nTimes = gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 21, 22);
	--点击次数超过了
--	if gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 23, 24) >= nTimes then
--		return 0;
--	end
	--获得NPC在表里的索引
	local nTableIndex = ZQ_RepairReal_FindTableIndex(GetNpcName(nNpcIndex));
	--Npc是表里面的
	if nTableIndex > 0 and nTableIndex <= getn(ZQ_REPAIRREAL_NPC) then
--		--点击NPC计数+1
--		gf_SetMyTaskBit(ZQ_BATTLE_TASK2, 23, 24, gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 23, 24) + 1, TASK_ACCESS_CODE_ZQBATTLE);
		--是否是其中的一个目标
		local bTag = 1;
		local tString = {"Th蕋 b筰", " th祅h c玭g "};
		if nTableIndex == gf_GetMyTaskByte(ZQ_BATTLE_TASK6, 3, 4) then
			gf_SetMyTaskByte(ZQ_BATTLE_TASK6, 3, 4, 0, TASK_ACCESS_CODE_ZQBATTLE);
			bTag = 2;
		end
		if nTableIndex == gf_GetMyTaskByte(ZQ_BATTLE_TASK7, 1, 2) then
			gf_SetMyTaskByte(ZQ_BATTLE_TASK7, 1, 2, 0, TASK_ACCESS_CODE_ZQBATTLE);
			bTag = 2;
		end
		if nTableIndex == gf_GetMyTaskByte(ZQ_BATTLE_TASK7, 3, 4) then
			gf_SetMyTaskByte(ZQ_BATTLE_TASK7, 3, 4, 0, TASK_ACCESS_CODE_ZQBATTLE);
			bTag = 2;
		end
--		Msg2Player(format("第%d次查找", gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 23, 24))..tString[bTag]);
		Msg2Player("Truy t譵 nguy猲 li謚 m鬰 ti猽--"..tString[bTag]);
		if bTag == 1 then
			HeadMsg2Player("T譵 sai r錳");
		elseif bTag == 2 then
			HeadMsg2Player("T譵 ng r錳");
		end
	end
--	--点击的数目上限
--	if gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 23, 24) == nTimes then
--		--要找的都找到了
--		--IB模式知否
--		gf_SetTaskBit(ZQ_BATTLE_TASK6, 9, 0, TASK_ACCESS_CODE_ZQBATTLE);
--		--点npc失效
--		gf_SetTaskBit(ZQ_BATTLE_TASK6, 16, 0, TASK_ACCESS_CODE_ZQBATTLE);
--		if ZQ_RepairReal_RezultFind() == 1 then
--			--给奖励了
--			ZQ_RepairReal_Award(nTimes);
--			if nTimes < ZQ_REPAIRREAL_COUNT_MAX then
--				--进入下一个阶段
--				SetPos(1605, 3306);
--				CastState("state_fetter", 100, 18*3);
--				CastState("state_dispear",100, 18*3);
--				--NpcCommand(PIdx2NpcIdx(),1)
--				gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, ZQ_SEAL_START_TIME * (nTimes + 1), TASK_ACCESS_CODE_ZQBATTLE);
--			else
--				--到达上线次数了
--				Talk(1,"ZQ_RepairReal_Succ","修复景门阵灵成功！");
--			end
--		--失败了
--		else
--			gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, ZQ_REPAIRREAL_TIME_MAX, TASK_ACCESS_CODE_ZQBATTLE);
--		end
--		return 0;
--	end
	--全部找到了
	if ZQ_RepairReal_RezultFind() == 1 then
		--IB模式知否
		gf_SetTaskBit(ZQ_BATTLE_TASK6, 9, 0, TASK_ACCESS_CODE_ZQBATTLE);
		--点npc失效
		gf_SetTaskBit(ZQ_BATTLE_TASK6, 16, 0, TASK_ACCESS_CODE_ZQBATTLE);
		--给奖励了
		ZQ_RepairReal_Award(nTimes);
		if nTimes < ZQ_REPAIRREAL_COUNT_MAX then
			--进入下一个阶段
			SetPos(1605, 3306);
			CastState("state_fetter", 100, 18*3);
			CastState("state_dispear",100, 18*3);
			gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, ZQ_SEAL_START_TIME * (nTimes + 1), TASK_ACCESS_CODE_ZQBATTLE);
			Msg2Player(format("T譵 th祅h c玭g giai 畂筺 th? %d, ti課 v祇 giai 畂筺 k? ti誴.", nTimes + 1));
		else
			--到达上线次数了
			Talk(1,"ZQ_RepairReal_Succ","Tu s鯽 c秐h m玭 tr薾 linh th祅h c玭g!");
		end
	end
end

function ZQ_RepairReal_Succ()
	ZQ_RepairReal_Clean();
	ZQ_OutfromCopy();
	ZQ_Trigger_Clean();
	Msg2Player("C竎 h?  tu s鯽 c秐h m玭 tr薾 linh th祅h c玭g!");
end

function ZQ_RepairReal_Fail()
	ZQ_RepairReal_Clean();
	ZQ_OutfromCopy();
	ZQ_Trigger_Clean();
end

function ZQ_RepairReal_FindTableIndex(strName)
	for i = 1, getn(ZQ_REPAIRREAL_NPC) do
		if strName == ZQ_REPAIRREAL_NPC[i][1] then
			return i;
		end
	end
	return 0;
end 

function ZQ_RepairReal_RecordIndex(tRezult)
	local nSize = getn(tRezult);
	if nSize == 1 then
		gf_SetMyTaskByte(ZQ_BATTLE_TASK6, 3, 4, tRezult[1], TASK_ACCESS_CODE_ZQBATTLE);
		gf_SetMyTaskByte(ZQ_BATTLE_TASK7, 1, 2, 0, TASK_ACCESS_CODE_ZQBATTLE);
		gf_SetMyTaskByte(ZQ_BATTLE_TASK7, 3, 4, 0, TASK_ACCESS_CODE_ZQBATTLE);
	elseif nSize == 2 then
		gf_SetMyTaskByte(ZQ_BATTLE_TASK6, 3, 4, tRezult[1], TASK_ACCESS_CODE_ZQBATTLE);
		gf_SetMyTaskByte(ZQ_BATTLE_TASK7, 1, 2, tRezult[2], TASK_ACCESS_CODE_ZQBATTLE);
		gf_SetMyTaskByte(ZQ_BATTLE_TASK7, 3, 4, 0, TASK_ACCESS_CODE_ZQBATTLE);		
	elseif nSize == 3 then
		gf_SetMyTaskByte(ZQ_BATTLE_TASK6, 3, 4, tRezult[1], TASK_ACCESS_CODE_ZQBATTLE);
		gf_SetMyTaskByte(ZQ_BATTLE_TASK7, 1, 2, tRezult[2], TASK_ACCESS_CODE_ZQBATTLE);
		gf_SetMyTaskByte(ZQ_BATTLE_TASK7, 3, 4, tRezult[3], TASK_ACCESS_CODE_ZQBATTLE);		
	else
		print("UDERROR:ZQ_RepairReal_RecordIndex");
	end
end

function ZQ_RepairReal_RezultFind()
	if gf_GetMyTaskByte(ZQ_BATTLE_TASK6, 3, 4, TASK_ACCESS_CODE_ZQBATTLE) ~= 0 then
		return 0;
	end
	if gf_GetMyTaskByte(ZQ_BATTLE_TASK7, 1, 2, TASK_ACCESS_CODE_ZQBATTLE) ~= 0 then
		return 0;
	end
	if gf_GetMyTaskByte(ZQ_BATTLE_TASK7, 3, 4, TASK_ACCESS_CODE_ZQBATTLE) ~= 0 then
		return 0;
	end
	return 1;
end

function ZQ_RepairReal_Award(nStep)
	if nStep < 0 or nStep > getn(ZQ_REPAIRREAL_AWARD) then
		return 0;
	end
	--给真气
	AwardGenuineQi(ZQ_REPAIRREAL_AWARD[nStep][1]);
	--给经验
	gf_Modify("Exp", ZQ_REPAIRREAL_AWARD[nStep][2]);
	--给道具
	gf_AddItemEx2({2, 1, 30497, ZQ_REPAIRREAL_AWARD[nStep][3]}, "Ma Tinh", ZQ_szLogTitle, "Tu s鯽 phong 蕁", 0, 1);
	--给过奖励的一律清空
	gf_SetTaskBit(ZQ_BATTLE_TASK2, 31, 0, TASK_ACCESS_CODE_ZQBATTLE);
end

function ZQ_RepairReal_GiveUp()
	ZQ_RepairReal_Clean();
	ZQ_OutfromCopy();
	ZQ_Trigger_Clean();
	Talk(1,"","C竎 h?  t? b? tu s鯽 tr薾 linh!");
end

function ZQ_RepairReal_Clean()
	RemoveTrigger(GetTrigger(1523 * 2));
	gf_SetTaskBit(ZQ_BATTLE_TASK1, 31, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetMyTaskBit(ZQ_BATTLE_TASK2, 21, 22, 0, TASK_ACCESS_CODE_ZQBATTLE);
--	gf_SetMyTaskBit(ZQ_BATTLE_TASK2, 23, 24, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetMyTaskBit(ZQ_BATTLE_TASK2, 25, 27, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK6, 3, 4, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK7, 1, 2, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK7, 3, 4, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskBit(ZQ_BATTLE_TASK6, 16, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskBit(ZQ_BATTLE_TASK6, 9, 0, TASK_ACCESS_CODE_ZQBATTLE);
	FloatMsg2Player();
	--给保底奖励
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 31) == 1 then
		Talk(1, "", "C竎 h?  tu s鯽 c秐h m玭 tr薾 linh th蕋 b筰!");
		ZQ_RepairReal_Award(getn(ZQ_REPAIRREAL_AWARD));
	end
end

function ZQ_EvilBet_Talk()
	if ZQ_CopyIsAble(1526) == 0 then
		return 0;
	end
	local strSay = "<color=green>Sinh M玭 T? Linh: <color>Hehe, ngi thanh ni猲 mu鑞 ph竧 t礽 kh玭g? H穣 ch琲 tr? o糿 t? t? v韎 ta, n誹 th緉g ta s? nh薾 頲 ph莕 thng h蕄 d蒼, ng th阨 n誹 th緉g li猲 t鬰, m鏸 l莕 u c? th? g蕄 i ph莕 thng. ng s?, thua r錳 c騨g kh玭g sao, ch? c莕 b? m筺g l筰 l? 頲 r錳.";
	local nZhenqi, nExp, nCount = ZQ_EvilBet_CalAward();
	local strExt = "\n<color=green>C竎 h?  th緉g l莕 th? %d, ph莕 thng c閚g d錸 l?: ch﹏ kh? %d, kinh nghi謒 %d, Ma Tinh %d. <color>";
	local nSuccTimes = gf_GetTaskByte(ZQ_BATTLE_TASK8, 1);
	strExt = format(strExt, nSuccTimes, nZhenqi, nExp, nCount);
	--已经达到猜的最大次数
	--直接发机票
	if nSuccTimes == getn(ZQ_EVILBET_AWARD) - 1 then
		Say(format("C竎 h?  h? Sinh M玭 T? Linh li猲 t鬰 %d l莕, y l? ph莕 thng d祅h x鴑g ng c馻 ngi", nSuccTimes)..strExt, 1, "Nh薾 ph莕 thng r錳 ch箉 ngay/ZQ_EvilBet_GiveAward");
		return 0;
	end	
	local tSay = {
		format("Ra B骯/#ZQ_EvilBet_Jugde(1)"),
		format("Ra K衞/#ZQ_EvilBet_Jugde(2)"),
		format("Ra Bao/#ZQ_EvilBet_Jugde(3)"),	
	}
	tinsert(tSay, "\nKh玭g ch琲 n鱝, nh薾 ph莕 thng r錳 ch箉 th玦/ZQ_EvilBet_GiveAward");
	tinsert(tSay, "T筰 h? ch? xem qua th玦/nothing");
	Say(strSay..strExt, getn(tSay), tSay);
end

function ZQ_EvilBet_Jugde(nValue)
	if ZQ_CopyIsAble(1526) == 0 then
		return 0;
	end
	local tListCmp = {
		--{玩家输，玩家赢}
		[1] = {3, 2},
		[2] = {1, 3},
		[3] = {1, 2},
	}
	local nSysValue = mod(random(1, 99), 3) + 1;
	if nSysValue == tonumber(nValue) then
		Talk(1,"ZQ_EvilBet_Talk","C竎 h?  h遖 v韎 Sinh M玭 T? Linh!");
	elseif nSysValue == tListCmp[tonumber(nValue)][1] then
			Talk(1,"ZQ_EvilBet_IB","C竎 h?  <color=red>Thua<color> r錳!");
	elseif nSysValue == tListCmp[tonumber(nValue)][2] then 
		if gf_GetTaskByte(ZQ_BATTLE_TASK8, 1) < getn(ZQ_EVILBET_AWARD) - 1 then
			gf_SetTaskByte(ZQ_BATTLE_TASK8, 1, gf_GetTaskByte(ZQ_BATTLE_TASK8, 1) + 1, TASK_ACCESS_CODE_ZQBATTLE);
			Talk(1,"ZQ_EvilBet_Talk","C竎 h?  <color=green>Th緉g<color> r錳!");
		else
			ZQ_EvilBet_GiveAward();  --其实不可能到这里
		end
	end
end

function ZQ_EvilBet_IB()
	if ZQ_CopyIsAble(1526) == 0 then
		return 0;
	end
	local nStep = 2^gf_GetTaskByte(ZQ_BATTLE_TASK8, 1);
	local nZhenqi, nExp, nCount = ZQ_EvilBet_CalAward();
	local tSay = {
		format("\nTi猽 hao %d Ma Th筩h, ch髇g ta ti誴 t鬰/#ZQ_EvilBet_IB_Ensure(%d)", nStep, nStep),
		"\nT? b?/ZQ_EvilBet_GiveUp",
	}
	local strExt = "\n<color=green>C竎 h?  th緉g l莕 th? %d, ph莕 thng c閚g d錸 l?: ch﹏ kh? %d, kinh nghi謒 %d, Ma Tinh %d. <color>";
	local nSuccTimes = gf_GetTaskByte(ZQ_BATTLE_TASK8, 1);
	strExt = format(strExt, nSuccTimes, nZhenqi, nExp, nCount);
	Say("<color=green>Sinh M玭 T? Linh:<color> th? th?, h穣  l筰 m筺g s鑞g c馻 ngi l筰 y! Hahaha###."..strExt, getn(tSay), tSay);
end

function ZQ_EvilBet_IB_Ensure(nStep)
	if ZQ_CopyIsAble(1526) == 0 then
		return 0;
	end
	if DelItem(ZQ_ITEM_IB[1], ZQ_ITEM_IB[2], ZQ_ITEM_IB[3], nStep) == 1 then
		Msg2Player(format("C竎 h?  ti猽 hao %d Ma Th筩h", nStep));
		ZQ_EvilBet_Talk();
	else
		Talk(1,"ZQ_EvilBet_GiveUp","Ngi c? gan d竚 l鮝 ta, 甶 ch誸 甶!");
	end
end

function ZQ_EvilBet_CalAward()
	local nSuccTimes = gf_GetTaskByte(ZQ_BATTLE_TASK8, 1);
	local nZhenqi = 0;
	local nExp = 0;
	local nCount = 0;
--	for i = 1, nSuccTimes do
--		nZhenqi = nZhenqi + ZQ_EVILBET_AWARD[i][1];
--		nExp = nExp + ZQ_EVILBET_AWARD[i][2];
--		nCount = nCount + ZQ_EVILBET_AWARD[i][3];
--	end
	--保底奖励
	if nSuccTimes == 0 then
		nZhenqi = ZQ_EVILBET_AWARD[getn(ZQ_EVILBET_AWARD)][1];
		nExp = ZQ_EVILBET_AWARD[getn(ZQ_EVILBET_AWARD)][2];
		nCount = ZQ_EVILBET_AWARD[getn(ZQ_EVILBET_AWARD)][3];
		return nZhenqi, nExp, nCount;
	end
	if nSuccTimes > 0 and nSuccTimes <= getn(ZQ_EVILBET_AWARD) then
		nZhenqi = ZQ_EVILBET_AWARD[nSuccTimes][1];
		nExp = ZQ_EVILBET_AWARD[nSuccTimes][2];
		nCount = ZQ_EVILBET_AWARD[nSuccTimes][3];
	end
	return nZhenqi, nExp, nCount;
end

function ZQ_EvilBet_GiveUp()
	Talk(1,"","Haha, y l? ph莕 thng c馻 ngi, c莔 cho v鱪g nh?. V藋 m筺g c馻 ngi ta l蕐 甶 nh?, 1 tay trao ti襫 1 tay nh薾 h祅g, xong.");
	--给保底奖励
	gf_SetTaskByte(ZQ_BATTLE_TASK8, 1, 0, TASK_ACCESS_CODE_ZQBATTLE);
	ZQ_EvilBet_GiveAward();
	-------------------
	local nLife = GetLife();
	ModifyLife(-nLife);
end

function ZQ_EvilBet_GiveAward()
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 23) == 0 then
		return 0;
	end
	--清理
	gf_SetTaskBit(ZQ_BATTLE_TASK2, 23, 0, TASK_ACCESS_CODE_ZQBATTLE);
	----------------------
	local nZhenqi, nExp, nCount = ZQ_EvilBet_CalAward();
	--给真气
	AwardGenuineQi(tonumber(nZhenqi));
	--给经验
	gf_Modify("Exp", tonumber(nExp));
	--给道具
	gf_AddItemEx2({2, 1, 30497, tonumber(nCount)}, "Ma Tinh", ZQ_szLogTitle, "T? Linh х c", 0, 1);
	--退出---------
	Talk(1,"","Khi猽 chi課 T? Linh х c k? th骳!");
	ZQ_EvilBet_Clean();
	ZQ_OutfromCopy();
	ZQ_Trigger_Clean();
end

function ZQ_EvilBet_Clean()
	--这种情况给保底奖励
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 23) == 1 then
		gf_SetTaskByte(ZQ_BATTLE_TASK8, 1, 0, TASK_ACCESS_CODE_ZQBATTLE);
		ZQ_EvilBet_GiveAward();
	end
	gf_SetTaskByte(ZQ_BATTLE_TASK8, 1, 0, TASK_ACCESS_CODE_ZQBATTLE);
	FloatMsg2Player();
end

function ZQ_Leave_Game()
	FloatMsg2Player();
	if ZQ_IsAllowMap() ~= 1 then
		return 0;
	end
	--复活一下
	RevivePlayer(1);
	NewWorld(ZQ_EXIT_POS[1], ZQ_EXIT_POS[2], ZQ_EXIT_POS[3]);
	ZQ_ResetPlayerState();
end

function ZQ_ReStartSeal_Talk()
	local nCurrentTimes = gf_GetTaskByte(ZQ_BATTLE_TASK8, 2);
	--修复了三次了
	if nCurrentTimes >= ZQ_RESTARTSEAL_COUNT_MAX then
		ZQ_ReStartSeal_Exit(1);
		return 0;
	end
	local nTag = gf_GetTaskBit(ZQ_BATTLE_TASK8, 29);
	local tSay = {
		"Gi韎 thi謚 phong 蕁/ZQ_ReStartSeal_Intro",
		"\nT? b?/ZQ_ReStartSeal_Exit",
		"T筰 h? ch? xem qua th玦/nothing",
	}
	if nTag == 0 then
		tinsert(tSay, 1, "H? tr? kh雐 ng l筰 phong 蕁/#ZQ_ReStartSeal_Assist(0)");
		if gf_GetTaskBit(ZQ_BATTLE_TASK8, 31) == 0 then
			tinsert(tSay, 2, "H? tr? kh雐 ng l筰 Phong 蕁 (c莕 ti猽 hao 2 ma th筩h  h? tr? th猰)/#ZQ_ReStartSeal_Assist(2)");
		end
	end
	local strSay = "T? M玭 Phong 蕁 r蕋 kh玭g 鎛 nh, l筰 c? phong 蕁 x秠 ra s? c? n鱝 r錳, c竎 h? c? th? gi髉 ta kh雐 ng ch髇g l筰 kh玭g? H穣 c萵 th薾 nh鱪g c? quan b猲 tr猲 phong 蕁, ch髇g kh? nguy hi觤 y.";
	local nTableIndex = gf_GetTaskByte(ZQ_BATTLE_TASK8, 3);
	--第一次初始化
	if nCurrentTimes == 0 and nTableIndex == 0 and nTag == 0 then
		nTableIndex = random(1, 3);
		gf_SetTaskByte(ZQ_BATTLE_TASK8, 3, nTableIndex, TASK_ACCESS_CODE_ZQBATTLE);
	end
	--index合法性
	if nTableIndex <= 0 or nTableIndex > getn(ZQ_RESTART_REAL_NPC) then
		print("UDERROR:ZQ_ReStartSeal_Talk nTableIndex illegal");
		return 0;
	end
	local strCore = format("\n<color=green>Phong 蕁 c莕 kh雐 ng l? [%s]<color>, nh蕁 ch鋘 d遪g ch鋘 nh薾 頲 o c? kh雐 ng <color=green>慣? Linh L謓h B礽?<color>", ZQ_RESTART_REAL_NPC[nTableIndex][1]);
	Say(ZQ_SMZL_NPC_NAME..strSay..strCore, getn(tSay), tSay);
end

function ZQ_ReStartSeal_Assist(nValue)
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 24) == 0 then
		return 0;
	end
	if tonumber(nValue) == 2 then
		if DelItem(ZQ_ITEM_IB[1], ZQ_ITEM_IB[2], ZQ_ITEM_IB[3], tonumber(nValue)) == 1 then
			CastState("state_life_max_percent_add", 1000, 15 * 60 * 18, 1, 20003, 1);
			SyncCustomState(1, 20003, 1, "Ph? h? c馻 T? M玭 Tr薾 Linh");
			Talk(1, "", "C竎 h? nh薾 頲<color=yellow>".."Ph? h? c馻 T? M玭 Tr薾 Linh".."<color>hi謚 qu?:  \n<color=green>".."觤 sinh m謓h t╪g g蕄 10 l莕".."<color>");
			gf_SetTaskBit(ZQ_BATTLE_TASK8, 31, 1, TASK_ACCESS_CODE_ZQBATTLE);
			RestoreAll();		
		else
			Talk(1, "ZQ_ReStartSeal_Talk", "Ma Th筩h trong h祅h trang kh玭g !");
			return 0;
		end
	end
	--给道具
	if GetItemCount(ZQ_RESTARTSEAL_ITEM[1], ZQ_RESTARTSEAL_ITEM[2], ZQ_RESTARTSEAL_ITEM[3]) < 1 then
		AddItem(ZQ_RESTARTSEAL_ITEM[1], ZQ_RESTARTSEAL_ITEM[2], ZQ_RESTARTSEAL_ITEM[3], 1);
		gf_SetTaskBit(ZQ_BATTLE_TASK8, 29, 1, TASK_ACCESS_CODE_ZQBATTLE);
	end
end

function ZQ_ReStartSeal_Intro()
	local ZQ_GtSay = {};
	ZQ_GtSay.msg = ZQ_SMZL_NPC_NAME.."T? M玭 c? t鎛g c閚g 8 phong 蕁 (qu? v? c馻 b竧 qu竔), i tho筰 v韎 T? M玭 Tr薾 Linh, xu蕋 hi謓 ng蓇 nhi猲 3 Phong 蕁 Th竝 c莕 k輈h ho箃 , ng th阨 c竎 h? nh薾 頲 3 l謓h b礽. Khi k輈h ho箃 phong 蕁 s? xu蕋 hi謓 thanh ti課 , trong kho秐 th阨 gian k輈h ho箃 nh﹏ v藅 r阨 kh醝 ph筸 vi phong 蕁 th? thanh ti課  s? bi課 m蕋, k輈h ho箃 th蕋 b筰. \nL﹏ c薾 m鏸 phong 蕁 u c? c? quan c筸 b蓎, khi nh﹏ v藅 ch筸 ph秈 s? b? t蕁 c玭g, b? t蕁 c玭g t? vong xem nh? kh雐 ng phong 蕁 th蕋 b筰. \nNgi ch琲 c? th? d飊g 2 Ma Th筩h s? nh薾 頲 hi謚 qu? t╪g trng 甶觤 sinh m謓h 1000%, sinh m謓h v? n閕 l鵦 ho祅 to祅 h錳 ph鬰, r阨 kh醝 c鯽 秈 ho芻 ho祅 th祅h k輈h ho箃 s? bi課 m蕋.";
	ZQ_GtSay.sel = {
		{"\n Ph秐 h錳","ZQ_ReStartSeal_Talk"},
	}
	temp_Talk(ZQ_GtSay);
end

function ZQ_ReStartSeal_Fail()
	--ZQ_OutfromCopy();
	--ZQ_ReStartSeal_Clean();
	--ZQ_Trigger_Clean();
	Talk(1,"","Kh雐 ng phong 蕁 th蕋 b筰!");
end

function ZQ_ReStartSeal_Exit(bTag)
	if bTag and bTag == 1 then
		Talk(1,"","Khi猽 chi課 th祅h c玭g, c竎 h?  kh雐 ng th祅h c玭g 3 phong 蕁!")
	elseif gf_GetTaskByte(ZQ_BATTLE_TASK8, 2) == 0 and gf_GetTaskBit(ZQ_BATTLE_TASK2, 24) == 1 then
		ZQ_ReStartSeal_Award(getn(ZQ_RESTARTSEAL_AWARD));
		Talk(1,"","Kh雐 ng phong 蕁 th蕋 b筰, T? M玭 s緋 th蕋 th? r錳. Зy l? ph莕 thng c馻 ngi, 產 t?.")
	elseif gf_GetTaskBit(ZQ_BATTLE_TASK2, 24) == 1 then
		Talk(1,"","C竎 h?  t? b? kh雐 ng phong 蕁!")
	elseif gf_GetTaskByte(ZQ_BATTLE_TASK8, 2) > 0 and gf_GetTaskBit(ZQ_BATTLE_TASK2, 24) == 0 then
		Talk(1,"","C竎 h?  t? b? kh雐 ng phong 蕁!")
	end
	ZQ_Trigger_Clean();
	ZQ_ReStartSeal_Clean();
	ZQ_OutfromCopy();
end

function ZQ_ReStartSeal_Award(nIndex)
	if nIndex < 1 or nIndex > getn(ZQ_RESTARTSEAL_AWARD) then
		return 0;
	end
	--给真气
	AwardGenuineQi(ZQ_RESTARTSEAL_AWARD[nIndex][1]);
	--给经验
	gf_Modify("Exp", ZQ_RESTARTSEAL_AWARD[nIndex][2]);
	--给道具
	gf_AddItemEx2({2, 1, 30497, ZQ_RESTARTSEAL_AWARD[nIndex][3]}, "Ma Tinh", ZQ_szLogTitle, "Kh雐 ng Tr薾 Linh", 0, 1);
end

function ZQ_ReStartSeal_Clean()
	if GetTrigger(1529 * 2) ~= 0 then
		RemoveTrigger(GetTrigger(1529 * 2));
	end
	gf_SetTaskBit(ZQ_BATTLE_TASK8, 30, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskByte(ZQ_BATTLE_TASK8, 2, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskByte(ZQ_BATTLE_TASK8, 3, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskBit(ZQ_BATTLE_TASK8, 25, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskBit(ZQ_BATTLE_TASK8, 26, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskBit(ZQ_BATTLE_TASK8, 27, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskBit(ZQ_BATTLE_TASK8, 29, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskBit(ZQ_BATTLE_TASK2, 24, 0, TASK_ACCESS_CODE_ZQBATTLE);
	--清除魔法属性
	RemoveState(20003);
	gf_SetTaskBit(ZQ_BATTLE_TASK8, 31, 0, TASK_ACCESS_CODE_ZQBATTLE);
	--删除道具
	DelItem(ZQ_RESTARTSEAL_ITEM[1], ZQ_RESTARTSEAL_ITEM[2], ZQ_RESTARTSEAL_ITEM[3], GetItemCount(ZQ_RESTARTSEAL_ITEM[1], ZQ_RESTARTSEAL_ITEM[2], ZQ_RESTARTSEAL_ITEM[3]));
	FloatMsg2Player();
	ProgressSlotCancle();
end

function ZQ_ReStartSeal_UseItem(nItem)
	if ZQ_IsAllowMap() ~= 1 then
		return 0;
	end
	if gf_GetTaskBit(ZQ_BATTLE_TASK8, 30) == 1 then
		return 0;
	end
	if not nItem then
		if GetItemCount(2,1,30496) < 1 then
			Talk(1,"","Kh玭g c? T? Linh L謓h  kh雐 ng phong 蕁");
			return 0;
		end
	end
	local nTableIndex = gf_GetTaskByte(ZQ_BATTLE_TASK8, 3);
	if nTableIndex <= 0 or nTableIndex > getn(ZQ_RESTART_REAL_NPC) then
		return 0;
	end
	if GetNpcName(GetTargetNpc()) ~= ZQ_RESTART_REAL_NPC[nTableIndex][1] then
		Msg2Player(format("M鬰 ti猽 phong 蕁 hi謓 t筰 kh玭g ch輓h x竎! M鬰 ti猽 ch輓h l? [%s]", ZQ_RESTART_REAL_NPC[nTableIndex][1]));
		return 0;
	end
	local nMapId, nX, nY = GetWorldPos();
	local nXcmp = ZQ_RESTART_REAL_NPC[nTableIndex][3];
	local nYcmp = ZQ_RESTART_REAL_NPC[nTableIndex][4];
	local nDis = (nX - nXcmp)^2 + (nY - nYcmp)^2;
	--超过了距离
	if nDis > ZQ_RESTARTSEAL_DIS_MAX then
		Msg2Player("C竎h m鬰 ti猽 phong 蕁 qu? xa, h穣 ti課 l筰 g莕 h琻!");
		return 0;
	end
	Msg2Player("B総 u k輈h ho箃 phong 蕁!")
	--创建实时判断触发器
	local nTrigger = GetTrigger(1529 * 2);
	if nTrigger ~= 0 then
		RemoveTrigger(nTrigger);
		ProgressSlotCancle();
	end
	nTrigger = CreateTrigger(1, 1529, 1529 * 2);
	if nTrigger ~= 0 then
		--读条完成后回调OnProgressCallback
		ProgressSlot(ZQ_RESTARTSEAL_PROGRESS_TIME);
		ContinueTimer(nTrigger);
		gf_SetTaskBit(ZQ_BATTLE_TASK8, 30, 1, TASK_ACCESS_CODE_ZQBATTLE);
	end
end

function ZQ_ReStartSeal_OnTimer()
	local nRet = ZQ_ReStartSeal_JugdeDistance();
	if nRet == 0 then
		ProgressSlotCancle();
		RemoveTrigger(GetTrigger(1529 * 2));
		--标志还原
		gf_SetTaskBit(ZQ_BATTLE_TASK8, 30, 0, TASK_ACCESS_CODE_ZQBATTLE);
		Msg2Player("C竎h m鬰 ti猽 phong 蕁 qu? xa, kh雐 ng th蕋 b筰!")
	end
end

function ZQ_ReStartSeal_JugdeDistance()
	local nTableIndex = gf_GetTaskByte(ZQ_BATTLE_TASK8, 3);
	if nTableIndex <= 0 or nTableIndex > getn(ZQ_RESTART_REAL_NPC) then
		return 0;
	end
	if GetNpcName(GetTargetNpc()) ~= ZQ_RESTART_REAL_NPC[nTableIndex][1] then
		Msg2Player(format("M鬰 ti猽 phong 蕁 hi謓 t筰 kh玭g ch輓h x竎! M鬰 ti猽 ch輓h l? [%s]", ZQ_RESTART_REAL_NPC[nTableIndex][1]));
		return 0;
	end
	local nMapId, nX, nY = GetWorldPos();
	local nXcmp = ZQ_RESTART_REAL_NPC[nTableIndex][3];
	local nYcmp = ZQ_RESTART_REAL_NPC[nTableIndex][4];
	local nDis = (nX - nXcmp)^2 + (nY - nYcmp)^2;
	--超过了距离
	if nDis > ZQ_RESTARTSEAL_DIS_MAX then
		return 0;
	else
		return 1;
	end
end

--重启封印的读条回调函数
function OnProgressCallback()
	--移除这个触发器
	local nTrigger = GetTrigger(1529 * 2);
	if nTrigger ~= 0 then
		RemoveTrigger(nTrigger);
	end
	--标志还原
	gf_SetTaskBit(ZQ_BATTLE_TASK8, 30, 0, TASK_ACCESS_CODE_ZQBATTLE);
	if ZQ_IsAllowMap() ~= 1 then
		return 0;
	end
	local nRet = ZQ_ReStartSeal_JugdeDistance();
	if nRet == 0 then
		--失败
		ZQ_ReStartSeal_Fail();
	elseif nRet == 1 then
		--成功
		ZQ_ReStartSeal_Succ();
	end
end

function ZQ_ReStartSeal_Succ()
	local nCount = gf_GetTaskByte(ZQ_BATTLE_TASK8, 2);
	--给奖励了
	ZQ_ReStartSeal_Award(nCount + 1);
	--次数+1
	gf_SetTaskByte(ZQ_BATTLE_TASK8, 2, nCount + 1, TASK_ACCESS_CODE_ZQBATTLE);
	--生成新的目标
	if nCount == 0 then
		gf_SetTaskByte(ZQ_BATTLE_TASK8, 3, random(4,6), TASK_ACCESS_CODE_ZQBATTLE);
	elseif nCount == 1 then
		gf_SetTaskByte(ZQ_BATTLE_TASK8, 3, random(7,8), TASK_ACCESS_CODE_ZQBATTLE);
	else
--		print("nCount =",nCount);
	end
	--魔法属性
	RemoveState(20003);
	gf_SetTaskBit(ZQ_BATTLE_TASK8, 31, 0, TASK_ACCESS_CODE_ZQBATTLE);
	--DelItem
	DelItem(ZQ_RESTARTSEAL_ITEM[1], ZQ_RESTARTSEAL_ITEM[2], ZQ_RESTARTSEAL_ITEM[3], GetItemCount(ZQ_RESTARTSEAL_ITEM[1], ZQ_RESTARTSEAL_ITEM[2], ZQ_RESTARTSEAL_ITEM[3]));
	--标记置0
	gf_SetTaskBit(ZQ_BATTLE_TASK8, 29, 0, TASK_ACCESS_CODE_ZQBATTLE);
	--下一步
	Talk(1, "ZQ_ReStartSeal_Talk", format("Kh雐 ng phong 蕁 l莕 th? %d, <color=green>nh薾 頲 %d 甶觤 ch﹏ kh?, %d 甶觤 kinh nghi謒, %d Ma Tinh<color>", nCount + 1, ZQ_RESTARTSEAL_AWARD[nCount + 1][1], ZQ_RESTARTSEAL_AWARD[nCount + 1][2], ZQ_RESTARTSEAL_AWARD[nCount + 1][3]));
end

--记录NPC的索引
--ZQ_tMapNpcIndex = {};

function ZQ_ProtectSeal_Talk()	
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 30) == 0 then
		return 0;
	end
	local tSay = {
		"Gi韎 thi謚 Th? V? Phong 蕁/ZQ_ProtectSeal_Intro",
		"\nTi猽 di謙 n y v藋/ZQ_ProtectSeal_Exit",
		"T筰 h? ch? xem qua th玦/nothing",
	}
	if GetTrigger(1524 * 2) == 0 and GetTrigger(1293 * 2) == 0 then
		tinsert(tSay, 1, "H? tr? gi誸 ch/#ZQ_ProtectSeal_Start(0)");
		tinsert(tSay, 2, "H? tr? ti猽 di謙 ch (c莕 ti猽 hao 2 ma th筩h  h? tr? th猰)/#ZQ_ProtectSeal_Start(2)");
	end
	local sString = format("Phong 蕁  t筰 Di謙 M玭 c? v? l綾 l?, Ma kh?  mang n m閠 lng l韓 qu竔 v藅, n誹 c? ti誴 t鬰 nh? th?, phong 蕁 s? b? ph? v?. Th阨 gian kh玭g c遪 nhi襲, c竎 h? ch? c? <color=red>%d ph髏<color>  th鵦 hi謓, ti猽 di謙 輙 nh蕋 <color=red>%d t猲<color> qu竔 v藅, ti猽 di謙 c祅g nhi襲, ph莕 thng c馻 ta c祅g t鑤.", ZQ_PROTECTSEAL_TIME_TOTLE/60, ZQ_PROTECTSEAL_KILL_MIN);
	local nCount = gf_GetTaskByte(ZQ_BATTLE_TASK6, 1);
	if nCount > 0 then
	  sString = sString..format("S? lng qu竔 ti猽 di謙 hi謓 t筰: <color=green>%d<color>", nCount);
	end
	Say(ZQ_MMZL_NPC_NAME..sString, getn(tSay), tSay);
end

function ZQ_ProtectSeal_Start(nNum)
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 30) == 0 then
		return 0;
	end
	--置为战斗状态
	SetFightState(1);
	--是否开启IB模式
	if nNum and tonumber(nNum) == 2 then
		if DelItem(ZQ_ITEM_IB[1], ZQ_ITEM_IB[2], ZQ_ITEM_IB[3], nNum) ~= 1 then
			Talk(1,"ZQ_ProtectSeal_Talk","S? lng Ma Th筩h trong h祅h trang kh玭g ");
			return 0;
		end
		--恢复血蓝
		RestoreAll();
		--给魔法属性
		CastState("state_p_attack_percent_add", 300, 10 * 60 * 18, 1, 20001, 1);
		CastState("state_m_attack_percent_add", 300, 10 * 60 * 18, 1, 20002, 1);
		SyncCustomState(1, 20001, 1, "Ph? h? c馻 Tr薾 Linh Di謙 M玭");
		Talk(1, "", "C竎 h? nh薾 頲<color=yellow>".."Ph? h? c馻 Tr薾 Linh Di謙 M玭".."<color>hi謚 qu?:  \n<color=green>".."N閕 ngo筰 c玭g t╪g 3 l莕".."<color>");
	end
	--开启计时器
	local nTrigger = CreateTrigger(1, 1524, 1524 * 2);
	if nTrigger == 0 then
		ZQ_ProtectSeal_Exit();
		return 0;
	end
	ContinueTimer(nTrigger);
	--开启杀怪计数器
	nTrigger = CreateTrigger(0, 1293, 1293 * 2);
	if nTrigger == 0 then
		ZQ_ProtectSeal_Exit();
		return 0;
	end
	--各种计数清理一下
	gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 1, 2, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskByte(ZQ_BATTLE_TASK6, 1, 0, TASK_ACCESS_CODE_ZQBATTLE);
	
	Talk(1,"",format("Khi猽 chi課 b総 u! C竎 h? ch? c? %d ph髏  th鵦 hi謓, ti猽 di謙 輙 nh蕋 %d qu竔, m韎 c? th? nh薾 頲 ph莕 thng: qu竔 ti猽 di謙 c祅g nhi襲, ph莕 thng c祅g cao.", 5, 10));
end

function ZQ_ProtectSeal_Intro()
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 30) == 0 then
		return 0;
	end
	local tSay = {
		"\n Ph秐 h錳/ZQ_ProtectSeal_Talk",	
	}
	Say(ZQ_MMZL_NPC_NAME.."Ma kh? t? Di謙 M玭 mang l筰 r蕋 nhi襲 qu竔 v藅, ti猽 di謙 nh鱪g qu竔 v藅 n祔, Th? V? Phong 蕁. \nNgi ch琲 c? th? d飊g 2 Ma Th筩h  n﹏g cao 300% l鵦 t蕁 c玭g, h錳 ph鬰 to祅 b? sinh l鵦 n閕 l鵦, BUFF s? bi課 m蕋 sau khi th阨 gian k誸 th骳, nh薾 ph莕 thng ho芻 khi tr鋘g thng. \nc t輓h c馻 qu竔 v藅: <color=red>N閕 ph遪g cao, ngo筰 ph遪g th蕄, c玭g k輈h ngo筰 c玭g<color>", getn(tSay), tSay);
end

function ZQ_ProtectSeal_Award()
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 30) == 0 then
		return 0;
	end
	local nCount = gf_GetTaskByte(ZQ_BATTLE_TASK6, 1);
	local nIndex = 1;
	if nCount < ZQ_PROTECTSEAL_KILL_MIN then
		nIndex = getn(ZQ_PROTECTSEAL_AWARD);
	else	
		for i =1, getn(ZQ_PROTECTSEAL_AWARD) - 1 do
			if nCount >= ZQ_PROTECTSEAL_AWARD[i][1] then
				nIndex = i;
			else
				break;
			end
		end
	end
	--给真气
	AwardGenuineQi(ZQ_PROTECTSEAL_AWARD[nIndex][2]);
	--给经验
	gf_Modify("Exp", ZQ_PROTECTSEAL_AWARD[nIndex][3]);
	--给道具
	gf_AddItemEx2({2, 1, 30497, ZQ_PROTECTSEAL_AWARD[nIndex][4]}, "Ma Tinh", ZQ_szLogTitle, "Th? V? Tr薾 Linh", 0, 1);
	--不能再给奖励了
	gf_SetTaskBit(ZQ_BATTLE_TASK2, 30, 0, TASK_ACCESS_CODE_ZQBATTLE);
end

function ZQ_ProtectSeal_Succ()
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 30) == 0 then
		return 0;
	end
	local nCount = gf_GetTaskByte(ZQ_BATTLE_TASK6, 1);
	Talk(1,"ZQ_ProtectSeal_Exit",format("Ch骳 m鮪g  th祅h c玭g ti猽 di謙<color=green>%d<color> t猲", nCount));
end

function ZQ_ProtectSeal_Exit()
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 30) == 0 then
		return 0;
	end
	ZQ_ProtectSeal_Award();
	ZQ_ProtectSeal_Clean();
	ZQ_OutfromCopy();
	ZQ_Trigger_Clean();
	FloatMsg2Player();
	Talk(1,"","C竎 h?  r阨 kh醝 Th? V? Phong 蕁!");
end

function ZQ_ProtectSeal_Fail()
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 30) == 0 then
		return 0;
	end
	ZQ_ProtectSeal_Award();
	ZQ_ProtectSeal_Clean();
	ZQ_OutfromCopy();
	ZQ_Trigger_Clean();
	FloatMsg2Player();
	Msg2Player("B秓 v? phong 蕁 th蕋 b筰!");
end

function ZQ_ProtectSeal_Clean()
	--时间触发器
	if GetTrigger(1524 * 2) ~= 0 then
		RemoveTrigger(GetTrigger(1524 * 2));
	end
	--杀怪触发器
	if GetTrigger(1293 * 2) ~= 0 then
		RemoveTrigger(GetTrigger(1293 * 2));
	end		
	--清理魔法属性
	RemoveState(20001);
	RemoveState(20002);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 1, 2, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskByte(ZQ_BATTLE_TASK6, 1, 0, TASK_ACCESS_CODE_ZQBATTLE);
	--这种情况给保底奖励
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 30) == 1 then
		Talk(1,"ZQ_ProtectSeal_Award","B秓 v? tr薾 linh th蕋 b筰!");
		return 0;
	end
end

function ZQ_ProtectSeal_OnTimer()
	local nTimes = gf_GetMyTaskByte(ZQ_BATTLE_TASK9, 1, 2);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 1, 2, nTimes + 1, TASK_ACCESS_CODE_ZQBATTLE);
	--玩家死亡
	if nTimes == ZQ_PLAYER_DEATH_TAG then
		--杀怪触发器
		if GetTrigger(1293 * 2) ~= 0 then
			RemoveTrigger(GetTrigger(1293 * 2));
		end	
		ZQ_ProtectSeal_Fail();
		return 0;
	end
	if mod(nTimes, 60) == 0 then
		Msg2Player(format("Th阨 gian c遪 l筰: %ds, s? lng ti猽 di謙 ch: %d.", ZQ_PROTECTSEAL_TIME_TOTLE - nTimes, gf_GetTaskByte(ZQ_BATTLE_TASK6, 1)));
	end
	--到时间了
	if nTimes >= ZQ_PROTECTSEAL_TIME_TOTLE or nTimes + 1 >= 65535 then
		--时间触发器
		if GetTrigger(1524 * 2) ~= 0 then
			RemoveTrigger(GetTrigger(1524 * 2));
		end
		--杀怪触发器
		if GetTrigger(1293 * 2) ~= 0 then
			RemoveTrigger(GetTrigger(1293 * 2));
		end	
		--给东东
		ZQ_ProtectSeal_Succ();
		return 0;
	end
	if nTimes == 0 then 
		SetPos(1905, 3535);
	end
end

function ZQ_ProtectSeal_Killer()
	--目标NPC名“怪物”	
	local nCount = gf_GetTaskByte(ZQ_BATTLE_TASK6, 1);
	--最大计数
	if nCount >= 255 then
		RemoveTrigger(GetTrigger(1293 * 2));
		return 0;
	end
	gf_SetTaskByte(ZQ_BATTLE_TASK6, 1, nCount + 1, TASK_ACCESS_CODE_ZQBATTLE);
end

function OnTimer1()
	local nCount = gf_GetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2);
	if nCount >= ZQ_COPY_TIME_MAX then
		RemoveTrigger(GetTrigger(1525 * 2));
		if gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 21, 22) < ZQ_REPAIRREAL_COUNT_MAX then	
			Talk(1,"ZQ_RepairReal_Fail","Х h誸 th阨 gian c鯽 秈")
		end
		return 0;
	end
	--显示右边信息
	local nTimes = gf_GetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4);
	local nUseCount = gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 25, 27);
	local nGoalTime = floor(nTimes/ZQ_SEAL_START_TIME) * ZQ_SEAL_START_TIME + ZQ_FIND_GOAL_TIME + ZQ_SEAL_EX_TIME * nUseCount + 1;
	local nCountTemp = gf_GetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4);
	local nSurplusTime = 0;
	if gf_GetTaskBit(ZQ_BATTLE_TASK6, 16) == 1 then
		nSurplusTime = nGoalTime - nTimes;
	end 	
	local nGoalName = "";
	local tTempValue = {
		{ZQ_BATTLE_TASK6, 3, 4},
		{ZQ_BATTLE_TASK7, 1, 2},
		{ZQ_BATTLE_TASK7, 3, 4},
	}
	local nSize = getn(tTempValue);
	local tTempIndex = {};
	for i = 1, nSize do
		local nValue = gf_GetMyTaskByte(tTempValue[i][1], tTempValue[i][2], tTempValue[i][3]);
		if nValue ~= 0 then
			tinsert(tTempIndex, nValue);
		end
	end
	for i = 1, getn(tTempIndex) do
		local nValue = tonumber(tTempIndex[i]);
		nGoalName = nGoalName..ZQ_REPAIRREAL_NPC[nValue][1];
		if i ~= getn(tTempIndex) then
			nGoalName = nGoalName..",";
		end
	end
	FloatMsg2Player(format("Th阨 gian vt 秈: %ds\n truy t譵 v藅 ph萴:%s\n th阨 gian c遪 l筰:%ds", ZQ_COPY_TIME_MAX - nCount, nGoalName, nSurplusTime));
	gf_SetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2, nCount + 1, TASK_ACCESS_CODE_ZQBATTLE);
end

function OnTimer2()
	local nCount = gf_GetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2);
	if nCount >= ZQ_COPY_TIME_MAX then
		RemoveTrigger(GetTrigger(1526 * 2));
		if gf_GetTaskByte(ZQ_BATTLE_TASK8, 1) < getn(ZQ_EVILBET_AWARD) - 1 then
			Talk(1,"ZQ_EvilBet_GiveUp","Х h誸 th阨 gian c鯽 秈")
		end
		return 0;
	end
	FloatMsg2Player(format("Th阨 gian vt 秈: %ds\n s? l莕 t輈h l騳: %d l莕", ZQ_COPY_TIME_MAX - nCount, gf_GetTaskByte(ZQ_BATTLE_TASK8, 1)));
	gf_SetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2, nCount + 1, TASK_ACCESS_CODE_ZQBATTLE);
end

function OnTimer3()
	local nCount = gf_GetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2);
	if nCount >= ZQ_COPY_TIME_MAX then
		RemoveTrigger(GetTrigger(1527 * 2));
		if gf_GetTaskByte(ZQ_BATTLE_TASK8, 2) < ZQ_RESTARTSEAL_COUNT_MAX then
			Talk(1,"ZQ_ReStartSeal_Exit","Х h誸 th阨 gian c鯽 秈")
		end
		return 0;
	end
	local sGoalName = ""
	local nTableIndex = gf_GetTaskByte(ZQ_BATTLE_TASK8, 3);
	if nTableIndex > 0 and nTableIndex <= getn(ZQ_RESTART_REAL_NPC) then
		sGoalName = ZQ_RESTART_REAL_NPC[nTableIndex][1];
	end
	FloatMsg2Player(format("Th阨 gian vt 秈: %ds\n m鬰 ti猽 kh雐 ng: %s", ZQ_COPY_TIME_MAX - nCount, sGoalName));
	gf_SetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2, nCount + 1, TASK_ACCESS_CODE_ZQBATTLE);
end

function OnTimer4()
	local nCount = gf_GetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2);
	if nCount >= ZQ_COPY_TIME_MAX then
		RemoveTrigger(GetTrigger(1528 * 2));
		Talk(1,"ZQ_ProtectSeal_Fail","Х h誸 th阨 gian c鯽 秈")
		return 0;
	end
	FloatMsg2Player(format("Th阨 gian vt 秈: %ds\n s? lng qu竔 di謙: %d\n th阨 gian c遪 l筰:%ds", ZQ_COPY_TIME_MAX - nCount, gf_GetTaskByte(ZQ_BATTLE_TASK6, 1), ZQ_PROTECTSEAL_TIME_TOTLE - gf_GetMyTaskByte(ZQ_BATTLE_TASK9, 1, 2)));
	gf_SetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2, nCount + 1, TASK_ACCESS_CODE_ZQBATTLE);
end

function ZQ_CreateCopyTrigger(nTriggerID)
	local nTrigger;
	if GetTrigger(nTriggerID * 2) == 0 then
		nTrigger = CreateTrigger(1, nTriggerID, nTriggerID * 2);
	end
	gf_SetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2, 0, TASK_ACCESS_CODE_ZQBATTLE);
	if nTrigger ~= 0 then
		ContinueTimer(nTrigger);
	end
	return nTrigger;
end

function ZQ_GetCopyCount()
	return gf_GetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2);
end

function ZQ_CopyIsAble(nTiggerID)
	if GetTrigger(nTiggerID * 2) == 0 then
		return 0;
	end
	return 1;
end

function ZQ_Trigger_Clean()
	gf_SetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2, 0, TASK_ACCESS_CODE_ZQBATTLE);
	RemoveTrigger(GetTrigger(1525 * 2));
	RemoveTrigger(GetTrigger(1526 * 2));
	RemoveTrigger(GetTrigger(1527 * 2));
	RemoveTrigger(GetTrigger(1528 * 2));
end
