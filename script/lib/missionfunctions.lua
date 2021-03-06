--这个文件定义一些方便Mission操作的函数
--函数名格式：mf_MissionFunction(nArg...)
--所有函数的最后一个输入参数为nMapID，这个参数主要是用来支持Mission地图外操作Mission的
--===========================================================================================
--清除所有Mission变量
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
--对Mission中某一阵营玩家进行统一操作
--使用方法：先定义一个执行函数，这个函数的输入参数为一table。
--然后把这个函数作为第二个输入参数给mf_OperateAllPlayer函数。
--通过传table的方式可以传多个参数给执行函数。
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
				WriteLog("[To祅 b? h祄 s? b竜 l鏸]: mf_OperateAllPlayer h祄 s?, trong IDTab hng d蒼 ngi ch琲 nh? h琻 ho芻 b籲g 0");
			end;
		end;
	end;
	PlayerIndex = OldPlayerIndex;
	SubWorld = nOldSubWorld;
end;
--得到Mission里面的人数,参数一为MissionID,参数二为Mission阵营，参数三为Mission相关地图ID，
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
--得到某Mission某阵营的所有玩家的索引，存于一个数组作函数的返回值
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
		WriteLog("[To祅 b? h祄 s? b竜 l鏸]: trong h祄 s? ms_GetMSPlayerIndex nh薾 頲 s? ngi c馻 phe n祇  so v韎 getn(tIndex) kh玭g ng nh蕋. S? ngi:"..nTotalPlayerNum..", getn(tIndex) ch猲h l謈h l?:"..getn(tIndex));
	end;
	SubWorld = nOldSubWorld;
	return tIndex;
end;
--改变某阵营里面所有玩家的某一个临时变量的值
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
--改变某阵营里面所有玩家的某一个任务变量的值
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
--针对某个任务变量的值来进行排序。第一个参数是战场的任务变量ID，第二个参数为1表示升序，0表示降序
--第三个参数指定阵营，默认值为0。返回值为一个保存排完序后的玩家索引table
--第四个参数是地图ID
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
		if %bAscend == 1 then	--升序排列
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
--针对某个函数来排序，升序或降序由自定义的函数来决定
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
--获得Mission里面所有符合某一条件的玩家的某一项信息，以table的形式返回
--条件由Func函数定制
--返回的table的元素结构由Func返回的结果决定。
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
--获得Mission里面某个整形变量值，这里传nMission变量有点多余了，算了，保持一致性
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
--设置Mission的某个整形变量值
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
--获得Mission里面某个字符串变量值
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
--设置Mission的某个字符串变量值
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
--开启一个Mission
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
--关闭一个Mission
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
--加入一个Mission
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
--从Mission里面删除所有玩家
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
--动态Mission的支持函数，必须正确定义tMissionTS
--返回Mission的状态和离这个状态结束所剩余的时间（单位分钟）
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
--动态开启Mission，这里只是比mf_OpenMission多了一步判断，就是判断MissionV的第一个变量是否为0
--返回0表示当前不属于Mission进行阶段，返回1表示开启Mission成功或Mission已经开启，
--返回nil表示开启Mission失败
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
--向某个阵营的所有玩家Talk
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
--向某个阵营的所有玩家Say
--第五个参数szScriptFileName是要保证玩家当前所挂脚本有Say里面所需的回调函数
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
--给某个阵营的所有玩家加一个状态
--第三个参数是一个table，里面填CastState的五个参数（按顺序）
--如tArg = {"state_vertigo",10,10*18,0,1}	全体晕10秒
function mf_CastStateMSPlayer(nMissionID,nCamp,tArg,nMapID)
	local lfFunc = function(tArg)
		CastState(tArg[1],tArg[3],tArg[3],tArg[4],tArg[5]);
	end;
	mf_OperateAllPlayer(nMissionID,func,tArg,nCamp,nMapID)
end;
