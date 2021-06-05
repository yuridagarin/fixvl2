Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");

function InitMission()
	TMZ_InitBattle();
	local nMapId = gf_GetCurMapID();
	local nNpcIdx = 0;
	
	--========���ﴴ��ս��npc =================
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
	--��������
	for i = 1,getn(tPositionNpcEye[0]) do
		nNpcIdx = CreateNpc(tPositionNpcEye[0][i][1],tPositionNpcEye[0][i][2],nMapId,tPositionNpcEye[0][i][3],tPositionNpcEye[0][i][4]);
		SetNpcDeathScript(nNpcIdx,NPC_DEATH_SCRIPT);
		SetCampToNpc(nNpcIdx,Neutral_Type);
	end
	--����ְ��npc		
	for i = 1,getn(tPositionFo) do --�˸�С��
		nNpcIdx = CreateNpc(tPositionFo[i][1],tPositionFo[i][2],nMapId,tPositionFo[i][3],tPositionFo[i][4]);
		SetCampToNpc(nNpcIdx,CampOne_Type);
		nNpcIdx = CreateNpc(tPositionFo[i][1],tPositionFo[i][2],nMapId,tPositionFo[i][5],tPositionFo[i][6]);
		SetCampToNpc(nNpcIdx,CampTwo_Type);
	end
	nNpcIdx = CreateNpc("C�n L�n ph� ch��ng m�n",CampOne_Name.."Qu�n nhu quan",nMapId,tPositionCamp[1][3][1],tPositionCamp[1][3][2]);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tianmenzhen\\quartermaster_npc.lua");
	nNpcIdx = CreateNpc("C�n L�n ph� ch��ng m�n",CameTwo_Name.."Qu�n nhu quan",nMapId,tPositionCamp[2][3][1],tPositionCamp[2][3][2]);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tianmenzhen\\quartermaster_npc.lua");	
	nNpcIdx = CreateNpc("Thi�n V��ng Bang ��","Binh s� h�u c�n",nMapId,tPositionCamp[1][4][1],tPositionCamp[1][4][2]);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tianmenzhen\\soldier_npc.lua");
	nNpcIdx = CreateNpc("Thi�n V��ng Bang ��","Binh s� h�u c�n",nMapId,tPositionCamp[2][4][1],tPositionCamp[2][4][2]);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tianmenzhen\\soldier_npc.lua");	
	nNpcIdx = CreateNpc("Thi�n V��ng Bang ��","Ti�n tuy�n qu�n T�ng",nMapId,tPositionCamp[1][5][1],tPositionCamp[1][5][2]);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tianmenzhen\\tmz_trap.lua");
	nNpcIdx = CreateNpc("Thi�n V��ng Bang ��","Ti�n tuy�n qu�n Li�u",nMapId,tPositionCamp[2][5][1],tPositionCamp[2][5][2]);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tianmenzhen\\tmz_trap.lua");		
	--����npc�����⡢���¡�������
	nNpcIdx = CreateNpc("L�ng Nguy�t","L�ng Nguy�t",nMapId,1917,3695);
	SetCampToNpc(nNpcIdx,Neutral_Type);
	nNpcIdx = CreateNpc("T�o T�n Tr�n","T�o T�n Tr�n",nMapId,1914,3689);	
	SetCampToNpc(nNpcIdx,Neutral_Type);
	nNpcIdx = CreateNpc("Li�u �","Li�u �",nMapId,1886,3758);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tianmenzhen\\liaoyi_npc.lua");

	CreateChannel("Thi�n M�n tr�n"..nMapId, 15);
	CreateChannel("Phe T�ng"..nMapId, 24);
	CreateChannel("Phe Li�u"..nMapId, 25);
	--Observer:onEvent(OE_TMZ_CREATE_NPC,{nMapId,Neutral_Type}); --pvp��ͼ����mapID����Ӫ��pve����mapID������
end;

function RunMission()
	Msg2MSAll(MISSION_ID,"Th�m t� h�i b�o, phe ��ch �� b�t ��u h�nh ��ng, c�c h�o ki�t h�y nhanh ch�ng ti�n v�o ti�n tuy�n quy�t m�t tr�n t� chi�n v�i ��ch.");

	local nMapId  = gf_GetCurMapID();
	local nNpcIdx = 0;

	--boss_npc: ����¡���ڤ��
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
				Msg2MSAll(MISSION_ID,"Th�m t� h�i b�o, ti�n ph��ng ph�t hi�n"..tPositionNpcBOSS[i][1][2]..", c�c hi�p s� phe ta h�y nhanh ch�ng �i ti�u di�t.");
				break
			end
		end
	end

	TMZ_RunBattle();
end;

function EndMission()
	local nPlayerOne = GetMSPlayerCount(MISSION_ID,CampOne_ID);
	local nPlayerTwo = GetMSPlayerCount(MISSION_ID,CampTwo_ID);	
	WriteLog("[chi�n tr��ng Thi�n M�n Tr�n k�t th�c]: th�i gian l�"..GetMissionV(MV_TMZ_LOG_TIME).."Thi�n M�n Tr�n �� k�t th�c, s� ng��i cu�i c�ng l�: ["..nPlayerOne.."]:["..nPlayerTwo.."], t�ng s� ng��i l�: "..(nPlayerOne+nPlayerTwo)); 
	TMZ_ProcessBattleOver();
	local nMapID = GetMissionV(MV_TMZ_MAP_ID);	
	ClearMapNpc(nMapID);
	local nMapIdx = GetMissionV(MV_TMZ_MAP_INDEX);
	local nShowIdx = GetMissionV(MV_TMZ_SHOWDATA_IDX);
	TMZ_Set_ShowData_Nil();
	TMZ_ClearMissionData();
	local nRetCode = FreeDynamicMap(nMapID,nMapIdx);	--FreeDynamicMapҲ�����CloseMisssion
	if nRetCode ~= 1 then
		WriteLog("[chi�n tr��ng Thi�n M�n Tr�n]: FreeDynamicMap b�o l�i, nRetCode:"..nRetCode);
	end;		
	DeleteChannel("Thi�n M�n tr�n"..nMapID, 15);
	DeleteChannel("Phe T�ng"..nMapID, 24);
	DeleteChannel("Phe Li�u"..nMapID, 25);
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