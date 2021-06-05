--------------------------------------------------------------------
-- ������
-- by windle
-- 2010-3-28 21:00
--------------------------------------------------------------------
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\npccmdhead.lua");
Include("\\settings\\static_script\\missions\\base\\tmission.lua");
Include("\\script\\lib\\itemfunctions.lua");
--Include("\\script\\������\\���ڷ�\\npc\\sjzx_head.lua");
--Include("\\script\\misc\\observer\\observer_head.lua");
--Include("\\script\\misc\\data_state\\state.lua")
--Include("\\settings\\static_script\\misc\\missionaward_head.lua")

Include("\\script\\missions\\dixuangong\\mission_head.lua")
Include("\\script\\missions\\dixuangong\\stage\\stage0.lua")
Include("\\script\\missions\\dixuangong\\stage\\stage1.lua")
Include("\\script\\missions\\dixuangong\\stage\\stage2.lua")
Include("\\script\\missions\\dixuangong\\stage\\stage3.lua")
Include("\\script\\missions\\dixuangong\\stage\\stagex.lua")
Include("\\script\\missions\\dixuangong\\stage\\stagexx.lua")

Include("\\script\\missions\\dixuangong\\npc\\box_tong.lua")
Include("\\script\\missions\\dixuangong\\npc\\box_yin.lua")
Include("\\script\\missions\\dixuangong\\npc\\box_gold.lua")

MISSION_ID = 63;
TIMER_ID = 93;

missionOption = {
	--�������
	nInitFightState = 1,	--��ʼս��״̬������Missionʱ��ս��״̬��
	szInitDeahScript = "",	--��ʼ�����ű�������Missionʱ�������ű���

	bForbidChangePK = 0,	--����ؿ�ʱ�Ƿ��ֹת��PK״̬
	bUseScrollEnable = 0,	--����ؿ�ʱ�Ƿ�����ʹ�ûسǷ�
	bForbitTrade = 0,		--����ؿ�ʱ�Ƿ��ֹ����
	bStallEnable = 0,		--����ؿ�ʱ�Ƿ������̯
	bOpenFriendliness = 0,	--����ؿ�ʱ�Ƿ�������Ӻøж�
	bDeathPunish = 0,		--����ؿ�ʱ�Ƿ��������ͷ�
	bClearMomentum = 0,		--����ؿ�ʱ�Ƿ�Ҫ���ɱ��ֵ
	bInteractiveEnable = 1,	--����ؿ�ʱ�Ƿ���������������
	bForbitTeam = 1,		--����ؿ�ʱ�Ƿ��ֹ�������
	bLeaveTeam = 0,			--����ؿ�ʱ�Ƿ�Ҫ�뿪����
	bForbitMomentum = 1,	--��������ɱ��ֵ
	bForbitSuperSkill = 0,	--��������

	--�뿪����
	nRestoreFightState = 0,	--�뿪ʱҪ�ָ���ս��״̬���뿪Missionʱ��ս��״̬��
	szRestoreDeahScript = "",	--�뿪MissionʱҪ�ҵ������ű�

	bRestoreForbidChangePK = 0,		--�뿪�ؿ�ʱ�Ƿ��ֹת��PK״̬
	bRestoreUseScrollEnable = 1,	--�뿪�ؿ�ʱ�Ƿ�����ʹ�ûسǷ�
	bRestoreForbitTrade = 0,		--�뿪�ؿ�ʱ�Ƿ��ֹ����
	bRestoreStallEnable = 0,		--�뿪�ؿ�ʱ�Ƿ������̯
	bRestoreOpenFriendliness = 1,	--�뿪�ؿ�ʱ�Ƿ�������Ӻøж�
	bRestoreDeathPunish = 1,		--�뿪�ؿ�ʱ�Ƿ��������ͷ�
	bRestoreClearMomentum = 0,		--�뿪�ؿ�ʱ�Ƿ�Ҫ���ɱ��ֵ
	bRestoreInteractiveEnable = 0,	--�뿪�ؿ�ʱ�Ƿ���������������
	bRestoreForbitTeam = 0,			--�뿪�ؿ�ʱ�Ƿ��ֹ�������
	bRestoreLeaveTeam = 0,			--�뿪�ؿ�ʱ�Ƿ�Ҫ�˶�
}

timer = gf_CopyInherit(msTimer, {
	MissionId = MISSION_ID,
	nTimerId = TIMER_ID,
})

camp1 = gf_CopyInherit(msCamp, {
	MissionId = MISSION_ID,
	CampId = 1,
	CampType = CampPlayer,
})
camp2 = gf_CopyInherit(msCamp, {
	MissionId = MISSION_ID,
	CampId = 2,
	CampType = CampEnemy,
})
camp3 = gf_CopyInherit(msCamp, {
	MissionId = MISSION_ID,
	CampId = 3,
	CampType = CampNeutral,
})

dixuangong = newMission {
	fileName = "\\script\\missions\\dixuangong\\mission.lua",
	name = "��a Huy�n Cung",
	MissionId = MISSION_ID,
	MapId = 0,
	realMapId = 427,

	stages = {
		tStage0,
		tStage1,
		tStage2,
		tStage3,
		tStageX,
		tStageXX,
	},
	msOption = missionOption,
	msTimer = timer,
	msCamp = {
		[1] = camp1,
		[2] = camp2,
		[3] = camp3,
	},
	rule = {
		["s0"] = 1,
		["s1"] = 2,
		["s2"] = 3,
		["s3"] = 4,
		["sx"] = 5,
		["so"] = 6,
	},
	entryPos = {1625, 3277},
	exitPos = {
--		{426,1517,3101},
--		{426,1649,3110},
			{500,1780,3102},
			{500,1780,3102},
	},
	Trap1 = "\\script\\missions\\dixuangong\\trap\\trap1.lua",
	Trap2 = "\\script\\missions\\dixuangong\\trap\\trap2.lua",
	Box1 = "\\script\\missions\\dixuangong\\npc\\box.lua",
	Box2 = "\\script\\missions\\dixuangong\\npc\\ibbox.lua",
	Box3 = "\\script\\missions\\dixuangong\\npc\\ibbox2.lua",
	Box4 = "\\script\\missions\\dixuangong\\npc\\box1.lua",
};
--------------------------------------------------------------------
function dixuangong:getExitPos(nCamp)
	local pos = self:GetMissionV(MV_RETURN_MAP_ID);
	if pos ~= 1 and pos ~= 2 then
		pos = 1;
	end
	return gf_UnPack(self.exitPos[pos]);
end

function dixuangong:missionfinish()
	self:SetMissionV(MV_MISSION_STATUS, 1);
	self:Close();
end

function dixuangong:init()
	self.rule["missionfinish"] = self.missionfinish;
	self.msTimer.MissionId = self.MissionId;
	for i = 1, getn(self.msCamp) do
		self.msCamp[i].MissionId = self.MissionId;
	end
end

function dixuangong:beforeLeave()
	tStageX:CleanGodState();
end

dixuangong:init()
--------------------------------------------------------------------

function createMission(bTianJiaolingMode)
	self = dixuangong;
	
	if join_consume(bTianJiaolingMode,1) ~= 1 then
		return
	end
	
	local nMapId = self:Open();
	if not nMapId or nMapId <= 0 then
		return
	end
	self:TeamJoin(nMapId);

	self:setSubWorld(nMapId);
	local pos = 2;
	if GetTask(TASK_GT_WENSHI_FRIENDLY) > 0 then
		pos = 1;
	end
	self:SetMissionV(MV_RETURN_MAP_ID, pos);
	if 1 == bTianJiaolingMode then
		tStage0_speEnter()--����ģʽ
	end
	self:resetSubWorld();
	--ͳ�Ƹ�����������
	AddRuntimeStat(1,1,bTianJiaolingMode,1);
	--�μ�������ͳ��
	AddRuntimeStat(1,2,0,gf_GetTeamSize());
	--����ʱ80-89����
	AddRuntimeStat(1,4,0,gf_GetTeamPlayerCountByLevel(80,90));
	--����ʱ90-99����
	AddRuntimeStat(1,5,0,gf_GetTeamPlayerCountByLevel(90,100));
	--ת������ͳ��
	AddRuntimeStat(1,6,0,gf_GetTeamRebornPlayerCount());
	--��������ͳ��
	local oldPlayerIndex = PlayerIndex;
	for i = 1, gf_GetTeamSize() do
		PlayerIndex = gf_GetTeamMember(i);
		AddRuntimeStat(1,15,GetPlayerRoute(),1);
	end
	PlayerIndex = oldPlayerIndex;
	--cdkey�
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Raid_Set(4)");	
	end);
end

-------------------------------------------------------------
function ChangeNpc2Talk(npc)
	AddUnitStates(npc, 7, 0);
	ChangeNpcToFight(npc, 0, 6);
end

function ChangeNpc2Fight(npc)
	AddUnitStates(npc, 7, 2);
	ChangeNpcToFight(npc, 2, 0);
end

function findNpc(npcName)
	local tNpcs = GetMapNpcIdx(g_theMS:getMapId());
	for i = 1, getn(tNpcs) do
		local npc = tNpcs[i];
		if GetNpcName(npc) == npcName then
			return npc;
		end
	end
end
function findAllNpc(npcName)
	local npcs = {}
	local tNpcs = GetMapNpcIdx(g_theMS:getMapId());
	for i = 1, getn(tNpcs) do
		local npc = tNpcs[i];
		if GetNpcName(npc) == npcName then
			tinsert(npcs, npc);
		end
	end
	npcs.n = nil;
	return npcs;
end

function randomin(t)
	if getn(t) < 1 then return end
	return t[random(1, getn(t))];
end

function isCaption()
	if PlayerIndex == GetTeamMember(0) then
		return 1;
	end
end

function reviveAll()
	g_theMS.msCamp[1]:turnPlayer(function ()
		if IsPlayerDeath() ~= 0 or GetLife() <= 1 then
			RevivePlayer(0);
		end
	end)
end
