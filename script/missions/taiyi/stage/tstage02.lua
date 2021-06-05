Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
--�ڶ��أ���������
-----------------------------------------------------------------
tStage02 = {
	name = "C� Th� Th�n V�n",
	nStageId = 2,
	maxsecond = 120 * 60,
	actionsType = "second",
};
tStage02 = inherit(cycPhase, tStage02);

function tStage02:onTimeout()
	local self = tStage02;
	this:Msg2MSAll(format("%d ph�t sau ch�a ho�n th�nh [%s], �i s� ��ng l�i!", tStage02.maxsecond / 60, tStage02.name));
	TY_CloseMission();
end

--�ڶ��أ���������-׼���׶�
-----------------------------------------------------------------
tStage02_1 = {
	name = "C� Th� Th�n V�n-Khu chu�n b�",
	nStageId = TOTAL_STAGE + tStage02.nStageId*3 + 1,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "C� Th� Th�n V�n-Khu chu�n b�",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage02_1:CreateNpcs()
	local self = tStage02_2;
	local nMgyIdx = TY_CreateNpc(tNpcs.mgy_2, tNpcPos.mgy[2][1]);
	local nYzbIdx = TY_CreateNpc(tNpcs.yzb_2, tNpcPos.yzb[2][1]);
	local nJjgIdx = TY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1]);
	TY_SetNpcType2Talk(nYzbIdx);
	TY_SetNpcType2Talk(nMgyIdx);
end

function tStage02_1:Init()
	local self = tStage02_1;
	SetMissionV(MV_STAGE, self.father.nStageId);
	SetMissionV(this.mv_03, 0);
	
	TY_ClearColdDown();
	self:CreateNpcs();
	this.msCamp:turnPlayer(0, TY_SetPlayerPos, tPlayerPos[self.father.nStageId][1]);
	this.msCamp:turnPlayer(0, function() HeadMsg2Player("��i tr��ng v� M�c Qu� Anh ��i tho�i �� ti�p t�c �i!") end);
end

function tStage02_1:EndStage02()
	local self = tStage02_1;
	TY_StagePassed(self);
	
	if self.guage and self.guage.id then
		this.msCamp:turnPlayer(0, StopTimeGuage, self.guage.id);
	end
	
	SetMissionV(self.father.curPhaseLv, 3);
	local tCurPhase = self.father.phases[3];
	tCurPhase:onInit(self.father);
end

function tStage02_1:OnFinish()
	local self = tStage02_1;
	self:onFinish();
	local nDifType = GetMissionV(this.mv_02);
	if nDifType == eDifType.NORMAL then
		AddRuntimeStat(18, 8, 0, 1);
	elseif nDifType == eDifType.HARD then
		AddRuntimeStat(18, 20, 0, 1);
	end
end

function tStage02_1:CheatMode()
	local self = tStage02_1;
	if GetItemCount(TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4]) < 1 then
		Talk(1, "", "<color=green>M�c Qu� Anh<color>: Tr�n ng��i b�n"..TYT_IB_ITEM[1].."Kh�ng ��.");
		return 0;
	end
	if 1 ~= DelItem(TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4], 1) then return 0; end
	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4], 1})
	SetMissionV(this.mv_03, 1);
	AddRuntimeStat(18, 31, 0, 1);
	AddRuntimeStat(18, 5, GetMissionV(2)-1, 1);

	self:OnFinish();
end

function tStage02_1:NpcMain()
	local nNpcIdx = GetTargetNpc();
	if GetNpcName(nNpcIdx) ~= tNpcs.mgy_2[2] then return 0; end
	if not TY_IsCaptain() then
		return 0;
	end
	
	if not tStage02_1.sel_NORMAL then
		tStage02_1.sel_NORMAL = {
--			"������2��/#tStage02_1.EndStage02()",
			"M� �i 2/#tStage02_1.OnFinish()",
			"H�nh th�c sao ch�p (C�n "..TYT_IB_ITEM[1].."*1)/#tStage02_1.CheatMode()",
			"Ta mu�n r�i kh�i �i/TY_ConfirmClose",
			"H�y b�/nothing",
		};
	end
	
	if not tStage02_1.sel_HARD then
		tStage02_1.sel_HARD = {
--			"������2��/#tStage02_1.EndStage02()",
			"M� �i 2/#tStage02_1.OnFinish()",
			"Ta mu�n r�i kh�i �i/TY_ConfirmClose",
			"H�y b�/nothing",
		};
	end
	
	local strTab = tStage02_1.sel_HARD;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		strTab = tStage02_1.sel_NORMAL;
	end
	Say("<color=green>M�c Qu� Anh<color>: ��i hi�p �� s�n s�ng ch�a?", getn(strTab), strTab);
end

function tStage02_1:OnPlayerDeath()
	local self = tStage02_1;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage02_1:onTimeout()
	local self = tStage02_1;
	this:Msg2MSAll("��i tr��ng thao t�c qu� gi�, �i �� ��ng l�i.");
	TY_CloseMission();
end

tStage02_1 = inherit(cycPhase, tStage02_1);

tStage02_1.actions = {
	[1] = {
		[0] = {tStage02_1.Init, },
	},
};

tStage02_1.triggers = {
	Talk = {
		{action = tStage02_1.NpcMain},
	},
	PlayerDeath = {
		{action = tStage02_1.OnPlayerDeath}
	},
};

--�ڶ��أ���������-�����׶�
-----------------------------------------------------------------
tStage02_2 = {
	name = "C� Th� Th�n V�n",
	nStageId = TOTAL_STAGE + tStage02.nStageId*3 + 2,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "C� Th� Th�n V�n",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage02_2.Init()
	local self = tStage02_2;
	SetMissionV(this.mv_20, 1);
	SetMissionV(this.mv_21, 1);
	SetMissionV(this.mv_22, 0);
	SetMissionV(this.mv_24, 0);	--�Ƿ��Ѿ�����
	SetMissionV(this.mv_25, 20);--�ͷ�ȫ�����絹��ʱ
	SetMissionV(this.mv_26, 0);	--�Ƿ����
	SetMissionV(this.mv_27, 15);--25һ�����ͷ�ȼ�յ�ը������ʱ
	SetMissionV(this.mv_28, -1);--���ζ����ν�
	SetMissionV(this.mv_29, 0);	--���������޵�һ�׶���ǰѪ��
	SetMissionV(this.mv_30, -1);--���׾��������� ��������ʱ
	SetMissionV(this.mv_31, -1);--��������Чȥ������ʱ
	this.msCamp:turnPlayer(0, function() SetTask(TASKID_TAIYI_ITEM, 0); end);
	if 1 == GetMissionV(this.mv_03) then this.msCamp:turnPlayer(0, TY_AddGodState); end
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		--ds_TYT:AddStatValue(1, tDataStateList.fantianlin_easy_open_2, 1);
	else
		--ds_TYT:AddStatValue(1, tDataStateList.fantianlin_hard_open_2, 1);
	end
	TY_AddAttackState();
	TY_ClearDamagePoint();
end

function tStage02_2:NpcMain()
	local self = tStage02_2;
	GetMissionV(self.curPhaseLv);
	local nNpcIdx = GetTargetNpc();
	local szName = GetNpcName(nNpcIdx);
	
	if szName == "C�t Thu L�i" then
		if GetMissionV(this.mv_24) ~= 0 then
			RemoveNpc(nNpcIdx);
			return 0;
		end
		--ʰȡ������
		if 0 == GetTask(TASKID_TAIYI_ITEM) then
			local _, x1, y1 = GetNpcWorldPos(nNpcIdx);
			local _, x, y = GetWorldPos();
			if abs(x - x1) > 9 and abs(y - y1) > 9 then
				return 0;
			end
			RemoveNpc(nNpcIdx);
			CastState("state_invincibility", 100, 12*18);	--�޵�9��
			SetTask(TASKID_TAIYI_ITEM, 1);
			SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 979, 0, 1);
		else
			Msg2Player("M�i ng��i ch�i ch� c�n nh�t 1 c�i.");
		end
	end
end

--����ǰ
function tStage02_2.OnBossStage1()
	local self = tStage02_2;
	local nJltysIdx = TY_FindNpc(tNpcs.jltys1[2]);
	if 0 == nJltysIdx then
		return 0;
	end
	local _, x, y = GetNpcWorldPos(nJltysIdx);
	if 0 == GetMissionV(this.mv_25) then		--�������ͷ�ȫ������
		SetMissionV(this.mv_25, 20);
		
		if not self.tPoints then
			self.tPoints = {
				{1621, 2875},{1604, 2897},{1619, 2915},
				{1639, 2921},{1659, 2898},{1659, 2898},
				{1637, 2876},{1629, 2892},{1650, 2888},
				{1600, 2910},
			};
		end
		local nMapId = this.msPosition:getMapID();
		for i = 1, getn(self.tPoints) do	--�ڵ�ͼ�����ˢ��10��������
			local nNpcIdx = CreateNpc("TYT_Bileizhen", "C�t Thu L�i", nMapId, self.tPoints[i][1], self.tPoints[i][2]);
			SetNpcLifeTime(nNpcIdx, 10);
			SetNpcScript(nNpcIdx, thisFile);
		end
		local szMsg = "Th�n L�i ��ng C�u Thi�n, ch� c� th� d�ng C�t Thu L�i tr�n m�t ��t m�i tr�nh ���c th�i.";
		NpcChat(nMgyIdx, szMsg);
		this:Msg2MSAll(szMsg);
		this.msCamp:turnPlayer(0, function() HeadMsg2Player("Th�n V�n Th� �ang ph�ng Th�n L�i ��ng C�u Thi�n") end);
		if eDifType.NORMAL == GetMissionV(this.mv_02) then
			NpcCommand(nJltysIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*2+1646);
		else
			NpcCommand(nJltysIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*1+1646);
		end
		CastState2Npc(nJltysIdx, "state_fetter", 1, 10*18, 0, 10003);
		SetMissionV(this.mv_31, 10);
	end
	if GetMissionV(this.mv_25) >= 0 then
		SetMissionV(this.mv_25, GetMissionV(this.mv_25) - 5);
	end
end

--�ٻ�С������
function tStage02_2.CallLittleMonster()
	if 0 == GetMissionV(this.mv_22) or 1 == GetMissionV(this.mv_24) then
		return 0;
	end
	local self = tStage02_2;
	
	local nJltysIdx = TY_FindNpc(tNpcs.jltys1[2]);
	local nMapId, x, y = GetNpcWorldPos(nJltysIdx);
	_, x, y = TY_FindRandomPlayerPos({x, y});
	if not x then return 0; end
	local szName = "TYT_HTYXS";
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		szName = "TYT_NTYXS";
	end
	local nNpcIdx = CreateNpc(szName, "Th�n V�n Th�", nMapId, x, y);
	CastState2Npc(nNpcIdx, "state_fetter", 1, 5*60*18, 0, 10003);
	SetNpcDeathScript(nNpcIdx, thisFile);
end

--���κ�
function tStage02_2:OnBossStage2()
	local nJltysIdx = TY_FindNpc(tNpcs.jltys1[2]);
	if 0 == nJltysIdx then
		return 0;
	end
	local self = tStage02_2;
	local _, x, y = GetNpcWorldPos(nJltysIdx);
	
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
	if GetMissionV(this.mv_27) >= 0 then
		SetMissionV(this.mv_27, GetMissionV(this.mv_27) - 5);
	end
	if 0 == GetMissionV(this.mv_27) then		--��е��ÿ��15��������1λ�����������һֻȼ�յ�ը��
		local tPlayersIdx = TY_FindRandomPlayer({x, y}, 3);
		if 0 == getn(tPlayersIdx) then 
			DebugOutput("OnBossStage2:0 == getn(tPlayersIdx)")
			return 0; 	
		end
		
		local nOldPlayerIdx = PlayerIndex;
		PlayerIndex = tPlayersIdx[1];
		local szName = GetSafeName();
		SetTask(TASKID_TAIYITA_TIME, GetTime());
		SetTask(TASKID_TAIYI_ITEM, -1024);
		DoSkill2Target(nJltysIdx, 1648, 1, PIdx2NpcIdx(PlayerIndex));
		HeadMsg2Player("Th�n V�n Th� �� l�p qu� ��n l�n ng��i c�a ��i hi�p")
		for i = 2, getn(tPlayersIdx) do
			PlayerIndex = tPlayersIdx[i];
			szName = szName..", "..GetSafeName();
			SetTask(TASKID_TAIYITA_TIME, GetTime());
			SetTask(TASKID_TAIYI_ITEM, -1024);
			DoSkill2Target(nJltysIdx, 1648, 1, PIdx2NpcIdx(PlayerIndex));
			HeadMsg2Player("Th�n V�n Th� �� l�p qu� ��n l�n ng��i c�a ��i hi�p")
		end
		
		PlayerIndex = nOldPlayerIdx;
		local szMsg = format("%s h�y nhanh ch�ng �em qu� ��n ��n ch�n kh�ng ng��i!", szName);
		NpcChat(nMgyIdx, szMsg);
		this:Msg2MSAll(szMsg);
		SetMissionV(this.mv_27, 15);
	end
end

function tStage02_2.DoSkill()
	if GetMissionV(this.mv_22) == 0 then
		return 0;
	end
	
	local self = tStage02_2;
	if GetMissionV(this.mv_24) == 0 then			--����ǰ
		self:OnBossStage1();
	else
		self:OnBossStage2();
	end
end

function tStage02_2:OnNpcDeath(event, data)
	local self = tStage02_2;
	local szName = GetNpcName(data[1]);
	if szName == tNpcs.jltys1[2] then
		if GetMissionV(this.mv_24) == 0 then	--����ǰBoss����
			SetMissionV(this.mv_24, 1);
			SetMissionV(this.mv_28, 4);
		else	--���ͺ�Boss�������ؿ�����
			SetMissionV(this.mv_20, 2);	--�ڶ��ζԻ�
			SetMissionV(this.mv_21, 1);
			SetMissionV(this.mv_22, 0);	--����ս��
			SetMissionV(this.mv_26, 1);
			local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
			local nYzbIdx = TY_FindNpc(tNpcs.yzb_2[2]);
			TY_SetNpcType2Talk(nMgyIdx);
			TY_SetNpcType2Talk(nYzbIdx);
			TY_ClearNpc("L�a tr�i");
			TY_ClearNpc("Th�n V�n Th�");
		end
	else
		RemoveNpc(data[1]);
	end
end

function tStage02_2.CheckBlood()
	if GetMissionV(this.mv_22) == 0 then
		return 0;
	end
	
	local nJltysIdx = TY_FindNpc(tNpcs.jltys1[2]);	--����ǰ�� npc ����һ��
	if nJltysIdx == 0 then
		return 0;
	end
	
	local self = tStage02_2;
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
	local nMaxLife, nCurLife = GetUnitCurStates(nJltysIdx, 1);
	local nValue = floor(nCurLife / nMaxLife * 100);
	local nMapId, x, y = GetNpcWorldPos(nJltysIdx);
	if nValue <= 50 and GetMissionV(this.mv_30) < 0 and 0 == GetMissionV(this.mv_24) then
		SetMissionV(this.mv_29, nValue);
		SetMissionV(this.mv_30, 4);
		NpcCommand(nJltysIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*1+1650);	--����������
	end
end

function tStage02_2:MkDeath()
	if GetMissionV(this.mv_30) < 0 then return 0; end
	local nJltysIdx = TY_FindNpc(tNpcs.jltys1[2]);	--����ǰ�� npc ������һ��
	if 0 == nJltysIdx then return 0; end
	if 0 == GetMissionV(this.mv_30) then
		Death(1, nJltysIdx);
	end
	if GetMissionV(this.mv_30) >= 0 then
		SetMissionV(this.mv_30, GetMissionV(this.mv_30) - 2);
	end
end

function tStage02_2.RemoveSFX()
	local self = tStage02_2;
	local nTimeLeft = GetMissionV(this.mv_31);
	if 0 == nTimeLeft and 0 == GetMissionV(this.mv_24) then
		this.msCamp:turnPlayer(0, function()
			SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 0, 0, 1);
			SetTask(TASKID_TAIYI_ITEM, 0);
		end);
	end
	if nTimeLeft >= 0 then
		SetMissionV(this.mv_31, nTimeLeft - 5);
	end
end

function tStage02_2:StagePassed()
	local self = tStage02_2;
	local nDifType = GetMissionV(this.mv_02);
	if nDifType == eDifType.NORMAL then
		AddRuntimeStat(18, 9, 0, 1);
	elseif nDifType == eDifType.HARD then
		AddRuntimeStat(18, 21, 0, 1);
	end
	this.msCamp:turnPlayer(0, qht_raid_tyt_13, 0); -- ǧѰ������
	TY_StagePassed(self);
	self:onFinish();
end
	
function tStage02_2.NpcTalk()
	if 0 ~= GetMissionV(this.mv_22)then
		return 0;
	end
	local self = tStage02_2;
	local nParagraph = GetMissionV(this.mv_20);
	local nSentence = GetMissionV(this.mv_21);
	
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_1[2]);
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_1[2]);
	local tContent = {
		[1] = {
			{nMgyIdx, "T�n B�o xem k�a!"},
			{nYzbIdx, "Con qu�i v�t da s�t to qu�!"},
			{nMgyIdx, "H�n �ang �i qua h��ng n�y!"},
			{-1, ""},
		},
		[2] = {
			{nYzbIdx, "�a? ��y ch�ng ph�i l� k� hi�u c�a Thi�n �m Gi�o-T� Y Y sao!"},
			{nMgyIdx, "Ch�nh x�c, ��y ��ch th�c l� k� hi�u m� T� Y Y �� t�ng �� l�i � T�ng Tuy�t Th�nh."},
			{nYzbIdx, "T�m d�ng nghi�n c�u, Ph�n Thi�n L�m nguy hi�m tr�ng tr�ng, t�t nh�t l� ch�ng ta h�y nhanh ch�ng r�i kh�i n�i n�y!"},
			{-1, ""},
		},
	};
	
	if nSentence <= getn(tContent[nParagraph]) then
		if tContent[nParagraph][nSentence][1] > 0 then
			NpcChat(tContent[nParagraph][nSentence][1], tContent[nParagraph][nSentence][2]);
		end
		
		if nParagraph == 1 and nSentence == getn(tContent[nParagraph]) then
			local nJltysIdx = nil;
			if eDifType.NORMAL == GetMissionV(this.mv_02) then
				nJltysIdx = TY_CreateNpc(tNpcs.jltys1_1, tNpcPos.jltys1[2][1], 1);
--				TY_SupplyNpc(self.nStageId);
			else
				nJltysIdx = TY_CreateNpc(tNpcs.jltys1, tNpcPos.jltys1[2][1], 1);
			end
			SetNpcDeathScript(nJltysIdx, thisFile);
			SetMissionV(this.mv_22, 1);
			TY_SetNpcType2Fight(nMgyIdx);
			TY_SetNpcType2Fight(nYzbIdx);
		elseif nParagraph == 2 and nSentence == getn(tContent[nParagraph]) then
			self:StagePassed();
		end
		if tContent[nParagraph][nSentence][1] > 0 then
			SetMissionV(this.mv_21, GetMissionV(this.mv_21) + 1);
		end
	end
end

function tStage02_2.CheckActionEnd()
	local self = tStage02_2;
	local nVal = GetMissionV(this.mv_28);
	if 0 == nVal then
		TY_ClearPlayerSFX();
		local nJltysIdx = TY_FindNpc(tNpcs.jltys1[2]);
		local nMapId, x, y = GetNpcWorldPos(nJltysIdx);
		RemoveNpc(nJltysIdx);
		TY_ClearNpc("Th�n V�n Th�");
		if eDifType.NORMAL == GetMissionV(this.mv_02) then
			nJltysIdx = TY_CreateNpc(tNpcs.jltys2_1, {x, y});
		else
			nJltysIdx = TY_CreateNpc(tNpcs.jltys2, {x, y});
		end
		
		local nMaxLife, nCurLife = GetUnitCurStates(nJltysIdx, 1);
		local nPercent = GetMissionV(this.mv_29);
		nCurLife = floor(nMaxLife * (nPercent / 100));
		if nCurLife < 3000 then nCurLife = 3000; end
		ModifyNpcData(nJltysIdx, 0, nCurLife, 0);
	end
	if nVal >= 0 then
		SetMissionV(this.mv_28, nVal - 1);
	end
end

function tStage02_2:onTimeout()
	local self = tStage02_2;
	
	if 1 == GetMissionV(this.mv_26) then
		self:StagePassed();
		return 0;
	end
	TY_RecordDamagePoint()
	this:Msg2MSAll("V��t �i th�t b�i!");
--	if eDifType.NORMAL == GetMissionV(this.mv_02) and 1 == GetMissionV(this.mv_03) then
--		TY_GoToStage(self, self.father.father, 1);
--		this.msCamp:turnPlayer(0, TY_SetPlayerPos, tPlayerPos[tStage00.nStageId][1]);
--		return 0;
--	end
	TY_GoToStage(self, self.father, 1);
end

function tStage02_2:OnPlayerDeath(event, data)
	local self = tStage02_2;
	local nMapId = GetWorldPos();
	SetTask(TASKID_TAIYI_ITEM, 0);
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function Explode()
	local nNowTime = GetTime();
	if GetMissionV(this.mv_24) == 1 and GetTask(TASKID_TAIYI_ITEM) == -1024 and nNowTime - GetTask(TASKID_TAIYITA_TIME) >= 5 then
		SetTask(TASKID_TAIYI_ITEM, 0);
		local nMapId, x, y = GetWorldPos();
		if GetMapTemplate(SubWorld) ~= 6075 then
			WriteLog(format("[Th�i Nh�t Th�p-��ng l�a.failed] [Role:%s Account:%s][PlayerIndex = %d] [nMapId=%d, x=%d, y=%d]",GetName(), GetAccount(), PlayerIndex, nMapId, x, y));
			WriteLog(format("[Th�i Nh�t Th�p-��ng l�a] [getn(this.msCamp.players) = %d, GetMSPlayerCount(%d, %d) = %d]", getn(this.msCamp.players), this.missionID, 0, GetMSPlayerCount(this.missionID, 0)));
			local nOldPlayerIdx = PlayerIndex;
			for i = 1, getn(this.msCamp.players) do
				PlayerIndex = this.msCamp.players[i];
				WriteLog(format("[Th�i Nh�t Th�p-��ng l�a] [Role:%s, Account:%s PlayerIndex:%d, GetWorldPos():%d, %d, %d]", GetName(), GetAccount(), PlayerIndex, GetWorldPos()));
			end
			PlayerIndex = nOldPlayerIdx;
			return 0;
		end
		WriteLog(format("[Th�i Nh�t Th�p-��ng l�a.success] [Role:%s Account:%s][PlayerIndex = %d] [nMapId=%d, x=%d, y=%d]",GetName(), GetAccount(), PlayerIndex, nMapId, x, y));
		local szTempName = "TYT_HtaiyiFire";
		if eDifType.NORMAL == GetMissionV(this.mv_02) then
			szTempName = "TYT_NtaiyiFire";
		end
		local nNpcIdx = CreateNpc(szTempName, "L�a tr�i", nMapId, x, y);
		CastState2Npc(nNpcIdx, "state_dispear", 100, 60*60*18);
		SetCurrentNpcSFX(nNpcIdx, 986, 1, 1);
	end
end

function tStage02_2.DoExplode()
	local self = tStage02_2;
	local nNpcIdx = TY_FindNpc(tNpcs.jltys2[2]);
	if 0 == nNpcIdx or 1 == IsNpcDeath(nNpcIdx) then return end
	this.msCamp:turnPlayer(0, Explode);
end

tStage02_2 = inherit(cycPhase, tStage02_2);

tStage02_2.actions = {
	[1] = tStage02_2.Init,
};

tStage02_2.cycActions = {
	[1] = {
		[0] = {tStage02_2.CheckActionEnd},
	},
	[2] = {
		[0] = {tStage02_2.NpcTalk, tStage02_2.CheckBlood, tStage02_2.MkDeath},
	},
	[3] = {
		[0] = {tStage02_2.CallLittleMonster},
	},
	[5] = {
		[0] = {tStage02_2.DoSkill, tStage02_2.DoExplode, tStage02_2.RemoveSFX},
	},
};

tStage02_2.triggers = {
	NpcDeath = {
		{action = tStage02_2.OnNpcDeath},
	},
	PlayerDeath = {
		{action = tStage02_2.OnPlayerDeath},
	},
	Talk = {
		{action = tStage02_2.NpcMain},
	},
};

--��������-������
-----------------------------------------------------------------
tStage02_3 = {
	name = "C� Th� Th�n V�n-Khu k�t th�c",
	nStageId = TOTAL_STAGE + tStage02.nStageId*3 + 3,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "C� Th� Th�n V�n-Khu k�t th�c",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage02_3.GoToStage03()
	local self = tStage02_3;
	TY_StagePassed(self);
	self:onFinish();
end

function tStage02_3:CreateNpcs()
	local nMgyIdx = TY_CreateNpc(tNpcs.mgy_1, tNpcPos.mgy[2][2]);
	local nYzbIdx = TY_CreateNpc(tNpcs.yzb_1, tNpcPos.yzb[2][2]);
	local nJjgIdx = TY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1]);
end

function tStage02_3:NpcMain()
	local nNpcIdx = GetTargetNpc();
	if GetNpcName(nNpcIdx) == tNpcs.mgy_1[2] then
		if not TY_IsCaptain() then
			return 0;
		end
		if not tStage02_3.sel then
			tStage02_3.sel = {
				"M� �i 3/#tStage02_3.GoToStage03()",
				"Ta mu�n r�i kh�i �i/TY_ConfirmClose",
				"H�y b�/nothing",
			};
		end
		Say("<color=green>M�c Qu� Anh<color>: ��ng � v�o �i ti�p theo kh�ng?", getn(tStage02_3.sel), tStage02_3.sel);
	end
end

function tStage02_3.Init()
	local self = tStage02_3;
	self:CreateNpcs();
	this.msCamp:turnPlayer(0, TY_SetPlayerPos, tPlayerPos[self.father.nStageId][2]);
end

function tStage02_3:OnPlayerDeath()
	local self = tStage02_3;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage02_3:onTimeout()
	this:Msg2MSAll("��i tr��ng thao t�c qu� gi�, �i �� ��ng l�i.");
	TY_ReviveAll(0);
	TY_CloseMission();
end

tStage02_3 = inherit(cycPhase, tStage02_3);

tStage02_3.actions = {
	[1] = {
		[0] = {tStage02_3.Init, },
	},
};

tStage02_3.triggers = {
	Talk = {
		{action = tStage02_3.NpcMain},
	},
	PlayerDeath = {
		{action = tStage02_3.OnPlayerDeath}
	},
};
-----------------------------------------------------------------
tStage02.phases = {tStage02_1, tStage02_2, tStage02_3};
