Include("\\script\\lib\\globalfunctions.lua")

--------------------------------------------------------------------
Master = "\\settings\\static_script\\misc\\missionaward.lua"

g_tMAInfo = {}
g_tMAPlayerInfo = {}
g_nIdx = 1;
--------------------------------------------------------------------
-- �ű��ӿ�
function MA_OpenUI(tPlayer, file, cbfunc, tRequire)
--	if not tPlayer or getn(tPlayer) < 1 or not not cbfunc or not tRequire then return end
	g_tMAInfo[g_nIdx] = {free={},tRequire=tRequire}
	local oldPid = PlayerIndex
	for i = 1, getn(tPlayer) do
		PlayerIndex = tPlayer[i];
		MA_RegisterCallback(GetName(), file, cbfunc);
		OpenMissionAward(tRequire);
		g_tMAPlayerInfo[GetName()] = g_nIdx;
	end
	PlayerIndex = oldPid;
	g_nIdx = g_nIdx + 1;
	return 1;
end

--���鷭��
function MA_Team_OpenUI(file, cbfunc, tAwardRequire)
--print("MA_Team_OpenUI", file, cbfunc, tAwardRequire);
	local tPlayer = {}
	for i = 1, GetTeamSize() do
		tinsert(tPlayer, GetTeamMember(i));
	end
--print(Val2Str(tPlayer))
	MA_OpenUI(tPlayer, file, cbfunc, tAwardRequire)
end

--mission�ؿ�����
function MA_Mission_OpenUI(nMissionID,nCamp,file, cbfunc, tAwardRequire)
	local tPlayer = {}
	local nTotalPlayerNum = GetMSPlayerCount(nMissionID,nCamp);
	local nPId, nPIndex = 0,0;
	if nTotalPlayerNum ~= 0 then
		for i=1,nTotalPlayerNum do
			nPId, nPIndex = GetNextPlayer(nMissionID,nPId,nCamp);
			if nPIndex > 0 then
				tPlayer[i] = nPIndex;
			end
		end
	end;
	if nTotalPlayerNum ~= getn(tPlayer) then
		WriteLog("[H�m s� to�n c�m b� l�i]: Trong H�m s� ms_GetMSPlayerIndex nh�n ���c s� ng��i phe n�o �� v� getn(tPlayer) kh�ng gi�ng nhau. S� ng��i  trong tr�n doanh  l�:"..nTotalPlayerNum..", getn(tPlayer)l�n nh� l� "..getn(tIndex));
	end;
	MA_OpenUI(tPlayer, file, cbfunc, tAwardRequire)
end

function MA_RegisterCallback(name, file, cbfunc)
	SendScript2VM(Master, format("MA_RegisterCallback('%s',[[%s]],'%s')",gf_GetSafeStr(name),file, cbfunc))
end

function MA_SyncItem(tPlayer, nId, g, d, p, n, name)
	if not tPlayer or getn(tPlayer) < 1 then return end
	local oldPid = PlayerIndex
	for i = 1, getn(tPlayer) do
		PlayerIndex = tPlayer[i];
		MissionAwardSyncItem(nId, g, d, p, n, name);
	end
	PlayerIndex = oldPid;
	return 1;
end

function MA_Team_SyncItem(nId, g, d, p, n, name)
	local tPlayer = {}
	for i = 1, GetTeamSize() do
		tinsert(tPlayer, GetTeamMember(i));
	end
	MA_SetOpened(nId)
	MA_SyncItem(tPlayer, nId, g, d, p, n, name)
end

function MA_SetOpened(nId)
	local tInfo = g_tMAInfo[g_tMAPlayerInfo[GetName()]];
	tInfo[nId] = 1;
	if nId < 8 then
		tInfo.free[GetName()] = 1;
	end
	--SendScript2VM(Master, format("MA_SetOpened(%d)", nId));
end

function MA_CheckOpened(nId)
	local tInfo = g_tMAInfo[g_tMAPlayerInfo[GetName()]];
	if not tInfo then return 1 end
	if nId < 8 and tInfo.free[GetName()] == 1 then
		return 1;
	end
	return tInfo[nId] == 1;
end

function MA_CallBack(cbfunc, nId)
	if MA_CheckOpened(nId) == 1 then
		return
	end
	dostring(format("%s(%d)",cbfunc, nId));
end

function MA_GetRequire(nId)
	if nId < 8 then return end
	nId = nId - 7;
	local tInfo = g_tMAInfo[g_tMAPlayerInfo[GetName()]];
	local tRequire = tInfo.tRequire[nId];
	return tRequire;
end
