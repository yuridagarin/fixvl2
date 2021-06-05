Include("\\script\\newbattles\\villagebattle\\villagebattle_head.lua");

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
	local npcIndex = CreateNpc(sModelName1,"Ch� so�i",MAPID,1539,3631);
	SetNpcScript(npcIndex,"\\script\\newbattles\\villagebattle\\maingeneral_npc.lua");
	npcIndex = CreateNpc(sModelName2,"Ch� so�i",MAPID,1794,3147);
	SetNpcScript(npcIndex,"\\script\\newbattles\\villagebattle\\maingeneral_npc.lua");
	npcIndex = CreateNpc("R��ng �� Trung Nguy�n","Qu�n nhu quan",MAPID,1545,3609);
	SetNpcScript(npcIndex,"\\script\\newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("R��ng �� Trung Nguy�n","Qu�n nhu quan",MAPID,1803,3164);
	SetNpcScript(npcIndex,"\\script\\newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("V� binh th�nh m�n","Binh s�",MAPID,1561,3614);
	SetNpcScript(npcIndex,"\\script\\newbattles\\villagebattle\\soldier_npc.lua");
	npcIndex = CreateNpc("V� binh th�nh m�n","Binh s�",MAPID,1776,3163);
	SetNpcScript(npcIndex,"\\script\\newbattles\\villagebattle\\soldier_npc.lua");
--	for i=1,30 do
--		AddMapTrap(MAPID,(1550+i)*32,(3600+i)*32,"\\script\\newbattles\\villagebattle\\trap.lua")
--		AddMapTrap(MAPID,(1550+i)*32,(3601+i)*32,"\\script\\newbattles\\villagebattle\\trap.lua")
--	end;
--	for i=1,30 do
--		AddMapTrap(MAPID,(1755+i)*32,(3161+i)*32,"\\script\\newbattles\\villagebattle\\trap.lua");
--		AddMapTrap(MAPID,(1755+i)*32,(3162+i)*32,"\\script\\newbattles\\villagebattle\\trap.lua");
--	end;
end;

function RunMission()
	local npcIndex = CreateNpc("V��ng An Th�ch","H��ng ��o qu�n",MAPID,1629,3321);
	SetNpcScript(npcIndex,"\\script\\newbattles\\villagebattle\\armyguide_npc.lua");
	Msg2MSAll(MISSION_ID,"Th�m m� h�i b�o ��ch ph��ng �� h�nh ��ng, c�n nhanh ch�ng v�o trong chu�n b� t�c chi�n.");
	BT_RunBattle();
end;

function EndMission()
	SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);	--����Ϊ����״̬��������������Ϊ�˷������ʱֱ����CloseMission����ս��
	local nStepSong = 0;
	local nStepLiao = 0;
	if GetMissionV(MV_WINNER) == 0 then	--�����ʱ�䵽�˶�������
		nStepSong = GetMissionV(MV_SONG_TASKSTEP);
		nStepLiao = GetMissionV(MV_LIAO_TASKSTEP);
		if nStepSong > nStepLiao then
			SetMissionV(MV_WINNER,SONG_ID);
			Msg2SubWorld("Qua nh�ng h�i giao tranh �c li�t, phe T�ng gi�nh th�ng l�i chung cu�c t�i Nh�n M�n Quan-chi�n d�ch Gi�i C�u N�ng Trang!");
		elseif nStepSong < nStepLiao then
			SetMissionV(MV_WINNER,LIAO_ID);
			Msg2SubWorld("Qua nh�ng h�i giao tranh �c li�t, phe Li�u gi�nh th�ng l�i chung cu�c t�i Nh�n M�n Quan-chi�n d�ch Gi�i C�u N�ng Trang!");
		else
			SetMissionV(MV_WINNER,ALL_ID);
			Msg2SubWorld("Qua nh�ng h�i giao tranh �c li�t, T�ng-Li�u hai b�n b�t ph�n th�ng b�i t�i Nh�n M�n Quan-chi�n d�ch Gi�i C�u N�ng Trang!");
		end;
	end;
	local nWhoWin = GetMissionV(MV_WINNER);
	SetGlbValue(GLB_VILLAGE,nWhoWin);
	local nYear,nMonth,nDay,nHour = tonumber(date("%Y")),tonumber(date("%m")),tonumber(date("%d")),tonumber(date("%H"));
	if STATISTIC_OPEN == 1 then
		DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,1);
		AddRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,1,"","",0,"final_result","ddddddd",nWhoWin,nStepSong,nStepLiao,nYear,nMonth,nDay,nHour);
	end;
	BT_EndBattle();
end;

function OnLeave(RoleIndex)	--ע����ڴ��̹��������ߵĴ���
	PlayerIndex = RoleIndex;
	BT_ShowDebugInfor(GetName().."BT_GetCamp trong OnLeave");
	local nCamp = BT_GetCamp();
	local sName = GetName();
	local nFoundTag = 0;
	local nTempState = BT_GetTempData(PTT_SELECTED);	--BT_LeaveBattle�����������ʱ�������������Ҫ�ȱ�������
	if BT_LeaveBattle() == 1 then
		if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT and nTempState == 1 then	--ֻ���ڿ�ս�׶β�����ѡ�е����뿪ս���������´���
			local tPlayer = BT_GetMSPlayerIndex(nCamp);
			local nPlayerCount = getn(tPlayer);
			local sNewName = "";
			local nFakeIndex = 0;	--��¼���������tPlayer�е�����������Ǽٵ�������� =,=
			local nTargetName = GetMissionS(MSTR_SONG_TARGETNAME+nCamp-1);
			BT_ShowDebugInfor("nPlayerCount:"..nPlayerCount);
			if nPlayerCount > 0 then	--������ڻ���ͬ��Ӫ�����
				BT_ShowDebugInfor("nPlayerCount > 0")
				for i=1,10 do	--����ѡ�˵�ʱ�����ѭ��10�Σ�����Ҳ�����˵��ʣ�µ���Ҷ����Ѿ���ѡ�����
					nPlayerCount = getn(tPlayer);
					if nPlayerCount == 0 then
						BT_ShowDebugInfor("Ng��i ch�i c�n l�i ��u ���c ch�n");
						break;
					end;
					nFakeIndex = random(1,nPlayerCount);
					PlayerIndex = tPlayer[nFakeIndex];
					if PlayerIndex > 0 and Is_The_Selected(nCamp) ~= 1 then	--��ѡ�����Ҳ���֮ǰ��ѡ�е�
						BT_SetTempData(PTT_SELECTED,1);
						sNewName = GetName();
						TaskTip("Nguy�n so�i c� l�nh, ng��i mau t�m"..nTargetName);
						nFoundTag = 1;
						break
					else	--�����������������������ҵ�������tPlayer��ɾ����
						tremove(tPlayer,nFakeIndex);
					end;
				end;
				for i=1,SELECT_COUNT do
					if GetMissionS(MSTR_SONG_ONE+nCamp+i*2-3) == sName then	--�ҵ�ԭ��������
						SetMissionS(MSTR_SONG_ONE+nCamp+i*2-3,sNewName);	--�����µ����֣��������û�ҵ�����ôsNewName����""
					end;
				end;
			else --��������һλ�˳���
				BT_ShowDebugInfor("Ng��i ch�i cu�i c�ng t�i Th�n trang chi�n �� r�i kh�i")
				Clear_Task_NPC(nCamp);
				SetMissionS(MSTR_SONG_TARGETNAME-1+nCamp,"");	--�����ÿգ��Ա�����������ҿ������¿�ʼ��
			end;
			if nFoundTag == 1 then
				Msg2MSGroup(MISSION_ID,"Do "..sName.." r�i kh�i chi�n tr��ng, nhi�m v� t�m di�t B�ch S� Th�ng s� ���c chuy�n cho "..sNewName..", c�c t��ng s� c�n ph�i �o�n k�t m�t l�ng.",nCamp);
				Msg2MSAll(MISSION_ID,tCampNameZ[nCamp].."_t�m B�ch S� Th�ng, nhi�m v� chuy�n giao:"..sNewName.."nh�n nhi�m v�");
			end;
		end;
	end;
	PlayerIndex = RoleIndex;
end;

function JoinMission(RoleIndex,nCamp)
	PlayerIndex = RoleIndex;
	BT_JoinBattle(nCamp);
	PlayerIndex = RoleIndex;
end;