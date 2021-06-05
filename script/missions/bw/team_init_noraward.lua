Include("\\script\\missions\\bw\\bwhead.lua")

function main()

local MapTab = {}
local nGemeTeamMapID = 0;
local nMapIndex = 0;
local nNpcIndex = 0;

	for i=1,getn(TeamMapTab) do
		if TeamMapTab[i][2] == 300 then
			OldWorld = SubWorld
			SubWorld = SubWorldID2Idx(TeamMapTab[i][1])
			if SubWorld ~= -1 then
				if GetMissionV(TEAM_GAME_STATE) == 0 then
					tinsert(MapTab,i)
				end
			end
			SubWorld = OldWorld
		end
	end
	
	if getn(MapTab) == 0 then
		WriteLog("[Qu�n h�ng chi�n]Qu�n h�ng chi�n b�o l�i! Kh�ng t�m th�y khu v�c m�c ti�u! Xin ki�m tra l�i!");
		return 0
	end
	
	nMapIndex = MapTab[random(1,getn(MapTab))];
	nGemeTeamMapID = TeamMapTab[nMapIndex][1];
	
		if SubWorldID2Idx(nGemeTeamMapID) ~= -1 then
			OldWorld = SubWorld;
			SubWorld = SubWorldID2Idx(nGemeTeamMapID);
			
			if SubWorld <= 0 then
				WriteLog("[Qu�n h�ng chi�n]Qu�n h�ng chi�n b�o l�i! nHundredMapID l�"..nHundredMapID..". Kh�ng th� ti�n h�nh thi ��u!");
				SubWorld = OldWorld;
				return 0
			end
			
			OpenMission(TEAM_MISSION_ID);
			SetMissionV(GAME_TYPE,3);
			StartMissionTimer(TEAM_MISSION_ID,TEAM_TIME_ID2,TEAM_TIMER_2);
			nNpcIndex = CreateNpc("Ch� c�m �� Trung Nguy�n","��i Ch� C��ng",TeamMapTab[nMapIndex][1],TeamMapTab[nMapIndex][6],TeamMapTab[nMapIndex][7]);--���һ�����ͳ������õ�Npc
  		SetNpcScript(nNpcIndex,"\\script\\missions\\bw\\team_game_npc.lua")
  		SetMissionV(NPC_INDEX,nNpcIndex);
  		SubWorld = OldWorld
		end
	
	Msg2SubWorld("��i Ch� C��ng thay m�t ch� nh�n t� ch�c ��i chi�n t�i l�i ��i Th�nh ��! Hoan ngh�nh c�c anh h�ng h�o h�n ��n b�o danh!");
	AddGlobalNews("��i Ch� C��ng thay m�t ch� nh�n t� ch�c ��i chi�n t�i l�i ��i Th�nh ��! Hoan ngh�nh c�c anh h�ng h�o h�n ��n b�o danh!");
	
end