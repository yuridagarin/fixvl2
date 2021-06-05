Include("\\script\\missions\\bw\\bwhead.lua");

ContinueTime = 0;--�ӳ��˳�

function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE) + 1;
	SetMissionV(MS_NEWSVALUE, V);


	--�����׶�
	if (timestate == 1) then 
		ReportMemberState(V);
	elseif (timestate == 2) then --��ս��
		ReportBattle(V);
	elseif (timestate == 3) then  --ս��������
		Msg2MSAll(MISSIONID, "Chi�n ��u k�t th�c!");
		StopMissionTimer(MISSIONID, TIME_NO1);
		StopMissionTimer(MISSIONID, TIME_NO2);
	end;
end;

function ReportMemberState(V)
	--�ڱ����ڼ䣬ϵͳ����֪ͨ��ҵ�ǰ�ı������
	if (V == GO_TIME) then
	
		if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) and (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then 
			str1 = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." c�ng v�i  "..GetMissionS(2).."Th�i gian ��n ��u l�i ��i �� ��n, hai phe thi ��u "..GetMissionS(1).." c�ng v�i  "..GetMissionS(2).." Kh�ng ��ng gi� b� tru�t quy�n thi ��u!";
			Msg2MSAll(MISSIONID,str1)
        	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
        	    AddGlobalNews(str1);
        	end;
--			WinBonus(3);
			SetMissionV(MS_STATE,3);
			--Msg2Fighters(str1);
			CloseMission(MISSIONID);
			return
		end;

		if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) then 
			str1 = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." c�ng v�i  "..GetMissionS(2).."Th�i gian ��n ��u l�i ��i �� ��n,"..GetMissionS(1).."  kh�ng ��ng gi�, "..GetMissionS(2).." ���c gi�nh ph�n th�ng!"
			Msg2MSAll(MISSIONID, str1);
        	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
        	    AddGlobalNews(str1);
        	end;
		    local index1 = GetMissionV(MS_PLAYER1ID)
		    local index2 = GetMissionV(MS_PLAYER2ID)
		    -- Ӯ���о���
--		   	if index2 > 0 then
--		   		local nOld = PlayerIndex
--		   		PlayerIndex = index2
--		   		local nLevel = GetLevel()
--		   		ModifyExp(floor(nLevel * nLevel * 1.2))
--		   		Msg2Player("������"..floor(nLevel * nLevel * 1.2).."�㾭��")
--		   		PlayerIndex = nOld
--		   	end
--		    if (index1 > 0 and index2 > 0) then
--			    RecordBWCount_Win(index2, index1)
--		    end
--			WinBonus(2);
			--Msg2Fighters(str1);
			CloseMission(MISSIONID);
			return
		end;
	
		if (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then 
			str1 = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." c�ng v�i  "..GetMissionS(2).."Th�i gian ��n ��u l�i ��i �� ��n,"..GetMissionS(2).."  kh�ng ��ng gi�, "..GetMissionS(1).." ���c gi�nh ph�n th�ng!";
			Msg2MSAll(MISSIONID, str1);
        	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
        	    AddGlobalNews(str1);
        	end;
		    local index1 = GetMissionV(MS_PLAYER1ID)
		    local index2 = GetMissionV(MS_PLAYER2ID)
		     -- Ӯ���о���
--		   	if index1 > 0 then
--		   		local nOld = PlayerIndex
--		   		PlayerIndex = index1
--		   		local nLevel = GetLevel()
--		   		ModifyExp(floor(nLevel * nLevel * 1.2))
--		   		Msg2Player("������"..floor(nLevel * nLevel * 1.2).."�㾭��")
--		   		PlayerIndex = nOld
--		   	end
--		    if (index1 > 0 and index2 > 0) then
--			    RecordBWCount_Win(index1, index2);
--		    end
--			WinBonus(1);
            --Msg2Fighters(str1);
			CloseMission(MISSIONID);
			return
		end;
			
		str = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3].."T� v� tr��ng "..GetMissionS(1).."("..GetMissionS(3)..")".." c�ng v�i  "..GetMissionS(2).."("..GetMissionS(4)..")".."  ng�ng cho v�o ��u tr��ng ��n ��u l�i ��i, thi ��u ch�nh th�c b�t ��u!";
		Msg2MSAll(MISSIONID, str);
    	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
    	    AddGlobalNews(str);
    	end;
        --Msg2Fighters(str);
        Talk2Fighters(str);
        
        --����PK״̬
	    OldPlayer = PlayerIndex;
	    for i = 1, 2 do 
		    PlayerIndex = GetMissionV(MS_PLAYER1ID + i -1);
            SetFightState(1);
            if (i == 1) then
                ExercisePK(1,GetMissionV(MS_PLAYER1ID + i));
            end;
            if (i == 2) then
                ExercisePK(1,GetMissionV(MS_PLAYER1ID + i -2));
            end;
	    end;
	    PlayerIndex = OldPlayer;
        
		RunMission(MISSIONID);
		return
	end;
		RestMin = floor((GO_TIME - V) / 3);
		RestSec = mod((GO_TIME - V),3) * 20;

		--Msg2Fighters("ReportMemberState "..GetMSPlayerCount(MISSIONID, 0).." "..GetMSPlayerCount(MISSIONID, 1).." "..GetMSPlayerCount(MISSIONID, 2));
		
		if (RestMin > 0) and (RestSec == 0) then
--			str1 = GetMissionS(CITYID)..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." �� "..GetMissionS(2).."������̨���볡ʣ��ʱ�䣺"..RestMin.."���ӣ�������Χ��ҵĶ�ע��"..GetMissionV(BW_MONEY1)..":"..GetMissionV(BW_MONEY2);
			str1 = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).."("..GetMissionS(3)..")".." c�ng v�i  "..GetMissionS(2).."("..GetMissionS(4)..")".."Th�i gian v�o ��u tr��ng ��n ��u l�i ��i c�n:"..RestMin.." ph�t."
			Msg2MSAll(MISSIONID, str1);
        	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
        	    AddGlobalNews(str1);
        	end;
			--if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) or (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then
			    --Msg2Fighters(str1);
			--end;
			if ((GO_TIME - V) == 3) then 
--				str1 = GetMissionS(CITYID)..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." �� "..GetMissionS(2).."������̨���볡ʱ��ʣ�����1���ӣ���δ�볡�߾����볡��������Χ��ҵĶ�ע��" .. GetMissionV(BW_MONEY1) .. ":" .. GetMissionV(BW_MONEY2);
				str1 = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).."("..GetMissionS(3)..")".." c�ng v�i  "..GetMissionS(2).."("..GetMissionS(4)..")".."Th�i gian v�o ��u tr��ng ��n ��u l�i ��i ch� c�n 1 ph�t cu�i! C�c ��u s� h�y nhanh ch�n!"
            	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
            	    AddGlobalNews(str1);
            	end;
--			elseif ((GO_TIME - V) == 15) then 
--				str1 = GetMissionS(CITYID)..GetMissionS(1).." �� "..GetMissionS(2).."������̨���볡ʱ�仹ʣ��5���ӣ���δ�볡�߾����볡��������Χ��ҵĶ�ע��".. GetMissionV(BW_MONEY1) ..":".. GetMissionV(BW_MONEY2);
--				AddGlobalNews(str1)
			end
		elseif (RestMin == 0) then
--			str1 = GetMissionS(CITYID)..GetMissionS(1).." �� "..GetMissionS(2).."������̨���볡ʣ��ʱ�䣺" ..RestSec.. "�룬������Χ��ҵĶ�ע��"..GetMissionV(BW_MONEY1)..":"..GetMissionV(BW_MONEY2);
			str1 = GetMissionS(CITYID)..GetMissionS(1).."("..GetMissionS(3)..")".." c�ng v�i  "..GetMissionS(2).."("..GetMissionS(4)..")".."Th�i gian v�o ��u tr��ng ��n ��u l�i ��i c�n:" ..RestSec.. " gi�y."
			Msg2MSAll(MISSIONID, str1);
			--Msg2Fighters(str1);
		end;
end;

function ReportBattle(V)
--ս�����й����У�ϵͳ����֪ͨ�������������
	    Msg2Player("ContinueTime "..ContinueTime)
	if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) and (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then 
	    if (ContinueTime == 0) then
		    str1 = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." c�ng v�i  "..GetMissionS(2).."Hai phe tham gia ��n ��u c�ng r�i tr�n,"..GetMissionS(1).." c�ng v�i  "..GetMissionS(2).." ���c x� h�a!";
        	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
        	    AddGlobalNews(str1);
        	end;
		    Msg2MSAll(MISSIONID, str1);
		    --Talk2Fighters(str1);
    --		WinBonus(3);
		    ContinueTime = ContinueTime+1;
		    return
		elseif (ContinueTime == 1) then
		    SetMissionV(MS_STATE,3);
		    CloseMission(MISSIONID);
		    ContinueTime = 0;
		    return
		else
		    ContinueTime = ContinueTime+1;
		    return
		end
	end;

	if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) then 
	    if (ContinueTime == 0) then
		    --str1 = GetMissionS(CITYID)..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." �� "..GetMissionS(2).."������̨��ս��������"..GetMissionS(2).." �ڱ����л����� "..GetMissionS(1).."��ȡ�������յ�ʤ����"
		    --AddGlobalNews(str1);
	        --Msg2MSAll(MISSIONID, str1);
	        --Talk2Fighters(str1);
		    --RecordBWCount_Win(GetMissionV(MS_PLAYER1ID+1), GetMissionV(MS_PLAYER1ID))
    --		WinBonus(2);
		    ContinueTime = ContinueTime+1;
		    local index2 = GetMissionV(MS_PLAYER2ID)
		    -- Ӯ���о���
--		   	if index2 > 0 then
--		   		local nOld = PlayerIndex
--		   		PlayerIndex = index2
--		   		local nLevel = GetLevel()
--		   		ModifyExp(floor(nLevel * nLevel * 1.2))
--		   		Msg2Player("������"..floor(nLevel * nLevel * 1.2).."�㾭��")
--		   		PlayerIndex = nOld
--		   	end
		    
		    return
		elseif (ContinueTime == 1) then
		    SetMissionV(MS_STATE,3);
		    CloseMission(MISSIONID);
		    ContinueTime = 0;
		    return
		else
		    ContinueTime = ContinueTime+1;
		    return
		end
	end;
	
	if (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then 
	    if (ContinueTime == 0) then
		    --str1 = GetMissionS(CITYID)..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." �� "..GetMissionS(2).."������̨��ս��������"..GetMissionS(1).." �ڱ����л����� "..GetMissionS(2).."��ȡ�������յ�ʤ����"
		    --AddGlobalNews(str1);
	        --Msg2MSAll(MISSIONID, str1);
	        --Talk2Fighters(str1);
		    --RecordBWCount_Win(GetMissionV(MS_PLAYER1ID), GetMissionV(MS_PLAYER1ID+1))
    --		WinBonus(1);
		    ContinueTime = ContinueTime+1;
			local index1 = GetMissionV(MS_PLAYER1ID)
		    -- Ӯ���о���
--		   	if index1 > 0 then
--		   		local nOld = PlayerIndex
--		   		PlayerIndex = index1
--		   		local nLevel = GetLevel()
--		   		ModifyExp(floor(nLevel * nLevel * 1.2))
--		   		Msg2Player("������"..floor(nLevel * nLevel * 1.2).."�㾭��")
--		   		PlayerIndex = nOld
--		   	end
		    return
		elseif (ContinueTime == 1) then
		    SetMissionV(MS_STATE,3);
		    CloseMission(MISSIONID);
		    ContinueTime = 0;
		    return
		else
		    ContinueTime = ContinueTime+1;
		    return
		end
	end;
		
	gametime = (floor(GetMSRestTime(MISSIONID,TIME_NO2)/18));
	RestMin = floor(gametime / 60);
	RestSec = mod(gametime,60);
	if (RestMin == 0) then
		Msg2MSAll(MISSIONID, "Giai �o�n chi�n ��u: Hai phe hi�n �ang thi ��u. Th�i gian c�n l�i l�:"..RestSec.." gi�y.");
	elseif (RestSec == 0) then
		Msg2MSAll(MISSIONID, "Giai �o�n chi�n ��u: Hai phe hi�n �ang thi ��u. Th�i gian c�n l�i l�:"..RestMin.." ph�t.");
	else
		Msg2MSAll(MISSIONID, "Giai �o�n chi�n ��u: Hai phe hi�n �ang thi ��u. Th�i gian c�n l�i l�:"..RestMin.." Ph�t "..RestSec.." gi�y.");
	end;
end;
