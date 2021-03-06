----------------------------------------------------
-- missin base define
-- by windle
-- 2010-2-25 12:09
----------------------------------------------------
Include("\\script\\class\\mem.lua")

MV_STAGE 		= 99		-- 当前处于第几关
MV_PHASE		= 98		-- 当前处于第几阶段
MV_MAP_ID		= 97		-- 地图id, 如果是动态地图就是动态地图id (KQueuing.cpp define too)
MV_MAP_INDEX	= 96		-- 地图index (KQueuing.cpp define too)
MV_MISSION_STATUS = 95	-- 关卡状态, 主要用来记录是否完成关卡
MV_RETURN_MAP_ID = 94	-- 离开坐标标记 (KQueuing.cpp define too)
MV_MISSION_OPEN_STATE = 93 --关卡开启状态

MV_TIMER_STEP 	= 80		-- 时间触发器累加器
MV_TIMER_STEP_MAX = 89
MV_TIMER_SECOND = 70  --时间触发器每秒累加器
MV_TIMER_SECOND_MAX = 79
MV_PHASE_LEVEL	= 60
MV_PHASE_LEVEL_MAX	= 69

CUSTOM_MV_BEGIN = 10
MV_CUSTOM_BEGIN = CUSTOM_MV_BEGIN
MV_CUSTOM_END	= 59

CampPlayer = "camp_player"; 		--武林联盟阵营类型，包括npc
CampEnemy = "camp_enemy";  		--武林叛徒阵营类型，包括npc
CampNeutral = "camp_evil";		--中立npc阵营类型

-----------------------------------------------------------------------------
missionHead = {
	missionID = nil,
	realMapID = nil,
	dynamicMap = 0,
	
	name = "mission",
}
function missionHead:Create()
	local oldMapID = GetWorldPos();
	local realMapID = self:getRealMapID()
	local mapID, mapIdx = realMapID, 0;
	if self.dynamicMap ~= 0 then
		mapID, mapIdx = DynamicLoadMap(realMapID);
	end
	if not mapID or mapID < 1 then 
		self:log(format("[T秈 Map ho芻 Map chuy觧 ng th蕋 b筰] [realMapID=%d, dynamicMap=%d, mapID=%s, mapIdx=%s]", 
			realMapID, self.dynamicMap, tostring(mapID), tostring(mapIdx)));
		return
	end
	self:setMap(mapID);
	local ret = OpenMission(self.missionID);
--	if ret ~= 1 then
--		self:log(format("[创建Mission失败] [missionID=%d, retCode=%s]",self.missionID, tostring(ret)))
--		return
--	end
	self:log(format("[CreateMission] [name=%s, missionID=%d, mapID=%d]", self.name, self.missionID, mapID));
	SetMissionV(MV_MAP_ID, mapID);
	SetMissionV(MV_MAP_INDEX,mapIdx);
	SetMissionV(MV_RETURN_MAP_ID, oldMapID);
--	StartMissionTimer(self.missionID, self.timerID, self.frequecy);
	self:resetMap();
	return mapID, mapIdx;
end

function missionHead:getRealMapID()
	return self.realMapID;
end

function missionHead:Enter(mapID, nCamp)
	self:setMap(mapID);
	SendScript2VM(thisFile, format("this:_Enter(%d)", nCamp));
	self:resetMap();
end

function missionHead:TeamEnter(mapID, nCamp)
	self:setMap(mapID);
	SendScript2VM(thisFile, format("this:_TeamEnter(%d)", nCamp));
	self:resetMap();
end

function missionHead:setMap(mapID)
	if self.oldSubWorld then
		print("[Error] [tMissionBase:setSubWorld] [set v? reset kh玭g tng th輈h !!!]");
		return
	end

	local newSubWorld = SubWorldID2Idx(mapID);
	if newSubWorld < 0 then
		print(format("[Error] [tMissionBase:setSubWorld] [mapID=%s b? l鏸]", tostring(mapID)));
		return
	end;

	self.oldSubWorld = SubWorld;
	SubWorld = newSubWorld;
end

function missionHead:resetMap()
	SubWorld = self.oldSubWorld;
	self.oldSubWorld = nil;
end

function missionHead:log(msg)
	print("MISSIONLOG:",msg);
end