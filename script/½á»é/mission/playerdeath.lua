Include("\\script\\���\\marriage_head.lua");
function OnDeath(Launcher)
	local KillerIndex = NpcIdx2PIdx(Launcher);
	local nMapID = GetWorldPos()
	local nFieldType = map_field2type[nMapID];
	SetTempRevPos(map_RevPos[nFieldType][1],map_RevPos[nFieldType][2]*32,map_RevPos[nFieldType][3]*32)	--������
end;