--Create date:2008-1-9 15:09
--Author:yanjun
--Description:Mission�����غ���
Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
--Mission����==============================================================================
--��ʼ��Mission
function MS_InitMission()
	BWT_InitFieldNpc();
	BWT_ChangeMSState(MS_STATE_CHECK_EQUIPMENT);
	local nMSUID = MS_CreateMSUID();	--����һ��MissionΨһID
	SetMissionV(MV_MISSION_UID,nMSUID);
	SetMissionS(MS_MISSION_STRING,"C�m Th� Th�n ph�");	--����÷�̫���
	WriteLog("["..LOG_HEAD.."]: Tr�n Mission b�t ��u, MSUID l�: "..nMSUID);
end;
--Mission��ʼ
function MS_StartMission()
	local nPIdx1 = GetMissionV(MV_PLAYERINDEX1);
	local nPIdx2 = GetMissionV(MV_PLAYERINDEX2);
	local nPos1 = BWT_SetRandomPos(nPIdx1,nil);
	BWT_SetRandomPos(nPIdx2, nPos1);
	BWT_ChangeMSState(MS_STATE_STARTED);
	Talk2SomeOne(nPIdx1,1,"","T� v� ch�nh th�c b�t ��u!");
	Talk2SomeOne(nPIdx2,1,"","T� v� ch�nh th�c b�t ��u!");
	Msg2MSAll(MISSION_ID,"T� v� ch�nh th�c b�t ��u!");
end;
--Mission����
function MS_EndMission()
	local nMSUID = GetMissionV(MV_MISSION_UID);
	local nMapID = GetMissionV(MV_MAPID);
	local nMapIdx = GetMissionV(MV_MAPIDX);
	mf_DelAllMSPlayer(MISSION_ID,CAMP_ALL);	--��Mission����ɾ�����е����
	BWT_ChangeMSState(MS_STATE_IDEL);
	mf_ClearMissionData();
	ClearMapNpc(nMapID);
	FreeDynamicMap(nMapID,nMapIdx);
	WriteLog("["..LOG_HEAD.."]: Tr�n Mission k�t th�c, MSUID l�:"..nMSUID);
end;
--�뿪Mission
function MS_LeaveMission()
	local nOldIdx = PlayerIndex;
	local nCamp = GetTaskTemp(TSK_TEMP_CAMP);
	local nState = GetMissionV(MV_MISSION_STATE);
	if (nCamp == A_CAMP or nCamp == B_CAMP) and (nState ~= MS_STATE_ENDING) then	--�����ѡ���˳�
		local szName = BWT_GetName();
		local nOppIdx = BWT_GetOpponentIndex();
		local szOppName = BWT_GetName(nOppIdx);
		BWT_ChangeMSState(MS_STATE_ENDING);
		Msg2MSAll(MISSION_ID,szName.." r�i kh�i tr�n ��u,"..szOppName.." chi�n th�ng � tr�n so t�i n�y");
		BWT_ReportResult(nOppIdx,PlayerIndex);
	end;
	PlayerIndex = nOldIdx;
	local nCityID = GetMissionV(MV_CITY_ID);
	local nOutMapID = TB_MAPID[nCityID][1];
	local nDirection = random(1,getn(TB_EXIT));
	MS_RestorePlayerState(1);

	NewWorld(nOutMapID,TB_EXIT[nDirection][2],TB_EXIT[nDirection][3]);
end;
--����Mission
function MS_JoinMission(nCamp)
	CleanInteractive();
	MS_SetPlayerState(nCamp);
	AddMSPlayer(MISSION_ID,nCamp);
end;

function MS_ProcessCheckEquipmentTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nOldPIdx = PlayerIndex;
	local nPIdx1 = GetMissionV(MV_PLAYERINDEX1);
	local nPIdx2 = GetMissionV(MV_PLAYERINDEX2);
	local tbPIdx = {nPIdx1,nPIdx2};
	local nMapID = gf_GetCurMapID();
	local szHint = "";
	local nOldPIdx = PlayerIndex;
	if nLoop == 0 then
		local nCheckRetCode1 = BWT_CheckEquipment(nPIdx1);
		local nCheckRetCode2 = BWT_CheckEquipment(nPIdx2);
		if nCheckRetCode1 == 0 and nCheckRetCode2 == 0 then	--˫����û�����·�
			for i=1,getn(tbPIdx) do
				PlayerIndex = tbPIdx[i];
				Talk(1,"","Hai b�n ��u ch�a m�c xong y ph�c, ��u h�a, tr� <color=yellow>1<color> �i�m so t�i.");
				BWT_AddPoint(-1);
			end;
			PlayerIndex = nOldPIdx;
			BWT_ChangeMSState(MS_STATE_ENDING);
			return 0;
		end;
		if nCheckRetCode1 == 0 then	--1��ѡ��û�����·�
			Msg2MSAll(MISSION_ID,"Do "..BWT_GetName(nPIdx1).." trong th�i gian quy ��nh ch�a m�c xong trang b�, "..BWT_GetName(nPIdx2).." chi�n th�ng tr�n so t�i n�y");
			BWT_ReportResult(nPIdx2,nPIdx1);
			BWT_ChangeMSState(MS_STATE_ENDING);
			PlayerIndex = nOldPIdx;
			return 0;
		end;
		if nCheckRetCode2 == 0 then	--2��ѡ��û�����·�
			Msg2MSAll(MISSION_ID,"Do "..BWT_GetName(nPIdx2).." trong th�i gian quy ��nh ch�a m�c xong trang b�, "..BWT_GetName(nPIdx1).." chi�n th�ng tr�n so t�i n�y");
			BWT_ReportResult(nPIdx1,nPIdx2);
			BWT_ChangeMSState(MS_STATE_ENDING);
			PlayerIndex = nOldPIdx;
			return 0;
		end;
		PlayerIndex = nOldPIdx;
		BWT_SetPlayerFightState(1,nPIdx1);
		BWT_SetPlayerFightState(2,nPIdx2);
--		Msg2MSAll(MISSION_ID,"װ�����ʱ���������������׼��ʱ�䡣");
		Talk2SomeOne(nPIdx1,1,"","L�u ph�i ��i th� l� <color=yellow>"..BWT_GetPlayerRouteName(nPIdx2).."<color>. Ti�p theo l� th�i gian chu�n b�.");
		Talk2SomeOne(nPIdx2,1,"","L�u ph�i ��i th� l� <color=yellow>"..BWT_GetPlayerRouteName(nPIdx1).."<color>. Ti�p theo l� th�i gian chu�n b�.");
		Msg2SomeOne(nPIdx1,"L�u ph�i ��i th� l� :"..BWT_GetPlayerRouteName(nPIdx2)..". Ti�p theo l� th�i gian chu�n b�.");
		Msg2SomeOne(nPIdx2,"L�u ph�i ��i th� l� :"..BWT_GetPlayerRouteName(nPIdx1)..". Ti�p theo l� th�i gian chu�n b�.");
		--SetTask(1429, 1);--�ı�ɲ������л������̵�״̬
		BWT_ChangeMSState(MS_STATE_READY);
	else
		local nCheckRetCode,tbEquip = 0,{};
		for i=1,getn(tbPIdx) do
			nCheckRetCode,tbEquip = BWT_CheckEquipment(tbPIdx[i]);
			szHint = "";
			if nCheckRetCode == 0 then
				for i=1,getn(tbEquip) do
					if tbEquip[i] ~= 1 then
						szHint = szHint.."<color=yellow>"..TB_EquipPosName[i].."<color> v�o,";
					end;
				end;
				Talk2SomeOne(tbPIdx[i],1,"","Trang b� kh�ng ph� h�p quy ��nh t� v� l�"..szHint.."H�y ki�m tra trang b� c�a b�n.");
			end;
		end;
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		--Msg2MSAll(MISSION_ID,"��װ������������"..tf_GetTimeString(nLoop*CHECK_EQUIPMENT_TIMER_INTERVAL*60).."�������˫���������Լ����ϵ�װ���Ƿ���ϱ���涨");
	end;
end;
--����׼���׶εļ�ʱ������
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"Th�i gian chu�n b� k�t th�c c�n "..tf_GetTimeString(nLoop*READY_TIMER_INTERVAL*60)..", m�i c�c tuy�n th� chu�n b�");
	end;
end;
--����Mission��ʼ��ļ�ʱ������
function MS_ProcessStartedTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nDrawState = 0;
	local nPIdx1 = GetMissionV(MV_PLAYERINDEX1);
	local nPIdx2 = GetMissionV(MV_PLAYERINDEX2);
	if nLoop == 0 then
		BWT_ChangeMSState(MS_STATE_ENDING);
		nDrawState = BWT_GetDrawState(nPIdx1,nPIdx2);
		if nDrawState == 0 then
			BWT_ReportResult(nPIdx1,nPIdx2,1);
		elseif nDrawState == 1 then
			BWT_ReportResult(nPIdx1,nPIdx2);
		elseif nDrawState == 2 then
			BWT_ReportResult(nPIdx2,nPIdx1);
		end;
		Msg2MSAll(MISSION_ID,"K�t th�c so t�i! C�c ng��i s� ���c tho�t ra trong ch�c l�t.");
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"Th�i gian k�t th�c t� v� c�n "..tf_GetTimeString(nLoop*STARTED_TIMER_INTERVAL*60));
	end;
end;
--����ȴ������ļ�ʱ������
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		BWT_CloseField();
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"H�n l� s�p k�t th�c, ch� c�n"..tf_GetTimeString(nLoop*ENDING_TIMER_INTERVAL*60));
	end;
end;
--��½����������
function OnLogin()
	MS_RestorePlayerState(0);
	WriteLog("["..LOG_HEAD.."]: Ng��i ch�i "..GetName().." R�i Mission kh�ng b�nh th��ng, �ang trong qu� tr�nh x� l� ��ng nh�p.");
end;
--=====================================================================================
--����һ��MSUID����ǰMissionΨһ��ʶ��
function MS_CreateMSUID()
	local nMSUID = GetTime();
	return nMSUID;
end;
--���볡��ʱͳһ���еĲ���
function MS_SetPlayerState(nCamp)
	local nCityID = GetMissionV(MV_CITY_ID);
	local nDirection = GetMissionV(MV_FIELD_DIRECTION);
	local nFieldNum = GetMissionV(MV_FIELD_NUM);
	local tbDirection = {"H��ng ��ng","H��ng nam","H��ng T�y","H��ng B�c"};
	local nMapID = gf_GetCurMapID();
	local szTips = "";
	BWT_WeeklyClear();
	BWT_ClearTempTask();
	SetTaskTemp(TSK_TEMP_CAMP,nCamp);
	LeaveTeam();	--�뿪����
	SetLogoutRV(1);	--���õ�½��Ϊ����������
	CreateTrigger(3,LOG_ID,LOG_CUSTOM_ID);
	SetFightState(0);	--��ƽ״̬
	UseScrollEnable(0);	--��ֹʹ�ûسǷ�
	ForbitTrade(1);	--��ֹ����
	StallEnable(0);	--��ֹ��̯
	OpenFriendliness(0);	--�����Ӻøж�
	SetDeathPunish(0);	--�������ͷ�
	InteractiveEnable(0);	--��ֹ����
	UseDummy(0,1);	--��������Ч��
	ForbitLevelUp(1);	--��ֹ����
	ForbitAddProp(1);	--��ֹ����Ǳ�ܵ�
	ForbidChangePK(0);	--����ת��PK״̬��������˴�ʱ���д裬�ǲ���ת��PK״̬�ģ�����������ָ����������ת��PK״̬��
	UseSkillEnable(0);	--��ֹ�书
	KillFollower();		--ɾ������NPC
	if IsPlayerDeath() == 1 then
		RevivePlayer(0);
	end;
	SetPlayerRestrictions(0,1);	--������Ʒʹ��
	if nCamp == AUDIENCE_CAMP then
		SetPKFlag(0,0);	--PK״̬
		DesaltPlayer(1,0);
		NewWorld(nMapID,TB_ENTRY[2][1],TB_ENTRY[2][2]);
	else
		NewWorld(nMapID,TB_ENTRY[3][nCamp][1],TB_ENTRY[3][nCamp][2]);
		SetDeathScript(DEATH_SCRIPT);
		SetPKFlag(1,nCamp);	--PK״̬
		gf_ForbidFactionSkill(1);
		BlockSkill(19);	--���δ���
		SetCurTitle(0,0);
		SetPlayerRestrictions(2,1);	--���óƺ�������Ч
		SetLockCurTitle(0);	--���ɸ����ƺ�
		SetPlayerRestrictions(1,1);	--����ĳЩװ���ϵ�����
		ResetToPlayerDamage();
		RemvoeTempEffect();	--���������ʱ״̬
		ClearColdDown();	--�������ҩCD
		--RemoveRevivals();	--�������
		Restore();
		RestoreNeili();
--		local nUseMask = GetMaskStatus();
--		UseMask(nUseMask,0);	--ǿ����ʾ����
		RemoveState(9900);	--������н��»���״̬
		ClearStolenSkill();	--�����͵ȡ�ļ��ܣ���Թ���
		CastState("imme_clear_skill_interval",-1,0);	--�������м��ܵ���ȴʱ��
		SetMissionV(MV_PLAYERINDEX1-1+nCamp,PlayerIndex);	--��¼��ҵ�����
		SetMissionS(MS_PLAYERNAME1-1+nCamp,GetName());
		if UNCOMPLETED_VERSION ~= 1  then
			BWT_QuitGestConvention();	--�˳�����б�
		end;
		BWT_RemoveNonlicetState();
		szTips = " <color=yellow>Mau ch�ng m�c trang b� ph� h�p tr��c khi k�t th�c th�i gian chu�n b�, n�u kh�ng s� l� m�t tr�n ��u.<color>";
	end;
	ForbidChangePK(1);	--��ֹת��PK״̬
	if GetPlayerFaction() ~= 6 then --�������Ų�������
		ForbidRiding(1);
	end
--	local szString = "�������"..TB_MAPID[nCityID][3]..tbDirection[nDirection]..nFieldNum.."�ų��ء�";
--	Msg2Player(szString);
--	Say(szString..szTips,0);
end;
--�뿪����ʱͳһ���еĲ���
--bUseMask:����ѡ���Ƿ�Ҫ��������ˡ�1�ǣ�0��
function MS_RestorePlayerState(bUseMask)
	bUseMask = bUseMask or 1;
	local nCamp = GetTaskTemp(TSK_TEMP_CAMP);
	local nTime = GetTime();
	SetLogoutRV(1);
	RemoveTrigger(GetTrigger(LOG_CUSTOM_ID));
	LeaveTeam();	--�뿪����
	SetFightState(0);	--��ƽ״̬
	SetDeathScript("");	--��������ű�
	SetTempRevPos(0,0,0);	--ɾ����ʱ������
	ForbidChangePK(0);	--����ת��PK״̬
	SetPKFlag(0,0);	--��PK״̬
	local nVersion,nCurGs = GetRealmType();
	if nCurGs ~= 1 then
		ForbitTrade(0);	--������
		StallEnable(1);	--�����̯
	end
	OpenFriendliness(1);	--�����Ӻøж�
	SetDeathPunish(1);	--�������ͷ�
	InteractiveEnable(1);	--������
	SetLockCurTitle(1);	--�ɸ����ƺ�
	SetPlayerRestrictions(0,0);
	SetPlayerRestrictions(1,0);
	SetPlayerRestrictions(2,0);
	DesaltPlayer(0,0);
	ForbitLevelUp(0);
	ForbitAddProp(0);
	UseSkillEnable(1);
	ForbidRiding(0);
	--SetTask(1429, 0);--�ı�ɿ����л������̵�״̬
--	UseMask(bUseMask,0);	--ǿ�Ʊ�������
	if nCamp ~= AUDIENCE_CAMP then	--����Ǳ���ѡ��
		BWDH_SetTask(TSK_ALLOW_AUDIENCE,1);	--�����ս
		SetMissionV(MV_PLAYERINDEX1-1+nCamp,0);
		RestoreAll();
		ClearColdDown();	--�������ҩCD
		CastState("imme_clear_skill_interval",-1,0);	--�������м��ܵ���ȴʱ��
		ResetToPlayerDamage();
		BWDH_SetTask(TSK_LAST_INVITE_TIME,nTime-floor(INVITE_INTERVAL_TIME/2));	--����������CD����һ��
		gf_ForbidFactionSkill(0);
		UnBlockSkill(19);	--�������
		local nTimesLeft = GetTask(TSK_JOIN_LIST_TYPE);
		if nTimesLeft > 1 then	--ֻ�μ�nTimesLeft�ε�
			BWT_JoinGestConvention();	--��������б�
			BWDH_SetTask(TSK_JOIN_LIST_TYPE,nTimesLeft-1);
		elseif nTimesLeft == -1 then	--һֱ�μӵ�
			BWT_JoinGestConvention();	--��������б�
		end;
		local nCurWeekMatch = GetTask(TSK_CURWEEKMATCH);
		if nCurWeekMatch == REQUIRE_MATCH_TIME then
			gf_ShowMsg("Tu�n n�y ng��i �� tham gia "..REQUIRE_MATCH_TIME.."Khu v�c t� v�, h� th�ng �� gi�p b�n t� ��ng ��ng k� t�ch �i�m.\n<color=red> sau n�y m�i khi ti�n h�nh t� v� h� th�ng s� gi�p b�n t� ��ng ��ng k�!<color>");
		end;
	end;
	BWT_ClearTempTask();
	BWT_LockEquipment(0);
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 then
		ForbidChangePK(1);
	end
end;

