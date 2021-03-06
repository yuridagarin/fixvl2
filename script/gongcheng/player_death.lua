--create date:07-04-16
--author:yanjun
--describe:死亡脚本
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
	ClearColdDown();	--清药CD
	SetTempRevPos(nCurMapID,tEntrancePos[nDeathCamp][1]*32,tEntrancePos[nDeathCamp][2]*32);	--设置重生点
	if GetTaskTemp(TEMP_ARENA_FIGHTING) ~= 0 then	--如果在是单挑时死的
		local nDoorIdx = GetTaskTemp(TEMP_GURAD_ID);
		local nKillerIdx = GetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nEnemyCamp-1);
		if nKillerIdx == 0 then
			WriteLog("[C玭g th祅h chi課 b? l鏸]: file script t? vong ch? ra link S竧 th? b? l鏸");
		end;
		local tPlayer = {nDeathIdx,nKillerIdx};
		if nDeathCamp == SHOU_ID and nDoorIdx ~= 0 then	--如果是守城方门卫死了
			SetMissionV(MV_SPIDX_EAST_DOOR+2*(nDoorIdx-1),0);	--请空相应的守城者变量
			SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1),nKillerIdx);	--设置相应的攻城者变量
			SetMissionV(MV_TRAP_EAST_DOOR+nDoorIdx-1,ALL_ID);
		elseif nDeathCamp == GONG_ID and nDoorIdx ~= 0 then	--如果是攻城方门卫死了
			SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1),0);	--请空相应的攻城者变量
			SetMissionV(MV_SPIDX_EAST_DOOR+2*(nDoorIdx-1),nKillerIdx);	--设置相应的守城者变量		
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
				PlaySound("\\sound\\单挑胜利.wav");
				Say("B筺  gi祅h th緉g l頸 trong t n u n祔!",0);
			else
				PlaySound("\\sound\\单挑失败.wav");
				Say("B筺  thua trong l莕 n u n祔, c? g緉g h琻 nh?!",0);
				SetTaskTemp(TEMP_GURAD_ID,0);
			end;
			SetTaskTemp(TEMP_FIGHT_STATE,0);
			SetTaskTemp(TEMP_ARENA_FIGHTING,0);
			SetMissionV(MV_EAST_DOOR_DRAW+nDoorIdx-1,0);	--连续平局记录清0
			SetPos(tEntrancePos[nCamp][1],tEntrancePos[nCamp][2]);
			Msg2Player("T? chi課 trng n u quay v? h藆 doanh!");
		end;
		if GetTaskTemp(TEMP_CHALLENGER) == 1 then	--挑战者获胜 
			Msg2MSAll(MISSION_ID,"Чi hi謕"..GetName(nKillerIdx).."("..tCampNameZ[nEnemyCamp]..") khi猽 chi課 n u  th緉g "..GetName(nDeathIdx).."("..tCampNameZ[nDeathCamp].."), cp 頲 "..tDoorName[nDoorIdx]);
		else
			Msg2MSAll(MISSION_ID,"Чi hi謕"..GetName(nKillerIdx).."("..tCampNameZ[nEnemyCamp]..") khi猽 chi課 n u  th緉g "..GetName(nDeathIdx).."("..tCampNameZ[nDeathCamp].."), gi? 頲 "..tDoorName[nDoorIdx]);
		end;
		SetTaskTemp(TEMP_CHALLENGER,0);
		PlayerIndex = nOldPlayerIdx;
		return 1;
	end;--单挑if
	Msg2SomeOne(nRealKillerIdx,"B筺  gi誸"..szDeathName);
	Msg2Player("B筺 b? "..szKillerName.."  gi誸 ");
	return 0;
end;