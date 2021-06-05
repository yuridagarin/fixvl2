--------------------------------------------------------------------
-- ������ ��2��
-- by windle
-- 2010-3-28 21:00
--------------------------------------------------------------------
Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\missions\\base\\tstage.lua");
--Include("\\script\\lib\\define.lua");
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
--phase2_1 = gf_CopyInherit(tPhaseBase, {
--})
COUNT_RUNNER = 15 - 1;

phase2_1 = {
	stepInterval = 1,
	stepLimit = 2,
};
phase2_2 = {
	stepInterval = 1,
	stepLimit = 10 * 60,
	maxCount = COUNT_RUNNER,
};
phase2_3 = {
	stepInterval = 5,
	stepLimit = 180/5,
};

--------------------------------------------------------------------
tStage2 = {
	tPhases = {
		phase2_1,
		phase2_2,
		phase2_3,
	},
	rule = {
		["p0"] = 1,
		["p1"] = 2,
		["p2"] = 3,
	},
	pos = {
		{1674, 3234},
		{1681, 3214},
	},
	way1 = {
		{1690, 3210, },
		{1682, 3203, },
		{1668, 3217, },
		{1675, 3226, },
		{1660, 3240, }, },
	way2 = {
		{1690, 3210, },
		{1697, 3219, },
		{1683, 3234, },
		{1675, 3226, },
		{1660, 3240, }, },
	npcpos = {1702, 3190, },
	fishpos = {
		{1682, 3209, },
		{1692, 3218, },
		{1674, 3218, },
		{1683, 3228, }, },
	bosspos = {1682, 3218, },

	resetPos = {1674, 3234},
	npcMod = {
		{"Minh Gi�o Th�m T� ��a", "Minh Gi�o Th�m T�"},

		{"Thi�n �m Ng�c T�t ��a", "��u S� Ng�c T�t Thi�n �m",},
		{"Tuy�n C� ��a", "Tuy�n C�", },

		{"yinbaoxiang", "R��ng B�c", 180},
		{"tongbaoxiang", "R��ng ��ng", 180},
		--{"����Ǯ", "����������", 180},
	},
--	stepLimit = 600,
}

--------------------------------------------------------------------
function tStage2:onInit()
	stageAction("p0");
	tStageBase:onInit();
end

function tStage2:createChar(nId)
	local npcMod = self.npcMod[nId];
	if not npcMod then
		print(format("[phase1_2:createChar] [error id] [id = %s]", tostring(nId)));
		return
	end
	local npc = CreateNpc(npcMod[1], npcMod[2], getStage():GetPos(nId));
	SetNpcScript(npc, g_theMS.fileName);
	SetCampToNpc(npc, CampEnemy);
	return npc;
end

function tStage2:createRunner()
	local npcMod = {};
	npcName = "Nh�n s� v� l�m b� giam c�m";
	local model = "Giam C�m ��a"..random(1,10)
	npc = CreateNpc(model, npcName, self:GetPosEx(self.npcpos));
	SetNpcScript(npc, g_theMS.fileName);
	SetCampToNpc(npc, CampPlayer);
	SetNpcLifeTime(npc, 16);
	g_NpcAI:setAI(npc, AT_SM_MOVE);
	local way = self.way1;
	if self.bWay == 1 then
		way = self.way2;
		self.bWay = 0;
	else
		self.bWay = 1;
	end
	g_NpcAI:setWayPoint(npc, way);
	SetNpcActivator(npc);
	return npc;
end

function tStage2:createFish()
	local npcMod = self.npcMod[3];
	local tPos = self.fishpos;
	for i = 1, getn(tPos) do
		local npc = CreateNpc(npcMod[1], npcMod[2], self:GetPosEx(tPos[i]));
		if npcMod[3] then
			SetNpcLifeTime(npc, npcMod[3]);
		end
		SetCampToNpc(npc, CampEnemy);
		SetNpcScript(npc, g_theMS.fileName);
	end
end

function tStage2:GetPos(n)
	local pos = self.pos[n];
	return g_theMS:GetMissionV(MV_MAP_ID), pos[1], pos[2];
end
function tStage2:GetPosEx(pos)
	local m, x, y = g_theMS:GetMissionV(MV_MAP_ID), pos[1], pos[2];
	return m, x, y;
end
function tStage2:onTimerOver()
	g_theMS:Close()
end
tStage2.rule["timerover"] = tStage2.onTimerOver;

function tStage2:giveAward(nNpcIdx, nBossCount)
	--����ʥ����
	local m, x, y = GetNpcWorldPos(nNpcIdx);
	for i = 1, 4 do
		create_box_yin(m,x,y,2)
--		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--		local npcMod = self.npcMod[4];
--		local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--		if npcMod[3] then
--			SetNpcLifeTime(npc, npcMod[3]);
--		end
--		SetNpcScript(npc, g_theMS.Box2);
--		AddUnitStates(npc, 3, 99 - GetUnitCurStates(npc))
	end
	create_box_tong(nNpcIdx, 2) --���������ͭ����
--	--��������
--	for i = 1, 1 do
--		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--		local npcMod = self.npcMod[5];
--		local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--		if npcMod[3] then
--			SetNpcLifeTime(npc, npcMod[3]);
--		end
--		SetNpcScript(npc, g_theMS.Box1);
--	end
--	--����������
--	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--	local npcMod = self.npcMod[6];
--	local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--	if npcMod[3] then
--		SetNpcLifeTime(npc, npcMod[3]);
--	end
--	SetNpcScript(npc, g_theMS.Box4);
	
	local nCount = GetMissionV(MV_LIVED_RUNNER);
	local nScore = GetMissionV(MV_L2_SCORE);
	local nExpMulti;
	if nScore < 12 then
		nExpMulti = 1.2;
	elseif nScore < 18 then
		nExpMulti = 1.5;
	elseif nScore < 24 then
		nExpMulti = 2;
	else
		nExpMulti = 2.5;
	end
	g_theMS:Msg2MSAll(format("T�ng c�ng c�u %d v� Nh�n S� V� L�m, nh�n ���c %d �i�m",nCount, nScore));
	g_theMS.msCamp[1]:turnPlayer(
--		function ()
--		local lv = GetLevel();
--		local nExp = floor(lv * lv * 40 * %nExpMulti);
--		local nBossCount = GetTask(TASKID_DIXUANGONG_DAILY_BOSS2) + 1;
--		SetTask(TASKID_DIXUANGONG_DAILY_BOSS2, nBossCount, TASK_ACCESS_CODE_DXG_MISSION);
--		gf_Modify("Exp", nExp);
--	end
	giveStageExpAward
	)
--	g_theMS.msCamp[1]:turnPlayer(function ()
--		local lv = GetLevel();
--		local nExp = floor(lv * lv * lv);
--		local nBossCount = GetTask(TASKID_DIXUANGONG_DAILY_BOSS2) + 1;
--		SetTask(TASKID_DIXUANGONG_DAILY_BOSS2, nBossCount, TASK_ACCESS_CODE_DXG_MISSION);
--		gf_Modify("Exp", nExp);
--	end)
	g_theMS.msCamp[1]:turnPlayer(qht_raid_dxg_13);
	g_theMS.msCamp[1]:turnPlayer(aw_dxg_award, 0);
	Observer:onTeamEvent(SYSEVENT_DIXUANGONG_STAGE_FINISH, 2)
end

-------�ȴ������׶�------------------------------------------------------
function phase2_1:onInit()
	g_theMS.msTimer:setInterval(self.stepInterval);
--	getStage():createChar(1)
--	g_theMS:Msg2MSAll("���ǵĶ����Ѿ�����������е�ӳ��뱻ץ��������ͽ�Ի��ɿ����ؿ���");
	g_theMS:SetMissionV(MV_BOSS_COUNT, 0);
end

function phase2_1:onTimer(nStep)
	if nStep > self.stepLimit then
		stageAction('p1');
		return
	end
	if nStep == 1 then
		local npc = findNpc("Nga My Li�u Hi�n");
		ChangeNpc2Talk(npc);
		NpcChat(npc, "H�c hu hu, t� mu�i t�i nghi�p c�a ta~");
	end
end

function phase2_1:onTalk(npcIdx)
	if PlayerIndex ~= GetTeamMember(0) then
		return
	end
	SetMissionV(MV_DXG_ROUTE_CNT, getRouteCount())

	local tSel = {
		"Ta ��i ng��i ��n c�u ng��i/#stageAction('p1')",
		"Trung �i�n c�a ��a Huy�n Cung n�y c� huy�n c� g�/info2",
		"K�t th�c ��i tho�i/nothing"
	}
	Say("Li�u Hi�n: h�c hu hu, t� mu�i ��ng th��ng c�a ta~", getn(tSel), tSel);
end
function info2()
	Talk(1, "", "Trong ph�ng c� r�t nhi�u Tuy�n C�, r�t nhi�u t� mu�i ��ng m�n trong �� ch�u kh�. B�n trong c�n c� t�n cai ng�c gian �c, nhanh nhanh gi�p ch�ng t�i! N�n nh�, khi cai ng�c ch�t �i th� to�n b� c� quan s� ph�t ��ng, t�t c� c�c nh�n s� v� l�m s� b� giam c�m m� ch�t!");
end

--------ɱ�ֽ׶�-------------------------------------------------
function phase2_2:onInit()
	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:onTimer();
	g_theMS.msCamp[1]:turnPlayer(StartTimeGuage,"Thanh tr��t th�i gian", self.stepLimit, 0);
	g_theMS:Msg2MSAll("H�y b�o v� Nh�n S� V� L�m ch�y tr�n!");
	local pos = getStage().resetPos;
	g_theMS.msCamp[1]:turnPlayer(SetPos, pos[1], pos[2]);
	local nMapID = g_theMS:GetMissionV(MV_MAP_ID);
	---201212��޸�
	--Observer:onEvent(OE_DXG_CREATE_NPC,{2, nMapID, 1734, 3160}); --pvp��ͼ����mapID����Ӫ��pve����mapID������
--	ds_DXG:AddStatValue(2,1,1);
--	ds_DXG:AddStatValue(2,2,g_theMS.msCamp[1]:getCount(0));
end
function phase2_2:onTimer(nStep)
	nStep = nStep - 1;
	if nStep >= self.stepLimit then
		g_theMS:action('missionfinish');
		return
	end
	if nStep == 0 then
		g_theMS:SetMissionV(MV_KILLED_NPC, 0);
		SetMissionV(MV_LIVED_RUNNER, 0);
		local npc = getStage():createChar(2);
		NpcChat(npc, "Qu� nhi�n c�c ng��i �� ��n ��y, ��ng ti�c ��i c�c ng��i l�i l� con ���ng ch�t!");
		getStage():createFish();
	end
	local runStep = 8
	if mod(nStep, runStep) == 0 then
		if nStep < self.maxCount * runStep then
			local npc = getStage():createRunner();
			tMsg = {
				"H� gi� ta, � ��y nguy hi�m qu�!",
				"�i cha m� �i! cu�i c�ng ta c�ng tho�t ra ���c r�i !",
				"Cu�i c�ng t�n c�m ��u c�ng xu�t hi�n !",
				"Qu�n t� 10 n�m b�o th� c�ng ch�a mu�n, ng��i ng��i ng��i c�n c� ng��i n�a h�y ��i ��y!",
				"�a t� ��i hi�p t��ng tr�, sau n�y c�n vi�c g� c� g�i ta m�t ti�ng!",
			}
			local msg = randomin(tMsg);
			NpcChat(npc, msg);
		elseif nStep == self.maxCount * runStep then
			local npc = getStage():createRunner();
			NpcChat(npc, "Cu�i c�ng ta c�ng tho�t ra ���c!");
			g_theMS:Msg2MSAll("��i �a s� c�c nh�n s� v� l�m b� giam c�m ��u tho�t ra ngo�i ���c!");
		end
	end
	self:checkRunner();
	if nStep == 25 or nStep == 85 then
		self:castSkill(1);
	elseif nStep == 55 then
		self:castSkill(2);
	end
end
function phase2_2:checkRunner()
	local tNpc = findAllNpc("Nh�n s� v� l�m b� giam c�m");
	for i = 1, getn(tNpc) do
		local npc = tNpc[i];
		local _, x, y = GetNpcWorldPos(npc);
		if abs(x-1660) + abs(y-3240) < 5 then
			local l = GetMissionV(MV_LIVED_RUNNER) + 1;
			SetMissionV(MV_LIVED_RUNNER, l)
			SetNpcLifeTime(npc, 0);
			SetMissionV(MV_L2_SCORE, GetMissionV(MV_L2_SCORE) + 2);
		end
	end
end
function phase2_2:castSkill(n)
	local npc = findNpc("��u S� Ng�c T�t Thi�n �m");
	if not npc then return end

	local tPos = {
		{{1662,3217},{1670,3205},{1693,3232},{1685,3239},{1679,	3213},{1686,3223},},
		{{1670,3205},{1693,3232},{1693,3207},{1671,3231},{1682,3217},},
	}
	tPos = randomin(tPos[n]);
	local tMod = {
		{"H�n B�ng Tr�n ��a","H�n B�ng Tr�n"},
		{"Li�t H�a Tr�n ��a","Li�t H�a Tr�n"},
	}
	tMod = tMod[n];
	local npcFlag = CreateNpc(tMod[1], tMod[2], GetMissionV(MV_MAP_ID), tPos[1], tPos[2]);
	SetNpcLifeTime(npcFlag, 15);
	SetCampToNpc(npcFlag, CampEnemy);
	NpcChat(npc, "��o t�u h� n�m m� �i! Ta kh�ng �� cho c�c ng��i tho�t kh�i ��y ��u!");
end

function phase2_2:finish()
	getStage():action("p2");
end

function phase2_2:onNpcDeath(npcIdx)
	g_theMS.msCamp[1]:turnPlayer(dxg_task_check_and_finish_task, 3, npcIdx);--ÿ������-ɱ��
	local npcName = GetNpcName(npcIdx);
	if npcName == "��u S� Ng�c T�t Thi�n �m" then
		ClearMapNpc(g_theMS:getMapId(), nil);
		g_theMS.msCamp[1]:turnPlayer(StopTimeGuage,-2);
		stageAction('p2');
		getStage():giveAward(npcIdx, nBossCount);
		local maxCount = GetMissionV(MV_TIMER_STEP) * 5 / 20;
		if maxCount > self.maxCount then
			maxCount = self.maxCount;
		end
	elseif npcName == "Nh�n s� v� l�m b� giam c�m" then
		local nCount = g_theMS:GetMissionV(MV_KILLED_NPC) + 1;
		g_theMS:Msg2MSAll(format("�� c� %d nh�n s� v� l�m b� gi�t ch�t!!!", nCount));
		g_theMS:SetMissionV(MV_KILLED_NPC, nCount);
--		ClearMapNpc(g_theMS:getMapId(), nil);
--		StopTimeGuage(-2);
--		stageAction('p2');
	end
	if npcName ~= "Tuy�n C�" then
		SetNpcLifeTime(npcIdx, 3);
	end
end
function phase2_2:onTrap(nId)
		local pos = getStage().resetPos;
		SetPos(pos[1], pos[2]);
end

--------���ؽ���----------------------------------------------------
function phase2_3:onInit()
	--Observer:onEvent(OE_DIXUANGONG_Mission, 2);
	--ds_DXG:AddStatValue(2,3,1);
	reviveAll();
--	g_theMS.msCamp[1]:turnPlayer(sjzx_add_friendly,10);
	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:Msg2MSAll("Tr�i qua gian nguy n� l�c, Thi�n �m Cai Ng�c ��u M�c b� c�c ng��i ��nh b�i r�i.");

	self:createMinion();
	for i = MV_IS_OPENED_BOX_BEGIN, MV_IS_OPENED_BOX_END do
		SetMissionV(i, 0);
	end
end

function phase2_3:onTimer(nStep)
	if nStep > self.stepLimit then
		stageAction('timerover');
		return
	end

	if nStep == 3 then
		local npc = findNpc("Nga My Li�u Hi�n");
		ChangeNpc2Talk(npc);
		NpcChat(npc, "�a t� c�c v� ��i hi�p �� ra tay t��ng tr�!");
	end
end

tPos_2_3 = {
	{1649, 3251, { {1660, 3240}, {1678, 3220}}},		-- 03
	{1651, 3253, { {1660, 3240}, {1680, 3222}}},		-- 04
	{1646, 3254, { {1660, 3240}, {1675, 3223}}},		-- 09
	{1648, 3256, { {1660, 3240}, {1677, 3225}}},		-- 10
	{1647, 3249, { {1655, 3235}, {1676, 3218}}},		-- 02
	{1653, 3255, { {1665, 3245}, {1682, 3224}}},		-- 05
	{1644, 3252, { {1655, 3235}, {1673, 3221}}},		-- 08
	{1650, 3258, { {1665, 3245}, {1679, 3227}}},		-- 11
	{1643, 3257, { {1660, 3240}, {1672, 3226}}},		-- 15
	{1645, 3259, { {1660, 3240}, {1674, 3228}}},		-- 16
	{1640, 3260, { {1660, 3240}, {1669, 3229}}},		-- 21
	{1642, 3262, { {1660, 3240}, {1671, 3231}}},		-- 22
	{1645, 3247, { {1655, 3235}, {1674, 3216}}},		-- 01
	{1655, 3257, { {1665, 3245}, {1684, 3226}}},		-- 06
	{1642, 3250, { {1655, 3235}, {1671, 3219}}},		-- 07
	{1652, 3260, { {1665, 3245}, {1681, 3229}}},		-- 12
	{1641, 3255, { {1655, 3235}, {1670, 3224}}},		-- 14
	{1647, 3261, { {1665, 3245}, {1676, 3230}}},		-- 17
	{1639, 3253, { {1655, 3235}, {1668, 3222}}},		-- 13
	{1649, 3263, { {1665, 3245}, {1678, 3232}}},		-- 18
	{1638, 3258, { {1655, 3235}, {1667, 3227}}},		-- 20
	{1644, 3264, { {1665, 3245}, {1673, 3233}}},		-- 23
	{1636, 3256, { {1655, 3235}, {1665, 3225}}},		-- 19
	{1646, 3266, { {1665, 3245}, {1675, 3235}}},		-- 24
}
function phase2_3:createMinion()
	local npc = CreateNpc("Li�u Hi�n ��a", "Nga My Li�u Hi�n", g_theMS:GetMissionV(MV_MAP_ID), 1653, 3248);
	SetCampToNpc(npc, CampPlayer);
	SetNpcActivator(npc);
	ChangeNpc2Talk(npc);
	g_NpcAI:setAI(npc, AT_SM_MOVE);
	g_NpcAI:setWayPoint(npc, {{1690, 3209}});
	SetNpcScript(npc, g_theMS.fileName);

	local nCount = g_theMS:GetMissionV(MV_LIVED_RUNNER);
	m = GetMissionV(MV_MAP_ID);
	for i = 1, nCount do
		local pos = tPos_2_3[i];
		npc = self:createMinion2(m, pos[1], pos[2]);
		g_NpcAI:setAI(npc, AT_SM_MOVE);
		g_NpcAI:setWayPoint(npc, pos[3]);
		SetNpcScript(npc, g_theMS.fileName);
	end
end

function phase2_3:createMinion2(m, x, y)
	npcName = "V� L�m Tinh Anh";
	local model = "V� L�m Nh�n S� ��a"..random(1,10)
	npc = CreateNpc(model, npcName, m, x, y);
	SetCampToNpc(npc, CampPlayer);
--	ChangeNpc2Talk(npc);
	return npc;
end

function phase2_3:onTalk(npcIdx)
	local npcName = GetTargetNpcName();
	if npcName == "Nga My Li�u Hi�n" and isCaption() then
		Say("Tr�n chi�n n�y nh�n s� v� l�m t�n th�t n�ng n�, mong c�c ch� v� t��ng tr�!", 1, "Ta nguy�n v� v� l�m m� gi�p s�c/phase2_3_gogogo");
	else
		Talk(1, "", format("<color=green>%s<color>: �a t� �� t��ng tr�!", npcName));
	end
end

function phase2_3_gogogo()
	local flag = GetMissionV(MV_S2_GGG_FLAG);
	if flag == 1 then return end
	SetMissionV(MV_S2_GGG_FLAG, 1);
	local npc = findNpc("Nga My Li�u Hi�n");
	NpcChat(npc, "C�c huynh ��, ��nh tan ��i Huy�n Cung Cung Ch� ch�ng ta chia nhau trang b�!");
	ChangeNpc2Fight(npc);
	g_NpcAI:setAI(npc, AT_SM_MOVE);
	g_NpcAI:setWayPoint(npc, {{1717, 3169}});
	setCurStage(3)
	remove_tong_box()
	remove_yin_box()
	remove_box_gold()

	local tMsg = {
		"H�t ti�n s�a trang b� r�i T_T",
		"Tr�i, c� b�!",
		"++++++++++++++",
		"H�c th� ��ng m� r��ng!! ",
	}
	local tnpcs = findAllNpc("V� L�m Tinh Anh");
	local t = {{1690, 3197}, {1696, 3201}, {1700, 3208}};
	for _, npc in tnpcs do
--		ChangeNpc2Fight(npc);
		g_NpcAI:setAI(npc, AT_SM_ATTACK);
		local _, x, y = GetNpcWorldPos(npc);
		local p1 = randomin(t);
		g_NpcAI:setWayPoint(npc, {p1, {x+50, y-50}});
		if random(10) <= 3 then
			NpcChat(npc, randomin(tMsg));
			SetNpcActivator(npc);
		end
	end
end

function phase2_3:onTrap(nId)
	if nId == 2 then
		g_theMS:action("s3")
	end
end
--------------------------------------------------------------------

tStage2 = gf_CopyInherit(tStageBase, tStage2);
