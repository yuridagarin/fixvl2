--------------------------------------------------------------------
-- ������ ��1��
-- by windle
-- 2010-3-28 21:00
--------------------------------------------------------------------
Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\missions\\base\\tstage.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\online\\qianhe_tower\\qht_head.lua")
--Include("\\script\\master_prentice\\master_prentice_point.lua")
Include("\\script\\online\\award_head.lua")
Include("\\script\\missions\\dixuangong\\daily_task.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
--------------------------------------------------------------------
--tPhaseBase = {
--}
--
--phase1_1 = gf_CopyInherit(tPhaseBase, {
--})

phase1_1 = {
	stepInterval = 1,
	stepLimit = 10,
};
phase1_2 = {
	stepInterval = 50,
	stepLimit = 450,
};
phase1_3 = {
	stepInterval = 1,
	stepLimit = 180,
};

--------------------------------------------------------------------
tStage1 = {
	tPhases = {
		phase1_1,
		phase1_2,
		phase1_3,
	},

	rule = {
		["p0"] = 1,
		["p1"] = 2,
		["p2"] = 3,
	},
	pos = {
		{1632, 3275},
		{1660, 3241},
		{1653, 3248},
		{1660, 3241},
		{1653, 3248},
		{1648, 3244},
		{1660, 3254},
		{1634, 3271},
		{1629, 3266},
		{1634, 3271},
		{1660, 3240},
		{1661, 3243},
	},
	resetPos = {1644, 3257},
	npcMod = {
		{"Minh Gi�o Th�m T� ��a", "Minh Gi�o Th�m T�"},
		{"Thi�n �m Ph�p S� ��a", "Thi�n �m  Th�y Mo"},
		{"Thi�n �m B�i Gi�o1", "Thi�n �m B�i Gi�o", 10},
		{"yinbaoxiang", "R��ng B�c", 180},
		{"tongbaoxiang", "R��ng ��ng", 180},

		{"Thi�n Qu�n ��a", "Thi�n Qu�n", },
		{"V�n M� ��a", "V�n M�", },

		{"Nam Cung V�n V�n ��a", "Nam Cung V�n V�n"},
		{"Nam Cung T� Quy�n ��a", "Nam Cung T� Quy�n"},

		{"L�m Xung ��a","B�o T� ��u L�m Xung"},

		{"Li�u Hi�n ��a", "Nga My Li�u Hi�n"},
		{"L�u Nh� Phong ��a", "V� �ang L�u Nh� Phong"},
		--{"����Ǯ", "����������", 180},
	},
}

--------------------------------------------------------------------
function tStage1:onInit()
	stageAction("p0");
	tStageBase:onInit();
end

function tStage1:createChar(nId)
	local npcMod = self.npcMod[nId];
	if not npcMod then
		print(format("[phase1_2:createChar] [error id] [id = %s]", tostring(nId)));
		return
	end
	local npcIdx = CreateNpc(npcMod[1], npcMod[2], self:GetPos(nId));
	SetNpcScript(npcIdx, g_theMS.fileName);
	if npcMod[3] then
		SetNpcLifeTime(npcIdx, npcMod[3]);
	end
	SetCampToNpc(npcIdx, CampEnemy);
	return npcIdx;
end

function tStage1:GetPos(n)
	local pos = self.pos[n];
	return g_theMS:GetMissionV(MV_MAP_ID), pos[1], pos[2];
end

function tStage1:onTimerOver()
	g_theMS:Close()
end
tStage1.rule["timerover"] = tStage1.onTimerOver;

function tStage1:giveAward(nNpcIdx, nBossCount)
	local m, x, y = GetNpcWorldPos(nNpcIdx);
	--����ʥ����3��
	for i = 1, 4 do
		create_box_yin(m,x,y,1)
--		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--		local npcMod = self.npcMod[4];
--		local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--		if npcMod[3] then
--			SetNpcLifeTime(npc, npcMod[3]);
--		end
--		SetNpcScript(npc, g_theMS.Box2);
--		AddUnitStates(npc, 3, 99 - GetUnitCurStates(npc))
	end
	create_box_tong(nNpcIdx, 1) --���������ͭ����
	--��������1��
--	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--	local npcMod = self.npcMod[5];
--	local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--	if npcMod[3] then
--		SetNpcLifeTime(npc, npcMod[3]);
--	end
--	SetNpcScript(npc, g_theMS.Box1);
--	--����������
--	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--	local npcMod = self.npcMod[13];
--	local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--	if npcMod[3] then
--		SetNpcLifeTime(npc, npcMod[3]);
--	end
--	SetNpcScript(npc, g_theMS.Box4);
	--���飺�ȼ���ƽ��*40
	g_theMS.msCamp[1]:turnPlayer(
--		function ()
--		local lv = GetLevel();
--		local nExp = lv * lv * 40;
--		local nBossCount = GetTask(TASKID_DIXUANGONG_DAILY_BOSS1) + 1;
--		SetTask(TASKID_DIXUANGONG_DAILY_BOSS1, nBossCount, TASK_ACCESS_CODE_DXG_MISSION);
--		gf_Modify("Exp", nExp);
--		end
		giveStageExpAward
	)
	--���⽱������������1��������ȼ���ƽ��*30
	local nFlag = GetMissionV(MV_L1_SPE_FLAG);
	local nLv = floor(nFlag / 10);
	nFlag = mod(nFlag, 10);
	if nFlag > 0 then
		g_theMS.msCamp[1]:turnPlayer(function ()
			local level = GetLevel();
			local nExp = floor(level * level * 30 / 2 * %nFlag);
			ModifyExp(nExp);
			local msg = {
				"��nh b�i Thi�n Qu�n, V�n M�, s� nh�n ���c ph�n th��ng %d �i�m kinh nghi�m v��t m�c.",
				"��nh b�i Tuy�t Tr�n Song Hi�p, s� nh�n ���c ph�n th��ng %d �i�m kinh nghi�m v��t m�c.",
				"H� gi� L�m Xung, s� nh�n ���c ph�n th��ng %d �i�m kinh nghi�m v��t m�c.",
			}
			msg = msg[%nLv];
			Msg2Player(format(msg, nExp));
		end)
	else
		local msg = {
			"Kh�ng th� ��nh b�i Thi�n Qu�n V�n M� kh�ng c� ph�n th��ng v��t m�c.",
			"Kh�ng th� ��nh b�i Tuy�t Tr�n Song Hi�p kh�ng c� ph�n th��ng v��t m�c.",
			"Kh�ng th� h� gi� L�m Xung kh�ng c� ph�n th��ng v��t m�c.",
		}
		msg = msg[nLv];
		g_theMS:Msg2MSAll(msg);
	end
	g_theMS.msCamp[1]:turnPlayer(qht_raid_dxg_13);
	g_theMS.msCamp[1]:turnPlayer(aw_dxg_award, 0);
	Observer:onTeamEvent(SYSEVENT_DIXUANGONG_STAGE_FINISH, 1)
end

function tStage1:event1()
	local npc = findNpc("Thi�n �m  Th�y Mo");
	NpcChat(npc, "Nh�t chi xuy�n v�n ti�n, Thi�n Qu�n V�n M� ��n ngh�nh chi�n n�o!");
	local npc1 = self:createChar(7);
	NpcChat(npc1, "Ai ��nh huynh �� c�a ta!");
	local npc2 = self:createChar(6);
	NpcChat(npc2, "L� ai h�, c� ph�i ng��i kh�ng h� ?");
	g_theMS:Msg2MSAll("Qu�n ��ch ti�p vi�n, tr��c khi qua �i ph�i ti�u di�t h�t Thi�n Qu�n V�n M� s� c� ph�n th��ng v��t m�c");
	SetMissionV(MV_L1_SPE_FLAG, 10);
end
function tStage1:event2()
	local npc = findNpc("Thi�n �m  Th�y Mo");
	NpcChat(npc, "H�? ! Th�m t� n�i qu� nhi�n kh�ng sai, hai c� g�i m�c b�ch y b�n kia r�t tuy�t v�i ta, h�y h�y! ");
	local npc1 = self:createChar(8);
	NpcChat(npc1, "T� T� �, c�i l�o gi� th�i ch�t ti�t kia nh�n ch�ng ta nh� d�i ra r�i k�a!");
	SetCampToNpc(npc1, CampNeutral);
	local npc2 = self:createChar(9);
	SetCampToNpc(npc2, CampNeutral);
	local players = g_theMS.msCamp[1].players;
	PlayerIndex = randomin(players);
	NpcChat(npc2, format("T�n n�y %s h�nh nh� �� t�ng �c hi�p ch�ng ta ��y! L�n n�y ta nh�t ��nh b�o th�!", GetName()));
	g_theMS:Msg2MSAll("Tuy�t Tr�n Song Hi�p ��n ��o lo�n, tr��c khi qua �i ��nh b�i Tuy�t Tr�n Song Hi�p s� c� ph�n th��ng v��t m�c");
	SetMissionV(MV_L1_SPE_FLAG, 20);
end
function tStage1:event3()
	local npc = findNpc("Thi�n �m  Th�y Mo");
	NpcChat(npc, "��ng l� m�t nh�n v�t k� m� anh h�ng! C�c h� l� ai �� h�?");
	local npc = self:createChar(10);
	SetCampToNpc(npc, CampPlayer);
	NpcChat(npc, "Nghe n�i n�i ��y c�n m�t v� c�ng, T�ng Ca ca ��c m�nh cho ta ��n ��y tham d�, qu� nhi�n nh� l�i ��n, ti�p chi�u ��y!");
	g_theMS:Msg2MSAll("L�m Xung ��n t��ng tr�, h� gi� L�m Xung s� c� ph�n th��ng v��t m�c");
	SetMissionV(MV_L1_SPE_FLAG, 32);
end

-------�ȴ������׶�------------------------------------------------------
function phase1_1:onInit()
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS.msCamp[1]:turnPlayer(StartTimeGuage,"Thanh tr��t th�i gian", 460, 0);
--	stageAction("p1");
--	g_theMS:Msg2MSAll("��Ķ����Ѿ����������ǰ��ӳ��뱻ץ��������ͽ�Ի��ɿ����ؿ���");
end

function phase1_1:onTimer(nStep)
	if nStep > self.stepLimit then
		stageAction('p1');
		return
	end
	if nStep == 1 then
		local npc = getStage():createChar(2);
		g_NpcAI:setAI(npc, AT_SM_ATTACK);
		g_NpcAI:setWayPoint(npc, {{1644, 3257}});
		NpcChat(npc, "To gan l�o to�t, d�m ��n ��a Huy�n Cung l�m lo�n sao!");
	elseif nStep == 6 then
		local tRate = {
			{40, tStage1.event1},
			{40, tStage1.event2},
			{20, tStage1.event3},
		}
		gf_RandRate(tRate)[2](tStage1);
	end

end

function phase1_1:onTalk(npcIdx)
	if PlayerIndex ~= GetTeamMember(0) then
		return
	end
	SetMissionV(MV_DXG_ROUTE_CNT, getRouteCount())
--	SetMissionV(MV_DXG_STAGE_CNT, 1)
	local tSel = {
		"Nhanh nhanh g�i ch� c�a c�c ng��i ra ��y/#onStageAction('p1')",
		"��a Huy�n Cung n�y c� huy�n c� g� ��y/info1_1",
		"K�t th�c ��i tho�i/nothing"
	}
	Say("Minh Gi�o Th�m T�: Xin ��ng h�i ta, ta s� chi�u theo l�i c�a ng��i n�i �� l�m theo.", getn(tSel), tSel);
end
function onStageAction(szAct)
	remove_tong_box()
	remove_yin_box()
	stageAction(szAct)
end
function info1_1()
	Talk(1, "", "Thi�n �m Gi�o �� b� b�t: t�i Ti�n �i�n do m�y Thi�m �m Ph�p S� canh g�c. ��nh b�i Thi�n �m Ph�p S� s� c� c� h�i nh�n ���c R��ng Thi�n �m Th�nh V�t ho�c Thi�n �m M�t R��ng.");
end
function phase1_1:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end
function phase1_1:onNpcDeath(npcIdx)
	phase1_2:onNpcDeath(npcIdx)
end


--------ɱ�ֽ׶�-------------------------------------------------
function phase1_2:onInit()
--	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:onTimer();
	local nMapID = g_theMS:GetMissionV(MV_MAP_ID);
end

function phase1_2:onTimer(nStep)
	nStep = (nStep - 1) * self.stepInterval;
	if nStep >= self.stepLimit then
		self:finish()
		return
	end
end
function phase1_2:finish()
	g_theMS:action('missionfinish');
end

function phase1_2:onNpcDeath(npcIdx)
	g_theMS.msCamp[1]:turnPlayer(dxg_task_check_and_finish_task, 3, npcIdx);--ÿ������-ɱ��
	local npcName = GetNpcName(npcIdx);
	if npcName == "Thi�n �m  Th�y Mo" then
		ClearMapNpc(g_theMS:getMapId(), nil);
		local nBossCount = g_theMS:GetMissionV(MV_BOSS_COUNT) + 1;
		g_theMS:SetMissionV(MV_BOSS_COUNT, nBossCount);
		getStage():giveAward(npcIdx, nBossCount);
		stageAction("p2");
	elseif npcName == "Thi�n Qu�n" or npcName == "V�n M�" or npcName == "Nam Cung V�n V�n" or npcName == "Nam Cung T� Quy�n" then
		SetMissionV(MV_L1_SPE_FLAG, GetMissionV(MV_L1_SPE_FLAG) + 1);
	elseif npcName == "B�o T� ��u L�m Xung" then
		SetMissionV(MV_L1_SPE_FLAG, GetMissionV(MV_L1_SPE_FLAG) - 2);
	end
end

function phase1_2:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end

--------���ؽ���----------------------------------------------------
function phase1_3:onInit()
	--Observer:onEvent(OE_DIXUANGONG_Mission, 1);
	--ds_DXG:AddStatValue(1,3,1);
	reviveAll();
--	g_theMS.msCamp[1]:turnPlayer(sjzx_add_friendly,10);
--	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:Msg2MSAll("Tr�i qua m�t tr�n chi�n lo�n, Thi�n �m Ph�p S� �� b� c�c ng��i ��nh b�i r�i.");
	g_theMS.msCamp[1]:turnPlayer(StopTimeGuage, -1);
	for i = MV_IS_OPENED_BOX_BEGIN, MV_IS_OPENED_BOX_END do
		SetMissionV(i, 0);
	end
end

function phase1_3:onTimer(nStep)
	if nStep > self.stepLimit then
--		stageAction('missionfinish');
		return
	end
	if nStep == 1 then
		local npc = getStage():createChar(11);
		SetCampToNpc(npc, CampPlayer);
		local npc2 = getStage():createChar(12);
		SetCampToNpc(npc2, CampPlayer);
		SetNpcLifeTime(npc2, 60);
	elseif nStep == 2 then
		local npc2 = findNpc("V� �ang L�u Nh� Phong");
		NpcCommand(npc2, NPCCOMMAND.do_beatdown, 8, 3 * 18);
		NpcChat(npc2, "Mu�i Mu�i h�y nhanh tr�n �i, nhanh l�n !");
		AddUnitStates(npc2, 8, -1000);
		local npc = findNpc("Nga My Li�u Hi�n");
		SetNpcActivator(npc);
		NpcChat(npc, "Mu�i kh�ng �i, c�c t� mu�i c�n � b�n trong ��! H�t h�t.......");
		NpcCommand(npc, NPCCOMMAND.do_beatdown, 8, 3 * 18);
	elseif nStep == 5 then
		local npc2 = findNpc("V� �ang L�u Nh� Phong");
		if random(100) < 5 then
			NpcChat(npc2, "�i ~~~ta l�i �(v� sao l�i n�i ?!)");
		end
		Death(1, npc2);
	elseif nStep == 6 then
		local npc = findNpc("Nga My Li�u Hi�n");
		ChangeNpc2Talk(npc);
		NpcChat(npc, "C�c v� ��i hi�p, c�c cao th� c�a c�c ��i m�n ph�i �ang b� giam c�m trong ��a Huy�n Cung, v�n �ang ch� giang h� ��i hi�p c�u gi�p!");
		SetNpcScript(npc, g_theMS.fileName);
		g_theMS:Msg2MSAll("H�y ��i tho�i v�i Nga Mi Li�u Hi�n");
	end
end

function phase1_3:onTalk()
	local npc = GetTargetNpc();
	local tSel = {
		"Ta ��i ng��i ��n c�u ng��i/p13_gogogo",
		"Th�m d� t�nh h�nh/p13_next_info",
		"K�t th�c ��i tho�i/nothing",
	}
	if not isCaption() then
		tremove(tSel, 1);
	end
	Say("<color=green> Nga Mi Li�u Hi�n <color>: h�c hu hu, t� mu�i t�i nghi�p c�a ta~", getn(tSel), tSel);
end

function p13_next_info()
	Talk(1, "", "Trong ph�ng c� r�t nhi�u Tuy�n C�, r�t nhi�u t� mu�i ��ng m�n trong �� ch�u kh�. B�n trong c�n c� t�n cai ng�c gian �c, nhanh nhanh gi�p ch�ng t�i! N�n nh�, khi cai ng�c ch�t �i th� to�n b� c� quan s� ph�t ��ng, t�t c� c�c nh�n s� v� l�m s� b� giam c�m m� ch�t!");
end

function p13_gogogo()
	g_theMS:action("s2")
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
	setCurStage(2)
	remove_tong_box()
	remove_yin_box()
	remove_box_gold()
end

function phase1_3:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end
--------------------------------------------------------------------

tStage1 = gf_CopyInherit(tStageBase, tStage1);
