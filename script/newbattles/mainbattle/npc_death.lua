Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");
Include("\\script\\newbattles\\box_effect_head.lua");
TBOX_FILE = new(KTabFile, "\\settings\\newbattles\\mainbattle\\kill_npc_effect.txt")
function OnDeath(npcIndex)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local sNpcName = GetNpcName(npcIndex);
	SetNpcLifeTime(npcIndex,DEAD_BODY_TIME);
	if PlayerIndex == 0 then
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
	elseif sNpcName == "T�ng B�ch Th�ng Chi�n Th�n" or sNpcName == "Li�u B�ch Th�ng Chi�n Th�n" then
		return 0;
	end	
	local nNpcCamp = get_npc_camp(sNpcName);
	process_camp_fight_camp(nNpcCamp,sNpcName,npcIndex,1)
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
		Msg2MSGroup(MISSION_ID,"Ng��i ch�i:"..GetName().."  �� gi�t "..sNpcName..", binh s� ph�n ch�n h�n l�n",nPlayerCamp);
		BT_OperateAllPlayer(BoxEffectFunc,{},nPlayerCamp);
	elseif sNpcName == "K� nh�n d� s�" then
		nNpcType = TYPE_HERO;
		SetMissionV(MV_HERO_DEATH,1);
		BT_AddBattleActivity(BA_MAIN_KILL_HEADER);
		Msg2MSGroup(MISSION_ID,"Ng��i ch�i:"..GetName().."  �� gi�t "..sNpcName..", binh s� ph�n ch�n h�n l�n",nPlayerCamp);
		BT_OperateAllPlayer(BoxEffectFunc,{},nPlayerCamp);
	elseif sNpcName == "T�ng B�ch Th�ng Chi�n Th�n" or sNpcName == "Li�u B�ch Th�ng Chi�n Th�n" then
		return 0;
	else
		nNpcType = process_camp_fight_camp(nPlayerCamp,sNpcName,npcIndex,2)
		if nNpcType == TYPE_EMPLACEMENT then
			BT_AddBattleActivity(BA_MAIN_KILL_EMPL);
		elseif nNpcType <= TYPE_CAPTAIN then
			BT_AddBattleActivity(BA_MAIN_KILL_ENEMY);	--ɱ��һ���Է�ʿ����Уξ����ͳ
		else 
			BT_AddBattleActivity(BA_MAIN_KILL_BOSS);	--ɱ���Է���Ӫ���ȷ桢������Ԫ˧
		end;
	end;
	BT_EmperorAward(tKillNpcEAP[nNpcType]);
	local nPoint = tKillNpcPoint[nNpcType]
	local nKillVillagerPoint = BT_GetData(PTNC_KILL_VILLAGER_POINT);
	local nKillSoldierPoint = BT_GetData(PTNC_KILL_SOLDIER_POINT);
	if nNpcType == TYPE_REFUGEE then	--���ɱ�������񣬾ͼ�һ��
		if nKillVillagerPoint < KILL_VILLAGER_POINT_LIMITED then	
			BT_AddPersonalPoint(nPoint);	--�������һ���ĸ��˻���
			BT_SetData(PTNC_KILL_VILLAGER_POINT,nKillVillagerPoint+nPoint);
		end;
		SetMissionV(MV_KILL_VILLAGER_COUNT,GetMissionV(MV_KILL_VILLAGER_COUNT)+1);
	elseif nNpcType == TYPE_SOLDIER then	--���ɱ����ʿ����Ҳ��һ��
		if nKillSoldierPoint < KILL_SOLDIER_POINT_LIMITED then	
			BT_AddPersonalPoint(nPoint);	--�������һ���ĸ��˻���
			BT_SetData(PTNC_KILL_SOLDIER_POINT,nKillSoldierPoint+nPoint);
		end;
		SetMissionV(MV_KILL_SONG_SOLDIER_COUNT+2-nPlayerCamp,GetMissionV(MV_KILL_SONG_SOLDIER_COUNT+2-nPlayerCamp)+1);
	else
		BT_AddPersonalPoint(nPoint);	--�������һ���ĸ��˻���
	end;
	BT_AddMissionPoint(nPlayerCamp,nPoint);		--����һ���Ĺ�������
	Judge_State_By_Point(nPlayerCamp);
end;
--����һ����Ӫ����һ�NPC������һ����Ӫ��NPC�¼�
--��Ϊ�Ƿ���ΪNPC��NPC���������������治������״̬���в����������Ժ���PlayerIndex
function process_camp_fight_camp(nPlayerCamp,sNpcName,nNpcIndex,nKillType)
	local nEnemyCamp = 3 - nPlayerCamp
	if nEnemyCamp >= 3 then
		nEnemyCamp = random(1,2)
	end
	local sNpcTypeName = get_npc_type(sNpcName);
	local _,nNpcPos_X,nNpcPos_Y = GetNpcWorldPos(nNpcIndex);
	local nEnemyNpcType = GetMissionV(MV_NPC_TYPE_SONG+nEnemyCamp-1);
	if sNpcTypeName == "Ph�o ��i" then		
		local nEmplacementPosIndex = get_emplacement_pos_index(nNpcPos_X,nNpcPos_Y);		
		local nEmplacementCamp = nPlayerCamp
		if nKillType == 1 then
			nEmplacementCamp = nEnemyCamp
		end
		Create_Emplacement(nEmplacementPosIndex,nEmplacementCamp)		
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
					if nEnemyCamp == SONG_ID then
						Msg2MSAll(MISSION_ID,"Hi�u �y v� �� th�ng c�a phe T�ng b� ��nh b�i, T�ng ti�n phong �� xu�t hi�n.");
					else
						Msg2MSAll(MISSION_ID,"Hi�u �y v� �� th�ng c�a phe Li�u b� ��nh b�i, Li�u ti�n phong �� xu�t hi�n.");
					end;
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
					if nEnemyCamp == SONG_ID then
						Msg2MSAll(MISSION_ID,"Hi�u �y v� �� th�ng c�a phe T�ng b� ��nh b�i, T�ng ti�n phong �� xu�t hi�n.");
					else
						Msg2MSAll(MISSION_ID,"Hi�u �y v� �� th�ng c�a phe Li�u b� ��nh b�i, Li�u ti�n phong �� xu�t hi�n.");
					end;
				end;
				Try_To_Create_FightNPC("Ti�n phong",nEnemyCamp);	--�Է�Уξ��ͳ����¾�������Է��ȷ��
			end;
			if GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1) == PIONEER_COUNT then
				if nEnemyNpcType == 1 then
					if nEnemyCamp == SONG_ID then
						Msg2MSAll(MISSION_ID,"�� th�ng ti�n phong c�a phe T�ng b� ��nh b�i, T�ng ��i t��ng �� xu�t hi�n.");
					else
						Msg2MSAll(MISSION_ID,"�� th�ng ti�n phong c�a phe Li�u b� ��nh b�i, Li�u ��i t��ng �� xu�t hi�n.");
					end;	
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
					if nEnemyCamp == SONG_ID then
						Msg2MSAll(MISSION_ID,"��i t��ng v� ti�n phong c�a phe T�ng b� ��nh b�i, T�ng nguy�n so�i �� xu�t hi�n.");
					else
						Msg2MSAll(MISSION_ID,"��i t��ng v� ti�n phong c�a phe Li�u b� ��nh b�i, Li�u nguy�n so�i �� xu�t hi�n.");
					end;
				end;
				Try_To_Create_FightNPC("Nguy�n So�i",nEnemyCamp);	--�Է��󽫺��ȷ涼������Է�Ԫ˧��
			end;
			if GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1) == CAPTAIN_COUNT then
				if nEnemyNpcType == 1 then
					if nEnemyCamp == SONG_ID then
						Msg2MSAll(MISSION_ID,"�� th�ng ti�n phong c�a phe T�ng b� ��nh b�i, T�ng ��i t��ng �� xu�t hi�n.");
					else
						Msg2MSAll(MISSION_ID,"�� th�ng ti�n phong c�a phe Li�u b� ��nh b�i, Li�u ��i t��ng �� xu�t hi�n.");
					end;
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
					if nEnemyCamp == SONG_ID then
						Msg2MSAll(MISSION_ID,"��i t��ng ti�n phong c�a phe T�ng b� ��nh b�i, T�ng nguy�n so�i �� xu�t hi�n.");
					else
						Msg2MSAll(MISSION_ID,"��i t��ng ti�n phong c�a phe Li�u b� ��nh b�i, Li�u nguy�n so�i �� xu�t hi�n.");
					end;
				end;
				Try_To_Create_FightNPC("Nguy�n So�i",nEnemyCamp);	--�Է����ȷ汻��¾�������Է�Ԫ˧��
			end;
		end;
	elseif sNpcTypeName == "Nguy�n So�i" then
		nNpcType = TYPE_MARSHAL;
		if nEnemyCamp == SONG_ID then
			if PlayerIndex > 0 then
				Msg2MSAll(MISSION_ID,GetName().." �� ��nh b�i nguy�n so�i phe T�ng, phe Li�u gi�nh th�ng l�i chung cu�c.");
			else
				Msg2MSAll(MISSION_ID,GetNpcName(npcIndex).." �� ��nh b�i nguy�n so�i phe T�ng, phe Li�u gi�nh th�ng l�i chung cu�c.");
			end;
		else
			if PlayerIndex > 0 then
				Msg2MSAll(MISSION_ID,GetName().." �� ��nh b�i nguy�n so�i phe Li�u, phe T�ng gi�nh th�ng l�i chung cu�c.");
			else
				Msg2MSAll(MISSION_ID,GetNpcName(npcIndex).." �� ��nh b�i nguy�n so�i phe Li�u, phe T�ng gi�nh th�ng l�i chung cu�c.");
			end;		
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
	Say(tBattleName[BATTLE_TYPE].."�� k�t th�c, s� n� l�c c�a c�c v� s� ���c ban th��ng x�ng ��ng.",0);
	SetFightState(0);
end;
--����NPC���ֻ�ȡNPC����Ӫ
function get_npc_camp(szNpcName)
	local nNpcCamp = 0;
	if szNpcName == "T�ng B�ch Th�ng Chi�n Th�n" or szNpcName == "T�ng qu�n tinh binh" or szNpcName == "T�ng qu�n c��ng n� binh" or szNpcName == "T�ng hi�u �y" 
		or szNpcName == "T�ng �� th�ng" or szNpcName == "T�ng ti�n phong" or szNpcName == "T��ng qu�n (T�ng)" 
		or szNpcName == "T�ng nguy�n so�i" or szNpcName == "Ph�o ��i T�ng" then
		nNpcCamp = SONG_ID;
	elseif  szNpcName == "Li�u B�ch Th�ng Chi�n Th�n" or szNpcName == "Li�u qu�n d�ng s�" or szNpcName == "Li�u qu�n ng�nh ti�n binh" or szNpcName == "Li�u hi�u �y" 
		or szNpcName == "Li�u �� th�ng" or szNpcName == "Li�u ti�n phong" or szNpcName == "T��ng qu�n (Li�u) " 
		or szNpcName == "Li�u nguy�n so�i" or szNpcName == "Ph�o ��i Li�u" then
		nNpcCamp = LIAO_ID;
	else
		nNpcCamp = ALL_ID;
	end;
	return nNpcCamp;
end;
--����NPC�����ֻ�ȡNPC������
function get_npc_type(szNpcName)
	local sNpcTypeName = "";
	if szNpcName == "T�ng qu�n tinh binh" or szNpcName == "T�ng qu�n c��ng n� binh" or szNpcName == "Li�u qu�n d�ng s�" or szNpcName == "Li�u qu�n ng�nh ti�n binh" then
		sNpcTypeName = "Binh tinh nhu�";
	elseif szNpcName == "T�ng hi�u �y" or szNpcName == "Li�u hi�u �y" then
		sNpcTypeName = "Hi�u �y";
	elseif szNpcName == "T�ng �� th�ng" or szNpcName == "Li�u �� th�ng" then
		sNpcTypeName = "�� th�ng";
	elseif szNpcName == "T�ng ti�n phong" or szNpcName == "Li�u ti�n phong" then
		sNpcTypeName = "Ti�n phong";
	elseif szNpcName == "T��ng qu�n (T�ng)" or szNpcName == "T��ng qu�n (Li�u) " then
		sNpcTypeName = "T��ng qu�n";
	elseif szNpcName == "T�ng nguy�n so�i" or szNpcName == "Li�u nguy�n so�i" then
		sNpcTypeName = "Nguy�n So�i";
	elseif szNpcName == "Ph�o ��i trung l�p" or szNpcName == "Ph�o ��i Li�u" or szNpcName == "Ph�o ��i T�ng" then
		sNpcTypeName = "Ph�o ��i";
	elseif szNpcName == "Ti�n th�p-T�ng" or szNpcName == "Ti�n th�p-Li�u" then
		sNpcTypeName = "Ti�n th�p";
	end;
	return sNpcTypeName;
end;
