Include("\\script\\online_activites\\2010_12\\activity_05\\head.lua");
Include("\\script\\lib\\missionfunctions.lua");
Include("\\script\\lib\\globalfunctions.lua");

function main()
	local head = "";
	local menu = {};
	local mapID = SubWorldIdx2ID(SubWorld);
	local monsterWave = SB_GetMonsterWave(mapID);	
	--WriteLog("main::SubWorld: "..SubWorld..", mapID: "..mapID);	
	
	if 0 == monsterWave then
		head = "Mu�n khi�u chi�n v�i ta? V�n c�n h�i s�m, h�y h�i th�m c�c th� h� c�a ta tr��c �i ("..(monsterWave+1).."/"..SB_MONSTER_WAVE_THRESHOLD..")";
		tinsert(menu, "Kh�ng v�n ��/#SB_SpawnWaveMonsters("..mapID..")");
		tinsert(menu, "Ta s� ��i/gf_DoNothing");	
	elseif 0 == SB_IsMonsterWaveKilled(mapID) and 0 == SB_IsMonsterWaveTimeout(mapID) then
		head = "T�t nh�t ng��i n�n ��nh b�i c�c th� h� c�a ta ��"
		tinsert(menu, "T�t th�i/gf_DoNothing");
	else
		--WriteLog("main::monsterWave: "..monsterWave);	
		if monsterWave < SB_MONSTER_WAVE_THRESHOLD then
			head = "Mu�n khi�u chi�n v�i ta? V�n c�n h�i s�m, h�y h�i th�m c�c th� h� c�a ta tr��c �i ("..(monsterWave+1).."/"..SB_MONSTER_WAVE_THRESHOLD..")";
			tinsert(menu, "Kh�ng v�n ��/#SB_SpawnWaveMonsters("..mapID..")");
			tinsert(menu, "Ta s� ��i/gf_DoNothing");
		else
			head = "��n khi�u chi�n ta n�o";
			tinsert(menu, "Ta ��n ��y/SB_SpawnBoss");
			tinsert(menu, "Ta s� ��i/gf_DoNothing");
		end
	end
	Say(head, getn(menu), menu);
end