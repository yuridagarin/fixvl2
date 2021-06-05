Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function main()
	local MapID,MapX,MapY = GetWorldPos();
	local RoomState = GetMissionV(MV_ROOMSTATE);
	local nGenre,nDetail,nParticular = GetPlayerEquipInfo(10);
	if RoomState == MS_STATE_STARTED or RoomState == MS_STATE_WAITCOMPLETE then	
		if nGenre == 0 and nDetail == 0 and nParticular == 0 then
			Msg2Player("Tr��c ti�n c�n ph�i l�n thuy�n m�i c� th� b�t ��u tr�n ��u.");
			NewWorld(MapID,2038,3268);
			InteractiveEnable(0);
			return 0;
		end;
		if GetTask(POSITION) == TRAPCOUNT then
			Msg2Player("B�n �� ho�n th�nh ���ng �ua, h�y v�o khu ngh� m�t �� ��i tr�n ��u k�t th�c.");
			NewWorld(MapID,2038,3268);
			InteractiveEnable(0);
			return 0;
		end;
		if GetTask(POSITION) ~= 0 then
			NewWorld(MapID,2019,3291);
			InteractiveEnable(0);
			Msg2Player("Trong khi thi ��u, h�y c� g�ng �i ��ng ���ng �ua!");
			return 0;
		end;
		if GetMapTaskTemp(MapID,1) == 0 then
			Create_Box(BOXCOUNT);
			SetMapTaskTemp(MapID,1,1);
		end;
		if nParticular >= 26 and nParticular <= 31 then	--���������ͨ����
			LearnSkill(nParticular+828);
			SetLRSkill(nParticular+828,0);	--��Ϊ����Ҽ�����
		end;
		SetFightState(1);	--����Ϊս��״̬
		ForbidChangePK(0)
		SetPKFlag(2,0);	--����Ϊ��ɱ״̬
		ForbidChangePK(1);	--��ֹ�ı�PK״̬
	elseif RoomState == MS_STATE_WAITSIGNUP or RoomState == MS_STATE_WAITSTART then
		if nGenre == 0 and nDetail == 0 and nParticular == 0 then
			Msg2Player("Tr��c khi tr�n ��u b�t ��u h�y l�n thuy�n chu�n b�.");
		end;
		NewWorld(MapID,2038,3268);
		InteractiveEnable(0);
		Msg2Player("Tr�n ��u ch�a b�t ��u, c� gi� y�n l�ng!");
	end;
end;