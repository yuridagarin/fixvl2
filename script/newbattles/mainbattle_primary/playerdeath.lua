Include("\\script\\newbattles\\mainbattle_primary\\mainbattle_head.lua");

--�������͸��ʴ��͸���
--��
--		ʿ��	Уξ	��ͳ	�ȷ�	��	Ԫ˧	
--ʿ��	0		0		0		0		0		0
--Уξ	0		0		0		0		0		0
--��ͳ	0		0		10		7		4		1	
--�ȷ�	0		0		7		10		7		4	
--��	0		0		4		7		10		7	
--Ԫ˧	0		0		1		4		7		10	

--Note:����״̬�µ�������Ҳ���ܴ�ɣ���������ʵ������״̬�µ�����

tFIGHTPROBABILITY =
{
	{005,005, 005, 005, 005, 005},
	{005,005, 005, 005, 005, 005},
	{005,005, 005, 005, 005, 005},
	{005,005, 005, 005, 005, 005},
	{005,005, 005, 005, 005, 005},
	{005,005, 005, 005, 005, 005},
}

function OnDeath(Launcher)
	ClearColdDown();	--���ҩCD
	local nBattleState = GetMissionV(MV_BATTLE_STATE);
	if nBattleState ~= MS_STATE_FIGHT then	--�ǿ�ս״̬����
		return 0;
	end;
	local nKillerIndex = NpcIdx2PIdx(Launcher);
	local nDeathIndex = PlayerIndex;
	local sDeathName = GetName();
	local nDeathCamp = BT_GetCamp();
	local nKillerCamp = 0;
	local sKillerName = "K� th�";
	if nKillerIndex > 0 then
		PlayerIndex = nKillerIndex;
		sKillerName = GetName();
		nKillerCamp = BT_GetCamp();
	end;
	PlayerIndex = nDeathIndex;
	BT_SetData(PTNC_SERIES_KILL,0);	--ʲô�����������ɱ����Ҫ��0
	BT_SetData(PTNC_DEATH,BT_GetData(PTNC_DEATH)+1);
	if BT_GetData(PTNC_DEATH) > BT_GetData(PT_MAX_DEATH) then
		BT_SetData(PT_MAX_DEATH,BT_GetData(PTNC_DEATH));
	end;
	local nRoomIndex = BT_GetTempData(PTT_ROOMINDEX);
	local nDanTiaoIdx1 = GetMissionV(MV_FIGHTER_GROUP1_1+(nRoomIndex-1)*2);
	local nDanTiaoIdx2 = GetMissionV(MV_FIGHTER_GROUP1_1+(nRoomIndex-1)*2+1);
	local tPlayer = {nDanTiaoIdx1,nDanTiaoIdx2};
	local nDeathRank,bEver = BT_GetCurRank();
	if nDeathRank == 0 then
		nDeathRank = 1;
	end;
	local nKillPoint = tKillPlayerPoint[nDeathRank];
	if bEver == 1 then
		nKillPoint = 5;	--��������þ��Σ�ͳһΪ5��
	end;
	BT_SetTempData(PTT_DIE_LOOP,GetMissionV(MV_TIMER_LOOP));
	BT_AddBattleActivity(BA_MAIN_DEATH);
	--=====================================================================����������
	local nCampPlace = nDeathCamp;
	SetMissionV(MV_DEATH_COUNT_SONG+nDeathCamp-1,GetMissionV(MV_DEATH_COUNT_SONG+nDeathCamp-1)+1);
	SetTempRevPos(ENTRANCE_POINT[nCampPlace][1],ENTRANCE_POINT[nCampPlace][2]*32,ENTRANCE_POINT[nCampPlace][3]*32);	--����������
	--======================================================================��������
	local nRefugeeModel = {"N�n d�n T�ng","N�n d�n Li�u"};
	if BT_GetTempData(PTT_FOLLOWER) == 1 then
		local nRefugeeIndex = CreateNpc(nRefugeeModel[nDeathCamp],tCampNameZ[nDeathCamp].." _n�n d�n",GetWorldPos());
		SetNpcScript(nRefugeeIndex,"\\script\\newbattles\\mainbattle_primary\\refugee_talk_npc.lua");
	end;
	KillFollower()	--�������
	BT_SetTempData(PTT_FOLLOWER,0);	--����֮������Ͷ���
	--======================================================================
	if Launcher == -1 then
		return 0;	--��caststate������
	end;
	if nKillerIndex == 0 then	--��NPCɱ����
		return 0;
	end;
	if nKillerCamp == nDeathCamp then	--���Լ���ɱ����
		return 0;
	end;
	--======================================================================������
	if BT_GetTempData(PTT_FIGHT_STATE) ~= ROOM_STATE_IDLE then	--����ʱ��ɱ��
		local nRoomIndex = BT_GetTempData(PTT_ROOMINDEX);
		SetMissionV(MV_FIGHTING_ROOM1+nRoomIndex-1,ROOM_STATE_IDLE);
		for i=1,2 do
			PlayerIndex = tPlayer[i];
			BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_IDLE);--���������Ϣ
			BT_SetTempData(PTT_ROOMINDEX,0);
			local nPlayerCamp = BT_GetCamp();
			local nGotPoint = 0;
			nCampPlace = nPlayerCamp;
			RemoveTrigger(GetTrigger(FIGHT_TRIGGER_ID));
			SetFightState(0);
			Restore();
			RestoreNeili();
			ClearColdDown();	--�������ҩCD
			CastState("imme_clear_skill_interval",-1,0);	--�������м��ܵ���ȴʱ��			
			BT_SetTempData(PTT_LOCK,0);	--����
			if PlayerIndex ~= nDeathIndex then	--������������Ǹ�
				BT_EmperorAward(3,1);	--����ʤ���У����Ļ����ûʵۼν�
				nGotPoint = BT_AddPersonalPoint(2*nKillPoint,0,1);	--����ɱ��һ����˫�����˻���
				BT_DecMissionPoint(nPlayerCamp,nGotPoint);	--�ѹ������ֿۻ�ȥ
				Msg2MSAll(MISSION_ID,GetName().." c��i ng�a gi�t ��ch "..sDeathName.." l�p ���c c�ng l�n, th��ng �i�m t�ch l�y"..(2*nKillPoint).." �i�m");
				Say("B�n �� gi�nh th�ng l�i trong ��t ��n ��u n�y!",0);
			else
				BT_SetData(PTNC_SINGLE_LOSE,BT_GetData(PTNC_SINGLE_LOSE)+1);
				BT_DecPersonalPoint(2*ceil(nKillPoint/3),1)	--�۵���ɱ����2/3����Ӧ���˻���
				Say("B�n �� thua trong l�n ��n ��u n�y, c� g�ng h�n nh�!",0);
			end;
			SetPos(ENTRANCE_POINT[nCampPlace][2],ENTRANCE_POINT[nCampPlace][3]);
			Msg2Player("T� chi�n tr��ng ��n ��u quay v� h�u doanh!");
		end;
		PlayerIndex = nDeathIndex;
		return 1;
	end;
	--====================================================������ն������������������ɱ������
	PlayerIndex = nKillerIndex;
	BT_AddBattleActivity(BA_MAIN_KILL_PLAYER);
	BT_SetData(PTNC_SERIES_KILL,BT_GetData(PTNC_SERIES_KILL)+1);
	BT_SetData(PTNC_KILL,BT_GetData(PTNC_KILL)+1);
	local nSeriesKillPoint = floor(BT_GetData(PTNC_SERIES_KILL)/2);	--ÿ��ɱ��������ն�־ͼӣ�
	if BT_GetData(PTNC_SERIES_KILL) > BT_GetData(PT_BEST_SERIES_KILL) then	--�����ն����
		BT_SetData(PT_BEST_SERIES_KILL,BT_GetData(PTNC_SERIES_KILL));
	end;
	if BT_GetData(PTNC_KILL) > BT_GetData(PT_MAX_KILL) then	--���ɱ������
		BT_SetData(PT_MAX_KILL,BT_GetData(PTNC_KILL));
	end;
	PlayerIndex = nDeathIndex;
	if SERIES_KILL_OPEN ~= 1 then	--�����նû���Ͱ�nSeriesKillPoint��0
		nSeriesKillPoint = 0;
	end;
	nSeriesKillPoint = min(nSeriesKillPoint,2);	--��ն�����ֻ�ܵ�2
	--======================================================================�������
	PlayerIndex = nKillerIndex;
	BT_EmperorAward(tKillPlayerEAP[nDeathRank],1);	--����ɱ��һ�����ʵĻʵۼ���
	BT_AddPersonalPoint(nKillPoint+nSeriesKillPoint,0,1);	--����ɱ��һ���ĸ��˻���
	BT_SetData(PT_KILL_SONG_PLAYER+nDeathCamp-1,BT_GetData(PT_KILL_SONG_PLAYER+nDeathCamp-1)+1);
	Msg2Player("B�n �� gi�t"..tCampNameZ[nDeathCamp].."Ph��ng "..sDeathName.." phe T�ng, s� ��ch gi�t ���c: "..BT_GetData(PTNC_KILL)..", gi�t li�n t�c ���c:"..BT_GetData(PTNC_SERIES_KILL));
	PlayerIndex = nDeathIndex;
	Msg2Player("B�n b� "..sKillerName.." �� ti�u di�t:"..BT_GetData(PTNC_DEATH));
	BT_DecPersonalPoint(ceil(nKillPoint/3),1)	--�۵���ɱ�������˻���
	--Msg2MSAll(MISSION_ID,tCampNameZ[nKillerCamp].."��"..sKillerName.."ɱ����"..tCampNameZ[nDeathCamp].."��"..sDeathName);
	BT_SetData(PT_KILL_BY_SONG+nKillerCamp-1,BT_GetData(PT_KILL_BY_SONG+nKillerCamp-1)+1);
	if BT_GetTempData(PTT_LOCK) == 1 then	--��������ѱ�����
		return 0;
	end;
	--======================================================================��ѯ�Ƿ��ж���ĵ�������
	local nRoomIndex = check_room()
	if nRoomIndex == 0 then
		return 0;	--û�пշ���
	end;
	--======================================================================����ʣ�൥������
	PlayerIndex = nKillerIndex;
	if BT_GetTempData(PTT_LOCK) == 1 then	--���ɱ���ѱ�����
		PlayerIndex = nDeathIndex;
		return 0;
	end;
	--=======================================================================================
	PlayerIndex = nKillerIndex
	local nKillerRank = BT_GetCurRank();
	if nKillerRank == 0 then
		nKillerRank = 1;
	end;
	local nTransmitProbability = tFIGHTPROBABILITY[nKillerRank][nDeathRank];
	if random(1,100) <= nTransmitProbability then	--���ϴ��͸���
		PlayerIndex = nDeathIndex;
		SetFightState(0);
		SetPos(ENTRANCE_POINT[nCampPlace][2],ENTRANCE_POINT[nCampPlace][3]);
		BT_SetTempData(PTT_LOCK,1);	--��������
		WantTo1v1(nKillerIndex, "B�n b� "..sKillerName.." gi�t ch�t, mu�n tr� th� kh�ng? ��m ng��c %d gi�y", OPERATE_TIME, "\\script\\newbattles\\mainbattle_primary\\playerdeath.lua")
		PlayerIndex = nKillerIndex;
		Msg2Player("B�n �� gi�t"..sDeathName..", ��i ph��ng c� th� trong"..Get_Time_String(OPERATE_TIME).."Ph�t l�i khi�u chi�n v�i b�n, xin ch� �!");
		PlayerIndex = nDeathIndex;
		return 1;	--��������
	end;
	PlayerIndex = nDeathIndex;
	return 0;	
end
--���͵�������
function OnWant(nKillerIndex, nType)
	local nOldPlayerIndex = PlayerIndex;
	BT_SetTempData(PTT_LOCK,0);	--���߽ⶳ
	if BT_GetData(PTNC_SINGLE_LOSE) >= MAX_SINGLE_LOSE then
		Talk(1,"","S� l�n th�t b�i trong chi�n tr��ng ��n ��u: <color=yellow>"..MAX_SINGLE_LOSE.."<color> tr�n, �� duy tr� h�o kh� binh s�, ch� so�i ra l�nh h�y quy�n ��n ��u c�a b�n. ");
		return 0;
	end;
	local sDeathName = GetName();
	PlayerIndex = nKillerIndex;
	if BT_GetData(PTNC_SINGLE_LOSE) >= MAX_SINGLE_LOSE then
		Talk2SomeOne(nOldPlayerIndex,1,"","��i ph��ng -<color=yellow>"..GetName().."<color> chu�n b� ph�t �i khi�u chi�n th��");
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	PlayerIndex = nOldPlayerIndex;
	if nKillerIndex <= 0 then
		Talk(1,"","Khi�u chi�n kh�ng ���c ch�p nh�n, c� th� ��i ph��ng r�i m�ng ho�c r�i kh�i chi�n tr��ng.");
		return 0;
	end
	if nType == 0 then	--ѡ��ȡ���������ʱ
		PlayerIndex = nKillerIndex;
		Msg2Player("��i ph��ng qu� gi� ho�c h�y c� h�i khi�u chi�n.");
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","Hi�n kh�ng ���c ph�t tin t�c khi�u chi�n!");
		return 0;
	end;
	local nDeathIndex = PlayerIndex;
	local nRoomIndex = check_room();
	if nRoomIndex == 0 then
		Talk(1,"","Xin l�i! Khu v�c ��n ��u kh�ng ��");
		PlayerIndex = nOldPlayerIndex;
		return 0;	--û�пշ���
	end;
	PlayerIndex = nKillerIndex;
	if IsPlayerDeath() ~= 0 then	--ɱ��������״̬������жϿ���ȥ����
		PlayerIndex = nDeathIndex;
		Talk(1,"","��i ph��ng � tr�ng th�i t� vong, kh�ng th� ph�t l�i m�i khi�u chi�n.");
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	local sKillerName = GetName();
	if BT_GetTempData(PTT_LOCK) == 1 then	--���Ŀ����ұ�����
		PlayerIndex = nDeathIndex;
		Talk(1,"","��i ph��ng kh�ng th� nh�n l�i m�i khi�u chi�n c�a b�n.");
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	if BT_GetData(PT_BATTLE_TYPE) ~= BATTLE_TYPE then
		PlayerIndex = nDeathIndex;
		Talk(1,"","Kh�ng th� ph�t l�i m�i khi�u chi�n ��n ��i ph��ng, c� th� do �� r�i kh�i chi�n tr��ng.")
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	PlayerIndex = nKillerIndex
	BT_SetTempData(PTT_LOCK,1);	--����ɱ�֣�������Ϻ�Ӧ��0
	SetPlayerScript("\\script\\newbattles\\mainbattle_primary\\playerdeath.lua");
	Accept1v1(nDeathIndex, sDeathName.."khi�u chi�n v�i b�n, ��ng � kh�ng? N�u t� ch�i s� b� tr� 1 �t �i�m t�ch l�y. ��m ng��c %d gi�y", 10, "\\script\\newbattles\\mainbattle_primary\\playerdeath.lua")
	PlayerIndex = nOldPlayerIndex;
end;
--���ܵ���
function OnAccept(nDeathIndex,nType)
	BT_SetTempData(PTT_LOCK,0);	--ɱ�ֽⶳ
	if nDeathIndex <= 0 then
		Talk(1,"","Kh�ng th� tr� l�i do ��i ph��ng �� r�i m�ng ho�c r�i kh�i chi�n tr��ng.");
		return 0;
	end;
	local nOldPlayerIndex = PlayerIndex;
	local nRank = BT_GetCurRank();
	if nRank == 0 then
		nRank = 1;
	end;
	local nPoint = tKillPlayerPoint[nRank];
	if nType == 0 then	--ѡ��ȡ���������ʱ
		ignore();	--�����ӱ�����
		PlayerIndex = nDeathIndex;
		BT_SetTempData(PTT_LOCK,0);	--���߽ⶳ
		Talk(1,"","��i ph��ng qu� gi� ho�c ch�n h�y b�!");
		BT_AddPersonalPoint(2*nPoint,0,1);	--���߼Ӹ��˻���
		PlayerIndex = nOldPlayerIndex;
		BT_SetTempData(PTT_LOCK,0);	--ɱ�ֽⶳ
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","Hi�n kh�ng cho ph�p nh�n l�i m�i khi�u chi�n!");
		return 0;
	end;
	local nKillerIndex = PlayerIndex;
	local nRoomIndex = check_room();
	if nRoomIndex == 0 then
		PlayerIndex = nDeathIndex;
		Talk(1,"","Xin l�i! Khu v�c ��n ��u kh�ng ��");
		PlayerIndex = nKillerIndex;
		Talk(1,"","Xin l�i! Khu v�c ��n ��u kh�ng ��");
		PlayerIndex = nOldPlayerIndex;
		return 0;	--û�пշ���
	end;
	PlayerIndex = nDeathIndex;
	if BT_GetTempData(PTT_LOCK) == 1 then	--���Ŀ����ұ�����
		PlayerIndex = nKillerIndex;
		Talk(1,"","��i ph��ng kh�ng th� nh�n l�i m�i khi�u chi�n c�a b�n.");
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	if IsPlayerDeath() ~= 0 then	--����������״̬������жϿ���ȥ����
		PlayerIndex = nKillerIndex;
		Talk(1,"","��i ph��ng � tr�ng th�i t� vong, kh�ng th� tr� l�i.");
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	if BT_GetData(PT_BATTLE_TYPE) ~= BATTLE_TYPE then
		PlayerIndex = nKillerIndex;
		Talk(1,"","Kh�ng th� tr� l�i do ��i ph��ng �� r�i kh�i chi�n tr��ng.")
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	PlayerIndex = nKillerIndex;
	set_fight_camp(BT_GetCamp(),nRoomIndex,1);
	PlayerIndex = nDeathIndex;
	set_fight_camp(BT_GetCamp(),nRoomIndex,2);
	SetMissionV(MV_FIGHTING_ROOM1+nRoomIndex-1,ROOM_STATE_READY);	--������������0
	PlayerIndex = nOldPlayerIndex;
end;
--����Ƿ��пյĵ�������
function check_room()
	for i=1,4 do
		if GetMissionV(MV_FIGHTING_ROOM1+i-1) == ROOM_STATE_IDLE then
			return i;
		end;
	end;
	return 0;
end;

function ignore()
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local tbDecPoint = {1,10,10,15,20,30};	--�����ζ�Ӧ�Ŀ۳��ľ���
	local nRank = BT_GetCurRank();
	if nRank == 0 then
		nRank = 1;
	end;
	local nDecPoint = tbDecPoint[nRank];
	if nRank == 3 and BT_GetData(PT_WEEK_RANK) <= 100 then
		nDecPoint = 12;	--�߼���ͳ��12��
	end;
	local nCamp = BT_GetCamp();
	BT_DecPersonalPoint(nDecPoint,1);
	BT_SetData(PTNC_SINGLE_LOSE,BT_GetData(PTNC_SINGLE_LOSE)+1);
	BT_SetTempData(PTT_LOCK,0);
	Msg2MSAll(MISSION_ID,tCampNameZ[nCamp].."_T��ng s�"..GetName().."Ch�a chi�n �� r�t lui b� tr� m�t �t �i�m t�ch l�y c� nh�n"..nDecPoint.." �i�m");
end;

function set_fight_camp(nCamp,nRoomIndex,nPosIndex)
	local nRefugeeModel = {"N�n d�n T�ng","N�n d�n Li�u"};
	if BT_GetTempData(PTT_FOLLOWER) == 1 then
		local nRefugeeIndex = CreateNpc(nRefugeeModel[nCamp],tCampNameZ[nCamp].." _n�n d�n",GetWorldPos());
		SetNpcScript(nRefugeeIndex,"\\script\\newbattles\\mainbattle_primary\\refugee_talk_npc.lua");
	end;
	if IsPlayerDeath() ~= 0 then
		RevivePlayer(0);	--ԭ������
	end;
	KillFollower()	--�������
	BT_SetTempData(PTT_FOLLOWER,0);	--���뵥��ʱ����Ͷ���
	BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_READY);
	SetFightState(0);
	BT_SetTempData(PTT_LOCK,1);
	BT_SetTempData(PTT_ROOMINDEX,nRoomIndex);
	CreateTrigger(1,FIGHT_TIMER_ID,FIGHT_TRIGGER_ID);
	SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),15);
	ContinueTimer(GetTrigger(FIGHT_TRIGGER_ID));
	Restore();
	RestoreNeili();
	RemvoeTempEffect();	--���������ʱ״̬
	ClearColdDown();	--�������ҩCD
	CastState("imme_clear_skill_interval",-1,0);	--�������м��ܵ���ȴʱ��
	local nOffset = (nRoomIndex-1)*2+nCamp-1;
	SetMissionV(MV_FIGHTER_GROUP1_1+nOffset,PlayerIndex);
	Say("��n ��u sau <color=yellow>30 gi�y<color> s� b�t ��u!",0);
	Msg2Player("��n ��u sau 30 gi�y s� b�t ��u, ��i b�n h�y chu�n b�!");
	BT_SetTempData(PTT_LOCK,1);	--ɱ������
	SetPos(tFightRoom[nRoomIndex][nPosIndex][1],tFightRoom[nRoomIndex][nPosIndex][2]);
end;
