-- ��ʼ�ȴ��׶�
Include("\\script\\missions\\dixuangong\\daily_task.lua")

tStage0 = {
	stepInterval = 1,
	stepLimit = 120,

	pos = {
		{1644, 3257},
	},
	resetPos = {1644, 3257},
	npcMod = {
		{"Tu�n La L�u ��a", "L�u La Th�m T�"},
	},
}

--------------------------------------------------------------------
function tStage0:onInit()
	g_theMS.msTimer:setInterval(1)
end

function tStage0:createMapTrap()
	local MapId = g_theMS:getMapId();
	for i = 1, 13 do
		AddMapTrap(MapId,(1657+i)*32,(3229+i)*32, g_theMS.Trap1);
		AddMapTrap(MapId,(1656+i)*32,(3229+i)*32, g_theMS.Trap1);
	end
	for i = 1, 13 do
		AddMapTrap(MapId,(1692+i)*32,(3188+i)*32, g_theMS.Trap2);
		AddMapTrap(MapId,(1691+i)*32,(3188+i)*32, g_theMS.Trap2);
	end
end

function tStage0:createChar()
	local npcMod = self.npcMod[1];
	local npcIdx = CreateNpc(npcMod[1], npcMod[2], self:GetPos(1));
	ChangeNpc2Talk(npcIdx);
	SetNpcScript(npcIdx, g_theMS.fileName);
	return npcIdx;
end
function tStage0:GetPos(n)
	local pos = self.pos[n];
	return g_theMS:GetMissionV(MV_MAP_ID), pos[1], pos[2];
end

function tStage0:onTimer(nStep)
	if nStep == 1 then
		g_theMS:Msg2MSAll("T� ��i c�a ng��i �� �i v�o Ti�n �i�n ��a Huy�n Cung, ��i tr��ng c� th� ti�n h�nh ��i tho�i v�i Thi�n �M Gi�o L�u La c�a Tu�n La �� m� �i");
		g_theMS.msTimer:setInterval(self.stepInterval)
		g_theMS.msCamp[1]:turnPlayer(StartTimeGuage,"Th�i gian chu�n b�", self.stepInterval * self.stepLimit, 0);
		self:createMapTrap();
		local npc = self:createChar();
		NpcChat(npc, "Cung Ch� g�i ta ��n Tu�n S�n L�u, Ca Ca ta kh�ng c� th�i gian �� �i");
	end
	local stepRun = GetMissionV(MV_STEP_XX_RUN)
	if stepRun > 0 and nStep - stepRun == 5 then
		local npcIdx = findNpc("L�u La Th�m T�");
		self:onNpcDeath(npcIdx, 0);
	end
	if nStep >= self.stepLimit then
		g_theMS:action('missionfinish');
		return
	end
end

--------------------------------------------------------------------
function tStage0:onTalk()
	if PlayerIndex ~= GetTeamMember(0) then
		Talk(1, "", "H�m! H�ng ng��i nh� ng��i c�ng ��n ��y �� n�i chuy�n v�i L�o Gia ta sao! Noi th�nh ��a n�y ��m ng��i c�c ng��i c�n d�m � l�i ��y, c�n kh�ng c�t �i th� ��ng tr�ch ta ��c �c!");
		return
	end
	Say(format("<color=green> Thi�n �m Gi�o L�u La c�a Tu�n La <color>: �i ch�, %s n�y tr�ng c�ng r�t ���c ��y? �em �i cho Cung Ch� �t c� tr�ng th��ng, ha ha ha !", ((GetSex() == 1 and "Ti�u Ca") or "Ti�u T�")),
		2,
		--"������5��ͨ�������ȥ���/tStage0_speEnter",
		"C� m�t kh�ng tr�ng, ti�p chi�u ��y!/tStage0_norEnter",
		"Th�m d� tin t�c/tStage0_info");
end

function tStage0_speEnter()
--	if GetItemCount(ITEM_DXG_TONGTIANLING[1],ITEM_DXG_TONGTIANLING[2],ITEM_DXG_TONGTIANLING[3]) < 5 then
--		Msg2Player("������û��5��ͨ����");
--		return
--	end
--	if DelItem(ITEM_DXG_TONGTIANLING[1],ITEM_DXG_TONGTIANLING[2],ITEM_DXG_TONGTIANLING[3],5) ~= 1 then return end
	SetTask(TASKID_DXG_SCORE, GetTask(TASKID_DXG_SCORE) + N_JOIN_TIANJIAOLING_NEED, TASK_ACCESS_CODE_DXG_MISSION);
	g_theMS.msCamp[1]:turnPlayer(StopTimeGuage, -1);
	local npc = GetTargetNpc();
	g_theMS:Msg2MSAll("Sau khi c�c ng��i v�o Ti�n �i�n nghe l�n th�ng tin m�t c�a ��a Huy�n Cung, l�m cho Cung Ch� n�i gi�n r�i !");
	g_theMS:action("sx");
	--�ߺ��Ŵ���ͳ��
	AddRuntimeStat(1,7,0,1);
	--����������ͨ����������ͳ��
	AddRuntimeStat(1,13,0,N_JOIN_TIANJIAOLING_NEED);
	
	SetMissionV(MV_DXG_ROUTE_CNT, getRouteCount())
	setCurStage(4)
	
	g_theMS.msCamp[1]:turnPlayer(dxg_task_check_and_finish_task, 1, npcIdx);--ÿ������-123��ͨ��
end

function tStage0_norEnter()
	self = tStage0;
	local npc = GetTargetNpc();
	NpcChat(npc, "Xin l�o gia tha m�ng, ti�u nh�n kh�ng c� �! Ng��i ��u, Cung Ch� c�u t�i!");
	ChangeNpc2Fight(npc);
	g_NpcAI:setAI(npc, AT_SM_MOVE);
	local pos = {
		{1660, 3241},
	}
	g_NpcAI:setWayPoint(npc, pos);
	SetNpcDeathScript(npc, g_theMS.fileName);
	SetMissionV(MV_STEP_XX_RUN, GetMissionV(MV_TIMER_STEP));
	SetMissionV(MV_DXG_ROUTE_CNT, getRouteCount())
	setCurStage(1)
end

function tStage0_info()
	Talk(1, "", "<color=green> Thi�n �m Gi�o L�u La c�a Tu�n La <color>: Ti�u �� ng��i th�t bi�t �i�u, kh�ng gi�u g� ng��i. ��a Huy�n Cung n�y, t�ng c�ng c� 3 ph�ng, ph�ng th� nh�t luy�n ch��ng c��c, ph�ng th� 2 c� quan m�t, ph�ng th� 3 �ang l�m m�t ph�ng. Ha ha ha Ph�p S� ��i Nh�n �� cho ti�u nh�n �i ra Tu�n La");
end

function tStage0:onNpcDeath(npcIdx, nTime)
	nTime = nTime or 10
	g_theMS.msCamp[1]:turnPlayer(StopTimeGuage, -1);
	g_theMS:Msg2MSAll("Thi�n �m Gi�o L�u La c�nh b�o, Thi�n �m Ph�p S� xu�t hi�n, h�y ��nh b�i h�n.");
	g_theMS:action("s1");
	SetNpcLifeTime(npcIdx, nTime);
end

function tStage0:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end
