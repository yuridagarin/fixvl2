Include("\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\mainbattle_head.lua");
Include("\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\position.lua");

function InitMission()
	BT_InitBattle();
	local sCampName1,sCampName2 = "T�ng","Li�u";
	local sModelName1,sModelName2 = "T�ng T��ng Qu�n","V� t��ng Li�u_��i tho�i";
	local npcIndex = CreateNpc(sModelName1,sCampName1.."Ch� so�i",MAPID,1534,3745);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\maingeneral_npc.lua");
	npcIndex = CreateNpc(sModelName2,sCampName2.."Ch� so�i",MAPID,1961,3735);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\maingeneral_npc.lua");
	npcIndex = CreateNpc("R��ng �� Trung Nguy�n",sCampName1.."Qu�n nhu quan",MAPID,1512,3754);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("R��ng �� Trung Nguy�n",sCampName2.."Qu�n nhu quan",MAPID,1985,3746);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("V� binh th�nh m�n","Binh s�",MAPID,1571,3735);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\soldier_npc.lua");
	npcIndex = CreateNpc("V� binh th�nh m�n","Binh s�",MAPID,1924,3725);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\soldier_npc.lua");
	--==================�����ǽݾ���TRAP��====================================================
	for i=0,45 do	--��ߵ�TRAP��
		AddMapTrap(MAPID,1669*32,(3650+i)*32,"\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\trap_royal_road.lua");
		AddMapTrap(MAPID,1670*32,(3650+i)*32,"\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\trap_royal_road.lua");
	end;
	for i=0,40 do	--�ұߵ�TRAP��
		AddMapTrap(MAPID,1828*32,(3650+i)*32,"\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\trap_royal_road.lua");
		AddMapTrap(MAPID,1829*32,(3650+i)*32,"\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\trap_royal_road.lua");
	end;
	--========================================================================================
	SetMissionV(MV_MID_TRAP_SONG,1);	--��������Ӫ
	SetMissionV(MV_MID_TRAP_LIAO,1);
	local nEmplacementCamp = GetGlbValue(GLB_EMPLACEMENT);
	if nEmplacementCamp == SONG_ID then
		SetMissionV(MV_FRONT_TRAP_LIAO,1);
	elseif nEmplacementCamp == LIAO_ID then
		SetMissionV(MV_FRONT_TRAP_SONG,1);
	end;
end;

function RunMission()
	Msg2MSAll(MISSION_ID,"Th�m t� h�i b�o, ��ch ph��ng �� h�nh ��ng, t��ng s� phe ta nhanh ch�ng v�o trong chu�n b� t�c chi�n.");
	
	Create_Fight_NPC(TYPE_SOLDIER,SOLDIER_COUNT,SONG_ID);
	Create_Fight_NPC(TYPE_SOLDIER,SOLDIER_COUNT,LIAO_ID);
	Create_Fight_NPC(TYPE_LOOEY,LOOEY_COUNT,SONG_ID);
	Create_Fight_NPC(TYPE_LOOEY,LOOEY_COUNT,LIAO_ID);
	Create_Fight_NPC(TYPE_CAPTAIN,CAPTAIN_COUNT,SONG_ID);
	Create_Fight_NPC(TYPE_CAPTAIN,CAPTAIN_COUNT,LIAO_ID);
	
	local nVillageCamp = 0;	--����ս��������Сս�����
	local nEmplacementCamp = 0;
	local nResourceCamp = 0;

	Create_Emplacement(ALL_ID,nEmplacementCamp);	--������̨������̨սӮ��һ����ƽ�־��ǹ���������
	Create_Emplacement(SONG_ID,SONG_ID);
	Create_Emplacement(LIAO_ID,LIAO_ID);	
	
	SetMissionV(MV_HERO_DEATH,1);	--��ʼ�����������������ʿ��Ŀ
	SetMissionV(MV_HEADER_DEATH,1);

	Create_VillagerHeader(nVillageCamp);
	Create_Villager(nVillageCamp);
	Create_Refugee(SONG_ID,REFUGEE_COUNT);
	Create_Refugee(LIAO_ID,REFUGEE_COUNT);
	Create_Refugee_Receiver(SONG_ID);
	Create_Refugee_Receiver(LIAO_ID);
	Create_Box();
	Create_Nonaligned_Hero();
	Create_ArrowBuilding();
	
	StartMissionTimer(MISSION_ID,INJURE_TIMER_ID,INTERVAL_TIME);
	BT_RunBattle();
end;

function EndMission()
	SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);	--����Ϊ����״̬��������������Ϊ�˷������ʱֱ����CloseMission����ս��
	--����Ҫ����MV_WHO_WIN��Mission����ֵ����¼�ⳡս����ʤ�������ʹ�÷���������
	local nWhoWin = GetMissionV(MV_WINNER);
	if nWhoWin == ALL_ID then
		Msg2SubWorld("T�ng Li�u qua nh�ng h�i giao tranh quy�t li�t, cu�i c�ng trong "..tBattleName[PRIMARY_MAINBATTLE_ID].." b�t ph�n th�ng b�i");
	elseif nWhoWin == SONG_ID then
		Msg2SubWorld("T�ng Li�u qua nh�ng h�i giao tranh quy�t li�t, phe T�ng trong "..tBattleName[PRIMARY_MAINBATTLE_ID].." gi�nh chi�n th�ng chung cu�c");
	else
		Msg2SubWorld("T�ng Li�u qua nh�ng h�i giao tranh quy�t li�t, cu�i c�ng phe Li�u trong "..tBattleName[PRIMARY_MAINBATTLE_ID].." gi�nh chi�n th�ng chung cu�c");
	end;
	SetGlbValue(GLB_MAINBATTLE,GetMissionV(MV_WINNER));
	StopMissionTimer(MISSION_ID,INJURE_TIMER_ID);
	ClearGroup(ARROWBUILDING_GROUP_SONG);
	ClearGroup(ARROWBUILDING_GROUP_LIAO);
	BT_EndBattle();
	BT_BattleAllOver();	--����ߵ�����ս����ͬһ�����������Ļ�����Ҫ��֤������ս��Ҫͬʱ����
end;

function OnLeave(RoleIndex)	--ע����ڴ��̹��������ߵĴ���
	PlayerIndex = RoleIndex;
	local nCamp = BT_GetCamp();
	local nRefugeeModel = {"N�n d�n T�ng","N�n d�n Li�u"};
	BT_ShowDebugInfor("Tr� GetMissionV(MS_BATTLE_STATE):"..GetMissionV(MS_BATTLE_STATE));
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then	--��ս������ʱ�뿪
		BT_ShowDebugInfor("Tr� BT_GetTempData(PTT_FOLLOWER):"..BT_GetTempData(PTT_FOLLOWER));
		if BT_GetTempData(PTT_FOLLOWER) == 1 then
			local nRefugeeIndex = CreateNpc(nRefugeeModel[nCamp],tCampNameZ[nCamp].." _n�n d�n",GetWorldPos());
			SetNpcScript(nRefugeeIndex,"\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\refugee_talk_npc.lua");
			BT_ShowDebugInfor("L�p 1 n�n d�n, h��ng d�n:"..nRefugeeIndex)
			BT_SetData(PT_HAVE_REFUGEE,1)
		end;
		BT_ShowDebugInfor("� ��y x�a theo sau ��y!!!!!")
		KillFollower()	--�������
		BT_SetTempData(PTT_FOLLOWER,0);	--�뿪��ʱ������Ͷ���
	end;
	if BT_GetTempData(PTT_FIGHT_STATE) ~= ROOM_STATE_IDLE or BT_GetTempData(PTT_ROOMINDEX) ~= 0 then	--����ڵ�����ʱ���뿪��ս��,����ʹ��������������֤
		local nRoomIndex = BT_GetTempData(PTT_ROOMINDEX);
		local sName = GetName();
		local nEnemyCamp = 3 - nCamp;
		local nOffset1 = (nRoomIndex-1)*2+nCamp-1;	
		local nOffset2 = (nRoomIndex-1)*2+nEnemyCamp-1;
		local nDeathRank = abs(BT_GetData(PT_CURRANK));	--�˳��͵��Ǳ�ɱ����
		if nDeathRank == 0 then
			nDeathRank = 1;
		end;
		local nRankPoint = tKillPlayerPoint[nDeathRank];
		if GetMissionV(MV_FIGHTER_GROUP1_1+nOffset1) ~= 0 or GetMissionV(MV_FIGHTER_GROUP1_1+nOffset2,0) ~= 0 then	--��һ���˳���
			BT_SetData(PTNC_SINGLE_LOSE,BT_GetData(PTNC_SINGLE_LOSE)+1);
			BT_DecPersonalPoint(2*ceil(nRankPoint/3),1);	--�۳����˻���2/3����Ӧ���˻���
			PlayerIndex = GetMissionV(MV_FIGHTER_GROUP1_1+nOffset2);	--���ڳ��ϵ��˻�ʤ
			local nPlayerCamp = BT_GetCamp();
			local nGotPoint = 0;
			BT_EmperorAward(3,1);	--����ʤ���У����Ļ����ûʵۼν�
			nGotPoint = BT_AddPersonalPoint(2*nRankPoint,0,1);	--����ɱ��һ����˫�����˻���
			BT_DecMissionPoint(nPlayerCamp,nGotPoint);	--�ѹ������ֿۻ�ȥ	
			SetMissionV(MV_FIGHTING_ROOM1+nRoomIndex-1,ROOM_STATE_END);	
			BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_END);
			Say(sName.." tho�t kh�i tr� ch�i, ph�n th�ng ��n ��u thu�c v� b�n!",0);
			SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),14);
			SetFightState(0);
			Restore();
			RestoreNeili();			
			SetMissionV(MV_FIGHTER_GROUP1_1+nOffset1,0);	--��һ�����˳���ʱ���������������0,�����Ϳ�������ж��ǲ��ǵڶ������˳�
			SetMissionV(MV_FIGHTER_GROUP1_1+nOffset2,0);
		else
			SetMissionV(MV_FIGHTING_ROOM1+nRoomIndex-1,ROOM_STATE_IDLE);	--�ڶ����˳���ʱ��Ҫ�ѷ�����Ϊ����״̬�Ա�����˽���
		end;
	end;
	PlayerIndex = RoleIndex;
	BT_LeaveBattle();
end;

function JoinMission(RoleIndex,nCamp)
	PlayerIndex = RoleIndex;
	BT_JoinBattle(nCamp);
	PlayerIndex = RoleIndex;
end;