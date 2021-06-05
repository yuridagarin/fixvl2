--create date:07-04-16
--author:yanjun
--describe:�����ű�
Include("\\script\\gongcheng\\gongcheng_function.lua");
function OnDeath(nNpcIdx)
	local nDeathIdx = PlayerIndex;
	local nOldPlayerIdx = PlayerIndex;
	local nRealKillerIdx = NpcIdx2PIdx(nNpcIdx);
	local szDeathName = GetName(nDeathIdx);
	local szKillerName = GetName(nRealKillerIdx);
	local nDeathCamp = GCZ_GetPlayerCamp();
	local nEnemyCamp = GCZ_GetEnemyCamp();
	SetTask(TNC_KILL,GetTask(TNC_KILL,nRealKillerIdx)+1, 0, nRealKillerIdx);
	SetMissionV(MV_DEATH_GONG+nDeathCamp-1,GetMissionV(MV_DEATH_GONG+nDeathCamp-1)+1);
	local nCurMapID = GetWorldPos();
	ClearColdDown();	--��ҩCD
	SetTempRevPos(nCurMapID,tEntrancePos[nDeathCamp][1]*32,tEntrancePos[nDeathCamp][2]*32);	--����������
	if GetTaskTemp(TEMP_ARENA_FIGHTING) ~= 0 then	--������ǵ���ʱ����
		local nDoorIdx = GetTaskTemp(TEMP_GURAD_ID);
		local nKillerIdx = GetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nEnemyCamp-1);
		if nKillerIdx == 0 then
			WriteLog("[C�ng th�nh chi�n b� l�i]: file script t� vong ch� ra link S�t th� b� l�i");
		end;
		local tPlayer = {nDeathIdx,nKillerIdx};
		if nDeathCamp == SHOU_ID and nDoorIdx ~= 0 then	--������سǷ���������
			SetMissionV(MV_SPIDX_EAST_DOOR+2*(nDoorIdx-1),0);	--�����Ӧ���س��߱���
			SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1),nKillerIdx);	--������Ӧ�Ĺ����߱���
			SetMissionV(MV_TRAP_EAST_DOOR+nDoorIdx-1,ALL_ID);
		elseif nDeathCamp == GONG_ID and nDoorIdx ~= 0 then	--����ǹ��Ƿ���������
			SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1),0);	--�����Ӧ�Ĺ����߱���
			SetMissionV(MV_SPIDX_EAST_DOOR+2*(nDoorIdx-1),nKillerIdx);	--������Ӧ���س��߱���		
			SetMissionV(MV_TRAP_EAST_DOOR+nDoorIdx-1,SHOU_ID);
		end;
		for i=1,2 do
			PlayerIndex = tPlayer[i];
			local nCamp = GCZ_GetPlayerCamp();
			RemoveTrigger(GetTrigger(FIGHT_TRIGGER_ID));
			SetFightState(0);
			Restore();
			RestoreNeili();
			if PlayerIndex == nKillerIdx then
				PlaySound("\\sound\\����ʤ��.wav");
				Say("B�n �� gi�nh th�ng l�i trong ��t ��n ��u n�y!",0);
			else
				PlaySound("\\sound\\����ʧ��.wav");
				Say("B�n �� thua trong l�n ��n ��u n�y, c� g�ng h�n nh�!",0);
				SetTaskTemp(TEMP_GURAD_ID,0);
			end;
			SetTaskTemp(TEMP_FIGHT_STATE,0);
			SetTaskTemp(TEMP_ARENA_FIGHTING,0);
			SetMissionV(MV_EAST_DOOR_DRAW+nDoorIdx-1,0);	--����ƽ�ּ�¼��0
			SetPos(tEntrancePos[nCamp][1],tEntrancePos[nCamp][2]);
			Msg2Player("T� chi�n tr��ng ��n ��u quay v� h�u doanh!");
		end;
		if GetTaskTemp(TEMP_CHALLENGER) == 1 then	--��ս�߻�ʤ 
			Msg2MSAll(MISSION_ID,"��i hi�p"..GetName(nKillerIdx).."("..tCampNameZ[nEnemyCamp]..") khi�u chi�n ��n ��u �� th�ng "..GetName(nDeathIdx).."("..tCampNameZ[nDeathCamp].."), c��p ���c "..tDoorName[nDoorIdx]);
		else
			Msg2MSAll(MISSION_ID,"��i hi�p"..GetName(nKillerIdx).."("..tCampNameZ[nEnemyCamp]..") khi�u chi�n ��n ��u �� th�ng "..GetName(nDeathIdx).."("..tCampNameZ[nDeathCamp].."), gi� ���c "..tDoorName[nDoorIdx]);
		end;
		SetTaskTemp(TEMP_CHALLENGER,0);
		PlayerIndex = nOldPlayerIdx;
		return 1;
	end;--����if
	Msg2SomeOne(nRealKillerIdx,"B�n �� gi�t"..szDeathName);
	Msg2Player("B�n b� "..szKillerName.." �� gi�t ");
	return 0;
end;