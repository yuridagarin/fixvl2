--create date:2007-07-13 10:57
--author:yanjun
--describe:�ؿ�С�������ű�
Include("\\script\\missions\\tong_mission\\main_function.lua");
function OnDeath(nNpcIdx)
	local nStage = GetMissionV(MV_STAGE);
	TB_STAGE[nStage]:OnNpcDeath(nNpcIdx);
end;
