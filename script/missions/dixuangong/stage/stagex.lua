--------------------------------------------------------------------
-- ������ ��4�� ���׹�
-- by windle
-- 2010-3-28 21:00
--------------------------------------------------------------------

Include("\\settings\\static_script\\missions\\base\\tstage.lua");
Include("\\script\\lib\\define.lua");
--Include("\\script\\master_prentice\\master_prentice_point.lua")
----2013��3�»���
--Include("\\script\\online\\2013\\camp03\\head.lua");
----2013��3�»��ӽ���
Include("\\settings\\static_script\\misc\\missionaward_head.lua")
Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\online\\award_head.lua")
Include("\\script\\missions\\dixuangong\\daily_task.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
--------------------------------------------------------------------
--tPhaseBase = {
--}
--
--phasex_1 = gf_CopyInherit(tPhaseBase, {
--})

phasex_1 = {
	stepInterval = 5,
	stepLimit = 100/5,
};
phasex_2 = {
	stepInterval = 15,
	stepLimit = 600,
};
phasex_3 = {
	stepInterval = 3,
	stepLimit = 1,
};

--------------------------------------------------------------------
tStageX = {
	tPhases = {
		phasex_1,
		phasex_2,
		phasex_3,
	},

	rule = {
		["p0"] = 1,
		["p1"] = 2,
		["p2"] = 3,
	},
	pos = {
		{1732, 3160},
		{1731, 3171},
		{1723, 3163},
		{1724, 3179},
		{1716, 3170},
	},
	resetPos = {1721, 3168},
	npcMod = {
		{"��a Huy�n Cung Cung Ch� ��a", "Cung Ch� ��a Huy�n Cung "},
		{"Thi�n �m Ph�p S� ��a", "Thi�n �m  Th�y Mo"},
		{"Thi�n �m Ng�c T�t ��a", "��u S� Ng�c T�t Thi�n �m",},
		{"Ng��i g�1", "Tinh Anh ��a Huy�n Cung"},
		{"Ng��i g�1", "Tinh Anh ��a Huy�n Cung"},

		{"yinbaoxiang", "R��ng B�c", 180},
		{"tongbaoxiang", "R��ng ��ng", 180},
		--{"����Ǯ", "����������", 180},
	},
--	stepLimit = 600,
	tGodState	= {
		tInfo	= {"Thi�n th�n h� ph�m", 10, "Duy tr� %d ph�t"},
		tState	= {
			[1] = {9908, "state_p_attack_percent_add",	700,	"Ngo�i c�ng t�ng %d%%"},
			[2] = {9909, "state_m_attack_percent_add",	700,	"N�i c�ng t�ng %d%%"},
			[3] = {9910, "state_life_max_percent_add",	300,	"Gi�i h�n m�u t�ng %d%%"},
			[4] = {9911, "state_buff_resist",			14,		"Mi�n d�ch tr�ng th�i b� h�i %d"},
		},
	},
}
msgs = {
	{
		"Nghe n�i d�o n�y nh�n s� gia nh�p b�n gi�o �t h�n th�ng tr��c 10%, gi�m xu�ng 8% �i!",
		"L�ng ng��i �� tan, mang theo ��i ng� kh�ng d�!",
		"L�m vi�c b�t l�i c�n � ��y m� ng�y bi�n",
		"M�y t�n b�n kia l�m g� m� kh�ng th�y ng��I bao gi�",
		"Kh�ng l� l� ��n nh�p gi�o sao?",
	},{
		"T�i nay ��u ��y, cho � ki�n �i!",
		"Nghe n�i Long M�n Kh�ch c�ng ���c ��y",
		"Ph�i , ph�i, c�n c� b� ch� kia n�a",
		"C�c ng��i l� ai, sao v�o ���c ��y ch�",
		"Di�t h�t bon h�, ki�m t� ti�n",
	},
}
--------------------------------------------------------------------
function tStageX:onInit()
	g_theMS.msCamp[1]:turnPlayer(NewWorld, GetMissionV(MV_MAP_ID), self.resetPos[1], self.resetPos[2]);
	stageAction("p1");
	tStageBase:onInit();

	local n = random(1, getn(msgs));
	for i = 1, 5 do
		local npc = self:createChar(i)
		NpcChat(npc, msgs[n][i]);
	end
end

function tStageX:createChar(nId)
	local npcMod = self.npcMod[nId];
	if not npcMod then
		print(format("[phase1_2:createChar] [error id] [id = %s]", tostring(nId)));
		return
	end
	local npc = CreateNpc(npcMod[1], npcMod[2], self:GetPos(nId));
	SetNpcScript(npc, g_theMS.fileName);
	if npcMod[3] then
		SetNpcLifeTime(npc, npcMod[3]);
	end
	SetCampToNpc(npc, CampEnemy);
	return npc;
end

function tStageX:createBoss()
	self:createChar(3);
	self:createChar(4);
end

function tStageX:createJiguan()
	local rand1,rand2 = random(1,5), random(1,4)
	if rand1 == rand2 then
		rand1 = 5;
	end
	local npcMod = self.npcMod[5];
	local npc = CreateNpc(npcMod[1], npcMod[2], self:GetPos(4 + rand1));
	SetNpcScript(npc, g_theMS.fileName);
	SetNpcLifeTime(npc, 30);
	npcMod = self.npcMod[6];
	local npc = CreateNpc(npcMod[1], npcMod[2], self:GetPos(4 + rand2));
	SetNpcScript(npc, g_theMS.fileName);
	SetNpcLifeTime(npc, 30);
end

function tStageX:createDog()
	local npcMod = self.npcMod[7];
	for i = 1, 4 do
		local m, x, y = self:GetPos(i + 9);
		for i = 1, 4 do
			local npc = CreateNpc(npcMod[1], npcMod[2], m, x, y);
			SetNpcLifeTime(npc, 90);
		end
	end
end

function tStageX:GetPos(n)
	local pos = self.pos[n];
	return g_theMS:GetMissionV(MV_MAP_ID), pos[1], pos[2];
end

function tStageX:onTimerOver()
	g_theMS:Close()
end
tStageX.rule["timerover"] = tStageX.onTimerOver;

function tStageX:giveAward(nNpcIdx, nBossCount)
	
	if GetNpcName(nNpcIdx) == "Cung Ch� ��a Huy�n Cung " then
		create_dxg_box_gold(nNpcIdx,1)--����
	end
	
	local tChg = {
		1,0, 2, 0, 3
	}
	nBossCount = tChg[nBossCount] or 0
	if nBossCount == 0 then
		return
	end
	local m, x, y = GetNpcWorldPos(nNpcIdx);
--	for i = 1, 3 do
--		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--		local npcMod = self.npcMod[6];
--		local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--		if npcMod[3] then
--			SetNpcLifeTime(npc, npcMod[3]);
--		end
--		SetNpcScript(npc, g_theMS.Box2);
--		AddUnitStates(npc, 3, 99 - GetUnitCurStates(npc))
--	end
	create_box_tong(nNpcIdx, nBossCount) --���������ͭ����
	for i= 1,4 do
		create_box_yin(m,x,y, nBossCount)
	end
--	for i = 1, 1 do
--		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--		local npcMod = self.npcMod[7];
--		local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--		if npcMod[3] then
--			SetNpcLifeTime(npc, npcMod[3]);
--		end
--		SetNpcScript(npc, g_theMS.Box1);
--	end
	--����������
--	if GetNpcName(nNpcIdx) == "����������" then
--		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--		local npcMod = self.npcMod[8];
--		local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--		if npcMod[3] then
--			SetNpcLifeTime(npc, npcMod[3]);
--		end
--		SetNpcScript(npc, g_theMS.Box4);
--	end
	g_theMS.msCamp[1]:turnPlayer(
--		function ()
--		local lv = GetLevel();
--		local nExp = lv * lv * 60;
--		local nBossCount = GetTask(TASKID_DIXUANGONG_DAILY_BOSS3) + 1;
--		SetTask(TASKID_DIXUANGONG_DAILY_BOSS3, nBossCount, TASK_ACCESS_CODE_DXG_MISSION);
--		nExp = floor(nExp * 1.3)
--		gf_Modify("Exp", nExp);
--	end
		giveStageExpAward, nBossCount
	)
	
	g_theMS.msCamp[1]:turnPlayer(qht_raid_dxg_13);
	g_theMS.msCamp[1]:turnPlayer(aw_dxg_award, 0);
	Observer:onTeamEvent(SYSEVENT_DIXUANGONG_STAGE_FINISH, nBossCount)

end

function tStageX:ReviveAllPlayer()
	local funReviveAllPlayer = function()
		if IsPlayerDeath() ~= 0 or GetLife() <= 0 then
			local nOldIndex = PlayerIndex;
			RevivePlayer(0);
			PlayerIndex = nOldIndex;
			StartTimeGuage("Th�i gian v� ��ch", 10, 0, 2);
			CastState("state_dispear",0,10*18); --�޵�
			RestoreAll();
			tStageX:AddGodState();
		end
	end;
	mf_OperateAllPlayer(MISSION_ID, funReviveAllPlayer, nil, 1);
end
function tStageX:AddGodState()
	self:CleanGodState();
	local tState = self.tGodState.tState;
	for i = 1, getn(tState) do
		CastState(tState[i][2], tState[i][3], self.tGodState.tInfo[2] * 60 * 18, 1, tState[i][1], 1);
	end
	SyncCustomState(1, tState[1][1], 1, self.tGodState.tInfo[1]);
end

function tStageX:CleanGodState()
	local tState = self.tGodState.tState;
	for i = 1, getn(tState) do
		RemoveState(tState[i][1]);
	end
end

--------ɱ�ֽ׶�-------------------------------------------------
function phasex_2:onInit()
	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:onTimer();
	g_theMS.msCamp[1]:turnPlayer(StartTimeGuage,"Thanh tr��t th�i gian", self.stepLimit, 0);
	g_theMS.msCamp[1]:turnPlayer(tStageX.AddGodState, tStageX);
	g_theMS.msCamp[1]:turnPlayer(StartTimeGuage,"Th�i gian h�i sinh", 15, 1, 1);
	SetMissionV(MV_BOSS_COUNT, 0);
--	ds_DXG:AddStatValue(4,1,1);
--	ds_DXG:AddStatValue(4,2,g_theMS.msCamp[1]:getCount(0));
	---201212��޸�
	local nMapID = g_theMS:GetMissionV(MV_MAP_ID);
	--Observer:onEvent(OE_DXG_CREATE_NPC,{4, nMapID, 1734, 3160}); --pvp��ͼ����mapID����Ӫ��pve����mapID������
	
	SetMissionV(MV_DXG_ROUTE_CNT, getRouteCount())
--	remove_tong_box()
--	remove_yin_box()
	--SetMissionV(MV_DXG_STAGE_CNT, 4)
	
end
function phasex_2:onTimer(nStep)
	nStep = (nStep - 1) * self.stepInterval;
	if nStep >= self.stepLimit then
		g_theMS:action("missionfinish");
		return
	end
	if 1 then
		tStageX:ReviveAllPlayer();
	end
end

function phasex_2:onNpcDeath(npcIdx)
	g_theMS.msCamp[1]:turnPlayer(dxg_task_check_and_finish_task, 3, npcIdx);--ÿ������-ɱ��
	local npcName = GetNpcName(npcIdx);
	if 1 then
		local nBossCount = g_theMS:GetMissionV(MV_BOSS_COUNT) + 1;
		g_theMS:SetMissionV(MV_BOSS_COUNT, nBossCount);
		getStage():giveAward(npcIdx, nBossCount);
		if nBossCount == 5 then
		--	ClearMapNpc(g_theMS:getMapId(), nil);
			g_theMS.msCamp[1]:turnPlayer(StopTimeGuage, -2);
			stageAction('p2');
		end
	end
end
function phasex_2:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end

--------���ؽ���----------------------------------------------------
function phasex_3:onInit()
	--Observer:onEvent(OE_DIXUANGONG_Mission, 4);
--	ds_DXG:AddStatValue(4,3,1);
	reviveAll();
	tStageX:ReviveAllPlayer();
	g_theMS.msCamp[1]:turnPlayer(tStageX.CleanGodState, tStageX);
--	g_theMS.msCamp[1]:turnPlayer(sjzx_add_friendly,10);
--	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:Msg2MSAll("Tr�i qua s� n� l�c, c�c v� ��i hi�p �� v��t �i ��a Huy�n C�ng th�nh c�ng")
--	local op = function()
--		if GetTask(TASKID_DXG_DAILY_TASK) == 1 then
--			SetTask(TASKID_DXG_DAILY_TASK, 2, TASK_ACCESS_CODE_DXG_MISSION);
--			Msg2Player("������˱��յĵ���������ȥ��ȡ�����ɣ�");
--		end
--	end
--	g_theMS.msCamp[1]:turnPlayer(op);
	for i = MV_IS_OPENED_BOX_BEGIN, MV_IS_OPENED_BOX_END do
		SetMissionV(i, 0);
	end
	--ͨ��ǰ���ش���ͳ��
	AddRuntimeStat(1,8,0,1);
end

function phasex_3:onTimer(nStep)
	g_theMS:action("so")
end

--------------------------------------------------------------------

tStageX = gf_CopyInherit(tStageBase, tStageX);
