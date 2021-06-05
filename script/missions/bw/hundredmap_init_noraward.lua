Include("\\script\\missions\\bw\\bwhead.lua")

function main()

local MapTab = {}
local nHundredMapID = 0;
local nMapIndex = 0;
local nNpcIndex = 0;

	for i=1,getn(MultiMapTab) do
		if MultiMapTab[i][2] == 300 then
			OldWorld = SubWorld
			SubWorld = SubWorldID2Idx(MultiMapTab[i][1])
			if SubWorld ~= -1 then
				if GetMissionV(MULTIMAP_STATE) == 0 then
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
	nHundredMapID = MultiMapTab[nMapIndex][1];
	
		if SubWorldID2Idx(nHundredMapID) ~= -1 then
			OldWorld = SubWorld;
			SubWorld = SubWorldID2Idx(nHundredMapID);
			
			if SubWorld <= 0 then
				WriteLog("[Qu�n h�ng chi�n]Qu�n h�ng chi�n b�o l�i! nHundredMapID l�"..nHundredMapID..". Kh�ng th� ti�n h�nh thi ��u!");
				SubWorld = OldWorld;
				return 0
			end
			
			OpenMission(MULIT_MISSION_ID);
			SetMissionV(GAME_TYPE,1);
			StartMissionTimer(MULIT_MISSION_ID, MULTI_TIME_ID2, MULTI_TIMER_2);
			nNpcIndex = CreateNpc("Ch� c�m �� Trung Nguy�n","��i Ch� C��ng",MultiMapTab[nMapIndex][1],MultiMapTab[nMapIndex][6],MultiMapTab[nMapIndex][7]);--���һ�����ͳ������õ�Npc
  		SetNpcScript(nNpcIndex,"\\script\\missions\\bw\\multimap_npc.lua")
  		SetMissionV(MULTIMAP_NPC_INDEX,nNpcIndex);
  		SubWorld = OldWorld
		end
	
	Msg2SubWorld("��i Ch� C��ng thay m�t ch� nh�n t� ch�c Qu�n h�ng chi�n t�i l�i ��i Th�nh ��! Hoan ngh�nh c�c anh h�ng h�o h�n ��n b�o danh!");
	AddGlobalNews("��i Ch� C��ng thay m�t ch� nh�n t� ch�c Qu�n h�ng chi�n t�i l�i ��i Th�nh ��! Hoan ngh�nh c�c anh h�ng h�o h�n ��n b�o danh!");
	
end