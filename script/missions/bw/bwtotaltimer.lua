Include("\\script\\missions\\bw\\bwhead.lua");

function OnTimer()

    State = GetMissionV(MS_STATE) ;
    if (State == 0) then
	    return
    end;

    Msg2MSAll(MISSIONID, "Th�i gian ��n ��u l�i ��i �� ��n,"..GetMissionS(1).." c�ng v�i  "..GetMissionS(2).." hai phe ��u h�a!");
    str = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3].."Th�i gian ��n ��u l�i ��i �� ��n,"..GetMissionS(1).." c�ng v�i  "..GetMissionS(2).." hai phe ��u h�a!";
    --51�����
		if Is51PartyTime() == 1 and Is2PlayerLevelOK() == 1 then
			Award2Player();
		end
    --ʦͽ����
    process_master_task()
	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
	    AddGlobalNews(str);
	end;
    --WinBonus(3);
    SetMissionV(MS_STATE,3);
    CloseMission(MISSIONID);
end;
