Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\missionfunctions.lua");
Include("\\script\\online_activites\\task_values.lua");

CR_TEMPLATE = "Giang h� h�o ki�t";
CR_NAME = "Xa phu ��u tr��ng tuy�t";

SB_ACTIVITY_ID = 23;
SB_COST = 80000;
SB_MIN_LEVEL = 77;
SB_MAX_EXP = 10000000;
SB_TASK_KEY_ENTRANCE_MAP_INDEX = VET_201012_05_TASK_ENTRANCE_MAP_INDEX;
SB_TASK_KEY_EXP_GAINED = VET_201012_05_TASK_EXP_GAINED;
SB_MISSION_ID = 52;
SB_MISSION_TIMER_ID = 81;
SB_WAVE_TIMER_ID = 83;
SB_TIMER_INTERVAL = 30 * 18;
SB_MISSION_TIMER_COUNT = 60 * 60 * 18 / SB_TIMER_INTERVAL - 1;
SB_WAVE_TIMER_COUNT = 60 * 5 * 18 / SB_TIMER_INTERVAL - 1;
SB_CAMP_ID = 1;
SB_MAX_PLAYER = 150;
SB_MAP_TASK_KEY_STATE = 1;
SB_MAP_TASK_KEY_CURRENT_MONSTER_WAVE = 2;
SB_MAP_TASK_KEY_DIALOG_BOSS_INDEX = 3;
SB_MAP_TASK_KEY_ATTACK_BOSS_INDEX = 4;
SB_MAP_TASK_KEY_MONSTER_KILLED_CUR_WAVE = 5;
SB_MAP_TASK_KEY_MISSION_TIMER_LOOP = 6;
SB_MAP_TASK_KEY_WAVE_TIMER_LOOP = 7;
SB_MAP_TASK_KEY_WAVE_TIMEOUT = 8;
SB_GROUP_MOB = 11;

SB_MONSTER_WAVE_THRESHOLD = 10;
SB_MAX_TIME = 60 * 60 * 18;
SB_MAX_NPC = 180

SB_MonsterSpawnPointList = 
{
	{1733, 3385},
	{1762, 3385},
	{1791, 3385},
	{1733, 3423},
	{1733, 3461},
	{1762, 3461},
	{1791, 3461},
	{1791, 3423},
	{1752, 3423},
	{1772, 3423}
};

SB_BossSpawnPoint = 
{
	1762, 
	3423
}

SB_CarterSpawnPointList = 
{
	{1665, 3652},
	{1665, 3224},
	{1857, 3226},
	{1856, 3652},
}

SB_DIALOG_BOSS_TEMPLATE = "BOSS tuy�t y�u ��i tho�i";
SB_DIALOG_BOSS_NAME = "Thi�n S�n Tuy�t Y�u (��i tho�i)";
SB_ATTACK_BOSS_TEMPLATE = "BOSS tuy�t y�u chi�n ��u";
SB_ATTACK_BOSS_NAME = "Thi�n S�n Tuy�t Y�u (boss)";
SB_MONSTER1_TEMPLATE = "Tuy�t qu�i 1";
SB_MONSTER1_NAME = "Ti�u Tuy�t Qu�i";
SB_MONSTER1_COUNT = 14;
SB_MONSTER2_TEMPLATE = "Tuy�t qu�i 3";
SB_MONSTER2_NAME = "��i Tuy�t Qu�i";
SB_MONSTER2_COUNT = 4;
SB_MONSTER_COUNT_PER_WAVE = getn(SB_MonsterSpawnPointList) * (SB_MONSTER1_COUNT+SB_MONSTER2_COUNT)

SB_ExitSpawnPoint = {
	{100, 1365, 2932},	--Ȫ��
	{200, 1409, 3048},	--�꾩
	{300, 1820, 3573},	--�ɶ�
};

SB_MapList = 
{
	963,
	962,
	961
}

SB_MapMap = 
{
	[100] = SB_MapList[1],
	[200] = SB_MapList[2],
	[300] = SB_MapList[3]
};

SB_SkillList = 
{
	30001,
	30002,
	30003,
	30004,
	30005,
	30006,
	30007,
	30008,
	30009
};

SB_PlayerSpawnPointList = 
{
	{1859,3230},
	{1664,3654},
	{1664,3229},
	{1854,3654}
};


function SB_HandleExp(exp)
	local expGained = GetTask(SB_TASK_KEY_EXP_GAINED);
	if expGained < SB_MAX_EXP then
		local realExp = exp;
		if exp + expGained > SB_MAX_EXP then
			realExp = SB_MAX_EXP - expGained;
		end
		ModifyExp(exp);
		SetTask(SB_TASK_KEY_EXP_GAINED, GetTask(SB_TASK_KEY_EXP_GAINED) + realExp);
	else
		Msg2Player("S� l��ng qu�i ti�u di�t qu�i nh� trong tr�n n�y �� ��t gi�i h�n, kh�ng th� nh�n th�m �i�m kinh nghi�m khi ti�u di�t qu�i nh�");
		Talk(1, "", "��i hi�p �� nh�n �� "..SB_MAX_EXP.." �i�m kinh nghi�m khi ��nh qu�i!")
	end
end

function SB_IsInSnowMap()
	local mapID = GetWorldPos()
	local result = 0;
	for i=1, getn(SB_MapList) do
		if mapID == SB_MapList[i] then
			result = 1;
			break;
		end
	end
	return result;
end

function SB_GetMonsterWave(mapID)
	return mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_CURRENT_MONSTER_WAVE, mapID);
end

function SB_IsMonsterWaveKilled(mapID)
	local killedCount = mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_MONSTER_KILLED_CUR_WAVE, mapID);
	if killedCount >= SB_MONSTER_COUNT_PER_WAVE then
		return 1;
	else
		return 0;
	end
end

function SB_IsMonsterWaveTimeout(mapID)
	if 1 == mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_WAVE_TIMEOUT, mapID) then
		return 1;
	else
		return 0;
	end
end

function SB_LearnSkill()
	for i=1, getn(SB_SkillList) do
		--WriteLog("SB_LearnSkill::skillID: "..SB_SkillList[i])
		LearnSkill(SB_SkillList[i]);
	end
end

function SB_SetState()
	KillFollower()
	local nDate = tonumber(date("%y%m%d"))
	local nHour = tonumber(date("%H"))
	local nSession = 1
	if nHour == 17 or nHour == 18 then
		nSession = 2
	end
	if nDate ~= floor(GetTask(SB_TASK_KEY_ENTRANCE_MAP_INDEX) / 100) or nSession ~= mod(GetTask(SB_TASK_KEY_ENTRANCE_MAP_INDEX), 100) then
		SetTask(SB_TASK_KEY_ENTRANCE_MAP_INDEX, (nDate * 100) + nSession)
		SetTask(SB_TASK_KEY_EXP_GAINED, 0)		
	end
	
	BlockSkill(1)
	StallEnable(0);
	SetPKFlag(1,1);
	ForbidChangePK(1);
	ForbitTrade(1);
	LeaveTeam();
	ForbidRead(1); -- ���߻����
	SetCreateTeam(1);
	RemvoeTempEffect();
	CleanInteractive();
end

function SB_ResetState()
	--WriteLog("SB_ResetState::GetName(): "..GetName());
	BigDelItem(2, 3, 221, BigGetItemCount(2, 3, 221))
	BigDelItem(2, 3, 220, BigGetItemCount(2, 3, 220))
	BigDelItem(2, 3, 219, BigGetItemCount(2, 3, 219))
	
	UnBlockSkill(1)
	ForbidChangePK(0);		
	SetFightState(0);		
	SetPKFlag(0, 0);
	StallEnable(1);
	ForbitTrade(0);
	ForbidRead(0);
	SetCreateTeam(0);
	InteractiveEnable(1);
	for i=1, getn(SB_SkillList) do
		--WriteLog("SB_ResetState::skillID: "..SB_SkillList[i]);
		if 1 == HaveLearnedSkill(SB_SkillList[i]) then
			RemoveSkill(SB_SkillList[i])
		end;
	end
end

function SB_CheckEquipment()
	local result = 1;
--	for i=0, 12 do
--		if 1 ~= i and 3 ~=i and 10 ~= i and 11 ~= i then
			local genre, detail, particular = GetPlayerEquipInfo(2);
			if genre ~= 0 or detail ~= 0 or particular ~= 0 then
				result = 0;
			end
			
			genre, detail, particular = GetPlayerEquipInfo(9);
			if genre ~= 0 or detail ~= 0 or particular ~= 0 then
				result = 0;
			end
			
			genre, detail, particular = GetPlayerEquipInfo(11);
			if genre ~= 0 or detail ~= 0 or particular ~= 0 then
				result = 0;
			end
--		end;
--	end;
	return result;
end

function SB_CheckPlayerCount(mapID)
	local playerCount = mf_GetPlayerCount(SB_MISSION_ID, SB_CAMP_ID, mapID);
	if SB_MAX_PLAYER <= playerCount then
		return 0
	else
		return 1
	end
end

function SB_CheckState(mapID)
	--WriteLog("SB_CheckState::mapID: "..mapID);
	if 1 == mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_STATE, mapID) then
		return 1;
	else
		return 0;
	end
end

function SB_LockEquipment(lock)
	local equipPositions = {0,1,2,3,4,5,6,7,8,9,10,11};
	for i=1,getn(equipPositions) do
		ForbidEquipSolt(equipPositions[i], lock);
	end;
end;

function SB_OnEntered()
	SB_LearnSkill();
	SB_LockEquipment(1);
	gf_WriteLogEx("Hoat dong thang 12 n�m 2010", "B�o danh tham gia ��nh tuy�t");
end

function SB_Join()
	local mapID = GetWorldPos();
     mapID = SB_MapMap[mapID];
--	if 1 == Pay(SB_COST) then
		SB_SetState();
		local spawnPoint = SB_PlayerSpawnPointList[random(1, getn(SB_PlayerSpawnPointList))];
		if 1 == NewWorld(mapID, spawnPoint[1], spawnPoint[2]) then
			AddMSPlayer(SB_MISSION_ID, SB_CAMP_ID);
			--WriteLog("SB_Enter::GetMSPlayerCount("..SB_MISSION_ID..", "..SB_CAMP_ID.."): "..GetMSPlayerCount(SB_MISSION_ID, SB_CAMP_ID));
			--SetTask(SB_TASK_KEY_ENTRANCE_MAP_INDEX, mapID-960);
			SetTempRevPos(mapID, spawnPoint[1]*32, spawnPoint[2]*32);
			SetDeathScript("\\script\\online_activites\\2010_12\\activity_05\\player_death.lua");
			SB_OnEntered();
		end
--	end
end

function SB_Leave()
--	local entranceMapIndex = GetTask(SB_TASK_KEY_ENTRANCE_MAP_INDEX);
--	if 0 == entranceMapIndex then
--		entranceMapIndex = 3;
--	end
--	local exitSpawnPoint = SB_ExitSpawnPoint[entranceMapIndex];
	if 1 == NewWorld(300, 1820, 3573) then
		SB_ResetState();
		SB_LockEquipment(0);
	end
end

function SB_Announce()
	AddGlobalNews("Thi�n S�n Tuy�t Y�u d�n theo ti�u qu�i �� xu�t hi�n t�i ��u Tr��ng Tuy�t ��i n�o linh ��nh, c�c v� anh h�ng hao ki�t h�y nhanh ch�ng ��n t�m Xa Phu ��u Tr��ng Tuy�t t�i Th�nh �� �� chuy�n v�o ��u tr��ng tuy�t thu ph�c b�n ch�ng");	
end

function SB_OnPlayerLogin()
	SB_ResetState();
end

function main()
	if gf_CheckEventDateEx(SB_ACTIVITY_ID) == 1 then
		SB_Start();
	end
end

function SB_Start()
	for i=1, getn(SB_MapList) do
		mf_OpenMission(SB_MISSION_ID, SB_MapList[i]);
	end;
	SB_Announce();
end

function SB_OnMissionTimer()
	--WriteLog("SB_OnTimer::SB_MAP_TASK_KEY_MISSION_TIMER_LOOP: "..SB_MAP_TASK_KEY_MISSION_TIMER_LOOP);
	local mapID = SubWorldIdx2ID(SubWorld);
	local loopCount = mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_MISSION_TIMER_LOOP, mapID);
	--WriteLog("SB_OnTimer::loopCount: "..loopCount);
	if 0 == loopCount then
		CloseMission(SB_MISSION_ID);
	else
		mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_MISSION_TIMER_LOOP, loopCount-1, mapID);
	end
end

function SB_OnWaveTimer()
	local mapID = SubWorldIdx2ID(SubWorld);
	local loopCount = mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_WAVE_TIMER_LOOP, mapID);
	--WriteLog("SB_OnWaveTimer::loopCount: "..loopCount);	
	if 0 == loopCount then
		--WriteLog("SB_OnWaveTimer::timeout");
		mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_WAVE_TIMEOUT, 1, mapID);
	else
		mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_WAVE_TIMER_LOOP, loopCount-1, mapID);
	end
end

function SB_SpawnMonsters(mapID, x, y, monsterTemplate, monsterName, deathScript, monsterCount)
	--WriteLog("SB_SpawnMonsters::mapID: "..mapID);
	--WriteLog("SB_SpawnMonsters:: x: "..x..", y: "..y..", monsterTemplate: "..monsterTemplate..", monsterName: "..monsterName..", deathScript: "..deathScript);
	--WriteLog("SB_SpawnMonsters::monsterCount: "..monsterCount);
	for j=1, monsterCount do
		if CountGroupUnit(SB_GROUP_MOB) < SB_MAX_NPC then	
			local deltaX = random(-5, 5);
			local deltaY = random(-5, 5);
			local npcIndex = CreateNpc(monsterTemplate, monsterName, mapID, x+deltaX, y+deltaY); 
			if deathScript ~= "" then
				SetNpcDeathScript(npcIndex, deathScript);
			end
			AddGroupUnit(SB_GROUP_MOB, npcIndex)
		else
			Talk(1, "", "S� qu�i v�t �� qu� ��ng v� hung h�n, h�y ti�u di�t h�t ch�ng!")
			break
		end
	end	
end

function SB_SpawnWaveMonsters(mapID)
	--WriteLog("SB_SpawnWaveMonsters::mapID: "..mapID);
--	local npcIndices = GetMapNpcIdx(SubWorldIdx2ID(SubWorld));
--	for i=1, getn(npcIndices) do
--		local npcName = GetNpcName(npcIndices[i]);
--		if npcName == SB_MONSTER1_NAME or npcName == SB_MONSTER2_NAME then
--			SetNpcLifeTime(npcIndices[i], 0);
--		end
--	end	

	for i=1, getn(SB_MonsterSpawnPointList) do
		SB_SpawnMonsters(mapID, SB_MonsterSpawnPointList[i][1], SB_MonsterSpawnPointList[i][2], SB_MONSTER1_TEMPLATE, SB_MONSTER1_NAME, "\\script\\online_activites\\2010_12\\activity_05\\npc\\monster1_death.lua", SB_MONSTER1_COUNT);
		SB_SpawnMonsters(mapID, SB_MonsterSpawnPointList[i][1], SB_MonsterSpawnPointList[i][2], SB_MONSTER2_TEMPLATE, SB_MONSTER2_NAME, "\\script\\online_activites\\2010_12\\activity_05\\npc\\monster2_death.lua", SB_MONSTER2_COUNT);
	end
	local monsterWave = mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_CURRENT_MONSTER_WAVE, mapID);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_CURRENT_MONSTER_WAVE, monsterWave+1, mapID);
	--WriteLog("SB_SpawnWaveMonsters::monsterWave: "..monsterWave+1);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_MONSTER_KILLED_CUR_WAVE, 0, mapID);
	StopMissionTimer(SB_MISSION_ID, SB_WAVE_TIMER_ID);
	StartMissionTimer(SB_MISSION_ID, SB_WAVE_TIMER_ID, SB_TIMER_INTERVAL);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_WAVE_TIMER_LOOP, SB_WAVE_TIMER_COUNT, mapID);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_WAVE_TIMEOUT, 0, mapID);
	Msg2MSAll(SB_MISSION_ID, "Tuy�t qu�i xu�t hi�n, c�c v� ��i hi�p h�y nhanh ch�ng ti�u di�t ch�ng");
end

function SB_SpawnBoss()
	local mapID = SubWorldIdx2ID(SubWorld);
	local dialogBossIndex = mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_DIALOG_BOSS_INDEX, mapID);
	SetNpcLifeTime(dialogBossIndex, 0);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_DIALOG_BOSS_INDEX, 0, mapID);
	local attackBossIndex = CreateNpc(SB_ATTACK_BOSS_TEMPLATE, SB_ATTACK_BOSS_NAME, mapID, SB_BossSpawnPoint[1], SB_BossSpawnPoint[2]);
	SetNpcDeathScript(attackBossIndex, "\\script\\online_activites\\2010_12\\activity_05\\npc\\attack_boss_death.lua");
	AddGroupUnit(SB_GROUP_MOB, attackBossIndex)
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_ATTACK_BOSS_INDEX, attackBossIndex, mapID);
end

function SB_OnMonsterDied()
	--WriteLog("SB_OnMonsterDied::called");
	local mapID = SubWorldIdx2ID(SubWorld);
	local killedCount = mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_MONSTER_KILLED_CUR_WAVE, mapID);
	killedCount = killedCount + 1;
	--WriteLog("SB_OnMonsterDied::mapID: "..mapID..", killedCount: "..killedCount);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_MONSTER_KILLED_CUR_WAVE, killedCount, mapID);
	--WriteLog("SB_OnMonsterDied::SB_MISSION_ID: "..SB_MISSION_ID..", SB_CAMP_ID: "..SB_CAMP_ID..", SB_MONSTER_COUNT_PER_WAVE: "..SB_MONSTER_COUNT_PER_WAVE);
	--WriteLog("SB_OnMonsterDied::GetMSPlayerCount("..SB_MISSION_ID..", "..SB_CAMP_ID.."): "..GetMSPlayerCount(SB_MISSION_ID, SB_CAMP_ID));
	Msg2MSGroup(SB_MISSION_ID, "Qu�i v�t �� b� ti�u di�t"..killedCount.."/"..SB_MONSTER_COUNT_PER_WAVE..")", SB_CAMP_ID);
	if killedCount >= SB_MONSTER_COUNT_PER_WAVE then
		Msg2MSAll(SB_MISSION_ID, "Qu�i v�t �� b� ti�u di�t to�n b�, c� th� khi�u chi�n ��t qu�i ti�p theo");
	end
end

function SB_OnBossDied()
	local mapID = SubWorldIdx2ID(SubWorld);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_STATE, 0, mapID);
	StopMissionTimer(SB_MISSION_ID, SB_MISSION_TIMER_ID);
	CloseMission(SB_MISSION_ID);
end

function SB_Init()
	local mapID = SubWorldIdx2ID(SubWorld);
	--WriteLog("SB_Init::SubWorld: "..SubWorld..", mapID: "..mapID);
	--WriteLog("SB_Init::test1");		
	local npcIndex = CreateNpc(SB_DIALOG_BOSS_TEMPLATE, SB_DIALOG_BOSS_NAME, mapID, SB_BossSpawnPoint[1], SB_BossSpawnPoint[2]);
	--WriteLog("SB_Init::npcIndex: "..npcIndex);		
	SetNpcScript(npcIndex, "\\script\\online_activites\\2010_12\\activity_05\\npc\\dialog_boss.lua");
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_DIALOG_BOSS_INDEX, npcIndex, mapID);	
	
	for i=1, getn(SB_CarterSpawnPointList) do
		npcIndex = CreateNpc(CR_TEMPLATE, CR_NAME, mapID, SB_CarterSpawnPointList[i][1], SB_CarterSpawnPointList[i][2]);
		SetNpcScript(npcIndex, "\\script\\online_activites\\2010_12\\activity_05\\npc\\carter.lua");
	end
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_STATE, 1, mapID);
	--WriteLog("SB_Init::SB_CheckState("..mapID.."): "..SB_CheckState(mapID));
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_CURRENT_MONSTER_WAVE, 0, mapID);
	StartMissionTimer(SB_MISSION_ID, SB_MISSION_TIMER_ID, SB_TIMER_INTERVAL);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_MISSION_TIMER_LOOP, SB_MISSION_TIMER_COUNT, mapID);
	RunMission(SB_MISSION_ID);
end

function SB_DeleteAllPlayers()
	local playerIndices = mf_GetMSPlayerIndex(MISSION_ID,0);
	local oldPlayerIndex = PlayerIndex;
	for i=1,getn(playerIndices) do
		PlayerIndex = playerIndices[i];
		if PlayerIndex > 0 then
			DelMSPlayer(SB_MISSION_ID, SB_CAMP_ID);
		end
	end;
	PlayerIndex = oldPlayerIndex;
end;

function SB_End()
	local mapID = SubWorldIdx2ID(SubWorld);
	--WriteLog("SB_End::SubWorld: "..SubWorld..", mapID: "..mapID);
	StopMissionTimer(SB_MISSION_ID, SB_MISSION_TIMER_ID);
	SB_DeleteAllPlayers();
	ClearMapNpc(mapID, 1);
	SetGroupLifeTime(SB_GROUP_MOB, 1)
	ClearGroup(SB_GROUP_MOB)
	mf_ClearMissionData(mapID);
end

function SB_TestKillAll()
	--WriteLog("SB_TestKillAll::called");
	local npcIndices = GetMapNpcIdx(SubWorldIdx2ID(SubWorld));
	for i=1, getn(npcIndices) do
		local npcName = GetNpcName(npcIndices[i]);
		if npcName == "Ti�u Tuy�t Qu�i" or npcName == "��i Tuy�t Qu�i" then
			Death(npcIndices[i]);
		end
	end
end

function SB_TestGoBoss()
	local mapID = SubWorldIdx2ID(SubWorld);
	--WriteLog("SB_TestGoBoss::mapID: "..mapID);
	NewWorld(mapID, SB_BossSpawnPoint[1], SB_BossSpawnPoint[2]);
end

function SB_TestGoCarter()
	SB_Leave();
end

function SB_TestSetMonsterWave(wave)
	local mapID = SubWorldIdx2ID(SubWorld);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_CURRENT_MONSTER_WAVE, wave, mapID);
end

function SB_TestSetMonsterKilled(killedCount)
	local mapID = SubWorldIdx2ID(SubWorld);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_MONSTER_KILLED_CUR_WAVE, killedCount, mapID);
end

function SB_TestKillBoss()
	local npcIndices = GetMapNpcIdx(SubWorldIdx2ID(SubWorld));
	for i=1, getn(npcIndices) do
		local npcName = GetNpcName(npcIndices[i]);
		if npcName == SB_ATTACK_BOSS_NAME then
			Death(npcIndices[i]);
		end
	end	
end

function SB_Test1()
	SB_TestSetMonsterWave(10);
	SB_TestSetMonsterKilled(264);
end