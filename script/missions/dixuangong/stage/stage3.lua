--------------------------------------------------------------------
-- ������ ��3��
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
--phase3_1 = gf_CopyInherit(tPhaseBase, {
--})

phase3_1 = {
	stepInterval = 1,
	stepLimit = 120,
};
phase3_2 = {
	stepInterval = 30,
	stepLimit = 600,
};
phase3_3 = {
	stepInterval = 3,
	stepLimit = 1,
};

--------------------------------------------------------------------
tStage3 = {
	tPhases = {
		phase3_1,
		phase3_2,
		phase3_3,
	},

	rule = {
		["p0"] = 1,
		["p1"] = 2,
		["p2"] = 3,
	},
	pos = {
		{1715, 3188},

		{1723, 3170},
		{1724, 3155},
		{1736, 3168},

		{1725, 3182},
		{1734, 3172},
		{1721, 3168},
		{1717, 3154},
		{1707, 3162},

		{1714, 3158},
		{1716, 3171},
		{1729, 3176},
		{1725, 3162},
	},
	resetPos = {1721, 3168},
	npcMod = {
		{"Minh Gi�o Th�m T� ��a", "Minh Gi�o Th�m T�", 100},
		{"��a Huy�n Cung Cung Ch� ��a", "Cung Ch� ��a Huy�n Cung "},
		{"Ng��i g�1", "Ng��i G�", 120},
		{"Ng��i g�1", "Ng��i G�", 120},
		{"C� H�n 1", "C� H�n"},
		{"K�nh L�i 1", "Kinh L�i"},
		{"K� Cu�ng Thi�n �m ", "K� Cu�ng Thi�n �m "},
		{"yinbaoxiang", "R��ng B�c", 180},
		{"tongbaoxiang", "R��ng ��ng", 180},
		--{"����Ǯ", "����������", 180},
	},
--	stepLimit = 600,
}

--------------------------------------------------------------------
function tStage3:onInit()
	stageAction("p0");
	tStageBase:onInit();
end

function tStage3:createChar(nId)
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

function tStage3:createBoss()
	self:createChar(3);
	self:createChar(4);
end

function tStage3:createJiguan()
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

function tStage3:createDog()
	local npcMod = self.npcMod[7];
	for i = 1, 4 do
		local m, x, y = self:GetPos(i + 9);
		for i = 1, 4 do
			local npc = CreateNpc(npcMod[1], npcMod[2], m, x, y);
			SetNpcLifeTime(npc, 90);
		end
	end
end

function tStage3:createFish(npc)
	local m, x, y = GetNpcWorldPos(npc);
	local count = 5 + COUNT_RUNNER - GetMissionV(MV_KILLED_NPC) - GetMissionV(MV_LIVED_RUNNER);
	for i = 1, count do
		local xx, yy = x + random(-5, 5), y + random(-5, 5)
		local npc = CreateNpc("Giam C�m Nh�n S� ��a"..random(1,10),"�� t� b� giam c�m", m, xx, yy);
		SetCampToNpc(npc, CampPlayer);
		SetNpcScript(npc, g_theMS.fileName);
		ModifyNpcData(npc, 0, 1000,0);
	end
end

function tStage3:GetPos(n)
	local pos = self.pos[n];
	return g_theMS:GetMissionV(MV_MAP_ID), pos[1], pos[2];
end

function tStage3:onTimerOver()
	g_theMS:Close()
end
tStage3.rule["timerover"] = tStage3.onTimerOver;

function tStage3:giveAward(nNpcIdx, nBossCount)
	local m, x, y = GetNpcWorldPos(nNpcIdx);
	create_dxg_box_gold(nNpcIdx, 1)
	for i = 1, 4 do
		create_box_yin(m,x,y,3)
--		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--		local npcMod = self.npcMod[8];
--		local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--		if npcMod[3] then
--			SetNpcLifeTime(npc, npcMod[3]);
--		end
--		SetNpcScript(npc, g_theMS.Box2);
--		AddUnitStates(npc, 3, 99 - GetUnitCurStates(npc))
	end
	create_box_tong(nNpcIdx, 3) --���������ͭ����
--	for i = 1, 2 do
--		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--		local npcMod = self.npcMod[9];
--		local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--		if npcMod[3] then
--			SetNpcLifeTime(npc, npcMod[3]);
--		end
--		SetNpcScript(npc, g_theMS.Box1);
--	end
--	--����������
--	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--	local npcMod = self.npcMod[10];
--	local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--	if npcMod[3] then
--		SetNpcLifeTime(npc, npcMod[3]);
--	end
--	SetNpcScript(npc, g_theMS.Box4);
	
	g_theMS.msCamp[1]:turnPlayer(
--		function ()
--		local lv = GetLevel();
--		local nExp = lv * lv * 40;
--		local nBossCount = GetTask(TASKID_DIXUANGONG_DAILY_BOSS3) + 1;
--		SetTask(TASKID_DIXUANGONG_DAILY_BOSS3, nBossCount, TASK_ACCESS_CODE_DXG_MISSION);
--		nExp = floor(nExp * 1.5)
--		gf_Modify("Exp", nExp);
--	end
	giveStageExpAward
	)
	
	g_theMS.msCamp[1]:turnPlayer(qht_raid_dxg_13);
	g_theMS.msCamp[1]:turnPlayer(aw_dxg_award, 0);
	Observer:onTeamEvent(SYSEVENT_DIXUANGONG_STAGE_FINISH, 3)
end

-------�ȴ������׶�------------------------------------------------------
function phase3_1:onInit()
	g_theMS.msTimer:setInterval(self.stepInterval);
--	getStage():createChar(1)
	g_theMS:Msg2MSAll("T� ��i c�a ng��i �� �i v�o ��a Huy�n Cung H�u �i�n");
	phase2_3_gogogo();
end

function phase3_1:onTimer(nStep)
	if nStep > self.stepLimit then
		stageAction('p1');
		return
	end
	if nStep == 1 then
		g_theMS.msCamp[1]:turnPlayer(function ()
			SetFightState(0);
		end);
		local npc = getStage():createChar(2);
		getStage():createFish(npc);
		SetNpcActivator(npc);
	elseif nStep == 3 then
		local npc = findNpc("Cung Ch� ��a Huy�n Cung ");
		NpcChat(npc, "H�y h�y h�y! NPC m� ��, ph�t ra ch�nh lo�n, H�ng �n Gi�o Ch�!");
		local npc2 = findNpc("Nga My Li�u Hi�n")
		local pos = getStage().resetPos;
		SetNpcPos(npc2, pos[1], pos[2]);
	elseif nStep == 4 then
		local npc = findNpc("Cung Ch� ��a Huy�n Cung ");
		NpcChat(npc, "L�y danh ngh�a c�a H�ng �n Gi�o Ch� ph�i ch� tr�ng th�i �� ph�c sinh l�i !");
		NpcCommand(npc, NPCCOMMAND.do_skill,1732*32,3160*32,65536*1+693);
		local npc2 = findNpc("Nga My Li�u Hi�n")
		NpcCommand(npc2, NPCCOMMAND.do_beatdown, 8, 5 * 18);
		NpcChat(npc2, "A�Ta l�i ~~~");
	elseif nStep == 6 then
		local npc = findNpc("Cung Ch� ��a Huy�n Cung ");
		NpcChat(npc, "Tin H�ng �n ��c b�ng sinh!");
		ChangeNpc2Talk(npc);
		local npc2 = findNpc("Nga My Li�u Hi�n")
		SetNpcLifeTime(npc2, 0);
	end
end

function phase3_1:onNpcDeath(npcIdx)
	local npcName = GetNpcName(npcIdx)
	if npcName == "�� t� b� giam c�m" or npcName == "V� L�m Tinh Anh" then
		local m, x, y = GetNpcWorldPos(npcIdx);
		SetNpcLifeTime(npcIdx, 0);
		local npc = CreateNpc("C��ng Thi ��a"..random(1,3), "C��ng Thi", m, x, y);
		SetCampToNpc(npc, CampEnemy);
	end
end

function phase3_1:onTalk(npcIdx)
	if PlayerIndex ~= GetTeamMember(0) then
		Talk(1, "", "Khi ta c�n tr� nh� ng��i, c�ng n�ng t�nh nh� v�y!");
		return
	end
	SetMissionV(MV_DXG_ROUTE_CNT, getRouteCount())
	local tSel = {
		"N�i �t th�i, xem ��y!/#stageAction('p1')",
	}
	Say("Tu�i c�n tr� nh� v�y sao l�i t� s�t ch�, ta th�y g�n c�t c�a ng��i k� l� l�i �i h�p s�c v�i minh m�n ch�nh ��o, ��ng ti�c ��ng ti�c!, chi b�ng nh�n l�y m�t t�ch n�y, b�i ta l�m s� ph� �i!", getn(tSel), tSel);
end
function info3()
	Talk(1, "", "Minh Gi�o Th�m T�: H�u �i�n l� n�i � c�a ��a Huy�n Cung Cung Ch�, Cung Ch� nghi�n c�u ch� t�o ra c�c c� quan d�ng m�nh d� th��ng, c�c ng��i ph�i c�n th�n. ��nh b�i Cung Ch� s� c� c� h�i nh�n ���c R��ng Thi�n �m Th�nh V�t ho�c Thi�n �m M�t R��ng.");
end
function phase3_1:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end

--------ɱ�ֽ׶�-------------------------------------------------
function phase3_2:onInit()
--	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msCamp[1]:turnPlayer(function ()
		SetFightState(1);
	end);
	local npc = findNpc("Cung Ch� ��a Huy�n Cung ");
	NpcChat(npc, "L�y danh ngh�a c�a H�ng �n gi�o ch� ch� b�ng sinh!");
	g_theMS:Msg2MSAll("�i�u ki�n qua �i: ��nh b�i Cung Ch�")
	ChangeNpc2Fight(npc);
	g_NpcAI:setAI(npc, AT_SM_ATTACK);
	g_NpcAI:setWayPoint(npc, {{1732, 3160}});

	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:onTimer();
	g_theMS.msCamp[1]:turnPlayer(StartTimeGuage,"Thanh tr��t th�i gian", self.stepLimit, 0);
	local pos = getStage().resetPos;
	g_theMS.msCamp[1]:turnPlayer(SetPos, pos[1], pos[2]);
	local nMapID = g_theMS:GetMissionV(MV_MAP_ID);
end
function phase3_2:onTimer(nStep)
	nStep = (nStep - 1) * self.stepInterval;
	if nStep >= self.stepLimit then
		g_theMS:action('missionfinish');
		return
	end
end

function phase3_2:onNpcDeath(npcIdx)
	g_theMS.msCamp[1]:turnPlayer(dxg_task_check_and_finish_task, 3, npcIdx);--ÿ������-ɱ��
	local npcName = GetNpcName(npcIdx);
	if npcName == "Cung Ch� ��a Huy�n Cung " then
		g_theMS.msCamp[1]:turnPlayer(dxg_task_check_and_finish_task, 1, npcIdx);--ÿ������-123��ͨ��
		local nBossCount = g_theMS:GetMissionV(MV_BOSS_COUNT) + 1;
		g_theMS:SetMissionV(MV_BOSS_COUNT, nBossCount);
		ClearMapNpc(g_theMS:getMapId(), nil);
		g_theMS.msCamp[1]:turnPlayer(StopTimeGuage, -2);
		getStage():giveAward(npcIdx, nBossCount);
		stageAction('p2');
	elseif npcName == "�� t� b� giam c�m" or npcName == "V� L�m Tinh Anh" then
		local m, x, y = GetNpcWorldPos(npcIdx);
		SetNpcLifeTime(npcIdx, 0);
		local npc = CreateNpc("C��ng Thi ��a"..random(1,3), "C��ng Thi", m, x, y);
		SetCampToNpc(npc, CampEnemy);
	end
end
function phase3_2:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end

--------���ؽ���----------------------------------------------------
function phase3_3:onInit()
	--Observer:onEvent(OE_DIXUANGONG_Mission, 3);
--	ds_DXG:AddStatValue(3,3,1);
	reviveAll();
--	g_theMS.msCamp[1]:turnPlayer(sjzx_add_friendly,10);
--	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:Msg2MSAll("Qua n� l�c h�t m�nh, c�c ng��i �� v��t qua ���c ��a Huy�n Cung, ")
--	local op = function()
--		if GetTask(TASKID_DXG_DAILY_TASK) == 1 then
--			SetTask(TASKID_DXG_DAILY_TASK, 2, TASK_ACCESS_CODE_DXG_MISSION);
--			Msg2Player("������˱��յĵ���������ȥ��ȡ�����ɣ�");
--		end
--	end
--	g_theMS.msCamp[1]:turnPlayer(op);
	g_theMS:action("so");
	for i = MV_IS_OPENED_BOX_BEGIN, MV_IS_OPENED_BOX_END do
		SetMissionV(i, 0);
	end
	--ͨ��ǰ���ش���ͳ��
	AddRuntimeStat(1,8,0,1);
end

function phase3_3:onTimer(nStep)
	g_theMS:action("missionfinish")
end

--------------------------------------------------------------------

tStage3 = gf_CopyInherit(tStageBase, tStage3);
