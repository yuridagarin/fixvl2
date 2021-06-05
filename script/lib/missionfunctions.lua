--����ļ�����һЩ����Mission�����ĺ���
--��������ʽ��mf_MissionFunction(nArg...)
--���к��������һ���������ΪnMapID�����������Ҫ������֧��Mission��ͼ�����Mission��
--===========================================================================================
--�������Mission����
function mf_ClearMissionData(nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	for i=1,10 do
		SetMissionS(i,"");
	end;
	for i=1,100 do
		SetMissionV(i,0);
	end;
	SubWorld = nOldSubWorld;
end;
--��Mission��ĳһ��Ӫ��ҽ���ͳһ����
--ʹ�÷������ȶ���һ��ִ�к���������������������Ϊһtable��
--Ȼ������������Ϊ�ڶ������������mf_OperateAllPlayer������
--ͨ����table�ķ�ʽ���Դ����������ִ�к�����
function mf_OperateAllPlayer(nMissionID,func,tArg,nCamp,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local OldPlayerIndex = PlayerIndex;
	local IDTab = mf_GetMSPlayerIndex(nMissionID,nCamp,nMapID);	
	local nPlayerCount = getn(IDTab);
	if nPlayerCount > 0 then
		for i=1,nPlayerCount do
			PlayerIndex = IDTab[i];
			if PlayerIndex > 0 then
				func(tArg);
			else
				WriteLog("[To�n b� h�m s� b�o l�i]: mf_OperateAllPlayer h�m s�, trong IDTab h��ng d�n ng��i ch�i nh� h�n ho�c b�ng 0");
			end;
		end;
	end;
	PlayerIndex = OldPlayerIndex;
	SubWorld = nOldSubWorld;
end;
--�õ�Mission���������,����һΪMissionID,������ΪMission��Ӫ��������ΪMission��ص�ͼID��
function mf_GetPlayerCount(nMissionID,nCamp,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local nPlayerCount = 0;
	nPlayerCount = GetMSPlayerCount(nMissionID,nCamp)
	SubWorld = nOldSubWorld;
	return nPlayerCount;
end;
--�õ�ĳMissionĳ��Ӫ��������ҵ�����������һ�������������ķ���ֵ
function mf_GetMSPlayerIndex(nMissionID,nCamp,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local tIndex = {};
	local nTotalPlayerNum = GetMSPlayerCount(nMissionID,nCamp);
	local msidx,sidx = 0,0;
	if nTotalPlayerNum ~= 0 then
		for i=1,nTotalPlayerNum do
			msidx,sidx = GetNextPlayer(nMissionID,msidx,nCamp);
			if sidx > 0 then
				tIndex[i] = sidx;
			end
		end
	end;
	if nTotalPlayerNum ~= getn(tIndex) then
		WriteLog("[To�n b� h�m s� b�o l�i]: trong h�m s� ms_GetMSPlayerIndex nh�n ���c s� ng��i c�a phe n�o �� so v�i getn(tIndex) kh�ng ��ng nh�t. S� ng��i:"..nTotalPlayerNum..", getn(tIndex) ch�nh l�ch l�:"..getn(tIndex));
	end;
	SubWorld = nOldSubWorld;
	return tIndex;
end;
--�ı�ĳ��Ӫ����������ҵ�ĳһ����ʱ������ֵ
function mf_SetCampTempValue(nMissionID,nCamp,nTaskID,nValue,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local IDTab = mf_GetMSPlayerIndex(nMissionID,nCamp,nMapID);
	local nPlayerCount = getn(IDTab);
	local nOldPlayerIndex = PlayerIndex;
	if nPlayerCount > 0 then
		for i=1,nPlayerCount do
			PlayerIndex = IDTab[i];
			if PlayerIndex > 0 then
				SetTaskTemp(nTaskID,nValue);
			end;
		end;
	end;
	PlayerIndex = nOldPlayerIndex;
	SubWorld = nOldSubWorld;
end;
--�ı�ĳ��Ӫ����������ҵ�ĳһ�����������ֵ
function mf_SetCampTaskValue(nMissionID,nCamp,nTaskID,nValue,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local IDTab = mf_GetMSPlayerIndex(nMissionID,nCamp,nMapID);
	local nPlayerCount = getn(IDTab);
	local nOldPlayerIndex = PlayerIndex;
	if nPlayerCount > 0 then
		for i=1,nPlayerCount do
			PlayerIndex = IDTab[i];
			if PlayerIndex > 0 then
				SetTask(nTaskID,nValue);
			end;
		end;
	end;
	PlayerIndex = nOldPlayerIndex;
	SubWorld = nOldSubWorld;
end;
--���ĳ�����������ֵ���������򡣵�һ��������ս�����������ID���ڶ�������Ϊ1��ʾ����0��ʾ����
--����������ָ����Ӫ��Ĭ��ֵΪ0������ֵΪһ���������������������table
--���ĸ������ǵ�ͼID
function mf_SortMSPlayerByTaskValue(nMissionID,nTaskID,bAscend,nCamp,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local nOldPlayerIndex = PlayerIndex;
	local tIDTab = mf_GetMSPlayerIndex(nMissionID,nCamp,nMapID);
	local fCompare = function(nPIndex1,nPIndex2)
		local nValue1,nValue2 = 0,0;
		PlayerIndex = nPIndex1;
		nValue1 = GetTask(%nTaskID);
		PlayerIndex = nPIndex2;
		nValue2 = GetTask(%nTaskID);
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
	SubWorld = nOldSubWorld;
	return tIDTab;
end;
--���ĳ����������������������Զ���ĺ���������
function mf_SortMSPlayerByFunction(nMissionID,func,nCamp,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local nOldPlayerIndex = PlayerIndex;
	local tIDTab = mf_GetMSPlayerIndex(nMissionID,nCamp,nMapID);
	sort(tIDTab,func);
	PlayerIndex = nOldPlayerIndex;
	SubWorld = nOldSubWorld;
	return tIDTab;
end;
--���Mission�������з���ĳһ��������ҵ�ĳһ����Ϣ����table����ʽ����
--������Func��������
--���ص�table��Ԫ�ؽṹ��Func���صĽ��������
function mf_GetMSPlayerInfo(nMissionID,Func,tArg,nCamp,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local IDTab = mf_GetMSPlayerIndex(nMissionID,nCamp,nMapID);
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
	SubWorld = nOldSubWorld;
	return tInfo;
end;
--���Mission����ĳ�����α���ֵ�����ﴫnMission�����е�����ˣ����ˣ�����һ����
function mf_GetMissionV(nMissionID,nValueID,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local nValue = GetMissionV(nValueID);
	SubWorld = nOldSubWorld;
	return nValue;
end;
--����Mission��ĳ�����α���ֵ
function mf_SetMissionV(nMissionID,nValueID,nValue,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	SetMissionV(nValueID,nValue);
	SubWorld = nOldSubWorld;
end;
--���Mission����ĳ���ַ�������ֵ
function mf_GetMissionS(nMissionID,nStringID,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then	
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local sString = GetMissionS(nStringID);
	SubWorld = nOldSubWorld;
	return sString;
end;
--����Mission��ĳ���ַ�������ֵ
function mf_SetMissionS(nMissionID,nStringID,sString,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	SetMissionS(nStringID,sString);
	SubWorld = nOldSubWorld;
end;
--����һ��Mission
function mf_OpenMission(nMissionID,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	OpenMission(nMissionID)
	SubWorld = nOldSubWorld;
	return 1;
end;
--�ر�һ��Mission
function mf_CloseMission(nMissionID,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	CloseMission(nMissionID)
	SubWorld = nOldSubWorld;
end;
--����һ��Mission
function mf_JoinMission(nMissionID,nCamp,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	JoinMission(nMissionID,nCamp)
	SubWorld = nOldSubWorld;
end;
--��Mission����ɾ���������
function mf_DelAllMSPlayer(nMissionID,nCamp,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local tPlayer = mf_GetMSPlayerIndex(nMissionID,nCamp,nMapID);
	local nOldPlayerIndex = PlayerIndex;
	for i=1,getn(tPlayer) do
		PlayerIndex = tPlayer[i];
		if PlayerIndex > 0 then
			DelMSPlayer(nMissionID,0);
		end
	end;
	PlayerIndex = nOldPlayerIndex;
	SubWorld = nOldSubWorld;
end;
--��̬Mission��֧�ֺ�����������ȷ����tMissionTS
--����Mission��״̬�������״̬������ʣ���ʱ�䣨��λ���ӣ�
function mf_GetMissionCurState()
	local nCurTime = tonumber(date("%H%M"));
	local lfGetTimeDiff = function(nTime1,nTime2)
		return (floor(nTime2/100)-floor(nTime1/100))*60+mod(nTime2,100)-mod(nTime1,100);
	end;
	for nState,tTimeTable in tMissionTS do
		for i=1,getn(tTimeTable) do
			if nCurTime >= tTimeTable[i][1] and nCurTime <= tTimeTable[i][2] then
				local nMinLeft = lfGetTimeDiff(nCurTime,tTimeTable[i][2]);
				return nState,nMinLeft;
			end;
		end;
	end;
	return 0;
end;
--��̬����Mission������ֻ�Ǳ�mf_OpenMission����һ���жϣ������ж�MissionV�ĵ�һ�������Ƿ�Ϊ0
--����0��ʾ��ǰ������Mission���н׶Σ�����1��ʾ����Mission�ɹ���Mission�Ѿ�������
--����nil��ʾ����Missionʧ��
function mf_OpenDynamicMission(nMissionID,nMapID)
	if mf_GetMissionV(nMissionID,1,nMapID) == 0 then
		if mf_GetMissionCurState() ~= 0 then
			return mf_OpenMission(nMissionID,nMapID);
		else
			return 0;
		end;
	else
		return 1;
	end;
end;
--��ĳ����Ӫ���������Talk
function mf_Talk2Camp(nMissionID,nCamp,szString,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local lfFunc = function(tArg)
		Talk(1,"",%szString);
	end;
	mf_OperateAllPlayer(nMissionID,lfFunc,{},nCamp,nMapID);
	SubWorld = nOldSubWorld;
end;
--��ĳ����Ӫ���������Say
--���������szScriptFileName��Ҫ��֤��ҵ�ǰ���ҽű���Say��������Ļص�����
function mf_Say2Camp(nMissionID,nCamp,szString,tSelTab,szScriptFileName,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local lfFunc = function(tArg)
		SetPlayerScript(%szScriptFileName);
		Say(%szString,getn(%tSelTab),%tSelTab);
	end;
	if tSelTab == 0 then
		lfFunc = function(tArg)
			Say(%szString,0);
		end;		
	end;
	mf_OperateAllPlayer(nMissionID,lfFunc,{},nCamp,nMapID);
	SubWorld = nOldSubWorld;
end;
--��ĳ����Ӫ��������Ҽ�һ��״̬
--������������һ��table��������CastState�������������˳��
--��tArg = {"state_vertigo",10,10*18,0,1}	ȫ����10��
function mf_CastStateMSPlayer(nMissionID,nCamp,tArg,nMapID)
	local lfFunc = function(tArg)
		CastState(tArg[1],tArg[3],tArg[3],tArg[4],tArg[5]);
	end;
	mf_OperateAllPlayer(nMissionID,func,tArg,nCamp,nMapID)
end;
