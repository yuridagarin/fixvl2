--File name:room.lua
--Describe:比赛房间类类脚本
--Create Date:2006-4-18
--Author:yanjun
Include("\\script\\class\\mem.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
--========================================================================================
KSRoom = {
--==========成员变量================
m_MapID = 0,
m_OldSubWorld = 0,
m_SubWorld = 0,--Mission所对应的地图索引
--==========成员函数=================
--构造函数，用来设置Mission所对应的场地的
__new = function(self,arg)
	self.m_MapID = arg[1];
	self.m_OldSubWorld = SubWorld;
	local MapID = GetWorldPos();
	if MapID == 100 then
		MapID = 300;
	elseif MapID == 300 then
		MapID = 100;
	end;
	self.m_SubWorld = SubWorldID2Idx(MapID*10+70+arg[1]-1);
end,
--得到当前场地里面的玩家数
GetPlayerNum = function(self)
	SubWorld = self.m_SubWorld;
	if SubWorld < 0 then
		SubWorld = self.m_OldSubWorld;
		Write_Log("L鏸 t譵 b秐 ","L鏸 n祔 s? l祄 server t筸 ng鮪g v薾 h祅h, r蕋 nguy hi觤, mau t譵 nguy猲 nh﹏! ! ! Tr? hng d蒼 tra c鴘 a :"..self.m_SubWorld);
		return 0;
	end;
	local nPlayerNum = GetMSPlayerCount(MISSION_ID,CAMP_PLAYER);
	SubWorld = self.m_OldSubWorld;
	return nPlayerNum;
end,
--比赛玩家进入场地
AddPlayer = function(self)
	SubWorld = self.m_SubWorld;
	if SubWorld < 0 then
		SubWorld = self.m_OldSubWorld;
		Write_Log("L鏸 t譵 b秐 ","L鏸 n祔 s? l祄 server t筸 ng鮪g v薾 h祅h, r蕋 nguy hi觤, mau t譵 nguy猲 nh﹏! ! ! Tr? hng d蒼 tra c鴘 a :"..self.m_SubWorld);
		return 0;
	end;
	local nPlayerNum = GetMSPlayerCount(MISSION_ID,CAMP_PLAYER)
	if GetMissionV(MV_ROOMSTATE) <= MS_STATE_WAITSIGNUP then
		if GetMissionV(MV_ROOMSTATE) == MS_STATE_IDLE then	--第一个进去
			Msg2Player("Ch祇 m鮪g b筺 v祇 trng u, xin h穣 i tuy觧 th? kh竎 v祇.");
			OpenMission(MISSION_ID);
		elseif nPlayerNum == MAXPLAYER-1 then	--最后一个进去
			StopMissionTimer(MISSION_ID,READY_TIMER_ID);
			SetMissionV(MV_TIMELEFT,WAITSTART_TIMER_LOOP);
			SetMissionV(MV_ROOMSTATE,MS_STATE_WAITSTART);
			StartMissionTimer(MISSION_ID,WAITSTART_TIMER_ID,WAITSTART_TIME);
		end;
		SetMissionV(MV_ENTERORDER,GetMissionV(MV_ENTERORDER)+1);
		SetTask(ENTERORDER,GetMissionV(MV_ENTERORDER));	--记录进场顺序
		local MapID = GetWorldPos();
		local MapID = GetWorldPos();
		if MapID == 100 then
			MapID = 300;
		elseif MapID == 300 then
			MapID = 100;
		end;
		CleanInteractive();
		NewWorld(MapID*10+70+self.m_MapID-1,2051,3257);
		JoinMission(MISSION_ID,CAMP_PLAYER);	--全部加到阵营2
		SetTask(CURMAP,self.m_MapID);
		Msg2MSAll(MISSION_ID,"Tuy觧 th? "..GetName().." Х v祇 trng u. Hi謓 trong trng u c? t蕋 c? "..(nPlayerNum+1).." ngi");
		if nPlayerNum == MAXPLAYER-1 then
			Msg2MSAll(MISSION_ID,"Th玭g b竜 c竎 tuy觧 th? chu萵 b?, 30 gi﹜ sau ch輓h th鴆 thi u.");
		end;
	end;
	SubWorld = self.m_OldSubWorld;
end,
--得到当前场地的状态
GetRoomState = function(self)
	SubWorld = self.m_SubWorld;
	if SubWorld < 0 then
		SubWorld = self.m_OldSubWorld;
		Write_Log("L鏸 t譵 b秐 ","L鏸 n祔 s? l祄 server t筸 ng鮪g v薾 h祅h, r蕋 nguy hi觤, mau t譵 nguy猲 nh﹏! ! ! Tr? hng d蒼 tra c鴘 a :"..self.m_SubWorld);
		return 0;
	end;
	local nState = GetMissionV(MV_ROOMSTATE);
	SubWorld = self.m_OldSubWorld;
	return nState;
end,
--设置当前场地的状态
SetRoomState = function(self,State)
	SubWorld = self.m_SubWorld;
	if SubWorld < 0 then
		SubWorld = self.m_OldSubWorld;
		Write_Log("L鏸 t譵 b秐 ","L鏸 n祔 s? l祄 server t筸 ng鮪g v薾 h祅h, r蕋 nguy hi觤, mau t譵 nguy猲 nh﹏! ! ! Tr? hng d蒼 tra c鴘 a :"..self.m_SubWorld);
		return 0;
	end;
	SetMissionV(MV_ROOMSTATE,State);
	SubWorld = self.m_OldSubWorld;
end,

}

function Init_Room()	--只要使用到KSRoom的地方都要有这个初始化
	local RoomTab = {};
	for i=1,g_TotalRoomNum do			
		RoomTab[i] = new(KSRoom,i);
	end;
	return RoomTab;
end;