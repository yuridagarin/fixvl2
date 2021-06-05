Include("\\settings\\static_script\\kf_newbattles\\resourcebattle\\resourcebattle_head.lua");

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
	local npcIndex = CreateNpc(sModelName1,sCampName1.."Ch� so�i",MAPID,1560,3562);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\resourcebattle\\maingeneral_npc.lua");
	npcIndex = CreateNpc(sModelName2,sCampName2.."Ch� so�i",MAPID,1779,3172);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\resourcebattle\\maingeneral_npc.lua");
	npcIndex = CreateNpc("R��ng �� Trung Nguy�n",sCampName1.."Qu�n nhu quan",MAPID,1563,3538);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("R��ng �� Trung Nguy�n",sCampName2.."Qu�n nhu quan",MAPID,1764,3168);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("V� binh th�nh m�n","Binh s�",MAPID,1582,3546);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\resourcebattle\\soldier_npc.lua");
	npcIndex = CreateNpc("V� binh th�nh m�n","Binh s�",MAPID,1758,3196);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\resourcebattle\\soldier_npc.lua");
	npcIndex = CreateNpc("N�n d�n","N�n d�n",MAPID,1602,3260);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\resourcebattle\\refugee_npc.lua");
	npcIndex = CreateNpc("Th� l�nh s�n t�c","Th� l�nh s�n t�c",MAPID,1735,3534)
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\resourcebattle\\cateran_header_npc.lua");
--	for i=1,30 do
--		AddMapTrap(MAPID,(1573+i)*32,(3532+i)*32,"\\settings\\static_script\\kf_newbattles\\resourcebattle\\trap.lua")
--		AddMapTrap(MAPID,(1573+i)*32,(3533+i)*32,"\\settings\\static_script\\kf_newbattles\\resourcebattle\\trap.lua")
--	end;
--	for i=1,30 do
--		AddMapTrap(MAPID,(1742+i)*32,(3192+i)*32,"\\settings\\static_script\\kf_newbattles\\resourcebattle\\trap.lua");
--		AddMapTrap(MAPID,(1742+i)*32,(3193+i)*32,"\\settings\\static_script\\kf_newbattles\\resourcebattle\\trap.lua");
--	end;
	SetMissionV(MV_CHANGEDRUMLEFT_SONG,DRUM_COUNT)	--��ʼ��ս������
	SetMissionV(MV_CHANGEDRUMLEFT_LIAO,DRUM_COUNT)	--��ʼ��ս������
end;

function RunMission()
	Msg2MSAll(MISSION_ID,"Th�m m� h�i b�o ��ch ph��ng �� h�nh ��ng, c�n nhanh ch�ng v�o trong chu�n b� t�c chi�n.");
	SetMissionV(MV_RESOURCE_SONG,BASE_RESOURCE);
	SetMissionV(MV_RESOURCE_LIAO,BASE_RESOURCE);
	Create_QuarterMaster();
	Reflash_Res();
	BT_RunBattle();
end;

function EndMission()
	SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);	--����Ϊ����״̬��������������Ϊ�˷������ʱֱ����CloseMission����ս��
	local nResSong = GetMissionV(MV_RESOURCE_SONG);
	local nResLiao = GetMissionV(MV_RESOURCE_LIAO);
	if nResSong > nResLiao then
		SetMissionV(MV_WINNER,SONG_ID);--��Ӯ
		Msg2SubWorld("Qua nh�ng h�i giao tranh �c li�t, phe T�ng gi�nh th�ng l�i chung cu�c t�i Nh�n M�n Quan-chi�n d�ch th�o c�c!");
	elseif nResSong == nResLiao then
		SetMissionV(MV_WINNER,ALL_ID);--��ƽ
		Msg2SubWorld("Qua nh�ng h�i giao tranh �c li�t, T�ng-Li�u ��i b�n b�t ph�n th�ng b�i t�i Nh�n M�n Quan-chi�n d�ch th�o c�c!");
	else
		SetMissionV(MV_WINNER,LIAO_ID);--��Ӯ
		Msg2SubWorld("Qua nh�ng h�i giao tranh �c li�t, phe Li�u gi�nh th�ng l�i chung cu�c t�i Nh�n M�n Quan-chi�n d�ch th�o c�c!");
	end;
	--����Ҫ����MV_WHO_WIN��Mission����ֵ����¼�ⳡս����ʤ�������ʹ�÷���������
	SetGlbValue(GLB_RESOURCE,GetMissionV(MV_WINNER));
	local nWhoWin = GetMissionV(MV_WINNER);
	local nYear,nMonth,nDay,nHour = tonumber(date("%Y")),tonumber(date("%m")),tonumber(date("%d")),tonumber(date("%H"));
	if STATISTIC_OPEN == 1 then
		DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,1);
		AddRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,1,"","",0,"final_result","ddddddd",nWhoWin,nResSong,nResLiao,nYear,nMonth,nDay,nHour);
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
