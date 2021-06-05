--create date:07-04-10
--author:yanjun
--describe:����ս��غ�������

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\gongcheng\\gongcheng_head.lua");

--��ȡ��ҵĹ���ս��Ӫ�����Ƿ������سǷ�
function GCZ_GetPlayerCamp()
	return GetTaskTemp(TEMP_CAMP);
end;
--��ȡ�з���ӪID
function GCZ_GetEnemyCamp()
	return GONGSHOU_ID - GetTaskTemp(TEMP_CAMP);
end;
--�ж�����ǲ���ĳ�����еĳ�Ա
function GCZ_IsCityMember(nCityMapID)
	if LIMIT_IGNORE == 1 then
		return 1;
	end;
	local _,_,nCityIdx = GCZ_GetCityInfo(nCityMapID);
	local szTongName = GetTongName();
	local szShouName = GCZ_GetCampNameFromRelay(nCityMapID,SHOU_ID)
	if szTongName == szShouName then
		return 1;
	else
		return 0;
	end;
end;
--��ǰ���ĸ�ս����ͼ,����0��ʾ����ս����ͼ��123�ֱ��ʾȪ�ݳɶ�����
function GCZ_InBattle()
	local nCityIdx = GetTaskTemp(TEMP_CITY_INDEX);
	return nCityIdx;
end;
--��鵱ǰ״��(���ź͹��ǽ׶�)�Ƿ�ﵽʤ������
function GCZ_CheckWinCondition()
	local nCurFlagCount = GetMissionV(MV_FLAG_OWN_COUNT);
	if nCurFlagCount >= FLAG_COUNT_WIN then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
		SetMissionV(MV_WAR_RESULT,GONG_ID);	--���ý��
		local lfFunc = function(tArg)
			Say("Tr�i qua tr�n chi�n kh�c li�t, cu�i c�ng bang h�i <color=yellow>"..GetMissionS(MS_GONG_TONG_NAME).."<color> �� chi�m l�nh th�nh c�ng? (do bang h�i <color=yellow>"..GetMissionS(MS_SHOU_TONG_NAME).."<color> Th� v�) th�nh <color=yellow>"..GetMissionS(MS_CITY_NAME).."<color>.",0);
			SetFightState(0);
			if GetTask(TNC_CAMP) == GetMissionV(MV_WAR_RESULT) then
				SetTask(TASK_AWARD_WIN,GetTask(TASK_AWARD_WIN)+1);
			else
				SetTask(TASK_AWARD_LOST,GetTask(TASK_AWARD_LOST)+1);
			end;
		end;
		local nBattleMapID = SubWorldIdx2ID(SubWorld);
		local szCityName,nCityMapID = GCZ_GetCityInfo(nBattleMapID);
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},ALL_ID,nBattleMapID);
		SetCityWarWinner(nCityMapID,GetMissionS(MS_GONG_TONG_NAME));
		Msg2Global("Tr�i qua tr�n chi�n kh�c li�t, cu�i c�ng bang h�i "..GetMissionS(MS_GONG_TONG_NAME).." chi�m l�nh th�nh c�ng? (do bang h�i "..GetMissionS(MS_SHOU_TONG_NAME).." Th� v�) -"..GetMissionS(MS_CITY_NAME));
		AddGlobalCountNews("Tr�i qua tr�n chi�n kh�c li�t, cu�i c�ng bang h�i <color=yellow>"..GetMissionS(MS_GONG_TONG_NAME).."<color>chi�m l�nh th�nh c�ng? (do bang h�i <color=red>"..GetMissionS(MS_SHOU_TONG_NAME).."<color> Th� v�) - <color=green>"..GetMissionS(MS_CITY_NAME).."<color>",1);
		PlayMusic("\\music\\themusicisnotexist.mp3",1);
		GCZ_PlaySound(GONG_ID,"����սʤ��.wav");
		GCZ_PlaySound(SHOU_ID,"����սʧ��.wav");
		WriteLog("[c�ng th�nh C�ng th�nh chi�n]:"..GetMissionS(MS_GONG_TONG_NAME).." chi�m l�nh ���c? ("..nCurFlagCount.." k� ph��n) do"..GetMissionS(MS_SHOU_TONG_NAME).." Th� v�) -"..GetMissionS(MS_CITY_NAME)..". MSUID l� "..GetMissionV(MV_MISSION_UID));
		return 1;
	else
		return 0;
	end;
end;
--��Relay�������ݿ⴦��ù���˫���İ�������
function GCZ_GetCampNameFromRelay(nCityMapID,nCamp)
	local szCityTong = GetCityWarInfo(nCityMapID, "base")
	local szGong,szShou = GetCityWarAD(nCityMapID)
	-- ����سǷ���ռ�Ƿ���һ���������������ں�����ɵģ��޸�һ�£�ע�⣬��������˶������ս������������
	if szCityTong ~= nil and szCityTong ~= "" and szCityTong ~= szShou then
		if PlayerIndex > 0 then
			local szCityMap = tostring(nCityMapID)
			CustomDataSave("TongCitywar_Repair","sss",szCityMap,szGong,szCityTong)	-- ��¼��Ҫ�޸ĵ�
			ClearRelayShareData("_TongCityWarAD",0,0,"\\script\\gongcheng\\gongcheng_function.lua","gongcheng_remove")
			szShou = szCityTong
		else																		-- ������Player���õ�
			szShou = szCityTong
		end
	end
	
	if nCamp == GONG_ID then
		return szGong;
	elseif nCamp == SHOU_ID then
		return szShou;
	else
		return szGong,szShou;
	end;
end;

function gongcheng_remove(nResult)
	local szCityMap, szGong, szCityTong = CustomDataRead("TongCitywar_Repair")
	if nResult == 1 and szCityMap ~= nil then
		AddRelayShareData("_TongCityWarAD",0,0,"","",0,szCityMap,"ddss",0,0,szGong,szCityTong)
		CustomDataRemove("TongCitywar_Repair")
	end
end

--��ȡ����˫������������
function GCZ_GetTongHeaderName(nCamp)
	if nCamp == GONG_ID then
		return "S�n Tuy�n N�ng Phu";
	elseif nCamp == SHOU_ID then
		return "Y Sa �i";
	else
		return "S�n Tuy�n N�ng Phu","Y Sa �i";
	end;
end;
--��ȡ�������������֡�����1����Ӫ������2���ŵ�λ������
function GCZ_GetGuardName(nCamp,nDoorIdx)
	local szEGuardName = GetName(GetMissionV(MV_GPIDX_EAST_DOOR+nCamp-1));
	local szSGuardName = GetName(GetMissionV(MV_GPIDX_SOUTH_DOOR+nCamp-1));
	local szWGuardName = GetName(GetMissionV(MV_GPIDX_WEST_DOOR+nCamp-1));
	if szEGuardName == "" then
		szEGuardName = "Ch�a";
	end;
	if szSGuardName == "" then
		szSGuardName = "Ch�a";
	end;
	if szWGuardName == "" then
		szWGuardName = "Ch�a";
	end;
	if nDoorIdx == 1 then	--����д��̫���ˣ�û�취��Ϊ��֧�ַ�������ֵ
		return szEGuardName;
	elseif nDoorIdx == 2 then
		return szSGuardName;
	elseif nDoorIdx == 3 then
		return szWGuardName;
	else
		return szEGuardName,szSGuardName,szWGuardName;
	end;
end;
--��ȡ����������PlayerIndex������ͬGCZ_GetGuardName
function GCZ_GetGuardPlayerIndex(nCamp,nDoorIdx)
	local nEGuardIdx = GetMissionV(MV_GPIDX_EAST_DOOR+nCamp-1);
	local nSGuardIdx = GetMissionV(MV_GPIDX_SOUTH_DOOR+nCamp-1);
	local nWGuardIdx = GetMissionV(MV_GPIDX_WEST_DOOR+nCamp-1);
	if nDoorIdx == 1 then	--����д��̫���ˣ�û�취��Ϊ��֧�ַ�������ֵ
		return nEGuardIdx;
	elseif nDoorIdx == 2 then
		return nSGuardIdx;
	elseif nDoorIdx == 3 then
		return nWGuardIdx;
	else
		return nEGuardIdx,nSGuardIdx,nWGuardIdx;
	end;	
end;
--����ĳ��ս����ͼID�������Ӧ�ĳ�����Ϣ
function GCZ_GetCityInfo(nBattleMapID)
	for i,v in tCityInfo do
		if v[3] == nBattleMapID then
			return v[1],v[2],i;	--���е�ͼ���֣����е�ͼID����ͼIndex
		end;
	end;
	return "",0,0;
end;
--���ݻ�ȡĳ�����еĵ�ͼID����Ӧ��ս����ͼID
function GCZ_GetBattleMapID(nCityMapID)
	for i,v in tCityInfo do
		if v[2] == nCityMapID then
			return v[3];
		end;
	end;
	return 0;
end;
--��ʼ������Ĺ�ص�״̬
function GCZ_InitGraveyard()
	SetMissionV(MV_GRAVEYARD_A1,GONG_ID);
	SetMissionV(MV_GRAVEYARD_A2,GONG_ID);
	SetMissionV(MV_GRAVEYARD_B1,NONE_ID);
	SetMissionV(MV_GRAVEYARD_B2,NONE_ID);
	SetMissionV(MV_GRAVEYARD_C1,NONE_ID);
	SetMissionV(MV_GRAVEYARD_C2,NONE_ID);
	SetMissionV(MV_GRAVEYARD_11,SHOU_ID);
	SetMissionV(MV_GRAVEYARD_12,SHOU_ID);
	SetMissionV(MV_GRAVEYARD_21,SHOU_ID);
	SetMissionV(MV_GRAVEYARD_22,SHOU_ID);
end;
--����Ĺ�ص�״̬
function GCZ_SetGraveyardStatus(nMSVID,nCamp,bEnable)
	local nCurStatus = GetMissionV(nMSVID);
	if nCurStatus == NONE_ID then
		if bEnable ~= 0 then
			SetMissionV(nMSVID,nCamp);
		end;
	elseif nCurStatus == ALL_ID then
		if bEnable == 0 then
			SetMissionV(nMSVID,GONGSHOU_ID-nCamp);
		end;	
	elseif nCurStatus == GONG_ID then
		if nCamp == GONG_ID and bEnable == 0 then
			SetMissionV(nMSVID,NONE_ID);
		elseif nCamp == SHOU_ID and bEnable ~= 0 then
			SetMissionV(nMSVID,ALL_ID);
		end;	
	elseif nCurStatus == SHOU_ID then
		if nCamp == GONG_ID and bEnable ~= 0 then
			SetMissionV(nMSVID,ALL_ID);
		elseif nCamp == SHOU_ID and bEnable == 0 then
			SetMissionV(nMSVID,NONE_ID);
		end;
	end;
end;
--��ʼ��Trap��״̬
function GCZ_InitTrap()
	SetMissionV(MV_TRAP_EAST_DOOR,ALL_ID);
	SetMissionV(MV_TRAP_WEST_DOOR,ALL_ID);
	SetMissionV(MV_TRAP_SOUTH_DOOR,ALL_ID);
end;
--����Trap��
function GCZ_CreateTrap(nMapID)
	for i=1,32 do	--����TRAP��
		AddMapTrap(nMapID,(1056+i)*32,(2803+i)*32,"\\script\\gongcheng\\trap\\westdoor_trap.lua")
		AddMapTrap(nMapID,(1052+i)*32,(2802+i)*32,"\\script\\gongcheng\\trap\\westdoor_trap.lua")
	end;
	for i=1,31 do	--����TRAP��
		AddMapTrap(nMapID,(1182+i)*32,(2868+i)*32,"\\script\\gongcheng\\trap\\southdoor_trap.lua");
		AddMapTrap(nMapID,(1182+i)*32,(2867+i)*32,"\\script\\gongcheng\\trap\\southdoor_trap.lua");
	end;
	for i=1,30 do	--����TRAP��
		AddMapTrap(nMapID,(1251+i)*32,(2996+i)*32,"\\script\\gongcheng\\trap\\eastdoor_trap.lua");
		AddMapTrap(nMapID,(1251+i)*32,(2995+i)*32,"\\script\\gongcheng\\trap\\eastdoor_trap.lua");
	end;
	for i=1,35 do	--���ŵ�������TRAP��
		AddMapTrap(nMapID,986*32,(2927-i)*32,"\\script\\gongcheng\\trap\\westfightroom_trap.lua")	--����
		AddMapTrap(nMapID,1044*32,(2755+i)*32,"\\script\\gongcheng\\trap\\westfightroom_trap.lua")	--�ط�
		AddMapTrap(nMapID,1416*32,(2950+i)*32,"\\script\\gongcheng\\trap\\westfightroom_trap.lua")	--����
	end;
	for i=1,20 do	--���ŵ�������TRAP��
		AddMapTrap(nMapID,(1072+i)*32,2977*32,"\\script\\gongcheng\\trap\\southfightroom_trap.lua");
		AddMapTrap(nMapID,(1255+i)*32,2880*32,"\\script\\gongcheng\\trap\\southfightroom_trap.lua");
		AddMapTrap(nMapID,1369*32,(2999+i)*32,"\\script\\gongcheng\\trap\\southfightroom_trap.lua");
	end;
	for i=1,25 do	--���ŵ�������TRAP��
		AddMapTrap(nMapID,(1161+i)*32,(3077+i)*32,"\\script\\gongcheng\\trap\\eastfightroom_trap.lua");
		AddMapTrap(nMapID,(1296+i)*32,3022*32,"\\script\\gongcheng\\trap\\eastfightroom_trap.lua");
		AddMapTrap(nMapID,1321*32,(3048+i)*32,"\\script\\gongcheng\\trap\\eastfightroom_trap.lua");
	end;
	for i=1,22 do		--����TRAP��
		AddMapTrap(nMapID,(1011+i)*32,(2870+i)*32,"\\script\\gongcheng\\trap\\bridge_west_trap.lua");
		AddMapTrap(nMapID,(1011+i)*32,(2871+i)*32,"\\script\\gongcheng\\trap\\bridge_west_trap.lua");	
	end;		
	for i=1,24 do		--����TRAP��
		AddMapTrap(nMapID,(1143+i)*32,(2922+i)*32,"\\script\\gongcheng\\trap\\bridge_south_trap.lua");
		AddMapTrap(nMapID,(1143+i)*32,(2923+i)*32,"\\script\\gongcheng\\trap\\bridge_south_trap.lua");	
	end;
	for i=1,24 do		--����TRAP��
		AddMapTrap(nMapID,(1212+i)*32,(3050+i)*32,"\\script\\gongcheng\\trap\\bridge_east_trap.lua");
		AddMapTrap(nMapID,(1212+i)*32,(3051+i)*32,"\\script\\gongcheng\\trap\\bridge_east_trap.lua");		
	end;
end;
--����ս�����Npc
function GCZ_CreateNpc(nMapID)
	local nNpcIdx = CreateNpc("V��ng An Th�ch","C�ng th�nh Tham M�u",nMapID,1137,3145);
	SetNpcScript(nNpcIdx,"\\script\\gongcheng\\npc\\gongchengcanmou_npc.lua");
	nNpcIdx = CreateNpc("V��ng An Th�ch","Th� th�nhTham m�u",nMapID,1450,2583);
	SetNpcScript(nNpcIdx,"\\script\\gongcheng\\npc\\shouchengcanmou_npc.lua");
	nNpcIdx = CreateNpc("V��ng An Th�ch","T�p k�t quan",nMapID,1126,3144);
	SetNpcScript(nNpcIdx,"\\script\\gongcheng\\npc\\chuansong_npc.lua");
	nNpcIdx = CreateNpc("V��ng An Th�ch","T�p k�t quan",nMapID,1458,2593);
	SetNpcScript(nNpcIdx,"\\script\\gongcheng\\npc\\chuansong_npc.lua");	
	for i=1,getn(tChengMenJiGuanPos) do
		nNpcIdx = CreateNpc(tChengMenJiGuanPos[i][4],tChengMenJiGuanPos[i][3],nMapID,tChengMenJiGuanPos[i][1],tChengMenJiGuanPos[i][2]);
		SetNpcDeathScript(nNpcIdx,"\\script\\gongcheng\\npc\\chengmenjiguan_death.lua");		
		SetMissionV(MV_EAST_JIGUAN_INDEX+i-1,nNpcIdx);
		SetCampToNpc(nNpcIdx,tCampNameP[SHOU_ID]);
		gf_SetUnitCurState(nNpcIdx,0,i);
	end;
	GCZ_CreateNormalFlag(nMapID);
	GCZ_CreateReviviFlag(nMapID);
end;
--�������Ƿ����������ְλ������Ҫ��
--nTongJob:0��δ��� 1������ 2�������� 3������ 4������ 5������ 6����ͨ��Ա
function GCZ_CheckPlayerRight(nTongJob,nDayCount)
	if LIMIT_IGNORE == 1 then
		return 1;
	end;
	local nCurJob = IsTongMember();
	if nCurJob == 0 then
		return 0;
	end;
	local nCurDayCount = GCZ_GetOnJobDayCount();
	if nCurJob <= nTongJob and nCurDayCount >= nDayCount then
		return 1;
	end;
	return 0;
end;
--��ȡ���������µ�Ԯ��������
function GCZ_GetTeamReinforcementCount(nCamp,nBattleMapID)
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	local nCounter = 0;
	local nNewCounter = 0;
	local _,nCityMapID = GCZ_GetCityInfo(nBattleMapID);
	local szCampName = GCZ_GetCampNameFromRelay(nCityMapID,nCamp);
	local nCurMUID = mf_GetMissionV(MISSION_ID,MV_MISSION_UID,nBattleMapID);
	if nTeamSize > 0 then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i);
			--�������Ԯ
			if GCZ_IsReinforcement(nCamp,nBattleMapID) == 1 then
				nCounter = nCounter + 1;
				--֮ǰû��ȥ������Ӫ����Ԯ
				if GetTask(TNC_MUID) ~= nCurMUID or GetTask(TNC_CAMP) ~= nCamp then
					nNewCounter = nNewCounter + 1;
				end;
			end;
		end;
	else	--����һ��û��ӵ����
		--�������Ԯ
		if GCZ_IsReinforcement(nCamp,nBattleMapID) == 1 then
			nCounter = nCounter + 1;
			--֮ǰû��ȥ������Ԯ
			if GetTask(TNC_MUID) ~= nCurMUID then
				nNewCounter = nNewCounter + 1;
			end;
		end;	
	end;
	PlayerIndex = nOldPlayerIdx;
	return nCounter,nNewCounter;
end;
--�ж�����ǲ���ĳ��Ŀ���ͼ�ϵ�ĳ����Ӫ����Ԯ
function GCZ_IsReinforcement(nCamp,nBattleMapID)
	local _,nCityMapID = GCZ_GetCityInfo(nBattleMapID);
	local szCampName = GCZ_GetCampNameFromRelay(nCityMapID,nCamp);
	local szTongName = GetTongName();
	if szTongName ~= szCampName or GCZ_CheckPlayerRight(6,LEAST_STAY_DAY) == 0 then	--������ǵ�ǰ��ͼ����Ȩ�������Ļ�������Ԯ
		return 1;
	end;
end;
--��ö�������ĳ��·�ߵ���ҵ�����
function GCZ_GetTeamRouteCount(nRoute)
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	local nCounter = 0;
	if nTeamSize > 0 then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i);
			if GetPlayerRoute() == nRoute then
				nCounter = nCounter + 1;
			end;
		end;
	else	--����һ��û��ӵ����
		if GetPlayerRoute() == nRoute then
			nCounter = nCounter + 1;
		end;	
	end;
	PlayerIndex = nOldPlayerIdx;
	return nCounter;
end;
--�����µ�ս����ʱ����ִ�еĺ�������Ҫ�����һЩս������
function GCZ_NewBattleClear()
	local nCityMapID = GetWorldPos();
	local nBattleMapID = GCZ_GetBattleMapID(nCityMapID);
	local nCurMUID = mf_GetMissionV(MISSION_ID,MV_MISSION_UID,nBattleMapID);
	local nMyMUID = GetTask(TNC_MUID);
	if nMyMUID ~= nCurMUID then	--���MUID����ͬ�ͱ�ʾ��ǰҪ��������µ�ս��
		for i=TNC_BEGIN,TNC_END do
			SetTask(i,0);
		end;
	end;
end;
--������������������
function GCZ_CreateNormalFlag(nMapID)
	local nNpcIdx = 0;
	for i=1,getn(tNormalFlagPos) do
		nNpcIdx = CreateNpc(tNormalFlagPos[i][4],tNormalFlagPos[i][3],nMapID,tNormalFlagPos[i][1],tNormalFlagPos[i][2]);
		SetNpcDeathScript(nNpcIdx,"\\script\\gongcheng\\npc\\flag_normal_death.lua");
		SetCampToNpc(nNpcIdx,tCampNameP[SHOU_ID]);
		SetMissionV(MV_NORMAL_FLAG1_OWNER+i-1,SHOU_ID);
		gf_SetUnitCurState(nNpcIdx,0,i);
	end;
end;
--����������������
function GCZ_CreateReviviFlag(nMapID)
	local nNpcIdx = 0;
	for i=1,getn(tReviviFlagPos) do
		nNpcIdx = CreateNpc(tReviviFlagPos[i][5],tReviviFlagPos[i][3].."(Phe Th� th�nh)",nMapID,tReviviFlagPos[i][1],tReviviFlagPos[i][2]);
		SetNpcDeathScript(nNpcIdx,"\\script\\gongcheng\\npc\\flag_revivi_death.lua");
		SetCampToNpc(nNpcIdx,tCampNameP[SHOU_ID]);
		SetMissionV(MV_REVIVI_FLAG1_OWNER+i-1,SHOU_ID);
		gf_SetUnitCurState(nNpcIdx,0,i);
	end;
end;
--���ݿ��������ӵ�XY��������������
function GCZ_GetReviviFlagIndex(nNpcIdx)
	local nPosNum = getn(tReviviFlagPos);
	local nPosIdx = GetUnitCurStates(nNpcIdx,0);
	if nPosIdx <= 0 or nPosIdx > nPosNum then
		return 0;
	else
		return nPosIdx;
	end;
end;
--���ݲ����������ӵ�XY��������������
function GCZ_GetNormalFlagIndex(nNpcIdx)	
	local nPosNum = getn(tNormalFlagPos);
	local nPosIdx = GetUnitCurStates(nNpcIdx,0);
	if nPosIdx <= 0 or nPosIdx > nPosNum then
		return 0;
	else
		return nPosIdx;
	end;
end;
--���ݳ��Ż��ص�XY��������������
function GCZ_GetChengMenJiGuanIndex(nNpcIdx)
	local nPosNum = getn(tChengMenJiGuanPos);
	local nPosIdx = GetUnitCurStates(nNpcIdx,0);
	if nPosIdx <= 0 or nPosIdx > nPosNum then
		return 0;
	else
		return nPosIdx;
	end;
end;
--�����λ������
function GCZ_GetOnJobDayCount()
	if LIMIT_IGNORE == 1 then
		return 8;
	end;
	local nAssignTime = GetLastAssignTime();
	if nAssignTime == 0 then	--���û�м�����
		return 0;
	end;
	local nDayCount = floor((GetTime()-nAssignTime)/(3600*24));
	return nDayCount;
end;
--��ü����������
function GCZ_GetJoinTongDayCount()
	if LIMIT_IGNORE == 1 then
		return LEAST_STAY_DAY;
	end;
	local nJoinTime = GetJoinTongTime();
	if nJoinTime == 0 then	--���û�м�����
		return 0;
	end;
	local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	return nDayCount;
end;
--��ȡĳһ����������Ϣ������ֵ�����������������������Ԯ����
function GCZ_GetCampPlayerCount(nCamp,nBattleMapID)
	local nNormalSoldier = mf_GetPlayerCount(MISSION_ID,nCamp,nBattleMapID) or 0;
	local nReinforcement = mf_GetPlayerCount(MISSION_ID,nCamp+2,nBattleMapID) or 0;
	return (nNormalSoldier+nReinforcement),nNormalSoldier,nReinforcement;
end;
--��װ��Msg2MSGroup
function GCZ_Msg2Camp(szMsg,nCamp)
	if nCamp == ALL_ID then
		Msg2MSAll(MISSION_ID,szMsg);
	else
		Msg2MSGroup(MISSION_ID,szMsg,nCamp);
		Msg2MSGroup(MISSION_ID,szMsg,nCamp+2);
	end;
end;
--����һ��wav�ļ�
function GCZ_PlaySound(nCamp,szWavFileName)
	local lfFunc = function(tArg)
		PlaySound("\\sound\\"..%szWavFileName);
	end;
	if nCamp == ALL_ID then
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},ALL_ID);
	else
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},nCamp);
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},nCamp+2);	
	end;
end;
--��ĳһ����Ӫ����һ��mp3�ļ�
function GCZ_PlayMusic(nCamp,szMusicFileName)
	local lfFunc = function(tArg)
		PlayMusic("\\music\\"..%szMusicFileName,1);
	end;
	if nCamp == ALL_ID then
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},ALL_ID);
	else
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},nCamp);
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},nCamp+2);
	end;
end;
--���ݵ�ǰ����ռ��������������ù���˫���ı�������״̬
--����ֵ��-1��������������0����������1��������2���ط�
function GCZ_SetMusicState()
	local nFlagCount = GetMissionV(MV_FLAG_OWN_COUNT);
	local nCurGongMusic = GetMissionV(MV_CUR_MUSIC_GONG);
	local nCurShouMusic = GetMissionV(MV_CUR_MUSIC_SHOU);
	local nNeedGongMusic = 0;
	local nNeedShouMusic = 0;
	if nFlagCount == 0 then	
		SetMissionV(MV_CUR_MUSIC_GONG,MUSIC_WEIJI);
		nNeedGongMusic = MUSIC_WEIJI;
		SetMissionV(MV_CUR_MUSIC_SHOU,MUSIC_YOUSHI);	
		nNeedShouMusic = MUSIC_YOUSHI
	elseif nFlagCount <= 5 then	
		SetMissionV(MV_CUR_MUSIC_GONG,MUSIC_JIANG);
		SetMissionV(MV_CUR_MUSIC_SHOU,MUSIC_JIANG);	
		nNeedGongMusic = MUSIC_JIANG;
		nNeedShouMusic = MUSIC_JIANG;
	else
		SetMissionV(MV_CUR_MUSIC_GONG,MUSIC_YOUSHI);
		SetMissionV(MV_CUR_MUSIC_SHOU,MUSIC_WEIJI);	
		nNeedGongMusic = MUSIC_YOUSHI;
		nNeedShouMusic = MUSIC_WEIJI;
	end;
	if nCurGongMusic == nNeedGongMusic and nCurShouMusic == nNeedShouMusic then
		return NONE_ID;	--˫�����ֶ�û�ı�
	elseif nCurGongMusic ~= nNeedGongMusic and nCurShouMusic == nNeedShouMusic then
		return GONG_ID;	--�������ˣ��ط�û��
	elseif nCurGongMusic == nNeedGongMusic and nCurShouMusic ~= nNeedShouMusic then
		return SHOU_ID;	--����û�䣬�ط�����
	else
		return ALL_ID;	--˫��������
	end;
end;
--���ݵ�ǰ�����������Ӧ�ı�������
function GCZ_PlayBackGroundMusic(nCamp)
	if nCamp == NONE_ID then
		return 0;
	end;
	if nCamp == ALL_ID then
		GCZ_PlayMusic(GONG_ID,tMusicFileName[GetMissionV(MV_CUR_MUSIC_GONG)]);
		GCZ_PlayMusic(SHOU_ID,tMusicFileName[GetMissionV(MV_CUR_MUSIC_SHOU)]);
	else
		GCZ_PlayMusic(nCamp,tMusicFileName[GetMissionV(MV_CUR_MUSIC_GONG+nCamp-1)]);
	end;
	return 1;
end;
--������еĳ��Ż����Ƿ��ƻ�
function GCZ_CheckAllDoor()
	for i=MV_DESTROY_EAST_DOOR,MV_DESTROY_WEST_DOOR do
		if GetMissionV(i) == 0 then
			return 0;
		end;
	end;
	return 1;
end;
--ת�����Ž׶�
function GCZ_ComeToGongmeng()
		if GetMissionV(MV_MISSION_STATE) >= MS_STATE_GONGCHENG then
			return 0;
		end;
		SetMissionV(MV_MISSION_STATE,MS_STATE_GONGCHENG);
		SetMissionV(MV_TIMER_LOOP,GONGCHENG_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,GONGCHENG_TIMER_INTERVAL*FRAME_PER_MIN);
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_B1,GONG_ID,TRUE);
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_B2,GONG_ID,TRUE);
		GCZ_PlaySound(ALL_ID,"���Ž���.wav");
		Msg2MSAll(MISSION_ID,"chuy�n ��n giai �o�n C�ng th�nh ");
end;
--�ָ���������������
function GCZ_RestoreAll()
	Restore();
	RestoreNeili();
	ClearColdDown();	--�������ҩCD
end;
function nothing()

end;
