Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");

function InitMission()
	TMZ_InitBattle();
	local nMapId = gf_GetCurMapID();
	local nNpcIdx = 0;
	
	--========这里创建战场npc =================
	for i = 1,getn(tPositionNpcA)-1 do
		nNpcIdx = CreateNpc(tPositionNpcA[i][1],tPositionNpcA[i][2],nMapId,tPositionNpcA[i][3],tPositionNpcA[i][4]);
		SetNpcDeathScript(nNpcIdx,NPC_DEATH_SCRIPT);
		SetCampToNpc(nNpcIdx,Neutral_Type);
	end
	for i = 1,getn(tPositionNpcB)-1 do
		nNpcIdx = CreateNpc(tPositionNpcB[i][1],tPositionNpcB[i][2],nMapId,tPositionNpcB[i][3],tPositionNpcB[i][4]);
		SetNpcDeathScript(nNpcIdx,NPC_DEATH_SCRIPT);
		SetCampToNpc(nNpcIdx,Neutral_Type);
	end
	for i = 1,getn(tPositionNpcC)-1 do
		nNpcIdx = CreateNpc(tPositionNpcC[i][1],tPositionNpcC[i][2],nMapId,tPositionNpcC[i][3],tPositionNpcC[i][4]);
		SetNpcDeathScript(nNpcIdx,NPC_DEATH_SCRIPT);
		SetCampToNpc(nNpcIdx,Neutral_Type);
	end
	for i = 1,getn(tPositionNpcS[2]) do
		nNpcIdx = CreateNpc(tPositionNpcS[1][1],tPositionNpcS[1][2],nMapId,tPositionNpcS[2][i][1],tPositionNpcS[2][i][2]);
		SetNpcDeathScript(nNpcIdx,NPC_DEATH_SCRIPT);
		SetCampToNpc(nNpcIdx,Neutral_Type);
	end
	for i = 1,getn(tPositionBox) do
		nNpcIdx = CreateNpc(tPositionBox[i][1],tPositionBox[i][2],nMapId,tPositionBox[i][3],tPositionBox[i][4]);
		SetNpcDeathScript(nNpcIdx,NPC_DEATH_SCRIPT);		
	end
	--创建阵眼
	for i = 1,getn(tPositionNpcEye[0]) do
		nNpcIdx = CreateNpc(tPositionNpcEye[0][i][1],tPositionNpcEye[0][i][2],nMapId,tPositionNpcEye[0][i][3],tPositionNpcEye[0][i][4]);
		SetNpcDeathScript(nNpcIdx,NPC_DEATH_SCRIPT);
		SetCampToNpc(nNpcIdx,Neutral_Type);
	end
	--创建职能npc		
	for i = 1,getn(tPositionFo) do --八个小佛
		nNpcIdx = CreateNpc(tPositionFo[i][1],tPositionFo[i][2],nMapId,tPositionFo[i][3],tPositionFo[i][4]);
		SetCampToNpc(nNpcIdx,CampOne_Type);
		nNpcIdx = CreateNpc(tPositionFo[i][1],tPositionFo[i][2],nMapId,tPositionFo[i][5],tPositionFo[i][6]);
		SetCampToNpc(nNpcIdx,CampTwo_Type);
	end
	nNpcIdx = CreateNpc("C玭 L玭 ph? chng m玭",CampOne_Name.."Qu﹏ nhu quan",nMapId,tPositionCamp[1][3][1],tPositionCamp[1][3][2]);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tianmenzhen\\quartermaster_npc.lua");
	nNpcIdx = CreateNpc("C玭 L玭 ph? chng m玭",CameTwo_Name.."Qu﹏ nhu quan",nMapId,tPositionCamp[2][3][1],tPositionCamp[2][3][2]);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tianmenzhen\\quartermaster_npc.lua");	
	nNpcIdx = CreateNpc("Thi猲 Vng Bang у","Binh s? h藆 c莕",nMapId,tPositionCamp[1][4][1],tPositionCamp[1][4][2]);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tianmenzhen\\soldier_npc.lua");
	nNpcIdx = CreateNpc("Thi猲 Vng Bang у","Binh s? h藆 c莕",nMapId,tPositionCamp[2][4][1],tPositionCamp[2][4][2]);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tianmenzhen\\soldier_npc.lua");	
	nNpcIdx = CreateNpc("Thi猲 Vng Bang у","Ti襫 tuy課 qu﹏ T鑞g",nMapId,tPositionCamp[1][5][1],tPositionCamp[1][5][2]);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tianmenzhen\\tmz_trap.lua");
	nNpcIdx = CreateNpc("Thi猲 Vng Bang у","Ti襫 tuy課 qu﹏ Li猽",nMapId,tPositionCamp[2][5][1],tPositionCamp[2][5][2]);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tianmenzhen\\tmz_trap.lua");		
	--任务npc：了意、朗月、曹信真
	nNpcIdx = CreateNpc("L穘g Nguy謙","L穘g Nguy謙",nMapId,1917,3695);
	SetCampToNpc(nNpcIdx,Neutral_Type);
	nNpcIdx = CreateNpc("T祇 T輓 Tr﹏","T祇 T輓 Tr﹏",nMapId,1914,3689);	
	SetCampToNpc(nNpcIdx,Neutral_Type);
	nNpcIdx = CreateNpc("Li評 ?","Li評 ?",nMapId,1886,3758);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tianmenzhen\\liaoyi_npc.lua");

	CreateChannel("Thi猲 M玭 tr薾"..nMapId, 15);
	CreateChannel("Phe T鑞g"..nMapId, 24);
	CreateChannel("Phe Li猽"..nMapId, 25);
	--Observer:onEvent(OE_TMZ_CREATE_NPC,{nMapId,Neutral_Type}); --pvp地图传入mapID和阵营，pve传入mapID和坐标
end;

function RunMission()
	Msg2MSAll(MISSION_ID,"Th竚 t? h錳 b竜, phe ch  b総 u h祅h ng, c竎 h祇 ki謙 h穣 nhanh ch鉵g ti課 v祇 ti襫 tuy課 quy誸 m閠 tr薾 t? chi課 v韎 ch.");

	local nMapId  = gf_GetCurMapID();
	local nNpcIdx = 0;

	--boss_npc: 诡将黯月、狂将冥日
	if 1 == GLB_TMZ_RealmCheck() then
		local nDate = tonumber(date("%y%m%d"));
		for i = 1,getn(tPositionNpcBOSS) do
			if tPositionNpcBOSS[i][2][1] <= GetMissionV(MV_TMZ_TONG_CAMPONE_LV) and tPositionNpcBOSS[i][2][1] <= GetMissionV(MV_TMZ_TONG_CAMPTWO_LV) and tPositionNpcBOSS[i][2][2] >= random(1, 100) and (0 == tPositionNpcBOSS[i][2][3] or nDate ~= GetGlbValue(tPositionNpcBOSS[i][2][3])) then
				nNpcIdx = CreateNpc(tPositionNpcBOSS[i][1][1],tPositionNpcBOSS[i][1][2],nMapId,tPositionNpcBOSS[i][1][3],tPositionNpcBOSS[i][1][4]);
				SetNpcDeathScript(nNpcIdx,NPC_DEATH_SCRIPT);
				SetCampToNpc(nNpcIdx,Neutral_Type);
				if 0 ~= tPositionNpcBOSS[i][2][3] then
					SetGlbValue(tPositionNpcBOSS[i][2][3], nDate);
				end
				Msg2MSAll(MISSION_ID,"Th竚 t? h錳 b竜, ti襫 phng ph竧 hi謓"..tPositionNpcBOSS[i][1][2]..", c竎 hi謕 s? phe ta h穣 nhanh ch鉵g 甶 ti猽 di謙.");
				break
			end
		end
	end

	TMZ_RunBattle();
end;

function EndMission()
	local nPlayerOne = GetMSPlayerCount(MISSION_ID,CampOne_ID);
	local nPlayerTwo = GetMSPlayerCount(MISSION_ID,CampTwo_ID);	
	WriteLog("[chi課 trng Thi猲 M玭 Tr薾 k誸 th骳]: th阨 gian l?"..GetMissionV(MV_TMZ_LOG_TIME).."Thi猲 M玭 Tr薾  k誸 th骳, s? ngi cu鑙 c飊g l?: ["..nPlayerOne.."]:["..nPlayerTwo.."], t鎛g s? ngi l?: "..(nPlayerOne+nPlayerTwo)); 
	TMZ_ProcessBattleOver();
	local nMapID = GetMissionV(MV_TMZ_MAP_ID);	
	ClearMapNpc(nMapID);
	local nMapIdx = GetMissionV(MV_TMZ_MAP_INDEX);
	local nShowIdx = GetMissionV(MV_TMZ_SHOWDATA_IDX);
	TMZ_Set_ShowData_Nil();
	TMZ_ClearMissionData();
	local nRetCode = FreeDynamicMap(nMapID,nMapIdx);	--FreeDynamicMap也会调用CloseMisssion
	if nRetCode ~= 1 then
		WriteLog("[chi課 trng Thi猲 M玭 Tr薾]: FreeDynamicMap b竜 l鏸, nRetCode:"..nRetCode);
	end;		
	DeleteChannel("Thi猲 M玭 tr薾"..nMapID, 15);
	DeleteChannel("Phe T鑞g"..nMapID, 24);
	DeleteChannel("Phe Li猽"..nMapID, 25);
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	TMZ_LeaveBattle();
	PlayerIndex = RoleIndex;
end;

function JoinMission(RoleIndex,nCamp)
	PlayerIndex = RoleIndex;
	TMZ_JoinBattle(nCamp);
	PlayerIndex = RoleIndex;
end;