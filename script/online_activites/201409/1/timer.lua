Include("\\script\\online_activites\\201409\\1\\mission.lua")

function OnTimer()
	if hd_IsActivityOpen() ~= 1 then
		EndMission();
		return 0;
	end
	local nMMap = GetGlbValue(HD_GV_ID[1]);
	--DebugOutput("HD_MISSION_ID[1] =", mf_GetMissionV(HD_MISSION_ID[1], 1, nMMap), mf_GetMissionV(HD_MISSION_ID[1], 2, nMMap), mf_GetMissionV(HD_MISSION_ID[1], 3, nMMap));
	local nTime = mf_GetMissionV(HD_MISSION_ID[1], 3, nMMap);
	if GetTime() - nTime > 1800 then
		EndMission();
		return 0;
	end
	local npcIndex = mf_GetMissionV(HD_MISSION_ID[1], 2, nMMap);
	if hd_IsActivate(npcIndex) ~= 1 then
		return 0;
	end
	local nStep = mf_GetMissionV(HD_MISSION_ID[1], 99, nMMap);
	mf_SetMissionV(HD_MISSION_ID[1], 99, nStep + 1, nMMap);
	DebugOutput("nStep =", nStep, HD_MISSION_ID[1]);
	if nStep == 2 or nStep ==  602 or nStep == 1202 or nStep == 1802 then
		local nMapID, nX, nY = GetNpcWorldPos(npcIndex);
		local npcIdx = CreateNpc("wugangzuoqi", "Th� C�ng C�a Ch� Cu�i", nMapID, nX + random(-2, 2), nY + random(-2, 2));
		if npcIdx > 0 then
			SetNpcDeathScript(npcIdx, "\\script\\online_activites\\201409\\wugang_death.lua");
			SetNpcLifeTime(npcIdx, 5 * 60);
			Msg2SubWorld("Xung quanh ��n Hoa ��ng s� xu�t hi�n Th� C�ng C�a Ch� Cu�i, m�i ng��i h�y nhanh ch�ng �i khi�u chi�n n�o!");
		end
	end
	if nStep > 2000 then
		EndMission();
	end
end
