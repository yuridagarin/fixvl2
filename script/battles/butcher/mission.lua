Include("\\script\\battles\\butcher\\head.lua")

function InitMission()
	for i = 1, 100 do 
	SetMissionV(i , 0);
	end;
	SetMissionS(1, "")
	SetMissionS(2, "")
end

function RunMission()
	SetMissionV(MS_STATE,2);
	
--	bt_assignrank(1) --���η�����ҷ������
--	bt_assignrank(2) --���ɷ�����ҷ������

	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if (idx == 0) then 
		break
		end
 		if (pidx > 0) then
 			PlayerIndex = pidx;
		end
	--��ʱΪGM���������ʽ����ս��
	PutMessage("Qu�n ��ch �� b�t ��u h�nh ��ng! C�c t��ng s� mau x�ng pha ti�n tuy�n, anh d�ng chi�n ��u!") 
end

end;

function EndMission()
	SetMissionV(MS_STATE,3)
	StopMissionTimer(MISSIONID, 39);
	StopMissionTimer(MISSIONID ,40);
	
	GameOver()
	level = BT_GetGameData(GAME_LEVEL);
	DeleteChannel("T�ng"..szGAME_GAMELEVEL[level].."D�ng th�c c�u s�t")
	DeleteChannel("Li�u"..szGAME_GAMELEVEL[level].."D�ng th�c c�u s�t")


	SetGlbValue(GLB_BATTLESTATE, 0) --���ø�ȫ�ֱ���Ϊ1����־��ǰ����������������ս�۽׶Σ���ʱ������������ĳ��ڵ��Զ���������ս�۵ı����㣬����������ԭ����ս����ͼ
	sl_clearbattledata()	--����ս�����������ս����Ϣ
	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;
end;

function JoinMission(RoleIndex, Camp)
	PlayerIndex = RoleIndex;
	if (Camp ~= 1 and Camp ~= 2) then
		return
	end
	sf_join(Camp)
	ResetBonus()		--����ս��ϵ��������ս��
end;

function OnLeave(RoleIndex)
	level = BT_GetGameData(GAME_LEVEL);
	PlayerIndex = RoleIndex;
	ForbidChangePK(0);

	if (GetCurCamp() == 1) then
		LeaveChannel(PlayerIndex, "T�ng"..szGAME_GAMELEVEL[level].."D�ng th�c c�u s�t")
	else
		LeaveChannel(PlayerIndex, "Li�u"..szGAME_GAMELEVEL[level].."D�ng th�c c�u s�t")
	end
	SetPKFlag(0, 0)

	--��ս����ս�Ժ��뿪ս������Ϊ�����롱�����Ʊ����β����ٽ����κ�һ��
	--����ʵ��Ϊ1Сʱ֮�ڲ����ٴν���ս��
--	if GetMissionV(MS_STATE) == 2 then
--		local nLeaveTime = tonumber(date("%y%m%d%H%M"));
--		BT_SetData(PL_LEAVETIME, nLeaveTime);
--	end

	sf_onplayerleave()
--	SyncTaskValue(700 + PL_BATTLEPOINT);--ͬ����ҵ���ս�����ͻ��ˣ�����ս��������
	if( GetMissionV( MS_STATE ) ~= 3 ) then
		BT_UpdateMemberCount();
		ResetBonus()		--����ս��ϵ��������ս��
	end
	
	if( GetMissionV( MS_STATE ) == 2 and wl_search_memcount() == 1 ) then
		CloseMission( MISSIONID )
	end
end;

