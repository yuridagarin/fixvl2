Include("\\script\\missions\\bw\\bwhead.lua");

ContinueTime = 0;--延迟退出

function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE) + 1;
	SetMissionV(MS_NEWSVALUE, V);


	--报名阶段
	if (timestate == 1) then 
		ReportMemberState(V);
	elseif (timestate == 2) then --开战了
		ReportBattle(V);
	elseif (timestate == 3) then  --战斗结束了
		Msg2MSAll(MISSIONID, "Chi課 u k誸 th骳!");
		StopMissionTimer(MISSIONID, TIME_NO1);
		StopMissionTimer(MISSIONID, TIME_NO2);
	end;
end;

function ReportMemberState(V)
	--在报名期间，系统定期通知玩家当前的报名情况
	if (V == GO_TIME) then
	
		if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) and (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then 
			str1 = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." c飊g v韎  "..GetMissionS(2).."Th阨 gian n u l玦 i  n, hai phe thi u "..GetMissionS(1).." c飊g v韎  "..GetMissionS(2).." Kh玭g ng gi? b? tru蕋 quy襫 thi u!";
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
			str1 = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." c飊g v韎  "..GetMissionS(2).."Th阨 gian n u l玦 i  n,"..GetMissionS(1).."  kh玭g ng gi?, "..GetMissionS(2).." 頲 gi祅h ph莕 th緉g!"
			Msg2MSAll(MISSIONID, str1);
        	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
        	    AddGlobalNews(str1);
        	end;
		    local index1 = GetMissionV(MS_PLAYER1ID)
		    local index2 = GetMissionV(MS_PLAYER2ID)
		    -- 赢方有经验
--		   	if index2 > 0 then
--		   		local nOld = PlayerIndex
--		   		PlayerIndex = index2
--		   		local nLevel = GetLevel()
--		   		ModifyExp(floor(nLevel * nLevel * 1.2))
--		   		Msg2Player("你获得了"..floor(nLevel * nLevel * 1.2).."点经验")
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
			str1 = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." c飊g v韎  "..GetMissionS(2).."Th阨 gian n u l玦 i  n,"..GetMissionS(2).."  kh玭g ng gi?, "..GetMissionS(1).." 頲 gi祅h ph莕 th緉g!";
			Msg2MSAll(MISSIONID, str1);
        	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
        	    AddGlobalNews(str1);
        	end;
		    local index1 = GetMissionV(MS_PLAYER1ID)
		    local index2 = GetMissionV(MS_PLAYER2ID)
		     -- 赢方有经验
--		   	if index1 > 0 then
--		   		local nOld = PlayerIndex
--		   		PlayerIndex = index1
--		   		local nLevel = GetLevel()
--		   		ModifyExp(floor(nLevel * nLevel * 1.2))
--		   		Msg2Player("你获得了"..floor(nLevel * nLevel * 1.2).."点经验")
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
			
		str = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3].."T? v? trng "..GetMissionS(1).."("..GetMissionS(3)..")".." c飊g v韎  "..GetMissionS(2).."("..GetMissionS(4)..")".."  ng璶g cho v祇 u trng n u l玦 i, thi u ch輓h th鴆 b総 u!";
		Msg2MSAll(MISSIONID, str);
    	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
    	    AddGlobalNews(str);
    	end;
        --Msg2Fighters(str);
        Talk2Fighters(str);
        
        --设置PK状态
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
--			str1 = GetMissionS(CITYID)..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." 与 "..GetMissionS(2).."单挑擂台赛入场剩余时间："..RestMin.."分钟，现在外围玩家的赌注是"..GetMissionV(BW_MONEY1)..":"..GetMissionV(BW_MONEY2);
			str1 = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).."("..GetMissionS(3)..")".." c飊g v韎  "..GetMissionS(2).."("..GetMissionS(4)..")".."Th阨 gian v祇 u trng n u l玦 i c遪:"..RestMin.." ph髏."
			Msg2MSAll(MISSIONID, str1);
        	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
        	    AddGlobalNews(str1);
        	end;
			--if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) or (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then
			    --Msg2Fighters(str1);
			--end;
			if ((GO_TIME - V) == 3) then 
--				str1 = GetMissionS(CITYID)..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." 与 "..GetMissionS(2).."单挑擂台赛入场时间剩下最后1分钟，请未入场者尽快入场，现在外围玩家的赌注是" .. GetMissionV(BW_MONEY1) .. ":" .. GetMissionV(BW_MONEY2);
				str1 = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).."("..GetMissionS(3)..")".." c飊g v韎  "..GetMissionS(2).."("..GetMissionS(4)..")".."Th阨 gian v祇 u trng n u l玦 i ch? c遪 1 ph髏 cu鑙! C竎 u s? h穣 nhanh ch﹏!"
            	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
            	    AddGlobalNews(str1);
            	end;
--			elseif ((GO_TIME - V) == 15) then 
--				str1 = GetMissionS(CITYID)..GetMissionS(1).." 与 "..GetMissionS(2).."单挑擂台赛入场时间还剩下5分钟，请未入场者尽快入场，现在外围玩家的赌注是".. GetMissionV(BW_MONEY1) ..":".. GetMissionV(BW_MONEY2);
--				AddGlobalNews(str1)
			end
		elseif (RestMin == 0) then
--			str1 = GetMissionS(CITYID)..GetMissionS(1).." 与 "..GetMissionS(2).."单挑擂台赛入场剩余时间：" ..RestSec.. "秒，现在外围玩家的赌注是"..GetMissionV(BW_MONEY1)..":"..GetMissionV(BW_MONEY2);
			str1 = GetMissionS(CITYID)..GetMissionS(1).."("..GetMissionS(3)..")".." c飊g v韎  "..GetMissionS(2).."("..GetMissionS(4)..")".."Th阨 gian v祇 u trng n u l玦 i c遪:" ..RestSec.. " gi﹜."
			Msg2MSAll(MISSIONID, str1);
			--Msg2Fighters(str1);
		end;
end;

function ReportBattle(V)
--战斗进行过程中，系统定期通知各方的阵亡情况
	    Msg2Player("ContinueTime "..ContinueTime)
	if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) and (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then 
	    if (ContinueTime == 0) then
		    str1 = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." c飊g v韎  "..GetMissionS(2).."Hai phe tham gia n u c飊g r阨 tr薾,"..GetMissionS(1).." c飊g v韎  "..GetMissionS(2).." Л頲 x? h遖!";
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
		    --str1 = GetMissionS(CITYID)..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." 与 "..GetMissionS(2).."单挑擂台赛战斗结束，"..GetMissionS(2).." 在比赛中击败了 "..GetMissionS(1).."，取得了最终的胜利！"
		    --AddGlobalNews(str1);
	        --Msg2MSAll(MISSIONID, str1);
	        --Talk2Fighters(str1);
		    --RecordBWCount_Win(GetMissionV(MS_PLAYER1ID+1), GetMissionV(MS_PLAYER1ID))
    --		WinBonus(2);
		    ContinueTime = ContinueTime+1;
		    local index2 = GetMissionV(MS_PLAYER2ID)
		    -- 赢方有经验
--		   	if index2 > 0 then
--		   		local nOld = PlayerIndex
--		   		PlayerIndex = index2
--		   		local nLevel = GetLevel()
--		   		ModifyExp(floor(nLevel * nLevel * 1.2))
--		   		Msg2Player("你获得了"..floor(nLevel * nLevel * 1.2).."点经验")
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
		    --str1 = GetMissionS(CITYID)..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." 与 "..GetMissionS(2).."单挑擂台赛战斗结束，"..GetMissionS(1).." 在比赛中击败了 "..GetMissionS(2).."，取得了最终的胜利！"
		    --AddGlobalNews(str1);
	        --Msg2MSAll(MISSIONID, str1);
	        --Talk2Fighters(str1);
		    --RecordBWCount_Win(GetMissionV(MS_PLAYER1ID), GetMissionV(MS_PLAYER1ID+1))
    --		WinBonus(1);
		    ContinueTime = ContinueTime+1;
			local index1 = GetMissionV(MS_PLAYER1ID)
		    -- 赢方有经验
--		   	if index1 > 0 then
--		   		local nOld = PlayerIndex
--		   		PlayerIndex = index1
--		   		local nLevel = GetLevel()
--		   		ModifyExp(floor(nLevel * nLevel * 1.2))
--		   		Msg2Player("你获得了"..floor(nLevel * nLevel * 1.2).."点经验")
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
		Msg2MSAll(MISSIONID, "Giai 畂筺 chi課 u: Hai phe hi謓 產ng thi u. Th阨 gian c遪 l筰 l?:"..RestSec.." gi﹜.");
	elseif (RestSec == 0) then
		Msg2MSAll(MISSIONID, "Giai 畂筺 chi課 u: Hai phe hi謓 產ng thi u. Th阨 gian c遪 l筰 l?:"..RestMin.." ph髏.");
	else
		Msg2MSAll(MISSIONID, "Giai 畂筺 chi課 u: Hai phe hi謓 產ng thi u. Th阨 gian c遪 l筰 l?:"..RestMin.." Ph髏 "..RestSec.." gi﹜.");
	end;
end;
