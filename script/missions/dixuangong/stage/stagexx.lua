--------------------------------------------------------------------
-- ������ ��3��
-- by windle
-- 2010-3-28 21:00
--------------------------------------------------------------------
Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\missions\\base\\tstage.lua");
Include("\\script\\lib\\define.lua");
--Include("\\script\\master_prentice\\master_prentice_point.lua")
Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\online\\award_head.lua")
Include("\\script\\missions\\dixuangong\\daily_task.lua")
Include("\\script\\function\\vip_card\\vc_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
--------------------------------------------------------------------
--tPhaseBase = {
--}
--
--phasexx_1 = gf_CopyInherit(tPhaseBase, {
--})

phasexx_1 = {
	stepInterval = 1,
	stepLimit = 180,
};
phasexx_2 = {
	stepInterval = 30,
	stepLimit = 600,
};
phasexx_3 = {
	stepInterval = 60,
	stepLimit = 1,
};

--------------------------------------------------------------------
tStageXX = {
	tPhases = {
		phasexx_1,
		phasexx_2,
		phasexx_3,
	},

	rule = {
		["p0"] = 1,
		["p1"] = 2,
		["p2"] = 3,
	},
	pos = {
		{1715, 3188},

		{1721, 3168},
	},
	resetPos = {1721, 3168},
	npcMod = {
		{"Minh Gi�o Th�m T� ��a", "Th�m T� Tu�n Tra"},

		{"yinbaoxiang", "R��ng B�c", 180},
		{"yinbaoxiang", "R��ng ��ng", 180},
		{"IBbaoxiang", "Thi�n �m M�t R��ng", 180},
		--{"����Ǯ", "����������", 180},
	},
	bossMod = {
		{1430, "H�ng K� Tinh ��a", "Thi�n �m S�t Th� Tinh Anh", 1},
		{1430, "H�c K� Tinh ��a", "Thi�n �m ��i Tinh Anh", 1},
		{1430, "Lam K� Tinh ��a", "Thi�n �m T�n S� Tinh Anh", 1},
		{1430, "Ho�ng K� Tinh ��a", "Thi�n �m M�t Th�m Tinh Anh", 1},
		{1430, "B�ch K� Tinh ��a",     "B�ch K� Tinh Anh", 1},
		{510 , "H�ng K� Ch� ��a", "H�ng K� Ch� H�ng Tinh", 2},
		{510 , "H�c K� Ch� ��a", "H�c K� Ch� � Mai V�", 2},
		{510 , "Lam K� Ch� ��a", "Lam K� Ch� Lam �n H�c", 2},
		{510 , "Ho�ng K� Ch� ��a",   "Ho�ng K� Ch� Ho�ng Si�u", 2},
		{510 , "B�ch K� Ch� ��a", "B�ch K� Ch� B�ch L�ng Ti�u", 2},
		{100 , "L�i Th��ng Ch� ��a", "L�i ���ng Ch� Ph��ng Ch�u", 3},
		{100 , "H�a ���ng Ch� ��a",   "H�a ���ng Ch� Ti�n Ch�ch", 3},
		{100 , "Phong ���ng Ch� ��a", "Phong ���ng Ch� Phong Tr�n", 3},
	},
	bossMod2 = {
		{1440, "H�ng K� Tinh ��a", "Thi�n �m S�t Th� Tinh Anh", 1},
		{1440, "H�c K� Tinh ��a", "Thi�n �m ��i Tinh Anh", 1},
		{1430, "Lam K� Tinh ��a", "Thi�n �m T�n S� Tinh Anh", 1},
		{1430, "Ho�ng K� Tinh ��a", "Thi�n �m M�t Th�m Tinh Anh", 1},
		{1430, "B�ch K� Tinh ��a",     "B�ch K� Tinh Anh", 1},
		{500 , "H�ng K� Ch� ��a", "H�ng K� Ch� H�ng Tinh", 2},
		{500 , "H�c K� Ch� ��a", "H�c K� Ch� � Mai V�", 2},
		{500 , "Lam K� Ch� ��a", "Lam K� Ch� Lam �n H�c", 2},
		{500 , "Ho�ng K� Ch� ��a",   "Ho�ng K� Ch� Ho�ng Si�u", 2},
		{500 , "B�ch K� Ch� ��a", "B�ch K� Ch� B�ch L�ng Ti�u", 2},
		{100 , "L�i Th��ng Ch� ��a", "L�i ���ng Ch� Ph��ng Ch�u", 3},
		{100 , "H�a ���ng Ch� ��a",   "H�a ���ng Ch� Ti�n Ch�ch", 3},
		{100 , "Phong ���ng Ch� ��a", "Phong ���ng Ch� Phong Tr�n", 3},
		{15 ,  "Uy�n Nhu V�n ��a",       "Uy�n Nhu V�n", 4},
		{15 ,  "Uy�n Thanh Nhi ��a",       "Uy�n Thanh Nhi", 4},
	},
	bossMod3 = {
		{25 ,  "Uy�n Nhu V�n ��a",       "Uy�n Nhu V�n", 4},
		{25 ,  "Uy�n Thanh Nhi ��a",       "Uy�n Thanh Nhi", 4},
	},
--	stepLimit = 600,
}

--------------------------------------------------------------------
function tStageXX:onInit()
	g_theMS.msCamp[1]:turnPlayer(SetPos,self.resetPos[1], self.resetPos[2]);
	tStageBase:onInit();
	g_theMS:SetMissionV(MV_BOSS_COUNT, 0);
	stageAction("p0");
end

function tStageXX:createChar(nId)
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

function tStageXX:createBoss()
	bossMod = self.bossMod;
--	if GetTask(TASKID_DXG_SCORE) >= 400 then
--		bossMod = self.bossMod3;
	if GetTask(TASKID_DXG_SCORE) >= 50 then
		bossMod = self.bossMod2;
	end
	local npcMod = gf_RandRate(bossMod);
	local npc = CreateNpc(npcMod[2], npcMod[3], self:GetPos(2));
	SetNpcScript(npc, g_theMS.fileName);
	SetCampToNpc(npc, CampEnemy);
	SetMissionV(MV_SP_BOSS_LV, npcMod[4]);
	if npcMod[4] == 4 then
		SetTask(TASKID_DXG_SCORE, 0, TASK_ACCESS_CODE_DXG_MISSION);
	end
	return npc;
end

function tStageXX:GetPos(n)
	local pos = self.pos[n];
	return g_theMS:GetMissionV(MV_MAP_ID), pos[1], pos[2];
end

function tStageXX:onTimerOver()
	g_theMS:Close()
end
tStageXX.rule["timerover"] = tStageXX.onTimerOver;

function tStageXX:giveAward(nNpcIdx, nBossCount)
	local bossLv = GetMissionV(MV_SP_BOSS_LV);
	local m, x, y = GetNpcWorldPos(nNpcIdx);

	local nBossCount = g_theMS:GetMissionV(MV_BOSS_COUNT);
	if nBossCount == 4 then --�ڰ˹�
		create_dxg_box_gold(nNpcIdx, 2)
	else
    	for i = 1, 4 do
    		create_box_yin(m,x,y,3+nBossCount)
--    		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--    		local npcMod = self.npcMod[2];
--    		local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--    		if npcMod[3] then
--    			SetNpcLifeTime(npc, npcMod[3]);
--    		end
--    		SetNpcScript(npc, g_theMS.Box2);
--    		AddUnitStates(npc, 3, 99 - GetUnitCurStates(npc))
    	end
	end
	create_box_tong(nNpcIdx, 3+nBossCount) --���������ͭ����
--	for i = 1, 1 do
--		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--		local npcMod = self.npcMod[3];
--		local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--		if npcMod[3] then
--			SetNpcLifeTime(npc, npcMod[3]);
--		end
--		SetNpcScript(npc, g_theMS.Box1);
--	end
	for i = 1, 1 do
		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
		local npcMod = self.npcMod[4];
		local npcName = {
			"Tinh Anh B�o R��ng",
			"Ng� K� B�o R��ng",
			"Tam ���ng B�o R��ng",
			"Ng�ng Nguy�t B�o R��ng",
		};
		npcName = npcName[bossLv];
		local npc = CreateNpc(npcMod[1], npcName, m, x2, y2);
		if npcMod[3] then
			SetNpcLifeTime(npc, npcMod[3]);
		end
		SetNpcScript(npc, g_theMS.Box3);
	end
--	--����������
--	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--	local npcMod = self.npcMod[5];
--	local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--	if npcMod[3] then
--		SetNpcLifeTime(npc, npcMod[3]);
--	end
--	SetNpcScript(npc, g_theMS.Box4);
	
	g_theMS.msCamp[1]:turnPlayer(
--		function ()
--		local lv = GetLevel();
--		local nExp = floor(lv * lv * 70 * 1.3);
--		local nBossCount = GetTask(TASKID_DIXUANGONG_DAILY_BOSS3) + 1;
--		SetTask(TASKID_DIXUANGONG_DAILY_BOSS3, nBossCount, TASK_ACCESS_CODE_DXG_MISSION);
--		gf_Modify("Exp", nExp);
--	end
		giveStageExpAward
	)
	
	g_theMS.msCamp[1]:turnPlayer(qht_raid_dxg_47);
	g_theMS.msCamp[1]:turnPlayer(aw_dxg_award, 1);
	Observer:onTeamEvent(SYSEVENT_DIXUANGONG_STAGE_FINISH, 3+nBossCount)
end

-------�ȴ������׶�------------------------------------------------------
function phasexx_1:onInit()
	reviveAll();
	g_theMS.msTimer:setInterval(self.stepInterval);
	getStage():createChar(1)
	g_theMS.msCamp[1]:turnPlayer(StartTimeGuage, "H�n ch� m� c�a �i", 180, 0)
	g_theMS:Msg2MSAll("Minh Gi�o Th�m T� d��ng nh� n�m b�t m�i th�ng tin, c� th� th�m d�!");
end

function phasexx_1:onTimer(nStep)
	if nStep >= self.stepLimit then
		g_theMS:action('missionfinish');
		return
	end
end

function phasexx_1:onTalk(npcIdx)
	local tSel = {
		"Truy t�m K� Ch� M�u (Ti�u hao 1 Thi�n Ki�u L�nh)/perStart",
		"Ki�m tra danh s�ch M� H�u Ch� S�/info_xx",
		"H�m nay ��n ��y, h�m sau ph��ng tr��ng/perEnd",
		"K�t th�c ��i tho�i/nothing",
	}
	if not isCaption() then
		tremove(tSel,3);
	end
	Say("��m Minh Gi�o Th�m T�: ��i �n b�t ng�n t�, s� t�ch c�c v� ��nh tan ��a Huy�n Cung s� ���c d�n gian truy�n t�ng! S� d�ng Th�ng Thi�n L�nh �� d�n ra c�ng nhi�u Ch� S�!", getn(tSel), tSel);
end
function info_xx()
	Talk(1, "", "Minh Gi�o Th�m T�: Danh s�ch M� H�u Ch� S� ��a Huy�n Cung d��i ��y: \n Uy�n Nhu V�n, Uy�n Thanh Nhi, L�i ���ng Ch� Ph��ng ��c Ch�u, H�a ���ng Ch� Ti�n Ch�ch, Phong ���ng Ch� Phong M�n Tr�n \n H�ng K� Ch� H�ng Tr��ng Tinh, H�c K� Ch� � Mai V�, Lam K� Ch� Lam �n H�c, Ho�ng K� Ch� Ho�ng Si�u, b�ch K� Ch� B�ch L�ng Ti�u \n Thi�n �m S�t Th� Tinh Anh, Thi�n �m Th�ch Kh�ch Tinh Anh, Thi�n �m T�n S� Tinh Anh, Thi�n �m M�t Th�m Tinh Anh, B�ch K� Tinh Anh")
end

function perStart()
	if GetMissionV(MV_SP_DAYE) ~= 0 then
		g_theMS:Msg2MSAll("Kh�ng th� m� �i ti�p theo, h�y l�y b�o r��ng tr��c");
		return
	end
	
	local nBossCount = g_theMS:GetMissionV(MV_BOSS_COUNT);
	if nBossCount >= 4 then
		Talk(1,"","C�c h� �� khi�u chi�n ho�n th�nh 4 ��a Huy�n Cung M� H�u Ch� S�, k�t th�c �i!");
		return 0;
	end
	
	SetMissionV(MV_DXG_ROUTE_CNT, getRouteCount())
	setCurStage(5 + nBossCount)

	if GetMissionV(MV_PHASE) == 1 then
		if GetItemCount(T_TIANJIAOLING[1],T_TIANJIAOLING[2],T_TIANJIAOLING[3]) < N_CALL_BOSS_TIANJIAOLING_NEED then
			Msg2Player(format("Tr�n ng��i kh�ng c� %d c�i %s",N_CALL_BOSS_TIANJIAOLING_NEED, T_TIANJIAOLING[4]));
			return
		end
		if DelItem(T_TIANJIAOLING[1],T_TIANJIAOLING[2],T_TIANJIAOLING[3],N_CALL_BOSS_TIANJIAOLING_NEED) ~= 1 then return end
		SetTask(TASKID_DXG_SCORE, GetTask(TASKID_DXG_SCORE) + N_CALL_BOSS_TIANJIAOLING_NEED, TASK_ACCESS_CODE_DXG_MISSION);
		SetMissionV(MV_SP_DAYE, PlayerIndex);
		stageAction('p1');
		for i = MV_IS_OPENED_BOX_BEGIN, MV_IS_OPENED_BOX_END do
			SetMissionV(i, 0);
		end
		
		remove_tong_box()
    	remove_yin_box()
    	remove_box_gold()
		
		--����������Ļ����ִ���ͳ��
		AddRuntimeStat(1,12,0,1);
		--����������ͨ����������ͳ��
		AddRuntimeStat(1,13,0,N_CALL_BOSS_TIANJIAOLING_NEED);
		Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {T_TIANJIAOLING[1],T_TIANJIAOLING[2],T_TIANJIAOLING[3],N_CALL_BOSS_TIANJIAOLING_NEED})
	end
end
function perEnd()
	if not isCaption() then
		Msg2Player("Ch� c� ��i tr��ng d�n d�t t� ��i r�i kh�i c�a �i");
	end
	
	if GetMissionV(MV_SP_DAYE) ~= 0 then
		perEnd_Talk();
		return
	end

	if GetMissionV(MV_PHASE) == 1 then
		g_theMS:action("missionfinish")
	end
end

function perEnd_Talk()
	Say("C�n c� b�o r��ng ch�a nh�n, c�c h� x�c nh�n k�t th�c v��t �i kh�ng?", 2, "��ng �/perEnd2", "T�i h� ch� xem qua th�i/do_nothing")
end

function perEnd2()
	if not isCaption() then
		Msg2Player("Ch� c� ��i tr��ng d�n d�t t� ��i r�i kh�i c�a �i");
	end
	
	if GetMissionV(MV_PHASE) == 1 then
		g_theMS:action("missionfinish")
	end
end

function phasexx_1:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end

--------ɱ�ֽ׶�-------------------------------------------------
function phasexx_2:onInit()
	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:onTimer();
	g_theMS.msCamp[1]:turnPlayer(StopTimeGuage,-2);
	g_theMS.msCamp[1]:turnPlayer(StartTimeGuage,"Thanh tr��t th�i gian", self.stepLimit, 0);
	getStage():createBoss();

end

function phasexx_2:onTimer(nStep)
	nStep = (nStep - 1) * self.stepInterval;
	if nStep >= self.stepLimit then
		self:finish()
		return
	end
end

function phasexx_2:finish()
	getStage():action("p2");
end

function phasexx_2:onNpcDeath(npcIdx)
	g_theMS.msCamp[1]:turnPlayer(dxg_task_check_and_finish_task, 3, npcIdx);--ÿ������-ɱ��
	local npcName = GetNpcName(npcIdx);

	local nBossCount = g_theMS:GetMissionV(MV_BOSS_COUNT) + 1;
	g_theMS:SetMissionV(MV_BOSS_COUNT, nBossCount);
	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msCamp[1]:turnPlayer(StopTimeGuage, -2);
	getStage():giveAward(npcIdx, nBossCount);

	stageAction('p0');
	
	if 4 == nBossCount then
		g_theMS.msCamp[1]:turnPlayer(dxg_task_check_and_finish_task, 2, npcIdx);--ÿ������-ȫ��ͨ��
		--ȫͨ������ͳ��
		AddRuntimeStat(1,3,0,gf_GetTeamSize());
		--ȫͨ����ͳ��
		AddRuntimeStat(1,9,0,1);
		
		--������ͨ7��
		g_theMS.msCamp[1]:turnPlayer(_vc_DXG_Pass_7, 0);
	end
end
function phasexx_2:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end

--------���ؽ���----------------------------------------------------
function phasexx_3:onInit()
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:Msg2MSAll("Qua n� l�c h�t m�nh, c�c ng��i �� v��t qua ���c ��a Huy�n Cung, ")
	g_theMS.msCamp[1]:turnPlayer(StartTimeGuage, "R�i c�a �i", 60, 0);

	for i = MV_IS_OPENED_BOX_BEGIN, MV_IS_OPENED_BOX_END do
		SetMissionV(i, 0);
	end
end

function phasexx_3:onTimer(nStep)
	g_theMS:action("missionfinish")
end

--------------------------------------------------------------------

tStageXX = gf_CopyInherit(tStageBase, tStageXX);
