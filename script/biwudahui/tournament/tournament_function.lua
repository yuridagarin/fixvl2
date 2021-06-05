Include("\\settings\\static_script\\exchg_server\\exchange_server_func.lua")
Include("\\script\\lib\\sdb.lua")
Include("\\script\\biwudahui\\tournament\\tournament_head.lua");
--Include("\\script\\online\\spring_festival09\\spring_festival_head.lua"); --09���ڻ
Include("\\script\\equip_shop\\equip_shop_head.lua");
Include("\\script\\misc\\observer\\observer_head.lua");
--Include("\\script\\misc\\soul\\soul.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\settings\\static_script\\global\\merit.lua")
Include("\\script\\lib\\define.lua")

g_ThisFile = "\\script\\biwudahui\\tournament\\tournament_function.lua";

--��Ҫд�����ݿ�ı���
tRelayTask = {
	TSK_CURREALRESULT,
	TSK_TOTAL_POINT,
	TSK_CURSIGNEDRESULT,
	TSK_CURWEEKMATCH,
	TSK_TOTALMATCH,
	TASK_BIWU_WIN_10,
	TSK_TOTALWIN,
	TSK_CURWEEKWIN,
	TASK_BIWU_DUIZHAN_JINGYAN,
	TASK_BIWU_LOSE_10,
	TSK_TOTALLOSE,
	TSK_CURWEEKLOSE,
	TSK_BODY_WEEK,
	TASKID_WLZB_POINT,
--	TASKID_ACH_BIWU_WIN_TOTAL,
--	TASKID_ACH_USE_NEW_ROUTE,
--	TASKID_ACH_WIN_NEW_ROUTE,
};

--��ʦ�ı���
tGushiTask = {
	2204,2216,2207,2222,2219,2210,2228,2213,2225,2231
};

function BWDH_SetTask(nTaskId, nTaskVal)
	return SetTask(nTaskId, nTaskVal,TASK_ACCESS_CODE_BIWUDAHUI)
end

--���ñ������λ��ҵ�ս��״̬
function BWT_SetFightState(nState)
	local tbPlayer = {GetMissionV(MV_PLAYERINDEX1),GetMissionV(MV_PLAYERINDEX2)};
	local nOldPlayerIdx = PlayerIndex;
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		if PlayerIndex ~= 0 then
			SetFightState(nState);
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
end;
--����λ���Talk����Say
function BWT_Talk(szTalk,bTalkSay)
	bTalkSay = bTalkSay or 0;
	local tbPlayer = {GetMissionV(MV_PLAYERINDEX1),GetMissionV(MV_PLAYERINDEX2)};
	local nOldPlayerIdx = PlayerIndex;
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		if PlayerIndex ~= 0 then
			if bTalkSay == 0 then
				Talk(1,"",szTalk);
			else
				Say(szTalk,0);
			end;
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
end;
--ת��Mission��ǰ״̬
function BWT_ChangeMSState(nState)
	if nState == MS_STATE_IDEL then
		BWT_SetFightState(0);
		StopMissionTimer(MISSION_ID,TIMER_ID);	--����ǰһ����ʱ��
		SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL);
	elseif nState == MS_STATE_CHECK_EQUIPMENT then
		BWT_SetFightState(0);
		SetMissionV(MV_MISSION_STATE,MS_STATE_CHECK_EQUIPMENT);	--����Mission��״̬Ϊ׼��״̬
		SetMissionV(MV_TIMER_LOOP,CHECK_EQUIPMENT_TIMER_COUNT);	--���ü�ʱ���ܼ�ʱ����
		StopMissionTimer(MISSION_ID,TIMER_ID);	--����ǰһ����ʱ��
		StartMissionTimer(MISSION_ID,TIMER_ID,CHECK_EQUIPMENT_TIMER_INTERVAL*FRAME_PER_MIN);	--��ʼһ����ʱ��
	elseif nState == MS_STATE_READY then
		BWT_SetFightState(1);
		SetMissionV(MV_MISSION_STATE,MS_STATE_READY);	--����Mission��״̬Ϊ׼��״̬
		SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);	--���ü�ʱ���ܼ�ʱ����
		StopMissionTimer(MISSION_ID,TIMER_ID);	--����ǰһ����ʱ��
		StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL*FRAME_PER_MIN);	--��ʼһ����ʱ��
	elseif nState == MS_STATE_STARTED then
		BWT_SetFightState(1);
		SetMissionV(MV_MISSION_STATE,MS_STATE_STARTED);	--����Mission��״̬Ϊ��ʼ״̬
		SetMissionV(MV_TIMER_LOOP,STARTED_TIMER_COUNT);	--���ÿ�ʼ״̬�ĳ���ʱ��
		StopMissionTimer(MISSION_ID,TIMER_ID);	--����ǰһ����ʱ��
		StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_MIN);	--��ʼһ���µļ�ʱ��
	elseif nState == MS_STATE_ENDING then
		BWT_SetFightState(0);
		SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
	end;
end;
--��ȡ���ֵ�������ֻ������̨������������Ҵ���ʹ��
function BWT_GetOpponentIndex()
	local nMapID = SubWorldIdx2ID(SubWorld);
	local nIdx1,nIdx2 = GetMissionV(MV_PLAYERINDEX1),GetMissionV(MV_PLAYERINDEX2);
	if PlayerIndex == nIdx1 then
		return nIdx2;
	elseif PlayerIndex == nIdx2 then
		return nIdx1;
	else
		gf_ShowDebugInfor("PlayerIndex trong h�m s� BWT_GetOpponentIndex b� l�i");
	end;
end;
--�����ʱ�������
function BWT_ClearTempTask()
	for i=TSK_TEMP_BEGIN,TSK_TEMP_END do
		SetTaskTemp(i,0);
	end;
end;
--���㱾�ν��ջ�ʤ��õĻ��֣��ɻ�ʤ������
function BWT_CalculateWinPoint()
	local nOldPlayerIdx = PlayerIndex;
	local nRetPoint = 0;
	local nLevel = GetLevel();
	local nPoint = GetTask(TSK_CURREALRESULT);
	local nOppIdx = BWT_GetOpponentIndex();
	PlayerIndex = nOppIdx;
	local nOppLevel = GetLevel();
	local nOppPoint = GetTask(TSK_CURREALRESULT);
	PlayerIndex = nOldPlayerIdx;
	local nLevelDiff = nLevel - nOppLevel;	--�ȼ��ʤ��������
	local nPointDiff = nPoint - nOppPoint;
	nRetPoint = 15;
	if nPointDiff >= -100 then
		for i=1,getn(TB_POINTDIFF_RELATION) do
			if nPointDiff >= TB_POINTDIFF_RELATION[i][1] then
				nRetPoint = TB_POINTDIFF_RELATION[i][2];
				break;
			end;
		end;
	end;
	if nLevelDiff > 0 then
		for i=1,getn(TB_LEVELDIFF_RELATION) do
			if nLevelDiff >= TB_LEVELDIFF_RELATION[i][1] then
				nRetPoint = floor(nRetPoint*TB_LEVELDIFF_RELATION[i][2]/100);
				break;
			end;
		end;
	end;
	if nRetPoint >= 15 then
		WriteLog("["..LOG_ERROR_HEAD.."]:"..tostring(GetName())..", "..tostring(GetName(nOppIdx)).."nPointDiff:"..nPointDiff..",nLevelDiff:"..nLevelDiff..",error point:"..nRetPoint);
		nRetPoint = 15;
	end;
	if nRetPoint <= 0 then
		nRetPoint = 1;
	end;
	return nRetPoint;
end;
--ʱ�䵽ʱ������λ��ҵ�״̬����������ʤ����ϵ
function BWT_GetDrawState(nPIdx1,nPIdx2)
	local tbDamageInfo1,tbDamageInfo2 = BWT_GetDamageValue(nPIdx1,nPIdx2);
	local nResult1,nResult2 = 0,0;
	nResult1 = tbDamageInfo1[1];	--�����1���˺��ٷֱ�
	nResult2 = tbDamageInfo2[1];	--�����2���˺��ٷֱ�
	if nResult1 > nResult2 then	--ֵ���Ϊ����
		nState = 2;	--��ʾ2�����Ӯ
	elseif nResult1 < nResult2 then
		nState = 1;	--��ʾ1�����Ӯ
	else
		nState = 0;	--��ƽ��
	end;
	return nState;
end;
--�������1�����2����ȡ���Ǹ����ܵ����˺���Ϣ
function BWT_GetDamageValue(nPIdx1,nPIdx2)
	local nOldPIdx = PlayerIndex;
	local nDamageToP1,nDamageToP2 = 0,0;
	local nMaxLife1,nMaxLife2 = 0,0;
	local nState = 0;
	PlayerIndex = nPIdx1;
	nDamageToP2 = GetToPlayerDamage();
	nMaxLife1 = GetMaxLife();
	PlayerIndex = nPIdx2;
	nDamageToP1 = GetToPlayerDamage();
	nMaxLife2 = GetMaxLife();
	local nResult1,nResult2 = 0,0;
	nResult1 = tonumber(format("%.3f",nDamageToP1/nMaxLife1*100));	--�����1���˺�ֵ
	nResult2 = tonumber(format("%.3f",nDamageToP2/nMaxLife2*100));	--�����2���˺�ֵ
	PlayerIndex = nOldPIdx;
	return {nResult1,nDamageToP1,nMaxLife1},{nResult2,nDamageToP2,nMaxLife2};
end;

--������ս����nResultType1ʱ��ʾ��ƽ��,��1Ϊ����ʤ����Ĭ��ֵΪ0
function BWT_ReportResult(nWinnerIdx,nLoserIdx,nResultType)
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 0 and GLB_BW_BiWuCheck() == 1 then --������ȫ��ȫ���������ԭ�����ٻ�ý���
		local oldPlayerIndex = PlayerIndex
		PlayerIndex = nWinnerIdx;
		Say("K� thi v�ng lo�i ��i H�i T� V� thi�n h� �� nh�t to�n qu�c �� ch�nh th�c b�t ��u v�o tu�n n�y, c�c v� ��i hi�p b�y gi� �� c� th� c�ng so t�i v�i c�c cao th� kh�p n�i r�i! Chi ti�t c� th� ��n ��i s� ��i H�i T� V� h�i xem, t� v� server s� kh�ng nh�n ���c th�m ph�n th��ng v� t�ch �i�m.",0);
		PlayerIndex = nLoserIdx;
		Say("K� thi v�ng lo�i ��i H�i T� V� thi�n h� �� nh�t to�n qu�c �� ch�nh th�c b�t ��u v�o tu�n n�y, c�c v� ��i hi�p b�y gi� �� c� th� c�ng so t�i v�i c�c cao th� kh�p n�i r�i! Chi ti�t c� th� ��n ��i s� ��i H�i T� V� h�i xem, t� v� server s� kh�ng nh�n ���c th�m ph�n th��ng v� t�ch �i�m.",0);
		PlayerIndex = oldPlayerIndex;
		return 0;
	end
	nResultType = nResultType or 0;
	local tbDamageInfo1,tbDamageInfo2 = BWT_GetDamageValue(nWinnerIdx,nLoserIdx);
	Msg2MSAll(MISSION_ID,"Th�ng tin s�t th��ng: ");
	Msg2MSAll(MISSION_ID,"Ng��i ch�i "..BWT_GetName(nWinnerIdx).."  g�y ra:"..tbDamageInfo2[2]..",% s�t th��ng:"..tbDamageInfo2[1].."%");
	Msg2MSAll(MISSION_ID,"Ng��i ch�i "..BWT_GetName(nLoserIdx).."  g�y ra:"..tbDamageInfo1[2]..",% s�t th��ng:"..tbDamageInfo1[1].."%");
	local nOldPIdx = PlayerIndex
	if nResultType == 1 then	--��ƽ��
		PlayerIndex = nWinnerIdx;
		Say("Hai b�n h�a, tr� <color=yellow>1<color> �i�m so t�i.",0);
		Msg2Player("B�n b� tr� 1 �i�m so t�i");
		BWT_AddPoint(-1);
		merit_1V1(-1);
		PlayerIndex = nLoserIdx;
		Say("Hai b�n h�a, tr� <color=yellow>1<color> �i�m so t�i.",0);
		Msg2Player("B�n b� tr� 1 �i�m so t�i");
		BWT_AddPoint(-1);
		merit_1V1(-1);
		_Write1V1PointLog(nWinnerIdx,nLoserIdx,-1,-1)
		PlayerIndex = nOldPIdx;
		Msg2MSAll(MISSION_ID,BWT_GetName(nWinnerIdx).."c�ng v�i "..BWT_GetName(nLoserIdx).." k�t qu� h�a nhau");
	else
		--���㹦ѫ�͵ȼ�
		PlayerIndex = nWinnerIdx;
		local nWinMerit = _merit_GetMerit();
		local nWinLevel = GetLevel() + gf_GetPlayerRebornCount() * 10;
		PlayerIndex = nLoserIdx;
		local nLostMerit = _merit_GetMerit();
		local nLostLevel = GetLevel() + gf_GetPlayerRebornCount() * 10;
		
		--������
		PlayerIndex = nWinnerIdx;
		local nWinRoute = GetPlayerRoute() --ʤ������
		local nPoint = BWT_CalculateWinPoint();	--�ɻ�ʤ������
		BWT_AddPoint(nPoint);
		merit_1V1(1, nWinMerit - nLostMerit, nWinLevel - nLostLevel, 0); --��ѫ�ͽ���
		SetMissionV(MV_BIWU_RESULT,nWinnerIdx);
		Say("B�n �� chi�n th�ng <color=yellow>"..BWT_GetName(nLoserIdx).."<color>, nh�n ���c <color=yellow>"..nPoint.."<color> �i�m so t�i, �i�m so t�i tu�n n�y l� "..GetTask(TSK_CURREALRESULT)..".",0);
		Msg2Player("B�n nh�n ���c "..nPoint.." �i�m so t�i");
		PlayerIndex = nLoserIdx;
		local nLoseRoute = GetPlayerRoute()--��������
		BWT_AddPoint(-nPoint);
		merit_1V1(0, nLostMerit - nWinMerit, nLostLevel - nWinLevel, 0); --��ѫ�ͽ���
		Say("B�n �� thua <color=yellow>"..BWT_GetName(nWinnerIdx).."<color>, b� gi�m <color=yellow>"..nPoint.."<color> �i�m so t�i, �i�m so t�i tu�n n�y l� "..GetTask(TSK_CURREALRESULT)..".",0);
		Msg2Player("B�n �� b� gi�m "..nPoint.." �i�m so t�i");
		PlayerIndex = nOldPIdx;
		Msg2MSAll(MISSION_ID,BWT_GetName(nWinnerIdx).."Chi�n th�ng r�i "..BWT_GetName(nLoserIdx)..", gi�nh ���c th�ng l�i.");
		
		--PKʤ��ͳ��
		local nPKStatWinKey = nWinRoute*100+nLoseRoute
		local nPKStatLoseKey = nLoseRoute * 100 + nWinRoute
		AddRuntimeStat(15,1,nPKStatWinKey,1)
		AddRuntimeStat(15,2,nPKStatWinKey,1)
		AddRuntimeStat(15,2,nPKStatLoseKey,1)
		
		_Write1V1PointLog(nWinnerIdx,nLoserIdx,nPoint,-1*nPoint)
	end;
	BWT_AddBiWuRecord(nWinnerIdx,nLoserIdx,nResultType);	--���ڸ�����ֺ����

--	if get_spring_festival_state09() == 1 then
--		PlayerIndex = nWinnerIdx;
--		local nDate = tonumber(date("%Y%m%d"));
--		if GetTask(TASK_BIWU_JINNIU_DATE) < nDate then
--			BWDH_SetTask(TASK_BIWU_JINNIU_DATE,nDate);
--			BWDH_SetTask(TASK_BIWU_JINNIU_NUM,0);
--			BWDH_SetTask(TASK_BIWU_JINNIU_CHANG,0);
--		end
--		BWDH_SetTask(TASK_BIWU_JINNIU_CHANG,GetTask(TASK_BIWU_JINNIU_CHANG)+1);
--		if GetTask(TASK_BIWU_JINNIU_CHANG) >= 10 and GetTask(TASK_BIWU_JINNIU_NUM) == 0 then
--			AddItem(tSFItem[1][2],tSFItem[1][3],tSFItem[1][4],GET_BIWU_JINNIU_NUM);
--			Msg2Player("����������10�����䣬���"..GET_BIWU_JINNIU_NUM.."��"..tSFItem[1][1].."��");
--			BWDH_SetTask(TASK_BIWU_JINNIU_NUM,1);
--		end
--		PlayerIndex = nLoserIdx;
--		local nDate = tonumber(date("%Y%m%d"));
--		if GetTask(TASK_BIWU_JINNIU_DATE) < nDate then
--			BWDH_SetTask(TASK_BIWU_JINNIU_DATE,nDate);
--			BWDH_SetTask(TASK_BIWU_JINNIU_NUM,0);
--			BWDH_SetTask(TASK_BIWU_JINNIU_CHANG,0);
--		end
--		BWDH_SetTask(TASK_BIWU_JINNIU_CHANG,GetTask(TASK_BIWU_JINNIU_CHANG)+1);
--		if GetTask(TASK_BIWU_JINNIU_CHANG) >= 10 and GetTask(TASK_BIWU_JINNIU_NUM) == 0 then
--			AddItem(tSFItem[1][2],tSFItem[1][3],tSFItem[1][4],GET_BIWU_JINNIU_NUM);
--			Msg2Player("����������10�����䣬���"..GET_BIWU_JINNIU_NUM.."��"..tSFItem[1][1].."��");
--			BWDH_SetTask(TASK_BIWU_JINNIU_NUM,1);
--		end
--		PlayerIndex = nOldPIdx;
--	end
end;

function _Write1V1PointLog(nWinnerIdx,nLoserIdx, nWinnerPnt,nLoserPnt)
	local strAction = "1v1_match"
	local strDate = date("%Y_%m_%d")

	local hFile = openfile(format("logs/gest_convention/%s/%s.log", strDate, strAction), "a+");
	if (hFile == nil) then
		execute(format("mkdir \"%s\"", "logs/gest_convention/"));
		execute(format("mkdir \"%s\"", format("logs/gest_convention/%s/", strDate)));
		hFile = openfile(format("logs/gest_convention/%s/%s.log", strDate, strAction), "a+");
		write (hFile, "Account\tRole\tPoint\tTotalPoint\tCurZiGePoint\tDate\n")
	end
	if (hFile ~= nil) then
		local OldPlayerIndex = PlayerIndex
		PlayerIndex = nWinnerIdx
		local szMsg = format("%s\t%s\t%d\t%d\t%d\t%s\n"
			, GetAccount(), GetName(), nWinnerPnt, GetTask(TSK_CURREALRESULT), GetTask(TSK_CURLADDERVALUE), strDate)
		write (hFile, szMsg)
		PlayerIndex = nLoserIdx
		szMsg = format("%s\t%s\t%d\t%d\t%d\t%s\n"
			, GetAccount(), GetName(), nLoserPnt, GetTask(TSK_CURREALRESULT), GetTask(TSK_CURLADDERVALUE), strDate)
		write (hFile, szMsg)
		PlayerIndex = OldPlayerIndex
		closefile (hFile)
	end
end

--��ñ���˫��������
function BWT_GetFighterName(nMapID)
	nMapID = nMapID or SubWorldIdx2ID(SubWorld);
	return mf_GetMissionS(MISSION_ID,MS_PLAYERNAME1,nMapID),
		   mf_GetMissionS(MISSION_ID,MS_PLAYERNAME2,nMapID);
end;
--��ȡ��ǰ�������Ͽ��õĳ�������
function BWT_GetServerIdleRoomNum()
	local nCount = 0;
	local nTotalCount = 0;
	for i,v in TB_MAPID do
		if SubWorldID2Idx(i) >= 0 then
			nCount = nCount + GetMapLoadCount(v[2]);
			nTotalCount = nTotalCount + MAX_ROOM_NUM;
		end;
	end;
	return nTotalCount - nCount;
end;
--��ʼ��һ�ֱ���,GMScript��ִ��
--��ȡĳ���������ó���������Ȼ��ѡ�����������������ң��������أ�����Ҵ���ȥ
function BWT_InitOneRound()
	do
		return BWT_InitOneRoundEx();	--�����µ���Թ���
	end;
	local nCount = BWT_GetServerIdleRoomNum();
	local tbPlayer = {};
	local nRetCode,nPIdx1,nPIdx2 = 0,0,0;
	local nPairCount = 0;
	for i=1,nCount do
		nRetCode,nPIdx1,nPIdx2 = BWT_SentInviteToPlayer();
		if nRetCode == -1 then	--���ûͨ�����
			tinsert(tbPlayer,nPIdx1);	--�ӵ�table����
			tinsert(tbPlayer,nPIdx2);
		elseif nRetCode == 1 then
			nPairCount = nPairCount + 1;
		end;
	end;
	local nOldPIdx = PlayerIndex;
	--BWT_SentInviteToPlayer�����Ҵ��б����Ƴ�����������Ĵ�����Ҫ����Ҽӻ�ȥ��
	for i=1,getn(tbPlayer) do	--����Ҽӻ��б�
		PlayerIndex = tbPlayer[i];
		if GetTask(TSK_CHECK_FAIL) == 0 then	--������ͨ���˾ͼӻ��б�
			BWT_JoinGestConvention();
		end;
	end;
	PlayerIndex = nOldPIdx;
	return nPairCount;
end;
--��һ����ʼ������ĺ���
--����һ���Ĺ���ѡ��n��floor(�б��е��������/2)�������
function BWT_InitOneRoundEx()
	-- �ȼ����� ȡ�������ϵ���
	BWT_CheckAllPlayerState();
	--
	local tbPlayer = {};
	local nRetCode,nPIdx1,nPIdx2 = 0,0,0;
	local nPairCount = 0;
	local nPair = floor(GetGestQueueSize()/2);	--ȡ����ԵĶ���
	local nPIdx1,nPIdx2 = 0,0;
	for i=1,nPair do
		nRetCode,nPIdx1,nPIdx2 = BWT_GetPairGestPlayer(i);	--�˺�����������˳��б�
		if nRetCode == 0 then
			tinsert(tbPlayer,nPIdx1);
		else
			nRetCode = BWT_SentInviteToPlayer(nPIdx1, nPIdx2);	--�ú���Ҳ����ѡ�е������ʱ�˳��б�
			if nRetCode == 0 then
				break
			elseif nRetCode == -1 then	--���ûͨ�����
				tinsert(tbPlayer,nPIdx1);
				tinsert(tbPlayer,nPIdx2);
			elseif nRetCode == 1 then
				nPairCount = nPairCount + 1;
				BWT_CostOneRount(nPIdx1, nPIdx2);
			end
		end
	end

	local nOldPIdx = PlayerIndex;
	--BWT_SentInviteToPlayer�����Ҵ��б����Ƴ�����������Ĵ�����Ҫ����Ҽӻ�ȥ��
	for i = 1, getn(tbPlayer) do	--����Ҽӻ��б�
		PlayerIndex = tbPlayer[i];
		if GetTask(TSK_CHECK_FAIL) == 0 then	--������ͨ���˾ͼӻ��б�
			BWT_JoinGestConvention();
		end
	end
	PlayerIndex = nOldPIdx;
	--AddRuntimeStat(26,1,0,2*nPairCount)--����1V1�˴�
	return nPairCount;
end
--���һ����ҡ�
--����2Ϊ����ʱΪ��߻��ֵ������ԣ�Ȼ�������Ƴ����б�
--����2Ϊż��ʱΪ��ͻ��ֵ������ԣ�Ȼ�������Ƴ����б�
--�ظ�������Թ���ֱ���б�����û�����
function BWT_GetPairGestPlayer(nOrder)
	local nQueueSize = GetGestQueueSize();
	if nQueueSize <= 1 then
		return 0,0,0;	--Ψһ�������ʧ�ܵ����
	end

	local nDirection			= 0;	--1Ϊ����ƥ����ң�-1Ϊ����ƥ�����
	local nPIdx1				= 0;	--���1������
	local nPIdx2				= 0;	--���2������
	local nLevel				= 0;	--���1�ĵȼ�
	local nPoint				= 0;	--���1�ĵ�ǰ����
	local nResult				= 0;	--���1ʤ����

	if mod(nOrder,2) == 1 then	--����
		nPIdx1 = GetPlayerByGestQueueIndex(nQueueSize - 1);
		nDirection = -1;	--����ƥ��
	else	--ż��
		nPIdx1 = GetPlayerByGestQueueIndex(0);
		nDirection = 1;		--����ƥ��
	end

	nLevel	= GetLevel(nPIdx1);
	nPoint	= GetTask(TSK_CURREALRESULT, nPIdx1);
	nResult	= GetTask(TASKID_BIWU_MATCH_RESULT, nPIdx1);

	local nPointRangeLv		= 0;	--���ֲ�ȼ�
	local nPointRangeStep		= 30;	--���ֲ��
	local nPointRangeLvMax		= 3;	--���ֲ����ȼ�
	local nLevelRangeLv		= 0;	--�ȼ���ȼ�
	local nLevelRangeStep		= 1;	--�ȼ����
	local nLevelRangeLvMax		= 99;	--�ȼ������ȼ�
	nPointRangeLv = nPointRangeLvMax;
	nLevelRangeLv = nLevelRangeLvMax;

	local nTempPIdx			= 0;				--��ʱ���
	local nTempPointRangeLv	= 0;				--��ʱ���ֲ�ȼ�
	local nTempLevelRangeLv	= 0;				--��ʱ�ȼ���ȼ�
	local nQueueIdx			= 0;				--����б�����Ķ�������
	local nMaxQueueIdx			= nQueueSize - 1;	--����б��е�������������������Ǵ�0��ʼ�ģ����������������nQueueSize-1

	for i = 1, nMaxQueueIdx do
		local bPass = 1;
		nQueueIdx = floor((nMaxQueueIdx * (1 - nDirection) / 2) + nDirection * i);	--��ͷ�㻹�Ǵ�β��
		nTempPIdx = GetPlayerByGestQueueIndex(nQueueIdx);

		if 1 == bPass then
			bPass = ((nTempPIdx > 0) and 1) or 0;
		end

		if 1 == bPass then
			bPass = ((nResult == GetTask(TASKID_BIWU_MATCH_RESULT, nTempPIdx)) and 1) or 0;
		end

		if 1 == bPass then
			bPass = GLB_BW_Block_Route_Check_Ex(nPIdx1, nTempPIdx);
		end

		if 1 == bPass then
			nTempPointRangeLv = floor(abs(nPoint - GetTask(TSK_CURREALRESULT, nTempPIdx)) / nPointRangeStep) + 1;
			nTempLevelRangeLv = floor(abs(nLevel - GetLevel(nTempPIdx))                   / nLevelRangeStep) + 1;

			if nTempPointRangeLv < nPointRangeLv then
				bPass = 1;
			elseif nTempPointRangeLv == nPointRangeLv then
				if nTempLevelRangeLv < nLevelRangeLv then
					bPass = 1;
				elseif nTempLevelRangeLv == nLevelRangeLv then
					bPass = random(0, 1);
				else
					bPass = 0;
				end
			else
				bPass = 0;
			end
		end

		if 1 == bPass then
			nPIdx2			= nTempPIdx;
			nPointRangeLv	= nTempPointRangeLv;
			nLevelRangeLv	= nTempLevelRangeLv;
		end
	end

	if 0 == nPIdx2 then
		return 0, nPIdx1, nPIdx2;
	end

	BWT_QuitGestConvention(nPIdx1);
	BWT_QuitGestConvention(nPIdx2);
	return 1, nPIdx1, nPIdx2;
end
--���������ҵ�״̬�Ƿ���Բμӱ���
function BWT_CheckAllPlayerState()
	local nQueueSize	= GetGestQueueSize();
	local tFailPlayer	= {};
	for i = 0, nQueueSize - 1 do
		local nPIdx = GetPlayerByGestQueueIndex(i);
--		if 0 == CheckXYY(nPIdx) then
--			tinsert(tFailPlayer, nPIdx);
--		end
	end

	tFailPlayer.n = nil;
	for _, nPIdx in tFailPlayer do
		BWT_QuitGestConvention(nPIdx);
		GLB_BW_LEAVE(200, nPIdx);
	end
end
--����һ��Ҫ�۳���XX --���붼���ܹ��ɹ��۳���
function BWT_CostOneRount(nPIdx1, nPIdx2)
	GLB_BW_Block_Route_Cost(nPIdx1);
	GLB_BW_Block_Route_Cost(nPIdx2);
end
--�����ҵ�ǰ״̬�Ƿ���Խ�������
function BWT_CheckPlayerState(nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx;
	local nTimeElapse = GetTime() - GetTask(TSK_LAST_INVITE_TIME);
	if nTimeElapse >= 0 and nTimeElapse <= INVITE_INTERVAL_TIME then	--���nTimeElapseС��0,��ô��ʾ���ֹ������Ϊ�������������������
		BWDH_SetTask(TSK_CHECK_FAIL,0);	--Ҳ����ͨ��
		PlayerIndex = nOldPIdx;
		return 0;	--��������ϴξܾ���������ʱ��С��INVITE_INTERVAL_TIME��
	end;
	--PKֵ����4,��������̯�����ںϷ���ͼ
	if GetPKValue() >= 4 or IsPlayerDeath() == 1 or IsStalling() == 1 or BWT_CheckValidMap() == 0 then	--�����ǰ������״̬���ڰ�̯���ںϷ���ͼ
		BWDH_SetTask(TSK_CHECK_FAIL,1);	--������һ����鲻ͨ���ı��
		TaskTip("Tr�ng th�i c�a b�n hi�n kh�ng ���c t� v�, b�n �� r�i kh�i cu�c thi.");
		Msg2Player("Tr�ng th�i c�a b�n hi�n kh�ng ���c t� v�, b�n �� r�i kh�i cu�c thi. H�y ki�m tra �i�m PK c�a b�n c� ph�i >=4, hi�n c� ph�i � tr�ng th�i t� vong ho�c �ang � g�n Tuy�n Ch�u");
		PlayerIndex = nOldPIdx;
		return 0;
	end;
	BWDH_SetTask(TSK_CHECK_FAIL,0);	--���ͨ�����
	PlayerIndex = nOldPIdx;
	return 1;
end;
--��鵱ǰ������ͼ�ǲ��ǿ��Խ��ձ�������
function BWT_CheckValidMap(nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	local tbValidMap = {
				100,105,108,103,104,106,107,109,110,111,112,
				113,114,115,116,151,306,307,319,320,974,7100,
				};
	local nCurMapID = GetWorldPos();
	for i=1,getn(tbValidMap) do
		if nCurMapID == tbValidMap[i] then
			PlayerIndex = nOldPIdx;
			return 1;
		end;
	end;
	PlayerIndex = nOldPIdx;
	return 0;
end;
--��һ��ѡ�ַ��ͱ�������
function BWT_SentInviteToPlayer(nPIdx1,nPIdx2)
	local nHour = tonumber(date("%H"));
	if BWT_CheckBiWuTime() == 0 then
		return 0;	--���ڱ���ʱ����
	end;
	local nOldPIdx = PlayerIndex;
	if not nPIdx1 then	--���û���������
		nPIdx1,nPIdx2 = GetPairGestPlayer();
	end;
	if nPIdx1 == 0 and nPIdx2 == 0 then	--���û��Գɹ�
		return 0;
	end;
	BWT_QuitGestConvention(nPIdx1);	--ѡ���������˳��б�
	BWT_QuitGestConvention(nPIdx2);
	if BWT_CheckPlayerState(nPIdx1) == 0 or BWT_CheckPlayerState(nPIdx2) == 0 then
		return -1,nPIdx1,nPIdx2;
	end;
	local nCurTime = GetTime();
	PlayerIndex = nPIdx1;
	BWT_SetTaskTemp(TSK_TEMP_CHOICE,0);	--��ѡ�����
	BWDH_SetTask(TSK_LAST_INVITE_TIME,nCurTime);
	BWDH_SetTask(TSK_OPPNAME_HASH,Hash(GetName(nPIdx2)));	--��¼��������HASH�����ڻص�ʱ������ȷ��
	PlayerIndex = nPIdx2;
	BWT_SetTaskTemp(TSK_TEMP_CHOICE,0);
	BWDH_SetTask(TSK_OPPNAME_HASH,Hash(GetName(nPIdx1)));
	BWDH_SetTask(TSK_LAST_INVITE_TIME,nCurTime);
	OnWant(nPIdx1,nPIdx2);
	PlayerIndex = nOldPIdx;
	return 1;
end;
--��ȡ��ʱ������ֵ
function BWT_GetTaskTemp(nID,nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	local nValue = GetTaskTemp(TSK_TEMP_CHOICE);
	PlayerIndex = nOldPIdx;
	return nValue;
end;
--������ʱ����
function BWT_SetTaskTemp(nID,nValue,nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	SetTaskTemp(nID,nValue);
	PlayerIndex = nOldPIdx;
end;
--��ȡ��̬���䳡��ID
function BWT_GetIdleRoom()
	local nCount = 0;
	local nMapID,nMapIdx = 0,0;
	for i,v in TB_MAPID do
		if SubWorldID2Idx(i) >= 0 then
			nCount = GetMapLoadCount(v[2]);
			if nCount < MAX_ROOM_NUM then
				nMapID,nMapIdx = DynamicLoadMap(v[2]);
				return nMapID,nMapIdx,i;
			end;
		end;
	end;
	return 0,0,0;
end;
--����һ������
function BWT_OpenMatch(nPIdx1,nPIdx2)
	local nMapID,nMapIdx,nCityID = BWT_GetIdleRoom();
	if nMapID == 0 and nMapIdx == 0 then
		return 0;
	end;
	local nOldPIdx = PlayerIndex;
--	local nDirection,nNum = BWT_GetFieldDirection(nCityID);
--	if nDirection == 0 then
--		gf_ShowDebugInfor("BWT_GetFieldDirection����ֵΪ0,0");
--		WriteLog("["..LOG_ERROR_HEAD.."]:BWT_GetFieldDirection����ֵΪ0,0");
--		print("Fail2");
--		return 0;
--	end;
	if mf_OpenMission(MISSION_ID,nMapID) == 1 then
		mf_SetMissionV(MISSION_ID,MV_CITY_ID,nCityID,nMapID);
		mf_SetMissionV(MISSION_ID,MV_MAPID,nMapID,nMapID);
		mf_SetMissionV(MISSION_ID,MV_MAPIDX,nMapIdx,nMapID);
--		mf_SetMissionV(MISSION_ID,MV_FIELD_DIRECTION,nDirection,nMapID);
		mf_SetMissionV(MISSION_ID,MV_FIELD_NUM,nNum,nMapID);
		PlayerIndex = nPIdx1;
		mf_JoinMission(MISSION_ID,A_CAMP,nMapID);
		PlayerIndex = nPIdx2;
		mf_JoinMission(MISSION_ID,B_CAMP,nMapID);
--		BWT_InitOneRound();	--�ٳ�ʼ��һ��
		WriteLog(format("[��i H�i T� V� b�t ��u] [Hai b�n ��i tr�n: %s vs %s] [Th�ng tin tr�n ��u: %d,%d,%d]",GetName(nPIdx1),GetName(nPIdx2),nMapID,nMapIdx,nCityID))
	end;
	PlayerIndex = nOldPIdx;
end;
--�رձ��䳡��
function BWT_CloseField()
	local nMapID = GetMissionV(MV_MAPID);
	local nMapIdx = GetMissionV(MV_MAPIDX);
	CloseMission(MISSION_ID);
	local nRetCode = FreeDynamicMap(nMapID,nMapIdx);	--FreeDynamicMapҲ�����CloseMisssion
	if nRetCode == 0 then
		WriteLog("["..LOG_ERROR_HEAD.."]:FreeDynamicMap b� l�i, nRetCode:"..nRetCode);
	end;
	WriteLog(format("[��i H�i T� V� k�t th�c] [Th�ng tin tr�n ��u: %d,%d]",nMapID,nMapIdx))
end;
--������װ���Ƿ���ϱ���涨��������Ϲ涨����1,�����Ϸ���0��һ��table
--table����ָ���˻�����Щλ�õ�װ��������
function BWT_CheckEquipment(nPIdx)
	do--����װ��������
		return 1
	end
	
--	local nOldPIdx = PlayerIndex;
--	PlayerIndex = nPIdx or PlayerIndex;
--	local nEquipIdx = 0;
--	local nCheckNum = 0;
--	local tbEquipPos = {};	--װ����Ϣtable
--	for i=1,6 do	--���ͷ�¿���������1����2
--		nEquipIdx = GetPlayerEquipIndex(i-1);
--		if nEquipIdx == 0 then	--û��װ��
--			nCheckNum = nCheckNum + 1;
--			tbEquipPos[i] = 1;
--		else
--			if BWT_CheckSuohunEquip(nEquipIdx) == 1 then
--				if BWT_CheckNormalEquip(nEquipIdx) == 1 or BWT_CheckSuitEquip(nEquipIdx) == 1 then	--��װ����ͨװ���ɹ�
--					nCheckNum = nCheckNum + 1;
--					tbEquipPos[i] = 1;
--				else
--					tbEquipPos[i] = 0;
--				end;
--			else
--				tbEquipPos[i] = 0;
--			end
--		end;
--	end;
--	for i=7,12 do	--���ͷ�¿���������1����2
--		nEquipIdx = GetPlayerEquipIndex(i-1);
--		if nEquipIdx == 0 then	--û��װ��
--			nCheckNum = nCheckNum + 1;
--			tbEquipPos[i] = 1;
--		else
--			if BWT_CheckSuohunEquip(nEquipIdx) == 1 then
--				nCheckNum = nCheckNum + 1;
--				tbEquipPos[i] = 1;
--			else
--				tbEquipPos[i] = 0;
--			end
--		end;
--	end;
--	PlayerIndex = nOldPIdx;
--	if nCheckNum == 12 then	--����װ����ͨ�����
--		return 1,tbEquipPos;
--	else
--		return 0,tbEquipPos;
--	end;
end;

--�������װ���Ƿ����Լ����ֵ�����װ��
function BWT_CheckSuohunEquip(nEquipIdx)
	local nOwnName = GetItemOwner(nEquipIdx);
	local nPlayerName = GetName();
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 then
		local strGbGroup,strName = GLB_BW_GetRealmName(GetName());
		nPlayerName = strName;
	end
	if nOwnName == "" or nOwnName == nPlayerName then
		return 1;
	else
		return 0;
	end
end

--�����װ
function BWT_CheckSuitEquip(nEquipIdx)
	if BWT_CheckBaGuaSuit(nEquipIdx) == 1
		or BWT_CheckRouteSuitID(nEquipIdx) == 1
		or BWT_CheckCangJianSuitID(nEquipIdx) == 1
		or BWT_ShiTuSuitID(nEquipIdx) == 1 then
		return 1;
	else
		return 0;
	end;
end;
--������װID
function BWT_CheckBaGuaSuit(nEquipIdx)
	if GetItemMaxLingQi(nEquipIdx) > 0 then
		return 1;
	end;
	return 0;
end;
--���ʦ��װID
function BWT_CheckRouteSuitID(nEquipIdx)
	local nRoute = GetPlayerRoute();
	local nSuitID = GetEquipSuitID(nEquipIdx);
	for i=1,getn(TB_ROUTE_SUIT_ID[nRoute]) do
		if nSuitID == TB_ROUTE_SUIT_ID[nRoute][i] then
			return 1;
		end;
	end;
	return 0;
end;
--���ؽ���װID
function BWT_CheckCangJianSuitID(nEquipIdx)
	local nRoute = GetPlayerRoute();
	local nSuitID = GetEquipSuitID(nEquipIdx);
	for i=1,getn(TB_CANGJIAN_SUIT_ID) do
		if nSuitID == TB_CANGJIAN_SUIT_ID[i] then
			return 1;
		end;
	end;
	return 0;
end;
--���ʦͽװ��װID
function BWT_ShiTuSuitID(nEquipIdx)
	local nRoute = GetPlayerRoute();
	local nSuitID = GetEquipSuitID(nEquipIdx);
	for i=1,getn(TB_SHITU_SUIT_ID) do
		if nSuitID == TB_SHITU_SUIT_ID[i] then
			return 1;
		end;
	end;
	return 0;
end;
--�����ͨװ��
function BWT_CheckNormalEquip(nEquipIdx)
	if BWT_CheckHatID(nEquipIdx) == 1
		or BWT_CheckClothID(nEquipIdx) == 1
		or BWT_CheckTrousersID(nEquipIdx) == 1
		or BWT_CheckRingID(nEquipIdx) == 1
		or BWT_CheckWeaponID(nEquipIdx) == 1 then
		return 1;
	else
		return 0;
	end;
end;
--�������ID
function BWT_CheckRingID(nEquipIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx);
	if nID1 == 0 and nID2 == 102 then
		for i=1,getn(TB_RING_ID) do
			if type(TB_RING_ID[i]) == "table" then
				if nID3 >= TB_RING_ID[i][1] and nID3 <= TB_RING_ID[i][2] then
					return 1;
				end
			else
				if nID3 == TB_RING_ID[i] then
					return 1;
				end
			end
		end;
	end;
	return 0;
end;
--���ñ��ID
function BWT_CheckHatID(nEquipIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx);
	if nID1 == 0 and nID2 == 103 then
		for i=1,getn(TB_HAT_ID) do
			if type(TB_HAT_ID[i]) == "table" then
				if nID3 >= TB_HAT_ID[i][1] and nID3 <= TB_HAT_ID[i][2] then
					return 1;
				end
			else
				if nID3 == TB_HAT_ID[i] then
					return 1;
				end
			end
		end;
	end;
	return 0;
end;
--����·�ID
function BWT_CheckClothID(nEquipIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx);
	if nID1 == 0 and nID2 == 100 then
		for i=1,getn(TB_CLOTH_ID) do
			if type(TB_CLOTH_ID[i]) == "table" then
				if nID3 >= TB_CLOTH_ID[i][1] and nID3 <= TB_CLOTH_ID[i][2] then
					return 1;
				end
			else
				if nID3 == TB_CLOTH_ID[i] then
					return 1;
				end
			end
		end;
	end;
	return 0;
end;
--������ID
function BWT_CheckTrousersID(nEquipIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx);
	if nID1 == 0 and nID2 == 101 then
		for i=1,getn(TB_TROUSERS_ID) do
			if type(TB_TROUSERS_ID[i]) == "table" then
				if nID3 >= TB_TROUSERS_ID[i][1] and nID3 <= TB_TROUSERS_ID[i][2] then
					return 1;
				end
			else
				if nID3 == TB_TROUSERS_ID[i] then
					return 1;
				end
			end
		end;
	end;
	return 0;
end;
--�������ID
function BWT_CheckWeaponID(nEquipIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx);
	for i=1,getn(TB_WEAPON_ID) do
		if nID1 == TB_WEAPON_ID[i][1] and nID2 == TB_WEAPON_ID[i][2] and nID3 == TB_WEAPON_ID[i][3] then
			return 1;
		end;
	end;
	return 0;
end;
--��ʼ������NPC
function BWT_InitFieldNpc()
	local nMapID = gf_GetCurMapID();
	local nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n","Th� kh�",nMapID,1533,3170);
	SetNpcScript(nNpcIdx,"\\script\\biwudahui\\npc\\npc_itemkeeper.lua");
	nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n","Th� kh�",nMapID,1655,3317);
	SetNpcScript(nNpcIdx,"\\script\\biwudahui\\npc\\npc_itemkeeper.lua");
end;
--��ÿ��õı��䳡�صķ�������
function BWT_GetFieldDirection(nCityID)
	local tbMapID = gf_GetDataTable(GetSameMaps(TB_MAPID[nCityID][2]));
	local tbFieldInfo = {};
	local nMapID = 0;
	local nDirection,nNum = 0,0;
	for i=1,getn(tbMapID) do
		nMapID = tbMapID[i];
		if nMapID ~= TB_MAPID[nCityID][2] then
			if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,nMapID) ~= MS_STATE_IDEL then
				nDirection = mf_GetMissionV(MISSION_ID,MV_FIELD_DIRECTION,nMapID);
				nNum = mf_GetMissionV(MISSION_ID,MV_FIELD_NUM,nMapID);
				tinsert(tbFieldInfo,{nDirection,nNum});
			end;
		end;
	end;
	local bFound = 0;
	for i=1,4 do  --�ĸ�����
		for j=1,8 do  --ÿ�������м�������
			bFound = 0;
			for k=1,getn(tbFieldInfo) do
				if tbFieldInfo[k][1] == i and tbFieldInfo[k][2] == j then
					bFound = 1;
				end;
			end;
			if bFound == 0 then
				return i,j;
			end;
		end;
	end;
	return 0,0;
end;
--���ĳ���������Ϣ����������˫�����������ص�ǰ״̬���Ƿ�����ۿ�
function BWT_GetMatchInfo(nCityID,nDirection,nNum)
	local nMapID = BWT_GetDesMapID(nCityID,nDirection,nNum);
	if nMapID == 0 then
		return 0,0,0,0;
	end;
	local szName1,szName2 = BWT_GetFighterName(nMapID);
	local nState = mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,nMapID);
	local nPIdx1 = mf_GetMissionV(MISSION_ID,MV_PLAYERINDEX1,nMapID);
	local nPIdx2 = mf_GetMissionV(MISSION_ID,MV_PLAYERINDEX2,nMapID);
	if GetTask(TSK_ALLOW_AUDIENCE,nPIdx1) == 1 and GetTask(TSK_ALLOW_AUDIENCE,nPIdx2) == 1 then
		return nPIdx1,nPIdx2,nState,1;
	else
		return nPIdx1,nPIdx2,nState,0;
	end;
end;
--���Ŀ������ͼ�ĵ�ͼID��������ص�ͼIDΪ0���ʾ�ó���δ����
function BWT_GetDesMapID(nCityID,nDirection,nNum)
	local nFieldID = TB_MAPID[nCityID][2];
	local tbMapID = gf_GetDataTable(GetSameMaps(nFieldID));
	local nMapID = 0;
	local nFieldDirection,nFieldNum = 0,0;
	for i=1,getn(tbMapID) do
		nMapID = tbMapID[i];
		nFieldDirection = mf_GetMissionV(MISSION_ID,MV_FIELD_DIRECTION,nMapID);
		nFieldNum = mf_GetMissionV(MISSION_ID,MV_FIELD_NUM,nMapID);
		if nFieldDirection == nDirection and nFieldNum == nNum then
			return nMapID;
		end;
	end;
	return 0;
end;
--���ڼ���ۿ�
function BWT_AudienceJoin(nCityID,nDirection,nNum,bAllow)
	if bAllow == 0 then
		Talk(1,"","Xin l�i! Ng��i ch�i � T� v� tr��ng n�y kh�ng cho ng��i kh�c xem thi ��u.");
		return 0;
	end;
	local nMapID = BWT_GetDesMapID(nCityID,nDirection,nNum);
	local nState = mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,nMapID);
	local nAudienceNum = mf_GetPlayerCount(MISSION_ID,AUDIENCE_CAMP,nMapID);
	if nState == MS_STATE_IDEL then
		Talk(1,"","Khu v�c n�y �� b� ��ng.");
		return 0;
	end;
	if nAudienceNum >= MAX_AUDIENCE_NUM then
		Talk(1,"","S� l��ng ng��i khu v�c n�y �� ��t gi�i h�n t�i �a: <color=yellow>"..MAX_AUDIENCE_NUM.."<color> ng��i");
		return 0;
	end;
	mf_JoinMission(MISSION_ID,AUDIENCE_CAMP,nMapID);
end;
--����Trap�㡣
--�������Ϊ���򡣺���������г����ڴ����ж�
function BWT_ProcessTrap(nDirection)
	do
		return 0
	end
	if GetTaskTemp(TSK_TEMP_CAMP) == 0 then	--����Trap�㴦��
		local selTab = {};
		local nCityID = 0;
		local nCurMapID = GetWorldPos();
		local nPIdx1,nPIdx2 = 0,0;
		local nState = 0;
		for i,v in TB_MAPID do
			if v[1] == nCurMapID then
				nCityID = i;
				break;
			end;
		end;
		for i=1,8 do
			nPIdx1,nPIdx2,nState,bAllow = BWT_GetMatchInfo(nCityID,nDirection,i);
			if nState > MS_STATE_IDEL then
				tinsert(selTab,format("Ta mu�n v�o"..i.." - (khu thi ��u)/#BWT_AudienceJoin(%d,%d,%d,%d)",nCityID,nDirection,i,bAllow));
			end;
		end;
		if getn(selTab) == 0 then
			Talk(1,"","L�i ��i n�y kh�ng c� ng��i thi ��u");
			return 0;
		end;
		tinsert(selTab,"Kh�ng v�o xem/nothing");
		local tbDirection = {"H��ng ��ng","H��ng nam","H��ng T�y","H��ng B�c"};
		Say("B�n mu�n v�o khu v�c n�o trong <color=yellow>"..tbDirection[nDirection].."<color>?",getn(selTab),selTab);
	else	--����Trap�㴦��
		DelMSPlayer(MISSION_ID,AUDIENCE_CAMP);
	end;
end;

--��¼ʤ����nResultTypeΪ1ʱ��ʾƽ��
function BWT_AddBiWuRecord(nWinnerIdx,nLoserIdx,nResultType)
	nResultType = nResultType or 0;
	local nOldPIdx = PlayerIndex;
	local nCurWeekWin = 0;
	local nCurXinDeNum = 0;
	local nCount = 0;
	PlayerIndex = nWinnerIdx;
	BWDH_SetTask(TASKID_BIWU_MATCH_RESULT, 1);
	BWDH_SetTask(TSK_CURWEEKMATCH,GetTask(TSK_CURWEEKMATCH)+1);
	BWDH_SetTask(TSK_TOTALMATCH,GetTask(TSK_TOTALMATCH)+1);
	if GetTask(TSK_CURWEEKMATCH) <= REQUIRE_MATCH_TIME then --��¼ǰ10����ʤ����
		BWDH_SetTask(TASK_BIWU_WIN_10,GetTask(TASK_BIWU_WIN_10)+1);
	end
	if GetTask(TSK_CURWEEKMATCH) >= REQUIRE_MATCH_TIME then --10����ǿ�ƵǼ�
		BWDH_SetTask(TSK_CURSIGNEDRESULT,GetTask(TSK_CURREALRESULT));
		SignUpGestResult();
	end
	if nResultType ~= 1 then
		nCurWeekWin = GetTask(TSK_CURWEEKWIN);
		BWDH_SetTask(TSK_TOTALWIN,GetTask(TSK_TOTALWIN)+1);
		BWDH_SetTask(TSK_CURWEEKWIN,nCurWeekWin+1);
		--�ɾ�---------------------------------------
--		BWDH_SetTask(TASKID_ACH_BIWU_WIN_TOTAL,GetTask(TASKID_ACH_BIWU_WIN_TOTAL)+1);
--		local nRoute = GetPlayerRoute();
--		local nLoseRoute = GetPlayerRoute(nLoserIdx);
--		if nRoute == 31 or nRoute == 32 then
--			BWDH_SetTask(TASKID_ACH_USE_NEW_ROUTE,GetTask(TASKID_ACH_USE_NEW_ROUTE)+1);
--		end
--		if nLoseRoute == 31 or nLoseRoute == 32 then
--			BWDH_SetTask(TASKID_ACH_WIN_NEW_ROUTE,GetTask(TASKID_ACH_WIN_NEW_ROUTE)+1);
--		end
		----------------------------------------------
--		if GLB_BW_BiWuCheck() == 1 then	
--			if GetTask(TSK_CURWEEKWIN) <= REQUIRE_MATCH_TIME then --ǰ10����
--				BWDH_SetTask(TASK_BIWU_DUIZHAN_JINGYAN,GetTask(TASK_BIWU_DUIZHAN_JINGYAN)+12);
--				Msg2Player("����12���ս���飬ÿ��ÿ�ܿ��Ի��120���ս���飬���Ѿ������"..(GetTask(TSK_CURWEEKWIN)*12).."���ս����");
--			end
--		end
		WLZB_AddPoint();	-- baqizhi
	end;
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 and GLB_BW_BiWuCheck() == 1 then --�ѱ���д�����ݿ�
		--GLB_BW_SetTask(0,0,tRelayTask);
		
		exgsvr_func_save_player_task()--��Դ������
--		local nRoute = GetPlayerRoute();
--		if nRoute == 21 then --���ĵĹ�ʦ
--			GLB_BW_SetTask(0,1,tGushiTask);
--		end
--		GLB_BW_SetTask(0,2);--ͬ����ң��
--		GLB_BW_SetTask(0,3);--ͬ����ң��
	end
	WriteLog(format("[��i H�i T� V�] [Role: %s Acc: %s  C�p: %d  t�ch �i�m: %d  m�n ph�i: %d   K�t qu�: th�ng K� hi�u h�a: %d]", GetName(), GetAccount(), GetLevel(),GetTask(TSK_CURREALRESULT),GetPlayerRoute(),nResultType));
	PlayerIndex = nLoserIdx;
	BWDH_SetTask(TASKID_BIWU_MATCH_RESULT, 0);
	BWDH_SetTask(TSK_CURWEEKMATCH,GetTask(TSK_CURWEEKMATCH)+1);
	BWDH_SetTask(TSK_TOTALMATCH,GetTask(TSK_TOTALMATCH)+1);
	if GetTask(TSK_CURWEEKMATCH) <= REQUIRE_MATCH_TIME then --��¼ǰ10���ĸ�����
		BWDH_SetTask(TASK_BIWU_LOSE_10,GetTask(TASK_BIWU_LOSE_10)+1);
	end
	if GetTask(TSK_CURWEEKMATCH) >= REQUIRE_MATCH_TIME then --10����ǿ�ƵǼ�
		BWDH_SetTask(TSK_CURSIGNEDRESULT,GetTask(TSK_CURREALRESULT));
		SignUpGestResult();
	end
	if nResultType ~= 1 then
		BWDH_SetTask(TSK_TOTALLOSE,GetTask(TSK_TOTALLOSE)+1);
		BWDH_SetTask(TSK_CURWEEKLOSE,GetTask(TSK_CURWEEKLOSE)+1);
		if GLB_BW_BiWuCheck() == 1 then
--			if GetTask(TSK_CURWEEKMATCH) <= REQUIRE_MATCH_TIME then --ǰ10���У��Ѿ��޸�Ϊʧ��û����
--				BWDH_SetTask(TASK_BIWU_DUIZHAN_JINGYAN,GetTask(TASK_BIWU_DUIZHAN_JINGYAN)+8);
--				Msg2Player("����8���ս���飬ÿ�ܵ�ǰ10�����տ��Ի�ö�ս���顣");
--			end
		end
		WLZB_DecPoint();	-- baqizhi
	end;
	if nCurGs == 1 and GLB_BW_BiWuCheck() == 1 then --�ѱ���д�����ݿ�
		exgsvr_func_save_player_task()--��Դ������
--		GLB_BW_SetTask(0,0,tRelayTask);
--		local nRoute = GetPlayerRoute();
--		if nRoute == 21 then --���ĵĹ�ʦ
--			GLB_BW_SetTask(0,1,tGushiTask);
--		end
--		GLB_BW_SetTask(0,2);
--		GLB_BW_SetTask(0,3);
	end
	WriteLog(format("[��i H�i T� V�] [Role: %s Acc: %s  C�p: %d  t�ch �i�m: %d  m�n ph�i: %d   K�t qu�: b�i K� hi�u h�a: %d]", GetName(), GetAccount(), GetLevel(),GetTask(TSK_CURREALRESULT),GetPlayerRoute(),nResultType));
	PlayerIndex = nOldPIdx;
end;
--�������
function BWT_GetWeekNum()
--	local nCurTime = GetTime();
--	local nOffset = 8*3600*24+13*3600; 	--��ʱ�һ�û������
--	nCurTime = nCurTime - nOffset;
--	return floor(nCurTime/(7*3600*24));
	local nWeekNum = GetPlayerBwRank();
	return nWeekNum;
end;
--ÿ��һ�塣��ס��playerloginin�ﻹ��һ��һģһ���Ĵ���
function BWT_WeeklyClear()
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 then --�������
		return 0;
	end
	local nWeekNum = BWT_GetWeekNum();
	local nBodyWeek = GetTask(TSK_BODY_WEEK);
	if nWeekNum == -1 then	--Relay����
		return 0;
	end;
	if nBodyWeek - nWeekNum >= 1 then	--�Ϸ���nWeekNum���0��ʼ
		WriteLog(format("[biwudahui] BWT_WeeklyClear [Role:%s Acc:%s Level:%d BodyWeek=%d WeekNum=%d repair BodyWeek ]", GetName(), GetAccount(), GetLevel(),nBodyWeek, nWeekNum))
		BWDH_SetTask(TSK_BODY_WEEK,nWeekNum-1);	--ͬ��������ϵ�����
		BWDH_SetTask(TSK_GET_AWARD_WEEK,nWeekNum-1);	--ͬ�������ȡ����������
		nBodyWeek = nWeekNum-1;
	end;
	if nBodyWeek >= nWeekNum then
		return 0;
	end;
	BWT_PointAttenuation();
	BWDH_SetTask(TSK_CURWEEKMATCH,0);	--�����ܲ��볡��
	BWDH_SetTask(TSK_CURWEEKWIN,0);		--����ʤ������
	BWDH_SetTask(TSK_CURWEEKLOSE,0);		--����ʧ�ܳ���
	BWDH_SetTask(TSK_CURWEEKGETXINDE,0);	--����ͨ�����ջ�õ��ĵ�����
	BWDH_SetTask(TSK_CURSIGNEDRESULT,0);	--�Ǽǻ�����0
	BWDH_SetTask(TSK_GET_XINDE_STATE,0);	--���ܻ��ʵս�ĵ������0
	BWDH_SetTask(TSK_USE_XINDE,0);		--����ʹ��ʵս�ĵ��声
	BWDH_SetTask(TSK_BUY_HORSE,0);		--���������声
	BWDH_SetTask(TSK_USE_CHUANGONG_XINDE,0);	--ʹ�ô����ĵ�
	BWDH_SetTask(TSK_XZ_AWARD_JUNGONG,0);	--���ܶһ���ս����������
	BWDH_SetTask(TSK_XZ_AWARD_SHIMEN,0);		--���ܶһ���ʦ�Ž�������
	BWDH_SetTask(TSK_XZ_AWARD_LINGSHI,0);	--���ܶһ�����ʯ��������
	BWDH_SetTask(TSK_XZ_AWARD_JINGYAN,0);	--���ܶһ��ľ��齱������
	BWDH_SetTask(TASK_BIWU_WIN_10,0);	--ǰ10����ʤ������
	BWDH_SetTask(TASK_BIWU_LOSE_10,0);	--ǰ10����ʧ�ܳ���
	BWDH_SetTask(TASK_BIWU_GET_AWARD_10,0);	--�Ƿ���ȡ��ǰ10���Ľ���
--	BWDH_SetTask(TASKID_3F_BW_AWARD,0); --���ڻ
	if GetTask(TSK_CURREALRESULT) < 200 then
		BWDH_SetTask(TSK_CURREALRESULT,200);	--����100�ֵĻع鵽100��
	end;
end;
--���������װ��
function BWT_LockEquipment(bLock)
	local tbEquipPos = {0,1,2,3,4,5,6,7,8,10,17,18,19};
	for i=1,getn(tbEquipPos) do
		ForbidEquipSolt(tbEquipPos[i],bLock);
	end
end;
--����Ƿ�Ҫ�ѹ����߳�����
function BWT_CheckKickAudience()
	local nPIdx1 = mf_GetMissionV(MISSION_ID,MV_PLAYERINDEX1);
	local nPIdx2 = mf_GetMissionV(MISSION_ID,MV_PLAYERINDEX2);
	if nPIdx1 == 0 or nPIdx2 == 0 then
		return 0;
	end;
	if GetTask(TSK_ALLOW_AUDIENCE,nPIdx1) == 0 or GetTask(TSK_ALLOW_AUDIENCE,nPIdx2) == 0 then
		mf_Say2Camp(MISSION_ID,AUDIENCE_CAMP,"Tuy�n th� thi ��u kh�ng mu�n c� ng��i xem, b�n �� tho�t kh�i khu v�c thi ��u.",0,"");
		mf_DelAllMSPlayer(MISSION_ID,AUDIENCE_CAMP);
		return 1;
	end;
	return 0;
end;

--�޸Ľ��ջ���
function BWT_AddPoint(nPoint,nPIdx)
	local nOldPIdx = PlayerIndex;
	nPIdx = nPIdx or PlayerIndex;
	BWT_WeeklyClear();
	local nCurPoint = GetTask(TSK_CURREALRESULT);
	local nRegPoint = GetTask(TSK_CURSIGNEDRESULT);
	nCurPoint = nCurPoint + nPoint;
	BWDH_SetTask(TSK_CURREALRESULT,nCurPoint);
	if nPoint > 0 then
		BWDH_SetTask(TSK_TOTAL_POINT,GetTask(TSK_TOTAL_POINT)+nPoint);
	end;
	if GetTask(TSK_CURWEEKMATCH) >= REQUIRE_MATCH_TIME then --�����ǰ������֮ǰ�Ǽǵķ���Ҫ��30��
		BWDH_SetTask(TSK_CURSIGNEDRESULT,nCurPoint);
--		SignUpGestResult();	--ǿ�ưѷ����Ǽ���ȥ
--		gf_ShowMsg("����ǰ����ʵ���ֱȵǼǻ��ֵ���30�ֻ���࣬����ϵͳ����ǿ�еǼǣ������ڵĵǼǻ�����<color=yellow>"..nCurPoint.."<color>��",2);
	end;
	if GetTask(TSK_JOIN_LIST) == 1 then
		QuitGestConvention();
		JoinGestConvention();
	end;
	PlayerIndex = nOldPIdx;
end;
--���ֽ���˥��
function BWT_PointAttenuation()
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if nWeekNum == -1 then	--Relay����
		return 0;
	end;
	local nBodyWeek = GetTask(TSK_BODY_WEEK);
	if nBodyWeek >= nWeekNum then
		return 0;
	end;
	local nCurPoint = GetTask(TSK_CURREALRESULT);
	local nWeekElapse = nWeekNum - nBodyWeek;
	local nAttenPoint = BWT_GetPointAttenuation(nCurPoint,nWeekElapse);
	if nCurPoint-nAttenPoint > 0 then
		Msg2Player("�i�m t�ch l�y t� v� gi�m"..(nCurPoint-nAttenPoint).." �i�m");
	end;
	BWDH_SetTask(TSK_CURREALRESULT,nAttenPoint);
	BWDH_SetTask(TSK_BODY_WEEK,nWeekNum);	--��¼˥��������
	BWDH_SetTask(TSK_LASTWEEKLADDER,0);	--˥��ʱ�����������
	if nBWRank ~= -1 and nBWRank <= 10 then	--������������а�
		BWDH_SetTask(TSK_LASTWEEKLADDER,nBWRank);
		local nBestWeekRank = GetTask(TSK_HIGHESTWEEKLADDER);
		if nBestWeekRank == 0 or nBWRank < nBestWeekRank then
			BWDH_SetTask(TSK_HIGHESTWEEKLADDER,nBWRank);	--���������
		end;
	end;
	WriteLog("["..LOG_HEAD.."]:"..GetName().."�i�m t�ch l�y t� v� gi�m. Tr��c l�c gi�m: "..nCurPoint..", sau khi gi�m: "..nAttenPoint);
end;
--��װ��QuitGestConvention
function BWT_QuitGestConvention(nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	QuitGestConvention();
	BWDH_SetTask(TSK_JOIN_LIST,0);
--	if BWDH_DEBUG_VERSION == 1 then
--		Msg2Player("QuitGestConvention")
--	end
	PlayerIndex = nOldPIdx;
end;
--��װ��JoinGestConvention
function BWT_JoinGestConvention(nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	local nLevel = GetLevel();
	if nLevel >= MIN_LEVEL then
		JoinGestConvention();
		BWDH_SetTask(TSK_JOIN_LIST,1);
	end;
--	if BWDH_DEBUG_VERSION == 1 then
--		Msg2Player("JoinGestConvention")
--	end
	PlayerIndex = nOldPIdx;
end;
--���俪ʼʱ����ҽ��е�����
function BWT_SetPlayerFightState(nCamp,nPIdx)
	local nOldPIdx = PlayerIndex;
	nPIdx = nPIdx or PlayerIndex;
	PlayerIndex = nPIdx;
	BWT_LockEquipment(1);
	UseSkillEnable(1);
	DesaltPlayer(0,0);
	Restore();
	RestoreNeili();
	ClearColdDown();	--�������ҩCD
	CastState("imme_clear_skill_interval",-1,0);	--�������м��ܵ���ȴʱ��
	PlayerIndex = nOldPIdx;
end;
--����������λ��
function BWT_SetRandomPos(nPIdx, nExcept)
	local nOldPIdx = PlayerIndex;
	nPIdx = nPIdx or PlayerIndex;
	PlayerIndex = nPIdx;
	local nRand = random(1,getn(TB_ENTRY[4]));
	if nExcept and nExcept == nRand then
		nRand = nRand + 1
		if nRand > getn(TB_ENTRY[4]) then
			nRand = 1
		end
	end
	SetPos(TB_ENTRY[4][nRand][1],TB_ENTRY[4][nRand][2]);
	Restore();
	RestoreNeili();
	PlayerIndex = nOldPIdx;
	return nRand
end;
--�������˥��������ֵ�Ǿ���˥����Ļ��֣������������ú������Ⱑ-_-b��
function BWT_GetPointAttenuation(nPoint,nWeek)
	if nPoint <= 300 then
		return nPoint;
	end;
	for i=1,nWeek do
		if nPoint <= 300 then
			break;
		else
			nPoint = nPoint - floor((nPoint-300)/2);
		end;
	end;
	return nPoint;
end;
--��á�һ�ܡ�ʣ��ʱ�䣨��λ�룩
function BWT_GetWeekTimeLeft()
	local nWeekDay = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));
	local nSecLeft = 60*60*24-(nHour*3600+nMin*60+nSec);
	local nTime = 0;
	if nWeekDay < 5 then
		nTime = (5-nWeekDay-1)*3600*24+nSecLeft+21*3600;
	elseif nWeekDay == 5 then
		nTime = 6*3600*24+nSecLeft+21*3600;
	else
		nTime = (11-nWeekDay)*3600*24+nSecLeft+21*3600;
	end;
	return nTime;
end;
--����ǲ����ڱ���ʱ���
function BWT_CheckBiWuTime()
--	local nWeekDay = tonumber(date("%w"));
--	if nWeekDay ~= 0 and nWeekDay ~= 1 and nWeekDay ~= 6 then
--		return 0;
--	end
	if BWDH_DEBUG_VERSION and BWDH_DEBUG_VERSION == 1 then
		return 1
	end
	
	local nHour = tonumber(date("%H"));
	--19����21��
	if nHour >= 20 and nHour < 22 then
		return 1
	else
		return 0;
	end;
end;
--==========================================================================================
--˵����ص����ݣ�����д��һ��ɣ���Ȼ������ȥ̫�鷳��
function know_detail()
	local selTab = {
				"��i h�i t� v�/know_detail_1",
				"So t�i/know_detail_2",
				"h�ng/know_detail_3",
				"�i�m/know_detail_4",
				--"����/know_detail_5",
				"Kh�ng c�n/nothing",
				}
	Say(g_szInfoHead.."B�n mu�n bi�t ph��ng di�n n�o?",getn(selTab),selTab);
end;

function know_detail_1()
	Talk(1,"know_detail",g_szInfoHead.."��i h�i t� v�\n    ��i h�i t� v� l� g�? �� ch�nh l� cu�c thi do tri�u ��nh t� ch�c nh�m tuy�n ch�n nh�n s� v� l�m �u t�, ���c chia l�m 2 giai �o�n: V�ng lo�i v� v�ng chung k�t. N�u b�n mu�n tham gia, c�n ph�i ��n Bi�n Kinh t�m ��c S� ��i H�i T� V�, �� l� ng��i ���c tri�u ��nh �� c� chuy�n ph�c tr�ch ��i h�i t� v�.\n    Ch� c� ng��i ch�i chuy�n sinh 5 c�p 96 tr� l�n m�i c� th� tham gia ��i h�i t� v� thi�n h� �� nh�t.");
end;

function know_detail_2()
	Talk(1,"know_detail_2_2",g_szInfoHead.."T� v� \n    T� v� nh� th� n�o? Sau khi t� v� li�n server m� ra, ��u ti�n b�n c�n t�m ��i s� ��i H�i T� V� �� ��n khu v�c t� v� li�n server. Sau ��, s� c� th� � giao di�n ��i H�i T� V� ch�n t� v�.\n   Mu�n t� v� r�t ��n gi�n, c� t� 20:00-22:00, ch� c�n b�n � trong khu v�c t� v� li�n server, trong giao di�n ��i H�i T� V� ch�n t� v� l� ���c r�i, h� th�ng s� t� ��ng gi�p b�n t�m ��i th�.\n   Ch� �, ch� c�n t�m ���c ��i th�, h� th�ng s� t� ��ng ��a b�n l�n l�i ��i t� v�.");
end;

function know_detail_2_1()
	Talk(1,"know_detail_2_2",g_szInfoHead.."Nh�n th�ng tin thi ��u � ��u?\n    Khu v�c b�n c� th� nh�n ���c th�ng tin thi ��u hi�n c�:\n    Tuy�n Ch�u, T�y Tuy�n Ch�u, B�c Tuy�n Ch�u, ��ng H�i H�i T�n 1, ��ng H�i H�i T�n 2, Long Tuy�n th�n, V� Di s�n, Thanh �m ��ng_1, Thanh �m ��ng_2, Thanh Kh� ��ng, L��ng Th�y ��ng_1, L��ng Th�y ��ng_2, V��ng M�u ��ng_1, V��ng M�u ��ng_2, V�n M�ng Tr�ch, Giang T�n th�n, Phong ��, Phong Ma ��ng_1, Phong Ma ��ng_2, b�n ngo�i ��i h�i t� v� Tuy�n Ch�u.");
end;

function know_detail_2_2()
	Talk(2,"know_detail",g_szInfoHead.."T� v� n�n ch� � g�? \n     �� m�i ng��i c� th� t� v� trong m�t m�i tr��ng c�ng b�ng, cho n�n ��t ra m�t s� quy t�c. Tr��c khi t� v� c�n ch� � n�i dung d��i ��y: \n1: khi ��a v�o l�i ��i t� v� t�t c� tr�ng th�i tr�n ng��i s� b� x�a, bao g�m pet �i theo ho�c thi th� do Ng� ��c T� Hi�p chi�u g�i c�ng b� x�a. \n2: ngo�i danh hi�u s� m�n ra, c�c danh hi�u kh�c ��u v� hi�u trong l�i ��i t� v�. \n3: Thu�c t�nh m�i 10 gi�y ph�c h�i sinh l�c v� n�i l�c tr�n trang b� s� v� hi�u\n","\n4: kh�ng th� ��i trang b�, nh�ng c� th� ��i m�t t�ch");
end;

function know_detail_3()
	Talk(1,"know_detail_3_1",g_szInfoHead.."X�p h�ng \n    	x�p h�ng th� n�o? n�u b�n t� v� �� 10 tr�n ho�c 10 tr�n tr� l�n trong tu�n, h� th�ng s� t� ��ng ��ng k� �i�m t�ch l�y c�a b�n. ��ng k� �i�m t�ch l�y th� c� th� tham gia x�p h�ng tu�n nay. 11 gi� 30 ph�t t�i ch� nh�t c�a m�i tu�n s� ti�n h�nh x�p h�ng. <color=yellow> ch� �: ph�i ��m b�o tr��c 11 gi� 30 ph�t tr� v� server ngu�n.<color>");
end;
function know_detail_3_1()
	Talk(1,"know_detail",g_szInfoHead.."X�p h�ng\n    X�p h�ng c� t�c d�ng g�? n�u x�p h�ng c� th� �i v�o top 10 c�a l�u ph�i, th� ng��i c� th� nh�n ���c �i�m t� c�ch v� gi�i th��ng; n�u x�p h�ng ��u c�a l�u ph�i, th� ch�c m�ng ng��i, ng��i �� l� �� nh�t cao th� c�a l�u ph�i m�nh tu�n nay, s� nh�n ���c �i�m x�p h�ng cao nh�t v� gi�i th��ng nhi�u nh�t.\n    Gamer x�p h�ng t�t s� �i v�o b�ng x�p h�ng ��i h�i t� v� li�n server.n�u ng��i ch�a v�o top 10 c�a l�u ph�i m�nh, ��ng n�n l�ng, ch� c�n t� v� �� 10 tr�n trong tu�n nay,c�ng c� th� nh�n th��ng.nh�n th��ng t�i giao di�n ��i h�i t� v�,click nh�n gi�i th��ng ti�n h�nh thao t�c t��ng quan.");
end;

function know_detail_4()
	Talk(1,"know_detail",g_szInfoHead.."X�p h�ng \n    �i�m l� g�? �i�m c�a ��i H�i T� V� c� 2 lo�i, m�t lo�i l� �i�m t�ch l�y t� v�, m�t lo�i l� �i�m t� c�ch. \n �i�m t�ch l�y t� v� l� �i�m t�ng v� gi�m khi t� v� nh�n ���c, h� th�ng ��ng k� xong s� x�p h�ng theo �i�m n�y, n�u �i�m v��t qua 300, m�i tu�n nh�ng �i�m v��t qua 300 �� s� b� gi�m n�a.");
end;

--function know_detail_5()
--	Talk(1,"know_detail_5_1",g_szInfoHead.."���������¼��֣�\n    ���飺�������������Ԥѡ��֮�󣬸���ÿ�ܲμӱ����ǰ10�����ս�����ڱ�	�������������ȡ��ʵս�ĵá���ÿ�ܴӽ������������õ�20����ʵս�ĵá���\n    ���ִﵽ120�ֿ����ڱ��������ȡ10��ʵս�ĵã����ִﵽ150�ֿ��Զ���ȡ10	��ʵս�ĵã����ִﵽ200�ֿ�������ȡ10��ʵս�ĵá�\n    ÿ�����ɻ�ȡ50����ʵս�ĵá���ÿ�ܿ���ʹ��100����ʵս�ĵá���");
--end;
--
--function know_detail_5_1()
--	Talk(1,"know_detail_5_2",g_szInfoHead.."    �̰壺�μӿ��������Ԥѡ�������ݱ��ܵ�ʤ�������ڱ����������ȡ�����໨	�ƿ̰影����ÿ��ÿ�����ɻ��10��ʤ��������\n    ��ս���飺�μӿ��������Ԥѡ������ʤ��ɻ�ö�ս���顣ÿ��ÿ�����ɻ��	10��ʤ���Ķ�ս���顣��ս������ڱ�������桰�һ�װ�������һ������໨�ƿ̰塣");
--end;
--
--function know_detail_5_2()
--	Talk(1,"know_detail",g_szInfoHead.."    �ƺţ�����������ǰ10����ר�ŵĳƺţ���1��һ������2��3��һ������4��10��һ������ͬ���εĳƺŻḽ��һ���������ӳɡ�\n    ���ֻҪ�õ������ɵ�ǰ3���������ʸ���ȡ�ض����צ�Ʒɵ����ã������ɵĵ�1���������������צ�Ʒɵ����á�\n    �⵽������ܹ�ά��7�졣");
--end
--===========================================================================================
--������Ҳ������ɣ���ȻҪ�޸������ط�̫�鷳�ˡ�
function BWT_GetAward()
	BWT_WeeklyClear();
	local strtab = {
		"Nh�n th��ng t� v� tu�n n�y/BWT_GetWeekAward",
		"Nh�n th��ng x�p h�ng tu�n tr��c/BWT_GetRankAward",
--		"��ȡ��������/BWT_GetGlobalAward",
		"K�t th�c ��i tho�i/nothing"
	};
	Say(g_szInfoHead.."B�n mu�n nh�n th��ng lo�i n�o?",
		getn(strtab),
		strtab)
end;

function BWT_GetWeekAward()
	local strtab = {
		"Nh�n th��ng tr�n tham gia/BWT_GetWeekAward_Win",
		--"��ȡ������ֵĽ���/BWT_GetWeekAward_Point",
		--"��ȡ�����ҽ���/BWT_GetWeekAward_Gold",
		"K�t th�c ��i tho�i/nothing",
	}
	local nDate = tonumber(date("%Y%m%d"));
--	if nDate <= 20101010 then
--		tinsert(strtab,3,"��ȡ�̻���ϰ�/BWT_GetYanhuo");
--	end
	Say(g_szInfoHead.."B�n mu�n nh�n th��ng lo�i n�o?",
		getn(strtab),
		strtab)
end

function BWT_GetWeekAward_Gold()
	if GetTask(TSK_CURWEEKWIN) < 10 then
		Talk(1,"",g_szInfoHead.."��i H�i T� V� tu�n n�y kh�ng th�ng �� 10 tr�n, kh�ng th� nh�n th��ng.");
		return 0;
	end
	if gf_GetTaskByte(TASK_BIWU_GET_AWARD_10,2) ~= 0 then
		Talk(1,"",g_szInfoHead.."B�n �� nh�n ph�n th��ng V�ng v� l�m c�a tu�n n�y.");
		return 0;
	end
	gf_SetTaskByte(TASK_BIWU_GET_AWARD_10,2,1, TASK_ACCESS_CODE_BIWUDAHUI);
	gf_SetLogCaption("��i H�i T� V�-Ph�n th��ng V�ng v� l�m");
	gf_Modify("Money",300000);
	gf_SetLogCaption("");
end

function BWT_GetWeekAward_Win()
	if GetTask(TSK_CURWEEKMATCH) < REQUIRE_MATCH_TIME then
		Talk(1,"",g_szInfoHead.."S� l�n ng��i tham gia so t�i tu�n n�y �t h�n <color=yellow>"..REQUIRE_MATCH_TIME.."<color> tr�n, kh�ng th� nh�n th��ng.");
		return 0;
	end
	if gf_GetTaskByte(TASK_BIWU_GET_AWARD_10,1) ~= 0 then
		Talk(1,"",g_szInfoHead.."B�n �� nh�n th��ng tr�n tham gia tu�n tr��c.");
		return 0;
	end
	
	local nExp = 20000000 --* GetTask(TASK_BIWU_WIN_10) / REQUIRE_MATCH_TIME
--	local nCount = GetTask(TASK_BIWU_WIN_10)*2+GetTask(TASK_BIWU_LOSE_10);
--	local nRingCount = min(GetTask(TSK_CURWEEKWIN),10)*4;  --ÿ�������10��ʤ���Ŀ̰�
	if nExp > 0 then
		if gf_Judge_Room_Weight(3,10,"") ~= 1 then
			return 0;
		end
		gf_SetTaskByte(TASK_BIWU_GET_AWARD_10,1,1, TASK_ACCESS_CODE_BIWUDAHUI);
		--soul_GivePoint(GetTask(TSK_CURWEEKWIN) * 10);
		gf_SetLogCaption("��i H�i T� V�-Ph�n th��ng tr�n tham gia")
		--gf_AddItemEx({2,1,1101,nCount},"ʵս�ĵ�");
		--gf_AddItemEx({2,95,1511,10,4},"������");
--		if GLB_BW_BiWuCheck() == 1 then
--			gf_AddItemEx({2,95,595,nRingCount},"1����ָ���ο̰�");
----			EarnXYY(10);
--		end
		--gf_Modify("Pvp",2400);
		--gf_Modify("Dzjy",2400);
		gf_Modify("Exp",nExp);
		gf_AddItemEx({2,1,30499,2},"Hu�n ch��ng anh h�ng");
		gf_AddItemEx({2,1,30692,10},"R��ng ��i H�i T� V�");
		AddRuntimeStat(20, 1, 0, 1)
		AddRuntimeStat(20, 4, 0, 10)
		gf_SetLogCaption("");
		--Observer:onEvent(OE_BIWU_MATCH,{GetTask(TSK_CURWEEKMATCH),GetTask(TASK_BIWU_WIN_10),GetTask(TASK_BIWU_LOSE_10)});
	end;
end

function BWT_GetYanhuo()
--	local nDate = tonumber(date("%Y%m%d"));
--	if nDate <= 20101010 then
--		local nCurAward = GetTask(TASKID_3F_BW_AWARD);
--		local nCurMatch = GetTask(TSK_CURWEEKMATCH);
--		if nCurAward < 30 then
--			local nCurCount = min(nCurMatch,30) - nCurAward
--			if nCurCount > 0 then
--				BWDH_SetTask(TASKID_3F_BW_AWARD,GetTask(TASKID_3F_BW_AWARD)+nCurCount);
--				gf_SetLogCaption("3f2010.������")
--				gf_AddItemEx({2,95,738,nCurCount},"�̻���ϰ�");
--				Msg2Player("ÿ1������ɻ��1���̻���ϰ���ÿ����໻ȡ30����");
--				gf_SetLogCaption("");
--			else
--				Talk(1,"",g_szInfoHead.."��ȡ�̻���ϰ��������ڵ��ܲμӱ�����ĳ���������ÿ����໻ȡ30����Ŀǰ��û���µ��̻���ϰ�������ȡ���������Ѿ���ȡ��"..nCurAward.."���̻���ϰ���")
--			end
--		else
--			Talk(1,"",g_szInfoHead.."ÿ����໻ȡ30�����������Ѿ���ȡ���ˣ����������ɡ�");
--		end
--	end
end

function BWT_GetWeekAward_Point()
	if GetTask(TSK_CURWEEKMATCH) < REQUIRE_MATCH_TIME then
		Talk(1,"",g_szInfoHead.."S� l�n ng��i tham gia so t�i tu�n n�y �t h�n <color=yellow>"..REQUIRE_MATCH_TIME.."<color> tr�n, kh�ng th� nh�n th��ng.");
		return 0;
	end
	local nRegPoint = GetTask(TSK_CURREALRESULT); --ʹ��ʵ�ʵĽ��շ���
	local nGetXinDeState = GetTask(TSK_GET_XINDE_STATE);
	local nCount = 0;
	if nRegPoint >= 200 and nGetXinDeState < 30 then
		BWDH_SetTask(TSK_GET_XINDE_STATE,30);
		nCount = 30 - nGetXinDeState;
	elseif nRegPoint >= 150 and nGetXinDeState < 20 then
		nCount = 20 - nGetXinDeState;
		BWDH_SetTask(TSK_GET_XINDE_STATE,20);
	elseif nRegPoint >= 120 and nGetXinDeState < 10 then
		nCount = 10 - nGetXinDeState;
		BWDH_SetTask(TSK_GET_XINDE_STATE,10);
	end;

	local szString1,szString2,szString3 = "","","";
	local nGetXinDeState = GetTask(TSK_GET_XINDE_STATE);
	if nGetXinDeState == 30 then
		szString1 = "<color=red>�� l�nh<color>";
		szString2 = "<color=red>�� l�nh<color>";
		szString3 = "<color=red>�� l�nh<color>";
	elseif nGetXinDeState == 20 then
		szString1 = "<color=red>�� l�nh<color>";
		szString2 = "<color=red>�� l�nh<color>";
		szString3 = "<color=yellow>Ch�a l�nh<color>";
	elseif nGetXinDeState == 10 then
		szString1 = "<color=red>�� l�nh<color>";
		szString2 = "<color=yellow>Ch�a l�nh<color>";
		szString3 = "<color=yellow>Ch�a l�nh<color>";
	else
		szString1 = "<color=yellow>Ch�a l�nh<color>";
		szString2 = "<color=yellow>Ch�a l�nh<color>";
		szString3 = "<color=yellow>Ch�a l�nh<color>";
	end;

	if nCount > 0 then
		gf_AddItemEx({2,1,1101,nCount},"Th�c chi�n t�m ��c");
		Talk(1,"",g_szInfoHead.."T�nh h�nh nh�n th��ng nh� sau:\n�i�m t�ch l�y ��t 120 nh�n ���c 10 Th�c Chi�n T�m ��c       "..szString1.."\n�i�m t�ch l�y ��t 150 nh�n ti�p 10 Th�c Chi�n T�m ��c     "..szString2.."\n�i�m t�ch l�y ��t 200 nh�n th�m 10 Th�c Chi�n T�m ��c     "..szString3);
	else
		Talk(1,"",g_szInfoHead.."T�nh h�nh nh�n th��ng nh� sau:\n�i�m t�ch l�y ��t 120 nh�n ���c 10 Th�c Chi�n T�m ��c       "..szString1.."\n�i�m t�ch l�y ��t 150 nh�n ti�p 10 Th�c Chi�n T�m ��c     "..szString2.."\n�i�m t�ch l�y ��t 200 nh�n th�m 10 Th�c Chi�n T�m ��c     "..szString3);
	end;
end

function BWT_GetRankAward()
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if nWeekNum == -1 then	--Relay����
		return 0;
	end;
	if nBWRank == -1 or nBWRank > 10 then
		Talk(1,"",g_szInfoHead.."X�p h�ng �i�m t�ch l�y tu�n tr��c kh�ng n�m trong 10 h�ng ��u n�n kh�ng ���c nh�n ph�n th��ng.");
		return 0;
	end;
	local selTab = {};
--	tinsert(selTab,"��Ҫ��ȡ�ƺ�/BWT_GetTitleAward");
--	tinsert(selTab,"��Ҫ��ȡ������Ч/BWT_GetWeaponEffectAward");
--	if nBWRank <= 3 then	--ǰ������������
--		tinsert(selTab,"��Ҫ��������/BWT_GetHorseAward");
--	end;
	tinsert(selTab,format("Gi�i th��ng x�p h�ng/#BWT_GetRankAward_Exp(%d)", nBWRank));
	tinsert(selTab,"T�m th�i kh�ng l�nh/nothing");
	Say(g_szInfoHead.."X�p h�ng �i�m t�ch l�y tu�n tr��c l� h�ng <color=yellow>"..nBWRank.."<color>, b�n mu�n nh�n ph�n th��ng n�o?",getn(selTab),selTab);
	BWT_PointAttenuation();
end

function BWT_GetRankAward_Exp(nBWRank)
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if GetTask(TSK_GET_AWARD_WEEK) >= nWeekNum then
		Talk(1,"",g_szInfoHead.."B�n �� nh�n ph�n th��ng.");
		return 0;
	end;
	if nBWRank >= 1 and nBWRank <= 10 then
		local nExp = 100000000--(11 - nBWRank)*10000*10000
		gf_SetLogCaption("Gi�i th��ng x�p h�ng m�i tu�n ��i H�i T� V�")
		BWDH_SetTask(TSK_GET_AWARD_WEEK,nWeekNum);
		gf_Modify("Exp",nExp);
		gf_AddItemEx({2,1,30499,6},"Hu�n ch��ng anh h�ng");
		gf_AddItemEx({2,1,30692,30},"R��ng ��i H�i T� V�");
		AddRuntimeStat(20, 2, 0, 1)
		AddRuntimeStat(20, 4, 0, 30)
		
		gf_SetLogCaption("");
	end
end

function BWT_GetWeaponEffectAward()
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if nWeekNum == -1 then	--Relay����
		return 0;
	end;
	if nBWRank == -1 or nBWRank > 10 then
		Talk(1,"",g_szInfoHead.."X�p h�ng �i�m t�ch l�y tu�n tr��c kh�ng n�m trong 10 h�ng ��u n�n kh�ng ���c nh�n ph�n th��ng.");
		return 0;
	end;
	local nCheckRoute,nRoutePos = gf_CheckPlayerRoute();
	if nCheckRoute == 0 then
		return 0;
	end;
	if GetTask(TSK_WEAPON_EFFECT_WEEK) >= nWeekNum then
		Talk(1,"",g_szInfoHead.."B�n �� nh�n ph�n th��ng.");
		return 0;
	end;
	local nWeaponIdx = GetPlayerEquipIndex(2)
	--����װ���ж�
	if  nWeaponIdx == 0 then
		Talk(1,"",g_szInfoHead.."H�y trang b� v� kh� tr��c r�i ��n t�m ta!")
		return 0;
	end
	local nType = 0;
	if nBWRank == 1 then	--����ǵ�һ��
		nType = 1;
	else
		nType = 2;
	end;
	local selTab = {
				"��ng �/#BWT_AddWeaponEffect("..nType..")",
				"H�y b�/nothing",
				}
	Say(g_szInfoHead.."Nh�n danh hi�u ��i h�i t� v� s� <color=yellow>che m�t danh hi�u s� m�n ho�c danh hi�u ��i h�i v� l�m c�ng lo�i c�a b�n<color>, b�n x�c nh�n mu�n nh�n ph�n th��ng danh hi�u c�a ��i h�i t� v�?",getn(selTab),selTab);
end;

function BWT_AddWeaponEffect(nType)
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if nWeekNum == -1 then	--Relay����
		return 0;
	end;
	if nBWRank == -1 or nBWRank > 10 then
		Talk(1,"",g_szInfoHead.."X�p h�ng �i�m t�ch l�y tu�n tr��c kh�ng n�m trong 10 h�ng ��u n�n kh�ng ���c nh�n ph�n th��ng.");
		return 0;
	end;
	local nWeaponIdx = GetPlayerEquipIndex(2);
	--����װ���ж�
	if  nWeaponIdx == 0 then
		Talk(1,"",g_szInfoHead.."H�y trang b� v� kh� tr��c r�i ��n t�m ta!")
		return 0;
	end
	local tbWeaponEffect = {"Ph� Qu�n","Tinh Di"};
	local szWeaponEffectName = tbWeaponEffect[nType];
	BWDH_SetTask(TSK_WEAPON_EFFECT_WEEK,nWeekNum);
	BindWeaponEffect(szWeaponEffectName,7*24*3600);
	Msg2Player("B�n �� nh�n hi�u �ng c�a v� kh�:"..szWeaponEffectName..", th�i gian duy tr� l� 7 ng�y.");
	WriteLog("["..LOG_HEAD.."]:"..GetName().."�� nh�n th��ng hi�u �ng c�a v� kh�:"..szWeaponEffectName);
end;

function BWT_GetTitleAward()
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if nWeekNum == -1 then	--Relay����
		return 0;
	end;
	if nBWRank == -1 or nBWRank > 10 then
		Talk(1,"",g_szInfoHead.."X�p h�ng �i�m t�ch l�y tu�n tr��c kh�ng n�m trong 10 h�ng ��u n�n kh�ng ���c nh�n ph�n th��ng.");
		return 0;
	end;
	local nCheckRoute,nRoutePos = gf_CheckPlayerRoute();
	if nCheckRoute == 0 then
		return 0;
	end;
	if GetTask(TSK_GET_AWARD_WEEK) >= nWeekNum then
		Talk(1,"",g_szInfoHead.."B�n �� nh�n ph�n th��ng.");
		return 0;
	end;
	local nTitleGenre = 0;
	if nRoutePos == 2 then	--�����������ñ�����ˣ�ֻ�ý���ʹ���
		nRoutePos = 3;
	elseif nRoutePos == 3 then
		nRoutePos = 2;
	end;
	if nBWRank == 1 then	--����ǵ�һ��
		if nBWLevel == 0 then	--��������������
			nTitleGenre = 27;
		else	--��������µ�һ������
			nTitleGenre = 28;
		end;
	elseif nBWRank <= 3 then
		nTitleGenre = 26;
	elseif nBWRank <= 10 then
		nTitleGenre = 25;
	end;
	local selTab = {
				"��ng �/#BWT_AddBiWuTitle("..nTitleGenre..","..nRoutePos..")",
				"H�y b�/nothing",
				}
	Say(g_szInfoHead.."Nh�n danh hi�u ��i h�i t� v� s� <color=yellow>che m�t danh hi�u s� m�n ho�c danh hi�u ��i h�i v� l�m c�ng lo�i c�a b�n<color>, b�n x�c nh�n mu�n nh�n ph�n th��ng danh hi�u c�a ��i h�i t� v�?",getn(selTab),selTab);
end;

function BWT_AddBiWuTitle(nID1,nID2)
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if nWeekNum == -1 then	--Relay����
		return 0;
	end;
	if nBWRank == -1 or nBWRank > 10 then
		Talk(1,"",g_szInfoHead.."X�p h�ng �i�m t�ch l�y tu�n tr��c kh�ng n�m trong 10 h�ng ��u n�n kh�ng ���c nh�n ph�n th��ng.");
		return 0;
	end;
	local nTimeLeft = 7*24*3600;
	BWT_RemoveOtherBiWuTitle(nID2);
	AddTitle(nID1,nID2);
	SetTitleTime(nID1, nID2, GetTime() + nTimeLeft);
	SetCurTitle(nID1, nID2);
	BWDH_SetTask(TSK_GET_AWARD_WEEK,nWeekNum);
	WriteLog("["..LOG_HEAD.."]:"..GetName().."Nh�n ph�n th��ng danh hi�u ��i h�i t� v�. ID danh hi�u: "..nID1..", "..nID2);
end;

function BWT_RemoveOtherBiWuTitle(nRoutePos)
	for i=23,28 do
		if IsTitleExist(i,nRoutePos) == 1 then
			RemoveTitle(i,nRoutePos);
		end;
	end;
end;

function BWT_GetHorseAward()
	if GetTask(TSK_BUY_HORSE) ~= 0 then
		Talk(1,"","Tu�n n�y b�n �� thu� th� c��i, kh�ng th� thu� n�a.");
		return 0;
	end;
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if nWeekNum == -1 then	--Relay����
		return 0;
	end;
	local selTab = {};
	if nBWLevel == 0 then
		tinsert(selTab,"Thu� X�ch K� (T�c �� 30, ph� thu� 10 v�ng)/#BWT_BuyHorse(1)");
		tinsert(selTab,"Thu� Ho�ng K� (T�c �� 30, ph� thu� 10 v�ng)/#BWT_BuyHorse(2)");
	else
		tinsert(selTab,"Thu� Tr�o Ho�ng Phi �i�n (T�c �� 40, ph� thu� 20 v�ng)/#BWT_BuyHorse(3)");
		tinsert(selTab,"Thu� X�ch Th� (T�c �� 40, ph� thu� 20 v�ng)/#BWT_BuyHorse(4)");
	end;
	tinsert(selTab,"Kh�ng thu�/nothing");
	if nBWRank > 0 and nBWRank <= 3 then
		Say(g_szInfoHead.."X�p h�ng t�ch l�y tu�n tr��c c�a b�n n�m trong 3 h�ng ��u, x�p th� <color=yellow>"..nBWRank.."<color>, b�n c� th� thu� nh�ng lo�i th� c��i � b�n tr�n. B�n mu�n thu� lo�i n�o? <color=red>Ch� �: H�n s� d�ng l� 7 ng�y, y�u c�u nh�n v�t c�p 80 m�i ���c d�ng<color>. <color=yellow>N�u b�n h�ng 1 l�u ph�i th� ���c thu� th� c��i mi�n ph�.<color>",getn(selTab),selTab);
	else
		Talk(1,"",g_szInfoHead.."Xin l�i! Tu�n tr��c b�n kh�ng ��t 3 h�ng ��u c�a l�u ph�i, kh�ng th� thu� th� c��i. Ch�c b�n may m�n.");
	end;
end;

g_tbHorseInfo =
{	--ID��Ϣ���۸񣬳�������
	[1] = {{0,105,5,"X�ch K�"},10,7},
	[2] = {{0,105,6,"Ho�ng K�"},10,7},
	[3] = {{0,105,10,"Tr�o Ho�ng Phi �i�n"},20,7},
	[4] = {{0,105,12,"X�ch Th�"},20,7},
}

function BWT_BuyHorse(nType)
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if nWeekNum == -1 then	--Relay����
		return 0;
	end;
	if nBWRank <= 0 or nBWRank > 3 then
		Talk(1,"",g_szInfoHead.."X�p h�ng t�ch l�y tu�n tr��c n�m trong <color=yellow>3 h�ng ��u<color> m�i c� th� thu� th� c��i.");
		return 0;
	end;
	if gf_JudgeRoomWeight(2,100,"") == 0 then
		return 0;
	end;
	local nNeedMoney = g_tbHorseInfo[nType][2];
	if nBWRank ~= 1 then	--������ǵ�1����Ҫ��Ǯ��
		if GetCash() < nNeedMoney*10000 then
			Talk(1,"","Ng�n l��ng c�a b�n kh�ng ��, b�n c�n <color=yellow>"..nNeedMoney.."<color> l��ng m�i ���c thu� ng�a n�y.");
			return 0;
		end;
		Pay(nNeedMoney*10000);
	end;
	local nItemIdx = 0;
	local nTimeLeft = 7*24*3600;
	local nID1,nID2,nID3 = g_tbHorseInfo[nType][1][1],g_tbHorseInfo[nType][1][2],g_tbHorseInfo[nType][1][3];
	local szHorseName = g_tbHorseInfo[nType][1][4];
	local nLastDay = g_tbHorseInfo[nType][3];
	_,nItemIdx = AddItem(nID1,nID2,nID3,1,1,-1,-1,-1,-1,-1,-1);
	SetItemExpireTime(nItemIdx,nLastDay*24*3600);
	Msg2Player("B�n nh�n ���c 1 "..szHorseName..", th�i h�n "..nLastDay.."Thi�n");
	BWDH_SetTask(TSK_BUY_HORSE,1);
	WriteLog("["..LOG_HEAD.."]:"..GetName().."Thu� 1 con ng�a: "..szHorseName);
end;
--���ĳ����ҵ�ְҵ����
function BWT_GetPlayerRouteName(nPIdx)
	local nOldPIdx = PlayerIndex;
	local szRouteName = "";
	PlayerIndex = nPIdx;
	szRouteName = gf_GetRouteName(GetPlayerRoute());
	PlayerIndex = nOldPIdx;
	return szRouteName;
end;
--�Ƴ��Ƿ���״̬
function BWT_RemoveNonlicetState()
	local tbNonlicet =
	{
		[1] = {9901,9906},
		[2] = {19801279,19801281},
	}
	for i=1,getn(tbNonlicet) do
		for j=tbNonlicet[i][1],tbNonlicet[i][2] do
			RemoveState(j);
		end;
	end;
end;
--��ȡ�������
function BWT_GetName(nPIdx)
	nPIdx = nPIdx or PlayerIndex;
	local nOldPIdx = PlayerIndex;
	local szName = "";
	PlayerIndex = nPIdx;
	if GetMaskStatus() == 1 then
		szName = "Ng��i th�n b�";
	else
		szName = GetName();
	end;
	PlayerIndex = nOldPIdx;
	return szName;
end;
function nothing()

end;

--===============����Ϊ���������亯��======================
tGsName = {
--	{"1-1","�һ���"},
--	{"1-2","����ɽ"},
--	{"1-4","������"},
--	{"1-7","ҩ����"},
--	{"1-10","������"},
--	{"1-11","���Ķ�"},
--	{"1-12","����"},
--	{"1-13","������"},
--	{"1-14","������"},
--	{"2-1","��Խ����"},
--	{"2-3","��������"},
--	{"2-4","ǹ������"},
--	{"3-1","��ʦ�ؾ�"},
--	{"3-3","���첿��"},
--	{"3-7","���ŷ�ѩ"},
--	{"3-9","�������"},
--	{"3-10","¥������"},
--	{"4-1","���ǳ�"},
};

--�Ƿ����˿������
--�·�������Ҫ�ֶ��޸Ļ�Ҫ�������relay��
function GLB_BW_BiWuCheck()
	return 1;
end

tBwChangeItem = {
--	{30,{{2,95,596,1},"2���������ΰ�"}},
--	{5, {{2,95,839,1},"̫ʼʯ"}},
--	{30,{{2,95,739,1},"�����������"}},
};
g_TempItemName = "Kinh nghi�m ��i chi�n ";
--��ս����һ�װ��
function GLB_BW_ChangeItem()
	local strtab = {};
	for i = 1,getn(tBwChangeItem) do
		tinsert(strtab,"��ng �"..tBwChangeItem[i][1]..g_TempItemName.."��i"..tBwChangeItem[i][2][2].."/#GLB_BW_AskChange("..i..")");
	end
--	tinsert(strtab, "��Ҫ��ȡҫ����������	/GLB_BW_Award_Ling");
--	tinsert(strtab, "��Ҫʹ��ҫ����������һ���������		/#GLB_BW_ChangeItem2(2)");
--	tinsert(strtab, "��Ҫʹ�������Ƭ��ҫ����Ƭ�һ���������	/#GLB_BW_ChangeItem2(1)");
	tinsert(strtab, "��i th��ng PVP	/#show_equip_shop(48)");

	tinsert(strtab,"K�t th�c ��i tho�i/nothing");
	Say("B�n mu�n ��i ph�n th��ng n�o?",
		getn(strtab),
		strtab)
end

function GLB_BW_AskChange(nType)
	if GetTask(TASK_BIWU_DUIZHAN_JINGYAN) < tBwChangeItem[nType][1] then
		Talk(1,"","  "..g_TempItemName.."Kh�ng ��."..g_TempItemName.."Tham gia ��i H�i T� V� li�n server s� nh�n ���c.");
		return 0;
	end
	Say("Quy�t ��nh d�ng <color=yellow>"..tBwChangeItem[nType][1].." �i�m<color>"..g_TempItemName.."��i <color=yellow>"..tBwChangeItem[nType][2][2].."<color> ch�?",
		3,
		"��ng �/#GLB_BW_ConfirmChange("..nType..")",
		"tr� l�i/GLB_BW_ChangeItem",
		"K�t th�c ��i tho�i/nothing")
end

function GLB_BW_ConfirmChange(nType)
	if GetTask(TASK_BIWU_DUIZHAN_JINGYAN) < tBwChangeItem[nType][1] then
		Talk(1,"","  "..g_TempItemName.."Kh�ng ��."..g_TempItemName.."Tham gia ��i H�i T� V� li�n server s� nh�n ���c.");
		return 0;
	end
	if gf_Judge_Room_Weight(1,100,"") ~= 1 then
		return 0;
	end
	BWDH_SetTask(TASK_BIWU_DUIZHAN_JINGYAN,GetTask(TASK_BIWU_DUIZHAN_JINGYAN)-tBwChangeItem[nType][1]);
	gf_SetLogCaption(" kinh nghi�m ��i chi�n ��i trang b� ")
	gf_AddItemEx(tBwChangeItem[nType][2][1],tBwChangeItem[nType][2][2]);
	gf_SetLogCaption("");
end

function GLB_BW_Award_Ling(bConfirm)
	bConfirm = bConfirm or 0;

	if 1 ~= bConfirm then
		Say("Trong Thi�n M�n Tr�n Li�n Server, ng��i ch�i cu�i c�ng ��nh tr�ng boss Cu�ng T��ng Minh Nh�t, s� c� t� c�ch ��n ch� c�a ta nh�n 1 Di�u D��ng L�nh. (Cu�ng T��ng Minh Nh�t ch� xu�t hi�n trong Thi�n M�n Tr�n c�a bang h�i c�p 3, ��ng th�i m�i c�m server li�n th�ng ch� xu�t hi�n 1 con boss) Trong Thi�n M�n Tr�n Li�n Server, ng��i ch�i cu�i c�ng ��nh tr�ng boss Ng�y T��ng �m Nguy�t, s� c� t� c�ch ��n ch� c�a ta nh�n 1 H�o Nguy�t L�nh.",
		2,
		"Ta mu�n nh�n!	/#GLB_BW_Award_Ling(1)",
		"K�t th�c ��i tho�i	/nothing");
		return
	end

	local nYYL	= gf_GetTaskByte(TASKID_TMZ_BOSS, 1);
	local nHYL	= gf_GetTaskByte(TASKID_TMZ_BOSS, 2);

	if 0 == nYYL and 0 == nHYL then
		Talk(1, "", "B�n kh�ng th� nh�n Di�u D��ng L�nh ho�c H�o Nguy�t L�nh.");
		return 0;
	end

	if 1 ~= gf_JudgeRoomWeight(2, 100, "") then
		return 0;
	end

	if 0 < nYYL then
		gf_SetLogCaption("��i Di�u D��ng L�nh");
		gf_AddItemEx({2, 95, 742, nYYL, 1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng L�nh");
		gf_SetTaskByte(TASKID_TMZ_BOSS, 1, 0);
	end
	if 0 < nHYL then
		gf_SetLogCaption("��i H�o Nguy�t L�nh");
		gf_AddItemEx({2, 95, 743, nHYL, 1, -1, -1, -1, -1, -1, -1}, "H�o Nguy�t L�nh");
		gf_SetTaskByte(TASKID_TMZ_BOSS, 2, 0);
	end
	gf_SetLogCaption("");

	return 1;
end

tBwChangeItem2 = {
	[1]	= {
		szMsg	= "D�ng 999 M�nh H�o Nguy�t s� ��i ���c H�o Nguy�t Phi Phong ho�c Huy Ch��ng, d�ng 999 M�nh Di�u D��ng ��i ���c Di�u D��ng Phi Phong ho�c Huy Ch��ng.",
		tInfo	= { -- ҫ����Ƭ�������Ƭ��ҫ����������Ž��Ļ���
			{{999, 0, 0, 0, 0},	0,	{{0, 118, 3, 1, 1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng H�a V�n Phi Phong (Giao d�ch)"}},
			{{999, 0, 0, 0, 0},	0,	{{0, 117, 3, 1, 1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng Th�ng Ng� L�nh (Giao d�ch)"}},
			{{0, 999, 0, 0, 0},	0,	{{0, 118, 2, 1, 1, -1, -1, -1, -1, -1, -1}, "H�o Nguy�t C�m �o�n Phi Phong (Giao d�ch)"}},
			{{0, 999, 0, 0, 0},	0,	{{0, 117, 2, 1, 1, -1, -1, -1, -1, -1, -1}, "H�o Nguy�t �n Ngh�a L�nh (Giao d�ch)"}},
		},
	},
	[2]	= {
		szMsg	= "	Tham gia Thi�n M�n Tr�n Li�n Server s� nh�n ���c Di�u D��ng L�nh ho�c H�o Nguy�t L�nh, d�ng v�t ph�m �� �� ��n ch� c�a ta ��i Phi Phong ho�c Huy Ch��ng.",
		tInfo	= { -- ҫ����Ƭ�������Ƭ��ҫ����������Ž��Ļ���
			{{0, 0, 1, 0, 800},	5000, {{0, 118, 3, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng H�a V�n Phi Phong (Kh�ng th� giao d�ch)"}},
			{{0, 0, 1, 0, 800},	5000, {{0, 117, 3, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng Th�ng Ng� L�nh (Kh�ng th� giao d�ch)"}},
			{{0, 0, 0, 1, 200},	1200, {{0, 118, 2, 1, 4, -1, -1, -1, -1, -1, -1}, "H�o Nguy�t C�m �o�n Phi Phong (Kh�ng th� giao d�ch)"}},
			{{0, 0, 0, 1, 200},	1200, {{0, 117, 2, 1, 4, -1, -1, -1, -1, -1, -1}, "H�o Nguy�t �n Ngh�a L�nh (Kh�ng th� giao d�ch)"}},
		},
	},
};

g_TempItemName2 = {{"M�nh Di�u D��ng", 2, 95, 741}, {"M�nh H�o Nguy�t", 2, 95, 740}, {"Di�u D��ng L�nh", 2, 95, 742}, {"H�o Nguy�t L�nh", 2, 95, 743}, {"Thi�n M�n Kim V�n H� Ph�", 2, 100, 45}}

function GLB_BW_ChangeItem2(nIndex)
	if not nIndex then
		return 0;
	end

	local tChange = tBwChangeItem2[nIndex];
	if not tChange then
		return 0;
	end

	local tMenu = {};
	for nElemIdx, tElemInfo in tChange.tInfo do
		local szInfo = "D�ng th�";
		for idx, count in tElemInfo[1] do
			if 0 < count then
				szInfo = szInfo .. format("%d %s,", count, g_TempItemName2[idx][1]);
			end
		end
		if 0 < tElemInfo[2] then
			szInfo = szInfo .. format("%d v�ng,", tElemInfo[2]);
		end
		szInfo = strsub(szInfo, 1, strlen(szInfo) - 2); -- ȥ�����ġ������� ���� ���á���
		szInfo = szInfo .. format("��i %s	/#GLB_BW_ConfirmChange2(%d, %d)", tElemInfo[3][2], nIndex, nElemIdx);
		tinsert(tMenu, szInfo);
	end

	tinsert(tMenu, "K�t th�c ��i tho�i	/nothing");

	Say(tChange.szMsg, getn(tMenu), tMenu);
end

function GLB_BW_ConfirmChange2(nIndex, nElemIdx)
	if not nIndex then
		return 0;
	end

	local tChange = tBwChangeItem2[nIndex];
	if not tChange then
		return 0;
	end

	local tElem   = tChange.tInfo[nElemIdx];
	if not tElem then
		return 0;
	end

	for idx, count in tElem[1] do
		if count > GetItemCount(g_TempItemName2[idx][2], g_TempItemName2[idx][3], g_TempItemName2[idx][4]) then
			Talk(1, "", "Mang theo tr�n ng��i" .. g_TempItemName2[idx][1] .. "Kh�ng ��" .. count .. ".");
			return 0;
		end
	end

	if 1 ~= gf_JudgeRoomWeight(1, 100, "") then
		return 0;
	end

	if 0 < tElem[2] and 1 ~= Pay(tElem[2] * 10000) then
		Talk(1, "", "V�ng tr�n ng��i kh�ng ��" .. tElem[2] .. " Kim ");
		return 0;
	end

	for idx, count in tElem[1] do
		if 0 < count then
			if 1 ~= DelItem(g_TempItemName2[idx][2], g_TempItemName2[idx][3], g_TempItemName2[idx][4], count) then
				WriteLog(format(" ��i %s [DeleteItem] [Failed] [Acc:%s] [Role:%s] [Item:%sx%d,%d,%d,%d]", tElem[3][2], GetAccount(), GetName(), g_TempItemName2[idx][1], count, g_TempItemName2[idx][2], g_TempItemName2[idx][3], g_TempItemName2[idx][4]));
				return 0;
			end
		end
	end

	gf_SetLogCaption("��i"..tElem[3][2]);
	gf_AddItemEx(tElem[3][1], tElem[3][2]);
	gf_SetLogCaption("");

	Msg2Global(format("Ng��i ch�i %s �� ��i 1 %s", GetName(), tElem[3][2]));

	return 1;
end

--��ȡ����������������
function GLB_BW_GetRealmName(strName)
	local aa,bb,strGbGroup,strGbName = strfind(strName,"(.-)*(.*)");
	return strGbGroup,strGbName;
end

tBwGlobalAward = {
	{
		{"Th� c��i chuy�n d�ng cho ��i H�i T� V� ","GLB_BW_AddItemEx({0,105,107,1,1,-1,-1,-1,-1,-1,-1},'Ng�n H�',7*24*3600)"},
		{"Danh hi�u: V�ng lo�i-Gi�i Nguy�n","GLB_BW_AddTitle(6,3,'V�ng lo�i-Gi�i Nguy�n')"},
	},
	{
		{"Th� c��i chuy�n d�ng cho ��i H�i T� V� ","GLB_BW_AddItemEx({0,105,107,1,1,-1,-1,-1,-1,-1,-1},'Ng�n H�',7*24*3600)"},
		{"Danh hi�u: V�ng lo�i-� Nguy�n","GLB_BW_AddTitle(6,4,'V�ng lo�i-� Nguy�n')"},
	},
	{
		{"Th� c��i chuy�n d�ng cho ��i H�i T� V� ","GLB_BW_AddItemEx({0,105,107,1,1,-1,-1,-1,-1,-1,-1},'Ng�n H�',7*24*3600)"},
		{"Danh hi�u: V�ng lo�i-H�i Nguy�n","GLB_BW_AddTitle(6,5,'V�ng lo�i-H�i Nguy�n')"},
	},
};

function BWT_GetGlobalAward()
	local nWeekNum = BWT_GetWeekNum();
	if nWeekNum == -1 then	--Relay����
		return 0;
	end;
	local nBWRank = GetGlobalBwRank();
	if GetTask(TASK_BIWU_GET_REALM_AWARD) >= nWeekNum then
		Talk(1,"",g_szInfoHead.."B�n �� nh�n ph�n th��ng.");
		return 0;
	end;
	if gf_Judge_Room_Weight(4,100,g_szInfoHead) ~= 1 then
		return 0;
	end
	local tbRank = GetBwAllRank(1); --����1��ʾȫ������������0�����ʾ����������
	if tbRank == nil or getn(tbRank) == 0 then
		return 0;
	end
	local strName = GetName();
	local strGbGroup,strGbName = "","";
	local strCurGroup = GetRelayGroup();
	local nSelfRank,nBestRank = 0,0;
	local strShowName = "";
	for i=1,getn(tGsName) do
		if tGsName[i][1] == strCurGroup then
			strCurGroup = tGsName[i][2];
			break;
		end
	end
	for i=1,getn(tbRank) do
		strGbGroup,strGbName = GLB_BW_GetRealmName(tbRank[i].Name);
		if strGbName == strName then
			nSelfRank = i;
		end
		if strGbGroup == strCurGroup then
			strShowName = strShowName..","..strGbName;
			if nBestRank == 0 then
				nBestRank = i;
			end
		end
	end
	BWDH_SetTask(TASK_BIWU_GET_REALM_AWARD,nWeekNum);
	if nSelfRank ~= 0 and nSelfRank <= 3 then
		for i = 1,getn(tBwGlobalAward[nBWRank]) do
			dostring(tBwGlobalAward[nBWRank][i][2]);
		end
	end
	local tbRankAward = {{1,{2,0,109,3},"B�ng Lai Ti�n L�"},{10,{2,0,109,2},"B�ng Lai Ti�n L�"},{20,{2,0,109,1},"B�ng Lai Ti�n L�"},};
	if nBestRank > 20 or nBestRank == 0 then
		Talk(1,"",g_szInfoHead.."Tu�n tr��c server kh�ng c� cao th� nh�n ���c t�n th��ng c�a tri�u ��nh, mong c�c v� h�y ti�p t�c c� g�ng.");
		return 0
	end
	for i = 1,getn(tbRankAward) do
		if nBestRank <= tbRankAward[i][1] then
			gf_AddItemEx(tbRankAward[i][2],tbRankAward[i][3]);
			Msg2Global("Do "..strShowName.."Trong ��i H�i T� V� bi�u hi�n v��t tr�i, ng��i ch�i trong server c� th� nh�n ph�n th��ng ["..tbRankAward[i][3].."].");
			break;
		end
	end
end

--�ѱ���ֵд�빲�����ݿ�
function GLB_BW_SetTask(nkey1,nkey2,tb)
	local strGbGroup,strName = GLB_BW_GetRealmName(GetName());
	strName = "Realm_"..strName;
	local TbList = {};
	local TbListTemp = {};
	local nNum = 16;
	local nItemKey = 0;
	local strItemKey = "";
	local strFormat = "";
	if nkey1 == 0 and nkey2 == 1 then --��ʦ
		local tb_gushi = {};
		for k,v in tb do
			local nValue = GetTask(v);
			strFormat = strFormat.."d";
			tinsert(tb_gushi,nValue);
		end
		AddRelayShareDataToSourceRealm(strName,nkey1,nkey2,g_ThisFile,"GLB_BW_ST_Nothing",0,"GS",strFormat,gf_UnPack(tb_gushi));
	elseif nkey1 == 0 and nkey2 == 0  then
		for i = 1,getn(tb) do
			tinsert(TbList,tb[i]);
			tinsert(TbList,GetTask(tb[i]));
		end
		nItemKey = ceil(getn(TbList)/nNum);
		for i = 1,nItemKey do
			local strFormat = ""
			TbListTemp[i] = {};
			for j = (i-1)*nNum+1,min(getn(TbList),nNum*i) do
				strFormat = strFormat.."d";
				tinsert(TbListTemp[i],TbList[j]);
			end
			strItemKey = "BW"..tostring(i);
			AddRelayShareDataToSourceRealm(strName,nkey1,nkey2,g_ThisFile,"GLB_BW_ST_Nothing",0,strItemKey,strFormat,gf_UnPack(TbListTemp[i]));
		end
--	elseif nkey1 == 0 and nkey2 == 2 then --��ң�ҵ�����
--		AddRelayShareDataToSourceRealm(strName,nkey1,nkey2,g_ThisFile,"GLB_BW_ST_Nothing",0,"XYB","d",GetTask(TASKID_XOYO_CONSUME));
--	elseif nkey1 == 0 and nkey2 == 3 then --��ң�������
--		AddRelayShareDataToSourceRealm(strName,nkey1,nkey2,g_ThisFile,"GLB_BW_ST_Nothing",0,"XYY","d",GetTask(TASKID_XOYOYU_CONSUME));
	end
end

function GLB_BW_ST_Nothing()

end

function GLB_BW_AddItemEx(tbItem,strName,nTime)
	nTime = nTime or 0;
	gf_SetLogCaption("��i H�i T� V�-Ph�n th��ng server");
	local nRet,nIdx = gf_AddItemEx(tbItem,strName);
	if nTime ~= 0 and nIdx ~= 0 then
		SetItemExpireTime(nIdx,nTime);
	end
	gf_SetLogCaption("")
end

function GLB_BW_AddTitle(nID1,nID2,strName)
	for i=3,5 do
		RemoveTitle(6,i);
	end
	if IsTitleExist(nID1,nID2) <= 0 then
		if AddTitle(nID1,nID2) > 0 then
			SetTitleTime(nID1,nID2, GetTime() + 7*24*3600);
			SetCurTitle(nID1,nID2)
			Msg2Player("B�n nh�n ���c ["..strName.."] danh hi�u");
			WriteLog("[��i H�i T� V�-Ph�n th��ng server]:"..GetName().." nh�n ���c ["..strName.."] danh hi�u");
		end
	end
end

function GLB_BW_LEAVE(nCityID, nPIdx)
	nPIdx = nPIdx or PlayerIndex;
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx;

	local nVersion,nCurGs = GetRealmType();
	UseScrollEnable(1);	--����ʹ�ûسǷ�
	SetLogoutRV(0);
	UseMask(0,0);
--	if nCurGs == 0 then
--		NewWorld(nCityID,TB_EXIT[nCityID][1],TB_EXIT[nCityID][2]);
--	else
--		ChangeGroupWorld(nCityID,TB_EXIT[nCityID][1],TB_EXIT[nCityID][2],0);
--	end
	BWDH_Change_Map(nCityID,TB_EXIT_CITY[nCityID][1],TB_EXIT_CITY[nCityID][2])

	PlayerIndex = nOldPIdx;
end

function OnWant(nPIdx,nOppIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx;
	local nCheckMapCode1,nCheckMapCode2 = 0,0;
	local nCheckTag = 0;

	BWDH_SetTask(TSK_OPPNAME_HASH,0);
	BWDH_SetTask(TSK_OPPNAME_HASH,0,nOppIdx);
	nCheckMapCode1 = BWT_CheckValidMap();
	nCheckMapCode2 = BWT_CheckValidMap(nOppIdx);
	if nCheckMapCode1 == 0 then	--1��ѡ�ּ��ûͨ��
		gf_ShowMsg("Kh��c t� t� v� (kh�ng c� trong b�n �� quy ��nh), tr� 2 �i�m! B�n �� r�i kh�i so t�i.");
		BWT_AddPoint(-2)
		nCheckTag = 1;	--��ʾ����ûͨ�����
	end;
	if nCheckMapCode2 == 0 then	--2��ѡ�ּ��ûͨ��
		if nCheckTag == 0 then	--���1�ż��ͨ����
			gf_ShowMsg("��i th� kh��c t� t� v�!");	--��1�ŷ���Ϣ
		end;
		gf_ShowMsg("Kh��c t� t� v� (kh�ng c� trong b�n �� quy ��nh), tr� 2 �i�m! B�n �� r�i kh�i so t�i.",1,nOppIdx);
		BWT_AddPoint(-2,nOppIdx)
		nCheckTag = 1;
	else	--���2��ѡ�ּ��ͨ��
		if nCheckTag == 1 then	--2��ͨ����1��ûͨ��
			gf_ShowMsg("��i th� kh��c t� t� v�!",1,nOppIdx);	--��2�ŷ���Ϣ
		end;
	end;
	if nCheckTag == 1 then	--�������ûͨ�����
		PlayerIndex = nOldPIdx;
		return 0;
	end;
	if BWT_OpenMatch(PlayerIndex,nOppIdx) == 0 then
		gf_ShowMsg("T�m th�i kh�ng c� khu thi ��u d� ra");
		BWT_JoinGestConvention();
		BWT_JoinGestConvention(nOppIdx);
		gf_ShowMsg("T�m th�i kh�ng c� khu thi ��u d� ra",1,nOppIdx);
	end;
	PlayerIndex = nOldPIdx;
end

function GLB_BW_Get_Block_Route()
	local tRoute		= gf_GetRouteTable();
	local tBlockRoute	= {};

	for i, nRoute in tRoute do
		if 1 == gf_GetTaskBit(TASKID_BIWU_BLOCK_ROUTE, i) then
			tinsert(tBlockRoute, nRoute);
		end
		if MAXNUM_BLOCK_ROUTE <= getn(tBlockRoute) then
			break
		end
	end

	tBlockRoute.n = nil;

	return tBlockRoute;
end

function GLB_BW_Block_Route_Check(nRoute)
	local tRoute		= gf_GetRouteTable();
	local nRet = 1;
	for i,k in tRoute do
		if k == nRoute then
			if gf_GetTaskBit(TASKID_BIWU_BLOCK_ROUTE, i) == 1 then
				nRet = 0;
			end
			break;
		end
	end
	return nRet;
end

function GLB_BW_Block_Route_Check_Ex(nPIdx1, nPIdx2)
	local nRet		= 0;
	local nOldPIdx	= 0;
	local nRoute1	= GetPlayerRoute(nPIdx1);
	local nRoute2	= GetPlayerRoute(nPIdx2);

	if nRoute1 == nRoute2 then
		return 1;
	end

	nOldPIdx	= PlayerIndex;
	PlayerIndex	= nPIdx1;
	nRet		= GLB_BW_Block_Route_Check(nRoute2);
	PlayerIndex	= nOldPIdx;

	if 0 == nRet then
		return 0;
	end

	nOldPIdx	= PlayerIndex;
	PlayerIndex	= nPIdx2;
	nRet		= GLB_BW_Block_Route_Check(nRoute1);
	PlayerIndex	= nOldPIdx;

	return nRet;
end

function GLB_BW_Block_Route_Cost(nPIdx)
--	nPIdx1 = nPIdx1 or PlayerIndex;
--
--	local nOldPIdx	= PlayerIndex;
--	PlayerIndex		= nPIdx;
--	local tRoute	= GLB_BW_Get_Block_Route();
--	if getn(tRoute) > 0 then
--		PayXYY(TB_BW_BLOCK_ROUTE_COST[getn(tRoute)], format("BLOCK_ROUTE[%d]", getn(tRoute)));
--	end
--	PlayerIndex		= nOldPIdx;
end

function WLZB_AddPoint()
	local nData = tonumber(date("%Y%m%d"));
	if nData < 20110428 or nData > 20110519 then
		return
	end
	local s = SDB("_GL_GestConvention_Jiaoyi_w", 1, GetPlayerRoute());
	s:apply("\\script\\biwudahui\\tournament\\mission\\mission.lua", "WLZB_AddPoint_CB");
end

function WLZB_AddPoint_CB(key, n1, n2, nCount)
	local nData = tonumber(date("%Y%m%d"));
	if nData < 20110428 or nData > 20110519 then
		return
	end
	local t = SDB("_GL_GestConvention_Jiaoyi_w", n1, n2);
	local point = getBound(t, nCount) + 20;
	Msg2Player(format("B�n nh�n ���c %d �i�m V� L�m Tranh B�!", point));
	point = point + GetTask(TASKID_WLZB_POINT);
	BWDH_SetTask(TASKID_WLZB_POINT, point);
	--GLB_BW_SetTask(0,0,tRelayTask);
	exgsvr_func_save_player_task()--��Դ������

	--SendGlbDBData(1, format('DELETE FROM `wlzb_auditions` WHERE `name`="%s";', name));
	--format('UPDATE `wlzb_auditions` SET `point`=%d WHERE `name`="%s";', point, name);
	SendGlbDBData(0, format('REPLACE INTO `wlzb_auditions` VALUES ("%s", "%s", %d, %d, "%s");',
		GetName(), tRouteName[GetPlayerRoute()], GetLevel(), point, GetRelayGroup()));
end

function getBound(t,nCount)
	if not t then
		return 0
	end
	local myname = GetName();
	for i = 0, min(nCount, 20) do
		local l = t[i];
		if l[1] == myname then
			return 20 - i;
		end
	end
	return 0;
end

function WLZB_DecPoint()
	local nData = tonumber(date("%Y%m%d"));
	if nData < 20110428 or nData > 20110519 then
		return
	end
	local lastPoint = GetTask(TASKID_WLZB_POINT);
	local point = min(lastPoint, max(10, floor(lastPoint * 0.03)));
	if point <= 0 then return end
	Msg2Player(format("B�n t�n th�t %d �i�m V� L�m Tranh B�!", point));
	point = GetTask(TASKID_WLZB_POINT) - point;
	BWDH_SetTask(TASKID_WLZB_POINT, point);
	--GLB_BW_SetTask(0,0,tRelayTask);
	exgsvr_func_save_player_task()--��Դ������

	--SendGlbDBData(1, format('DELETE FROM `wlzb_auditions` WHERE `name`="%s";', name));
	--format('UPDATE `wlzb_auditions` SET `point`=%d WHERE `name`="%s";', point, name);
	SendGlbDBData(0, format('REPLACE INTO `wlzb_auditions` VALUES ("%s", "%s", %d, %d, "%s");',
		GetName(), tRouteName[GetPlayerRoute()], GetLevel(), point, GetRelayGroup()));
end

function BWDH_Change_Map(nMapId, nMapX, nMapY, nRule)
	if BWDH_OPEN_IN_MATCH_FIELD and BWDH_OPEN_IN_MATCH_FIELD == 1 then
		ChangeGroupWorld(nMapId, nMapX, nMapY)
	else
		NewWorld(nMapId, nMapX, nMapY)
	end
end
