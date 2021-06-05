Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
--��3�أ�����֮��
-----------------------------------------------------------------
tStage03 = {
	name = "Ph�n Thi�n Chi M�ng",
	nStageId = 3,
	maxsecond = 120 * 60,
	actionsType = "second",
};

tStage03 = inherit(cycPhase, tStage03);

function tStage03:onTimeout()
	local self = tStage03;
	this:Msg2MSAll(format("%d ph�t sau ch�a ho�n th�nh [%s], �i s� ��ng l�i!", tStage03.maxsecond / 60, tStage03.name));
	TY_CloseMission();
end

--��3�أ�����֮��-׼����
-----------------------------------------------------------------
tStage03_1 = {
	name = "Ph�n Thi�n Chi M�ng-Khu chu�n b�",
	nStageId = TOTAL_STAGE + tStage03.nStageId*3 + 1,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "Ph�n Thi�n Chi M�ng-Khu chu�n b�",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage03_1.CreateNpcs()
	local self = tStage03_1;
	local nMgyIdx = TY_CreateNpc(tNpcs.mgy_1, tNpcPos.mgy[3][1]);
	local nYzbIdx = TY_CreateNpc(tNpcs.yzb_1, tNpcPos.yzb[3][1]);
	local nJjgIdx = TY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1]);
	TY_SetNpcType2Talk(nMgyIdx);
	TY_SetNpcType2Talk(nYzbIdx);
end

function tStage03_1.Init()
	local self = tStage03_1;
	SetMissionV(MV_STAGE, self.father.nStageId);
	SetMissionV(this.mv_03, 0);
	
	TY_ClearColdDown();
	self:CreateNpcs();
	this.msCamp:turnPlayer(0, TY_SetPlayerPos, tPlayerPos[self.father.nStageId][1]);
	this.msCamp:turnPlayer(0, function() HeadMsg2Player("��i tr��ng v� M�c Qu� Anh ��i tho�i �� ti�p t�c �i!") end);
end

function tStage03_1.OnFinish()
	local self = tStage03_1;
	self:onFinish();
	local nDifType = GetMissionV(this.mv_02);
	if nDifType == eDifType.NORMAL then
		AddRuntimeStat(18, 10, 0, 1);
	elseif nDifType == eDifType.HARD then
		AddRuntimeStat(18, 22, 0, 1);
	end
end

function tStage03_1.CheatMode()
	local self = tStage03_1;
	if GetItemCount(TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4]) < 1 then
		Talk(1, "", "<color=green>M�c Qu� Anh<color>: Tr�n ng��i b�n"..TYT_IB_ITEM[1].."Kh�ng ��.");
		return 0;
	end
	if 1 ~= DelItem(TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4], 1) then return 0; end
	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4], 1})
	SetMissionV(this.mv_03, 1);
	AddRuntimeStat(18, 5, GetMissionV(2)-1, 1);
	AddRuntimeStat(18, 32, 0, 1);
	self:OnFinish();
end

function tStage03_1.EndStage03()
	local self = tStage03_1;
	TY_StagePassed(self);
	
	if self.guage and self.guage.id then
		this.msCamp:turnPlayer(0, StopTimeGuage, self.guage.id);
	end
	
	SetMissionV(self.father.curPhaseLv, 3);
	local tCurPhase = self.father.phases[3];
	tCurPhase:onInit(self.father);
end

function tStage03_1.OnPlayerDeath()
	local self = tStage03_1;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage03_1:onTimeout()
	this:Msg2MSAll("��i tr��ng thao t�c qu� gi�, �i �� ��ng l�i.");
	TY_ReviveAll(0);
	TY_CloseMission();
end

function tStage03_1:NpcMain()
	local nNpcIdx = GetTargetNpc();
	if GetNpcName(nNpcIdx) == tNpcs.mgy_1[2] then
		if not TY_IsCaptain() then
			return 0;
		end
		if not tStage03_1.sel_NORMAL then
			tStage03_1.sel_NORMAL = {
--				"������3��/#tStage03_1.EndStage03()",
				"M� �i/#tStage03_1.OnFinish()",
				"H�nh th�c sao ch�p (C�n "..TYT_IB_ITEM[1].."*1)/#tStage03_1.CheatMode()",
				"Ta mu�n r�i kh�i �i/TY_ConfirmClose",
				"H�y b�/nothing",
			};
		end
		if not tStage03_1.sel_HARD then
			tStage03_1.sel_HARD = {
--				"������3��/#tStage03_1.EndStage03()",
				"M� �i/#tStage03_1.OnFinish()",
				"Ta mu�n r�i kh�i �i/TY_ConfirmClose",
				"H�y b�/nothing",
			};
		end
		local strTab = tStage03_1.sel_HARD;
		if eDifType.NORMAL == GetMissionV(this.mv_02) then
			strTab = tStage03_1.sel_NORMAL;
		end
		Say("<color=green>M�c Qu� Anh<color>: ��i hi�p �� s�n s�ng ch�a?", getn(strTab), strTab);
	end
end

tStage03_1 = inherit(cycPhase, tStage03_1);

tStage03_1.actions = {
	[1] = {
		[0] = {tStage03_1.Init, },
	},
};

tStage03_1.triggers = {
	Talk = {
		{action = tStage03_1.NpcMain},
	},
	PlayerDeath = {
		{action = tStage03_1.OnPlayerDeath},
	},
};

--��3�أ�����֮��
-----------------------------------------------------------------
tStage03_2 = {
	name = "Ph�n Thi�n Chi M�ng",
	nStageId = TOTAL_STAGE + tStage03.nStageId*3 + 2,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "Ph�n Thi�n Chi M�ng",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage03_2:Init()
	local self = tStage03_2;
	SetMissionV(this.mv_20, 1);
	SetMissionV(this.mv_21, 1);
	SetMissionV(this.mv_22, 0);	--�Ƿ�ʼս��
	SetMissionV(this.mv_23, 0);	--����ʱ�� >0Ϊ����ǰ <0Ϊ������ == 0 ֹͣ [3, 1] [-3, -1]
	SetMissionV(this.mv_24, 0);	--��ħ,��ħ��Ӣ С������
	SetMissionV(this.mv_25, 0);	--�Ƿ����
	if 1 == GetMissionV(this.mv_03) then this.msCamp:turnPlayer(0, TY_AddGodState); end
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		--ds_TYT:AddStatValue(1, tDataStateList.fantianlin_easy_open_3, 1);
	else
		--ds_TYT:AddStatValue(1, tDataStateList.fantianlin_hard_open_3, 1);
	end
	TY_AddAttackState();
	TY_ClearDamagePoint();
end

function tStage03_2:StagePassed()
	local self = tStage03_2;
	local nDifType = GetMissionV(this.mv_02);
	if nDifType == eDifType.NORMAL then
		AddRuntimeStat(18, 11, 0, 1);
	elseif nDifType == eDifType.HARD then
		AddRuntimeStat(18, 23, 0, 1);
	end
	this.msCamp:turnPlayer(0, qht_raid_tyt_13, 0); -- ǧѰ������
	TY_StagePassed(self);
	self:onFinish();
end
	
function tStage03_2:NpcTalk()
	if GetMissionV(this.mv_22) == 1 then
		return 0;
	end
	local self = tStage03_2;
	local nParagraph = GetMissionV(this.mv_20);
	local nSentence = GetMissionV(this.mv_21);
	
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_1[2]);
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_1[2]);
	local tContent = {
		[1] = {
			{nMgyIdx, "��y l� m� tr�n? T�n B�o! Ch�ng ta b� mai ph�c r�i!"},
			{nYzbIdx, "��! Ta �au ��u qu�! Mau gi�p ta v�i! C� th� kh�ng c�n nghe l�i n�a r�i.!"},
			{-1, ""},
		},
		[2] = {
			{nYzbIdx, "Cu�i c�ng c�c ng��i �� t�nh r�i! Vi�c n�y khi�n ta m�t l� c� ng��i!"},
			{nMgyIdx, "C�c v� c� bi�t Thi�n M�n Tr�n c�a ng��i Li�u kh�ng?"},
			{nMgyIdx, "N�i n�y r�t gi�ng nh� Thi�n M�n Tr�n, l�c n�y c�c ng��i b� s��ng m� trong tr�n m� ho�c, lu�n xem ta l� k� ��ch m� t�n c�ng �i�n cu�ng."},
			{nYzbIdx, "Ta v� Qu� Anh c� mang theo Gi�ng Long M�c n�n m�i gi� ���c b�nh t�nh. Nh�ng s�c m�nh c� h�n n�n ph�i ��i c�c ng��i ki�t s�c th� Gi�ng Long M�c m�i c� th� tr�n �p s� m� ho�c c�a m� tr�n, gi�p c�c ng��i ph�c h�i th�n tr�."},
			{nYzbIdx, "Ng��i kh�ng bi�t kh�ng c� t�i! Ch�ng ph�i b�y gi� ch�ng ta v�n kh�e m�nh sao? Ha ha"},
			{nMgyIdx, "Ph�a tr��c ch�nh l� Th�i Nh�t Th�p, ch�ng ta h�y nhanh ch�ng r�i kh�i Ph�n Thi�n L�m k� l� n�y v� b��c v�o trong th�p th�i!"},
			{-1, ""},
		},
	};
	
	if nSentence <= getn(tContent[nParagraph]) then
		if tContent[nParagraph][nSentence][1] > 0 then
			NpcChat(tContent[nParagraph][nSentence][1], tContent[nParagraph][nSentence][2]);
		end
		
		if nParagraph == 1 and nSentence == getn(tContent[nParagraph]) then	--˵���һ�ηϻ�����
			local nMgyIdx = TY_FindNpc(tNpcs.mgy_1[2]);
			local nYzbIdx = TY_FindNpc(tNpcs.yzb_1[2]);
			RemoveNpc(nMgyIdx);
			RemoveNpc(nYzbIdx);
			TY_ClearMapNpc()
			TY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1]);
			SetMissionV(this.mv_22, 1);
			if eDifType.NORMAL == GetMissionV(this.mv_02) then
				nMgyIdx = TY_CreateNpc(tNpcs.mgy_3_1, {1642, 3209});
				nYzbIdx = TY_CreateNpc(tNpcs.yzb_3_1, {1612, 3182});
--				TY_SupplyNpc(self.nStageId);
			else
				nMgyIdx = TY_CreateNpc(tNpcs.mgy_3, {1642, 3209});
				nYzbIdx = TY_CreateNpc(tNpcs.yzb_3, {1612, 3182});
			end
		elseif nParagraph == 2 and nSentence == getn(tContent[nParagraph]) then
			self:StagePassed();
		end
		SetMissionV(this.mv_21, GetMissionV(this.mv_21) + 1);
	end
end

function tStage03_2:CheckPos()
	if GetMissionV(this.mv_22) ~= 1 or eDifType.NORMAL == GetMissionV(this.mv_02) then
		return 0;
	end
	
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_3[2]);
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_3[2]);
	if 0 ~= nYzbIdx and 0 == IsNpcDeath(nYzbIdx) and 0 ~= nMgyIdx and 0 == IsNpcDeath(nMgyIdx) then
		local _, x1, y1 = GetNpcWorldPos(nMgyIdx);
		local _, x2, y2 = GetNpcWorldPos(nYzbIdx);
		if abs(x2 - x1) <= 15 and abs(y2 - y1) <= 15 then
			NpcChat(nMgyIdx, "H�y mau t�ch ta v� T�n B�o ra, ��ng �� ch�ng t�i ��n g�n nhau!");
			this:Msg2MSAll("H�y mau t�ch ta v� T�n B�o ra, ��ng �� ch�ng t�i ��n g�n nhau!");
		end
	end
	if 0 ~= nYzbIdx and 1 ~= IsNpcDeath(nYzbIdx) then	--��ħ�侫Ӣ
		local tNpcIdx = TY_FindAllNpc("M� Ma");
		local _, x, y = GetNpcWorldPos(nYzbIdx);
		for i = 1, getn(tNpcIdx) do
			local _, x1, y1 = GetNpcWorldPos(tNpcIdx[i]);
			if abs(x1 - x) <= 15 and abs(y1 - y) <= 15 then
				SetNpcLifeTime(tNpcIdx[i], 0);
				local nMapId, x, y = GetNpcWorldPos(tNpcIdx[i]);
				local nNpcIdx = CreateNpc("TYT_Hmeimoking", "M� Ho�c V��ng", nMapId, x, y);
				SetNpcDeathScript(nNpcIdx, thisFile);
				SetCampToNpc(nNpcIdx, CampEnemy);
				return 1;
			end
		end
	end
	
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_3[2]);
	if 0 ~= nMgyIdx and 1 ~= IsNpcDeath(nMgyIdx) then	--��ħ��ը
		local tNpcIdx = TY_FindAllNpc("M� Ma");
		local _, x, y = GetNpcWorldPos(nMgyIdx);
		for i = 1, getn(tNpcIdx) do
			local _, x1, y1 = GetNpcWorldPos(tNpcIdx[i]);
			if abs(x1 - x) <= 15 and abs(y1 - y) <= 15 then
				SetNpcLifeTime(tNpcIdx[i], 1);
				NpcCommand(tNpcIdx[i], NPCCOMMAND.do_skill, x*32, y*32, 65536*1+1656);
				return 1;
			end
		end
	end
end

--��鳡�ϵ���ħ����Ӣ ����
function tStage03_2:CheckMeiMoNum()
	if GetMissionV(this.mv_22) ~= 1 then
		return 0;
	end
	local self = tStage03_2;
	local tNpcIdx = TY_FindAllNpc("M� Ma");
	local szMsg = "To�n b�n �� v��t qu� 12 con M� Ma, v��t �i th�t b�i!";
	local nNum = 12
	if eDifType.HARD == GetMissionV(this.mv_02) then
		nNum = 18
	end
	if getn(tNpcIdx) + getn(TY_FindAllNpc("M� Ho�c V��ng")) >= nNum then
		this:Msg2MSAll(szMsg);
		SetMissionV(this.mv_22, 0);
		TY_GoToStage(self, self.father, 1);
	end
end

function tStage03_2:CheckBlood()
	if GetMissionV(this.mv_22) ~= 1 then
		return 0;
	end
	--DebugOutput("CheckBlood!!!")
	local self = tStage03_2;
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_3[2]);
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_3[2]);
	if 0 == nMgyIdx or 0 == nYzbIdx then 
		DebugOutput("CheckBlood:0 == nMgyIdx or 0 == nYzbIdx")
		return 0; 
	end
	if IsNpcDeath(nMgyIdx) == 1 or IsNpcDeath(nYzbIdx) == 1 then
		DebugOutput("IsNpcDeath(nMgyIdx), IsNpcDeath(nYzbIdx) =", IsNpcDeath(nMgyIdx), IsNpcDeath(nYzbIdx))
		return 0;
	end
	local szName1 = GetNpcName(nMgyIdx);
	local szName2 = GetNpcName(nYzbIdx);
	if not ((szName1 == tNpcs.mgy_3[2] and szName2 == tNpcs.yzb_3[2]) or
		 (szTName1 == tNpcs.mgy_3_1[2] and szName2 == tNpcs.yzb_3_1[2])) then 
		 	DebugOutput("CheckBlood:npcname can't find")
		 	return 0; 
	end
	
	local nSumBlood = 0;
	local nMaxLife1, _  = GetUnitBaseStates(nMgyIdx, 1);
	local _, nCurLife1	= GetUnitCurStates(nMgyIdx, 1);
	local nMaxLife2, _  = GetUnitBaseStates(nYzbIdx, 1);
	local _, nCurLife2	= GetUnitCurStates(nYzbIdx, 1);
	
	local fAvg = (nCurLife1 / nMaxLife1 + nCurLife2 / nMaxLife2) / 2.0;
	
	--DebugOutput(nMaxLife1, nCurLife1, nMaxLife2, nCurLife2)
	--DebugOutput(floor(nMaxLife1*fAvg),floor(nMaxLife2*fAvg))
	ModifyNpcData(nMgyIdx, 0, floor(nMaxLife1*fAvg), 0);
	ModifyNpcData(nYzbIdx, 0, floor(nMaxLife2*fAvg), 0);
end

function tStage03_2:CallMeiMo()
	if GetMissionV(this.mv_22) ~= 1 or eDifType.NORMAL == GetMissionV(this.mv_02) then
		return 0;
	end
	local self = tStage03_2;
	local nMapId = this.msPosition:getMapID();
	for i = 1, 3 do
		local nIdx = random(1, getn(tNpcPos.mm[3]));
		local nNpcIdx = CreateNpc("TYT_Hmeimo", "M� Ma", nMapId, tNpcPos.mm[3][nIdx][1], tNpcPos.mm[3][nIdx][2]);
		SetNpcDeathScript(nNpcIdx, thisFile);
		SetCampToNpc(nNpcIdx, CampEnemy);
	end
end

--ÿ��6��ˢС����������
function tStage03_2:CallTunYunShou()
	if GetMissionV(this.mv_22) ~= 1 then
		return 0;
	end
	
	local self = tStage03_2;
	if not tStage03_2.tPoints then	--��Ҫȡ��
		tStage03_2.tPoints = {
			{1631, 3191}, {1629, 3182}, {1640, 3196},
			{1624, 3189}, {1639, 3189}, {1617, 3182},
		};
	end
	local nMapId = this.msPosition:getMapID();
	local nIdx = random(1, getn(tStage03_2.tPoints));
	local x, y = tStage03_2.tPoints[nIdx][1], tStage03_2.tPoints[nIdx][2];
	local nNpcIdx = CreateNpc("TYT_Hkuilei", "Con R�i", nMapId, x, y);
	SetNpcLifeTime(nNpcIdx, 7);
	SetNpcDeathScript(nNpcIdx, thisFile);
	CastState2Npc(nNpcIdx, "state_attack_trans", 50, 18*60*60);
	CastState2Npc(nNpcIdx, "state_fetter", 1, 6*18);
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		NpcCommand(nNpcIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*2+1768);	--������4��
	else
		NpcCommand(nNpcIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*1+1768);	--������4��
	end
end

--ÿ50�룬���ڱ����¹�Ӣ����λ��
function tStage03_2:ChangePos()
	if GetMissionV(this.mv_22) ~= 1 then
		return 0;
	end
	
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_3[2]);
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_3[2]);
	local nValue = GetMissionV(this.mv_23);
	
	if IsNpcDeath(nMgyIdx) == 1 or IsNpcDeath(nYzbIdx) == 1 or nValue == 0 then
		return 0;
	end
	
	if nValue == 2 then
		NpcChat(nMgyIdx, "��ng l�m t�n th��ng T�n B�o c�a ta!");
		NpcChat(nYzbIdx, "��ng l�m t�n th��ng Qu� Anh c�a ta!");
		CastState2Npc(nMgyIdx, "state_fetter", 1, 4 * 18);
		CastState2Npc(nYzbIdx, "state_fetter", 1, 4 * 18);
	end
	
	if nValue == 1 then
		SetMissionV(this.mv_23, -2);
		local _, x1, y1 = GetNpcWorldPos(nMgyIdx);
		local _, x2, y2 = GetNpcWorldPos(nYzbIdx);
		SetNpcPos(nMgyIdx, x2, y2);
		SetNpcPos(nYzbIdx, x1, y1);
	end
	
	if nValue > 0 then
		SetMissionV(this.mv_23, nValue - 1);
	end
	
	this.msCamp:turnPlayer(0, function() HeadMsg2Player("D��ng T�n B�o v� M�c Qu� Anh chu�n b� ��i v� tr�") end);
end

function tStage03_2:Prepare2ChangePos()
	SetMissionV(this.mv_23, 2);
end

function tStage03_2:DoSkill()
	if 0 == GetMissionV(this.mv_22) or eDifType.NORMAL == GetMissionV(this.mv_02) then
		return 0;
	end
	local self = tStage03_2;
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_3[2]);
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_3[2]);
	
	if 0 ~= nYzbIdx then
		local _, x, y = GetNpcWorldPos(nYzbIdx);
		local nPlayerIndex = GetWhoHitNpcMost(nYzbIdx);
		if not nPlayerIndex then
			nPlayerIndex = PIdx2NpcIdx(TY_FindRandomPlayer({x, y}));
		end
		DoSkill2Target(nYzbIdx, 1658, 1, nPlayerIndex);		--���ڱ����ش��
	end
	if 0 ~= nMgyIdx then
		local _, x, y = GetNpcWorldPos(nMgyIdx);
		local nPlayerIndex = GetWhoHitNpcMost(nYzbIdx);
		if not nPlayerIndex then
			nPlayerIndex = PIdx2NpcIdx(TY_FindRandomPlayer({x, y}));
		end
		DoSkill2Target(nYzbIdx, 1659, 1, nPlayerIndex);		--���ڱ����ش��
	end
end

function tStage03_2:OnNpcDeath(event, data)
	local self = tStage03_2;
	local szName = GetNpcName(data[1]);
	if szName ~= tNpcs.mgy_3[2] and szName ~= tNpcs.yzb_3[2] then
		RemoveNpc(data[1]);
		return
	end
	
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_3[2]);
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_3[2]);
	
	
	if (1 == IsNpcDeath(nMgyIdx) and szName == tNpcs.yzb_3[2]) or (1 == IsNpcDeath(nYzbIdx) and tNpcs.mgy_3[2]) then
		SetMissionV(this.mv_25, 1);
		
		TY_ClearMapNpc();
		local nMgyIdx = TY_CreateNpc(tNpcs.mgy_1, tNpcPos.mgy[3][2]);
		local nYzbIdx = TY_CreateNpc(tNpcs.yzb_1, tNpcPos.yzb[3][2]);
		SetMissionV(this.mv_20, 2);		--��ʼ�ڶ��ζԻ�
		SetMissionV(this.mv_21, 1);
		SetMissionV(this.mv_22, 0);		--����ս���׶�
	end
end

function tStage03_2:onTimeout()
	local self = tStage03_2;
	if 1 == GetMissionV(this.mv_25) then
		self:StagePassed();
		return 0;
	end
	TY_RecordDamagePoint()
	this:Msg2MSAll("V��t �i th�t b�i!");
	TY_GoToStage(self, self.father, 1);
end

function tStage03_2:OnPlayerDeath(event, data)
	local self = tStage03_2;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

tStage03_2 = inherit(cycPhase, tStage03_2);

tStage03_2.actions = {
	[1] = tStage03_2.Init,
};

tStage03_2.cycActions = {
	[2] = {
		[0] = {tStage03_2.NpcTalk, tStage03_2.CheckBlood, tStage03_2.ChangePos, tStage03_2.CheckPos, tStage03_2.CheckMeiMoNum},
	},
	[6] = {
		[0] = {tStage03_2.CallTunYunShou},
	},
	[10] = {
		[0] = {tStage03_2.CallMeiMo, },
	},
	[15] = {
		[0] = {tStage03_2.DoSkill, },
	},
	[50] = {
		[0] = {tStage03_2.Prepare2ChangePos, },
	},
};

tStage03_2.triggers = {
	NpcDeath = {
		{action = tStage03_2.OnNpcDeath}
	},
	PlayerDeath = {
		{action = tStage03_2.OnPlayerDeath},
	},
};

--����֮��-������
-----------------------------------------------------------------
tStage03_3 = {
	name = "Ph�n Thi�n Chi M�ng-Khu k�t th�c",
	nStageId = TOTAL_STAGE + tStage03.nStageId*3 + 3,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "Ph�n Thi�n Chi M�ng-Khu k�t th�c",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage03_3:CreateNpcs()
	local nMgyIdx = TY_CreateNpc(tNpcs.mgy_1, tNpcPos.mgy[3][2]);
	local nYzbIdx = TY_CreateNpc(tNpcs.yzb_1, tNpcPos.yzb[3][2]);
end

function tStage03_3.Init()
	local self = tStage03_3;
	
	self:CreateNpcs();
	this.msCamp:turnPlayer(0, TY_SetPlayerPos, tPlayerPos[self.father.nStageId][2]);
end

function tStage03_3.ToTYTower()
	local self = tStage03_3;		
	TY_StagePassed(self);
	self:onFinish();
end

function tStage03_3.GoToTYTower(nDifType, nType)
	local self = tStage03_3;
	if 1 ~= TY_EnterCondCheck("<color=green>M�c Qu� Anh:<color>", eMSName.TOWER, nDifType) then
		return 0;
	end
	
	if 0 == TY_CheckMapCountLimit("<color=green>M�c Qu� Anh:<color>", eMSName.TOWER, nDifType) then
		return 0;
	end
	
	if tonumber(nType) == 1 then
		if 1 ~= TY_CheckAndCostJingLi("<color=green>M�c Qu� Anh:<color>", eMSName.TOWER, nDifType, 1) then
			return 0;
		end
		if 1 ~= TY_CheckAndCostJingLi("<color=green>M�c Qu� Anh:<color>", eMSName.TOWER, nDifType) then
			return 0;
		end
	elseif tonumber(nType) == 2 then
		if 1 ~= TY_CheckAndCostItem("<color=green>M�c Qu� Anh:<color>", eMSName.TOWER, nDifType, 1) then
			return 0;
		end
		if 1 ~= TY_CheckAndCostItem("<color=green>M�c Qu� Anh:<color>", eMSName.TOWER, nDifType) then
			return 0;
		end
	end
	
	TY_StagePassed(self);
	SetMissionV(this.mv_02, nDifType);
	self:onFinish();
end

function tStage03_3:NpcMain()
	local nNpcIdx = GetTargetNpc();
	if GetNpcName(nNpcIdx) == tNpcs.mgy_1[2] then
		if not TY_IsCaptain() then
			return 0;
		end
		
		local strTab = {
			"T�i mu�n tham gia Th�i Nh�t Th�p/#tStage03_3.ToTYTower(0)",
			--format("��Ҫ�μ���ͨ�Ѷȵ�̫һ��(����%s)/#tStage03_3.GoToTYTower(%d, %d)", "����*"..TYT_JOIN_COST_JINGLI[2][1], eDifType.NORMAL, 1),
			--format("��Ҫ�μ���ͨ�Ѷȵ�̫һ��(�ӳ�����%s)/#tStage03_3.GoToTYTower(%d, %d)", TYT_JOIN_COST_ITEM[2][1][2].."*"..TYT_JOIN_COST_ITEM[2][1][1][4], eDifType.NORMAL, 2),
			--format("��Ҫ�μ�Ӣ���Ѷȵ�̫һ��(����%s)/#tStage03_3.GoToTYTower(%d, %d)", "����*"..TYT_JOIN_COST_JINGLI[2][2], eDifType.HARD, 1),
			--format("��Ҫ�μ�Ӣ���Ѷȵ�̫һ��(�ӳ�����%s)/#tStage03_3.GoToTYTower(%d, %d)", TYT_JOIN_COST_ITEM[2][2][2].."*"..TYT_JOIN_COST_ITEM[2][2][1][4], eDifType.HARD, 2),
			"Ta mu�n r�i kh�i �i/TY_ConfirmClose",
			"H�y b�/nothing",
		};
		Say("<color=green>M�c Qu� Anh<color>: ��ng � v�o �i ti�p theo kh�ng?", getn(strTab), strTab);
	end
end

function tStage03_3:OnPlayerDeath()
	local self = tStage03_3;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage03_3:onTimeout()
	this:Msg2MSAll("��i tr��ng thao t�c qu� gi�, �i �� ��ng l�i.");
	TY_ReviveAll(0);
	TY_CloseMission();
end

tStage03_3 = inherit(cycPhase, tStage03_3);

tStage03_3.actions = {
	[1] = tStage03_3.Init,
};

tStage03_3.triggers = {
	Talk = {
		{action = tStage03_3.NpcMain},
	},
	NpcDeath = {
		{action = tStage03_3.OnPlayerDeath},
	},
};

-----------------------------------------------------------------
tStage03.phases = {tStage03_1, tStage03_2, tStage03_3};
