Include("\\settings\\static_script\\kf_newbattles\\mainbattle\\mainbattle_head.lua");

SZ_BF_CHEAT_OP_SCRIPT = "\\settings\\static_script\\kf_newbattles\\mainbattle\\anti_cheat\\player_cheat_op.lua"

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
	{000,000, 000, 000, 000, 000},
	{000,000, 000, 000, 000, 000},
	{000,000, 010, 007, 004, 001},
	{000,000, 007, 010, 007, 004},
	{000,000, 004, 007, 010, 007},
	{000,000, 001, 004, 007, 010},
}

function OnDeath(Launcher)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
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
	local nRoomIndex = BT_GetTempData(PTT_ROOMINDEX);
	local nDanTiaoIdx1 = GetMissionV(MV_FIGHTER_GROUP1_1+(nRoomIndex-1)*2);
	local nDanTiaoIdx2 = GetMissionV(MV_FIGHTER_GROUP1_1+(nRoomIndex-1)*2+1);
	local tPlayer = {nDanTiaoIdx1,nDanTiaoIdx2};
	local nDeathRank = abs(BT_GetData(PT_CURRANK));
	if nDeathRank == 0 then
		nDeathRank = 1;
	end;
	local nKillPoint = tKillPlayerPoint[nDeathRank];
	BT_SetTempData(PTT_DIE_LOOP,GetMissionV(MV_TIMER_LOOP));
	BT_AddBattleActivity(BA_MAIN_DEATH);
	--=====================================================================����������
	local nCampPlace = nDeathCamp;
	SetMissionV(MV_DEATH_COUNT_SONG+nDeathCamp-1,GetMissionV(MV_DEATH_COUNT_SONG+nDeathCamp-1)+1);
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	SetTempRevPos(ENTRANCE_POINT[nCampPlace][1],ENTRANCE_POINT[nCampPlace][2]*32,ENTRANCE_POINT[nCampPlace][3]*32);	--����������
	--======================================================================��������
	local nRefugeeModel = {"N�n d�n T�ng","N�n d�n Li�u"};
	local nRefugeeName = {"N�n d�n T�ng","N�n d�n Li�u"};
	if BT_GetTempData(PTT_FOLLOWER) == 1 then
		local nRefugeeIndex = CreateNpc(nRefugeeModel[nDeathCamp],nRefugeeName[nDeathCamp],GetWorldPos());
		SetNpcScript(nRefugeeIndex,"\\settings\\static_script\\kf_newbattles\\mainbattle\\refugee_talk_npc.lua");
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
	--======================================================================
	local nBattleState = GetMissionV(MV_BATTLE_STATE);
	if nBattleState ~= MS_STATE_FIGHT then	--�ǿ�ս״̬����
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
			nCampPlace = nPlayerCamp;
			if GetGlbValue(RANDOM_PLACE) == 1 then
				nCampPlace = 3 - nCampPlace;
			end;
			RemoveTrigger(GetTrigger(FIGHT_TRIGGER_ID));
			SetFightState(0);
			Restore();
			RestoreNeili();
--			ClearColdDown();	--�������ҩCD
			CastState("imme_clear_skill_interval",7,0);	--�������м��ܵ���ȴʱ��			
			BT_SetTempData(PTT_LOCK,0);	--����
			if PlayerIndex ~= nDeathIndex then	--������������Ǹ�
				BT_SetData(PT_SINGLE_WIN,BT_GetData(PT_SINGLE_WIN)+1);
				SetRankPoint(RANK_SINGLE_FIGHT,BATTLE_OFFSET+PT_SINGLE_WIN,0);
				BT_EmperorAward(3);	--����ʤ���У����Ļ����ûʵۼν�
				BT_AddPersonalPoint(2*nKillPoint);	--����ɱ��һ����˫�����˻���
				--BT_AddMissionPoint(BT_GetCamp(),2*nKillPoint);		--����ɱ�ַ�һ���Ĺ�������
				Msg2MSAll(MISSION_ID,GetName().." c��i ng�a gi�t ��ch "..sDeathName.." l�p ���c c�ng l�n, th��ng �i�m t�ch l�y"..(2*nKillPoint).." �i�m");
				Say("B�n �� gi�nh th�ng l�i trong ��t ��n ��u n�y!",0);
			else
				BT_SetData(PT_SINGLE_LOSE,BT_GetData(PT_SINGLE_LOSE)+1);
				BT_DecPersonalPoint(2*ceil(nKillPoint/3))	--�۵���ɱ����2/3����Ӧ���˻���
				Say("B�n �� thua trong l�n ��n ��u n�y, c� g�ng h�n nh�!",0);
			end;
			SetPos(ENTRANCE_POINT[nCampPlace][2],ENTRANCE_POINT[nCampPlace][3]);
			Msg2Player("T� chi�n tr��ng ��n ��u quay v� h�u doanh!");
		end;
		PlayerIndex = nDeathIndex;
		return 1;
	end;
	
	local bInTaskArea = BT_GetTempData(PTT_IN_TASK_AREA)
	if 1 == bInTaskArea then --�ڷ���������ɱ��
		local szName = GetName()
		PlayerIndex = nKillerIndex; --�ͷ�ɱ��
		--local nPunish = 1
		--BT_DecPersonalPoint(nPunish)
		Msg2Player(format("Ng��i �� ti�u di�t nh�n vi�n d� b� c�a ��i ph��ng[%s], kh�ng ���c nh�n th��ng chi�n tr��ng", szName))
		PlayerIndex = nDeathIndex;
		return 0
	end
		
	--====================================================������ն������������������ɱ������
	PlayerIndex = nKillerIndex;
	
	--�ڷ�������ɱ���ˣ�Ҳ�ò�������
	if 1 == BT_GetTempData(PTT_IN_TASK_AREA) then
		PlayerIndex = nDeathIndex;
		return 0
	end
	
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
	BT_SetData(PTNC_SERIES_KILL,0);
	BT_SetData(PTNC_DEATH,BT_GetData(PTNC_DEATH)+1);
	if BT_GetData(PTNC_DEATH) > BT_GetData(PT_MAX_DEATH) then
		BT_SetData(PT_MAX_DEATH,BT_GetData(PTNC_DEATH));
	end;
	if SERIES_KILL_OPEN ~= 1 then	--�����նû���Ͱ�nSeriesKillPoint��0
		nSeriesKillPoint = 0;
	end;
	--======================================================================�������
	PlayerIndex = nKillerIndex;
	
	--ɱ����
	local szScript = format("pcd_on_kill()")
	SetPlayerScript(SZ_BF_CHEAT_OP_SCRIPT);
	SendScript2VM(SZ_BF_CHEAT_OP_SCRIPT,szScript);
	
	BT_EmperorAward(tKillPlayerEAP[nDeathRank]);	--����ɱ��һ�����ʵĻʵۼ���
	BT_AddPersonalPoint(nKillPoint+nSeriesKillPoint);	--����ɱ��һ���ĸ��˻���
	BT_AddMissionPoint(BT_GetCamp(),nKillPoint+nSeriesKillPoint);		--����ɱ�ַ�һ���Ĺ�������
	BT_SetData(PT_KILL_SONG_PLAYER+nDeathCamp-1,BT_GetData(PT_KILL_SONG_PLAYER+nDeathCamp-1)+1);
	if nDeathCamp == SONG_ID then
		Msg2Player("B�n �� ��nh b�i "..sDeathName.." phe T�ng, s� ��ch gi�t ���c: "..BT_GetData(PTNC_KILL)..", gi�t li�n t�c ���c:"..BT_GetData(PTNC_SERIES_KILL));
	else
		Msg2Player("B�n �� ��nh b�i "..sDeathName.." phe T�ng, s� ��ch gi�t ���c: "..BT_GetData(PTNC_KILL)..", gi�t li�n t�c ���c:"..BT_GetData(PTNC_SERIES_KILL));
	end;
	
	PlayerIndex = nDeathIndex;
	
	--��ɱ��
	local szScript = format("pcd_on_death()")
	SetPlayerScript(SZ_BF_CHEAT_OP_SCRIPT);
	SendScript2VM(SZ_BF_CHEAT_OP_SCRIPT,szScript);
	
	BT_DecPersonalPoint(ceil(nKillPoint/3))	--�۵���ɱ�������˻���
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
	local nKillerRank = abs(BT_GetData(PT_CURRANK));
	if nKillerRank == 0 then
		nKillerRank = 1;
	end;
	local nTransmitProbability = tFIGHTPROBABILITY[nKillerRank][nDeathRank];
	if random(1,100) <= nTransmitProbability then	--���ϴ��͸���
		PlayerIndex = nDeathIndex;
		SetFightState(0);
		SetPos(ENTRANCE_POINT[nCampPlace][2],ENTRANCE_POINT[nCampPlace][3]);
		BT_SetTempData(PTT_LOCK,1);	--��������
		WantTo1v1(nKillerIndex, "B�n b� "..sKillerName.." gi�t ch�t, mu�n tr� th� kh�ng? ��m ng��c %d gi�y", OPERATE_TIME, "\\settings\\static_script\\kf_newbattles\\mainbattle\\playerdeath.lua")
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
	local sDeathName = GetName();
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
	SetPlayerScript("\\settings\\static_script\\kf_newbattles\\mainbattle\\playerdeath.lua");
	Accept1v1(nDeathIndex, sDeathName.."khi�u chi�n v�i b�n, ��ng � kh�ng? N�u t� ch�i s� b� tr� 1 �t �i�m t�ch l�y. ��m ng��c %d gi�y", OPERATE_TIME, "\\settings\\static_script\\kf_newbattles\\mainbattle\\playerdeath.lua")
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
	local nRank = abs(BT_GetData(PT_CURRANK));
	if nRank == 0 then
		nRank = 1;
	end;
	local nPoint = tKillPlayerPoint[nRank];
	if nType == 0 then	--ѡ��ȡ���������ʱ
		ignore();	--�����ӱ�����
		PlayerIndex = nDeathIndex;
		BT_SetTempData(PTT_LOCK,0);	--���߽ⶳ
		Talk(1,"","��i ph��ng qu� gi� ho�c ch�n h�y b�!");
		BT_AddPersonalPoint(2*nPoint);	--���߼Ӹ��˻���
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
	local nRank = abs(BT_GetData(PT_CURRANK));
	if nRank == 0 then
		nRank = 1;
	end;
	local nDecPoint = tKillPlayerPoint[nRank];
	local nCamp = BT_GetCamp();
	BT_DecPersonalPoint(2*ceil(nDecPoint/3))
	if nCamp == SONG_ID then
		Msg2MSAll(MISSION_ID,"T�ng t��ng s�"..GetName().."Ch�a chi�n �� r�t lui b� tr� m�t �t �i�m t�ch l�y c� nh�n"..(2*ceil(nDecPoint/3)).." �i�m");
	else
		Msg2MSAll(MISSION_ID,"Li�u t��ng s�"..GetName().."Ch�a chi�n �� r�t lui b� tr� m�t �t �i�m t�ch l�y c� nh�n"..(2*ceil(nDecPoint/3)).." �i�m");
	end;
	BT_SetTempData(PTT_LOCK,0);
end;

function set_fight_camp(nCamp,nRoomIndex,nPosIndex)
	local nRefugeeModel = {"N�n d�n T�ng","N�n d�n Li�u"};
	local nRefugeeName = {"N�n d�n T�ng","N�n d�n Li�u"};
	if BT_GetTempData(PTT_FOLLOWER) == 1 then
		local nRefugeeIndex = CreateNpc(nRefugeeModel[nCamp],nRefugeeName[nCamp],GetWorldPos());
		SetNpcScript(nRefugeeIndex,"\\settings\\static_script\\kf_newbattles\\mainbattle\\refugee_talk_npc.lua");
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
--	ClearColdDown();	--�������ҩCD
	CastState("imme_clear_skill_interval",7,0);	--�������м��ܵ���ȴʱ��
	local nOffset = (nRoomIndex-1)*2+nCamp-1;
	SetMissionV(MV_FIGHTER_GROUP1_1+nOffset,PlayerIndex);
	Say("��n ��u sau <color=yellow>30 gi�y<color> s� b�t ��u!",0);
	Msg2Player("��n ��u sau 30 gi�y s� b�t ��u, ��i b�n h�y chu�n b�!");
	BT_SetTempData(PTT_LOCK,1);	--ɱ������
	SetPos(tFightRoom[nRoomIndex][nPosIndex][1],tFightRoom[nRoomIndex][nPosIndex][2]);
end;
