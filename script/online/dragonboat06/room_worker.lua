--File name:
--Describe:�������ع�����
--Create Date:2006-4-26
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function main()
	local selTab = {
				"��ng! Ta mu�n r�i kh�i/leave",
				"Ti�p t�c tham gia thi ��u/nothing",
				}
	Say("B�n mu�n r�i kh�i tr��ng ��u ngay b�y gi�?",getn(selTab),selTab);
end;

function leave()
	if GetTask(STATUS) == CAMP_PLAYER then
		DelMSPlayer(MISSION_ID,CAMP_PLAYER);
	else
		local MapID = GetWorldPos();
		local MapIndex = floor(MapID/1000);
		if MapIndex == 1 then
			MapIndex = 3;
		elseif MapIndex == 3 then
			MapIndex = 1;
		end;
		NewWorld(LeavePoint[MapIndex][1],LeavePoint[MapIndex][2],LeavePoint[MapIndex][3]);
		Restore_Player_State();
		WriteLog("[L�i ho�t ��ng t�t �oan Ng�]: C� ng��i ch�i kh�ng ph�i l� tuy�n th� tham gia trong khu v�c �ua thuy�n R�ng, t�n nh�n v�t:"..GetName());
	end;
end;