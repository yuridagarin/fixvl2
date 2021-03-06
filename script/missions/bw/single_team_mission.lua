Include("\\script\\missions\\bw\\bwhead.lua")

function InitMission()

	for i=1,100 do 
		SetMissionV(i,0);
	end
	
	for i=1,10 do 
		SetMissionS(i, "");
	end
	
	SetMissionV(TEAM_GAME_STATE,1);
	StartMissionTimer(SINGLE_TEAM_MISSION_ID,SINGLE_TEAM_TIME_ID,SINGLE_TEAM_TIMER);
	
end

function RunMission()

local i = 0;
local nPlayerMSIndex = 0;

	OldPlayer = PlayerIndex;

	for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) do
		nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,1);
		if PlayerIndex > 0 then
		  SetFightState(1);
		end
	end

	nPlayerMSIndex = 0;
	
	for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) do
		nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,2);
		if PlayerIndex > 0 then
		  SetFightState(1);
		end
	end

	PlayerIndex = OldPlayer;
	
 	--删去退出Npc
	SetNpcLifeTime(GetMissionV(NPC_INDEX),0);
 	SetMissionV(TEAM_GAME_STATE,2);
 	
end

function EndMission()

local i = 0;
local nPlayerIndex = 0;
local nPlayerMSIndex = 0;
local PlayerTab = {}; 

	OldPlayer = PlayerIndex;
	
	for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,0) do 
		nPlayerMSIndex,nPlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,0);
		if nPlayerIndex > 0 then
			tinsert(PlayerTab,nPlayerIndex);
		end
	end
	
	for i=1,getn(PlayerTab) do
		PlayerIndex = PlayerTab[i];
		
		--退出mission的时候处理押金奖励返还
		if GetMissionV(MS_YAJING_NUM) > 0 and PlayerIndex == gf_GetTeamMember(0) then
			local pWin = GetMissionV(MS_WIN_CAMP);
			local pCamp = GetTaskTemp(PLAYER_CAMP);
			if pCamp == 1 or pCamp == 2 then
				--如果是胜利者
				if pWin == pCamp then
					yajin_leitai_pay(GetMissionV(MS_YAJING_NUM) * 2);
					Talk(1,"",format("<color=green>Ch? l玦 i<color>: ch骳 m鮪g b筺  gi祅h chi課 th緉g, 畂箃 頲 v祅g t cc <color=green>%d*2<color> v祅g.", GetMissionV(MS_YAJING_NUM)));
					gf_Msg2Team(format("Ch? l玦 i ch骳 m鮪g b筺  gi祅h chi課 th緉g, %s nh薾 頲 v祅g cc %d*2 v祅g", GetName(), GetMissionV(MS_YAJING_NUM)), 1);
				end
				--如果是平手
				if pWin == 0 then
					yajin_leitai_pay(GetMissionV(MS_YAJING_NUM));
					if GetMissionV(READY_STATE) == 1 or GetMissionV(CAPTAIN_STATE) == 1 then
						Talk(1,"",format("<color=green>Ch? l玦 i<color>: tr薾 u k誸 th骳 b蕋 thng, tr? l筰 v祅g cc l玦 i<color=green>%d<color> v祅g.",GetMissionV(MS_YAJING_NUM)));
					else
						Talk(1,"",format("<color=green>Ch? l玦 i<color>: tr薾 u 2 b猲 h遖 nhau, tr? l筰 v祅g cc l玦 i <color=green>%d<color> v祅g.",GetMissionV(MS_YAJING_NUM)));
					end
				end
			end
		end
		
		SetTaskTemp(PLAYER_CAMP,0);
		DelMSPlayer(SINGLE_TEAM_MISSION_ID,0);
	end
	
	PlayerIndex = OldPlayer;

	for i=1,100 do 
		SetMissionV(i,0);
	end
	
	for i=1,10 do 
		SetMissionS(i,"");
	end
	
	--SetNpcLifeTime(GetMissionV(NPC_INDEX),0)--删去退出Npc
	StopMissionTimer(SINGLE_TEAM_MISSION_ID,SINGLE_TEAM_TIME_ID);

end

function OnLeave(RoleIndex)

	local i=0;
	local j=0;
	local nPlayerMSIndex = 0;
	local nPlayerIndex = 0;
	local nDeaNum = 0;
	local nOldPlayer = 0;
	local CaptainIdTab = {};
	local TeamMemberTab = {};
	local str_news = "";

	PlayerIndex = RoleIndex;

	if PlayerIndex == gf_GetTeamMember(0) then
		if PlayerIndex == GetMissionV(CAPTAIN_ID) and GetMissionV(TEAM_GAME_STATE) == 1 then
			SetMissionV(CAPTAIN_STATE,1);
			Msg2MSAll(SINGLE_TEAM_MISSION_ID,"Do i ng k? thi u r阨 kh醝 tr薾 a n猲 thi u b? h駓 b?! Xin i gi﹜ l竧! u s? s? 頲 chuy觧 ra!")
		end
		nOldPlayer = PlayerIndex;

		if IsPlayerDeath() ~= 0 then
			nDeaNum = 1;
		end
		for i=1,gf_GetTeamSize() do
			PlayerIndex = gf_GetTeamMember(i);
			if PlayerIndex > 0 and PlayerIndex ~= gf_GetTeamMember(0) then
				if IsPlayerDeath() ~= 0 then
					nDeaNum = nDeaNum + 1;
				end
				tinsert(TeamMemberTab,PlayerIndex);
			end
		end
		
		if nDeaNum == gf_GetTeamSize() then
			str_news = "Do i ng? hi謓 t筰 b? i phng di謙 s筩h, thi u th蕋 b筰, l藀 t鴆 chuy觧 ra kh醝 u trng!";
		elseif GetMissionV(TEAM_GAME_STATE) == 3 then
			str_news = "";
		else
			str_news = "Do i trng r阨 kh醝 tr薾 a, t蕋 c? i vi猲 s? b? chuy觧 ra kh醝 u trng!";
		end
		
		PlayerIndex = nOldPlayer;
		Msg2Player(str_news);
		nOldPlayer = PlayerIndex;
		
		for i=1,getn(TeamMemberTab) do
			PlayerIndex = TeamMemberTab[i];
			if PlayerIndex > 0 then
				Msg2Player(str_news);
				DelMSPlayer(SINGLE_TEAM_MISSION_ID,0);
			end
		end
		PlayerIndex = nOldPlayer;
	end

	str_news = GetName().."R阨 tr薾 a.";
	Msg2MSAll(SINGLE_TEAM_MISSION_ID,str_news);
	
	SetTaskTemp(PLAYER_CAMP,0);
	SetTask(MULTIMAP_PLAYER_STATE,0);--标志角色离开多人擂台
	
	if IsPlayerDeath() ~= 0 then
		RevivePlayer(0); 
	end
	
	SetPlayerState(3,1,1);
	
	--清零临时任务变量
	SetTaskTemp(TMP_TASK_BW_YAJIN_LEITAI, 0);
	
	SetCreateTeam(0); --打开组队功能
	
  NewWorld(GetLeavePos());
  
  --当角色为最后离开mission的角色时关闭mission
	if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,0) <= 0 then
		CloseMission(SINGLE_TEAM_MISSION_ID);
	end
    
end