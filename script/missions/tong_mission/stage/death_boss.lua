--create date:2007-07-11 20:07
--author:yanjun
--describe:�ؿ�BOSS�����ű�
Include("\\script\\missions\\tong_mission\\main_function.lua");
function OnDeath(nNpcIdx)
	local nStage = GetMissionV(MV_STAGE);
	TB_STAGE[nStage]:OnBossDeath(nNpcIdx);
end;