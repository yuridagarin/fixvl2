--create date:2007-07-30 9:32
--author:yanjun
--describe:�油��С�������ű�
Include("\\script\\missions\\tong_mission\\main_function.lua");
function OnDeath(nNpcIdx)
	local nKillCount = GetMissionV(MV_KILL_SUB_NPC);
	SetMissionV(MV_KILL_SUB_NPC,nKillCount+1);
	if mod(nKillCount+1,50) == 0 then
		Msg2MSAll(MISSION_ID,"Hi�n t�i �� ti�u di�t s� l��ng v� b�nh ngo�i ���ng ��t ��n "..(nKillCount+1).."c�i");
	end;
end;