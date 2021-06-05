Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\zq_battles\\zq_define.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\lib\\talktmp.lua")

--�����Ӫ
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
			--����״̬
			gf_SetTaskBit(tCeilAnother[2], tCeilAnother[3], gf_GetTaskBit(tCeil[2], tCeil[3]), TASK_ACCESS_CODE_ZQBATTLE);
			gf_SetTaskBit(tCeilAnother[2], tCeilAnother[4], gf_GetTaskBit(tCeil[2], tCeil[4]), TASK_ACCESS_CODE_ZQBATTLE);
			--ɾ�����˵�����
			if tGtTask:check_cur_task(tCeil[1]) == 1 then
				DirectDeleteTask(tCeil[1]);
				--��Ӧ�ѽ�����
				gf_SetTaskBit(tCeilAnother[2], tCeilAnother[4], 0, TASK_ACCESS_CODE_ZQBATTLE);
			end
			--ԭ״̬����
			gf_SetTaskBit(tCeil[2], tCeil[3], 0, TASK_ACCESS_CODE_ZQBATTLE);
			gf_SetTaskBit(tCeil[2], tCeil[4], 0, TASK_ACCESS_CODE_ZQBATTLE);
		end		
	end
end

--������Ӫ
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

--�ж���Ӫ
function ZQ_JugdeCamp(nCamp)
	if ZQ_GetCamp() == nCamp then
		return 1;
	else
		return 0;
	end
end

--��ͼ�Ϸ�
function ZQ_IsAllowMap()
	local nMapId, nX, nY = GetWorldPos();
	if nMapId ~= ZQ_MAP_ID then
		return 0;
	end
	return 1;
end

--��¼����С�ؿ�ǰ������
function ZQ_RecordPos()
	local nMapId, nX, nY = GetWorldPos();
	gf_SetMyTaskByte(ZQ_BATTLE_TASK10, 1, 2, nX, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK10, 3, 4, nY, TASK_ACCESS_CODE_ZQBATTLE);
end

--��С�ؿ��ǵ���
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

--������ͼtrap��
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

--npc����
function ZQ_NpcCreate()
	if IsSubSystemOpen(SYS_SWITCH_ZHENQI_BATTLE) ~= 1 then
		return 0;
	end	
	local nNpcIndex, tNpcPos = {};
	--������
	nNpcIndex = CreateNpc("ZM_jieyingren", "Ch�n Ma Ti�p D�n S�", 300, 1796, 3358);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_jieyinren.lua");
	--�ξ�Ӫ��
	nNpcIndex = CreateNpc("ZM_songjiangjun", "T�ng T��ng Qu�n", ZQ_MAP_ID, 1572, 3800);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_jiangjun.lua");
	nNpcIndex = CreateNpc("ZM_chunyangzhenren", "Thu�n D��ng Ch�n Nh�n", ZQ_MAP_ID, 1540, 3772);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\chunyangzhenren.lua");
	nNpcIndex = CreateNpc("ZM_songjunxuguan", "T�ng Qu�n Nhu Quan", ZQ_MAP_ID, 1592, 3827);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\junxuguang.lua");
	nNpcIndex = CreateNpc("ZM_songshangren", "T�ng Th��ng Nh�n", ZQ_MAP_ID, 1532, 3756);
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
		nNpcIndex = CreateNpc("ZM_songshangbing", "T�ng Th��ng Binh", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
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
		nNpcIndex = CreateNpc("ZM_songshibing", "T�ng S� Binh", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
		SetNpcDeathScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\song_shibing_death.lua");
		SetCampToNpc(nNpcIndex, ZQ_tCampString[SONG_ID]);
	end
	nNpcIndex = CreateNpc("ZM_songxunyingguan", "T�ng Tu�n Doanh Quan", ZQ_MAP_ID, 1580, 3793);
	SetCampToNpc(nNpcIndex, ZQ_tCampString[SONG_ID]);
	nNpcIndex = CreateNpc("ZM_songxunyingguan", "T�ng Tu�n Doanh Quan", ZQ_MAP_ID, 1617, 3736);
	SetCampToNpc(nNpcIndex, ZQ_tCampString[SONG_ID]);
	nNpcIndex = CreateNpc("ZM_songjiandie", "Gi�n �i�p �nh Phong", ZQ_MAP_ID, 1616, 3823);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\jd_yingfeng.lua");
	nNpcIndex = CreateNpc("ZM_songxianfeng", "T�ng ti�n phong", ZQ_MAP_ID, 1622, 3737);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_songxianfeng.lua");
	tNpcPos = {
		{1704, 3753},
		{1599, 3575},
		{1611, 3503},
	}
	for i = 1, getn(tNpcPos) do
		nNpcIndex = CreateNpc("ZM_mohuasongXF", "Ma H�a T�ng Ti�n Phong", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
	end	
	--�ɾ�Ӫ��
	nNpcIndex = CreateNpc("ZM_liaojiangjun", "Li�u T��ng Qu�n", ZQ_MAP_ID, 1912, 3282);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_jiangjun.lua");
	nNpcIndex = CreateNpc("ZM_jinlunfawang", "Kim Lu�n Ph�p V��ng", ZQ_MAP_ID, 1885, 3250);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\jinglunfawang.lua");
	nNpcIndex = CreateNpc("ZM_liaojunxuguan", "Li�u Qu�n Nhu Quan", ZQ_MAP_ID, 1961, 3314);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\junxuguang.lua");
	nNpcIndex = CreateNpc("ZM_liaoshangren", "Li�u Th��ng Nh�n", ZQ_MAP_ID, 1953, 3306);
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
		nNpcIndex = CreateNpc("ZM_liaoshangbing", "Li�u Th��ng Binh", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
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
		nNpcIndex = CreateNpc("ZM_liaoshibing", "Li�u S� Binh", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
		SetNpcDeathScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\liao_shibing_death.lua");
		SetCampToNpc(nNpcIndex, ZQ_tCampString[LIAO_ID]);
	end
	nNpcIndex = CreateNpc("ZM_liaoxunyingguan", "Li�u TU�n Doanh Quan", ZQ_MAP_ID, 1927, 3298);
	SetCampToNpc(nNpcIndex, ZQ_tCampString[LIAO_ID]);
	nNpcIndex = CreateNpc("ZM_liaoxunyingguan", "Li�u TU�n Doanh Quan", ZQ_MAP_ID, 1920, 3293);
	SetCampToNpc(nNpcIndex, ZQ_tCampString[LIAO_ID]);
	nNpcIndex = CreateNpc("ZM_liaojiandie", "Gi�n �i�p Kim �i�u", ZQ_MAP_ID, 1900, 3252);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\jd_jingdiao.lua");
	nNpcIndex = CreateNpc("ZM_liaoxianfeng", "Li�u ti�n phong", ZQ_MAP_ID, 1866, 3331);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_liaoxianfeng.lua");
	tNpcPos = {
		{1753, 3323},
		{1886, 3457},
		{1862, 3563},
	}
	for i = 1, getn(tNpcPos) do
		nNpcIndex = CreateNpc("ZM_mohualiaoXF", "Ma H�a Li�u Ti�n Phong", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
	end
	--��Դ��
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
		nNpcIndex = CreateNpc("ZM_zijinmu", "T� Kim M�c", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
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
		nNpcIndex = CreateNpc("ZM_jintiekuang", "Kho�n tinh thi�t", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
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
		nNpcIndex = CreateNpc("ZM_qixinghua", "Th�t tinh hoa", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
		SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\cai_ji.lua");
	end
	--��̳
	tNpcPos = {
		{1843, 3466},
		{1719, 3262},
		{1596, 3513},
		{1804, 3697},
	}
	for i = 1, getn(tNpcPos) do
		nNpcIndex = CreateNpc("Th�nh H�a ��i", "T� ��n", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
		SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_jitan.lua");
	end
	--�޸���ӡ
	ZQ_RepairSeal_NpcCreate();
	--а���Լ
	nNpcIndex = CreateNpc("ZM_shenmenxieling", "Sinh M�n T� Linh", ZQ_MAP_ID, 1934, 3685);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\shengmen_xieling.lua");
	--������ӡ
	ZQ_RestartSeal_NpcCreate();
	--������ӡ
	ZQ_ProtectSeal_NpcCreate();
	--����trap��
	ZQ_CreateTrap();
end

--�޸���ӡNPC����
function ZQ_RepairSeal_NpcCreate()
	local nNpcIndex = CreateNpc("ZM_jinmenzhenling", "C�nh M�n Tr�n Linh", ZQ_MAP_ID, 1602, 3303);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\jinmen_zhenling.lua");
	for i = 1, getn(ZQ_REPAIRREAL_NPC) do
		nNpcIndex = CreateNpc(ZQ_REPAIRREAL_NPC[i][2], ZQ_REPAIRREAL_NPC[i][1], ZQ_MAP_ID, ZQ_REPAIRREAL_NPC[i][3], ZQ_REPAIRREAL_NPC[i][4]);
		SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_repairreal_npc.lua");
	end
end

--������ӡ
function ZQ_RestartSeal_NpcCreate()
	local npcIndex = CreateNpc("ZM_simenzhenling", "T� M�n Tr�n Linh", ZQ_MAP_ID, 1573, 3520);
	SetNpcScript(npcIndex, "\\script\\function\\zq_battles\\npc\\simen_zhenling.lua");
	for i = 1, getn(ZQ_RESTART_REAL_NPC) do
		npcIndex = CreateNpc(ZQ_RESTART_REAL_NPC[i][2], ZQ_RESTART_REAL_NPC[i][1], ZQ_MAP_ID, ZQ_RESTART_REAL_NPC[i][3], ZQ_RESTART_REAL_NPC[i][4]);
		SetNpcScript(npcIndex, "\\script\\function\\zq_battles\\npc\\zm_restartseal.lua");
	end
	for i = 1, getn(ZQ_RESTART_JIGUAN_NPC) do
		npcIndex = CreateNpc(ZQ_RESTART_JIGUAN_NPC[i][2], ZQ_RESTART_JIGUAN_NPC[i][1]..tostring(i), ZQ_MAP_ID, ZQ_RESTART_JIGUAN_NPC[i][3], ZQ_RESTART_JIGUAN_NPC[i][4]);
	end
end

--������ӡ
function ZQ_ProtectSeal_NpcCreate()
	local nNpcIndex = CreateNpc("ZM_meimenzhenling", "Di�t M�n Tr�n Linh", ZQ_MAP_ID, 1874, 3491);
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
	--���ǳ�������
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
	--�Ƴ��ǳ�������
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

--���ɻ򷵻ؿ��ŵ�����SubIndex
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

--nIndex ָ���Ǹ�NPC�ı�
--nMax ����ܸ���������
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

--��ȡ�����ʵ��
function ZQ_AcceptOrFinish_Task(nIndex, nSubIndex)
	local tTaskCnf = ZQ_TASK_LIST[nIndex];
	if not tTaskCnf then return 0;  end
	local tTaskSubCnf = tTaskCnf[nSubIndex];
	if not tTaskSubCnf or getn(tTaskSubCnf) ~= ZQ_TASK_TOTAL then return 0; end
	--�Ƿ�ӹ�
	local nIsAccept = gf_GetTaskBit(tTaskSubCnf[2], tTaskSubCnf[4]);
	if nIsAccept ~= 1 then
		if 1 == DirectGetGTask(tTaskSubCnf[1], 2) then
			gf_SetTaskBit(tTaskSubCnf[2], tTaskSubCnf[4], 1, TASK_ACCESS_CODE_ZQBATTLE);
			Msg2Player(format("C�c h� �� nh�n nhi�m v� [%s]", tTaskSubCnf[5]));
		end
	else
		local nRet = DirectFinishGTask(tTaskSubCnf[1], 2);
		if nRet == 2 then
			Msg2Player("Nhi�m v� v�n ch�a ho�n th�nh!");
			--��������
			if tGtTask:IsCanJump(tTaskSubCnf[1]) == 1 then
				Say(format("<color=green>%s:<color>C�c h� x�c ��nh d�ng <color=red>%d<color> v�ng �� h� tr� ho�n th�nh nhi�m v�?", GetNpcName(GetTargetNpc()), tGtTask:GetJumpTaskCost(tTaskSubCnf[1])/10000), 2, "\nXin gi�p m�nh ho�n th�nh/#JumpGTask("..tTaskSubCnf[1]..","..(1)..")", "\nTa mu�n t� tay l�m/nothing");
			end
		elseif nRet == -3 then
			Msg2Player("C�c h� �� ho�n th�nh nhi�m v� n�y r�i!");
		end
	end
end

--����״̬
function ZQ_Return_String(nIndex, nSubIndex)
	local tTaskCnf = ZQ_TASK_LIST[nIndex];
	if not tTaskCnf then return 0;  end
	local tTaskSubCnf = tTaskCnf[nSubIndex];
	if not tTaskSubCnf or getn(tTaskSubCnf) ~= ZQ_TASK_TOTAL then return 0; end
	local tString = {"Ch�a nh�n","Ch�a ho�n th�nh","C� th� giao","Ng�y mai h�y ��n", "C� th� b� qua"};
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

--������������״̬
function ZQ_Everyday_ReSet()
	ZQ_Everyday_ReSet_NewTask_Record();
	ZQ_Everyday_ReSet_NewTask();
	ZQ_Everyday_ReSet_JoinTimes();
end

--���ü�̳��������
function ZQ_Everyday_ReSet_JoinTimes()
	gf_SetMyTaskBit(ZQ_BATTLE_TASK6, 10, 15, 0, TASK_ACCESS_CODE_ZQBATTLE);
end

--��������ϵͳ��ɼ�����ǣ���Щ�����⴦��
function ZQ_Everyday_ReSet_NewTask_Record()
	local tList = {
			{112, ZQ_KILL_PLAYER_SONG},
			{117, ZQ_KILL_PLAYER_LIAO},
			{124, ZQ_CURE_SONG},
			{128, ZQ_CURE_LIAO},
			{129, ZQ_TASK_QXH},
			{130, ZQ_TASK_ZJM},
			{131, ZQ_TASK_JTK},
	}--����ID��ʹ�õ����������Ӧ
	for i = 1, getn(tList) do
		if tGtTask:check_cur_task(tList[i][1]) ~= 1 then
				SetTask(tList[i][2], 0);
		end
	end 
end

--��������ϵͳ�ı��
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

--����~1��˵����������3��û�н���������4
--����1��˵��ȫ������
function ZQ_GetTaskStatus(tSubTaskList)
	if not tSubTaskList then return -1; end
	for i = 1, getn(tSubTaskList) do 
		if getn(tSubTaskList[i]) ~= ZQ_TASK_TOTAL then
			print("UERROR:ZQ_GetTaskStatus getn(tSubTaskList[i]) ~= 5");
			return -1;
		end
		--�ӹ�����
		--if gf_GetTaskBit(tSubTaskList[i][2], tSubTaskList[i][4]) == 1 then
		--û�н�
		if tGtTask:check_cur_task(tSubTaskList[i][1]) == 1 then
			return 0;
		end
		--end
	end
	return 1;
end

--�ɼ�
function ZQ_Gather()
	local npcIndex = GetTargetNpc();
	local npcName = GetNpcName(npcIndex);
	local tListSrc = ZQ_GATHER_LIST;
	if not tListSrc[npcName] then
		return 0;
	end 
	--�����ռ䲻��
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��".."Kh�ng th� thu th�p"..npcName);
		return 0;
	end
	--��Ӧ�������Ƿ��ȡ
	if tGtTask:check_cur_task(tListSrc[npcName][2]) == 0 then
		Msg2Player(format("R�t ti�c, c�c h� v�n ch�a nh�n nhi�m v� thu th�p %s.", npcName));
		return 0;
	end
	--��Ӧ�������Ƿ������
	if DirectIsTaskFinish(tListSrc[npcName][2]) == 1 then
		Msg2Player(format("Nhi�m v� thu th�p %s �� ho�n th�nh kh�ng th� ti�p t�c thu th�p", npcName));
		return 0;
	end
	--�ɼ������Ƿ��ѽ���200����
	if GetTask(tListSrc[npcName][7]) >= 200 then
		Talk(1,"",format("C�c h� �� thu th�p %d l�n r�i, kh�ng th� ti�p t�c thu th�p n�a.", 200));
		return 0;
	end
	--��Ʒ���;��ǹ��㹻
	--local nItemIndex, nWorldItemIndex = GetFirstItem(tListSrc[npcName][5][1], tListSrc[npcName][5][2], tListSrc[npcName][5][3]);
	local nItemIndex = GetItemIndex(tListSrc[npcName][5][1], tListSrc[npcName][5][2], tListSrc[npcName][5][3]);
	if nItemIndex <= 0 then
		Msg2Player(format("Kh�ng th� thu th�p %s v� trong h�nh trang �� b�n %s kh�ng �� ", npcName, tListSrc[npcName][1]));
		return 0;
	end
	if AbradeItem(tonumber(nItemIndex), 0) < tListSrc[npcName][3] then
		Msg2Player(format("�� b�n c�a %s  kh�ng �� %d, kh�ng th� thu th�p. N�u h�nh trang c�n c� %s kh�c, h�y h�y b� %s h�t �� b�n.", tListSrc[npcName][1], tListSrc[npcName][3], tListSrc[npcName][1], tListSrc[npcName][1]));
		return 0;
	end
	--�Ƿ����˴�����
	if GetTrigger(1522 * 2) ~= 0 then
		Msg2Player("Thao t�c thu th�p l�n tr��c v�n ch�a ho�n th�nh");
		return 0;
	end
	--�Ƿ��������ڲɼ�
	local nCurLevel = GetUnitCurStates(npcIndex, 0);
	if nCurLevel == 99 then
		Msg2Player(format("%s �� c� ng��i �ang thu th�p, h�y th� l�i sau gi�y l�t.", npcName));
		return 0;
	end
	--������----------
	ProgressSlot(ZQ_GATHER_TIME * 18, "ZQ_Gather_ProgressSlot");
	local nTriggerIndex = CreateTrigger(1, 1522, 1522 * 2);
	ContinueTimer(nTriggerIndex);
	--��¼Item��Index
	gf_SetMyTaskByte(ZQ_BATTLE_TASK3, 1, 3, tonumber(nItemIndex), TASK_ACCESS_CODE_ZQBATTLE);
	--��ʾnpc�ڱ��ɼ�
	AddUnitStates(npcIndex, 0, 100);
	local nMapId, nX, nY = GetWorldPos();
	gf_SetMyTaskByte(ZQ_BATTLE_TASK4, 1, 2, nX, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK4, 3, 4, nY, TASK_ACCESS_CODE_ZQBATTLE);
	--������ʼ��
	gf_SetTaskByte(ZQ_BATTLE_TASK3, 4, 0, TASK_ACCESS_CODE_ZQBATTLE);
	--��¼npc����
	SetTask(ZQ_BATTLE_TASK5, npcIndex, TASK_ACCESS_CODE_ZQBATTLE);
end

function ZQ_Gather_ProgressSlot()
end

function ZQ_Gather_OnTimer()
	--�ж�Ŀ���Ƿ�����Դ
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
			Msg2Player(format("Thu th�p %s th�t b�i!", npcName));
		end
		gf_SetTaskByte(ZQ_BATTLE_TASK3, 4, nSecond + 1, TASK_ACCESS_CODE_ZQBATTLE);
	else
		ZQ_Gather_Close(nNpcIndex);
		--���;ø�����
		if AbradeItem(nItemIndex, 10) >= 0 then
			SetTask(tSubSrc[7], GetTask(tSubSrc[7]) + 1);
			ModifyExp(60 * GetLevel());
			gf_AddItemEx2(tSubSrc[4], npcName, ZQ_szLogTitle, "Gather", 0, 1);
			--�Զ�������һ�βɼ�
			ZQ_Gather();
		end
	end
end
	
	
function ZQ_Gather_Close(nNpcIndex)
	--ɾ��������
	RemoveTrigger(GetTrigger(1522 * 2));
	--ֹͣNPC����
	--StopFakeGathering();
	ProgressSlotCancle();
	--���npc���ɼ����
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
	--�����ж�
	if nCostIndex ~= 0 and GetItemCount(2, 1, 30230) < nCostIndex then
		Talk(1,"",format("H�nh trang kh�ng �� %dXU", nCostIndex));
		return 0;
	end
	if GetFreeItemRoom() < 2 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	--��������
	if DelItemByIndex(nItemIndex, 1) == 1 then
		if nCostIndex ~= 0 then
			if DelItem(2, 1, 30230, nCostIndex) == 1 then
			 	--�صý���
				for i = 1, getn(tConstAward) do
					gf_EventGiveRandAward(tConstAward, 100, 1, ZQ_szLogTitle, "ZQ_TMZ_PAK_CONSTAWARD", i, 1);
				end
				--�������
				gf_EventGiveRandAward(tRandomAward, 100, 1, ZQ_szLogTitle, "ZQ_TMZ_PAK_RANDOMAWARD", 0, 1);
			end
		else
			--�صý���
			for i = 1, getn(tConstAward) do
				gf_EventGiveRandAward(tConstAward, 100, 1, ZQ_szLogTitle, "ZQ_TMZ_PAK_CONSTAWARD", i, 1);
			end
			--�������
			gf_EventGiveRandAward(tRandomAward, 100, 1, ZQ_szLogTitle, "ZQ_TMZ_PAK_RANDOMAWARD", 0, 1);
		end
		return 1;
	end
end

--�޸�����
function ZQ_RepairReal()
	--�����ж�
	if GetTrigger(1523 * 2) ~= 0 then
		Talk(1,"","Kh�ng th� l�p l�i kh�i ��ng tu s�a tr�n linh");
		return 0;
	end
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 31) == 0 then
		return 0;
	end
	local nTrigger = CreateTrigger(1, 1523, 1523 * 2);
	--������������Ч
	gf_SetTaskBit(ZQ_BATTLE_TASK1, 31, 1, TASK_ACCESS_CODE_ZQBATTLE);
	--���õ���ʱ��ʼֵ
	gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, ZQ_SEAL_START_TIME, TASK_ACCESS_CODE_ZQBATTLE);
	--����ʱ�䴥����
	ContinueTimer(nTrigger);
end

function ZQ_RepairReal_OnTimer()
	local nTimes = gf_GetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4);
	--���ʱ�޵���
	if nTimes >= ZQ_REPAIRREAL_TIME_MAX then
		--�����Ǹ����׽���
		if gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 21, 22) == 1 then
			ZQ_RepairReal_Award(getn(ZQ_REPAIRREAL_AWARD));
			gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 21, 22, 0, TASK_ACCESS_CODE_ZQBATTLE);
		end
		ZQ_RepairReal_Clean();
		Talk(1,"ZQ_RepairReal_Fail","Tu s�a tr�n linh th�t b�i!");
		return 0;
	end
	--����ʧЧ
	if gf_GetTaskBit(ZQ_BATTLE_TASK1, 31) == 0 then
		return 0;
	end
	--����ʱ
	if nTimes < ZQ_SEAL_START_TIME then
		gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, gf_GetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4) + 1, TASK_ACCESS_CODE_ZQBATTLE);
		return 0;
	end
	--���������Ի�
	if mod(nTimes, ZQ_SEAL_START_TIME) == 0 then
		Msg2Player("Tu s�a phong �n �� b�t ��u!");
		--�����ǵڼ�����
		if nTimes / ZQ_SEAL_START_TIME > ZQ_REPAIRREAL_COUNT_MAX then
			gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, ZQ_REPAIRREAL_TIME_MAX, TASK_ACCESS_CODE_ZQBATTLE);
			return 0;
		end
		--��ǰ�޸�����Ĵ���
		gf_SetMyTaskBit(ZQ_BATTLE_TASK2, 21, 22, nTimes / ZQ_SEAL_START_TIME, TASK_ACCESS_CODE_ZQBATTLE);
		--���NPC��������
--		gf_SetMyTaskBit(ZQ_BATTLE_TASK2, 23, 24, 0, TASK_ACCESS_CODE_ZQBATTLE);
		--����ʧЧ
		gf_SetTaskBit(ZQ_BATTLE_TASK1, 31, 0, TASK_ACCESS_CODE_ZQBATTLE);
		--��NPCʧЧ
		gf_SetTaskBit(ZQ_BATTLE_TASK6, 16, 0, TASK_ACCESS_CODE_ZQBATTLE);
		--�ر�IBģʽ
		gf_SetTaskBit(ZQ_BATTLE_TASK6, 9, 0, TASK_ACCESS_CODE_ZQBATTLE);
		--+1
		gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, nTimes + 1, TASK_ACCESS_CODE_ZQBATTLE);
		--�����Ի�
		ZQ_RepairReal_FindGoalTalk();
		return 0;
	end
	--��ʱ
	local nCount = gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 25, 27);
	local nGoalTime = floor(nTimes/ZQ_SEAL_START_TIME) * ZQ_SEAL_START_TIME + ZQ_FIND_GOAL_TIME + ZQ_SEAL_EX_TIME * nCount + 1;
	if nTimes == nGoalTime then
		gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, ZQ_REPAIRREAL_TIME_MAX, TASK_ACCESS_CODE_ZQBATTLE);
		Msg2Player("Tu s�a c�nh m�n tr�n linh v��t qu� th�i h�n!");
		return 0;
	end
	--����
	local nCountTemp = gf_GetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, nCountTemp + 1, TASK_ACCESS_CODE_ZQBATTLE);
end

function ZQ_RepairReal_FindGoalTalk()
	if GetTrigger(1523 * 2) == 0 then
		return 0;
	end
	local nTimes = gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 21, 22);
	local tSay = {
		"\nKh�i ��ng tr�c ti�p/#ZQ_RepairReal_StartFindGoal(0)",
		--format("\nʹ��%d��ħʯ�ӳ�%d�뿪ʼ/#ZQ_RepairReal_StartFindGoal(%d)", nTimes, ZQ_SEAL_EX_TIME, nTimes),	
		"S� d�ng Ma Th�ch k�o d�i th�i gian/ZQ_RepairReal_ACFN",
		"\nT� b�/ZQ_RepairReal_GiveUp",
		--"��ֻ�ǿ�������/nothing",
	}
	local nSize = getn(ZQ_REPAIRREAL_NPC);
	local tRezult = gf_Random(1, nSize, nTimes);
	if not tRezult or (getn(tRezult) < 1 or getn(tRezult) > 3) then
		print("UDERROR:ZQ_RepairReal_FindGoalTalk tRezult");
		return 0;
	end
	--Ҫ������������
	ZQ_RepairReal_RecordIndex(tRezult);
	--�Ի�������Ŀ��NPC
	local strGoal = ""
	for i = 1, getn(tRezult) do
		strGoal = strGoal.."<color=green>"..ZQ_REPAIRREAL_NPC[tRezult[i]][1].."<color>";
		if i ~= getn(tRezult) then
			strGoal = strGoal..",";
		end
	end
	Say(ZQ_JMZL_NPC_NAME..format("��y l� l�n tu s�a phong �n th� <color=green>%d<color>, hi�n �ang c�n %s, c�c h� v�n c�n %d �� t�m m�c ti�u, h�y nhanh ch�ng h�nh ��ng.", nTimes, strGoal, ZQ_FIND_GOAL_TIME), getn(tSay), tSay);
end

function ZQ_RepairReal_ACFN()
	if GetTrigger(1523 * 2) == 0 then
		return 0;
	end
	local nNum = GetItemCount(2, 1, 30481);
	AskClientForNumber("ZQ_RepairReal_StartFindGoal", min(1, nNum), min(5, nNum), "H�y nh�p s� l��ng","");
end

function ZQ_RepairReal_StartFindGoal(nCount)
	if GetTrigger(1523 * 2) == 0 then
		return 0;
	end
	if tonumber(nCount) == 0 then
		--�ر�IBģʽ
		gf_SetTaskBit(ZQ_BATTLE_TASK6, 9, 0, TASK_ACCESS_CODE_ZQBATTLE);
		--������Ч
		gf_SetTaskBit(ZQ_BATTLE_TASK1, 31, 1, TASK_ACCESS_CODE_ZQBATTLE);
		--��NPC��Ч
		gf_SetTaskBit(ZQ_BATTLE_TASK6, 16, 1, TASK_ACCESS_CODE_ZQBATTLE);
		--����ħʯʹ�õ���Ŀ
		gf_SetMyTaskBit(ZQ_BATTLE_TASK2, 25, 27, 0, TASK_ACCESS_CODE_ZQBATTLE);
		Msg2Player(format("B�t ��u ��m ng��c %d gi�y!", ZQ_FIND_GOAL_TIME));
	else
		if DelItem(ZQ_ITEM_IB[1], ZQ_ITEM_IB[2], ZQ_ITEM_IB[3], nCount) ==  1 then
			--����IBģʽ
			gf_SetTaskBit(ZQ_BATTLE_TASK6, 9, 1, TASK_ACCESS_CODE_ZQBATTLE);
			--������Ч
			gf_SetTaskBit(ZQ_BATTLE_TASK1, 31, 1, TASK_ACCESS_CODE_ZQBATTLE);
			--��NPC��Ч
			gf_SetTaskBit(ZQ_BATTLE_TASK6, 16, 1, TASK_ACCESS_CODE_ZQBATTLE);
			--��¼ħʯʹ�õ���Ŀ
			gf_SetMyTaskBit(ZQ_BATTLE_TASK2, 25, 27, nCount, TASK_ACCESS_CODE_ZQBATTLE);
			Msg2Player(format("B�t ��u ��m ng��c %d gi�y!", ZQ_FIND_GOAL_TIME + ZQ_SEAL_EX_TIME * nCount));
		else
			Talk(1, "ZQ_RepairReal_FindGoalTalk", "Ma Th�ch trong h�nh trang kh�ng ��!");
		end
	end
end

function ZQ_RepairReal_NpcTalk(nNpcIndex)
	--����Ƿ���Ч
	if gf_GetTaskBit(ZQ_BATTLE_TASK6, 16) == 0 then
		return 0;
	end
	--��ǰ�޸�����Ĵ���
	local nTimes = gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 21, 22);
	--�������������
--	if gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 23, 24) >= nTimes then
--		return 0;
--	end
	--���NPC�ڱ��������
	local nTableIndex = ZQ_RepairReal_FindTableIndex(GetNpcName(nNpcIndex));
	--Npc�Ǳ������
	if nTableIndex > 0 and nTableIndex <= getn(ZQ_REPAIRREAL_NPC) then
--		--���NPC����+1
--		gf_SetMyTaskBit(ZQ_BATTLE_TASK2, 23, 24, gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 23, 24) + 1, TASK_ACCESS_CODE_ZQBATTLE);
		--�Ƿ������е�һ��Ŀ��
		local bTag = 1;
		local tString = {"Th�t b�i", " th�nh c�ng "};
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
--		Msg2Player(format("��%d�β���", gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 23, 24))..tString[bTag]);
		Msg2Player("Truy t�m nguy�n li�u m�c ti�u--"..tString[bTag]);
		if bTag == 1 then
			HeadMsg2Player("T�m sai r�i");
		elseif bTag == 2 then
			HeadMsg2Player("T�m ��ng r�i");
		end
	end
--	--�������Ŀ����
--	if gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 23, 24) == nTimes then
--		--Ҫ�ҵĶ��ҵ���
--		--IBģʽ֪��
--		gf_SetTaskBit(ZQ_BATTLE_TASK6, 9, 0, TASK_ACCESS_CODE_ZQBATTLE);
--		--��npcʧЧ
--		gf_SetTaskBit(ZQ_BATTLE_TASK6, 16, 0, TASK_ACCESS_CODE_ZQBATTLE);
--		if ZQ_RepairReal_RezultFind() == 1 then
--			--��������
--			ZQ_RepairReal_Award(nTimes);
--			if nTimes < ZQ_REPAIRREAL_COUNT_MAX then
--				--������һ���׶�
--				SetPos(1605, 3306);
--				CastState("state_fetter", 100, 18*3);
--				CastState("state_dispear",100, 18*3);
--				--NpcCommand(PIdx2NpcIdx(),1)
--				gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, ZQ_SEAL_START_TIME * (nTimes + 1), TASK_ACCESS_CODE_ZQBATTLE);
--			else
--				--�������ߴ�����
--				Talk(1,"ZQ_RepairReal_Succ","�޸���������ɹ���");
--			end
--		--ʧ����
--		else
--			gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, ZQ_REPAIRREAL_TIME_MAX, TASK_ACCESS_CODE_ZQBATTLE);
--		end
--		return 0;
--	end
	--ȫ���ҵ���
	if ZQ_RepairReal_RezultFind() == 1 then
		--IBģʽ֪��
		gf_SetTaskBit(ZQ_BATTLE_TASK6, 9, 0, TASK_ACCESS_CODE_ZQBATTLE);
		--��npcʧЧ
		gf_SetTaskBit(ZQ_BATTLE_TASK6, 16, 0, TASK_ACCESS_CODE_ZQBATTLE);
		--��������
		ZQ_RepairReal_Award(nTimes);
		if nTimes < ZQ_REPAIRREAL_COUNT_MAX then
			--������һ���׶�
			SetPos(1605, 3306);
			CastState("state_fetter", 100, 18*3);
			CastState("state_dispear",100, 18*3);
			gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, ZQ_SEAL_START_TIME * (nTimes + 1), TASK_ACCESS_CODE_ZQBATTLE);
			Msg2Player(format("T�m th�nh c�ng giai �o�n th� %d, ti�n v�o giai �o�n k� ti�p.", nTimes + 1));
		else
			--�������ߴ�����
			Talk(1,"ZQ_RepairReal_Succ","Tu s�a c�nh m�n tr�n linh th�nh c�ng!");
		end
	end
end

function ZQ_RepairReal_Succ()
	ZQ_RepairReal_Clean();
	ZQ_OutfromCopy();
	ZQ_Trigger_Clean();
	Msg2Player("C�c h� �� tu s�a c�nh m�n tr�n linh th�nh c�ng!");
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
	--������
	AwardGenuineQi(ZQ_REPAIRREAL_AWARD[nStep][1]);
	--������
	gf_Modify("Exp", ZQ_REPAIRREAL_AWARD[nStep][2]);
	--������
	gf_AddItemEx2({2, 1, 30497, ZQ_REPAIRREAL_AWARD[nStep][3]}, "Ma Tinh", ZQ_szLogTitle, "Tu s�a phong �n", 0, 1);
	--����������һ�����
	gf_SetTaskBit(ZQ_BATTLE_TASK2, 31, 0, TASK_ACCESS_CODE_ZQBATTLE);
end

function ZQ_RepairReal_GiveUp()
	ZQ_RepairReal_Clean();
	ZQ_OutfromCopy();
	ZQ_Trigger_Clean();
	Talk(1,"","C�c h� �� t� b� tu s�a tr�n linh!");
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
	--�����׽���
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 31) == 1 then
		Talk(1, "", "C�c h� �� tu s�a c�nh m�n tr�n linh th�t b�i!");
		ZQ_RepairReal_Award(getn(ZQ_REPAIRREAL_AWARD));
	end
end

function ZQ_EvilBet_Talk()
	if ZQ_CopyIsAble(1526) == 0 then
		return 0;
	end
	local strSay = "<color=green>Sinh M�n T� Linh: <color>Hehe, ng��i thanh ni�n mu�n ph�t t�i kh�ng? H�y ch�i tr� o�n t� t� v�i ta, n�u th�ng ta s� nh�n ���c ph�n th��ng h�p d�n, ��ng th�i n�u th�ng li�n t�c, m�i l�n ��u c� th� g�p ��i ph�n th��ng. ��ng s�, thua r�i c�ng kh�ng sao, ch� c�n b� m�ng l�i l� ���c r�i.";
	local nZhenqi, nExp, nCount = ZQ_EvilBet_CalAward();
	local strExt = "\n<color=green>C�c h� �� th�ng l�n th� %d, ph�n th��ng c�ng d�n l�: ch�n kh� %d, kinh nghi�m %d, Ma Tinh %d. <color>";
	local nSuccTimes = gf_GetTaskByte(ZQ_BATTLE_TASK8, 1);
	strExt = format(strExt, nSuccTimes, nZhenqi, nExp, nCount);
	--�Ѿ��ﵽ�µ�������
	--ֱ�ӷ���Ʊ
	if nSuccTimes == getn(ZQ_EVILBET_AWARD) - 1 then
		Say(format("C�c h� �� h� Sinh M�n T� Linh li�n t�c %d l�n, ��y l� ph�n th��ng d�nh x�ng ��ng c�a ng��i", nSuccTimes)..strExt, 1, "Nh�n ph�n th��ng r�i ch�y ngay/ZQ_EvilBet_GiveAward");
		return 0;
	end	
	local tSay = {
		format("Ra B�a/#ZQ_EvilBet_Jugde(1)"),
		format("Ra K�o/#ZQ_EvilBet_Jugde(2)"),
		format("Ra Bao/#ZQ_EvilBet_Jugde(3)"),	
	}
	tinsert(tSay, "\nKh�ng ch�i n�a, nh�n ph�n th��ng r�i ch�y th�i/ZQ_EvilBet_GiveAward");
	tinsert(tSay, "T�i h� ch� xem qua th�i/nothing");
	Say(strSay..strExt, getn(tSay), tSay);
end

function ZQ_EvilBet_Jugde(nValue)
	if ZQ_CopyIsAble(1526) == 0 then
		return 0;
	end
	local tListCmp = {
		--{����䣬���Ӯ}
		[1] = {3, 2},
		[2] = {1, 3},
		[3] = {1, 2},
	}
	local nSysValue = mod(random(1, 99), 3) + 1;
	if nSysValue == tonumber(nValue) then
		Talk(1,"ZQ_EvilBet_Talk","C�c h� �� h�a v�i Sinh M�n T� Linh!");
	elseif nSysValue == tListCmp[tonumber(nValue)][1] then
			Talk(1,"ZQ_EvilBet_IB","C�c h� �� <color=red>Thua<color> r�i!");
	elseif nSysValue == tListCmp[tonumber(nValue)][2] then 
		if gf_GetTaskByte(ZQ_BATTLE_TASK8, 1) < getn(ZQ_EVILBET_AWARD) - 1 then
			gf_SetTaskByte(ZQ_BATTLE_TASK8, 1, gf_GetTaskByte(ZQ_BATTLE_TASK8, 1) + 1, TASK_ACCESS_CODE_ZQBATTLE);
			Talk(1,"ZQ_EvilBet_Talk","C�c h� �� <color=green>Th�ng<color> r�i!");
		else
			ZQ_EvilBet_GiveAward();  --��ʵ�����ܵ�����
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
		format("\nTi�u hao %d Ma Th�ch, ch�ng ta ti�p t�c/#ZQ_EvilBet_IB_Ensure(%d)", nStep, nStep),
		"\nT� b�/ZQ_EvilBet_GiveUp",
	}
	local strExt = "\n<color=green>C�c h� �� th�ng l�n th� %d, ph�n th��ng c�ng d�n l�: ch�n kh� %d, kinh nghi�m %d, Ma Tinh %d. <color>";
	local nSuccTimes = gf_GetTaskByte(ZQ_BATTLE_TASK8, 1);
	strExt = format(strExt, nSuccTimes, nZhenqi, nExp, nCount);
	Say("<color=green>Sinh M�n T� Linh:<color> th� th�, h�y �� l�i m�ng s�ng c�a ng��i l�i ��y! Hahaha###."..strExt, getn(tSay), tSay);
end

function ZQ_EvilBet_IB_Ensure(nStep)
	if ZQ_CopyIsAble(1526) == 0 then
		return 0;
	end
	if DelItem(ZQ_ITEM_IB[1], ZQ_ITEM_IB[2], ZQ_ITEM_IB[3], nStep) == 1 then
		Msg2Player(format("C�c h� �� ti�u hao %d Ma Th�ch", nStep));
		ZQ_EvilBet_Talk();
	else
		Talk(1,"ZQ_EvilBet_GiveUp","Ng��i c� gan d�m l�a ta, �i ch�t �i!");
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
	--���׽���
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
	Talk(1,"","Haha, ��y l� ph�n th��ng c�a ng��i, c�m cho v�ng nh�. V�y m�ng c�a ng��i ta l�y �i nh�, 1 tay trao ti�n 1 tay nh�n h�ng, xong.");
	--�����׽���
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
	--����
	gf_SetTaskBit(ZQ_BATTLE_TASK2, 23, 0, TASK_ACCESS_CODE_ZQBATTLE);
	----------------------
	local nZhenqi, nExp, nCount = ZQ_EvilBet_CalAward();
	--������
	AwardGenuineQi(tonumber(nZhenqi));
	--������
	gf_Modify("Exp", tonumber(nExp));
	--������
	gf_AddItemEx2({2, 1, 30497, tonumber(nCount)}, "Ma Tinh", ZQ_szLogTitle, "T� Linh �� ��c", 0, 1);
	--�˳�---------
	Talk(1,"","Khi�u chi�n T� Linh �� ��c k� th�c!");
	ZQ_EvilBet_Clean();
	ZQ_OutfromCopy();
	ZQ_Trigger_Clean();
end

function ZQ_EvilBet_Clean()
	--������������׽���
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
	--����һ��
	RevivePlayer(1);
	NewWorld(ZQ_EXIT_POS[1], ZQ_EXIT_POS[2], ZQ_EXIT_POS[3]);
	ZQ_ResetPlayerState();
end

function ZQ_ReStartSeal_Talk()
	local nCurrentTimes = gf_GetTaskByte(ZQ_BATTLE_TASK8, 2);
	--�޸���������
	if nCurrentTimes >= ZQ_RESTARTSEAL_COUNT_MAX then
		ZQ_ReStartSeal_Exit(1);
		return 0;
	end
	local nTag = gf_GetTaskBit(ZQ_BATTLE_TASK8, 29);
	local tSay = {
		"Gi�i thi�u phong �n/ZQ_ReStartSeal_Intro",
		"\nT� b�/ZQ_ReStartSeal_Exit",
		"T�i h� ch� xem qua th�i/nothing",
	}
	if nTag == 0 then
		tinsert(tSay, 1, "H� tr� kh�i ��ng l�i phong �n/#ZQ_ReStartSeal_Assist(0)");
		if gf_GetTaskBit(ZQ_BATTLE_TASK8, 31) == 0 then
			tinsert(tSay, 2, "H� tr� kh�i ��ng l�i Phong �n (c�n ti�u hao 2 ma th�ch �� h� tr� th�m)/#ZQ_ReStartSeal_Assist(2)");
		end
	end
	local strSay = "T� M�n Phong �n r�t kh�ng �n ��nh, l�i c� phong �n x�y ra s� c� n�a r�i, c�c h� c� th� gi�p ta kh�i ��ng ch�ng l�i kh�ng? H�y c�n th�n nh�ng c� quan b�n tr�n phong �n, ch�ng kh� nguy hi�m ��y.";
	local nTableIndex = gf_GetTaskByte(ZQ_BATTLE_TASK8, 3);
	--��һ�γ�ʼ��
	if nCurrentTimes == 0 and nTableIndex == 0 and nTag == 0 then
		nTableIndex = random(1, 3);
		gf_SetTaskByte(ZQ_BATTLE_TASK8, 3, nTableIndex, TASK_ACCESS_CODE_ZQBATTLE);
	end
	--index�Ϸ���
	if nTableIndex <= 0 or nTableIndex > getn(ZQ_RESTART_REAL_NPC) then
		print("UDERROR:ZQ_ReStartSeal_Talk nTableIndex illegal");
		return 0;
	end
	local strCore = format("\n<color=green>Phong �n c�n kh�i ��ng l� [%s]<color>, nh�n ch�n d�ng ch�n nh�n ���c ��o c� kh�i ��ng <color=green>�T� Linh L�nh B�i�<color>", ZQ_RESTART_REAL_NPC[nTableIndex][1]);
	Say(ZQ_SMZL_NPC_NAME..strSay..strCore, getn(tSay), tSay);
end

function ZQ_ReStartSeal_Assist(nValue)
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 24) == 0 then
		return 0;
	end
	if tonumber(nValue) == 2 then
		if DelItem(ZQ_ITEM_IB[1], ZQ_ITEM_IB[2], ZQ_ITEM_IB[3], tonumber(nValue)) == 1 then
			CastState("state_life_max_percent_add", 1000, 15 * 60 * 18, 1, 20003, 1);
			SyncCustomState(1, 20003, 1, "Ph� h� c�a T� M�n Tr�n Linh");
			Talk(1, "", "C�c h� nh�n ���c<color=yellow>".."Ph� h� c�a T� M�n Tr�n Linh".."<color>hi�u qu�:  \n<color=green>".."�i�m sinh m�nh t�ng g�p 10 l�n".."<color>");
			gf_SetTaskBit(ZQ_BATTLE_TASK8, 31, 1, TASK_ACCESS_CODE_ZQBATTLE);
			RestoreAll();		
		else
			Talk(1, "ZQ_ReStartSeal_Talk", "Ma Th�ch trong h�nh trang kh�ng ��!");
			return 0;
		end
	end
	--������
	if GetItemCount(ZQ_RESTARTSEAL_ITEM[1], ZQ_RESTARTSEAL_ITEM[2], ZQ_RESTARTSEAL_ITEM[3]) < 1 then
		AddItem(ZQ_RESTARTSEAL_ITEM[1], ZQ_RESTARTSEAL_ITEM[2], ZQ_RESTARTSEAL_ITEM[3], 1);
		gf_SetTaskBit(ZQ_BATTLE_TASK8, 29, 1, TASK_ACCESS_CODE_ZQBATTLE);
	end
end

function ZQ_ReStartSeal_Intro()
	local ZQ_GtSay = {};
	ZQ_GtSay.msg = ZQ_SMZL_NPC_NAME.."T� M�n c� t�ng c�ng 8 phong �n (qu� v� c�a b�t qu�i), ��i tho�i v�i T� M�n Tr�n Linh, xu�t hi�n ng�u nhi�n 3 Phong �n Th�p c�n k�ch ho�t , ��ng th�i c�c h� nh�n ���c 3 l�nh b�i. Khi k�ch ho�t phong �n s� xu�t hi�n thanh ti�n ��, trong kho�n th�i gian k�ch ho�t nh�n v�t r�i kh�i ph�m vi phong �n th� thanh ti�n �� s� bi�n m�t, k�ch ho�t th�t b�i. \nL�n c�n m�i phong �n ��u c� c� quan c�m b�y, khi nh�n v�t ch�m ph�i s� b� t�n c�ng, b� t�n c�ng t� vong xem nh� kh�i ��ng phong �n th�t b�i. \nNg��i ch�i c� th� d�ng 2 Ma Th�ch s� nh�n ���c hi�u qu� t�ng tr��ng �i�m sinh m�nh 1000%, sinh m�nh v� n�i l�c ho�n to�n h�i ph�c, r�i kh�i c�a �i ho�c ho�n th�nh k�ch ho�t s� bi�n m�t.";
	ZQ_GtSay.sel = {
		{"\n Ph�n h�i","ZQ_ReStartSeal_Talk"},
	}
	temp_Talk(ZQ_GtSay);
end

function ZQ_ReStartSeal_Fail()
	--ZQ_OutfromCopy();
	--ZQ_ReStartSeal_Clean();
	--ZQ_Trigger_Clean();
	Talk(1,"","Kh�i ��ng phong �n th�t b�i!");
end

function ZQ_ReStartSeal_Exit(bTag)
	if bTag and bTag == 1 then
		Talk(1,"","Khi�u chi�n th�nh c�ng, c�c h� �� kh�i ��ng th�nh c�ng 3 phong �n!")
	elseif gf_GetTaskByte(ZQ_BATTLE_TASK8, 2) == 0 and gf_GetTaskBit(ZQ_BATTLE_TASK2, 24) == 1 then
		ZQ_ReStartSeal_Award(getn(ZQ_RESTARTSEAL_AWARD));
		Talk(1,"","Kh�i ��ng phong �n th�t b�i, T� M�n s�p th�t th� r�i. ��y l� ph�n th��ng c�a ng��i, �a t�.")
	elseif gf_GetTaskBit(ZQ_BATTLE_TASK2, 24) == 1 then
		Talk(1,"","C�c h� �� t� b� kh�i ��ng phong �n!")
	elseif gf_GetTaskByte(ZQ_BATTLE_TASK8, 2) > 0 and gf_GetTaskBit(ZQ_BATTLE_TASK2, 24) == 0 then
		Talk(1,"","C�c h� �� t� b� kh�i ��ng phong �n!")
	end
	ZQ_Trigger_Clean();
	ZQ_ReStartSeal_Clean();
	ZQ_OutfromCopy();
end

function ZQ_ReStartSeal_Award(nIndex)
	if nIndex < 1 or nIndex > getn(ZQ_RESTARTSEAL_AWARD) then
		return 0;
	end
	--������
	AwardGenuineQi(ZQ_RESTARTSEAL_AWARD[nIndex][1]);
	--������
	gf_Modify("Exp", ZQ_RESTARTSEAL_AWARD[nIndex][2]);
	--������
	gf_AddItemEx2({2, 1, 30497, ZQ_RESTARTSEAL_AWARD[nIndex][3]}, "Ma Tinh", ZQ_szLogTitle, "Kh�i ��ng Tr�n Linh", 0, 1);
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
	--���ħ������
	RemoveState(20003);
	gf_SetTaskBit(ZQ_BATTLE_TASK8, 31, 0, TASK_ACCESS_CODE_ZQBATTLE);
	--ɾ������
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
			Talk(1,"","Kh�ng c� T� Linh L�nh �� kh�i ��ng phong �n");
			return 0;
		end
	end
	local nTableIndex = gf_GetTaskByte(ZQ_BATTLE_TASK8, 3);
	if nTableIndex <= 0 or nTableIndex > getn(ZQ_RESTART_REAL_NPC) then
		return 0;
	end
	if GetNpcName(GetTargetNpc()) ~= ZQ_RESTART_REAL_NPC[nTableIndex][1] then
		Msg2Player(format("M�c ti�u phong �n hi�n t�i kh�ng ch�nh x�c! M�c ti�u ch�nh l� [%s]", ZQ_RESTART_REAL_NPC[nTableIndex][1]));
		return 0;
	end
	local nMapId, nX, nY = GetWorldPos();
	local nXcmp = ZQ_RESTART_REAL_NPC[nTableIndex][3];
	local nYcmp = ZQ_RESTART_REAL_NPC[nTableIndex][4];
	local nDis = (nX - nXcmp)^2 + (nY - nYcmp)^2;
	--�����˾���
	if nDis > ZQ_RESTARTSEAL_DIS_MAX then
		Msg2Player("C�ch m�c ti�u phong �n qu� xa, h�y ti�n l�i g�n h�n!");
		return 0;
	end
	Msg2Player("B�t ��u k�ch ho�t phong �n!")
	--����ʵʱ�жϴ�����
	local nTrigger = GetTrigger(1529 * 2);
	if nTrigger ~= 0 then
		RemoveTrigger(nTrigger);
		ProgressSlotCancle();
	end
	nTrigger = CreateTrigger(1, 1529, 1529 * 2);
	if nTrigger ~= 0 then
		--������ɺ�ص�OnProgressCallback
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
		--��־��ԭ
		gf_SetTaskBit(ZQ_BATTLE_TASK8, 30, 0, TASK_ACCESS_CODE_ZQBATTLE);
		Msg2Player("C�ch m�c ti�u phong �n qu� xa, kh�i ��ng th�t b�i!")
	end
end

function ZQ_ReStartSeal_JugdeDistance()
	local nTableIndex = gf_GetTaskByte(ZQ_BATTLE_TASK8, 3);
	if nTableIndex <= 0 or nTableIndex > getn(ZQ_RESTART_REAL_NPC) then
		return 0;
	end
	if GetNpcName(GetTargetNpc()) ~= ZQ_RESTART_REAL_NPC[nTableIndex][1] then
		Msg2Player(format("M�c ti�u phong �n hi�n t�i kh�ng ch�nh x�c! M�c ti�u ch�nh l� [%s]", ZQ_RESTART_REAL_NPC[nTableIndex][1]));
		return 0;
	end
	local nMapId, nX, nY = GetWorldPos();
	local nXcmp = ZQ_RESTART_REAL_NPC[nTableIndex][3];
	local nYcmp = ZQ_RESTART_REAL_NPC[nTableIndex][4];
	local nDis = (nX - nXcmp)^2 + (nY - nYcmp)^2;
	--�����˾���
	if nDis > ZQ_RESTARTSEAL_DIS_MAX then
		return 0;
	else
		return 1;
	end
end

--������ӡ�Ķ����ص�����
function OnProgressCallback()
	--�Ƴ����������
	local nTrigger = GetTrigger(1529 * 2);
	if nTrigger ~= 0 then
		RemoveTrigger(nTrigger);
	end
	--��־��ԭ
	gf_SetTaskBit(ZQ_BATTLE_TASK8, 30, 0, TASK_ACCESS_CODE_ZQBATTLE);
	if ZQ_IsAllowMap() ~= 1 then
		return 0;
	end
	local nRet = ZQ_ReStartSeal_JugdeDistance();
	if nRet == 0 then
		--ʧ��
		ZQ_ReStartSeal_Fail();
	elseif nRet == 1 then
		--�ɹ�
		ZQ_ReStartSeal_Succ();
	end
end

function ZQ_ReStartSeal_Succ()
	local nCount = gf_GetTaskByte(ZQ_BATTLE_TASK8, 2);
	--��������
	ZQ_ReStartSeal_Award(nCount + 1);
	--����+1
	gf_SetTaskByte(ZQ_BATTLE_TASK8, 2, nCount + 1, TASK_ACCESS_CODE_ZQBATTLE);
	--�����µ�Ŀ��
	if nCount == 0 then
		gf_SetTaskByte(ZQ_BATTLE_TASK8, 3, random(4,6), TASK_ACCESS_CODE_ZQBATTLE);
	elseif nCount == 1 then
		gf_SetTaskByte(ZQ_BATTLE_TASK8, 3, random(7,8), TASK_ACCESS_CODE_ZQBATTLE);
	else
--		print("nCount =",nCount);
	end
	--ħ������
	RemoveState(20003);
	gf_SetTaskBit(ZQ_BATTLE_TASK8, 31, 0, TASK_ACCESS_CODE_ZQBATTLE);
	--DelItem
	DelItem(ZQ_RESTARTSEAL_ITEM[1], ZQ_RESTARTSEAL_ITEM[2], ZQ_RESTARTSEAL_ITEM[3], GetItemCount(ZQ_RESTARTSEAL_ITEM[1], ZQ_RESTARTSEAL_ITEM[2], ZQ_RESTARTSEAL_ITEM[3]));
	--�����0
	gf_SetTaskBit(ZQ_BATTLE_TASK8, 29, 0, TASK_ACCESS_CODE_ZQBATTLE);
	--��һ��
	Talk(1, "ZQ_ReStartSeal_Talk", format("Kh�i ��ng phong �n l�n th� %d, <color=green>nh�n ���c %d �i�m ch�n kh�, %d �i�m kinh nghi�m, %d Ma Tinh<color>", nCount + 1, ZQ_RESTARTSEAL_AWARD[nCount + 1][1], ZQ_RESTARTSEAL_AWARD[nCount + 1][2], ZQ_RESTARTSEAL_AWARD[nCount + 1][3]));
end

--��¼NPC������
--ZQ_tMapNpcIndex = {};

function ZQ_ProtectSeal_Talk()	
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 30) == 0 then
		return 0;
	end
	local tSay = {
		"Gi�i thi�u Th� V� Phong �n/ZQ_ProtectSeal_Intro",
		"\nTi�u di�t ��n ��y v�y/ZQ_ProtectSeal_Exit",
		"T�i h� ch� xem qua th�i/nothing",
	}
	if GetTrigger(1524 * 2) == 0 and GetTrigger(1293 * 2) == 0 then
		tinsert(tSay, 1, "H� tr� gi�t ��ch/#ZQ_ProtectSeal_Start(0)");
		tinsert(tSay, 2, "H� tr� ti�u di�t ��ch (c�n ti�u hao 2 ma th�ch �� h� tr� th�m)/#ZQ_ProtectSeal_Start(2)");
	end
	local sString = format("Phong �n  t�i Di�t M�n c� v� l�c l�, Ma kh� �� mang ��n m�t l��ng l�n qu�i v�t, n�u c� ti�p t�c nh� th�, phong �n s� b� ph� v�. Th�i gian kh�ng c�n nhi�u, c�c h� ch� c� <color=red>%d ph�t<color> �� th�c hi�n, ti�u di�t �t nh�t <color=red>%d t�n<color> qu�i v�t, ti�u di�t c�ng nhi�u, ph�n th��ng c�a ta c�ng t�t.", ZQ_PROTECTSEAL_TIME_TOTLE/60, ZQ_PROTECTSEAL_KILL_MIN);
	local nCount = gf_GetTaskByte(ZQ_BATTLE_TASK6, 1);
	if nCount > 0 then
	  sString = sString..format("S� l��ng qu�i ti�u di�t hi�n t�i: <color=green>%d<color>", nCount);
	end
	Say(ZQ_MMZL_NPC_NAME..sString, getn(tSay), tSay);
end

function ZQ_ProtectSeal_Start(nNum)
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 30) == 0 then
		return 0;
	end
	--��Ϊս��״̬
	SetFightState(1);
	--�Ƿ���IBģʽ
	if nNum and tonumber(nNum) == 2 then
		if DelItem(ZQ_ITEM_IB[1], ZQ_ITEM_IB[2], ZQ_ITEM_IB[3], nNum) ~= 1 then
			Talk(1,"ZQ_ProtectSeal_Talk","S� l��ng Ma Th�ch trong h�nh trang kh�ng ��");
			return 0;
		end
		--�ָ�Ѫ��
		RestoreAll();
		--��ħ������
		CastState("state_p_attack_percent_add", 300, 10 * 60 * 18, 1, 20001, 1);
		CastState("state_m_attack_percent_add", 300, 10 * 60 * 18, 1, 20002, 1);
		SyncCustomState(1, 20001, 1, "Ph� h� c�a Tr�n Linh Di�t M�n");
		Talk(1, "", "C�c h� nh�n ���c<color=yellow>".."Ph� h� c�a Tr�n Linh Di�t M�n".."<color>hi�u qu�:  \n<color=green>".."N�i ngo�i c�ng t�ng 3 l�n".."<color>");
	end
	--������ʱ��
	local nTrigger = CreateTrigger(1, 1524, 1524 * 2);
	if nTrigger == 0 then
		ZQ_ProtectSeal_Exit();
		return 0;
	end
	ContinueTimer(nTrigger);
	--����ɱ�ּ�����
	nTrigger = CreateTrigger(0, 1293, 1293 * 2);
	if nTrigger == 0 then
		ZQ_ProtectSeal_Exit();
		return 0;
	end
	--���ּ�������һ��
	gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 1, 2, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskByte(ZQ_BATTLE_TASK6, 1, 0, TASK_ACCESS_CODE_ZQBATTLE);
	
	Talk(1,"",format("Khi�u chi�n b�t ��u! C�c h� ch� c� %d ph�t �� th�c hi�n, ti�u di�t �t nh�t %d qu�i, m�i c� th� nh�n ���c ph�n th��ng: qu�i ti�u di�t c�ng nhi�u, ph�n th��ng c�ng cao.", 5, 10));
end

function ZQ_ProtectSeal_Intro()
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 30) == 0 then
		return 0;
	end
	local tSay = {
		"\n Ph�n h�i/ZQ_ProtectSeal_Talk",	
	}
	Say(ZQ_MMZL_NPC_NAME.."Ma kh� t� Di�t M�n mang l�i r�t nhi�u qu�i v�t, ti�u di�t nh�ng qu�i v�t n�y, Th� V� Phong �n. \nNg��i ch�i c� th� d�ng 2 Ma Th�ch �� n�ng cao 300% l�c t�n c�ng, h�i ph�c to�n b� sinh l�c n�i l�c, BUFF s� bi�n m�t sau khi th�i gian k�t th�c, nh�n ph�n th��ng ho�c khi tr�ng th��ng. \n��c t�nh c�a qu�i v�t: <color=red>N�i ph�ng cao, ngo�i ph�ng th�p, c�ng k�ch ngo�i c�ng<color>", getn(tSay), tSay);
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
	--������
	AwardGenuineQi(ZQ_PROTECTSEAL_AWARD[nIndex][2]);
	--������
	gf_Modify("Exp", ZQ_PROTECTSEAL_AWARD[nIndex][3]);
	--������
	gf_AddItemEx2({2, 1, 30497, ZQ_PROTECTSEAL_AWARD[nIndex][4]}, "Ma Tinh", ZQ_szLogTitle, "Th� V� Tr�n Linh", 0, 1);
	--�����ٸ�������
	gf_SetTaskBit(ZQ_BATTLE_TASK2, 30, 0, TASK_ACCESS_CODE_ZQBATTLE);
end

function ZQ_ProtectSeal_Succ()
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 30) == 0 then
		return 0;
	end
	local nCount = gf_GetTaskByte(ZQ_BATTLE_TASK6, 1);
	Talk(1,"ZQ_ProtectSeal_Exit",format("Ch�c m�ng �� th�nh c�ng ti�u di�t<color=green>%d<color> t�n", nCount));
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
	Talk(1,"","C�c h� �� r�i kh�i Th� V� Phong �n!");
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
	Msg2Player("B�o v� phong �n th�t b�i!");
end

function ZQ_ProtectSeal_Clean()
	--ʱ�䴥����
	if GetTrigger(1524 * 2) ~= 0 then
		RemoveTrigger(GetTrigger(1524 * 2));
	end
	--ɱ�ִ�����
	if GetTrigger(1293 * 2) ~= 0 then
		RemoveTrigger(GetTrigger(1293 * 2));
	end		
	--����ħ������
	RemoveState(20001);
	RemoveState(20002);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 1, 2, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskByte(ZQ_BATTLE_TASK6, 1, 0, TASK_ACCESS_CODE_ZQBATTLE);
	--������������׽���
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 30) == 1 then
		Talk(1,"ZQ_ProtectSeal_Award","B�o v� tr�n linh th�t b�i!");
		return 0;
	end
end

function ZQ_ProtectSeal_OnTimer()
	local nTimes = gf_GetMyTaskByte(ZQ_BATTLE_TASK9, 1, 2);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 1, 2, nTimes + 1, TASK_ACCESS_CODE_ZQBATTLE);
	--�������
	if nTimes == ZQ_PLAYER_DEATH_TAG then
		--ɱ�ִ�����
		if GetTrigger(1293 * 2) ~= 0 then
			RemoveTrigger(GetTrigger(1293 * 2));
		end	
		ZQ_ProtectSeal_Fail();
		return 0;
	end
	if mod(nTimes, 60) == 0 then
		Msg2Player(format("Th�i gian c�n l�i: %ds, s� l��ng ti�u di�t ��ch: %d.", ZQ_PROTECTSEAL_TIME_TOTLE - nTimes, gf_GetTaskByte(ZQ_BATTLE_TASK6, 1)));
	end
	--��ʱ����
	if nTimes >= ZQ_PROTECTSEAL_TIME_TOTLE or nTimes + 1 >= 65535 then
		--ʱ�䴥����
		if GetTrigger(1524 * 2) ~= 0 then
			RemoveTrigger(GetTrigger(1524 * 2));
		end
		--ɱ�ִ�����
		if GetTrigger(1293 * 2) ~= 0 then
			RemoveTrigger(GetTrigger(1293 * 2));
		end	
		--������
		ZQ_ProtectSeal_Succ();
		return 0;
	end
	if nTimes == 0 then 
		SetPos(1905, 3535);
	end
end

function ZQ_ProtectSeal_Killer()
	--Ŀ��NPC�������	
	local nCount = gf_GetTaskByte(ZQ_BATTLE_TASK6, 1);
	--������
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
			Talk(1,"ZQ_RepairReal_Fail","�� h�t th�i gian c�a �i")
		end
		return 0;
	end
	--��ʾ�ұ���Ϣ
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
	FloatMsg2Player(format("Th�i gian v��t �i: %ds\n truy t�m v�t ph�m:%s\n th�i gian c�n l�i:%ds", ZQ_COPY_TIME_MAX - nCount, nGoalName, nSurplusTime));
	gf_SetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2, nCount + 1, TASK_ACCESS_CODE_ZQBATTLE);
end

function OnTimer2()
	local nCount = gf_GetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2);
	if nCount >= ZQ_COPY_TIME_MAX then
		RemoveTrigger(GetTrigger(1526 * 2));
		if gf_GetTaskByte(ZQ_BATTLE_TASK8, 1) < getn(ZQ_EVILBET_AWARD) - 1 then
			Talk(1,"ZQ_EvilBet_GiveUp","�� h�t th�i gian c�a �i")
		end
		return 0;
	end
	FloatMsg2Player(format("Th�i gian v��t �i: %ds\n s� l�n t�ch l�y: %d l�n", ZQ_COPY_TIME_MAX - nCount, gf_GetTaskByte(ZQ_BATTLE_TASK8, 1)));
	gf_SetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2, nCount + 1, TASK_ACCESS_CODE_ZQBATTLE);
end

function OnTimer3()
	local nCount = gf_GetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2);
	if nCount >= ZQ_COPY_TIME_MAX then
		RemoveTrigger(GetTrigger(1527 * 2));
		if gf_GetTaskByte(ZQ_BATTLE_TASK8, 2) < ZQ_RESTARTSEAL_COUNT_MAX then
			Talk(1,"ZQ_ReStartSeal_Exit","�� h�t th�i gian c�a �i")
		end
		return 0;
	end
	local sGoalName = ""
	local nTableIndex = gf_GetTaskByte(ZQ_BATTLE_TASK8, 3);
	if nTableIndex > 0 and nTableIndex <= getn(ZQ_RESTART_REAL_NPC) then
		sGoalName = ZQ_RESTART_REAL_NPC[nTableIndex][1];
	end
	FloatMsg2Player(format("Th�i gian v��t �i: %ds\n m�c ti�u kh�i ��ng: %s", ZQ_COPY_TIME_MAX - nCount, sGoalName));
	gf_SetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2, nCount + 1, TASK_ACCESS_CODE_ZQBATTLE);
end

function OnTimer4()
	local nCount = gf_GetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2);
	if nCount >= ZQ_COPY_TIME_MAX then
		RemoveTrigger(GetTrigger(1528 * 2));
		Talk(1,"ZQ_ProtectSeal_Fail","�� h�t th�i gian c�a �i")
		return 0;
	end
	FloatMsg2Player(format("Th�i gian v��t �i: %ds\n s� l��ng qu�i di�t: %d\n th�i gian c�n l�i:%ds", ZQ_COPY_TIME_MAX - nCount, gf_GetTaskByte(ZQ_BATTLE_TASK6, 1), ZQ_PROTECTSEAL_TIME_TOTLE - gf_GetMyTaskByte(ZQ_BATTLE_TASK9, 1, 2)));
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
