Include("\\script\\missions\\taiyi\\head.lua");
Include("\\settings\\static_script\\missions\\base\\missionbase.lua");
Include("\\script\\missions\\taiyi\\tyfunctions.lua");
Include("\\script\\lib\\npccmdhead.lua");
Include("\\script\\lib\\floyd.lua");
Include("\\script\\missions\\taiyi\\stage\\tstage00.lua");
Include("\\script\\missions\\taiyi\\stage\\tstage01.lua");
Include("\\script\\missions\\taiyi\\stage\\tstage02.lua");
Include("\\script\\missions\\taiyi\\stage\\tstage03.lua");
Include("\\script\\missions\\taiyi\\stage\\tstage04.lua");
Include("\\script\\missions\\taiyi\\stage\\tstage05.lua");
Include("\\script\\missions\\taiyi\\stage\\tstage06.lua");

function OnTrap(nTrapId)
	if 1 == nTrapId then
		tStage06_2:OnTrap(nTrapId);
	end
end

--̫һ������
-----------------------------------------------------------------
tPhaseDriver.phases = {tStage00, tStage01, tStage02, tStage03, tStage04, tStage05, tStage06};	

tPhaseDriver.name = "PhaseDriver";

function tPhaseDriver:onTimeout()
	this:Msg2MSAll("K�t th�c �i!");
	TY_ReviveAll(0);
	TY_ConfirmClose();
end

function tPhaseDriver:GetPhase()
	local nLevel = GetMissionV(self.curPhaseLv);
	local curPhase = self.phases[nLevel];
	if not curPhase then
		WriteLog(format("[Th�i Nh�t Th�p] [tPhaseDriver:GetPhase] [nLevel = %s, tStage = %s]", tostring(nLevel), tostring(curPhase)));
		return nil;
	end
	return curPhase;
end

tTY = gf_CopyInherit(missionBase, tTY);

tTY.msOption.bSetPkFlag = 1; --����ģʽ
tTY.msOption.bSetPkCamp = 1;
tTY.msOption.szInitDeahScript = thisFile;

tTY.msPosition.entryPos = tPlayerPos[0];

tTY.msPosition.exitPos = tExitPos;

tTY.msPhases[1] = tPhaseDriver;

function TY_SelectStartPhase(nMapId, nStageId)
	local nOldSubWorldIdx = SubWorld;
	SubWorld = SubWorldID2Idx(nMapId);
	tPhaseDriver:setPhase(8);	--ֱ��������4��(̫һ���ĵ�һ��)
	SubWorld = nOldSubWorldIdx;
end

--���ý���ʱ��λ��
function TY_SetBeginPos(tPos)
	tTY.msPosition.entryPos = tPos;
end

function TY_SetPKFlag(Val1, Val2)
	tTY.msOption.bSetPkFlag = Val1;
	tTY.msOption.bSetPkCamp = Val2;
end

--��дbase���onLeave,ʹ��һص���Ӧ����ǰ�ĵ�ͼ
function tTY:onLeave()
	self.msOption:restoreState();
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), -1, 1, 1);
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 0, 1, 1);
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), -1, 0, 1);
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 0, 0, 1);
	local nMapId = GetMissionV(MV_RETURN_MAP_ID);
	local x, y = self.msPosition.exitPos[nMapId][1], self.msPosition.exitPos[nMapId][2];
	DelItem(2, 95, 1510, GetItemCount(2, 95, 1510));
	SetTask(TASKID_TAIYITA_NINGBINGJUE_FORBIDDEN, 1);
	TY_ClearAllGodState();
	if NewWorld(nMapId, x, y) == 1 then
		SetLogoutRV(0);	-- NewWorld�ɹ������0, ��Ϊ����п���������leave
	end
end

this = tTY;