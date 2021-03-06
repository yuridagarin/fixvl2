Include("\\script\\missions\\bw\\bwhead.lua");

nDelayState = 0;

function OnTimer()

local nTimeState = 0;

	nMapState = GetMissionV(MULTIMAP_STATE);
	nTimeState = GetMissionV(MULTIMAP_NEWS_STATE) + 1;
	SetMissionV(MULTIMAP_NEWS_STATE,nTimeState);

	--准备阶段
	if nMapState == 1 then 
		ReportReadyState(nTimeState);
	--比赛中
	elseif nMapState == 2 then 
		ReportBattleState(nTimeState);
	--比赛结束
	elseif nMapState == 3 then  
		Msg2MSAll(MULIT_MISSION_ID, "Chi課 u k誸 th骳!");
		StopMissionTimer(MULIT_MISSION_ID, MULTI_TIME_ID2);		
	end;
end;

--准备阶段信息处理
function ReportReadyState(nTimeState)

local news_str = "";
local nMin = 0; 
local nSec = 0;
local nReportTime = 0
local nTotalFighterNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP)
local nTotalNum = GetMSPlayerCount(MULIT_MISSION_ID,0)
local PlayerMSIndex = 0;
local nPlayerIndex = 0;
local PlayerIndexTab = {};

	--在报名期间，系统定期通知玩家当前的报名情况
	--准备时间到达15分钟以后判断场内当前情况
	if nTimeState >= HUNDRED_READY_TIME then 
	
		--比赛开始时比赛人数少等于1人
		if nTotalFighterNum <= 1 then
				--返还入场费给玩家
			if GetMissionV(GAME_TYPE) == 2 then
				PlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,0,MULIT_FIGTHER_CAMP);
				if nPlayerIndex > 0 then
					OldPlayer = PlayerIndex
					PlayerIndex = nPlayerIndex
					Earn(20000);
					Say("V? s? ngi tham gia Qu莕 h飊g chi課 l莕 n祔 kh玭g  2 ngi, kh玭g th? t? ch鴆 頲! Nay tr? l筰 cho ngi <color=yellow>2 ti襫 v祅g<color> ph? v祇 tr薾!",0);
					PlayerIndex = OldPlayer
				end
			end
			news_str = "S? ngi tham chi課 kh玭g , h駓 b? thi u!";
			Msg2MSAll(MULIT_MISSION_ID,news_str);	
			--由于涉及入场费因此不作延时处理，怕玩家在延时阶段进来而使收取入场费不能退还				
			SetNpcLifeTime(GetMissionV(MULTIMAP_NPC_INDEX),0)--删去退出Npc			 
			SetMissionV(MULTIMAP_STATE,3);
			CloseMission(MULIT_MISSION_ID);
			return
		end
		
		--比赛开始处理
		
		OldPlayer = PlayerIndex
		
		for i=1,nTotalNum do	
			PlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,PlayerMSIndex,0);
			if nPlayerIndex > 0 then
				tinsert(PlayerIndexTab,nPlayerIndex);
			end
		end
		
		if nTotalFighterNum ~= getn(PlayerIndexTab) then
			WriteLog("[Qu莕 h飊g chi課]Khi thi u b総 u, nh薾 PlayerIndex kh玭g ph? h頿 v韎 s? lng tr薾 h譶h!");
		end
			
		for i=1,getn(PlayerIndexTab) do
			PlayerIndex = PlayerIndexTab[i]
			Talk(1,"","Qu莕 h飊g chi課 產ng ch輓h th鴆 b総 u, trong tr薾 hi謓 l? <color=yellow>"..nTotalFighterNum.."<color> ngi!")
		end
		
		PlayerIndex = OldPlayer
		
		news_str = "Thi u Qu莕 h飊g chi課 ch輓h th鴆 b総 u!";
		Msg2MSAll(MULIT_MISSION_ID,news_str);             
		RunMission(MULIT_MISSION_ID);
		return
	end
	
	--其他信息处理
	
	nMin = floor((HUNDRED_READY_TIME - nTimeState) / 3);
	nReportTime = mod(floor((HUNDRED_READY_TIME - nTimeState) / 3),3);
	nSec = mod((HUNDRED_READY_TIME - nTimeState),3) * 20;
	
	--每个三分钟一个信息
	if nReportTime == 0 and nSec == 0 and nMin > 0 then
		news_str = "C竎h gi? khai chi課 l玦 i c遪:"..nMin.." ph髏, s? ngi trong tr薾 hi謓 l? "..nTotalFighterNum.." ngi!";
		Msg2MSAll(MULIT_MISSION_ID, news_str);
		Msg2SubWorld("Чi Ch? Cng thay m苩 ch? nh﹏ t? ch鴆 Qu莕 h飊g chi課 t筰 l玦 i Th祅h Й! Hoan ngh猲h c竎 anh h飊g h秓 h竛 n b竜 danh! Th阨 gian chu萵 b? c遪"..nMin.." ph髏, s? ngi tham chi課 hi謓 l? "..nTotalFighterNum.." ngi.");
	elseif (nMin == 0) then
		news_str = "C竎h gi? khai chi課 l玦 i c遪:" ..nSec.. " gi﹜, s? ngi trong tr薾 hi謓 l?"..nTotalFighterNum.." ngi!";
		Msg2MSAll(MULIT_MISSION_ID, news_str);
	end
	
end


--开战阶段战况报告
function ReportBattleState(nTimeState)

local news_str = "";
local nMSPlayerIndex = 0;
local nPlayerIndexTab = {};
local i=0;
local j=0;
local nMin = 0; 
local nSec = 0;
local nPlayerIndex = 0;
local nWinState = 0;
local nPlayerName = "";
local nKillNum = 0;
local nTotalFigtherNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
local WinnerTab = {};
local Winner_info = {};
local Winner_News = {};
local nBonus = 0;
local Bonus_str = "";
	
	--只剩下一名选手
	if nTotalFigtherNum == 1 then
		if nDelayState == 0 then
			nMSPlayerIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nMSPlayerIndex,MULIT_FIGTHER_CAMP);
			if nPlayerIndex > 0 then
				OldPlayer = PlayerIndex;
				PlayerIndex = nPlayerIndex;
				nPlayerName = GetName();
				nKillNum = GetTaskTemp(TOTAL_KILL_NUM);
				if GetMissionV(GAME_TYPE) == 1 then
					PayAward(2);
				end
				if GetMissionV(GAME_TYPE) == 2 then
					nBonus = floor(GetMissionV(MULTIMAP_BONUS)*BONUS_RATE)
					Bonus_str = TurnMoneyFormat(nBonus);
				--Say("<color=green>代志强<color>：你已经胜出该场百人英雄大擂比赛，按照规则将获得"..Bonus_str.."作为奖励！",0);
					Earn(nBonus);
				end
				WriteLog("[Qu莕 h飊g chi課] Ngi ch琲 "..GetName().." Th緉g tr薾"..GetMissionV(START_TIME).."nh薾 頲 ph莕 thng:"..nBonus.." T鎛g ph? v祇 tr薾 l?:"..GetMissionV(MULTIMAP_BONUS).." T礽 kho秐: "..GetAccount());
				PlayerIndex = OldPlayer;
			end
			
			--向场内所有角色发送比赛结果（包括观众）
			nMSPlayerIndex = 0;
			OldPlayer = PlayerIndex;
			for i=1,GetMSPlayerCount(MULIT_MISSION_ID,0) do
				nPlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nPlayerMSIndex,0);
				if nPlayerIndex > 0 then
					PlayerIndex = nPlayerIndex;
					if GetMissionV(GAME_TYPE) == 2 then 
						news_str = "Thi u k誸 th骳, u th? chi課 th緉g thi u tr薾 n祔 l? <color=yellow>"..nPlayerName.."<color>, t鎛g s? ngi nh b筰 l?:"..nKillNum.."  ngi, theo l? s? nh薾 頲 ph莕 thng"..Bonus_str.."! Xin i gi﹜ l竧, c竎 u th? s? 頲 chuy觧 ra!";
					else
						news_str = "Thi u k誸 th骳, u th? chi課 th緉g thi u tr薾 n祔 l? <color=yellow>"..nPlayerName.."<color>, t鎛g s? ngi nh b筰 l?:"..nKillNum.."  ngi. Xin i gi﹜ l竧, c竎 u th? s? 頲 chuy觧 ra!";
					end
					Talk(1,"",news_str);
				end
			end
			PlayerIndex = OldPlayer ;
			nDelayState = 1;
			news_str = "Thi u k誸 th骳, u th? chi課 th緉g l?"..nPlayerName;
			Msg2MSAll(MULIT_MISSION_ID, news_str);
			Msg2SubWorld(nPlayerName.."Trc khi gi? u k誸 th骳, ai nh b筰 i phng s? gi祅h th緉g l頸!");
			AddGlobalNews(nPlayerName.."Trc khi gi? u k誸 th骳, ai nh b筰 i phng s? gi祅h th緉g l頸!");
			return
		end
		--延时退出
		if nDelayState == 1 then
			nDelayState = 0;
			SetMissionV(MULTIMAP_STATE,3);
			CloseMission(MULIT_MISSION_ID);
			return
		end
	end
	
	--战斗结束
 	if nTimeState >= HUNDRED_GAME_TIME then
 		
 		if nDelayState == 0 then
			
			WinnerTab = GetMurderIndexTab(nTotalFigtherNum);--获得杀人数目由大到小排序的list
			
			if GetMissionV(GAME_TYPE) == 2 then
				nBonus = floor((GetMissionV(MULTIMAP_BONUS)*BONUS_RATE)/getn(WinnerTab[1]));
				Bonus_str = TurnMoneyFormat(nBonus);
			end
			
			for i=1,getn(WinnerTab[1]) do
				OldPlayer = PlayerIndex
				PlayerIndex = WinnerTab[1][i];
				if GetMissionV(DECEDEND_NUM) ~= 0 and GetMissionV(GAME_TYPE) == 2 then
					Earn(nBonus);
				end
				if GetMissionV(DECEDEND_NUM) ~= 0 and GetMissionV(GAME_TYPE) == 1 then
					PayAward(2)
				end
				tinsert(Winner_info,GetName());
				tinsert(Winner_info,GetTaskTemp(TOTAL_KILL_NUM));
				tinsert(Winner_News,Winner_info);
				WriteLog("[Qu莕 h飊g chi課] Ngi ch琲 "..GetName().." Th緉g tr薾"..GetMissionV(START_TIME).."nh薾 頲 ph莕 thng:"..nBonus.." T鎛g ph? v祇 tr薾 l?:"..GetMissionV(MULTIMAP_BONUS).." T礽 kho秐: "..GetAccount());
				PlayerIndex = OldPlayer
				Winner_info = {}
			end
			
			--向失败者发奖
			nMSPlayerIndex = 0;
			OldPlayer = PlayerIndex;
			for i=1,GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP) do	
				nMSPlayerIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nMSPlayerIndex,MULIT_FIGTHER_CAMP);
				if nPlayerIndex > 0 then
					PlayerIndex = nPlayerIndex;
					if GetMissionV(DECEDEND_NUM) == 0 then
						PayAward(1);
					else 
						for j=1,getn(WinnerTab[1]) do	
							if PlayerIndex == WinnerTab[1][j] then
								nWinState = 1;
								break;
							end
						end
						if nWinState ~= 1 then
							PayAward(1);
						end
						nWinState = 0;
					end
				end
			end
			PlayerIndex = OldPlayer;
	
			if GetMissionV(DECEDEND_NUM) == 0 then
				news_str = "Thi u tr薾 n祔 kh玭g c? ngi thng vong, tr薾 u 頲 x? h遖! Xin i gi﹜ l竧, c竎 u th? s? 頲 chuy觧 ra!"
			else
				news_str = "Thi u k誸 th骳, u th? chi課 th緉g tr薾 n祔 l?"
				for i=1,getn(Winner_News) do
					if i == getn(Winner_News) then
						nPlayerName = nPlayerName..Winner_News[i][1].."."
						news_str = news_str.."<color=yellow>"..Winner_News[i][1].."<color> nh b筰: <color=yellow>"..Winner_News[i][2].." <color> ngi."
						if GetMissionV(GAME_TYPE) == 2 then
							news_str = news_str.."Theo quy t綾 s? nh薾 頲 ph莕 thng"..Bonus_str.."!";
						end
					else
						nPlayerName = nPlayerName..Winner_News[i][1]..","
						news_str = news_str.."<color=yellow>"..Winner_News[i][1].."<color> nh b筰: <color=yellow>"..Winner_News[i][2].."<color> ngi; "
					end
				end
			end
			
			--向场内所有角色发送比赛结果（包括观众）
			nMSPlayerIndex = 0;
			OldPlayer = PlayerIndex;
			for i=1,GetMSPlayerCount(MULIT_MISSION_ID,0) do
				nPlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nPlayerMSIndex,0);
				if nPlayerIndex > 0 then
					PlayerIndex = nPlayerIndex;
					SetFightState(0);
					RemvoeTempEffect();
					Say(news_str,0);
				end
			end
			PlayerIndex = OldPlayer;
			nDelayState = nDelayState + 1;
			if GetMissionV(DECEDEND_NUM) == 0 then
				news_str = "Thi u k誸 th骳, tr薾 n祔 x? h遖.";
			else
				news_str = "Thi u k誸 th骳, u th? chi課 th緉g l?:"..nPlayerName;
			end
			Msg2MSAll(MULIT_MISSION_ID, news_str);
			return
		end
 		
 		--延迟退出
 		if nDelayState == 1 then
 			nDelayState = 0;
 			SetMissionV(MULTIMAP_STATE,3);
 			CloseMission(MULIT_MISSION_ID);
 			return
 		end
 		
 	end
 	
	nMin = floor((HUNDRED_GAME_TIME - nTimeState) / 3);
	nSec = mod((HUNDRED_GAME_TIME - nTimeState),3) * 20;
	
	if nMin == 0 then
		Msg2MSAll(MULIT_MISSION_ID, "Giai 畂筺 chi課 u: Thi u 產ng ti課 h祅h, trong tr薾 hi謓 c?"..nTotalFigtherNum.." u th?, th阨 gian thi u c遪"..nSec.." gi﹜.");
	elseif nSec == 0 then
		Msg2MSAll(MULIT_MISSION_ID, "Giai 畂筺 chi課 u: Thi u 產ng ti課 h祅h, trong tr薾 hi謓 c?"..nTotalFigtherNum.." u th?, th阨 gian thi u c遪"..nMin.." ph髏.");
	end
	
end;
