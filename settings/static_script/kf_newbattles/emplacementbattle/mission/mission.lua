Include("\\settings\\static_script\\kf_newbattles\\emplacementbattle\\emplacementbattle_head.lua");

function InitMission()
	BT_InitBattle();
	local sCampName1,sCampName2 = "T�ng","Li�u";
	local sModelName1,sModelName2 = "T�ng T��ng Qu�n","V� t��ng Li�u_��i tho�i";
	if GetGlbValue(RANDOM_PLACE) == 1 then
		sCampName1 = "Li�u";
		sCampName2 = "T�ng";
		sModelName1 = "V� t��ng Li�u_��i tho�i";
		sModelName2 = "T�ng T��ng Qu�n";
	end;
	local npcIndex = CreateNpc(sModelName1,sCampName1.."Ch� so�i",MAPID,1602,3358);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\emplacementbattle\\maingeneral_npc.lua");
	npcIndex = CreateNpc(sModelName2,sCampName2.."Ch� so�i",MAPID,1855,3360);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\emplacementbattle\\maingeneral_npc.lua");
	npcIndex = CreateNpc("R��ng �� Trung Nguy�n",sCampName1.."Qu�n nhu quan",MAPID,1582,3366);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("R��ng �� Trung Nguy�n",sCampName2.."Qu�n nhu quan",MAPID,1875,3365);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("V� binh th�nh m�n","Binh s�",MAPID,1623,3358);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\emplacementbattle\\soldier_npc.lua");
	npcIndex = CreateNpc("V� binh th�nh m�n","Binh s�",MAPID,1837,3361);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\emplacementbattle\\soldier_npc.lua");
--	for i=1,30 do
--		AddMapTrap(MAPID,(1617+i)*32,(3332+i)*32,"\\settings\\static_script\\kf_newbattles\\emplacementbattle\\trap.lua")
--		AddMapTrap(MAPID,(1617+i)*32,(3333+i)*32,"\\settings\\static_script\\kf_newbattles\\emplacementbattle\\trap.lua")
--	end;
--	for i=1,30 do
--		AddMapTrap(MAPID,(1810+i)*32,(3357-i)*32,"\\settings\\static_script\\kf_newbattles\\emplacementbattle\\trap.lua");
--		AddMapTrap(MAPID,(1810+i)*32,(3358-i)*32,"\\settings\\static_script\\kf_newbattles\\emplacementbattle\\trap.lua");
--	end;
end;

function RunMission()
	Msg2MSAll(MISSION_ID,"Th�m t� h�i b�o, ��ch ph��ng �� h�nh ��ng, t��ng s� phe ta nhanh ch�ng v�o trong chu�n b� t�c chi�n.");
	Create_Emplacement(ALL_ID); --������̨Ϊ����״̬
	Create_Npc("Th� d�n",getn(tNative_Pos));
	Create_Npc("V� binh Ph�o ��i",getn(tGuard_Pos));
	Create_Box();
	StartMissionTimer(MISSION_ID,INJURE_TIMER_ID,INTERVAL_TIME);
	BT_RunBattle();
end;

function EndMission()
	SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);	--����Ϊ����״̬��������������Ϊ�˷������ʱֱ����CloseMission����ս��
	local nTimeSong = GetMissionV(MV_OCCUPY_TIME_SONG);
	local nTimeLiao = GetMissionV(MV_OCCUPY_TIME_LIAO);
	if nTimeSong > nTimeLiao then
		SetMissionV(MV_WINNER,SONG_ID);--��Ӯ
		Msg2SubWorld("Qua nh�ng h�i giao tranh �c li�t  phe T�ng �� gi�nh th�ng l�i chung cu�c t�i Nh�n M�n Quan-chi�n d�ch ph�o ��i!");
	elseif nTimeSong == nTimeLiao then
		SetMissionV(MV_WINNER,ALL_ID);--��ƽ
		Msg2SubWorld("Qua nh�ng h�i giao tranh �c li�t, T�ng-Li�u hai b�n b�t ph�n th�ng b�i t�i Nh�n M�n Quan-chi�n d�ch ph�o ��i!");
	else
		SetMissionV(MV_WINNER,LIAO_ID);--��Ӯ
		Msg2SubWorld("Qua nh�ng h�i giao tranh �c li�t, phe Li�u �� gi�nh th�ng l�i chung cu�c t�i Nh�n M�n Quan-chi�n d�ch ph�o ��i!");
	end;
	--����������������̨ս���еģ���Ϊ��̨ս������ʱ��������ս���ؽ��������������ս������ʱ���ط�ͨ��
	--AddGlobalNews("���Źزݹȳ�����ս�����Ź���̨����ս�����Źش�������ս����ս�۾���ս����ϣ����Ź���ս������15���Ӻ�ʼ��������˫����ʿ������ս׼����");
	--Msg2SubWorld("���Źزݹȳ�����ս�����Ź���̨����ս�����Źش�������ս����ս�۾���ս����ϣ����Ź���ս������15���Ӻ�ʼ��������˫����ʿ������ս׼����");

	--����Ҫ����MV_WHO_WIN��Mission����ֵ����¼�ⳡս����ʤ�������ʹ�÷���������
	SetGlbValue(GLB_EMPLACEMENT,GetMissionV(MV_WINNER));
	SetGlbValue(GLB_NEW_BATTLESTATE,0);	--���Сս��ȫ������
	StopMissionTimer(MISSION_ID,INJURE_TIMER_ID);
	local nWhoWin = GetMissionV(MV_WINNER);
	local nPubPointSong = BT_GetMissionPoint(SONG_ID);
	local nPubPointLiao = BT_GetMissionPoint(LIAO_ID);
	local nDeathSong = GetMissionV(MV_DEATH_COUNT_SONG);
	local nDeathLiao = GetMissionV(MV_DEATH_COUNT_LIAO);
	local nYear,nMonth,nDay,nHour = tonumber(date("%Y")),tonumber(date("%m")),tonumber(date("%d")),tonumber(date("%H"));
	if STATISTIC_OPEN == 1 then
		DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,1);
		AddRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,1,"","",0,"final_result","ddddddddddd",nWhoWin,nTimeSong,nTimeLiao,nPubPointSong,nPubPointLiao,nDeathSong,nDeathLiao,nYear,nMonth,nDay,nHour);
	end;
	BT_EndBattle();
end;

function OnLeave(RoleIndex)	--ע����ڴ��̹��������ߵĴ���
	PlayerIndex = RoleIndex;
	BT_LeaveBattle();
	PlayerIndex = RoleIndex;
end;

function JoinMission(RoleIndex,nCamp)
	PlayerIndex = RoleIndex;
	BT_JoinBattle(nCamp);
	PlayerIndex = RoleIndex;
end;
