--��������
Include("\\settings\\static_script\\kf_newbattles\\head.lua")
Include("\\script\\lib\\time.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\award_head.lua")

THIS_FILE_NAME = "\\settings\\static_script\\kf_newbattles\\functions.lua";

function BT_SetData(nTaskID, nValue)
	SetTask(nTaskID + BATTLE_OFFSET, nValue)
end

function BT_GetData(nTaskID)
	return GetTask(nTaskID + BATTLE_OFFSET)
end
--�õ������ս���е���Ӫ
function BT_GetCamp()
	local nSignUpInfo = BT_GetData(PT_SIGN_UP);
	if nSignUpInfo == 0 then
		return 0;
	end;
	if mod(nSignUpInfo,10) == 1 then
		return SONG_ID;
	else
		return LIAO_ID;
	end;
end;
--�õ���Ҳμӵ�ս��ID
function BT_GetBattleType()
	local nSignUpInfo = BT_GetData(PT_SIGN_UP);
	if nSignUpInfo == 0 then
		return 0;
	end;
	return floor(nSignUpInfo/10);
end;
--��������������������֣�Ĭ��Ϊ��ǰ�������
function BT_GetName(nIndex)
	if nIndex == nil then
		nIndex = PlayerIndex;
	end;
	local nOldPlayer = PlayerIndex
	PlayerIndex = nIndex
	local sName = GetName()
	PlayerIndex = nOldPlayer
	return sName
end
--������ʱ����
function BT_SetTempData(nTaskID, nValue)
	SetTaskTemp(nTaskID, nValue)
end
--��ȡ��ʱ����
function BT_GetTempData(nTaskID)
	return GetTaskTemp(nTaskID)
end
--���Ӹ��˵�ս���ܻ���
function BT_AddTotalPoint(nPoint)
	if nPoint == 0 then
		return
	end
	local nValue = BT_GetData(PT_TOTALPOINT)
	if nValue+nPoint < 0 then
		BT_SetData(PT_TOTALPOINT, 0);
	else
		BT_SetData(PT_TOTALPOINT, nValue + nPoint);
	end;
	SetRankPoint(RANK_BATTLE_POINT,BATTLE_OFFSET+PT_TOTALPOINT,1);
end
--���Ӹ�����ĳ��ս���еĸ��˵÷֣�ս�۽�������0��
function BT_AddBattlePoint(nPoint)
	if nPoint == 0 then
		return
	end
	local nValue = BT_GetData(PTNC_BATTLEPOINT)
	if nValue+nPoint < 0 then
		BT_SetData(PTNC_BATTLEPOINT, 0);
		return nValue;	--���ؿ��˶��ٷ֣���ʾ���ڷ����������ˣ�Ҫ����ʣ�µĻ���
	else
		BT_SetData(PTNC_BATTLEPOINT, nValue + nPoint);
		return nil;	--����nil����ʾ�ɹ��۳��˻���
	end;
end
--�������ĳս�۵ĵ÷�
function BT_AddPlayerCampPoint(nPoint)
	local nBattleType = BT_GetData(PT_BATTLE_TYPE);
	local nCamp = BT_GetCamp();
	local nValue = 0;
	local tMapping = {
				[1] = {PT_VILL_POINT,RANK_VILLAGE},
				[2] = {PT_RESO_POINT,RANK_RESOURCE},
				[3] = {PT_EMPL_POINT,RANK_EMPLACEMENT},
				[4] = {PT_MAIN_POINT,RANK_MAIN},
				}
	local nTaskID = tMapping[nBattleType][1];
	nValue = BT_GetData(nTaskID) + nPoint;
	if nValue < 0 then
		nValue = 0;
	end;
	BT_SetData(nTaskID,nValue);
	SetRankPoint(tMapping[nBattleType][2],BATTLE_OFFSET+nTaskID,1);
end;
--���Ӹ��˻��֣��ڶ���������ʾ�Ƿ���ʾ��Ϣ����Ϊ��ʾ���ǣ�Ϊ����ʾ��Ĭ������ʾ��
--������������ʾ�Ƿ��Ϊ�����Ա���ӻ��֡���Ϊ�����ӣ��ǣ�Ϊ���ӡ�Ĭ�ϲ�����
function BT_AddPersonalPoint(nPoint,bNotShowMsg,bTeamPoint)
	if nPoint == 0 then	--�����0�־Ͳ�����
		return 0;
	end;
	local nTeamMemberCount = GetTeamSize();
	if nTeamMemberCount == 0 or FORBIDENT_CREATE_TEAM == 1 or bTeamPoint == 0 or bTeamPoint == nil then
		if BT_GetData(PTNC_BATTLEPOINT) + nPoint >= POINT_LIMITED then
			nPoint = POINT_LIMITED - BT_GetData(PTNC_BATTLEPOINT);
			Msg2Player("Tr�n chi�n n�y b�n nh�n ���c �i�m t�ch l�y t�i �a:"..POINT_LIMITED);
		end;
		if bNotShowMsg == nil or bNotShowMsg == 0 then
			Msg2Player("B�n nh�n ���c �i�m t�ch l�y:"..nPoint);
		end;
		BT_AddContribution(nPoint);
		BT_AddTotalPoint(nPoint);
		BT_AddBattlePoint(nPoint);
		BT_AddPlayerCampPoint(nPoint);
	else
		BT_AddTeamPoint(nPoint,bNotShowMsg);
	end;
end
--��ȡĳ��ս���¼�����Ӧ�ķ�������һ������Ϊ�¼�ID���ڶ���������ʾ�Ƿ��ǻ���������0Ϊ���ǣ���0Ϊ�ǣ�Ĭ�ϲ���
function BT_GetBattleEvenPoint(nEvenID,bBasePoint)
	local nRoute = GetPlayerRoute();
	local nBasePoint = tBPEven[nEvenID];
	local nPoint = ceil(nBasePoint*tBPFactionAdjustment[nEvenID][nRoute]);
	if bBasePoint == 0 or bBasePoint == nil then
		return nPoint;
	else
		return nBasePoint;
	end;
end;
--����ս���¼��������֡���һ������Ϊ�¼�ID���ڶ���������ʾ�Ƿ���ʾ��ʾ��Ϣ����Ϊ��ʾ���ǣ�Ϊ����ʾ��Ĭ������ʾ��
--������������ʾ�Ƿ��Ϊ�����Ա���ӻ��֡���Ϊ�����ӣ��ǣ�Ϊ���ӡ�Ĭ�ϲ�����
function BT_AddBattleEvenPoint(nEvenID,bNotShowMsg,bTeamPoint)
	local nPoint = BT_GetBattleEvenPoint(nEvenID);
	BT_AddPersonalPoint(nPoint,bNotShowMsg,bTeamPoint);
end;
--���Ӷ������
function BT_AddTeamPoint(nPoint,bNotShowMsg)
	local nTeamMemberCount = GetTeamSize();
	if nTeamMemberCount == 0 then
		return 0;
	end;
	local nOldPlayerIndex = PlayerIndex;
	local _,nPosX,nPosY = GetWorldPos();	--��ô����¼�����ҵ�����
	local nTeamPoint = ceil(nPoint*TEAM_POINT_ATTENUATION);
	for i=1,nTeamMemberCount do
		PlayerIndex = GetTeamMember(i)
		if BT_GetDistance(nPosX,nPosY) <= TEAM_MEMBER_DISTANCE then
			if bNotShowMsg == nil or bNotShowMsg == 0 then
				Msg2Player("B�n nh�n ���c �i�m t�ch l�y ��i ng� chi�n tr��ng:"..nTeamPoint);
			end;
			BT_AddContribution(nTeamPoint);
			BT_AddTotalPoint(nTeamPoint);
			BT_AddBattlePoint(nTeamPoint);
			BT_AddPlayerCampPoint(nTeamPoint);			
		end;
	end;
	PlayerIndex = nOldPlayerIndex;
end;
--���ٸ���ս�����֣��Ƿ�Ҫ������ӵ�����أ�
function BT_DecPersonalPoint(nPoint)
	if nPoint == 0 then	--�����0�־Ͳ�����
		return 0;
	end;
	local nRetValue = BT_AddBattlePoint(-nPoint);
	if nRetValue ~= nil then	--������˻��ֿ�����
		nPoint = nRetValue;
		BT_ShowDebugInfor("Hi�n �ang tr� �i �i�m t�ch l�y c� nh�n t� t�ng �i�m t�ch l�y"..nRetValue.." �i�m");
	end;
	BT_AddPlayerCampPoint(-nPoint);
	BT_AddTotalPoint(-nPoint);
	Msg2Player(" �i�m t�ch l�y c� nh�n b� tr� �i"..nPoint.." �i�m");
	BT_AddContribution(-ceil(nPoint/3));	--������з�ɱ�����������Լ��ڵз���ս�������ڼ飿��
end;
--���Ӿ������η��ľ���Ϊ�������ɷ��ľ���Ϊ����
function BT_AddContribution(nPoint)
	--������װ��Ч��
	if GetTime() - BT_GetData(PT_SPYCLOTH_TIME) < ITEM_SPYCLOTH_TIME then	--�ڼ��װ����Чʱ����
		return 0;
	end;
	if BT_GetCamp() == LIAO_ID then
		nPoint = -nPoint;
	end;
	BT_SetData(PT_RANKPOINT,BT_GetData(PT_RANKPOINT)+nPoint);
	local nContribution = BT_GetData(PT_RANKPOINT);
	local nMaxSongCon = BT_GetData(PT_MAX_RANKPOINT_SONG);
	local nMaxLiaoCon = BT_GetData(PT_MAX_RANKPOINT_LIAO);
	if nContribution > nMaxSongCon then	
		BT_SetData(PT_MAX_RANKPOINT_SONG,nContribution);
	elseif nContribution < nMaxLiaoCon then
		BT_SetData(PT_MAX_RANKPOINT_LIAO,nContribution);
	end;
	SetRankPoint(RANK_BATTLE_CONTRIBUTION,BATTLE_OFFSET+PT_RANKPOINT,1);
	return nPoint;
end;
--����ĳ��Ӫ�Ĺ�������
function BT_AddMissionPoint(nCamp,nPoint)
	if nPoint == 0 then
		return
	end
	if GetMissionV(MV_BATTLE_POINT_SONG+nCamp-1)+nPoint < 0 then
		SetMissionV(MV_BATTLE_POINT_SONG+nCamp-1,0);
	else
		SetMissionV(MV_BATTLE_POINT_SONG+nCamp-1, GetMissionV(MV_BATTLE_POINT_SONG+nCamp-1) + nPoint)
	end;
end
--����ĳ��Ӫ�Ĺ�������
function BT_DecMissionPoint(nCamp,nPoint)
	BT_AddMissionPoint(nCamp,-nPoint);
end;
--�õ�ĳһ��Ӫ�Ĺ�������
function BT_GetMissionPoint(nCamp)
	return GetMissionV(MV_BATTLE_POINT_SONG+nCamp-1);
end;
--�ʵ۽���;��������ǻ�ý����Ļ��ʣ������Ǹ���������1.45%������1.45����
function BT_EmperorAward(nProbability)
	local StringFind = function(sString,nTag)
		for i=1,strlen(sString) do
			if strsub(sString,i,i) == nTag then
				return i;
			end;
		end;
		return 0;
	end;
	if nProbability > 100 or nProbability < 0 then
		return 0;
	end;
	local nDotPos = StringFind(tostring(nProbability),".")
	local nStrLen = strlen(tostring(nProbability));
	local nRandomNum = random(1,100*(10^(nStrLen-nDotPos)));
	if nRandomNum < nProbability*(10^(nStrLen-nDotPos)) then
		Talk(1,"","<color=yellow>Gi� th��ng l�nh: <color><enter>Do b�n l�p ���c c�ng l�n n�n nh�n ���c <color=yellow>"..EMPEROR_AWARD_POINT.." �i�m, kinh nghi�m"..EMPEROR_AWARD_EXP.."<color>.");
		ModifyExp(EMPEROR_AWARD_EXP);
		BT_AddPersonalPoint(EMPEROR_AWARD_POINT);
		BT_SetData(PT_EMPEROR_AWARD_COUNT,BT_GetData(PT_EMPEROR_AWARD_COUNT)+1);
		Msg2MSGroup(MISSION_ID,"Ng��i ch�i "..GetName().."  l�p ���c c�ng l�n n�n ���c ban th��ng �i�m t�ch l�y"..EMPEROR_AWARD_POINT.." �i�m, kinh nghi�m"..EMPEROR_AWARD_EXP.." �i�m.",BT_GetCamp());
	end;
end
--ս��֮��
function BT_BattleStarAward()
	local IDTab = BT_SortMSPlayerByTaskValue(PTNC_BATTLEPOINT,0);
	local nPlayerCount = getn(IDTab);
	local strName = "";
	local nOldPlayerIndex = PlayerIndex;
	local nStarCount = 0;
	local sMul = "Tha";
	if nPlayerCount > 0 then
		PlayerIndex = IDTab[1];
		local nFirstPoint = BT_GetData(PTNC_BATTLEPOINT);
		for i=1,nPlayerCount do	--��Ϊ�п����ж����߷֣����Ի���Ҫ�������е����һ��
			PlayerIndex = IDTab[i];
			if BT_GetData(PTNC_BATTLEPOINT) == nFirstPoint then
				if IsPlayerDeath() == 0 then
					ModifyExp(BATTLE_STAR_AWARD_EXP)
					Msg2Player("B�n nh�n ���c ph�n th��ng Ng�i sao chi�n ��a:"..BATTLE_STAR_AWARD_EXP.." �i�m kinh nghi�m");
				end;
				BT_AddPersonalPoint(BATTLE_STAR_AWARD_POINT);
				BT_SetData(PT_BATTLE_STAR_COUNT,BT_GetData(PT_BATTLE_STAR_COUNT)+1);
				SetRankPoint(RANK_BATTLE_STAR,BATTLE_OFFSET+PT_BATTLE_STAR_COUNT,0);
				strName = strName..GetName()..",";
				nStarCount = nStarCount + 1;
			else
				break;
			end;
		end;
		strName = strsub(strName,1,strlen(strName)-2);
	end;
	if nStarCount > 1 then
		sMul = "h�";
	end;
	if nPlayerCount > 0 then
		Msg2MSAll(MISSION_ID,tBattleName[BT_GetData(PT_BATTLE_TYPE)].." sau khi k�t th�c, vinh d� ng�i sao chi�n tr��ng trao cho: "..strName..", xem nh� bi�u d��ng!"..sMul.."Trong chi�n d�ch n�y ng��i c� bi�u hi�n ki�t xu�t l�");
	end;
	PlayerIndex = nOldPlayerIndex;
end;
--����ս��ʱ����ҽ��еĲ���
function BT_SetPlayerState(nCamp)
	local nSignUpInfo = BT_GetData(PT_SIGN_UP);		--��ȡ��ұ�����������ĸ�ս�����ķ�
	local nBattleType = floor(nSignUpInfo/10);
	BT_SetData(PT_BATTLE_TYPE,nBattleType);	--����nSignUpInfoҲ���Եõ�nBattleType�������ٱ���һ�λ᲻������أ�
	BT_ClearTempData();
	CreateTrigger(3,LOG_ID,LOG_TRIGGER_ID);
	LeaveTeam();	--�뿪����
	SetLogoutRV(1);	--���õ�½��Ϊ����������
	SetDeathPunish(0);	--�������ͷ�
	if FORBIDENT_CREATE_TEAM == 1 then
		SetCreateTeam(1);	--�ر��齨����(���ߺ�ᱻ���)
	end;
	ForbitTrade(1);	--��ֹ����
	InteractiveEnable(0);	--�رս���	������NewWorld֮��ִ�в���Ч
	StallEnable(0);	--��ֹ��̯(���ߺ�ᱻ���)
	UseScrollEnable(0);	--��ֹʹ�ûسǷ�
	SetPKFlag(1,nCamp);
	ForbidChangePK(1);	--��ֹ�ı�PK״̬
	SetFightState(0);
	KillFollower();	--ɾ������
	if nBattleType ~= RESOURCE_ID then
		SetCampToPlayer(tCampNameP[nCamp]);
	else
		SetCampToPlayer(tCampNameP[ALL_ID]);	--�������Դս�������ɶ���������Ӫ
	end;
	EnterChannel(tBattleChannel[nBattleType][1]);
	EnterChannel(tCampChannel[(nBattleType-1)*2+nCamp][1]);
	SetTempRevPos(ENTRANCE_POINT[nCamp][1],ENTRANCE_POINT[nCamp][2]*32,ENTRANCE_POINT[nCamp][3]*32);	--����������
	BT_ShowDebugInfor("T� vong:"..DEATH_SCRIPT);
	SetDeathScript(DEATH_SCRIPT);
	BT_ClearCustomData();
end;
--ս������ʱ�����Ĵ���
function BT_ProcessBattleOver()
	--=============================��������
	BT_SetData(PTNC_BATTLEPOINT,0);	--�����������
	BT_ClearBattleActivity();	--��Ծϵ�����
	BT_SetData(PT_BATTLE_DATE,0);
	--=============================����ս����
	--=============================��Դս����
	--=============================��̨ս����
	--=============================��ս������
	BT_SetData(PTNC_SERIES_KILL,0);	--������ն���
	BT_SetData(PTNC_KILL,0);			--����ɱ�������
	BT_SetData(PTNC_DEATH,0);			--�������������
	local tMapping = {
			[VILLAGE_ID] = {PT_ATTEND_VILLAGE,PT_VILLAGE_WIN},
			[RESOURCE_ID] = {PT_ATTEND_RESOURCE,PT_RESOURCE_WIN},
			[EMPLACEMENT_ID] = {PT_ATTEND_EMPLACEMENT,PT_EMPLACEMENT_WIN},
			[MAINBATTLE_ID] = {PT_ATTEND_MAIN,PT_MAIN_WIN},
			}
	local nTaskIDAttend = tMapping[BATTLE_TYPE][1];
	local nTaskIDWin = tMapping[BATTLE_TYPE][2];
	local nCamp = BT_GetCamp();
	BT_SetData(nTaskIDAttend,BT_GetData(nTaskIDAttend)+1);	--�μ�
	if GetMissionV(MV_WINNER) == nCamp then
		BT_SetData(nTaskIDWin,BT_GetData(nTaskIDWin)+1);	--��ʤ
	end;
end;
--�뿪ս��ʱ�����Ĵ���
function BT_RestorePlayerState()
	local nBattleType = BT_GetData(PT_BATTLE_TYPE);
	local nCamp = BT_GetCamp();
	if nBattleType > 0 and nBattleType <= 4 then
		if nCamp > 0 and nCamp < 3 then
			LeaveChannel(tBattleChannel[nBattleType][1]);
			LeaveChannel(tCampChannel[(nBattleType-1)*2+nCamp][1]);
		else
			WriteLog("[Chi�n tr��ng b�o l�i]: Tr� nCamp trong BT_RestorePlayerState b�o l�i, tr� b�o l�i:"..nCamp);
		end;
	end;
	--==========================================================================
	RemoveTrigger(GetTrigger(LOG_TRIGGER_ID));
	if nBattleType == MAINBATTLE_ID then
		RemoveTrigger(GetTrigger(FIGHT_TRIGGER_ID));
	end;
	--==========================================================================
	SetLogoutRV(0);	
	SetDeathPunish(1);	
	SetCreateTeam(0);	
	ForbitTrade(0);
	InteractiveEnable(1);	
	StallEnable(1);	
	UseScrollEnable(1);
	ForbidChangePK(0);	--����ı�PK״̬
	SetPKFlag(0,0);
	SetFightState(0);
	SetDeathScript("");
	SetTempRevPos(0,0,0);
	SetCampToPlayer("");
	KillFollower();	--ɾ������
	
	BT_ClearTempData();
	BT_ClearCustomData();
	BT_DeleteAllBattleItem();
	BT_SetData(PT_BATTLE_TYPE,0);
end;
--�������Mission����
function BT_ClearMissionData()
	for i=1,10 do
		SetMissionS(i,"");
	end;
	for i=1,100 do
		SetMissionV(i,0);
	end;
end;
--ս������ʱ����ս����������˵÷����
function BT_ReportFinalResult()
	local nBattleType = BT_GetData(PT_BATTLE_TYPE);
	local nWhoWin = GetMissionV(MV_WINNER);
	local sStrResult = "";
	if nWhoWin == ALL_ID then
		sStrResult = "T�i <color=yellow>"..tBattleName[nBattleType].."<color> T�ng-Li�u hai b�n b�t ph�n th�ng b�i.";
	else
		if nWhoWin == SONG_ID then
			sStrResult = "<color=yellow>Phe T�ng<color> gi�nh ���c <color=yellow>"..tBattleName[nBattleType].."<color>.";
		else
			sStrResult = "<color=yellow>Phe Li�u<color> gi�nh ���c <color=yellow>"..tBattleName[nBattleType].."<color>.";
		end;
	end;
	local selTab = {
				--"�鿴����ս��ͳ����Ϣ/#BTS_ViewBattleStatistic(1)",
				"��ng/nothing",
				}
	local nPointAward = BT_GetData(PT_POINT_AWARD);
	local nJunGongAward = BT_GetData(PT_JUNGONG_AWARD);
	local nExpAward = BT_GetData(PT_EXP_AWARD);
	local nGoldenExpAward = BT_GetData(PT_GOLDENEXP_AWARD);
	local nBattlePoint = BT_GetData(PTNC_BATTLEPOINT);
	local sPersonalPoint = "";
--	if IB_VERSION == 1 then	--�����IB�汾
--		sPersonalPoint = sStrResult.."<enter>����ս������õĸ��˻���Ϊ<color=yellow>"..nBattlePoint.."<color>�����⣬�㻹�����<color=yellow>"..nPointAward.."<color>����ֽ�����<color=yellow>"..nJunGongAward.."<color>�����������<color=yellow>"..nExpAward.."<color>�㾭�齱�����뵽��Ӧ�ı�����ȥ��ȡ����ս��������";
--	else
--		sPersonalPoint = sStrResult.."<enter>����ս������õĸ��˻���Ϊ<color=yellow>"..nBattlePoint.."<color>�����⣬�㻹�����<color=yellow>"..nPointAward.."<color>����ֽ�����<color=yellow>"..nJunGongAward.."<color>�����������<color=yellow>"..nExpAward.."<color>�㾭�齱����<color=yellow>"..nGoldenExpAward.."<color>��Ľ�������ת���齱�����뵽��Ӧ�ı�����ȥ��ȡ����ս��������";
--	end;
	sPersonalPoint = sStrResult.."<enter>Chi�n d�ch l�n n�y b�n nh�n ���c <color=yellow>"..nBattlePoint.."<color>, ph�n th��ng �i�m t�ch l�y: <color=yellow>"..nPointAward.."<color>, t�ng �i�m t�ch l�y: <color=yellow>"..(nBattlePoint+nPointAward).."<color>. M�i c�c b�n ��n ch� Ng��i Nh�n Th��ng Li�n Server � c�c th�nh ch�nh �� nh�n ph�n th��ng chi�n tr��ng.";
	Say(sPersonalPoint,getn(selTab),selTab);
end;
--��Mission��ĳһ��Ӫ��ҽ���ͳһ����
--ʹ�÷������ȶ���һ��ִ�к���������������������Ϊһtable��
--Ȼ������������Ϊ��һ�����������OP_AllMSPlayer������
--ͨ����table�ķ�ʽ���Դ����������ִ�к�����
function BT_OperateAllPlayer(func,tArg,nCamp)
	local OldPlayerIndex = PlayerIndex;
	local IDTab = BT_GetMSPlayerIndex(nCamp);	
	local nPlayerCount = getn(IDTab);
	if nPlayerCount > 0 then
		for i=1,nPlayerCount do
			PlayerIndex = IDTab[i];
			if PlayerIndex > 0 then
				func(tArg);
			else
				Write_Log("Chi�n tr��ng b�o l�i","BT_OperateAllPlayer(), h��ng d�n ng��i ch�i trong IDTab nh� h�n ho�c b�ng 0");
			end;
		end;
	end;
	PlayerIndex = OldPlayerIndex;
end;
--����ս����Ծϵ����ս����Ծϵ��=�¼�������Ծϵ��*���ɻ�Ծϵ��
function BT_AddBattleActivity(nEvenID)
	local nRoute = GetPlayerRoute();
	BT_SetData(PTNC_ACTIVITY,BT_GetData(PTNC_ACTIVITY)+floor(tBAEven[nEvenID]*tBAFactionAdjustment[nEvenID][nRoute]));
	if BT_GetData(PTNC_ACTIVITY) > 100 then	--���ֵ���ǣ�����
		BT_SetData(PTNC_ACTIVITY,100);
	end;
end;
--���ս����Ծϵ��
function BT_ClearBattleActivity()
	BT_SetData(PTNC_ACTIVITY,0);
end;

--ÿ����ҽ����µ�ս��ʱҪ���������
function BT_NewBattleClear2()
	local nDate = tonumber(date("%y%m%d"));
	if BT_GetData(PT_BATTLE_DATE) ~= nDate then	--����ϴα��������뵱ǰ���ڲ�ͬ�����µ�һ�죩
		BT_SetData(PT_BATTLE_DATE,0);
		BT_SetData(PT_SIGN_UP,0);
		BT_ClearPTNC();
	end;
end;
function BT_NewBattleClear()	
	local nDate = tonumber(date("%y%m%d"));
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	local nSignUpTime = BT_GetData(PT_BATTLE_DATE);	--��ȡ��ұ���������һ���ε�ս��
	if nDate*1000+nGlobalState - nSignUpTime > 1 then	--����ͬ���εĲ�ͬս���ı����׶��뿪ս�׶Σ�������˽ⱨ����ʵ��ԭ��
		BT_SetData(PT_BATTLE_DATE,0);
		BT_SetData(PT_SIGN_UP,0);
		BT_ClearPTNC();
	end;
end;
--������е�PTNC����
function BT_ClearPTNC()
		BT_SetData(PTNC_BATTLEPOINT,0);	--�����������
		BT_SetData(PTNC_ACTIVITY,ACTIVITY_ADJUSTOR);
		BT_SetData(PTNC_USE_HOE_TIMES,0);
		BT_SetData(PTNC_SERIES_KILL,0);
		BT_SetData(PTNC_KILL,0);
		BT_SetData(PTNC_DEATH,0);
		BT_SetData(PTNC_KILL_VILLAGER_POINT,0);
		BT_SetData(PTNC_KILL_SOLDIER_POINT,0);
		BT_SetData(PTNC_GOT_MEDICINE,0);
		BT_SetData(PTNC_HELP_REFUGEE,0);
end;
--�õ������ĳһ����ľ���
function BT_GetDistance(nX,nY)
	local _,nPosX,nPosY = GetWorldPos();
	local nDis = floor(sqrt((nPosX-nX)^2+(nPosY-nY)^2));
	return nDis;
end;
--���������ʱ����
function BT_ClearTempData()
	for i=PTT_BEGIN,PTT_END do
		BT_SetTempData(i,0);
	end;
end;
--�õ�ս�������������Ϣ
function BT_GetPlayerCount(nBattleType,nCamp)
	if nBattleType == 0 then
		return 0;
	end;
	local nOldSubWorld = SubWorld;
	local nPlayerCount = 0;
	local nMapID = tBTMSInfo[nBattleType][2];
	local nMissionID = tBTMSInfo[nBattleType][1];
	SubWorld = SubWorldID2Idx(nMapID);
	nPlayerCount = GetMSPlayerCount(nMissionID,nCamp)
	SubWorld = nOldSubWorld;
	return nPlayerCount;
end;
--���������ս����صķ�����ȫ�ֱ���
function BT_ClearGlbValue()
	for i=32, 36 do
		SetGlbValue(i,0);
	end;
end;
--�õ�ĳMissionĳ��Ӫ��������ҵ�����������һ�������������ķ���ֵ
function BT_GetMSPlayerIndex(nCamp)
	local tIndex = {};
	local nTotalPlayerNum = GetMSPlayerCount(MISSION_ID,nCamp);
	local msidx,sidx = 0,0;
	if nTotalPlayerNum ~= 0 then
		for i=1,nTotalPlayerNum do
			msidx,sidx = GetNextPlayer(MISSION_ID,msidx,nCamp);
			if sidx > 0 then
				tIndex[i] = sidx;
			end
		end
	end;
	if nTotalPlayerNum ~= getn(tIndex) then
		WriteLog("[Chi�n tr��ng b�o l�i]: Trong h�m s� ms_GetMSPlayerIndex nh�n ���c s� ng��i c�a phe n�o �� so v�i getn(tIndex) kh�ng ��ng nh�t. S� ng��i:"..nTotalPlayerNum..", getn(tIndex) ch�nh l�ch l�:"..getn(tIndex));
	end;
	return tIndex;
end;
--�ı�ĳ��Ӫ����������ҵ�ĳһ����ʱ������ֵ
function BT_SetCampTempValue(nCamp,nTaskID,nValue)
	local IDTab = BT_GetMSPlayerIndex(nCamp);
	local nPlayerCount = getn(IDTab);
	local nOldPlayerIndex = PlayerIndex;
	if nPlayerCount > 0 then
		for i=1,nPlayerCount do
			PlayerIndex = IDTab[i];
			if PlayerIndex > 0 then
				BT_SetTempData(nTaskID,nValue);
			end;
		end;
	end;
	PlayerIndex = nOldPlayerIndex;
end;
--���ĳ��ս����ĳһ��Ӫ�ı�������
function BT_GetSignUpPlayerCount(nBattleType,nCamp)
	return GetGlbValue(GLB_SIGN_UP_VILL_SONG+(nBattleType-1)*2+nCamp-1);
end;
--����������1
function BT_AddSignUpPlayerCount(nBattleType,nCamp)
	local nCurPlayer = BT_GetSignUpPlayerCount(nBattleType,nCamp)
	SetGlbValue(GLB_SIGN_UP_VILL_SONG+(nBattleType-1)*2+nCamp-1,nCurPlayer+1);
end;
--��Ҽ���ս��
function BT_JoinBattle(nCamp)
	CleanInteractive();	--��NewWorldǰ��ɢ˫�˻�������
	local nCampPlace = nCamp;
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	if NewWorld(ENTRANCE_POINT[nCampPlace][1],ENTRANCE_POINT[nCampPlace][2],ENTRANCE_POINT[nCampPlace][3]) == 1 then
		if nCamp == SONG_ID then
			Msg2MSAll(MISSION_ID,GetName().." �� gia nh�p phe T�ng");
		else
			Msg2MSAll(MISSION_ID,GetName().." �� gia nh�p phe Li�u");
		end;
		BT_SetPlayerState(nCamp);
		local nFaction = GetPlayerFaction();	--ͳ�Ƹ���������
		local nFactionPlayerCount = BT_GetFactionPlayerCount(nFaction);
		BT_SetFactionPlayerCount(nFaction,nFactionPlayerCount+1);	--���������ӣ�
		AddMSPlayer(MISSION_ID,nCamp);
		if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then	--�������ս����ʼ������
			BT_SetTempData(PTT_DIE_LOOP,GetMissionV(MV_TIMER_LOOP));
		end;
		return 1;
	else
		return 0;
	end;
end;
--����뿪ս��
function BT_LeaveBattle()
	local nCamp = BT_GetCamp();
	if DEBUG_VERSION == 1 then
		nCamp = 0;	--����ǵ��԰汾���򴫵�Ȫ������������Ա���ģ��Ļ����ǻ��Ǵ��͵��꾩�ǰ�
	end;
	BT_RestorePlayerState();
	local nRandIndex = random(getn(EXIT_POINT[nCamp]));
	if NewWorld(EXIT_POINT[nCamp][nRandIndex][1],EXIT_POINT[nCamp][nRandIndex][2],EXIT_POINT[nCamp][nRandIndex][3]) == 1 then
		local nBattleState = GetMissionV(MV_BATTLE_STATE);
		if nBattleState == MS_STATE_READY or nBattleState == MS_STATE_FIGHT then
			if nCamp == SONG_ID then
				Msg2MSAll(MISSION_ID,"T�ng"..GetName().." �� r�i kh�i chi�n tr��ng");
			else	
				Msg2MSAll(MISSION_ID,"Li�u"..GetName().." �� r�i kh�i chi�n tr��ng");
			end;
		end;
		--�μ���һ��ս����������������
		if nBattleState == MS_STATE_COMPLETE then
			aw_bsBattle_award();
		end
		local nFaction = GetPlayerFaction();	--ͳ�Ƹ���������
		local nFactionPlayerCount = BT_GetFactionPlayerCount(nFaction);
		BT_SetFactionPlayerCount(nFaction,nFactionPlayerCount-1);	--������������		
		return 1;
	else
		return 0;
	end;
end;
--���ĳ�����������ֵ���������򡣵�һ��������ս�����������ID���ڶ�������Ϊ1��ʾ����0��ʾ����
--����������ָ����Ӫ��Ĭ��ֵΪ0������ֵΪһ���������������������table
function BT_SortMSPlayerByTaskValue(nTaskID,bAscend,nCamp)
	if nCamp == nil then
		nCamp = ALL_ID;
	end;
	local nOldPlayerIndex = PlayerIndex;
	local tIDTab = BT_GetMSPlayerIndex(nCamp);
	local fCompare = function(nPIndex1,nPIndex2)
		local nValue1,nValue2 = 0,0;
		PlayerIndex = nPIndex1;
		nValue1 = BT_GetData(%nTaskID);
		PlayerIndex = nPIndex2;
		nValue2 = BT_GetData(%nTaskID);
		if %bAscend == 1 then	--��������
			nValue1 = -nValue1;
			nValue2 = -nValue2;
		end;
		if nValue1 > nValue2 then
			return 1;
		else
			return nil;
		end;
	end;
	sort(tIDTab,fCompare);
	PlayerIndex = nOldPlayerIndex;
	return tIDTab;
end;
--���ں�Ӫͣ����̫�õ����ǿ�ƴ��͵�ս��
function BT_DrivePlayerOutOfShelter()
	if DRIVE_PLAYER_OUTOF_SHELTER == 0 then
		return 0;
	end;
	local Func = function(tArg)
		if GetFightState() == 0 then
			local nLeftLoop = BT_GetTempData(PTT_DIE_LOOP) - GetMissionV(MV_TIMER_LOOP);
			if nLeftLoop >= 5 then
				local nBattleType = BT_GetData(PT_BATTLE_TYPE);
				SetFightState(1);
				if nBattleType == VILLAGE_ID then
					DoScriptByName(GetName(),"\\settings\\static_script\\kf_newbattles\\villagebattle\\trap.lua","main");
				elseif nBattleType == RESOURCE_ID then
					DoScriptByName(GetName(),"\\settings\\static_script\\kf_newbattles\\resourcebattle\\trap.lua","main");
				elseif nBattletype == EMPLACEMENT_ID then
					DoScriptByName(GetName(),"\\settings\\static_script\\kf_newbattles\\emplacementbattle\\trap.lua","main");
				else
					DoScriptByName(GetName(),"\\settings\\static_script\\kf_newbattles\\mainbattle\\trap_back.lua","main");
				end;
				Msg2Player("B�n kh�ng th� l�u l�i trong h�u doanh");
			else
				Msg2Player("Th�i gian l�u l�i trong h�u doanh c�n:"..Get_Time_String((5-nLeftLoop)*20))
			end;
		end;
	end;
	BT_OperateAllPlayer(Func,{},ALL_ID);
end;
--ս����ʽ����ʱҪ���õ�һЩ״̬
function BT_RunBattle()
	StartMissionTimer(MISSION_ID,TIMER_ID,FIGHT_TIME);
	SetMissionV(MV_TIMER_LOOP,FIGHT_TIMER_LOOP);
	SetMissionV(MV_BATTLE_STATE,MS_STATE_FIGHT);
	local Func = function(tArg)
		BT_SetTempData(PTT_DIE_LOOP,FIGHT_TIMER_LOOP);
	end;
	BT_OperateAllPlayer(Func,{},ALL_ID);
end;
--ս����ʼ��ʱҪ���õ�һЩ״̬
function BT_InitBattle()
	local BattleID = tonumber(date("%y%m%d%H"));
	SetMissionV(MV_BATTLE_ID,BattleID*10+BATTLE_TYPE);
	SetMissionV(MV_TIMER_LOOP,READY_TIMER_LOOP);
	StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIME);
	SetMissionV(MV_BATTLE_STATE,MS_STATE_READY);
	WriteLog("[NewBattle]:"..tBattleName[BATTLE_TYPE].."("..GetMissionV(MV_BATTLE_ID)..")start now,battle type:"..BATTLE_TYPE);
end;
--ս��������Ҫ���õ�һЩ״̬��Ҫ��EndMission�����ִ��
function BT_EndBattle()
	local IDTab = BT_SortMSPlayerByTaskValue(PTNC_BATTLEPOINT,0,ALL_ID);
	local nPlayerCount = getn(IDTab);
	local nSongPlayerCount = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nLiaoPlayerCount = GetMSPlayerCount(MISSION_ID,LIAO_ID);
	local nSongPublicPoint = floor(BT_GetMissionPoint(SONG_ID)/nSongPlayerCount);
	local nLiaoPublicPoint = floor(BT_GetMissionPoint(LIAO_ID)/nLiaoPlayerCount);
	local nCamp = 0;
	local nWhoWin = GetMissionV(MV_WINNER);
	BT_BattleStarAward();	--��ѡս��֮�ǣ��ڼ��㹫�����ֺ�ʤ������֮ǰ
	if STATISTIC_OPEN == 1 then
		DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,2);
		if BATTLE_TYPE == EMPLACEMENT_ID or BATTLE_TYPE == MAINBATTLE_ID then	--�����жϣ�����һЩ����Ҫ����ղ���
			DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,3);
			DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,4);
		end;
		local nSongWin,nLiaoWin,nDraw;
		nSongWin,nLiaoWin,nDraw = GetRelayShareDataByKey(RELAY_DATA_BATTLE,5,BATTLE_TYPE,"history_record");
		if nSongWin == nil then
			nSongWin = 0;
		end;
		if nLiaoWin == nil then
			nLiaoWin = 0;
		end;
		if nDraw == nil then
			nDraw = 0;
		end;
		local tGLB = {GLB_VILLAGE,GLB_RESOURCE,GLB_EMPLACEMENT,GLB_MAINBATTLE};
		if nWhoWin == SONG_ID then
			nSongWin = nSongWin + 1;
		elseif nWhoWin == LIAO_ID then
			nLiaoWin = nLiaoWin + 1;
		else
			nDraw = nDraw + 1;
		end;
		BT_ShowDebugInfor("nSongWin:"..nSongWin..", nLiaoWin:"..nLiaoWin..", nDraw:"..nDraw..", BATTLE_TYPE:"..BATTLE_TYPE);
		AddRelayShareData(RELAY_DATA_BATTLE,5,BATTLE_TYPE,"","",0,"history_record","ddd",nSongWin,nLiaoWin,nDraw)
		DelRelayShareDataCopy(RELAY_DATA_BATTLE,5,BATTLE_TYPE);
		ApplyRelayShareData(RELAY_DATA_BATTLE,5,BATTLE_TYPE,"","");
	end;
	for i=1,nPlayerCount do	--����ÿ���˵Ĺ������ֺ�ʤ������
		PlayerIndex = IDTab[i];
		if PlayerIndex > 0 then
			nCamp = BT_GetCamp();
			if STATISTIC_OPEN == 1 then
				AddRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,2,"","",0,GetName(),"dddd",BT_GetData(PTNC_BATTLEPOINT),GetPlayerRoute(),GetLevel(),nCamp);
				if BATTLE_TYPE == EMPLACEMENT_ID or BATTLE_TYPE == MAINBATTLE_ID then
					AddRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,3,"","",0,GetName(),"dddd",BT_GetData(PTNC_KILL),GetPlayerRoute(),GetLevel(),nCamp);
					AddRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,4,"","",0,GetName(),"dddd",BT_GetData(PTNC_DEATH),GetPlayerRoute(),GetLevel(),nCamp);
				end;
			end;
			local nActivity = BT_GetData(PTNC_ACTIVITY)/100;
			local nPublicPoint = 0;
			local nX = 0;	--ƽ��ϵͳ
			if nCamp == SONG_ID then
				nPublicPoint = floor(nSongPublicPoint*nActivity);
				nX = (nSongPlayerCount+nLiaoPlayerCount)/(2*nSongPlayerCount);	--���������Ա���2������
			else
				nPublicPoint = floor(nLiaoPublicPoint*nActivity);
				nX = (nSongPlayerCount+nLiaoPlayerCount)/(2*nLiaoPlayerCount);
			end;
			if nX > 3 then
				nX = 3;
			end;
			nPublicPoint = floor(nPublicPoint*nX);
			BT_SetTempData(PTT_PUBLIC_POINT,nPublicPoint);
			
			local nResultPoint = 0;
			local nLevel = GetLevel();
			local nExpAward = 0;
			local nGoldenExpAward = 0;
			local nExpX = nActivity*nX;	--��Ծϵ����ƽ��ϵ��
			local nU = 0;
			if IB_VERSION == 1 then
				nU = 80;
			else
				nU = 75;
			end;
			if nWhoWin == ALL_ID then	--ʤ������
				nResultPoint = floor(DRAW_BONUS*nActivity);
				nExpAward = floor(EXP_AWARD_DRAW*nLevel*nLevel*nExpX/nU);
				nGoldenExpAward = floor(GOLDENEXP_AWARD_DRAW*nExpX);
			elseif nCamp == nWhoWin then
				nResultPoint = floor(WINNER_BONUS*nActivity);
				nExpAward = floor(EXP_AWARD_WIN*nLevel*nLevel*nExpX/nU);
				nGoldenExpAward = floor(GOLDENEXP_AWARD_WIN*nExpX);
			else
				nResultPoint = floor(LOSER_BONUS*nActivity);
				nExpAward = floor(EXP_AWARD_LOSE*nLevel*nLevel*nExpX/nU);
				nGoldenExpAward = floor(GOLDENEXP_AWARD_LOSE*nExpX);
			end;
			local tExpX = {1,1,1.5,2,2,3};	--����ζ�Ӧ�ľ���ϵ��
			local nCurRank = abs(BT_GetData(PT_CURRANK));
			if nCurRank == 0 or nCurRank > getn(tExpX) then	--���û�о��λ���γ���
				nCurRank = 1;	--��Ϊ1
			end;
			nResultPoint = floor(nResultPoint*nX)
			local nPointAward = nResultPoint + nPublicPoint;
			if nPointAward + BT_GetData(PTNC_BATTLEPOINT) > POINT_LIMITED then
				nPointAward = POINT_LIMITED - BT_GetData(PTNC_BATTLEPOINT);
			end;
			local nJunGongAward = nResultPoint + nPublicPoint;
			nJunGongAward = min(POINT_LIMITED,nJunGongAward);
			--�ӳ�ϵ��
			nJunGongAward = 3* nJunGongAward * (1+BATTLE_JUNGONG_EXT_RATE)
			nExpAward = 9* nExpAward * (1+BATTLE_EXP_EXT_RATE)*(1+GetVipCardParam())
			BT_SetTempData(PTT_RESULT_POINT,nResultPoint);
			BT_SetData(PT_EXP_AWARD,floor(nExpAward*tExpX[nCurRank]));	--��¼���齱����ֵ
			BT_SetData(PT_GOLDENEXP_AWARD,floor(nGoldenExpAward*tExpX[nCurRank]));
			BT_SetData(PT_POINT_AWARD,nPointAward);
			BT_SetData(PT_JUNGONG_AWARD,nJunGongAward);
			BT_SetData(PT_LAST_CAMP,nCamp);
			BT_SetData(PT_LAST_BATTLE,BATTLE_TYPE);
			if nWhoWin == ALL_ID then
				BT_SetData(PT_LAST_RESULT,0);
			elseif nWhoWin == nCamp then
				BT_SetData(PT_LAST_RESULT,1);
			else
				BT_SetData(PT_LAST_RESULT,2);
			end
			--BT_SetData(PT_SPYCLOTH_TIME,0);	--���װ��Ч�����
		end;
	end
	if BATTLE_TYPE == MAINBATTLE_ID then
		BT_ShowBattleRank(10,1);
	else
		BT_ShowBattleRank(10);
	end;	
	for i=1,nPlayerCount do	--�ƺ���
		PlayerIndex = IDTab[i];
		BT_ReportFinalResult();
		BT_ProcessBattleOver();
		BT_ShowDebugInfor("Trong BT_EndBattle, x�a nh�n v�t:"..GetName()..", tr� BT_GetData(PT_SIGN_UP):"..BT_GetData(PT_SIGN_UP));
		DelMSPlayer(MISSION_ID,ALL_ID);
		BT_SetData(PT_SIGN_UP,0);		--������Ϣ��գ�����ս�����Խ׶��ã�
	end;
	WriteLog("[Chi�n tr��ng Nh�n M�n Quan]:"..tBattleName[BATTLE_TYPE].."("..GetMissionV(MV_BATTLE_ID)..") �� k�t th�c, k�t qu�:"..GetGlbValue(GLB_VILLAGE-1+BATTLE_TYPE));
	SetMissionV(MV_BATTLE_STATE,MS_STATE_PEACE);	--��ʵ�����Clear_MissionData��Ҳ�ᱻ�壬����ֻ����ʽ����
	BT_ClearMissionData();
	ClearMapNpc(MAPID);
	ClearMapTrap(MAPID);
end;
--�������к�ƽ״̬�����
function BT_CureAllPlayer()
	if CURE_ALL_PLAYER == 0 then
		return 0;
	end;
	local Func = function(tArg)
		if GetFightState() == 0 then
			BT_RestoreAll();
		end;
	end;
	BT_OperateAllPlayer(Func,{},ALL_ID);
end;
--�ָ���������������
function BT_RestoreAll()
	Restore();
	RestoreNeili();
end;
--��ս����������Ҫ���Ĳ���
function BT_BattleAllOver()
	SetGlbValue(GLB_NEW_BATTLESTATE,0);	--��Ǳ����ε�ս���Ѿ�ȫ������
	for i=GLB_VILLAGE,GLB_MAINBATTLE do
		SetGlbValue(i,0);
	end;
	for i=GLB_SIGN_UP_VILL_SONG,GLB_SIGN_UP_MAIN_LIAO do	--�����������
		SetGlbValue(i,0);
	end;
end;
--���Mission�������з���ĳһ��������ҵ�ĳһ����Ϣ����table����ʽ����
--������Func��������
--���ص�table��Ԫ�ؽṹ��Func���صĽ��������
function BT_GetMSPlayerInfo(Func,tArg,nCamp)
	local IDTab = BT_GetMSPlayerIndex(nCamp);
	local tInfo = {};
	local nOldPlayerIndex = PlayerIndex;
	local nCounter = 1;
	local nRetInfo;
	for i=1,getn(IDTab) do
		PlayerIndex = IDTab[i];
		nRetInfo = Func(tArg);
		if nRetInfo ~= nil then
			tInfo[nCounter] = nRetInfo;
			nCounter = nCounter + 1;
		end;
	end;
	PlayerIndex = nOldPlayerIndex;
	return tInfo;
end;
--���������Ҫ�����CustomData
function BT_ClearCustomData()
	for i=1,getn(tCustomDataString) do
		if tCustomDataString[i][1] == 0 then
			CustomDataRemove(tCustomDataString[i][2]);
		end;
	end;
end;
--���ս������ĳ�����ɵ���������
function BT_GetFactionPlayerCount(nFaction)
	local nDWOffset = floor(nFaction/4);
	local nByteOffset = mod(nFaction,4)+1;
	local nMVID = MV_FACTION_PLAYER_COUNT1+nDWOffset;
	local nMissionV = GetMissionV(nMVID);
	return GetByte(nMissionV,nByteOffset);
end;
--����ս�������ĳ�����ɵ���������
function BT_SetFactionPlayerCount(nFaction,nValue)
	if nValue < 0 then
		BT_ShowDebugInfor("S� ng��i m�n ph�i b�o l�i nValue"..nValue);
		nValue = 0;
	end;
	local nDWOffset = floor(nFaction/4);
	local nByteOffset = mod(nFaction,4)+1;
	local nMVID = MV_FACTION_PLAYER_COUNT1+nDWOffset;
	local nMissionV = GetMissionV(nMVID);
	SetMissionV(nMVID,SetByte(nMissionV,nByteOffset,nValue));
end;
--ɾ������ս����ص���Ʒ�����ܴ���ս����ģ�
function BT_DeleteAllBattleItem()
	local nItemCount = 0;
	for i=1,getn(tBattleItem) do
		if tBattleItem[i][5] == 1 then
			nItemCount = BigGetItemCount(tBattleItem[i][2],tBattleItem[i][3],tBattleItem[i][4]);
			if nItemCount > 0 then
				BigDelItem(tBattleItem[i][2],tBattleItem[i][3],tBattleItem[i][4],nItemCount)	
			end;
		end;
	end;
	for i=1,getn(tBattleMed) do	--ɾ��ս��PKҩ
		nItemCount = BigGetItemCount(tBattleMed[i][2],tBattleMed[i][3],tBattleMed[i][4]);
		if nItemCount > 0 then
			BigDelItem(tBattleMed[i][2],tBattleMed[i][3],tBattleMed[i][4],nItemCount)	
		end;
	end;
end;
--����ʱ��ָ�nType���������д��Ϊ����ʾ��print�����������Msg2SubWorld���
function BT_ShowDebugInfor(Arg,nType)
	if DEBUG_VERSION == 1 then
		if nType == nil or nType == 0 then
			print("\n �i�u ch�nh tin t�c:"..Arg.."\n")
		elseif nType == 1 then
			Msg2SubWorld("Ch�nh tin t�c:"..Arg);
		end;
	end;
end;
--���Relay�������ݿ��һЩ��Ϣ����Ҫ�����а���Ϣ
function BT_ClearRelayData()
	ClearRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,2,"","");	--�������������һ���ĸ��˻�������
	--DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,2);
	if BATTLE_TYPE == EMPLACEMENT_ID or BATTLE_TYPE == MAINBATTLE_ID then	--�����жϣ�����һЩ����Ҫ����ղ���
		ClearRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,3,"","");	--�������������һ���ĸ��˻�������
	--	DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,3);
		ClearRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,4,"","");	--�������������һ���ĸ��˻�������
	--	DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,4);
	end;
end;
--��ʾ�������ڶ�������Ϊ1ʱ��ʾ��ȫ���������ʾ����������ֻ����ս������������ʾ
function BT_ShowBattleRank(nPlayerCount,bShowWorld)
	local tbPlayer = mf_SortMSPlayerByTaskValue(MISSION_ID,PTNC_BATTLEPOINT+BATTLE_OFFSET,0);
	local nOldPlayerIdx = PlayerIndex;
	if bShowWorld == 1 then
		Msg2Global(tostring(tBattleName[BATTLE_TYPE]).."T�ch l�y c� nh�n: "..nPlayerCount..":");
	else
		Msg2MSAll(MISSION_ID,tostring(tBattleName[BATTLE_TYPE]).."T�ch l�y c� nh�n: "..nPlayerCount..":");
	end;
	for i=1,min(getn(tbPlayer),nPlayerCount) do
		PlayerIndex = tbPlayer[i];
		if bShowWorld == 1 then
			Msg2Global("th�"..i..": ("..tCampNameZ[BT_GetCamp()]..")"..GetName().." "..BT_GetData(PTNC_BATTLEPOINT).." Ph�t ");
		else
			Msg2MSAll(MISSION_ID,"th�"..i..": ("..tCampNameZ[BT_GetCamp()]..")"..GetName().." "..BT_GetData(PTNC_BATTLEPOINT).." Ph�t ");
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
end;
--���ں�Ӫ˯��������߳�ȥ
function BT_KickSleeper()
	if IsSleeping() == 1 and GetFightState() == 0 then	--��Ӫ˯�����߳�ս��
		Talk(1,"","<color=yellow>Nguy�n so�i:<color> Qu�n ��ch tr��c m�t, c�n d�m ng� n�a sao! Ng��i ��u! L�i h�n �i!");
		DelMSPlayer(MISSION_ID,BT_GetCamp());
		return 1;
	end;
	return 0;
end;
--������ҵ�ǰ�ľ���������ȡ��ҵ���Ӫ������Ϊ0�ߵ��η�����
function BT_GetCurCamp()
	if BT_GetData(PT_RANKPOINT) >= 0 then
		return SONG_ID;
	else
		return LIAO_ID;
	end;
end;
--�պ���
function nothing()

end;

