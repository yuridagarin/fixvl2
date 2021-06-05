Include("\\script\\online\\item_buchang\\ibc_head.lua")
Include("\\script\\online\\item_buchang\\mission.lua")

function OnTimer()
	if ibc_IsOpen() ~= 1 then
		EndMission();
		return 0;
	end
	
	local npcIndex = mf_GetMissionV(IBC_MISSION_ID, IBC_MISION_V1, IBC_MAPID);
	if IsNpcDeath(npcIndex) ~= 0 then
		EndMission();
	end
	
	local nStep = mf_GetMissionV(IBC_MISSION_ID, 99, IBC_MAPID);
	mf_SetMissionV(IBC_MISSION_ID, 99, nStep + 1, IBC_MAPID);
	local nMax, nCur = GetUnitCurStates(npcIndex, 1);	
	
	if mod(nStep, 10) == 0 and nMax > nCur then
		local tMsg = {
			[1] = "S� vi�c hack item l�n n�y, th�t xin l�i m�i ng��i!",
			[2] = "S� vi�c hack item l�n n�y �� g�y phi�n ph�c cho m�i ng��i!",
			[3] = "S� vi�c hack item l�n n�y, ch�ng t�i xin nh�n l�i!",
			[4] = "S� vi�c hack item l�n n�y, ui da, xin nh� tay ch�t!",
			[5] = "Sau n�y ch�ng t�i s� c� g�ng ng�n ch�n v� h�n ch� v�n �� hack item.",
			[6] = "Nh� m�i ng��i kh�ng n�n mua item hack �� c�ng nhau duy tr� m�i tr��ng tr� ch�i l�nh m�nh v� c�ng b�ng.",
		}
		local nIndex = mod(floor(nStep/10), 6);
		if nIndex == 0 then
			nIndex = 6;
		end
		NpcChat(npcIndex, tMsg[nIndex]);
	end
	
	local nIndex = floor((nMax - nCur)/(nMax / 10));
	if nIndex >= 1 and nIndex < 10 then
		if GetNpcTempData(npcIndex, nIndex) == 0 then
			for i = 1, 30 do
				local npcIdx = CreateNpc("BC_xiaobaoxiang", "R��ng Nh� ��n B�", IBC_MAPID, IBC_MAP_X + random(-15, 15), IBC_MAP_Y + random(-15, 15));
				SetNpcScript(npcIdx, "\\script\\online\\item_buchang\\box_small.lua");
				SetNpcLifeTime(npcIdx, 5 * 60);
			end
			SetNpcTempData(npcIndex, nIndex, 1);
		end
	end
	
	if nStep > 1800 then
		EndMission();
	end
end
