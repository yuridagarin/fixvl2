--�λ�NPC�����ű�
--by liubo
Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")
function OnDeath(nIndex)
	--print("OnDeath SBoat")
	--�ǿ�ս״̬����
	local nBattleState = GetMissionV(MV_LZZ_STATE) 
	if nBattleState ~= MS_STATE_FIGHT then	
		return 0 
	end 
	SetNpcLifeTime(nIndex,0)
	SetMissionV(MV_LZZ_SONGBOAT_IDX,0)
	--���ɱ��NPC��PlayerIndex����Ӫ
	local nCampPlace = LZZ_GetCamp()
	--����ս�������ý��б�ʶ
	--LZZ_OperateAllPlayer(lzz_set_fight,{},nCampPlace)
	SetMissionV(MV_LZZ_CAMPTWO_POINT,GetMissionV(MV_LZZ_CAMPTWO_POINT)+FIREBOAT_POINT)
	--�����ʾ
	LZZ_Panel_Show()
	Msg2MSAll(MISSIONID,tSTRING_MISSION[24])
end
