--��̩�����ű�
--by liubo
Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")
function OnDeath(nIndex)
	--print("OnDeath XT")
	--�ǿ�ս״̬����
	local nBattleState = GetMissionV(MV_LZZ_STATE) 
	if nBattleState ~= MS_STATE_FIGHT then	
		return 0 
	end 
	SetNpcLifeTime(nIndex,0)
	--���ɱ��NPC��PlayerIndex����Ӫ
	local nPoint = 15   --ɱ��NPC��õķ���
	local nCampPlace = LZZ_GetCamp()
	--����ս�������ý��б�ʶ
	--LZZ_OperateAllPlayer(lzz_set_fight,{},nCampPlace)
	if nCampPlace == 1 then 
		SetMissionV(MV_LZZ_CAMPONE_POINT,GetMissionV(MV_LZZ_CAMPONE_POINT)+nPoint)
	elseif nCampPlace == 2 then 
		SetMissionV(MV_LZZ_CAMPTWO_POINT,GetMissionV(MV_LZZ_CAMPTWO_POINT)+nPoint)
	else
		return 0
	end
	--�����ʾ
	LZZ_Panel_Show()
	Msg2MSAll(MISSIONID,tSTRING_MISSION[27])
end