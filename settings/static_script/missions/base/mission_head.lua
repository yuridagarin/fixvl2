----------------------------------------------------
-- missin base define
-- by windle
-- 2010-2-25 12:09
----------------------------------------------------
Include("\\script\\class\\mem.lua")

MV_STAGE 		= 99		-- ��ǰ���ڵڼ���
MV_PHASE		= 98		-- ��ǰ���ڵڼ��׶�
MV_MAP_ID		= 97		-- ��ͼid, ����Ƕ�̬��ͼ���Ƕ�̬��ͼid (KQueuing.cpp define too)
MV_MAP_INDEX	= 96		-- ��ͼindex (KQueuing.cpp define too)
MV_MISSION_STATUS = 95	-- �ؿ�״̬, ��Ҫ������¼�Ƿ���ɹؿ�
MV_RETURN_MAP_ID = 94	-- �뿪������ (KQueuing.cpp define too)
MV_MISSION_OPEN_STATE = 93 --�ؿ�����״̬

MV_TIMER_STEP 	= 80		-- ʱ�䴥�����ۼ���
MV_TIMER_STEP_MAX = 89
MV_TIMER_SECOND = 70  --ʱ�䴥����ÿ���ۼ���
MV_TIMER_SECOND_MAX = 79
MV_PHASE_LEVEL	= 60
MV_PHASE_LEVEL_MAX	= 69

CUSTOM_MV_BEGIN = 10
MV_CUSTOM_BEGIN = CUSTOM_MV_BEGIN
MV_CUSTOM_END	= 59

CampPlayer = "camp_player"; 		--����������Ӫ���ͣ�����npc
CampEnemy = "camp_enemy";  		--������ͽ��Ӫ���ͣ�����npc
CampNeutral = "camp_evil";		--����npc��Ӫ����

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
		self:log(format("[T�i Map ho�c Map chuy�n ��ng th�t b�i] [realMapID=%d, dynamicMap=%d, mapID=%s, mapIdx=%s]", 
			realMapID, self.dynamicMap, tostring(mapID), tostring(mapIdx)));
		return
	end
	self:setMap(mapID);
	local ret = OpenMission(self.missionID);
--	if ret ~= 1 then
--		self:log(format("[����Missionʧ��] [missionID=%d, retCode=%s]",self.missionID, tostring(ret)))
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
		print("[Error] [tMissionBase:setSubWorld] [set v� reset kh�ng t��ng th�ch !!!]");
		return
	end

	local newSubWorld = SubWorldID2Idx(mapID);
	if newSubWorld < 0 then
		print(format("[Error] [tMissionBase:setSubWorld] [mapID=%s b� l�i]", tostring(mapID)));
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