--���ߣ��Ͼ�
--�������ڣ�07��11��21��11:44
--NPC�����ű�
--ע�⣺���ǵ�����ԭ�����NPCˢ�ڹؿ�����ĵ�ͼ�����NPC����ʱ�����ĵ�ͼ���ж�
Include("\\script\\task\\faction_back_room\\back_room_function.lua");
function OnDeath(nNpcIdx)
	if GetMissionV(MV_NSC_REMOVE_NPC_BODY) == 1 then
		BR_RemoveNpcIndex(nNpcIdx);
		SetNpcLifeTime(nNpcIdx,0);
	end;
	local nNeedKillCount = GetMissionV(MV_NSC_NEED_KILL_NUMBER);
	local nCurKillCount = GetMissionV(MV_NSC_KILL_NPC_COUNT);
	SetMissionV(MV_NSC_KILL_NPC_COUNT,nCurKillCount+1);
	SetMissionV(MV_NSC_REFLASH_KILL_NUMBER,GetMissionV(MV_NSC_REFLASH_KILL_NUMBER)+1);
	if BR_CheckWinCondition() == 1 then	--����Ƿ�ﵽ����Ҫ��
		if GetMissionV(MV_MISSION_STATE) ~= MS_STATE_STARTED then
			return 0;
		end;
		BR_EndStage();
	else
		Msg2MSAll(MISSION_ID,"S� l��ng th� v� c�n l�i: "..(nNeedKillCount-nCurKillCount-1));
	end;
end;