--date:2007-3-7
--author:yanjun
--describe:this file open the "killer hall" mission
Include("\\script\\task\\killer_hall\\mission\\mission_head.lua");
function main()
	if tonumber(date("%H")) == 9 then
		do	return	end
	end
	if GetGlbValue(GLB_KILLER_HALL_FORBIDEN) == 0 then
		gf_ShowDebugInfor("current mission state:"..tostring(mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,MAP_ID)));
		if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,MAP_ID) == MS_STATE_IDEL then
			if mf_OpenMission(MISSION_ID,MAP_ID) == 1 then
				Msg2Global("S�t th� ���ng chi�u m� s�t th�, c�c anh h�ng k� n� nhanh ch�ng n�m b�t c� h�i.");
			end;
		end;
	end;
end;
