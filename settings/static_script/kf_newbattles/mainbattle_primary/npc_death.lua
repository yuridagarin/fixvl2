Include("\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\mainbattle_head.lua");
Include("\\settings\\static_script\\kf_newbattles\\box_effect_head.lua");
TBOX_FILE = new(KTabFile, "\\settings\\newbattles\\mainbattle\\kill_npc_effect.txt")
function OnDeath(npcIndex)
	SubWorld = SubWorldID2Idx(MAPID);
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	SetNpcLifeTime(npcIndex,DEAD_BODY_TIME);
	if PlayerIndex == 0 then	--����Ǳ�NPCɱ���������ģ�PlayerIndex��Ϊ0
		process_npc_kill_npc(npcIndex)
	else
		process_player_kill_npc(npcIndex)
	end;
end;

function get_emplacement_pos_index(nMapX,nMapY)
	for i=0,getn(tEmplacementPos) do
		if nMapX == tEmplacementPos[i][1] and nMapY == tEmplacementPos[i][2] then
			return i;
		end;
	end;
	BT_ShowDebugInfor("[Chi�n tr��ng b�o l�i]: H�m s� get_emplacement_pos_index t�m kh�ng ���c v� tr� ph�o ��i");
	WriteLog("[Chi�n tr��ng b�o l�i]: H�m s� get_emplacement_pos_index t�m kh�ng ���c v� tr� ph�o ��i");
end;
--����NPCɱ��NPC�¼�
function process_npc_kill_npc(npcIndex)	
	local nVillageCamp = GetGlbValue(GLB_VILLAGE);
	local sNpcName = GetNpcName(npcIndex);
	if sNpcName == "Th� d�n" then	--���ݴ���ս�����ȷ������һ���ӷ�
		SetMissionV(MV_KILL_VILLAGER_COUNT,GetMissionV(MV_KILL_VILLAGER_COUNT)+1);
		if nVillageCamp ~= ALL_ID then
			BT_AddMissionPoint(SONGLIAO_ID-nVillageCamp,1);
		end;
		return 0;
	elseif sNpcName == "Th� l�nh th� d�n" then	--���ݴ���ս�����ȷ������һ���ӷ�
		SetMissionV(MV_HEADER_DEATH,1);
		if nVillageCamp ~= ALL_ID then
			BT_AddMissionPoint(SONGLIAO_ID-nVillageCamp,2);
		end;
		return 0;
	elseif sNpcName == "K� nh�n d� s�" then	--���������NPC
		SetMissionV(MV_HERO_DEATH,1);
		return 0;
	elseif sNpcName == "Ti�n th�p-T�ng" or sNpcName == "Ti�n th�p-Li�u" then	--���NPC�����������
		return 0;
	end;
	local nNpcCamp = get_npc_camp(sNpcName);
	if nNpcCamp ~= ALL_ID then
		local nNpcType = process_camp_fight_camp(SONGLIAO_ID-nNpcCamp,sNpcName,nNpcIndex);
		BT_AddMissionPoint(SONGLIAO_ID-nNpcCamp,tKillNpcPoint[nNpcType]);
	end;
end;
--�������ɱ��NPC�¼�
function process_player_kill_npc(npcIndex)
	local sNpcName = GetNpcName(npcIndex);
	local nNpcType = 0;
	local nPlayerCamp = BT_GetCamp();
	local nEnemyCamp = 3 - nPlayerCamp;
	local nEmplacementPosIndex = 0;
	local BoxEffectFunc = function(tArg)
		Do_Box_Effect(TBOX_FILE);
	end;
	if sNpcName == "Th� d�n" then
		nNpcType = TYPE_REFUGEE;
		BT_AddBattleActivity(BA_MAIN_KILL_NATIVE);
	elseif sNpcName == "Th� l�nh th� d�n" then
		nNpcType = TYPE_HEADER;
		SetMissionV(MV_HEADER_DEATH,1);
		BT_AddBattleActivity(BA_MAIN_KILL_HEADER);
		Msg2MSGroup(MISSION_ID,"Ng��i ch�i:"..GetName().."  �� gi�t "..sNpcName..", binh s� ph�n ch�n h�n l�n!",nPlayerCamp);
		BT_OperateAllPlayer(BoxEffectFunc,{},nPlayerCamp);
	elseif sNpcName == "K� nh�n d� s�" then
		nNpcType = TYPE_HERO;
		SetMissionV(MV_HERO_DEATH,1);
		BT_AddBattleActivity(BA_MAIN_KILL_HEADER);
		Msg2MSGroup(MISSION_ID,"Ng��i ch�i:"..GetName().."  �� gi�t "..sNpcName..", binh s� ph�n ch�n h�n l�n!",nPlayerCamp);
		BT_OperateAllPlayer(BoxEffectFunc,{},nPlayerCamp);
	else
		nNpcType = process_camp_fight_camp(nPlayerCamp,sNpcName,npcIndex)
		if nNpcType == TYPE_EMPLACEMENT then
			BT_AddBattleActivity(BA_MAIN_KILL_EMPL);
		elseif nNpcType <= TYPE_CAPTAIN then
			BT_AddBattleActivity(BA_MAIN_KILL_ENEMY);	--ɱ��һ���Է�ʿ����Уξ����ͳ
		else 
			BT_AddBattleActivity(BA_MAIN_KILL_BOSS);	--ɱ���Է���Ӫ���ȷ桢������Ԫ˧
		end;
	end;
	BT_EmperorAward(tKillNpcEAP[nNpcType],1);
	local nPoint = tKillNpcPoint[nNpcType]
	local nKillVillagerPoint = BT_GetData(PTNC_KILL_VILLAGER_POINT);
	local nKillSoldierPoint = BT_GetData(PTNC_KILL_SOLDIER_POINT);
	if nNpcType == TYPE_REFUGEE then	--���ɱ�������񣬾ͼ�һ��
		if nKillVillagerPoint < KILL_VILLAGER_POINT_LIMITED then	
			BT_AddPersonalPoint(nPoint,0,1);	--�������һ���ĸ��˻���
			BT_SetData(PTNC_KILL_VILLAGER_POINT,nKillVillagerPoint+nPoint);
		end;
		SetMissionV(MV_KILL_VILLAGER_COUNT,GetMissionV(MV_KILL_VILLAGER_COUNT)+1);
	elseif nNpcType == TYPE_SOLDIER then	--���ɱ����ʿ����Ҳ��һ��
		if nKillSoldierPoint < KILL_SOLDIER_POINT_LIMITED then	
			BT_AddPersonalPoint(nPoint,0,1);	--�������һ���ĸ��˻���
			BT_SetData(PTNC_KILL_SOLDIER_POINT,nKillSoldierPoint+nPoint);
		end;
		SetMissionV(MV_KILL_SONG_SOLDIER_COUNT+2-nPlayerCamp,GetMissionV(MV_KILL_SONG_SOLDIER_COUNT+2-nPlayerCamp)+1);
	else
		BT_AddPersonalPoint(nPoint,0,1);	--�������һ���ĸ��˻���
	end;
	Judge_State_By_Point(nPlayerCamp);
end;
--����һ����Ӫ����һ�NPC������һ����Ӫ��NPC�¼�
--��Ϊ�Ƿ���ΪNPC��NPC���������������治������״̬���в����������Ժ���PlayerIndex
function process_camp_fight_camp(nPlayerCamp,sNpcName,nNpcIndex)
	local nEnemyCamp = 3 - nPlayerCamp
	local sNpcTypeName = get_npc_type(sNpcName);
	local _,nNpcPos_X,nNpcPos_Y = GetNpcWorldPos(nNpcIndex);
	local nEnemyNpcType = GetMissionV(MV_NPC_TYPE_SONG+nEnemyCamp-1);
	if sNpcTypeName == "Ph�o ��i" then
		local nEmplacementPosIndex = get_emplacement_pos_index(nNpcPos_X,nNpcPos_Y);
		Create_Emplacement(nEmplacementPosIndex,nPlayerCamp)
		if GetMissionV(MV_EMPLACEMENT0_POSSESSION) == GetMissionV(MV_EMPLACEMENT1_POSSESSION) and GetMissionV(MV_EMPLACEMENT0_POSSESSION) == GetMissionV(MV_EMPLACEMENT2_POSSESSION) then
			--Try_To_Create_FightNPC("Ԫ˧",nEnemyCamp);	--����ռ�����Ż��ڣ��Է�Ԫ˧��
		end;
		SetNpcLifeTime(nNpcIndex,0);	--��̨��������ʧ��
		nNpcType = TYPE_EMPLACEMENT;
	elseif sNpcTypeName == "Binh tinh nhu�" or sNpcTypeName == "C��ng n� binh" or sNpcTypeName == "D�ng s�" or sNpcTypeName == "Ng�nh ti�n binh" then
		nNpcType = TYPE_SOLDIER;
	elseif sNpcTypeName == "Ti�n th�p" then
		nNpcType = TYPE_ARROWBUILDING;
	elseif sNpcTypeName == "Hi�u �y" then
		nNpcType = TYPE_LOOEY;
		SetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1,GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1)+1);
		if GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1) == LOOEY_COUNT then
			if GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1) == CAPTAIN_COUNT then
				if nEnemyNpcType == 0 then
					Msg2MSAll(MISSION_ID,tCampNameZ[nEnemyCamp].."hi�u �y v� �� th�ng phe "..tCampNameZ[nEnemyCamp].." b� ��nh b�i, ti�n phong phe ");
				end;
				Try_To_Create_FightNPC("Ti�n phong",nEnemyCamp);	--�Է�Уξ��ͳ����¾�������Է��ȷ��
			end;
		end;
	elseif sNpcTypeName == "�� th�ng" then
		nNpcType = TYPE_CAPTAIN;
		SetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1,GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1)+1);
		if GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1) == CAPTAIN_COUNT then
			if GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1) == LOOEY_COUNT then
				if nEnemyNpcType == 0 then
					Msg2MSAll(MISSION_ID,tCampNameZ[nEnemyCamp].."hi�u �y v� �� th�ng phe "..tCampNameZ[nEnemyCamp].." b� ��nh b�i, ti�n phong phe ");
				end;
				Try_To_Create_FightNPC("Ti�n phong",nEnemyCamp);	--�Է�Уξ��ͳ����¾�������Է��ȷ��
			end;
			if GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1) == PIONEER_COUNT then
				if nEnemyNpcType == 1 then
					Msg2MSAll(MISSION_ID,tCampNameZ[nEnemyCamp].." xu�t hi�n. Ti�n phong "..tCampNameZ[nEnemyCamp].." b� ��nh b�i, ��i t��ng xu�t hi�n. ");
				end;
				Try_To_Create_FightNPC("T��ng qu�n",nEnemyCamp);	--�Է���ͳ�ȷ汻��¾�������Է��󽫳�
			end;
		end;
	elseif sNpcTypeName == "Ti�n phong" then
		nNpcType = TYPE_PIONEER;
		SetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1,GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1)+1);
		if GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1) == PIONEER_COUNT then
			if GetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1) == GENERAL_COUNT then
				if nEnemyNpcType == 2 then
					Msg2MSAll(MISSION_ID,tCampNameZ[nEnemyCamp].." ��i t��ng v� Ti�n phong phe "..tCampNameZ[nEnemyCamp].." b� ��nh b�i, Nguy�n So�i xu�t hi�n. ");
				end;
				Try_To_Create_FightNPC("Nguy�n So�i",nEnemyCamp);	--�Է��󽫺��ȷ涼������Է�Ԫ˧��
			end;
			if GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1) == CAPTAIN_COUNT then
				if nEnemyNpcType == 1 then
					Msg2MSAll(MISSION_ID,tCampNameZ[nEnemyCamp].." xu�t hi�n. Ti�n phong "..tCampNameZ[nEnemyCamp].." b� ��nh b�i, ��i t��ng xu�t hi�n. ");
				end;
				Try_To_Create_FightNPC("T��ng qu�n",nEnemyCamp);	--�Է���ͳ�ȷ汻��¾�������Է��ȴ󽫳�
			end;
		end;
	elseif sNpcTypeName == "T��ng qu�n" then
		nNpcType = TYPE_GENERAL;
		SetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1,GetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1)+1);
		if GetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1) == GENERAL_COUNT then
			if GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1) == PIONEER_COUNT then
				if nEnemyNpcType == 2 then
					Msg2MSAll(MISSION_ID,tCampNameZ[nEnemyCamp].." ��i t��ng ti�n phong b� ��nh b�i,"..tCampNameZ[nEnemyCamp].." b� ��nh b�i, Nguy�n So�i xu�t hi�n. ");
				end;
				Try_To_Create_FightNPC("Nguy�n So�i",nEnemyCamp);	--�Է����ȷ汻��¾�������Է�Ԫ˧��
			end;
		end;
	elseif sNpcTypeName == "Nguy�n So�i" then
		nNpcType = TYPE_MARSHAL;
		if PlayerIndex > 0 then
			Msg2MSAll(MISSION_ID,GetName().." �� ��nh b�i, Nguy�n So�i phe "..tCampNameZ[nEnemyCamp]..", "..tCampNameZ[nPlayerCamp].."_gi�nh th�ng l�i cu�i c�ng.");
		else
			Msg2MSAll(MISSION_ID,GetNpcName(npcIndex).." �� ��nh b�i, Nguy�n So�i phe "..tCampNameZ[nEnemyCamp]..", "..tCampNameZ[nPlayerCamp].."_gi�nh th�ng l�i cu�i c�ng.");
		end;
		SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_WINNER,nPlayerCamp);
		ClearMapNpc(MAPID);	
		BT_OperateAllPlayer(tell_end,{},ALL_ID);
	end;
	SetNpcDeathScript(npcIndex,"");
	return nNpcType;
end;

function tell_end(tArg)
	SetFightState(0);
	Say(tBattleName[BATTLE_TYPE].." �� k�t th�c, b�n gi�t ���c <color=yellow>"..BT_GetData(PTNC_KILL).."<color> ng��i, t� tr�n <color=yellow>"..BT_GetData(PTNC_DEATH).."<color> l�n. C�c v� �� r�t n� l�c, h�y chu�n b� nh�n ph�n th��ng c�a Ho�ng ��!",0);
end;
--����NPC���ֻ�ȡNPC����Ӫ
function get_npc_camp(szNpcName)
	local nNpcCamp = 0;
	if strsub(szNpcName,1,2) == "T�ng" then
		nNpcCamp = SONG_ID;
	elseif strsub(szNpcName,1,2) == "Li�u" then
		nNpcCamp = LIAO_ID;
	else
		nNpcCamp = ALL_ID;
	end;
	return nNpcCamp;
end;
--����NPC�����ֻ�ȡNPC������
function get_npc_type(szNpcName)
	local nNameLen = strlen(szNpcName);
	return strsub(szNpcName,5,nNameLen);
end;