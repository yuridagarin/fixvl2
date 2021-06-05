Include("\\settings\\static_script\\missions\\base\\mission_head.lua")

-----------------------------------------------------------------------------
-- called by OpenMission
function InitMission(mapID, mapIndex, mapReturnID)
	this:onInit(mapID, mapIndex, mapReturnID);
end
-- called by CloseMission
function EndMission()
	this:Close();
end;
-- called by RunMission
function RunMission()
end;
-- called by JoinMission
function JoinMission()
end
-- called by DelMSPlayer, NewWorld, LeaveGame
function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	this:onLeave();
	PlayerIndex = RoleIndex;
end;
-- called by timer
function OnTimer()
--	if GetMSPlayerCount(this.missionID) == 0 then
--		this:Close();
--	else
--		print("sizeof(this.msPhases) = ", getn(this.msPhases));
--		print("sizeof(this.msPhases[1].phases) = ", getn(this.msPhases[1].phases));
--		print("this.msPhases[1].name = ", this.msPhases[1].name);
		if not this.nInit then
			for k, v in this.msPhases do
				if v.resetFather then
					v:resetFather();
				end
			end
		end
		local oldPIdx = PlayerIndex;
		local nPId, nPIndex = GetNextPlayer(this.missionID,0,0);
		PlayerIndex = nPIndex;
		for k,v in this.msPhases do
			v:onTimer();
		end
		PlayerIndex = oldPIdx;
--	end
end

-------------------------------------------------------------------------------
msCamp = {
	campType = {CampPlayer, CampEnemy, CampNeutral},
}
function msCamp:addPlayer(missionID, nCamp)
--	print("msCamp:addPlayer")
	AddMSPlayer(missionID, nCamp);
	if self.campType[nCamp] then
		SetCampToPlayer(self.campType[nCamp]);
	end
end
function msCamp:removePlayer(missionID, nCamp)
	DelMSPlayer(missionID, nCamp);
end
function msCamp:removeAllPlayer(missionID, nCamp)
	local total = self:getCount(missionID,nCamp);
	local oldPidx = PlayerIndex;
	local nPId, nPIndex = 0, 0;
	for i = 1,total do
		nPId, nPIndex = GetNextPlayer(missionID,0,nCamp);
		PlayerIndex = nPIndex;
		if PlayerIndex > 0 then
--			print("remove", PlayerIndex, GetName());
			self:removePlayer(missionID, nCamp);
		end
	end
	PlayerIndex = oldPidx;
end
function msCamp:getCount(missionID,nCamp)
	return GetMSPlayerCount(missionID, nCamp or 0);
end
function msCamp:reflash(nCamp)
	self.players = {};
	tIndex = self.players;
	local nTotalPlayerNum = GetMSPlayerCount(this.missionID,nCamp);
	local nPId, nPIndex = 0,0;
	if nTotalPlayerNum ~= 0 then
		for i=1,nTotalPlayerNum do
			nPId, nPIndex = GetNextPlayer(this.missionID,nPId,nCamp);
			if nPIndex > 0 then
				tIndex[i] = nPIndex;
			end
		end
	end;
	if nTotalPlayerNum ~= getn(tIndex) then
		WriteLog("[To�n b� h�m s� b�o l�i]: trong h�m s� ms_GetMSPlayerIndex nh�n ���c s� ng��i c�a phe n�o �� so v�i getn(tIndex) kh�ng ��ng nh�t. S� ng��i:"..nTotalPlayerNum..", getn(tIndex) ch�nh l�ch l�:"..getn(tIndex));
	end;
--	self.lastReflashTime = GetTime()
	return self.players;
end
function msCamp:turnPlayer(nCamp,funOper, ...)
	self:reflash(nCamp);
	local oldPlayerIdx = PlayerIndex;
	for i, p in self.players do
		PlayerIndex = p;
		funOper(gf_UnPack(arg));
	end
	PlayerIndex = oldPlayerIdx;
end
-------------------------------------------------------------------------------
msOption = {
	--�������
	nInitFightState = 1,	--��ʼս��״̬������Missionʱ��ս��״̬��
	szInitDeahScript = "",	--��ʼ�����ű�������Missionʱ�������ű���

	bSetPkFlag = 1,      --��������ģʽ
	bSetPkCamp = 1,      --����pkģʽ
	bForbidChangePK = 1,	--����ؿ�ʱ�Ƿ��ֹת��PK״̬
	bUseScrollEnable = 0,	--����ؿ�ʱ�Ƿ�����ʹ�ûسǷ�
	bForbitTrade = 1,		--����ؿ�ʱ�Ƿ��ֹ����
	bStallEnable = 0,		--����ؿ�ʱ�Ƿ������̯
	bOpenFriendliness = 0,	--����ؿ�ʱ�Ƿ�������Ӻøж�
	bDeathPunish = 0,		--����ؿ�ʱ�Ƿ��������ͷ�
	bClearMomentum = 1,		--����ؿ�ʱ�Ƿ�Ҫ���ɱ��ֵ
	bInteractiveEnable = 0,	--����ؿ�ʱ�Ƿ���������������
	bForbitTeam = 1,		--����ؿ�ʱ�Ƿ��ֹ�������
	bLeaveTeam = 0,			--����ؿ�ʱ�Ƿ�Ҫ�뿪����
	bForbitMomentum = 1,	--��������ɱ��ֵ
	bForbitSuperSkill = 0,	--��������

	--�뿪����
	nRestoreFightState = 0,	--�뿪ʱҪ�ָ���ս��״̬���뿪Missionʱ��ս��״̬��
	szRestoreDeahScript = "",	--�뿪MissionʱҪ�ҵ������ű�

	bRestoreSetPkFlag = 0,      --��������ģʽ
	bRestoreSetPkCamp = 0,      --����pkģʽ
	bRestoreForbidChangePK = 0,		--�뿪�ؿ�ʱ�Ƿ��ֹת��PK״̬
	bRestoreUseScrollEnable = 1,	--�뿪�ؿ�ʱ�Ƿ�����ʹ�ûسǷ�
	bRestoreForbitTrade = 0,		--�뿪�ؿ�ʱ�Ƿ��ֹ����
	bRestoreStallEnable = 1,		--�뿪�ؿ�ʱ�Ƿ������̯
	bRestoreOpenFriendliness = 1,	--�뿪�ؿ�ʱ�Ƿ�������Ӻøж�
	bRestoreDeathPunish = 1,		--�뿪�ؿ�ʱ�Ƿ��������ͷ�
	bRestoreClearMomentum = 0,		--�뿪�ؿ�ʱ�Ƿ�Ҫ���ɱ��ֵ
	bRestoreInteractiveEnable = 1,	--�뿪�ؿ�ʱ�Ƿ���������������
	bRestoreForbitTeam = 0,			--�뿪�ؿ�ʱ�Ƿ��ֹ�������
	bRestoreLeaveTeam = 0,			--�뿪�ؿ�ʱ�Ƿ�Ҫ�˶�
	bRestoreTempEffect = 1,			--�뿪�ؿ�ʱ�Ƿ������ʱ״̬
}
function msOption:check(nCamp)
	return 1;
end
function msOption:OnPlayerJoin(nCamp)
end
function msOption:OnPlayerLeave(nCamp)
end
function msOption:setState(nCamp)
--	print("�������״̬...");
	nCamp = nCamp or 1;
	
	if self.bLeaveTeam == 1 then
		LeaveTeam();		--�뿪����
	end;

	SetLogoutRV(1);	--���õ�½��Ϊ����������
--	CreateTrigger(3,self.tbLogTrigger.nID,self.tbLogTrigger.nCustomID);	--������½������
	if self.nInitFightState then
		SetFightState(self.nInitFightState);	--ս��״̬
	end
	SetDeathScript(self.szInitDeahScript);	--�����ű�
	ForbidChangePK(0);
	SetPKFlag(self.bSetPkFlag, nCamp);
	ForbidChangePK(self.bForbidChangePK);	--ת��PK״̬
	UseScrollEnable(self.bUseScrollEnable);	--ʹ�ûسǷ�
	ForbitTrade(self.bForbitTrade);	--����
	StallEnable(self.bStallEnable);	--��̯
	OpenFriendliness(self.bOpenFriendliness);	--�øж�
	SetDeathPunish(self.bDeathPunish);	--�����ͷ�
	InteractiveEnable(self.bInteractiveEnable);	--����
	SetCreateTeam(self.bForbitTeam);
	SetMomentumBoundSwitch(self.bForbitMomentum);	--������ɱ��ֵ
	gf_ForbidFactionSkill(self.bForbitSuperSkill);	--��������
	
	if self.bClearMomentum == 1 then
		SetMomentum(0);		--���ɱ��ֵ
	end;

	ResetToNpcDamage(0);
	ResetToPlayerDamage(0);
	StopTimeGuage(-2);	--��������ʱ��

	if self.bSetRebornPos == 1 then
		self:SetRandomRebornPos(nCamp);
	end;
	self:OnPlayerJoin(nCamp);
end
function msOption:restoreState()
--	print("�ָ����״̬, ���ڻع�...");

	local nClosingState = GetMissionV(MV_MISSION_STATUS);
	if self.bRestoreLeaveTeam == 1 or nClosingState ~= 1 then
		LeaveTeam();	--�뿪����
	end;
	
--	SetLogoutRV(0);	--���õ�½��Ϊ��������
--	RemoveTrigger(GetTrigger(msOption.tbLogTrigger.nCustomID));	--ɾ����½������
	if self.nRestoreFightState then
		SetFightState(self.nRestoreFightState);	--ս��״̬
	end
	SetDeathScript(self.szRestoreDeahScript);	--�����ű�

	ForbidChangePK(self.bRestoreForbidChangePK);	--PK״̬
	SetPKFlag(self.bRestoreSetPkFlag,self.bRestoreSetPkCamp); --����pkģʽ;
	UseScrollEnable(self.bRestoreUseScrollEnable);	--�سǷ�
	ForbitTrade(self.bRestoreForbitTrade);	--��ֹ����
	StallEnable(self.bRestoreStallEnable);	--��ֹ��̯
	OpenFriendliness(self.bRestoreOpenFriendliness);	--�����Ӻøж�
	SetDeathPunish(self.bRestoreDeathPunish);	--�����ͷ�
	InteractiveEnable(self.bRestoreInteractiveEnable);	--����
	SetCreateTeam(self.bRestoreForbitTeam);
	if self.bRestoreClearMomentum == 1 then
		SetMomentum(0);		--���ɱ��ֵ
	end;
	SetMomentumBoundSwitch(0);	--��������ɱ��ֵ
	gf_ForbidFactionSkill(0);	--��������

	SetTempRevPos(0,0,0);	--��ʱ���������
	SetCampToPlayer("");	--���ս����Ӫ
	StopTimeGuage(-2);	--��������ʱ��
	ResetToNpcDamage(0);
	ResetToPlayerDamage(0);

	if IsPlayerDeath() == 1 then	--�������
		RevivePlayer(0);	--ԭ�ظ���
	end;
	if self.bRestoreTempEffect == 1 then
		RemvoeTempEffect(); --���������ϵ�������ʱ״̬
	end
	self:OnPlayerLeave(nCamp);
end
-------------------------------------------------------------------------------
msPosition = {}
function msPosition:getMapID()
	return GetMissionV(MV_MAP_ID);
end
function msPosition:getMapIdx()
	return GetMissionV(MV_MAP_INDEX)
end
function msPosition:getTemplateMapID()
	return GetMapTemplate(self:getMapIdx());
end

function msPosition:getEntryPos(nCamp)
	local pos = self.entryPos;
	if type(pos[1]) == "table" then
		pos = pos[nCamp] or pos[1];
	end
	if type(pos) == "table" and type(pos[1]) == "table" then
		pos = pos[random(getn(pos))];
	end
	return self:getMapID(), gf_UnPack(pos);
end

function msPosition:getExitPos()
	local test = self.exitPos[1]
	if type(test) == "table" then
		return gf_UnPack(self.exitPos[random(getn(self.exitPos))]);
	elseif type(test) == "number" then
		return gf_UnPack(self.exitPos);
	end
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
missionBase = {
	msCamp = msCamp,
	msOption = msOption,
	msPosition = msPosition,
	msPhases = {},
}
missionBase = inherit(missionHead, missionBase);
this = missionBase;

function missionBase:_Enter(nCamp)
	--print(GetMissionV(MV_MISSION_OPEN_STATE))
	if GetMissionV(MV_MISSION_OPEN_STATE) ~= 1 then
		local mapID, mapIdx = GetMissionV(MV_MAP_ID), GetMissionV(MV_MAP_INDEX);
		self:log(format("[Enter l�i] [name=%s, missioniD=%d, mapiD=%d, mapidx=%d]", self.name, self.missionID, mapID, mapIdx));
		return 0;
	end
	self.msOption:check(nCamp);
	local m,x,y = self.msPosition:getEntryPos(nCamp);
--	Msg2Player("����ؿ�",m,x,y);
	--print(m,x,y)
	CleanInteractive();--��NewWorldǰ��ɢ˫�˻�������
	local oldsbwd = SubWorld;
	if NewWorld(m,x,y) == 1 then
		self:onJoin(nCamp);
	end
	SubWorld = oldsbwd;
end

function missionBase:_TeamEnter(nCamp)
	gf_TeamOperate(self._Enter, self, nCamp);
end

function missionBase:Close()
--	print("missionBase:Close")
	self.msCamp:removeAllPlayer(self.missionID, 0);
	ClearMapNpc(self.msPosition:getMapID());
	for k,v in self.msPhases do
--		print("self.missionID, v.timerID",self.missionID, v.timerID)
--		print("v.second,v.step",v.second,v.step)
		StopMissionTimer(self.missionID, v.timerID);
--		v.second = 0;
--		v.step = 0;
	end
	StopTimeGuage(-1);
	local mapID, mapIdx = GetMissionV(MV_MAP_ID), GetMissionV(MV_MAP_INDEX);
--	print("mapID, mapIdx =",mapID, mapIdx)
	self:clearData();
	if self.dynamicMap ~= 0 and mapID ~= 0 and mapIdx ~= 0 then
		FreeDynamicMap(mapID, mapIdx);
		if self.onMissionClose and type(self.onMissionClose) == "function" then
			self:onMissionClose();
		end
		self:log(format("[mission ��ng] [name=%s, missionID=%d, mapID=%d, mapIdx=%d]", self.name, self.missionID, mapID, mapIdx));
	end
end

-------------------------------------------------------------------------------
function missionBase:onInit(mapID, mapIndex, mapReturnID)
--	print("missionBase:onInit")
--	ClearMapNpc(self.msPosition:getMapID(),nil);
--	self:clearData();
--	print("mapID, mapIndex, mapReturnID =", mapID, mapIndex, mapReturnID)
	if mapID and mapIndex and mapReturnID then
		SetMissionV(MV_MAP_ID, mapID);
		SetMissionV(MV_MAP_INDEX, mapIndex);
		SetMissionV(MV_RETURN_MAP_ID, mapReturnID);
	end
	SetMissionV(MV_MISSION_OPEN_STATE,1);
	for k,v in self.msPhases do
--		print("v",type(v))
--		print("v.timerID",v.timerID)
--		print("self.missionID,self.name",self.missionID,self.name)
		v:onInit()
		StartMissionTimer(self.missionID, v.timerID, v.frequency);
	end
	if self.onMissionInit and type(self.onMissionInit) == "function" then
		self:onMissionInit();
	end
end
function missionBase:onJoin(nCamp)
--	print("missionBase:onJoin")
	self.msCamp:addPlayer(self.missionID, nCamp);
	self.msOption:setState(nCamp);
	for k,v in self.msPhases do
		v:addTimeGuage();
	end 
end

function missionBase:onLeave()
--	print("missionBase:onLeave")
	self.msOption:restoreState();
	local m,x,y = this.msPosition:getExitPos();
--	print("�뿪�ؿ�",m,x,y);
	if NewWorld(m,x,y) == 1 then
		SetLogoutRV(0)	-- NewWorld�ɹ������0, ��Ϊ����п���������leave	
	end
end
-------------------------------------------------------------------------------
function missionBase:clearData()
	for i = 1, 100 do
		SetMissionV(i, 0);
	end
	for i = 1, 10 do
		SetMissionS(i, "");
	end
end

function missionBase:Msg2MSAll(msg)
	Msg2MSAll(self.missionID, msg)
end
----------------------------------------------------------------
function missionBase:onEvent(event, data)
	local nRet;
	for _, v in self.msPhases do
		nRet = v:onEvent(event, data);
	end
	return nRet;
end

function main(id)
	if not id then
		this:onEvent("Talk");
	else
		this:onEvent("Trap", id);
	end
end

function onPlayerDeath(killer)
--	Msg2Player("������");
	local nRet = this:onEvent("PlayerDeath", killer);
	return nRet;
end

function onNpcDeath(npcIdx, f, x)
	local nRet = this:onEvent("NpcDeath", {npcIdx, f, x});
	return nRet;
end

function OnDeath(id, f, x)
	--print("============OnDeath",PlayerIndex, id, f, x)
	local nRet;
	if f == nil then
		nRet = onPlayerDeath(id);
	else
		if x then
			SubWorld = f;
		end
		local oldPIdx = PlayerIndex;
		if not PlayerIndex or PlayerIndex <= 0 then
			local nPId, nPIndex = GetNextPlayer(this.missionID,0,0);
			PlayerIndex = nPIndex;
		end
		onNpcDeath(id, f, x);
		PlayerIndex = oldPIdx;
	end
	return nRet;
end

function onTrap(id)
	this:onEvent("Trap", id);
end

function OnRemove(npcIdx)
	SetNpcRemoveScript(npcIdx,"");
	local m = GetNpcWorldPos(npcIdx);
	local nOld = SubWorld;
	SubWorld = SubWorldID2Idx(m);
	this:onEvent("NpcRemove", npcIdx);
	SubWorld = nOld;
end

function OnRevive()
	--print("OnRevive()")
	local nRet = this:onEvent("OnRevive");
	return nRet;
end