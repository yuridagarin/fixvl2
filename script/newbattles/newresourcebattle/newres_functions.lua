-- Created by TuanNA5
-- 31/05/2010
-- T�i nguy�n chi�n

Include("\\script\\newbattles\\newresourcebattle\\newres_head.lua");

function AddNewResource()
	local nMapID = 606
	for i=1290, 1305 do 
		AddMapTrap(nMapID, i * 32, 2900 * 32, "\\script\\newbattles\\newresourcebattle\\trap\\song_trap.lua")
	end
	for i=1435, 1450 do 
		AddMapTrap(nMapID, i * 32, 3048 * 32, "\\script\\newbattles\\newresourcebattle\\trap\\liao_trap.lua")
	end
	--for i=1430, 1445 do 
		--AddMapTrap(nMapID, i * 32, 2909 * 32, "\\script\\newbattles\\newresourcebattle\\trap\\all_trap.lua")
	--end
	
	local nNpcIdx = 0;
	nNpcIdx = CreateNpc("M�c Qu� Anh","Tri�u T� Quy�n",nMapID,1239,2850);	
	SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\npc\\newres_song_npc.lua");	
	nNpcIdx = CreateNpc("D��ng T�n B�o","Ti�u Vi�n Tu�n",nMapID,1498,3106);	
	SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\npc\\newres_liao_npc.lua");
	nNpcIdx = CreateNpc("Qu�n gia","Ho�ng Tr� th��ng nh�n",nMapID,1356,2988);	
	SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\npc\\newres_saleman_npc.lua");	
	
	nNpcIdx = CreateNpc("B�o r��ng T�i nguy�n","T� Linh B�o R��ng",nMapID,1480,2864);	
	SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\npc\\newres_superchest_npc.lua");	
	
	nNpcIdx = CreateNpc("��i Long","Long T�",nMapID,1463,2848,6,1,1);	
	SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\npc\\newres_dragon_npc.lua");		
	
	nNpcIdx = CreateNpc("��i Ph�ng","Ph�ng T�",nMapID,1448,2864,6,1,1);	
	SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\npc\\newres_phoenix_npc.lua");	
	
	nNpcIdx = CreateNpc("��i H�","H� T�",nMapID,1481,2891,6,1,1);	
	SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\npc\\newres_tiger_npc.lua");	
	
	nNpcIdx = CreateNpc("��i �ng","�ng T�",nMapID,1492,2871,6,1,1);	
	SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\npc\\newres_ying_npc.lua");	
	
	for i=1,getn(tResPos[1]) do
		nNpcIdx = CreateNpc("c�y �a M�t Hoa Qu� trung","G� t�i nguy�n",nMapID,tResPos[1][i][1],tResPos[1][i][2]);	
		SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\resnpc\\stump.lua");	
	end
	for i=1,getn(tResPos[2]) do
		nNpcIdx = CreateNpc("Th�n ph�","Thu�c da t�i nguy�n",nMapID,tResPos[2][i][1],tResPos[2][i][2]);	
		SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\resnpc\\leather.lua");	
	end	
	for i=1,getn(tResPos[3]) do
		nNpcIdx = CreateNpc("D��c Nh�n Th�o","Th�o d��c  t�i nguy�n",nMapID,tResPos[3][i][1],tResPos[3][i][2]);	
		SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\resnpc\\herbal.lua");	
	end	
	for i=1,getn(tResPos[4]) do
		nNpcIdx = CreateNpc("R��ng n�t","R��ng ch�u b�u",nMapID,tResPos[4][i][1],tResPos[4][i][2]);	
		SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\resnpc\\chest.lua");	
	end	
	for i=1,getn(tResPos[5]) do
		nNpcIdx = CreateNpc("c�y �a M�t Hoa Qu� trung","G� t�i nguy�n",nMapID,tResPos[5][i][1],tResPos[5][i][2]);	
		SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\resnpc\\stump.lua");	
	end
	for i=1,getn(tResPos[6]) do
		nNpcIdx = CreateNpc("D��c Nh�n Th�o","Th�o d��c t�i nguy�n",nMapID,tResPos[6][i][1],tResPos[6][i][2]);	
		SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\resnpc\\herbal.lua");	
	end
	for i=1,getn(tResPos[7]) do
		nNpcIdx = CreateNpc("R��ng n�t","R��ng ch�u b�u",nMapID,tResPos[7][i][1],tResPos[7][i][2]);	
		SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\resnpc\\chest.lua");	
	end	
	for i=1,getn(tResPos[8]) do
		nNpcIdx = CreateNpc("c�y �a M�t Hoa Qu� trung","G� t�i nguy�n",nMapID,tResPos[8][i][1],tResPos[8][i][2]);	
		SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\resnpc\\stump.lua");	
	end
end

function newres_sign_up()
	local nCamp = BT_GetCurCamp()
	local nMapID = GetWorldPos();	
	if mf_GetMissionV(MISSION_ID,MV_STATE,MAP_ID) == MS_STATE_BEGIN then
		Talk(1,"",szNpcName.."Giai �o�n n�y b�t c� ai c�ng kh�ng ���c v�o!");
		return 0;
	end;
	if GetPlayerRoute() == 0 then
		Talk(1,"",szNpcName.."Gia nh�p m�n ph�i m�i c� th� tham gia chi�n d�ch!")
		return
	end
	if GetLevel() < 77 then
		Talk(1,"",szNpcName.."��ng c�p 77 tr� l�n m�i c� th� tham gia chi�n d�ch!")
		return
	end	
	if abs(GetTask(701)) < 15000 then
		Talk(1,"",szNpcName.."�i�m c�ng tr�ng ph�i ��t 15000 tr� l�n m�i c� th� tham gia chi�n d�ch!")
		return
	end	
	local tSay = {}
	tinsert(tSay, "Gia nh�p phe ta/#newres_confirm_sign_up(1)")
	tinsert(tSay, "Gia nh�p phe ��i ��ch (ph� tham gia b�ng Xu)/#newres_confirm_sign_up(2)")
	tinsert(tSay, "Gia nh�p phe ��i ��ch (ph� tham gia b�ng V�ng)/#newres_confirm_sign_up(3)")
	tinsert(tSay, "Ta c� vi�c b�n/gf_DoNothing")	
	Say(szNpcName.."<color=red>Ch� �: Th� c�ng s� bi�n m�t sau khi v�o chi�n tr��ng.<color> B�n mu�n gia nh�p phe <color=yellow>"..tCamp[nCamp].."<color>?", 4, tSay)
end

function newres_confirm_sign_up(nSelected)
	local tCash = {
		[1] = {60000, 0, 1, 2},
		[2] = {0, 68, 2, 1},	
		[3] = {0, 0, 2, 1},	
	}
	local tCash_PhongHam = {
		[2] = {39, 156},
		[3] = {69, 276},
		[4] = {79, 316},
		[5] = {99, 396},	
	}
	if nSelected == 2 or nSelected == 3 then
		if GetTask(704) == 6 or GetTask(704) == -6 then
			Talk(1, "", "Nguy�n So�i kh�ng th� v�o tham gia phe ��ch ���c !!!!")
			return		
		end
	end
	local nCamp = BT_GetCurCamp()
	local nPhongHam = abs(GetTask(704))	
	if nSelected == 1 then
		if GetCash() < tCash[nSelected][1] then
			Talk(1, "", "B�n kh�ng mang theo �� V�ng!")
			return
		end
	else
		if nSelected == 2 then
			if GetItemCount(2, 1, 30230) < tCash_PhongHam[nPhongHam][1] then
				Talk(1, "", "B�n kh�ng mang theo �� Xu v�t ph�m!")
				return
			end
		else
			if GetCash() < tCash_PhongHam[nPhongHam][2] * 10000 then
				Talk(1, "", "B�n kh�ng mang theo �� V�ng!")
				return
			end	
		end
	end
	if GetPKValue() >= 4 then	
		Talk(1,"",szNpcName.."T�i �c t�y tr�i kh�ng th� tham gia chi�n tr��ng!");
		return 0;
	end;	
	if nCamp == 1 then
		nCamp = tCash[nSelected][3]
	else
		nCamp = tCash[nSelected][4]	
	end
	local nPlayerCount = BT_GetPlayerCount(nCamp)
	if nPlayerCount >= MAX_CAMP then
		Talk(1,"main",szNpcName.."Phe n�y �� c� <color=yellow>"..nPlayerCount.."<color> ng��i, khi kh�c h�y quay l�i!");
		return 0;
	end
	
	if nSelected <= 1 then
		Pay(tCash[nSelected][1])
		WriteLogEx("TL TNChien","Tham gia phe ta")
		WriteLogEx("TAI NGUYEN CHIEN NEW LOG","Tham gia phe ta")
	elseif nSelected == 2 then
		DelItem(2, 1, 30230, tCash_PhongHam[nPhongHam][1])
		WriteLogEx("LOG XU VAT PHAM","Tham gia phe ��ch lo�i "..tCash_PhongHam[nPhongHam][1].."  Xu")
	elseif nSelected == 3 then
		Pay(tCash_PhongHam[nPhongHam][2]*10000)
		WriteLogEx("LOG XU VAT PHAM","Tham gia phe ��ch lo�i "..tCash_PhongHam[nPhongHam][2].."  V�ng")
	end

	mf_JoinMission(MISSION_ID,nCamp,MAP_ID);	

end

function MS_JoinMission(nCamp)
	CleanInteractive();	
	local nRanPos = random(1, getn(ENTRANCE_POINT[nCamp]))
	if NewWorld(MAP_ID,ENTRANCE_POINT[nCamp][nRanPos][1],ENTRANCE_POINT[nCamp][nRanPos][2]) == 1 then
		if nCamp == SONG_ID then
			Msg2MSAll(MISSION_ID,GetName().." �� gia nh�p phe T�ng");
			WriteLogEx("TL TNChien","Phe T�ng")
		else
			Msg2MSAll(MISSION_ID,GetName().." �� gia nh�p phe Li�u");
			WriteLogEx("TL TNChien","Phe Li�u")
		end;
		BT_SetPlayerState(nCamp);
		AddMSPlayer(MISSION_ID,nCamp);		
		return 1;
	else
		return 0;
	end;
end

function MS_LeaveMission()
	local nCamp = BT_GetCurCamp();	
	BT_RestorePlayerState();	
	if NewWorld(EXIT_POINT[nCamp][1],EXIT_POINT[nCamp][2],EXIT_POINT[nCamp][3]) == 1 then
		local nBattleState = mf_GetMissionV(MISSION_ID,MV_STATE,MAP_ID);
		if nBattleState == MS_STATE_FIGHT or nBattleState == MS_STATE_RESULT then
			if nCamp == SONG_ID then
				Msg2MSAll(MISSION_ID,"T�ng "..GetName().." �� r�i kh�i chi�n tr��ng");
			else	
				Msg2MSAll(MISSION_ID,"Li�u "..GetName().." �� r�i kh�i chi�n tr��ng");
			end;
		end;
		return 1;
	else
		return 0;
	end;
end;

function BT_GetPlayerCount(nCamp)
	return mf_GetPlayerCount(MISSION_ID,nCamp,MAP_ID);
end

function BT_GetCurCamp()
	if GetTask(701) >= 0 then
		return SONG_ID;
	else
		return LIAO_ID;
	end;
end;

function BT_SetPlayerState(nCamp)	
	LeaveTeam();	
	SetLogoutRV(1);	
	SetDeathPunish(0);	
	ForbitTrade(1);	
	InteractiveEnable(0);	
	StallEnable(0);	
	UseScrollEnable(0);	
	SetMomentum(0);
	SetMomentumBoundSwitch(1);
	SetPKFlag(1,nCamp);
	ForbidRead(1);
	ForbidChangePK(1);	
	SetFightState(1);
	KillFollower();	
	SetCampToPlayer(tCampNameP[nCamp]);	
	SetTempRevPos(EXIT_POINT[nCamp][1],EXIT_POINT[nCamp][2]*32,EXIT_POINT[nCamp][3]*32);	
	SetDeathScript(DEATH_SCRIPT);
	BT_ResetTask();
end;

function BT_RestorePlayerState()
	LeaveTeam();
	SetLogoutRV(0);	
	SetDeathPunish(1);			
	ForbitTrade(0);
	ForbidRead(0);
	InteractiveEnable(1);	
	StallEnable(1);	
	UseScrollEnable(1);
	ForbidChangePK(0);
	SetMomentumBoundSwitch(0);
	SetPKFlag(0,0);
	SetFightState(0);
	SetDeathScript("");
	SetTempRevPos(0,0,0);
	SetCampToPlayer("");
	KillFollower();	
	BT_DeleteAllBattleItem();
	SetTask(TSK_GET_THUOC,GetTask(TSK_GET_THUOC)-1)
end

function BT_DeleteAllBattleItem()
	local nItemCount = 0;
	for i=1,getn(tBattleItem) do
		if tBattleItem[i][5] == 1 then
			nItemCount = BigGetItemCount(tBattleItem[i][2],tBattleItem[i][3],tBattleItem[i][4]);
			if nItemCount > 0 then
				BigDelItem(tBattleItem[i][2],tBattleItem[i][3],tBattleItem[i][4],nItemCount)	
			end;
		end;
	end;
	for i=1,getn(tBattleMed) do	
		nItemCount = BigGetItemCount(tBattleMed[i][2],tBattleMed[i][3],tBattleMed[i][4]);
		if nItemCount > 0 then
			BigDelItem(tBattleMed[i][2],tBattleMed[i][3],tBattleMed[i][4],nItemCount)	
		end;
	end;
end;

function BT_ResetTask()
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(TSK_NEWRES_DATE) ~= nDate then		
		gf_SetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE,0)
		gf_SetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DOUBLE_EXP,0)
		SetTask(TSK_NEWRES_DATE,nDate)
	end	
end

function BT_ShowTime(nTime)	
	local nHour = 0
	local nMin = 0
	local nSec = 0
	if nTime > 0 then
		nHour = floor(nTime/3600)
		nMin = floor((nTime - nHour*3600)/60)
		nSec = nTime - nHour*3600 - nMin*60
	end
	return nHour, nMin, nSec
end
