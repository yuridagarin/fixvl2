Include("\\script\\function\\vip_card\\vc_head.lua")
Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

--��6�أ������л�
-----------------------------------------------------------------
tStage06 = {
	name = "Kh�ng Long H�u H�i",
	nStageId = 6,
	maxsecond = 120 * 60,
	actionsType = "second",
};
tStage06 = inherit(cycPhase, tStage06);

function tStage06:onTimeout()
	local self = tStage06;
	this:Msg2MSAll(format("%d ph�t sau ch�a ho�n th�nh [%s], �i s� ��ng l�i!", tStage06.maxsecond / 60, tStage06.name));
	TY_CloseMission();
end

-----------------------------------------------------------------
tStage06_1 = {
	name = "H�ng Long H�u H�i-Khu chu�n b�",
	nStageId = TOTAL_STAGE + tStage06.nStageId*3 + 1,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "H�ng Long H�u H�i-Khu chu�n b�",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage06_1:CreateNpcs()
	local self = tStage06_1;
	local nMgyIdx = TY_CreateNpc(tNpcs.mgy_2, tNpcPos.mgy[7][1]);
	local nYzbIdx = TY_CreateNpc(tNpcs.yzb_2, tNpcPos.yzb[7][1]);
	local nJjgIdx = TY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1]);
	TY_SetNpcType2Talk(nMgyIdx);
	TY_SetNpcType2Talk(nYzbIdx);
end

function tStage06_1:BeginFight()
	local self = tStage06_1;
	self:onFinish();
	local nDifType = GetMissionV(this.mv_02);
	if nDifType == eDifType.NORMAL then
		AddRuntimeStat(18, 16, 0, 1);
	elseif nDifType == eDifType.HARD then
		AddRuntimeStat(18, 28, 0, 1);
	end
end

function tStage06_1:CheatMode()
	local self = tStage06_1;
	if GetItemCount(TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4]) < 1 then
		Talk(1, "", "<color=green>M�c Qu� Anh<color>: Tr�n ng��i b�n"..TYT_IB_ITEM[1].."Kh�ng ��.");
		return 0;
	end
	if 1 ~= DelItem(TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4], 1) then return 0; end
	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4], 1})
	SetMissionV(this.mv_03, 1);
	AddRuntimeStat(18, 5, GetMissionV(2)-1, 1);
	AddRuntimeStat(18, 35, 0, 1);
	self:BeginFight();
end

function tStage06_1:NpcMain()
	local nNpcIdx = GetTargetNpc();
	if not TY_IsCaptain() or GetNpcName(nNpcIdx) ~= tNpcs.mgy_2[2] then return 0; end
	
	if not tStage06_1.sel_NORMAL then
		tStage06_1.sel_NORMAL = {
			"M� �i 3: H�ng Long H�u H�i/#tStage06_1.BeginFight()",
			"H�nh th�c sao ch�p (C�n "..TYT_IB_ITEM[1].."*1)/#tStage06_1.CheatMode()",
			"Ta mu�n r�i kh�i �i/TY_ConfirmClose",
			"H�y b�/nothing",
		};
	end
	
	if not tStage06_1.sel_HARD then
		tStage06_1.sel_HARD = {
			"M� �i 3: H�ng Long H�u H�i/#tStage06_1.BeginFight()",
			"Ta mu�n r�i kh�i �i/TY_ConfirmClose",
			"H�y b�/nothing",
		};
	end
	
	local strTab = tStage06_1.sel_HARD;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		strTab = tStage06_1.sel_NORMAL;
	end
	Say("<color=green>M�c Qu� Anh<color>: ��i hi�p �� s�n s�ng ch�a?", getn(strTab), strTab);
end

function tStage06_1:onTimeout()
	this:Msg2MSAll("��i tr��ng thao t�c qu� gi�, �i �� ��ng l�i.");
	TY_ReviveAll(0);
	TY_CloseMission();
end

function tStage06_1:Init()
	local self = tStage06_1;
	
	SetMissionV(MV_STAGE, self.father.nStageId);
	SetMissionV(this.mv_22, 0);
	SetMissionV(this.mv_03, 0);
	TY_ClearColdDown();
	self:CreateNpcs();
	this.msCamp:turnPlayer(0, TY_SetPlayerPos, tPlayerPos[self.father.nStageId][1]);
	this.msCamp:turnPlayer(0, function() HeadMsg2Player("��i tr��ng v� M�c Qu� Anh ��i tho�i �� ti�p t�c �i!") end);
end

function tStage06_1:OnPlayerDeath()
	local self = tStage06_1;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

tStage06_1 = inherit(cycPhase, tStage06_1);

tStage06_1.actions = {
	[1] = {
		[0] = {tStage06_1.Init, },
	},
};

tStage06_1.triggers = {
	Talk = {
		{action = tStage06_1.NpcMain},
	},
	PlayerDeath = {
		{action = tStage06_1.OnPlayerDeath},
	},
};

--�����л�-����
-------------------------------------------------------------------
tStage06_2 = {
	name = "Kh�ng Long H�u H�i",
	nStageId = TOTAL_STAGE + tStage06.nStageId*3 + 2,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "Kh�ng Long H�u H�i",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage06_2:OnTrap(nTrapId)
	local self = tStage06_2;
	if GetMissionV(this.mv_22) ~= 2 then
		return 0;
	end
	if 1 == nTrapId then
		local nMapId, x, y = GetWorldPos();
		local nLastTime = GetTask(TASKID_TAIYITA_TIME);
		local nNowTime = GetTime();
		if nNowTime - nLastTime > 5 then
			local tDsyh = tNpcs.dsyh;
			if eDifType.NORMAL == GetMissionV(this.mv_02) then
				tDsyh = tNpcs.dsyh_1;
			end
			for i = 1, 3 do
				nNpcIdx = CreateNpc(tDsyh[1], tDsyh[2], nMapId, x, y, -1, 1, 1, 10);
				SetNpcScript(nNpcIdx, thisFile);
			end
			SetTask(TASKID_TAIYITA_TIME, nNowTime);
		end
	end
end

function tStage06_2:CreateNpcs()
	local self = tStage06_2;
	local nYlfhIdx = 0;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nYlfhIdx = TY_CreateNpc(tNpcs.ylfh_1, tNpcPos.ylfh[7][1]);
	else
		nYlfhIdx = TY_CreateNpc(tNpcs.ylfh, tNpcPos.ylfh[7][1]);
	end
	CastState2Npc(nYlfhIdx, "state_attack_trans", 50, 5*60*18);
	TY_SetNpcType2Talk(nYlfhIdx);
end

function tStage06_2:Init()
	local self = tStage06_2;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		--ds_TYT:AddStatValue(1, tDataStateList.taiyita_easy_open_3, 1);
	else
		--ds_TYT:AddStatValue(1, tDataStateList.taiyita_hard_open_3, 1);
	end
	SetMissionV(this.mv_20, 1);
	SetMissionV(this.mv_21, 1);
	SetMissionV(this.mv_22, 1);	--0:δ�����ؿ� 1:����ǰϷ�Ի� 2:��ʼս�� 3:�����Ի�
	SetMissionV(this.mv_23, 0);
	SetMissionV(this.mv_24, 5);	--����1����ʱ
	SetMissionV(this.mv_25, 0);	--����2����ʱ
	SetMissionV(this.mv_26, 0);
	SetMissionV(this.mv_30, 0);	--�Ƿ����ڶ��׶�
	SetMissionV(this.mv_31, 1);	--����ˢ�µ���ʱ
	SetMissionV(this.mv_32, 1);	--����ˢ��˳��idx
	SetMissionV(this.mv_33, 0);	--�Ƿ��������׶�
	self:CreateNpcs();
	if 1 == GetMissionV(this.mv_03) then this.msCamp:turnPlayer(0, TY_AddGodState); end
	if not self.tFirePoints then
		self.tFirePoints = {{1648,3477},{1657,3485},{1670,3495},{1679,3502},{1672,3516},{1660,3526},{1640,3537},{1633,3529},{1622,3519},{1610,3511},{1622,3492},{1636,3477},{1640,3492},{1632,3504},{1634,3516},{1650,3523},{1622,3500},{1623,3507},{1630,3485},{1645,3514},{1628,3498},{1673,3474},{1674,3497},};
	end
	
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_2[2]);
	if 0 ~= nMgyIdx and 0 ~= nYzbIdx then
		SetNpcDir(nMgyIdx, 36);
		SetNpcDir(nYzbIdx, 34);
	end
	TY_AddAttackState();
	TY_ClearDamagePoint();
end

function tStage06_2:OnNpcDeath(event, data)
	local self = tStage06_2;
	local szName = GetNpcName(data[1]);
	RemoveNpc(data[1]);
	if szName == tNpcs.ylfh[2] then
		self:StagePassed();
	end
end

function tStage06_2:OnBossStage1()	--BOSS �׶�һ[0.65]
	local self = tStage06_2;
	local nYlfhIdx = TY_FindNpc(tNpcs.ylfh[2]);
	if 0 == nYlfhIdx then return 0; end
	
	if 0 == GetMissionV(this.mv_24) then	--20���ͷ�һ��
		SetMissionV(this.mv_24, 10);
		local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
		NpcChat(nMgyIdx, "H�y ch� � tr�nh n� Ho�nh T�o Thi�n Qu�n c�a Gia Lu�t Phi H�ng!");
		this:Msg2MSAll("H�y ch� � tr�nh n� Ho�nh T�o Thi�n Qu�n c�a Gia Lu�t Phi H�ng!");
		
		local nMapId, x, y = GetNpcWorldPos(nYlfhIdx);
		local nPlayerIndex = TY_FindRandomPlayer({x, y});
		CastState2Npc(nYlfhIdx, "state_fetter", 1, 4*18);
		local nOldPlayerIndex = PlayerIndex;
		PlayerIndex = nPlayerIndex;
		nMapId, x, y = GetWorldPos();
		if eDifType.NORMAL == GetMissionV(this.mv_02) then		--��ɨǧ��
			DoSkill2Target(nYlfhIdx, 1680, 2, PIdx2NpcIdx(nPlayerIndex));
		else
			DoSkill2Target(nYlfhIdx, 1680, 1, PIdx2NpcIdx(nPlayerIndex));
		end
		PlayerIndex = nOldPlayerIndex;
		NpcCommand(nYlfhIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536+1756);	--����ǹ
		
		this.msCamp:turnPlayer(0, function() HeadMsg2Player("Gia Lu�t Phi H�ng �ang thi tri�n Ho�nh T�o Thi�n Qu�n") end);
	end
	
	if GetMissionV(this.mv_24) >= 0 then
		SetMissionV(this.mv_24, GetMissionV(this.mv_24) - 1);
	end
	if GetMissionV(this.mv_25) >= 0 then
		SetMissionV(this.mv_25, GetMissionV(this.mv_25) - 1);
	end
end

function tStage06_2:OnBossStage2()	--BOSS �׶�һ[0.35]
	local self = tStage06_2;
	
	local nYlfhIdx = TY_FindNpc(tNpcs.ylfh[2]);
	if 0 == nYlfhIdx then return 0; end
	
	if 0 == GetMissionV(this.mv_30) then
		SetMissionV(this.mv_30, 1);
		SetMissionV(this.mv_32, 1);
		SetNpcPos(nYlfhIdx, 1648, 3502);
		CastState2Npc(nYlfhIdx, "state_fetter", 1, 10 * 60 * 18, 0, 10013);
		local nMapId = this.msPosition:getMapID();
		local nNpcIdx = CreateNpc("TYT_HYLFHshadow", "Gia Lu�t Phi H�ng (�nh)", nMapId, 1659, 3508);
		SetNpcScript(nNpcIdx, thisFile);
		CastState2Npc(nNpcIdx, "state_fetter", 1, 10 * 60 * 18, 0, 10013);
		
		local nMaxLife1, _  = GetUnitBaseStates(nYlfhIdx, 1);
		local _, nCurLife1	= GetUnitCurStates(nYlfhIdx, 1);
		local nMaxLife2, _  = GetUnitBaseStates(nNpcIdx, 1);
		local fPercent = nCurLife1 / nMaxLife1;
		ModifyNpcData(nNpcIdx, 0, floor(nMaxLife2*fPercent), 0);
		
		local nMapId = this.msPosition:getMapID();
		if not self.tRandList then self.tRandList = {}; end
		if not self.tRandList[nMapId] then
			self.tRandList[nMapId] = floyd_rm4n(getn(self.tFirePoints), getn(self.tFirePoints));
		end
	end
	local nYlfhsyIdx = TY_FindNpc("Gia Lu�t Phi H�ng (�nh)");
	if 0 ~= nYlfhsyIdx then
		local nMaxLife1, _  = GetUnitBaseStates(nYlfhIdx, 1);
		local _, nCurLife1	= GetUnitCurStates(nYlfhIdx, 1);
		local nMaxLife2, _  = GetUnitBaseStates(nYlfhsyIdx, 1);
		local _, nCurLife2	= GetUnitCurStates(nYlfhsyIdx, 1);
		
		local fAvg = (nCurLife1 / nMaxLife1 + nCurLife2 / nMaxLife2) / 2.0;
		
		ModifyNpcData(nYlfhIdx, 0, floor(nMaxLife1*fAvg), 0);
		ModifyNpcData(nYlfhsyIdx, 0, floor(nMaxLife2*fAvg), 0);
	end
	
	if 0 == GetMissionV(this.mv_26) then	--�����Ӱ10sһ��
		SetMissionV(this.mv_26, 3);
		--���߼����޸�Ϊ���ʩ�ż���7��20%���ͼ���8
		if not self.tSkillList_NORMAL then
			self.tSkillList_NORMAL = {
				{0.2, 1777, 2}, {0.2, 1771, 2}, {0.3, 1772, 2}, {0.3, 1773, 2},
			};
		end
		if not self.tSkillList_HARD then
			self.tSkillList_HARD = {
				{0.2, 1777, 1}, {0.2, 1771, 1}, {0.3, 1772, 1},{0.3, 1773, 2},
			};
		end
		
		local nMapId, x, y = GetNpcWorldPos(nYlfhIdx);
		local nRand = random(1, 100000);
		local tSkillList = self.tSkillList_HARD;
		if eDifType.NORMAL == GetMissionV(this.mv_02) then
			tSkillList = self.tSkillList_NORMAL;
		end
		
		for i = 1, getn(tSkillList) do
			nRand = nRand - tSkillList[i][1] * 100000;
			if nRand <= 0 then
				NpcCommand(nYlfhIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*tSkillList[i][3]+tSkillList[i][2]);
				break;
			end
		end
	end
	if 0 == GetMissionV(this.mv_31) then	--���һ��15sһ��
		SetMissionV(this.mv_31, 6);
		
		local nIdx = GetMissionV(this.mv_32);
		local nMapId = this.msPosition:getMapID();
		if self.tRandList and self.tRandList[nMapId] and nIdx <= getn(self.tRandList[nMapId]) then
			nIdx = self.tRandList[nMapId][nIdx];
			local x, y = self.tFirePoints[nIdx][1], self.tFirePoints[nIdx][2];
			SetMissionV(this.mv_32, nIdx + 1);
			local nNpcIdx = CreateNpc("TYT_YLfire", "Li�t H�a", nMapId, x, y);
			if 0 ~= nNpcIdx then
				CastState2Npc(nNpcIdx, "state_dispear", 100, 60*60*18);
				SetCurrentNpcSFX(nNpcIdx, 991, 1, 1);
			end
			local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
			NpcChat(nMgyIdx, "H�y mau tr�nh nh�ng ng�n l�a � d��i ��t!");
			this:Msg2MSAll("H�y mau tr�nh nh�ng ng�n l�a � d��i ��t!");
		end
	end
	if GetMissionV(this.mv_31) >= 0 then
		SetMissionV(this.mv_31, GetMissionV(this.mv_31) - 1);
	end
	if GetMissionV(this.mv_26) >= 0 then
		SetMissionV(this.mv_26, GetMissionV(this.mv_26) - 1);
	end
end

function tStage06_2:OnBossStage3()	--BOSS �׶�һ[0]
	local self = tStage06_2;
	if 0 == GetMissionV(this.mv_33) then
		local nYlfhIdx = TY_FindNpc(tNpcs.ylfh[2]);
		SetMissionV(this.mv_33, 1);
		SetMissionV(this.mv_32, 1);
		SetMissionV(this.mv_24, 10);
		SetMissionV(this.mv_25, 13);
		RemoveStateFromNpc(nYlfhIdx, 10013);
		local nYlfhsyIdx = TY_FindNpc("Gia Lu�t Phi H�ng (�nh)");
		if 0 ~= nYlfhsyIdx then RemoveNpc(nYlfhsyIdx); end
		TY_ClearNpc("Li�t H�a");
		
		if not self.tFirePoints_1 then
			self.tFirePoints_1 = {{1648,3477},{1657,3485},{1670,3495},{1679,3502},{1672,3516},{1660,3526},{1640,3537},{1633,3529},{1622,3519},{1610,3511},{1622,3492},{1636,3477},{1640,3492},{1632,3504},{1634,3516},{1650,3523},{1622,3500},{1623,3507},{1630,3485},{1645,3514},{1628,3498},{1673,3474},{1674,3497},};
		end
		local nMapId = this.msPosition:getMapID();
		if not self.tRandList then self.tRandList = {}; end
		if not self.tRandList[nMapId] then
			self.tRandList[nMapId] = floyd_rm4n(getn(self.tFirePoints_1), getn(self.tFirePoints_1));
		end
	end
	if 0 == GetMissionV(this.mv_24) then			--20���ͷź�ɨǧ��������ǹ
		SetMissionV(this.mv_24, 10);
		local nYlfhIdx = TY_FindNpc(tNpcs.ylfh[2]);
		local nMapId, x, y = GetNpcWorldPos(nYlfhIdx);
		local nPlayerIndex = TY_FindRandomPlayer({x, y});
		CastState2Npc(nYlfhIdx, "state_fetter", 1, 4*18);
		local nOldPlayerIndex = PlayerIndex;
		PlayerIndex = nPlayerIndex;
		nMapId, x, y = GetWorldPos();
		if eDifType.NORMAL == GetMissionV(this.mv_02) then		--��ɨǧ��
			DoSkill2Target(nYlfhIdx, 1680, 2, PIdx2NpcIdx(nPlayerIndex));
		else
			DoSkill2Target(nYlfhIdx, 1680, 1, PIdx2NpcIdx(nPlayerIndex));
		end
		NpcCommand(nYlfhIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536+1756);	--����ǹ
		PlayerIndex = nOldPlayerIndex;
	end
	
	if 0 == GetMissionV(this.mv_25) then
		SetMissionV(this.mv_25, 6);
		local nIdx = GetMissionV(this.mv_32);
		local nMapId = this.msPosition:getMapID();
		if self.tRandList and self.tRandList[nMapId] and nIdx <= getn(self.tRandList[nMapId]) then
			SetMissionV(this.mv_32, nIdx + 1);
			nIdx = self.tRandList[nMapId][nIdx];
			local x, y = self.tFirePoints_1[nIdx][1], self.tFirePoints_1[nIdx][2];
			local nNpcIdx = CreateNpc("TYT_YLfire", "Li�t H�a", nMapId, x, y);
			if 0 ~= nNpcIdx then
				CastState2Npc(nNpcIdx, "state_dispear", 100, 60*60*18);
				SetCurrentNpcSFX(nNpcIdx, 991, 1, 1);
			end
			local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
			NpcChat(nMgyIdx, "H�y mau tr�nh nh�ng ng�n l�a � d��i ��t!");
			this:Msg2MSAll("H�y mau tr�nh nh�ng ng�n l�a � d��i ��t!");
		end
	end
	
	if GetMissionV(this.mv_24) >= 0 then
		SetMissionV(this.mv_24, GetMissionV(this.mv_24) - 1);
	end
	
	if GetMissionV(this.mv_25) >= 0 then
		SetMissionV(this.mv_25, GetMissionV(this.mv_25) - 1);
	end
end

function tStage06_2:DoSkill()
	if GetMissionV(this.mv_22) ~= 2 then
		return 0;
	end
	local self = tStage06_2;
	local nYlfhIdx = TY_FindNpc(tNpcs.ylfh[2]);
	if 0 == nYlfhIdx then return 0; end
	
	local nMaxLife, nCurLife = GetUnitCurStates(nYlfhIdx, 1);
	local fPercent = nCurLife / nMaxLife;
	if not self.tEventList then
		self.tEventList = {
			{0.65, self.OnBossStage1}, {0.35, self.OnBossStage2}, {0, self.OnBossStage3},
		};
	end
	
	for i = 1, getn(self.tEventList) do
		if fPercent > self.tEventList[i][1] then
			self.tEventList[i][2]();
			break;
		end
	end
end

function tStage06_2:StagePassed()
	local self = tStage06_2;
	local nDifType = GetMissionV(this.mv_02);
	if nDifType == eDifType.NORMAL then
		AddRuntimeStat(18, 17, 0, 1);
		gf_TeamOperateEX(function ()
			AddRuntimeStat(18, 41, GetPlayerRoute(), 1);		
		end);
		--��̫ͨһ��ȫͨ vipcard
		this.msCamp:turnPlayer(0, _vc_TYT_AllPass, 0);
	elseif nDifType == eDifType.HARD then
		AddRuntimeStat(18, 29, 0, 1);
		gf_TeamOperateEX(function ()
			AddRuntimeStat(18, 43, GetPlayerRoute(), 1);		
		end);
	end
	this.msCamp:turnPlayer(0, qht_raid_tyt_46, 0); -- ǧѰ������
	TY_StagePassed(self);
	self:onFinish();
end

function tStage06_2:NpcTalk()
	if not (1 == GetMissionV(this.mv_22) or 3 == GetMissionV(this.mv_22)) then
		return 0;
	end
	local self = tStage06_2;
	local nParagraph = GetMissionV(this.mv_20);
	local nSentence = GetMissionV(this.mv_21);
	
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_2[2]);
	local nYlfhIdx	= TY_FindNpc(tNpcs.ylfh[2]);
	local tContent = {
		[1] = {
			{nYzbIdx, "Ng��i ch�nh l� Gia Lu�t Phi H�ng sao?"},
			{nYlfhIdx, "H�ng ti�u nh�n � ��u ��n m� d�m h�i h� t�n c�a b�n v��ng!"},
			{nYzbIdx, "H�! Ta l� D��ng T�n B�o, ch�u c�a Kim �ao ��i T�ng-D��ng L�nh C�ng, con c�a D��ng Di�n Chi�u! H�m nay ��n ��u �� l�y ��u c�a ng��i �� t� t� ti�n c�a nh� h� D��ng ta!"},
			{nYlfhIdx, "Ng��i d�m n�i x�ng n�i b�y tr��c m�t ta �!"},
			{-1, ""},
		},
	};
	
	if nSentence <= getn(tContent[nParagraph]) then
		if tContent[nParagraph][nSentence][1] > 0 then
			NpcChat(tContent[nParagraph][nSentence][1], tContent[nParagraph][nSentence][2]);
		else
			if nParagraph == 1 then	--��һ�ηϻ�˵��
				SetMissionV(this.mv_22, 2);	--����
				local nYlfhIdx	= TY_FindNpc(tNpcs.ylfh[2]);
				local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
				local nYzbIdx = TY_FindNpc(tNpcs.yzb_2[2]);
				TY_SetNpcType2Fight(nYzbIdx);
				TY_SetNpcType2Fight(nMgyIdx);
				TY_SetNpcType2Fight(nYlfhIdx);
				NpcChat(nMgyIdx, "Ch� �: Ph�a tr��c v� ph�a sau c�a Gia Lu�t Phi H�ng l� khu v�c v� c�ng nguy hi�m, ngo�i ra ��ng n�n ch�y ��n khu v�c h�i c�t � v�ng ven.");
				this:Msg2MSAll("Ch� �: Ph�a tr��c v� ph�a sau c�a Gia Lu�t Phi H�ng l� khu v�c v� c�ng nguy hi�m, ngo�i ra ��ng n�n ch�y ��n khu v�c h�i c�t � v�ng ven.");
--				if eDifType.NORMAL == GetMissionV(this.mv_02) then
--					TY_SupplyNpc(self.nStageId);
--				end
			end
		end
		
		SetMissionV(this.mv_21, GetMissionV(this.mv_21) + 1);
	end
end

function tStage06_2:onTimeout()
	local self = tStage06_2;
	TY_RecordDamagePoint()
	this:Msg2MSAll("V��t �i th�t b�i!");
	TY_GoToStage(self, self.father, 1);
end

function tStage06_2:OnPlayerDeath(event, data)
	local self = tStage06_2;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

tStage06_2 = inherit(cycPhase, tStage06_2);

tStage06_2.actions = {
	[1] = tStage06_2.Init,
};

tStage06_2.cycActions = {
	[1] = {
		[0] = {tStage06_2.DoSkill},
	},
	[2] = {
		[0] = {tStage06_2.NpcTalk, },
	},
};

tStage06_2.triggers = {
	NpcDeath = {
		{action = tStage06_2.OnNpcDeath},
	},
	PlayerDeath = {
		{action = tStage06_2.OnPlayerDeath},
	},
};

--����
-----------------------------------------------------------------
tStage06_3 = {
	name = "K�t th�c",
	nStageId = TOTAL_STAGE + tStage06.nStageId*3 + 3,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "Khu k�t th�c",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage06_3:CreateNpcs()
	local nMgyIdx = TY_CreateNpc(tNpcs.mgy_1, tNpcPos.mgy[7][2]);
	SetNpcDir(nMgyIdx, 55);
	local nYzbIdx = TY_CreateNpc(tNpcs.yzb_1, tNpcPos.yzb[7][2]);
	SetNpcDir(nYzbIdx, 8);
	local nJjgIdx = TY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1]);
	local nYlfhIdx = TY_CreateNpc(tNpcs.ylfh, tNpcPos.ylfh[7][2]);
	TY_SetNpcType2Talk(nYlfhIdx);
	SetNpcDir(nYlfhIdx, 35);
end

function tStage06_3:Init()
	local self = tStage06_3;
	SetMissionV(this.mv_20, 1);
	SetMissionV(this.mv_21, 1);
	SetMissionV(this.mv_22, 0);
	self:CreateNpcs();
	this.msCamp:turnPlayer(0, TY_SetPlayerPos, tPlayerPos[self.father.nStageId][2]);
end

function tStage06_3:NpcTalk()
	local self = tStage06_3;
	local nParagraph = GetMissionV(this.mv_20);
	local nSentence = GetMissionV(this.mv_21);
	
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_1[2]);
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_1[2]);
	local nYlfhIdx = TY_FindNpc(tNpcs.ylfh[2]);
	
	local tContent = {
		[1] = {
			{nYlfhIdx, "B�ch lang h�m t� ph�ch, � ki�m m�c th��ng khung."},
			{nYlfhIdx, "H�n 30 n�m sau tr�n chi�n � Nh�n M�n, D��ng huynh tr� qu�n nghi�m minh, v�n thao v� l��c, th�t khi�n Phi H�ng kh�m ph�c, r�t mu�n ���c k�t l�m tri k�, nh�ng Phi H�ng mang tr�ng tr�ch c�a n��c nh� n�n ��nh ph�i ra tay th�i."},
			{nYlfhIdx, "D��ng huynh, ng��i l� tr� c�t c�a nam tri�u nh�ng l�i b� gian th�n h�m h�i, nguy�n d�ng c�i ch�t �� ch�ng t�. N�u nh� tr��c ��y ng��i quy thu�n ��i Li�u ta th� s� kh�ng ra n�ng n�i n�y!"},
			{nYzbIdx, "Gia Lu�t Phi H�ng! Kh�ng c�n ng��i n�i nh�ng l�i gi� d�i ��! H�y mau giao n�p h�i c�t c�a Gia Gia ra ��y!"},
			{nYlfhIdx, "C�i g�? C�c ng��i ��ng h�ng c��p h�i c�t c�a D��ng huynh �i! T�n ranh con, ng��i t��ng r�ng ta s� c�c ng��i �?"},
			{tNpcs.yy[2], "D�ng... tay"},
			{nYlfhIdx, "Ch�ng l� l� D��ng huynh?"},
			{tNpcs.yy[2], "Ch�nh x�c, �� l� c� nh�n."},
			{{nYzbIdx, nMgyIdx}, "Gia Gia!"},
			{tNpcs.yy[2], "Gia Lu�t hi�n ��, l�c D��ng m� c�n s�ng �� t�ng giao ��u v�i l�n, t�n d�ng binh c�a hi�n �� th�t khi�n ta th�n ph�c. Sai khi ta m�t, �� �� xin Li�u Ch�a c�o l�o, ��n canh gi� Th�i Nh�t Th�p �� b�o v� thi th� c�a ta. Ta th�t vinh h�nh khi ���c ��i v��ng xem trong! Ta v� �� tuy thu�c hai n��c H�n Li�u, nh�ng t� l�u ta �� xem �� nh� ng��i tri k� r�i!"},
			{nYlfhIdx, "D��ng huynh! C� c�u n�i n�y c�a huynh, Gia Lu�t Phi H�ng s�ng kh�ng u�ng cu�c ��i n�y r�i!"},
			{tNpcs.yy[2], "Thanh Hoang H�a L�u Kim n�y �� theo ta chinh chi�n nhi�u n�m, hi�n nay tr�n th� gian n�y ch� duy nh�t hi�n �� x�ng ��ng v�i n�! H�m nay ta s� t�ng n� cho ��, mong �� h�y nh�n l�y!"},
			{nYlfhIdx, "�a t� D��ng huynh!"},
			{tNpcs.yy[2], "T�n B�o, Qu� Anh, c�c con ph�i s�ng cho th�t t�t, t��ng lai c�a D��ng gia s� tr�ng c�y v�o c�c con."},
			{nYlfhIdx, "M� v�n th�m t�a thanh thu m�ng, t� nguy�t h�n tinh chi�u c� nh�n. H�i c�t c�a D��ng huynh � ��y, c�c ng��i h�y c�m l�y!"},
			{-1, ""},
		},
	};
	
	if nSentence <= getn(tContent[nParagraph]) then
		local v = tContent[nParagraph][nSentence][1];
		if "number" ~= type(v) or (tContent[nParagraph][nSentence][1] > 0) then
			if "number" == type(v) then
				NpcChat(v, tContent[nParagraph][nSentence][2]);
			elseif "string" == type(v) then
				local nNpcIdx = TY_FindNpc(v);
				if 0 == nNpcIdx then
					nNpcIdx = TY_CreateNpc(tNpcs.yy, tNpcPos.yy[7][1]);
					SetNpcDir(nMgyIdx, 38);
					SetNpcDir(nYzbIdx, 32);
				end
				NpcChat(nNpcIdx, tContent[nParagraph][nSentence][2]);
			elseif "table" == type(v) then
				for i = 1, getn(v) do
					NpcChat(v[i], tContent[nParagraph][nSentence][2]);
				end
			end
		else
			local nNpcIdx = TY_FindNpc(tNpcs.yy[2]);
			RemoveNpc(nNpcIdx);
			RemoveNpc(nYlfhIdx);
			SetNpcDir(nMgyIdx, 55);
			SetNpcDir(nYzbIdx, 15);
			SetMissionV(this.mv_22, 1);
		end
		
		SetMissionV(this.mv_21, GetMissionV(this.mv_21) + 1);
	end
end

function tStage06_3:NpcMain()
	if 0 == GetMissionV(this.mv_22) then return 0; end
	local nNpcIdx = GetTargetNpc();
	if GetNpcName(nNpcIdx) == tNpcs.mgy_1[2] then
		if not TY_IsCaptain() then
			return 0;
		end
		local strTab = {
			"Ta mu�n r�i kh�i �i/TY_CloseMission",
			"H�y b�/nothing",
		};
		Say("<color=green>M�c Qu� Anh<color>: K�t th�c �i.", getn(strTab), strTab);
	end
end

function tStage06_3:OnPlayerDeath()
	local self = tStage06_3;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage06_3:onTimeout()
	this:Msg2MSAll("��i tr��ng thao t�c qu� gi�, �i �� ��ng l�i.");
	TY_ReviveAll(0);
	TY_CloseMission();
end

tStage06_3 = inherit(cycPhase, tStage06_3);

tStage06_3.actions = {
	[1] = tStage06_3.Init,
};

tStage06_3.cycActions = {
	[2] = {
		[0] = {tStage06_3.NpcTalk, },
	},
};

tStage06_3.triggers = {
	Talk = {
		{action = tStage06_3.NpcMain},
	},
	PlayerDeath = {
		{action = tStage06_3.OnPlayerDeath},
	},
};
-----------------------------------------------------------------
tStage06.phases = {tStage06_1, tStage06_2, tStage06_3};
