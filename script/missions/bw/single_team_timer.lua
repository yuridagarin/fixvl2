Include("\\script\\missions\\bw\\bwhead.lua");

function OnTimer()

local nTimeState = 0;

	nMapState = GetMissionV(TEAM_GAME_STATE);
	nTimeState = GetMissionV(TEAM_NEWS_STATE) + 1;
	SetMissionV(TEAM_NEWS_STATE,nTimeState);

	--准备阶段
	if nMapState == 1 then
		ReportReadyState(nTimeState);
	--比赛中
	elseif nMapState >= 2 then 
		ReportBattleState(nTimeState);
	--比赛结束
	--elseif nMapState == 3 then 
		--Msg2MSAll(SINGLE_TEAM_MISSION_ID,"比赛结束!");
		--StopMissionTimer(SINGLE_TEAM_MISSION_ID,SINGLE_TEAM_TIME_ID);
	end
end

--准备阶段信息处理
function ReportReadyState(nTimeState)

local i = 0;
local j = 0;
local nMin = 0; 
local nSec = 0;
local nPlayerMSIndex = 0;
local news_str = "";

	if GetMissionV(READY_STATE) == 1 or GetMissionV(CAPTAIN_STATE) == 1 then
		--SetMissionV(READY_STATE,0);
		--SetNpcLifeTime(GetMissionV(NPC_INDEX),0)--删去退出Npc
		CloseMission(SINGLE_TEAM_MISSION_ID);
		return
	end

	--在报名期间，系统定期通知玩家当前的报名情况
	--准备时间到达3分钟以后判断场内当前情况
	if nTimeState >= TEAM_READY_TIME then  
		--比赛开始时比赛队伍数少等于1队
		if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) <= 0 or GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) <= 0 then				
			if GetMissionV(READY_STATE) == 0 then
				OldPlayer = PlayerIndex;
				if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) <= 0 then
					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,2);
				else
					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,1);
				end
				
				if PlayerIndex > 0 then
					for i=1,gf_GetTeamSize() do
						PlayerIndex = gf_GetTeamMember(i);
						if PlayerIndex > 0 then
							Talk(1,"","Do s? i trong L玦 i 輙 h琻 <color=yellow>2 i<color>, thi u b? h駓 b?. Xin i gi﹜ l竧! u s? s? 頲 chuy觧 ra!");
						end
					end
				end
				PlayerIndex = OldPlayer;
				
				news_str = "Do s? i trong tr薾 a kh玭g , thi u b? h駓 b?!";
				Msg2MSAll(SINGLE_TEAM_MISSION_ID,news_str);
				--SetMissionV(TEAM_GAME_STATE,3);
				SetMissionV(READY_STATE,1);
				return
			end
		end

		news_str = "Thi u ch輓h th鴆 b総 u!";
		Msg2MSAll(SINGLE_TEAM_MISSION_ID,news_str);             
		RunMission(SINGLE_TEAM_MISSION_ID);
		return
		
	end
	
	--比赛尚未开始前的信息处理
	
	nMin = floor((TEAM_READY_TIME - nTimeState) / 3);
	nSec = mod((TEAM_READY_TIME - nTimeState),3) * 20;
	
	if nMin > 0 and nSec == 0 then
		news_str = "C竎h gi? khai chi課 l玦 i c遪:"..nMin.." ph髏.";
		Msg2MSAll(SINGLE_TEAM_MISSION_ID,news_str);
	elseif nMin == 0 then
		news_str = "C竎h gi? khai chi課 l玦 i c遪:" ..nSec.. " gi﹜.";
		Msg2MSAll(SINGLE_TEAM_MISSION_ID,news_str);
	end
	
end


--开战阶段战况报告
function ReportBattleState(nTimeState)

local i=0;
local j=0;
local nMin = 0; 
local nSec = 0;
local nPlayerMSIndex = 0;
local news_str = "";
local TeamMemberTab = {};

	--延时退出
	if GetMissionV(DELAY_STATE) == 1 then
		SetMissionV(DELAY_STATE,0);
		CloseMission(SINGLE_TEAM_MISSION_ID);
		return
	end

	--两支队伍都挂了
	if GetTeamState(1) == 0 and GetTeamState(2) == 0 then
		if GetMissionV(DELAY_STATE) == 0 then
			OldPlayer = PlayerIndex;
			for i=1,2 do
				nPlayerMSIndex = 0;
				for j=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,i) do
					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,i);
					if PlayerIndex > 0 then
						tinsert(TeamMemberTab,PlayerIndex);
					end
				end
				for j=1,getn(TeamMemberTab) do
					PlayerIndex = TeamMemberTab[j];
					Talk(1,"","Thi u k誸 th骳, hai b猲 h遖 nhau!");
					DelMSPlayer(SINGLE_TEAM_MISSION_ID,0);
				end
			end
			PlayerIndex = OldPlayer;
			news_str = "Thi u k誸 th骳, hai b猲 h遖 nhau! Xin i gi﹜ l竧, c竎 u th? s? 頲 chuy觧 ra!";
			Msg2MSAll(SINGLE_TEAM_MISSION_ID,news_str);
			SetMissionV(TEAM_GAME_STATE,3);			
			SetMissionV(DELAY_STATE,1);
			return
		end
	end
	
	--当前场地只剩下一个队伍
	if GetTeamState(1) == 0 or GetTeamState(2) == 0 then
		if GetMissionV(DELAY_STATE) == 0 then
			OldPlayer = PlayerIndex;			
			if GetTeamState(1) == 0 then
--				for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) do
					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,1);
					if PlayerIndex > 0 then
						PlayerIndex = gf_GetTeamMember(0);
						if PlayerIndex > 0 then
--						tinsert(TeamMemberTab,PlayerIndex);
--					end
--				end
--				for i=1,getn(TeamMemberTab) do
--					PlayerIndex = TeamMemberTab[i];
							DelMSPlayer(SINGLE_TEAM_MISSION_ID,0);
						end
					end
				nPlayerMSIndex = 0;
				for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) do
					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,2);
					if PlayerIndex > 0 then
						Talk(1,"","Thi u k誸 th骳, tr薾 n祔 i ng? chi課 th緉g do <color=yellow>"..gf_GetCaptainName().."<color> d蒼 d総. Xin i gi﹜ l竧, c竎 u th? s? 頲 chuy觧 ra!");
					end
				end
				SetMissionV(MS_WIN_CAMP,2);
				news_str = "Thi u k誸 th骳, ngi chi課 th緉g thu閏 i ng? "..gf_GetCaptainName().." d蒼 d総!";
				Msg2MSAll(SINGLE_TEAM_MISSION_ID,news_str);
			else
				for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) do
					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,2);
					if PlayerIndex > 0 then
						--tinsert(TeamMemberTab,PlayerIndex);
						PlayerIndex = gf_GetTeamMember(0);
						if PlayerIndex > 0 then
							DelMSPlayer(SINGLE_TEAM_MISSION_ID,0);
						end
					end
				end
--				for i=1,getn(TeamMemberTab) do
--					PlayerIndex = TeamMemberTab[i];
--					DelMSPlayer(SINGLE_TEAM_MISSION_ID,0);
--				end
				nPlayerMSIndex = 0;
				for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) do
					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,1);
					if PlayerIndex > 0 then
						Talk(1,"","Thi u k誸 th骳, tr薾 n祔 i ng? chi課 th緉g do <color=yellow>"..gf_GetCaptainName().."<color> d蒼 d総. Xin i gi﹜ l竧, c竎 u th? s? 頲 chuy觧 ra!");
					end
				end
				SetMissionV(MS_WIN_CAMP,1);
				news_str = "Thi u k誸 th骳, ngi chi課 th緉g thu閏 i ng? "..gf_GetCaptainName().." d蒼 d総!";
				Msg2MSAll(SINGLE_TEAM_MISSION_ID,news_str);
			end		
			PlayerIndex = OldPlayer;
			SetMissionV(TEAM_GAME_STATE,3);
			SetMissionV(DELAY_STATE,1);
			return
		end
	end
	
	--战斗结束
 	if nTimeState == TEAM_GAME_TIME then
 	
		OldPlayer = PlayerIndex; 	

 		--清除战斗双方身上的状态并禁止其继续战斗
 		for i=1,2 do
 			nPlayerMSIndex = 0;
 			for j=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,i) do
 				nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,i);
 				if PlayerIndex > 0 then
 					RemvoeTempEffect();
 					SetFightState(0);
 				end
 			end
 		end
 		
 		--向场内所有角色发送比赛结果
		nPlayerMSIndex = 0;
 		
 		for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,0) do
 			nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,0);
 			if PlayerIndex > 0 then
 				Talk(1,"","Thi u k誸 th骳, hai b猲 tham chi課 u h遖. Xin i gi﹜ l竧, c竎 u th? s? 頲 chuy觧 ra!");
 			end
 		end
 		
 		PlayerIndex = OldPlayer;
 		
		news_str = "Thi u k誸 th骳, hai phe h遖 nhau!"
		Msg2MSAll(SINGLE_TEAM_MISSION_ID, news_str);
		SetMissionV(TEAM_GAME_STATE,3);
 		SetMissionV(DELAY_STATE,1);
 		return
 	end
 	
	nMin = floor((TEAM_GAME_TIME - nTimeState) / 3);
	nSec = mod((TEAM_GAME_TIME - nTimeState),3) * 20;
	
	if nMin == 0 then
		Msg2MSAll(SINGLE_TEAM_MISSION_ID, "Giai 畂筺 thi u: Thi u 產ng ti課 h祅h, th阨 gian thi u c遪"..nSec.." gi﹜.");
	elseif nSec == 0 then
		Msg2MSAll(SINGLE_TEAM_MISSION_ID, "Giai 畂筺 thi u: Thi u 產ng ti課 h祅h, th阨 gian thi u c遪"..nMin.." ph髏.");
	end
	
end