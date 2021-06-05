Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\kuafu_battle\\kf_define.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\tmp_task_id_def.lua")
Include("\\script\\online\\award_head.lua")
Include("\\script\\missions\\kuafu_battle\\runtime_data_stat.lua")

----ս�������˴���
--function KF_Battle_BMR()
--	local nVersion,nCurGs = GetRealmType();
--	if IsSubSystemOpen(SYS_SWITCH_KF_BATTLE) == 1 and SubWorldID2Idx(KF_NPC_POS[1]) ~= -1 and nCurGs ~= 0 then
--			local nNpcIndex = CreateNpc("ZM_jieyingren", "���ս��������", KF_NPC_POS[1], KF_NPC_POS[2], KF_NPC_POS[3]);
--			SetNpcScript(nNpcIndex, "\\script\\missions\\kuafu_battle\\npc\\kf_jieyinren.lua");
--	end
--end

--function KF_Battle_LJR()
--	local nVersion,nCurGs = GetRealmType();
--	if IsSubSystemOpen(SYS_SWITCH_KF_BATTLE) == 1 and SubWorldID2Idx(KF_NPC_POS_SRC[1]) ~= -1 and nCurGs == 0 then
--			local nNpcIndex = CreateNpc("ZM_jieyingren", "���ս���콱��", KF_NPC_POS_SRC[1], KF_NPC_POS_SRC[2], KF_NPC_POS_SRC[3]);
--			SetNpcScript(nNpcIndex, "\\script\\missions\\kuafu_battle\\npc\\kf_jieyinren.lua");
--	end
--end

--���ݻ�Ծ�ȼ���Index
function KF_Locate_Index(nActivity)
	if nActivity < 0 then return 1; end
	for i = 1, getn(KF_ACTIVITY_LEVEL) do
		if i ~= getn(KF_ACTIVITY_LEVEL) then
			if nActivity >= KF_ACTIVITY_LEVEL[i] and nActivity < KF_ACTIVITY_LEVEL[i+1] then
				return i;
			end
		else
			return i;
		end
	end	
end


--���㽱��
function KF_Calculate_Award()
	--���飬����������
	local tResult = {0, 0, {0, 0, 0, 0, ""}};
	--��ȡ���
	local nRet = KF_GetBattleRezult();
	local tAward = KF_BATTLE_AWARD[nRet];
	if not tAward then  return tResult; end
	--��ȡ��Ծ��
	local nActivity = KF_GetActivity();
	local nIndex = KF_Locate_Index(nActivity);
	local tSubAward = tAward[nIndex];
	if not tSubAward then return tResult; end
	local nExp = tSubAward[2][1] + tSubAward[2][2] * (nActivity - 10);
	local nExpAdd = (KF_EXP_EXT_RATE + 1)*(1 + GetVipCardParam())
	local nJunGongAdd = (1+KF_JUNGONG_EXT_RATE)
	return {nExp * nExpAdd, tSubAward[3] * nJunGongAdd, tSubAward[4]};
end

--������ȡ
function KF_GetAward(nKind)
	nKind = nKind or 0;
	local tRet;
	if nKind > 0 and nKind <= getn(KF_TMULTIPLE) then
		tRet = KF_TMULTIPLE[nKind];
	end
	if not tRet then return 0; end
	local tAward = KF_Calculate_Award();
	if tAward and tAward[1] == 0 and tAward[2] == 0 then
		return 0;
	end 
	if GetFreeItemRoom() < 4 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	local tJGZ = {
		[2] = {2, 1, 9999, "Qu�n C�ng Ch��ng"},
		[3] = {2, 1, 9998, "Qu�n C�ng ��i"},
		[4] = {2, 1, 9977, "Qu�n C�ng Huy Ho�ng"},
		[5] = {2, 1, 30642, "qu�n c�ng ch��ng vinh d� "},
	}
	if tJGZ[nKind] then
		if DelItem(tJGZ[nKind][1], tJGZ[nKind][2], tJGZ[nKind][3], 1) ~= 1 then
			Talk(1,"",format("H�nh trang kh�ng �� <color=green>%s<color>", tJGZ[nKind][4]));
			return 0;
		end
	end
	--������
	gf_Modify("Exp", tAward[1] * tRet[1]);
	gf_EventGiveCustomAward(31, tAward[2] * tRet[2], 1, KF_LOGTITEL, tRet[4]);
	KF_ParkAward(tAward[3][1], tAward[3][2])
	if tRet[3] and getn(tRet[3]) == 2 and tRet[3][2] > 0 then
		KF_ParkAward(tRet[3][1], tRet[3][2]);
	end
	
	local nActivity = KF_GetActivity();
	local nActivityLevel = KF_Locate_Index(nActivity);
	_stat_when_award(nKind-1, nActivityLevel)

	--�������һ���콱����
--	local nActivity = KF_GetActivity();
--	local nIndex = KF_Locate_Index(nActivity);
--	if gf_GetTaskBit(KF_BATTLE_TASK, 28) == 0 and (nIndex > 3 or nKind > 2) then
--		local nRet = KF_GetBattleRezult();
--		if nRet == 2 then
--			gf_AddItemEx2({2,1,30498,2}, "��ʿѫ��", KF_LOGTITEL, "��һ�콱���⽱��", 0, 1);
--			--��һ�α�־��
--			gf_SetTaskBit(KF_BATTLE_TASK, 28, 1, TASK_ACCESS_CODE_KF_BATTLE);
--		elseif nRet == 3 or nRet == 4 then
--			gf_AddItemEx2({2,1,30498,1}, "��ʿѫ��", KF_LOGTITEL, "��һ�콱���⽱��", 0, 1);
--			--��һ�α�־��
--			gf_SetTaskBit(KF_BATTLE_TASK, 28, 1, TASK_ACCESS_CODE_KF_BATTLE);
--		end
--	end	
	
	--�������ܻ����Ľ���
	aw_kfbattle_award(nKind-1);
	--���ֹ�ѫ
	local nRet = KF_GetBattleRezult();
	if nRet == 2 then
		merit_KfBattle(1, nKind - 1);
	elseif nRet == 3 then
		merit_KfBattle(0, nKind - 1);
	elseif nRet == 4 then
		merit_KfBattle(-1, nKind - 1);
	end
	
	--���ñ�Ǳ���
	KF_SetBattleRezult(0);
	KF_SetActivity(0);
end

--ս�����
function KF_SetBattleRezult(nValue)
	--1δ������2ʤ����3ʧ�ܣ�4ƽ��
	if nValue < 0 or nValue > 4 then
		return 0;
	end
	gf_SetMyTaskBit(KF_BATTLE_TASK, 29, 31, nValue, TASK_ACCESS_CODE_KF_BATTLE);
end

function KF_GetBattleRezult()
	return gf_GetMyTaskBit(KF_BATTLE_TASK, 29, 31);
end

--��Ծ��
function KF_SetActivity(nValue)
	if nValue < 0 or nValue > 2^11 - 1 then
		return 0;
	end
	--�ۼ��Լ�
	gf_SetMyTaskBit(KF_BATTLE_TASK, 6, 16, nValue, TASK_ACCESS_CODE_KF_BATTLE);
end

function KF_AddActivity(nValue, nCamp)
	local nActivity = KF_GetActivity();
	if nActivity + nValue < 0 or nActivity + nValue > 2^11 - 1 then
		print("UDERROR: KF_SetActivity nValue illegality");
		return 0;
	end
	--�ۼƵ�MISSION��ȥ
	if nCamp == nil then
		nCamp = KF_GetCamp();
	end
	if nCamp == CampOne_ID then
		SetMissionV(MV_BATTLE_SONG_ACTIVITY, GetMissionV(MV_BATTLE_SONG_ACTIVITY) + nValue);
	elseif nCamp == CampTwo_ID then
		SetMissionV(MV_BATTLE_LIAO_ACTIVITY, GetMissionV(MV_BATTLE_LIAO_ACTIVITY) + nValue);
	end
	--�ۼ��Լ�
	gf_SetMyTaskBit(KF_BATTLE_TASK, 6, 16, nActivity + nValue, TASK_ACCESS_CODE_KF_BATTLE);
	Msg2Player(format("�� t�ch c�c t�ng %d, �� t�ch c�c hi�n t�i l� %d", nValue, nActivity + nValue));
end

function KF_GetActivity()
	return gf_GetMyTaskBit(KF_BATTLE_TASK, 6, 16);
end

--�μӴ���
function KF_SetJoinTimes(nValue)
	if nValue < 0 or nValue > KF_JOIN_TIMES_MAX then
		print("UDERROR: KF_SetJoinTimes nValue < 0 or nValue > KF_JOIN_TIMES_MAX");
		return 0;
	end
	gf_SetTaskByte(KF_BATTLE_TASK, 3, nValue, TASK_ACCESS_CODE_KF_BATTLE);
end

function KF_GetJoinTimes()
	return gf_GetTaskByte(KF_BATTLE_TASK, 3);
end

--��Ӫ
function KF_SetCamp(nCamp)
	if nCamp ~= CampOne_ID and nCamp ~= CampTwo_ID then
		print("UDERROR: KF_SetCamp nCamp illegality");
		return 0;
	end
	gf_SetMyTaskBit(KF_BATTLE_TASK, 25, 26, nCamp, TASK_ACCESS_CODE_KF_BATTLE);
	return 1;
end

function KF_GetCamp()
	return gf_GetMyTaskBit(KF_BATTLE_TASK, 25, 26, TASK_ACCESS_CODE_KF_BATTLE);
end

--��������
function KF_AddScore(nValue, nCamp, f)
	if not nValue or nValue < 0 then return 0; end
	if SubWorld and SubWorld > 0 then
		if nCamp == nil then
			nCamp = KF_GetCamp();
			SetTaskTemp(TMP_TASK_KF_SCORE, GetTaskTemp(TMP_TASK_KF_SCORE) + nValue);
		end
	else --npcɱ��npc
		if nCamp == nil then	return 0;	end
		SubWorld = f
	end
	if nCamp == CampOne_ID then
		local  nScore = GetMissionV(MV_BATTLE_SONG_SCORE);
		SetMissionV(MV_BATTLE_SONG_SCORE, min(nScore + nValue, GetMissionV(KF_SCORE_MAX)));
	elseif nCamp == CampTwo_ID then
		local  nScore = GetMissionV(MV_BATTLE_LIAO_SCORE);
		SetMissionV(MV_BATTLE_LIAO_SCORE, min(nScore + nValue, GetMissionV(KF_SCORE_MAX)));
	end
	return 1;
end

--��û���
function KF_GetScore()
	local nCamp = KF_GetCamp();
	if nCamp == CampOne_ID then
		return GetMissionV(MV_BATTLE_SONG_SCORE);
	elseif nCamp == CampTwo_ID then
		return GetMissionV(MV_BATTLE_LIAO_SCORE);
	else
		return 0;
	end
end
--���������
function KF_Daily_Reset()
	--����μӴ���
	KF_SetJoinTimes(0);
	--�����һ���콱���
	gf_SetTaskBit(KF_BATTLE_TASK, 28, 0, TASK_ACCESS_CODE_KF_BATTLE);
end

--�ҵ����ʵ�MISSION
function KF_GetSuitMap(nPlayerNum)
	local tbMapID = gf_GetDataTable(GetSameMaps(KF_MAP_ID));
	local tbRetzult = {};
	for i =1, getn(tbMapID) do
		--���Ƕ�̬��ͼ�Ĳ�Ҫ
		if tbMapID[i] ~= KF_MAP_ID and 
			mf_GetMissionV(KF_MISSION_ID, MV_BATTLE_STATE, tbMapID[i]) == MS_STATE_PEACE and
			(mf_GetPlayerCount(KF_MISSION_ID, CampOne_ID, tbMapID[i]) + nPlayerNum <= PLAYER_MAX_NUM
			or mf_GetPlayerCount(KF_MISSION_ID, CampTwo_ID, tbMapID[i]) + nPlayerNum <= PLAYER_MAX_NUM) then
			--print("tinsert(tbRetzult, tbMapID[i]);",tbMapID[i])
			tinsert(tbRetzult, tbMapID[i]);
		end
	end
	if getn(tbRetzult) == 0 then
		return 0;
	end
	if getn(tbRetzult) ~= 1 then
		print("UDERROR: getn(tbRetzult) ~= 1");
	end
	return tbRetzult[1];
end

--��Ҽ���ս��
function KF_JoinBattle(nCamp)
	CleanInteractive();
	local nMapID = gf_GetCurMapID();
	if NewWorld(nMapID, JOIN_MISSION_POS[nCamp][1], JOIN_MISSION_POS[nCamp][2]) == 1 then
		Msg2MSAll(KF_MISSION_ID, GetName().." �� gia nh�p "..tCampName[nCamp]);
		Msg2Player("C�c h� �� gia nh�p r�i"..tCampName[nCamp]);
		KF_SetPlayerState(nCamp);
		AddMSPlayer(KF_MISSION_ID, nCamp);
		KF_SetCamp(nCamp);
		if GetItemCount(KF_ITEM_LINGPAI[nCamp][1], KF_ITEM_LINGPAI[nCamp][2], KF_ITEM_LINGPAI[nCamp][3]) < 1 then
			AddItem(KF_ITEM_LINGPAI[nCamp][1], KF_ITEM_LINGPAI[nCamp][2], KF_ITEM_LINGPAI[nCamp][3], 1);
			Msg2Player(format("B�n nh�n ���c %s",KF_ITEM_LINGPAI[nCamp][4]));
		end
		EnterChannel(KF_BATTLE_CHANNEL[ALL_ID][1]..nMapID);
		EnterChannel(KF_BATTLE_CHANNEL[nCamp][1]..nMapID);
		KF_SetJoinTimes(KF_GetJoinTimes() + 1);
		KF_SetBattleRezult(1);
		if gf_GetCaptainName() == GetName() then
			gf_SetMyTaskBit(KF_BATTLE_TASK, 1, 5, gf_GetMyTaskBit(KF_BATTLE_TASK, 1, 5) + gf_GetTeamSize(), TASK_ACCESS_CODE_KF_BATTLE);
			Pay(gf_GetTeamSize() * KF_ENTRY_FEE * 10000); --ʵ����������δ�۽�������ǿ��
		end
		return 1;
	else
		return 0;
	end;
end

--����״̬
function KF_SetPlayerState(nCamp)
	SetLogoutRV(1);	--���õ�½��Ϊ����������
	SetDeathPunish(0);	--�������ͷ�
	ForbitTrade(1);	--��ֹ����
	InteractiveEnable(0);	--�رս���
	StallEnable(0);	--��ֹ��̯(���ߺ�ᱻ���)
	UseScrollEnable(0);	--��ֹʹ�ûسǷ�
	ForbidChangePK(0);	--����ı�PK״̬
	SetPKFlag(1,nCamp);
	ForbidChangePK(1);	--��ֹ�ı�PK״̬
	SetFightState(0);
	KillFollower();	--ɾ������
	SetMomentumBoundSwitch(1);	--��������ɱ��ֵ
	SetDeathScript(PLAYER_DEATH_SCRIPT); --�����ű�
	SetCampToPlayer(tCampType[nCamp]); --������Ӫ
	local nMapID = GetWorldPos();
	SetTempRevPos(nMapID, JOIN_MISSION_POS[nCamp][1], JOIN_MISSION_POS[nCamp][2]);
	SetTaskTemp(TMP_TASK_KF_KILL_NUM, 0);
	SetTaskTemp(TMP_TASK_KF_SCORE, 0);
	DelNBWeapon();
	local nCurrMapId, nModelMapID = SubWorldIdx2ID(SubWorld);
	SetTempRevPos(nCurrMapId, JOIN_MISSION_POS[nCamp][1]*32, JOIN_MISSION_POS[nCamp][2]*32);
	SetCreateTeam(1);--��ӹر�
end

--����״̬
function KF_ResetPlayerState()
	SetLogoutRV(0);
	SetDeathPunish(1);
	InteractiveEnable(1);	
	UseScrollEnable(1);
	ForbidChangePK(0);	--����ı�PK״̬	
	SetPKFlag(0,0);	
	SetFightState(0);
	SetDeathScript("");
	SetTempRevPos(0,0,0);
	SetCampToPlayer("");
	KillFollower();	--ɾ������
	SetMomentumBoundSwitch(0);
	RemvoeTempEffect(); --���������ϵ�������ʱ״̬
	SetTaskTemp(TMP_TASK_KF_KILL_NUM, 0);
	SetTaskTemp(TMP_TASK_KF_SCORE, 0);
	--��ѩ��״̬
	RemoveState(9908);
	RemoveState(9909);
	RemoveState(9910);
	RemoveState(9911);
	RemvoeTempEffect();
	local nCamp = KF_GetCamp();
	local nMapID = gf_GetCurMapID();
	LeaveChannel(KF_BATTLE_CHANNEL[ALL_ID][1]..nMapID);
	LeaveChannel(KF_BATTLE_CHANNEL[nCamp][1]..nMapID);
	FloatMsg2Player();
	DelNBWeapon();
	SetTempRevPos(0,0,0)
	SetCreateTeam(0);--��Ӵ�
end

--�뿪ս����ǳ�������
function KF_LeaveBattle()
	local nCurMapId = GetWorldPos();
	KF_ResetPlayerState();
	local tCell = KF_OUT_POS[random(getn(KF_OUT_POS))];
	if 1 == NewWorld(tCell[1], tCell[2], tCell[3]) then
		local nCamp = KF_GetCamp();
		if nCamp ~= CampOne_ID and nCamp ~= CampTwo_ID then
			return 0;
		end
		if GetItemCount(KF_ITEM_LINGPAI[nCamp][1], KF_ITEM_LINGPAI[nCamp][2], KF_ITEM_LINGPAI[nCamp][3]) > 0 then
			DelItem(KF_ITEM_LINGPAI[nCamp][1], KF_ITEM_LINGPAI[nCamp][2], KF_ITEM_LINGPAI[nCamp][3], 1);
		end
		local nBattleState = mf_GetMissionV(KF_MISSION_ID, MV_BATTLE_STATE, nCurMapId);
		if nBattleState == MS_STATE_FIGHT then
			KF_SetBattleRezult(1);--��;�˳�
		end
		if nBattleState ~= MS_STATE_COMPLETE then
			Msg2MSAll(KF_MISSION_ID, tCampName[nCamp].."-"..GetName().."�� r�i kh�i chi�n tr��ng li�n ��u");
		end;		
	end
end

--��ʼ��ս������
function KF_InItBattle()
	SetMissionV(MV_BATTLE_TIMER_LOOP, PEACE_TIMER_LOOP); --�ȴ�ʱ���timer����
	StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, PEACE_TIME); --����timer
	SetMissionV(MV_BATTLE_STATE, MS_STATE_PEACE);		--���õ�ǰmission״̬
	SetMissionV(MV_BATTLE_GAME_FRAMETIME, GetGameLoop()); --��¼��Ϸ֡
end

--����ս��
function KF_RunBattle()
	Msg2MSAll(KF_MISSION_ID, "Th�m t� h�i b�o, phe ��ch �� b�t ��u h�nh ��ng, c�c h�o ki�t h�y nhanh ch�ng ti�n v�o ti�n tuy�n quy�t m�t tr�n t� chi�n v�i ��ch.");
	StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, FIGHT_TIME);
	SetMissionV(MV_BATTLE_TIMER_LOOP, FIGHT_TIMER_LOOP);
	SetMissionV(MV_BATTLE_STATE, MS_STATE_FIGHT);
	KF_OperateAllPlayer(KF_SetBattleRezult, 3, ALL_ID); --������ս��Ĭ����ʧ�ܵ�
end

--����ս��
function KF_EndBattle()
	local nPlayerOne = GetMSPlayerCount(KF_MISSION_ID, CampOne_ID);
	local nPlayerTwo = GetMSPlayerCount(KF_MISSION_ID, CampTwo_ID);	
	WriteLog("[Chi�n tr��ng li�n ��u k�t th�c]: th�i gian l�"..tostring(date()).."Chi�n tr��ng li�n ��u �� k�t th�c, s� ng��i cu�i c�ng l�: ["..nPlayerOne.."]:["..nPlayerTwo.."], t�ng s� ng��i l�: "..(nPlayerOne+nPlayerTwo)); 
	KF_ProcessBattleOver();
	--δ�ɹ�������ս��������������
	if GetMissionV(MV_BATTLE_IS_OPEN_SUCC) == MISSION_OPEN_FAIL_FLAG then
		local nMissionCount = GetMapTaskTemp(KF_MAP_TASK_TEMP_ID, KF_CURR_OPEN_COUNT);
		SetMapTaskTemp(KF_MAP_TASK_TEMP_ID ,KF_CURR_OPEN_COUNT, nMissionCount - 1);
	end
	local nMapID = GetMissionV(MV_BATTLE_MAP_ID);	
	ClearMapNpc(nMapID);
	local nMapIdx = GetMissionV(MV_BATTLE_MAP_INDEX);
	mf_ClearMissionData();
	local nRetCode = FreeDynamicMap(nMapID, nMapIdx);	--FreeDynamicMapҲ�����CloseMisssion
	if nRetCode ~= 1 then
		WriteLog("[Chi�n tr��ng li�n ��u]: FreeDynamicMap b�o l�i, nRetCode:"..nRetCode);
	end;		
	KF_DeleteChannel();
end

function KF_OpenBattleFail()
	--�ָ�һ������
	KF_SetBattleRezult(0);
	KF_SetActivity(0);
	KF_SetJoinTimes(KF_GetJoinTimes() - 1);
	if gf_GetCaptainName() == GetName() then
		local nCount = gf_GetMyTaskBit(KF_BATTLE_TASK, 1, 5) - gf_GetTeamSize();
		if nCount >= 0 then
			gf_SetMyTaskBit(KF_BATTLE_TASK, 1, 5, nCount, TASK_ACCESS_CODE_KF_BATTLE);
			Earn(gf_GetTeamSize() * KF_ENTRY_FEE * 10000); --ʵ����������δ����������ǿ��
		end
	end
end

--����ս������
function KF_ProcessBattleOver()
	local udFunc = function()
		--�ж�ʤ��
		local nWinner = GetMissionV(MV_BATTLE_WINNER);
		local nCamp = KF_GetCamp();
		if nWinner == nCamp then
			KF_SetBattleRezult(2); --ʤ��
		elseif nWinner == ALL_ID then
			if GetMissionV(MV_BATTLE_IS_OPEN_SUCC) == MISSION_OPEN_FAIL_FLAG then
				KF_OpenBattleFail();
			else
				KF_SetBattleRezult(4); --ƽ��
			end
		else
			KF_SetBattleRezult(3); --ʧ��
		end
		--
		DelMSPlayer(KF_MISSION_ID, nCamp);
	end
	KF_OperateAllPlayer(udFunc, {}, ALL_ID);
end

--��ʼ��ս��NPC����
function KF_CreateNpc()
	local nMapID = SubWorldIdx2ID(SubWorld);
	local npcIndex;
	--�Ի�NPC
	for i, npc in pairs(KF_TALK_NPC) do
		npcIndex = CreateNpc(npc[1], npc[2], nMapID, npc[3], npc[4]);
		SetNpcScript(npcIndex, npc[5]);
	end
	--����NPC
	for i, npc in pairs(KF_MONSTER_NPC) do
		npcIndex = CreateNpc(npc[1], npc[2], nMapID, npc[3], npc[4]);
		--���Ƕ���Ĭ�ϵ������ű�
		SetCampToNpc(npcIndex, Neutral_Type);
	end
	--����
	for i, npc in pairs(KF_FLAG_NPC) do
		npcIndex = CreateNpc(npc[1], npc[2], nMapID, npc[3], npc[4]);
		SetNpcDeathScript(npcIndex, npc[5]);
		SetCampToNpc(npcIndex, Neutral_Type);
	end
	
	--�˸�С��
	for i, npc in pairs(tPositionFo) do
		npcIndex = CreateNpc(npc[1], npc[2], nMapID, npc[3], npc[4]);
		if npcIndex <= 0 then
			print(format("create npc fail: [%s][%s][%d][%d][%d]",npc[1], npc[2], nMapID, npc[3], npc[4]))
		end
		SetCampToNpc(npcIndex,npc[5]);
	end
end

--��ʼ��ս��Ƶ��
function KF_CreateChannel()
	local nMapID = gf_GetCurMapID();
	for i, nChannel in pairs(KF_BATTLE_CHANNEL) do
		CreateChannel(nChannel[1]..nMapID, nChannel[2]);
	end
end

function KF_DeleteChannel()
	local nMapID = gf_GetCurMapID();
	for i, nChannel in pairs(KF_BATTLE_CHANNEL) do
		DeleteChannel(nChannel[1]..nMapID, nChannel[2]);
	end
end

--��Mission��ĳһ��Ӫ��ҽ���ͳһ����
--ʹ�÷������ȶ���һ��ִ�к���������������������Ϊһtable��
--Ȼ������������Ϊ��һ�����������OP_AllMSPlayer������
--ͨ����table�ķ�ʽ���Դ����������ִ�к�����
function KF_OperateAllPlayer(ufunc, tArg, nCamp)
	local OldPlayerIndex = PlayerIndex;
	local IDTab = mf_GetMSPlayerIndex(KF_MISSION_ID, nCamp);
	local nPlayerCount = getn(IDTab);
	for i = 1, nPlayerCount do
		PlayerIndex = IDTab[i];
		if PlayerIndex > 0 then
			ufunc(tArg);
		else
			Write_Log("[Chi�n tr��ng li�n ��u]","KF_OperateAllPlayer(), ng��i ch�i ti�p d�n nh� h�n ho�c b�ng 0");
		end;
	end
	PlayerIndex = OldPlayerIndex;
end;

--����ս�����
function KF_SetRezultToPlayer(nWinner)
	if not nWinner then return 0; end
	if type(nWinner) == "table" then
		if getn(nWinner) < 1 then
			return 0;
		end
		if nWinner[1] ~= GetMissionV(MV_BATTLE_WINNER) then
			return 0;
		end
	end
	local nCamp = KF_GetCamp();
	local tMissionV = {
		[CampOne_ID] = MV_BATTLE_SONG_SCORE,
		[CampTwo_ID] = MV_BATTLE_LIAO_SCORE,	
	}
	if nWinner[1] == nCamp then
		KF_SetBattleRezult(2);
	elseif nWinner[1] == ALL_ID then
		KF_SetBattleRezult(4);
	else
		KF_SetBattleRezult(3);
	end
	if nWinner[1] == ALL_ID then
		Talk(1, "", format("K�t th�c chi�n tr��ng, hai b�n b�t ph�n th�ng b�i, h�y ch� r�i kh�i chi�n tr��ng!\n%s phe ta ���c t�ng t�ch l�y <color=green>%d<color>\nC�ng hi�n t� t�ch �i�m c� nh�n <color=green>%d<color>\n�� t�ch c�c c� nh�n <color=green>%d<color>", 
			 tCampName[nCamp], GetMissionV(MV_BATTLE_LIAO_SCORE), GetTaskTemp(TMP_TASK_KF_SCORE), KF_GetActivity()));
	else
		Talk(1, "", format("K�t th�c chi�n tr��ng, %s gi�nh chi�n th�ng, h�y ch� r�i kh�i chi�n tr��ng!\n%s phe ta ���c t�ng t�ch l�y<color=green>%d<color>\nC�ng hi�n t� t�ch �i�m c� nh�n <color=green>%d<color>\n�� t�ch c�c c� nh�n <color=green>%d<color>",
			 tCampName[nWinner[1]], tCampName[nCamp], GetMissionV(tMissionV[nCamp]), GetTaskTemp(TMP_TASK_KF_SCORE), KF_GetActivity()));
	end
end

function KF_KickSleep()
	local nCamp = KF_GetCamp();
	if IsSleeping() == 1 then
		Talk(1,"","K� th� tr��c m�t v�y m� d�m ng� g�t, ng��i ��u l�i ra cho ta!");
		LeaveTeam();
		DelMSPlayer(KF_MISSION_ID, nCamp);
		Msg2MSAll(KF_MISSION_ID, GetName().."R�i kh�i chi�n tr��ng.");
		return 1;
	end;
	return 0;
end

function KF_KickDeather()
	if IsPlayerDeath() == 1 then
		local nLeftLoop = tonumber(GetTime()) - GetTaskTemp(TMP_TASK_KF_TIME)
		local nCamp = KF_GetCamp();
		if nLeftLoop >= 60 and GetTaskTemp(TMP_TASK_KF_TIME) ~= 0 then --60s
			LeaveTeam();
			DelMSPlayer(KF_MISSION_ID, nCamp);
			Msg2MSAll(KF_MISSION_ID, GetName().."R�i kh�i chi�n tr��ng.");
		end
		return 1;
	else
		SetTaskTemp(TMP_TASK_KF_TIME, 0);
	end;
	return 0;
end

--ˢ4��ʿ��
function KF_CreateShiBing(nKind, nCamp)
	local tNpcTable = KF_SHIBINF_NPC[nKind]
	if not tNpcTable then return 0;  end
	if nCamp ~= CampOne_ID and nCamp ~= CampTwo_ID then
		return 0;
	end
	local tNeedNpcTable = tNpcTable[nCamp];
	if not tNeedNpcTable then return 0; end
	local npcIndex;
	local nMapID = SubWorldIdx2ID(SubWorld);
	for i, npcInfo in pairs(tNeedNpcTable) do
		npcIndex = CreateNpc(npcInfo[1], npcInfo[2], nMapID, npcInfo[3], npcInfo[4]);
		SetNpcScript(npcIndex, npcInfo[5]);
		SetCampToNpc(npcIndex, tCampType[nCamp]);
	end
end

function KF_CreateZhenqi(nKind, id, f, x)
	local tNpcList = KF_FLAG_NPCLIST[nKind];
	if not tNpcList then return 0; end
	local nMap, nX, nY = GetNpcWorldPos(id);
	if 0 == f then --���ɱ��NPC
		local  nCamp = KF_GetCamp();
		local npcIndex = CreateNpc(tNpcList[nCamp][1], tNpcList[nCamp][2], nMap, nX, nY);
		SetNpcScript(npcIndex, tNpcList[nCamp][3]);
		SetCampToNpc(npcIndex, tCampType[nCamp]);
		Msg2MSAll(KF_MISSION_ID, format("%s, anh h�ng %s, �� chi�m %s.", tCampName[nCamp], GetName(), tNpcList[0][2]));
		--�������
		SetMissionV(tNpcList[nCamp][4], nCamp);
		KF_AddScore(KF_SCORE_ZHENQI, nCamp);
		KF_AddActivity(KF_ACTIVITY_ZHENQI, nCamp);
		KF_CreateShiBing(nKind, nCamp);
		
		_stat_when_kill_flag()
	elseif x and x > 0 then --NPCɱNPC
		local szCampName = GetNpcCampName(x);
		local tMap = {
			["camp_player"] = CampOne_ID,
			["camp_enemy"] = CampTwo_ID,
		}
		if tMap[szCampName] then
			local npcIndex = CreateNpc(tNpcList[tMap[szCampName]][1], tNpcList[tMap[szCampName]][2], nMap, nX, nY);
			SetNpcScript(npcIndex, tNpcList[tMap[szCampName]][3]);
			SetCampToNpc(npcIndex, tCampType[tMap[szCampName]]);
			Msg2MSAll(KF_MISSION_ID, format("%s chi�m th�nh c�ng %s.", tCampName[tMap[szCampName]], tNpcList[0][2]));
			--�������
			--mf_SetMissionV(KF_MISSION_ID, tNpcList[tMap[szCampName]][4], tMap[szCampName], GetMissionV(MV_BATTLE_MAP_ID));
			SubWorld = f; -- npcɱ��npc��ʱ��ű�PlayerIndexû�У�SubWorldΪ-1
			SetMissionV(tNpcList[tMap[szCampName]][4], tMap[szCampName]);
			KF_AddScore(KF_SCORE_ZHENQI, tMap[szCampName]);
			--npcɱnpc�����ۼӵ���Ծ����ȥû��PlayerInde
			--KF_AddActivity(KF_ACTIVITY_ZHENQI, tMap[szCampName]);
			KF_CreateShiBing(nKind, tMap[szCampName]);
		else
			local npcIndex = CreateNpc(tNpcList[ALL_ID][1], tNpcList[ALL_ID][2], nMap, nX, nY);
			SetNpcScript(npcIndex, tNpcList[ALL_ID][3]);
			SetCampToNpc(npcIndex, tCampType[ALL_ID]);
			Msg2MSAll(KF_MISSION_ID, format("Phe trung l�p �� chi�m %s.", tNpcList[0][2]));
			SetMissionV(tNpcList[ALL_ID][4], ALL_ID);		
		end
	end
end

--��ǲ���ܵ�TABLE
--bTag = 0���ȷ�
--bTag = 1�ɶ�ξ
function KF_GetSayTale(nCamp, nKind, bTag)
	local tRet = {};
	if not bTag then return tRet; end
	local tTemp = {
		{MV_BATTLE_FLAG_JM, "Ph�i ��n C�nh M�n"},
		{MV_BATTLE_FLAG_MM, "Ph�i ��n Di�t M�n"},
		{MV_BATTLE_FLAG_SM, "Ph�i ��n Sinh M�n"},
		{MV_BATTLE_FLAG_SI, "Ph�i ��n T� M�n"},
		{MV_BATTLE_FLAG_DA, "Ph�i ��n ��i Tr�n K�"},	
	}
	local strFunc = {
		[1] = "/#KF_Order_XianFeng(%d)",
		[2] = "/#KF_Order_Duwei(%d)",
	}
	if nKind ~= 1 and nKind ~= 2 then return 0; end
	for i = 1, getn(tTemp) do
		if bTag == 0 then
			tinsert(tRet, tTemp[i][2]..format(strFunc[nKind], i));
		elseif bTag == 1 then
			if GetMissionV(tTemp[i][1]) == nCamp then
				tinsert(tRet, tTemp[i][2]..format(strFunc[nKind], i));
			end
		end
	end
	tinsert(tRet, "Ra kh�i/nothing");
	return tRet;
end

--��ȡ�ȷ�CDʱ��
function KF_GetXianfengCD()
	local nCamp = KF_GetCamp();
	local tMissionV = {
		[CampOne_ID] = {MV_BATTLE_XIANFENG_TAG_SONG, MV_BATTLE_XIANFENG_DEATHTIME_SONG},
		[CampTwo_ID] = {MV_BATTLE_XIANFENG_TAG_LIAO, MV_BATTLE_XIANFENG_DEATHTIME_LIAO},
	}
	local nTag = GetMissionV(tMissionV[nCamp][1]);
	if nTag == 0 then --δ��ǲ
		return 0;
	elseif nTag == 1 then --����ǲ
		return KF_ORDER_XF_CD;
	elseif nTag == 2 then
		local nDeathTime = GetMissionV(tMissionV[nCamp][2]);
		local nSpaceTime = GetTime() - nDeathTime;
		if nSpaceTime >= KF_ORDER_XF_CD then
			SetMissionV(tMissionV[nCamp][1], 0);
			return 0;
		else
			return min(KF_ORDER_XF_CD - nSpaceTime, KF_ORDER_XF_CD);
		end
	end
end

--��ȡ��ξCDʱ��
function KF_GetDuWeiCD()
	local nCamp = KF_GetCamp();
	local tMissionV = {
		[CampOne_ID] = {MV_BATTLE_DUWEI_TAG_SONG, MV_BATTLE_DUWEI_DEATHTIME_SONG},
		[CampTwo_ID] = {MV_BATTLE_DUWEI_TAG_LIAO, MV_BATTLE_DUWEI_DEATHTIME_LIAO},
	}
	local nTag = GetMissionV(tMissionV[nCamp][1]);
	if nTag == 0 then --δ��ǲ
		return 0;
	elseif nTag == 1 then --����ǲ
		return KF_ORDER_DW_CD;
	elseif nTag == 2 then --������
		local nDeathTime = GetMissionV(tMissionV[nCamp][2]);
		local nSpaceTime = GetTime() - nDeathTime;
		if nSpaceTime >= KF_ORDER_DW_CD then
			SetMissionV(tMissionV[nCamp][1], 0);
			return 0;
		else
			return min(KF_ORDER_DW_CD - nSpaceTime, KF_ORDER_DW_CD);
		end
	end
end

function KF_Order_XianFeng(nWhich)
	if KF_GetXianfengCD() ~= 0 then
		Talk(1,"","Ch�c n�ng tri�u g�i v�n c�n �ang trong th�i gian ch� h�i ph�c, t�m th�i kh�ng th� tri�u g�i!");
		return 0;
	end
	local tPos = KF_ORDER_POS[nWhich];
	if not tPos then return 0;  end
	local nMapID = GetWorldPos();
	local nCamp = KF_GetCamp();
	local tNpc = {
		[CampOne_ID] = {"KFZC_songxianfeng", "T�ng Ti�n Phong", "\\script\\missions\\kuafu_battle\\npc\\death_xianfeng_song.lua", MV_BATTLE_XIANFENG_TAG_SONG},
		[CampTwo_ID] = {"KFZC_liaoxianfeng", "Li�u Ti�n Phong", "\\script\\missions\\kuafu_battle\\npc\\death_xianfeng_liao.lua", MV_BATTLE_XIANFENG_TAG_LIAO},	
	}
	local npcIndex = CreateNpc(tNpc[nCamp][1], tNpc[nCamp][2], nMapID, tPos[1], tPos[2]);
	SetNpcDeathScript(npcIndex, tNpc[nCamp][3]);
	SetCampToNpc(npcIndex, tCampType[nCamp]);
	KF_CreateShiBing(nWhich, nCamp);
	SetMissionV(tNpc[nCamp][4], 1);
	Msg2MSAll(KF_MISSION_ID, format("%s (Nguy�n So�i/T��ng Qu�n): %s Ti�n Phong ph�ng m�nh ��t k�ch %s.", GetName(), tCampName[nCamp], tPos[3]));
end

function KF_Order_Duwei(nWhich)
	if KF_GetDuWeiCD() ~= 0 then
		Talk(1,"","Ch�c n�ng tri�u g�i v�n c�n �ang trong th�i gian ch� h�i ph�c, t�m th�i kh�ng th� tri�u g�i!");
		return 0;
	end
	local tPos = KF_ORDER_POS[nWhich];
	if not tPos then return 0;  end
	local nMapID = GetWorldPos();
	local nCamp = KF_GetCamp();
	local tNpc = {
		[CampOne_ID] = {"KFZC_songdutong", "T�ng �� Th�ng", "\\script\\missions\\kuafu_battle\\npc\\death_duwei_song.lua", MV_BATTLE_DUWEI_TAG_SONG},
		[CampTwo_ID] = {"KFZC_liaodutong", "Li�u �� Th�ng", "\\script\\missions\\kuafu_battle\\npc\\death_duwei_liao.lua", MV_BATTLE_DUWEI_TAG_LIAO},	
	}
	local npcIndex = CreateNpc(tNpc[nCamp][1], tNpc[nCamp][2], nMapID, tPos[1], tPos[2]);
	SetNpcDeathScript(npcIndex, tNpc[nCamp][3]);
	SetCampToNpc(npcIndex, tCampType[nCamp]);
	KF_CreateShiBing(nWhich, nCamp);
	SetMissionV(tNpc[nCamp][4], 1);
	Msg2MSAll(KF_MISSION_ID, format("%s (Nguy�n So�i/T��ng Qu�n): %s �� �y ph�ng m�nh ��t k�ch %s.", GetName(), tCampName[nCamp], tPos[3]));
end

--��������
function KF_CreateJiangJun()
	local nMapID = GetMissionV(MV_BATTLE_MAP_ID);
	local npcIndex = CreateNpc("KFZC_songjiangjun", "T�ng T��ng Qu�n", nMapID, 1660, 3671);
	SetNpcDeathScript(npcIndex, "\\script\\missions\\kuafu_battle\\npc\\death_song_jiangjun.lua");
	SetCampToNpc(npcIndex, tCampType[CampOne_ID]);
	KF_CreateShiBing(6, CampOne_ID);
	npcIndex = CreateNpc("KFZC_liaojiangjun", "Li�u T��ng Qu�n", nMapID, 1823, 3373);
	SetNpcDeathScript(npcIndex, "\\script\\missions\\kuafu_battle\\npc\\death_liao_jiangjun.lua");
	SetCampToNpc(npcIndex, tCampType[CampTwo_ID]);
	KF_CreateShiBing(6, CampTwo_ID);
	SetMissionV(MV_BATTLE_JIANGJUN_TAG, 1);
	Msg2MSAll(KF_MISSION_ID, "Chi�n tr�n hi�n t�i v� c�ng kh�c li�t, T��ng Qu�n 2 phe �� th�ng l�nh s� binh x�ng tr�n quy�t chi�n.");
end

--Ұ��BOSS��BUFF�Ļ���
function KF_GiveMonsterBuff(nValue)
	if not nValue then return 0;  end
	local nKind = 1;
	if type(nValue) == "table" then
		nKind = nValue[1];
	else
		nKind = nValue;
	end
	if nKind < 1 or nKind > getn(KF_TSTATEMAGICATTR) then
		print("UDERROR:KF_GiveMonsterBuff nValue illegality");
		return 0;
	end
	local tMagic = KF_TSTATEMAGICATTR[nKind];
	if not tMagic then return 0; end
	local msg = "";
	for i = 1, getn(tMagic) do
		CastState(tMagic[i][1], tMagic[i][2], tMagic[i][3], 1, tMagic[i][4], 1);
		msg = msg..format(tMagic[i][6], tMagic[i][2]);
		if i ~= getn(tMagic) then
			msg = msg..","
		end
	end
	SyncCustomState(1, tMagic[1][4], tMagic[1][5], msg);
	Msg2Player("C�c h� nh�n ���c hi�u qu� h� tr� sau khi ti�u di�t qu�i tr�n chi�n tr��ng:"..msg);
end

function KF_Add_XueHenBuff()
	local nKillNum = gf_GetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 3, 4);
	local nKilledNum = gf_GetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 1, 2);
	local nKillDistance = nKilledNum - nKillNum;
	local nTbIdx = 0;
	if nKillDistance > 0 then
		for i = 1,getn(KF_XUEHEN) do
			if nKillDistance >= KF_XUEHEN[i][1] then
				nTbIdx = i;
				break;
			end
		end
	end
	--����ѩ��״̬�ټ�
	RemoveState(9908);
	RemoveState(9909);
	RemoveState(9910);
	RemoveState(9911);
	if nTbIdx ~= 0 then
		CastState("state_p_attack_percent_add",KF_XUEHEN[nTbIdx][2],2*60*18,1,9908,1); --�⹥����
		CastState("state_m_attack_percent_add",KF_XUEHEN[nTbIdx][2],2*60*18,1,9909,1);	--�ڹ�����
		CastState("state_life_max_percent_add",KF_XUEHEN[nTbIdx][3],2*60*18,1,9910,1);		--��������
		CastState("state_buff_resist",KF_XUEHEN[nTbIdx][4],2*60*18,1,9911,1);					--���߸���״̬
		SyncCustomState(1,9908,1,KF_XUEHEN[nTbIdx][5]);
		Msg2Player("B�n nh�n ���c "..KF_XUEHEN[nTbIdx][5].."Hi�u qu�: "..format(KF_XUEHEN[nTbIdx][6], KF_XUEHEN[nTbIdx][2], KF_XUEHEN[nTbIdx][3], KF_XUEHEN[nTbIdx][4]).."Duy tr� 2 ph�t.");
		if nTbIdx <= 9 then
			SetCurrentNpcSFX(PIdx2NpcIdx(), 921,1,0,18*3);
		end
	end
end

--ɱ��������
function KF_KillPaiMing()
	for nCamp = 1, 2 do
		local tKiller = {};
		local OldPlayerIndex = PlayerIndex;
		local IDTab = mf_GetMSPlayerIndex(KF_MISSION_ID, nCamp);
		local nPlayerCount = getn(IDTab);
		for i = 1, nPlayerCount do
			PlayerIndex = IDTab[i];
			if PlayerIndex > 0 then
				tKiller[i] = {gf_GetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 3, 4),GetName()};
			end;
		end
		PlayerIndex = OldPlayerIndex;
		SORT_COUNT_MAX = 3; 
		if getn(tKiller) >= SORT_COUNT_MAX then
			local _sort = function(tTable1, tTable2)
				if tTable1[1] > tTable2[1] then
					return 1;
				else
					return nil;
				end
			end
			sort(tKiller, _sort);
			local msg = format("X�p h�ng cao th� %s: ",tCampName[nCamp]);
			for j = 1, SORT_COUNT_MAX do
				msg = msg..format("%s(%d)", tKiller[j][2], tKiller[j][1]);
				if j ~= SORT_COUNT_MAX then
					msg = msg..","
				end
			end
			Msg2MSAll(KF_MISSION_ID, msg);
		end
	end
end

function KF_GetZhenQiNum(nCamp)
	if nCamp ~= CampOne_ID and nCamp ~= CampTwo_ID then
		return 0;
	end
	local tTemp = {
		MV_BATTLE_FLAG_JM, --����0������1�Σ�2��
		MV_BATTLE_FLAG_MM, --����0������1�Σ�2��
		MV_BATTLE_FLAG_SM,	--����0������1�Σ�2��
		MV_BATTLE_FLAG_SI,	--����0������1�Σ�2��
		MV_BATTLE_FLAG_DA,	--����0������1�Σ�2��
	}
	local nCount = 0;
	for i = 1, getn(tTemp) do
		if GetMissionV(tTemp[i]) == nCamp then
			nCount = nCount + 1;
		end
	end
	return nCount;
end

function KF_MsgZhenQiState()
	local tMsg = {
		[0] = "Trung l�p",
		[1] = "Qu�n T�ng",
		[2] = "Qu�n Li�u",	
	}
	Msg2MSAll(KF_MISSION_ID, format("Tr�n k� chi�m l�nh: C�nh M�n (%s), Di�t M�n (%s), Sinh M�n (%s), T� M�n (%s), ��i Tr�n K� (%s).", 
		tMsg[GetMissionV(MV_BATTLE_FLAG_JM)], tMsg[GetMissionV(MV_BATTLE_FLAG_MM)], tMsg[GetMissionV(MV_BATTLE_FLAG_SM)], 
		tMsg[GetMissionV(MV_BATTLE_FLAG_SI)], tMsg[GetMissionV(MV_BATTLE_FLAG_DA)]));
end

function KF_ParkAward(nKind, nCount)
	local tTemp = {
		KF_PARK_AWARD_PT,
		KF_PARK_AWARD_GJ,
		KF_PARK_AWARD_JY,
	}
	local tTempAdd = {
		KF_PARK_AWARD_PT_ADD,
		KF_PARK_AWARD_GJ_ADD,
		KF_PARK_AWARD_JY_ADD,
	}
	local tAward = tTemp[nKind];
	local tAwardAdd = tTempAdd[nKind];
	if not tAward or not tAwardAdd then
		return 0;
	end
	if GetFreeItemRoom() < 2 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	for i = 1, nCount do
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, KF_LOGTITEL, KF_LOGTITEL);
		
		gf_EventGiveAllAward(tAwardAdd, KF_LOGTITEL, KF_LOGTITEL);
	end
end

--�������������
function KF_RevivePlayer()
	local nMapID, nX, nY = GetWorldPos();
	local nCamp = KF_GetCamp();
	SetTempRevPos(nMapID, JOIN_MISSION_POS[nCamp][1]*32, JOIN_MISSION_POS[nCamp][2]*32);
	SetFightState(0);
end

--ǰ��ʿ������
function KF_TransmitPlayer(nPos, nX, nY)
	local tTemp = {
		MV_BATTLE_FLAG_JM, --����0������1�Σ�2��
		MV_BATTLE_FLAG_MM, --����0������1�Σ�2��
		MV_BATTLE_FLAG_SM,	--����0������1�Σ�2��
		MV_BATTLE_FLAG_SI,	--����0������1�Σ�2��
		MV_BATTLE_FLAG_DA,	--����0������1�Σ�2��
	}
	local nCamp = KF_GetCamp();
	if nPos > 0 and nPos <= getn(tTemp) then
		local nCurrFlagCamp = GetMissionV(tTemp[nPos]);
		if nCurrFlagCamp == ALL_ID then
			Talk(1,"","Tr�n K� trung l�p kh�ng th� d�ch chuy�n");
			return 0;
		end
		if nCurrFlagCamp ~= nCamp then
			Talk(1,"",format("Tr�n K� �� b� %s chi�m, d�ch chuy�n th�t b�i.", tCampName[GetMissionV(tTemp[nPos])]))
			return 0;
		end
	end
	CastState("state_dispear",100,18*3)
	SetPos(nX, nY);
	KF_Add_XueHenBuff();
	Restore();
	RestoreNeili();
	SetFightState(1);
	Msg2Player("Khai chi�n n�o!");
end

--��ʱ�ӻ��㴫��
function KF_SafeTransmitPlayer(nIndex)
	local nCamp = KF_GetCamp();
	if nCamp ~= CampOne_ID and nCamp ~= CampTwo_ID then
		return 0;
	end
	local tPos = KF_TEMP_SAFE_POS[nCamp]
	if not tPos then
		return 0
	end
	if nIndex <= 0 or nIndex > getn(tPos) then
		return 0;
	end
	CastState("state_dispear",100,18*3)
	SetPos(tPos[nIndex][1], tPos[nIndex][2]);
	KF_Add_XueHenBuff();
	Restore();
	RestoreNeili();
	SetFightState(1);
	Msg2Player("Khai chi�n n�o!");
end

--FloatMsg2Player
function KF_FloatMsg2PlayerToAll()
	local uMsg2Player = function ()
		local sMsg = format("�i�m t�ch l�y ��t ��n %d b�n th�ng: \n T�ng %d: Li�u %d\n s� l�n chi�m l�nh:\n T�ng %d: Li�u %d\n nh�n s�:\n T�ng %d: Li�u %d\n s� ng��i ti�u di�t:%d\n s� l�n b� ti�u di�t:%d", 
			GetMissionV(KF_SCORE_MAX), 
			GetMissionV(MV_BATTLE_SONG_SCORE), GetMissionV(MV_BATTLE_LIAO_SCORE), KF_GetZhenQiNum(CampOne_ID), KF_GetZhenQiNum(CampTwo_ID),
			GetMSPlayerCount(KF_MISSION_ID,CampOne_ID), GetMSPlayerCount(KF_MISSION_ID,CampTwo_ID),
			gf_GetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 3, 4), gf_GetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 1, 2));
		FloatMsg2Player(sMsg);
	end
	KF_OperateAllPlayer(uMsg2Player, {}, ALL_ID);
end

function KF_ReviveRestoreAll()
	local uRestoreAll = function ()
		if gf_GetTaskBit(KF_BATTLE_TASK, 27) == 1 then
			RestoreAll();
			gf_SetTaskBit(KF_BATTLE_TASK, 27, 0, TASK_ACCESS_CODE_KF_BATTLE);
		end
	end
	KF_OperateAllPlayer(uRestoreAll, {}, ALL_ID);
end

function KF_GetNBWeapon()
	local nRoute = GetPlayerRoute();
	local tWeapon = KF_NB_WEAPON_TABLE[nRoute];
	if not tWeapon or getn(tWeapon) ~= 14 then  return 0;  end
	if GetFreeItemRoom() < 1 then
		Msg2Player("H�nh trang ��y, kh�ng th� nh�n V� Kh� Cam +15.")
		return 0;
	end
	local nRet, nItemIndex
	if BigGetItemCount(tWeapon[1],tWeapon[2],tWeapon[3]) < 1 then
		nRet, nItemIndex = AddItem(tWeapon[1],tWeapon[2],tWeapon[3],tWeapon[4],tWeapon[5],
				tWeapon[6],tWeapon[7],tWeapon[8],tWeapon[9],tWeapon[10],tWeapon[11],tWeapon[12],tWeapon[13])
		if nRet == 1 then
			SetItemExpireTime(nItemIndex, KF_WEAPON_EXIST_TIME);
			--HeadMsg2Player(format("����<color=gold>%s<color>", tWeapon[14]));
		end
	end
end

function DelNBWeapon()
	local nRoute = GetPlayerRoute();
	local tWeapon = KF_NB_WEAPON_TABLE[nRoute];
	if not tWeapon or getn(tWeapon) ~= 14 then  return 0;  end
	if BigGetItemCount(tWeapon[1],tWeapon[2],tWeapon[3]) > 0 then
		BigDelItem(tWeapon[1],tWeapon[2],tWeapon[3], BigGetItemCount(tWeapon[1],tWeapon[2],tWeapon[3]));
	end
end

--���Դ����Ҫִ�еĿ۽���
function KF_PlayerLoginOriginServer()
	--�ⶫ���Ƿ���
	if IsSubSystemOpen(SYS_SWITCH_KF_BATTLE) ~= 1 then
		return 0;
	end	
	--�۽����
	local nCount = gf_GetMyTaskBit(KF_BATTLE_TASK, 1, 5);
	if nCount > 0 then
		if Pay(nCount * KF_ENTRY_FEE * 10000) == 1 then
			gf_SetMyTaskBit(KF_BATTLE_TASK, 1, 5, 0, TASK_ACCESS_CODE_KF_BATTLE);
		end	
	end
end