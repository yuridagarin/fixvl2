--File name:trigger.lua 
--Describe:三节连过，触发器脚本
--Create Date:2006-9-9
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")
function OnLogout()
	RemoveTrigger(GetTrigger(TRIGGER_LOGOUT_CID));
	RemoveTrigger(GetTrigger(TRIGGER_LOGIN_CID));
	RemoveTrigger(GetTrigger(TRIGGER_TIMER_CID));
	SetNpcLifeTime(GetTaskTemp(TT_FIREWORKS_INDEX),0);
end;

function OnLogin()
	RemoveTrigger(GetTrigger(TRIGGER_LOGOUT_CID));
	RemoveTrigger(GetTrigger(TRIGGER_LOGIN_CID));
	RemoveTrigger(GetTrigger(TRIGGER_TIMER_CID));
end;

function OnTimer()
	local nLoop = GetTaskTemp(TT_TIMER_LOOP);
	local nOldPlayerIndex = PlayerIndex;
	local nTeamSize = GetTeamSize();
	local nCurMapID,nCurMapX,nCurMapY = GetWorldPos();
	local nMapID = GetTaskTemp(TT_FIREWORKS_MAPID);
	local nMapX = GetTaskTemp(TT_FIREWORKS_MAPX);
	local nMapY = GetTaskTemp(TT_FIREWORKS_MAPY);
	local nHealthyExp = 0;
	local nDate = tonumber(date("%y%m%d"));
	SetTaskTemp(TT_TIMER_LOOP,nLoop-1);
	if nTeamSize == 0 then
		if GetTask(TASK_HEALTHYEXP_DATE) < nDate then
			SetTask(TASK_HEALTHYEXP_DATE,nDate);
			SetTask(TASK_HEALTHYEXP,0);
		end;
		if nCurMapID == nMapID then
			if GetTask(TASK_HEALTHYEXP) > 2000000 then
				Msg2Player("觤 s鴆 kh醗 h玬 nay b筺 nh薾 頲 nh? ph竜 hoa  vt qu? 2000000 甶觤, kh玭g th? ti誴 t鬰 nh薾 th猰 n鱝.");
			elseif GetLevel() > 10 and Get_Distance(nMapX,nMapY) <= DISTANCE then
				nHealthyExp = 50000;
				ModifyGoldenExp(nHealthyExp);
				SetTask(TASK_HEALTHYEXP,GetTask(TASK_HEALTHYEXP)+nHealthyExp);
				Msg2Player("B筺 nh薾 頲 "..nHealthyExp.."甶觤 s鴆 kh醗, t鎛g 甶觤 s鴆 kh醗 h玬 nay b筺 nh薾 頲 nh? ph竜 hoa:"..GetTask(TASK_HEALTHYEXP));
				SetTask(TASK_HEALTHYEXP_DATE,nDate);
			end;
		end;
	else
		local nCounter = 0;
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i);
			if GetLevel() > 10 and Get_Distance(nMapX,nMapY) <= DISTANCE then
				nCounter = nCounter + 1;
			end;
		end;
		if nCounter == 0 then
			PlayerIndex = nOldPlayerIndex;
			return 0;
		end;
		nHealthyExp = floor(50000*tAddPercent[nCounter]/100)
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i);
			if GetTask(TASK_HEALTHYEXP_DATE) < nDate then
				SetTask(TASK_HEALTHYEXP_DATE,nDate);
				SetTask(TASK_HEALTHYEXP,0);
			end;
			if GetTask(TASK_HEALTHYEXP) > 2000000 then
				Msg2Player("觤 s鴆 kh醗 h玬 nay b筺 nh薾 頲 nh? ph竜 hoa  vt qu? 2000000 甶觤, kh玭g th? ti誴 t鬰 nh薾 th猰 n鱝.");
			elseif GetLevel() > 10 and Get_Distance(nMapX,nMapY) <= DISTANCE then
				ModifyGoldenExp(nHealthyExp);
				SetTask(TASK_HEALTHYEXP,GetTask(TASK_HEALTHYEXP)+nHealthyExp);
				Msg2Player("B筺 nh薾 頲 "..nHealthyExp.."甶觤 s鴆 kh醗, t鎛g 甶觤 s鴆 kh醗 h玬 nay b筺 nh薾 頲 nh? ph竜 hoa:"..GetTask(TASK_HEALTHYEXP));
			end;
		end;
	end;
	PlayerIndex = nOldPlayerIndex;
	if nLoop == 0 then
		RemoveTrigger(GetTrigger(TRIGGER_LOGOUT_CID));
		RemoveTrigger(GetTrigger(TRIGGER_TIMER_CID));
		RemoveTrigger(GetTrigger(TRIGGER_LOGIN_CID));
		Say("B筺  t h誸 Ph竜 hoa.",0);
		SetNpcLifeTime(GetTaskTemp(TT_FIREWORKS_INDEX),0);
		SetTaskTemp(TT_TIMER_LOOP,0);
		SetTaskTemp(TT_FIREWORKS_MAPID,0);
		SetTaskTemp(TT_FIREWORKS_MAPX,0);
		SetTaskTemp(TT_FIREWORKS_MAPY,0);
		SetTaskTemp(TT_FIREWORKS_TIME,0);
		SetTaskTemp(TT_FIREWORKS_INDEX,0);
	end;
end;

tAddPercent = {
	[1] = 100,
	[2] = 110,
	[3] = 115,
	[4] = 120,
	[5] = 125,
	[6] = 130,
	[7] = 135,
	[8] = 140,
	}