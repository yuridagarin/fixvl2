Include("\\script\\missions\\bw\\bwhead.lua");

nDelayState = 0;

function OnTimer()

local nTimeState = 0;

	nMapState = GetMissionV(TEAM_GAME_STATE);
	nTimeState = GetMissionV(TEAM_NEWS_STATE) + 1;
	SetMissionV(TEAM_NEWS_STATE,nTimeState);

	--准备阶段
	if nMapState == 1 then 
		ReportReadyState(nTimeState);
	--比赛中
	elseif nMapState == 2 then 
		ReportBattleState(nTimeState);
	--比赛结束
	elseif nMapState == 3 then  
		Msg2MSAll(TEAM_MISSION_ID,"Thi u k誸 th骳!");
		--StopMissionTimer(TEAM_MISSION_ID,TEAM_TIME_ID2);		
	end
end

--准备阶段信息处理
function ReportReadyState(nTimeState)

local news_str = "";
local nMin = 0; 
local nSec = 0;
local nReportTime = 0;
local nTeamNum = GetGameTeamNum();
local i = 0;

	--在报名期间，系统定期通知玩家当前的报名情况
	--准备时间到达15分钟以后判断场内当前情况
	if nTimeState >= TEAM_READY_TIME_AWARD then 
	
		--比赛开始时比赛人数少等于1人
		if nTeamNum <= 1 then			
			OldPlayer = PlayerIndex
			PlayerIndex = GetMissionV(CAPTAIN_ID);
			if PlayerIndex > 0 then
				if GetMissionV(GAME_TYPE) == 4 then
					--返还入场费给队长
					Earn(TEAM_GAME_MONEY);
					for i=1,gf_GetTeamSize() do
						if gf_GetTeamMember(i) > 0 then					
							PlayerIndex = gf_GetTeamMember(i)
							Say("Do s? i trong L玦 i 輙 h琻 <color=yellow>2<color>, thi u b? h駓 b?, ph? b竜 danh s? 頲 tr? l筰 cho i trng. Xin i gi﹜ l竧! u s? s? 頲 chuy觧 ra!",0);
						end
					end
				end
			end
			PlayerIndex = OldPlayer
			
			news_str = "Do s? i trong tr薾 a kh玭g , thi u b? h駓 b?! Xin i gi﹜ l竧, c竎 u th? s? 頲 chuy觧 ra!";
			Msg2MSAll(TEAM_MISSION_ID,news_str);	
			--由于涉及入场费因此不作延时处理，怕玩家在延时阶段进来而使收取入场费不能退还				
			SetNpcLifeTime(GetMissionV(NPC_INDEX),0)--删去退出Npc			 
			SetMissionV(TEAM_GAME_STATE,3);
			CloseMission(TEAM_MISSION_ID);
			return
		end
		
		--比赛开始处理
		
		OldPlayer = PlayerIndex 
			
		for i=1,nTeamNum do	
			nCaptainIndex = GetMissionV(CAPTAIN_ID+i-1);
			if nCaptainIndex > 0 then
				PlayerIndex = nCaptainIndex;
				for j=1,gf_GetTeamSize() do
					if gf_GetTeamMember(j) > 0 then
						PlayerIndex = gf_GetTeamMember(j);
						Talk(1,"","Thi u ch輓h th鴆 b総 u, s? i trong tr薾 hi謓 l? <color=yellow>"..nTeamNum.."<color> i!")
					end
				end
			end
		end
		
		PlayerIndex = OldPlayer
		
		news_str = "Thi u ch輓h th鴆 b総 u!";
		Msg2MSAll(TEAM_MISSION_ID,news_str);             
		RunMission(TEAM_MISSION_ID);
		return
	end
	
	--其他信息处理
	
	nMin = floor((TEAM_READY_TIME_AWARD - nTimeState) / 3);
	nReportTime = mod(floor((TEAM_READY_TIME_AWARD - nTimeState) / 3),3);
	nSec = mod((TEAM_READY_TIME_AWARD - nTimeState),3) * 20;
	
	--每个三分钟一个信息
	if nReportTime == 0 and nSec == 0 and nMin > 0 then
		news_str = "C竎h gi? khai chi課 l玦 i c遪:"..nMin.." ph髏, s? i trong tr薾 hi謓 l? "..nTeamNum.."! ";
		Msg2MSAll(TEAM_MISSION_ID, news_str);
		Msg2SubWorld("Чi Ch? Cng thay m苩 ch? nh﹏ t? ch鴆 чi chi課 t筰 l玦 i Th祅h Й! Hoan ngh猲h c竎 anh h飊g h秓 h竛 n b竜 danh! C竎h gi? khai chi課 c遪 "..nMin.." ph髏, i ng? tham chi課 hi謓 t筰 l? "..nTeamNum..". ");
	elseif (nMin == 0) then
		news_str = "C竎h gi? khai chi課 l玦 i c遪:" ..nSec.. " gi﹜, s? i trong tr薾 hi謓 l?"..nTeamNum.."! ";
		Msg2MSAll(TEAM_MISSION_ID,news_str);
	end
	
end


--开战阶段战况报告
function ReportBattleState(nTimeState)

local news_str = "";
local i=0;
local j=0;
local k=0;
local nMin = 0; 
local nSec = 0;
local nWinCaptianName = "";
local nKillNum = 0;
local nDeadNum = 0;
local nPlayerMSIndex = 0;
local nDate = 0;
local nCaptainState = 0;
local nTeamNum = 0;
local nTeamNumLife = 0;
local WinnerTab = {};
local Winner_info = {};
local Winner_News = {};
local nCaptainName = "";
local nBonus = 0;
local Bonus_str = "";
local nPlayerName = "";
local TeamMember = {};

	--若队伍被全灭则传送出赛场
	OldPlayer = PlayerIndex;
	for i=1,10 do
		nDeadNum = 0;
		PlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
		if PlayerIndex > 0 then
			for j=1,gf_GetTeamSize() do
				PlayerIndex = gf_GetTeamMember(j);
				if PlayerIndex > 0 then
					if IsPlayerDeath() ~= 0 then
						nDeadNum = nDeadNum + 1;
					end
				end 
			end
			if nDeadNum == gf_GetTeamSize() then
--				for j=1,gf_GetTeamSize() do
--					PlayerIndex = gf_GetTeamMember(j);
--					if PlayerIndex > 0 then
--						if GetMissionV(GAME_TYPE) == 3 then
--							PayAward(3);
--						end
--						tinsert(TeamMember,PlayerIndex);
--					end
--				end
--				for j=1,getn(TeamMember) do
--					PlayerIndex = TeamMember[j];
					PlayerIndex = gf_GetTeamMember(0);
					--Msg2Player("由于你所在的队伍全灭，现把你们队伍传出赛场。");
					DelMSPlayer(TEAM_MISSION_ID,0);
				--end
			end
		end	
	end
	PlayerIndex = OldPlayer
	
	--延迟退出
 	if GetMissionV(DELAY_STATE) == 1 then
 		SetMissionV(DELAY_STATE,0);
 		SetMissionV(TEAM_GAME_STATE,3);
 		CloseMission(TEAM_MISSION_ID);
 		return
 	end
 	
 	nTeamNumLife = GetGameTeamNumByLife();
	
	--只剩下一个队伍
	if nTeamNumLife <= 1 then
		if GetMissionV(DELAY_STATE) == 0 then		
			OldPlayer = PlayerIndex;
			for i=1,10 do
				if GetMissionV(CAPTAIN_ID+i-1) > 0 then				
					PlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
					if GetMissionV(GAME_TYPE) == 4 then
						nBonus = floor(GetMissionV(TEAM_GAME_BONUS)*TEAM_BONUS_RATE)
						Bonus_str = TurnMoneyFormat(nBonus);
						Earn(nBonus);
					end
					nWinCaptianName = GetName();
					--对胜利队伍发放常规奖励
					for j=1,gf_GetTeamSize() do
						PlayerIndex = gf_GetTeamMember(j);
						if PlayerIndex > 0 then
							if GetMissionV(GAME_TYPE) == 3 then
								PayAward(4);
								news_str = "Thi u k誸 th骳, tr薾 n祔 i ng? chi課 th緉g do <color=yellow>"..nWinCaptianName.."<color> d蒼 d総. Xin i gi﹜ l竧, c竎 u th? s? 頲 chuy觧 ra!";
							elseif GetMissionV(GAME_TYPE) == 4 then
								news_str = "Thi u k誸 th骳, tr薾 n祔 i ng? chi課 th緉g do <color=yellow>"..nWinCaptianName.."<color> d蒼 d総, Theo quy t綾 s? nh薾 頲 ph莕 thng"..Bonus_str..". Xin i gi﹜ l竧, c竎 u th? s? 頲 chuy觧 ra!";
							else
								news_str = "Thi u k誸 th骳, tr薾 n祔 i ng? chi課 th緉g do <color=yellow>"..nWinCaptianName.."<color> d蒼 d総. Xin i gi﹜ l竧, c竎 u th? s? 頲 chuy觧 ra!";
							end
							Say(news_str,0);
						end
					end
					break;				
				end
			end
			
			PlayerIndex = OldPlayer;
			
			SetMissionV(DELAY_STATE,1);
			news_str = "Thi u k誸 th骳, ngi chi課 th緉g thu閏 i ng? "..nWinCaptianName.." d蒼 d総. Xin i gi﹜ l竧, c竎 u th? s? 頲 chuy觧 ra!";
			Msg2MSAll(TEAM_MISSION_ID,news_str);
			Msg2SubWorld(nWinCaptianName.." чi n祇 ti猽 di謙 to祅 b? i phng b猲 kia trc khi k誸 th骳 thi u, s? l藀 t鴆 gi祅h th緉g l頸!");
			AddGlobalNews(nWinCaptianName.." чi n祇 ti猽 di謙 to祅 b? i phng b猲 kia trc khi k誸 th骳 thi u, s? l藀 t鴆 gi祅h th緉g l頸!");
			return
		end
	end
	
	--战斗结束
 	if nTimeState >= TEAM_GAME_TIME_AWARD then
 		if GetMissionV(DELAY_STATE) == 0 then
			
			--比赛结束去除角色身上所有状态和停止战斗
 			nPlayerMSIndex = 0;
 			OldPlayer = PlayerIndex;
 			for i=1,GetMSPlayerCount(TEAM_MISSION_ID,0) do
 				nPlayerMSIndex,PlayerIndex = GetNextPlayer(TEAM_MISSION_ID,nPlayerMSIndex,0);
 				if PlayerIndex > 0 then
 					SetFightState(0);
 					RemvoeTempEffect();
 				end
 			end
 			PlayerIndex = OldPlayer;
 			
 			if nTeamNumLife <= 1 then
 			
 				for i=1,10 do
					if GetMissionV(CAPTAIN_ID+i-1) > 0 then
						PlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
						--if IsPlayerDeath() == 0 then
							nWinCaptianName = GetName();
							for j=1,gf_GetTeamSize() do
								if gf_GetTeamMember(j) > 0 then
									PlayerIndex = gf_GetTeamMember(j);
									news_str = "Thi u k誸 th骳, tr薾 n祔 i ng? chi課 th緉g do <color=yellow>"..nWinCaptianName.."<color> d蒼 d総. Xin i gi﹜ l竧, c竎 u th? s? 頲 chuy觧 ra!";
									Say(news_str,0);
									news_str = "Thi u k誸 th骳, tr薾 n祔 i ng? chi課 th緉g do"..nWinCaptianName.."d蒼 d総. Xin i gi﹜ l竧, c竎 u th? s? 頲 chuy觧 ra!"
									Msg2MSAll(TEAM_MISSION_ID,news_str);
								end
							end
							break;
						--end
					end
				end
 				SetMissionV(DELAY_STATE,1);
 				return
 			end
			
			WinnerTab = GetMurderCaptainIDTab(nTeamNumLife);--获得队伍杀人数目由大到小排序的队长index的list
			
			nBonus = floor((GetMissionV(TEAM_GAME_BONUS)*TEAM_BONUS_RATE)/getn(WinnerTab[1]));
			Bonus_str = TurnMoneyFormat(nBonus);

			for i=1,getn(WinnerTab[1]) do
				nKillNum = 0;
				OldPlayer = PlayerIndex
				PlayerIndex = WinnerTab[1][i];
				nWinCaptianName = GetName();
				if GetMissionV(GAME_TYPE) == 4 then
					Earn(nBonus);
				end
				for j=1,gf_GetTeamSize() do
					PlayerIndex = gf_GetTeamMember(j);
					if PlayerIndex > 0 then
						nKillNum = nKillNum + GetTaskTemp(TOTAL_KILL_NUM);
					end
				end
				tinsert(Winner_info,nWinCaptianName);
				tinsert(Winner_info,nKillNum);
				tinsert(Winner_News,Winner_info);
				PlayerIndex = OldPlayer
				Winner_info = {};
			end
			
			--所有队伍杀人数目均为0，比赛判为和局
			if GetMissionV(DECEDEND_NUM) == 0 then
				news_str = "Do m鏸 i thi u tr薾 n祔 u kh玭g c? thng vong, thi u 頲 x? h遖! Xin i gi﹜ l竧, c竎 u th? s? 頲 chuy觧 ra!";
			else
				news_str = "Thi u k誸 th骳, u th? chi課 th緉g tr薾 n祔 l? do"
				for i=1,getn(Winner_News) do			
					if i == getn(Winner_News) then
						nPlayerName = nPlayerName..Winner_News[i][1].."."
						news_str = news_str.."<color=yellow>"..Winner_News[i][1].."d蒼 d総, <color> nh b筰: <color=yellow>"..Winner_News[i][2].."<color> ngi.";
						if GetMissionV(GAME_TYPE) == 4 then 
							news_str = news_str.."чi chi課 th緉g s? nh薾 頲 ph莕 thng"..Bonus_str..". Xin i gi﹜ l竧, c竎 u th? s? 頲 chuy觧 ra!";
						end
						nCaptainName = nCaptainName..Winner_News[i][1];
					else
						nPlayerName = nPlayerName..Winner_News[i][1]..","
						news_str = news_str.."<color=yellow>"..Winner_News[i][1].."d蒼 d総, <color> nh b筰: <color=yellow>"..Winner_News[i][2].."<color> ngi; "
						nCaptainName = nCaptainName..Winner_News[i][1]..",";
					end
				end
			end
			
			--向场内所有角色发送比赛结果
			OldPlayer = PlayerIndex;
			nPlayerMSIndex = 0;
			for i=1,GetMSPlayerCount(TEAM_MISSION_ID,0) do	
				nPlayerMSIndex,PlayerIndex = GetNextPlayer(TEAM_MISSION_ID,nPlayerMSIndex,0);
				if PlayerIndex > 0 then
					Say(news_str,0);
				end
			end
			PlayerIndex = OldPlayer;
			
			--向胜利队伍发常规奖励
			if GetMissionV(DECEDEND_NUM) ~= 0 and GetMissionV(GAME_TYPE) == 3 then
				OldPlayer = PlayerIndex;
				for i=1,getn(WinnerTab[1]) do
					PlayerIndex = WinnerTab[1][i];
					if PlayerIndex > 0 then
						for j=1,gf_GetTeamSize() do
							PlayerIndex = gf_GetTeamMember(i);
							if PlayerIndex > 0 then
								PayAward(4);
							end
						end
					end
				end
				PlayerIndex = OldPlayer;
			end

			--向失败队伍发放常规奖励
			if GetMissionV(GAME_TYPE) == 3 then
				OldPlayer = PlayerIndex
				for i=1,10 do
					nPlayerMSIndex = 0;
					for j=1,GetMSPlayerCount(TEAM_MISSION_ID,i) do
						nPlayerMSIndex,PlayerIndex = GetNextPlayer(TEAM_MISSION_ID,nPlayerMSIndex,i);
						if PlayerIndex > 0 then
							--如果没有胜者则所有人均能得奖励
							if GetMissionV(DECEDEND_NUM) == 0 then
								PayAward(3);
							else
								for k=1,getn(WinnerTab[1]) do
									if gf_GetTeamMember(0) == WinnerTab[1][k] then
										nCaptainState = 1;
										break
									end
								end
								--如果为胜利队伍则不发奖励
								if nCaptainState ~= 1 then
									PayAward(3);
								end
								nCaptainState = 0;
							end
						end
					end
				end			
				PlayerIndex = OldPlayer;
			end
			
			SetMissionV(DELAY_STATE,1);
			if GetMissionV(DECEDEND_NUM) == 0 then
				news_str = "Thi u k誸 th骳, hai i h遖 nhau!"
			else 
				news_str = "Thi u k誸 th骳, ngi chi課 th緉g thu閏 i ng?:"..nCaptainName.." d蒼 d総."
			end
			Msg2MSAll(TEAM_MISSION_ID,news_str);
			return
		end
 		
 	end
 	
	nMin = floor((TEAM_GAME_TIME_AWARD - nTimeState) / 3);
	nSec = mod((TEAM_GAME_TIME_AWARD - nTimeState),3) * 20;
	
	nTeamNum = GetGameTeamNum();
	
	if (nMin == 0) then
		Msg2MSAll(TEAM_MISSION_ID, "Giai 畂筺 thi u: Thi u 產ng ti課 h祅h, trong L玦 i hi謓 c?"..nTeamNum.." i, th阨 gian thi u c遪 l筰 "..nSec.." gi﹜.");
	elseif (nSec == 0) then
		Msg2MSAll(TEAM_MISSION_ID, "Giai 畂筺 thi u: Thi u 產ng ti課 h祅h, trong L玦 i hi謓 c?"..nTeamNum.." i, th阨 gian thi u c遪 l筰 "..nMin.." ph髏.");
	end
	
end
