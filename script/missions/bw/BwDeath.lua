Include("\\script\\missions\\bw\\bwhead.lua");
--Include("\\script\\task\\newtask\\branch\\branch_bwsj.lua")
function OnDeath(Launcher)
	--curcamp = GetCurCamp();
	curcamp = 0;
	if (GetName() == GetMissionS(1)) then
	    curcamp = 1;
	elseif (GetName() == GetMissionS(2)) then
	    curcamp = 2;
	end;
	--����51����
	if Is51PartyTime() == 1 and Is2PlayerLevelOK() == 1 then
		Award2Player();
	end
	--ʦͽ����
	process_master_task()
	
	DelMSPlayer(MISSIONID,	curcamp);
	--SetLogoutRV(1);

	PlayerIndex1 = NpcIdx2PIdx(Launcher); -- murder����
	OrgPlayer  = PlayerIndex; --����
	DeathName = GetName();

	if (PlayerIndex1 > 0) then
		PlayerIndex = PlayerIndex1;
		LaunName = GetName();

		str = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." c�ng v�i  "..GetMissionS(2).."Chi�n ��u ��n ��u l�i ��i k�t th�c, "..LaunName.." Trong thi ��u �� ��nh b�i "..DeathName..", gi�nh th�ng l�i chung cu�c!"
		Msg2MSAll(MISSIONID, str);
    	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
    	    AddGlobalNews(str);
    	end;
		Talk2Fighters(str)

		if GetMissionS(1) == LaunName then
		    local index1 = GetMissionV(MS_PLAYER1ID)
		    local index2 = GetMissionV(MS_PLAYER2ID)
		    if (index1 > 0 and index2 > 0) then
			    RecordBWCount_Win(index1, index2)
		    end
--			WinBonus(1) --�ú������ⲿ��ӣ����ڽ������
		else
		    local index1 = GetMissionV(MS_PLAYER1ID)
		    local index2 = GetMissionV(MS_PLAYER2ID)
		    if (index1 > 0 and index2 > 0) then
			    RecordBWCount_Win(index2, index1)
		    end
--			WinBonus(2)
		end;
		--branchTask_GainBW1()
		PlayerIndex = OrgPlayer;
	end;
	
	RestorePKCamp();
	
	--NewWorld(GetLeavePos());

	--CloseMission(MISSIONID);
	
	if (GetName() == GetMissionS(1)) then
		SetMissionV(MS_PLAYER1ID, 0);
	end;
	if (GetName() == GetMissionS(2)) then
		SetMissionV(MS_PLAYER2ID, 0);
	end;
	
	return 1
	
end;

