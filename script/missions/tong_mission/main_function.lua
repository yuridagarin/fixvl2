--create date:2007-07-04
--author:yanjun
--describe:����һЩ���ؿ���صĲ���
Include("\\script\\missions\\tong_mission\\main_head.lua");
Include("\\script\\online_activites\\task_values.lua");--�������ͷ�ļ�

--��ȡĿ�곡�ص�״̬��ʹ�ó��صİ������
function TM_GetFieldInfo(nAreaIdx,nFieldIdx)
	local szTongName = "";
	local nMapID = GetWorldPos();
	local nFieldMapID = TM_GetFieldMapID(nMapID,nAreaIdx,nFieldIdx);
	local nMisstionState = mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,nFieldMapID);
	if nMisstionState == MS_STATE_IDEL then
		return nMisstionState,0,"R�nh r�i";
	else
		szTongName = mf_GetMissionS(MISSION_ID,MS_TONG_NAME,nFieldMapID);
		nStage = mf_GetMissionV(MISSION_ID,MV_STAGE,nFieldMapID);
		return nMisstionState,nStage,szTongName;
	end;
end;
--���ݵ�ͼID�����������������������߻�ȡ���صĵ�ͼID
function TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx)
	return FTB_CITY[nCurMapID][nAreaIdx][nFieldIdx];
end;
--��������NPC
function TM_CreateFieldNpc(nMapID)
	local nNpcIdx = CreateNpc("V��ng An Th�ch","Qu�n l� ngo�i ���ng T� Quang C�c",nMapID,tPos_Out_Room[1],tPos_Out_Room[2]);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tong_mission\\npc\\npc_stage_manager.lua");
	nNpcIdx = CreateNpc("V��ng An Th�ch","Qu�n l� n�i ���ng T� Quang C�c",nMapID,tPos_In_Room[1],tPos_In_Room[2]);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tong_mission\\npc\\npc_stage_manager.lua");
end;
--��ȡ��ѡ���油����ѡ�а���쵼������table
function TM_GetPlayerTable()
	local tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);	
	local tbNormalPlayer = {};
	local tbSubPlayer = {};
	local tbTongHeader = {};
	local nOldPlayerIdx = PlayerIndex;
	local nCurJob = 0;
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		if GetTaskTemp(TSK_TEMP_STATUS) == 1 then
			tinsert(tbNormalPlayer,PlayerIndex);
			nCurJob = IsTongMember();
			if nCurJob ~= 0 and nCurJob <= 3 and GetTaskTemp(TSK_TEMP_HELPER) ~= 1 then
				tinsert(tbTongHeader,PlayerIndex);
			end;
		else
			tinsert(tbSubPlayer,PlayerIndex);
		end;
	end;
	PlayerIndex = nOldPlayerIdx
	return tbNormalPlayer,tbSubPlayer,tbTongHeader;
end;
--��ȡ�����������ѡ�ж��ٸ�
function TM_GetNormalPlayerCount()
	local tbNormalPlayer = TM_GetPlayerTable();
	return getn(tbNormalPlayer);
end;
--��ȡ�油������
function TM_GetSubPlayerCount()
	local _,tbSubPlayer = TM_GetPlayerTable();
	return getn(tbSubPlayer);
end;
--�����ѡ��ҵ���ɽṹ��ĳ��������ѡ�����Ƿ񳬹�3�����Ϲ��򷵻�1�������Ϲ��򷵻�0
function TM_CheckNormalPlayer(nRoute)
	local tbNormalPlayer = TM_GetPlayerTable();
	local nOldPlayerIdx = PlayerIndex;
	local tbRoutCount = {};	
	for i=0,30 do	--��ʼ��tbRoutCount
		tbRoutCount[i] = 0;
	end;
	for i=1,getn(tbNormalPlayer) do
		PlayerIndex = tbNormalPlayer[i];
		local nRoute = GetPlayerRoute();
		tbRoutCount[nRoute] = tbRoutCount[nRoute] + 1;
	end;
	PlayerIndex = nOldPlayerIdx;
	local nRoutPlayerCount = tbRoutCount[GetPlayerRoute()];
	if nRoutPlayerCount >= MAX_ROUTE_PLAYER_COUNT then
		return 0;
	else
		return 1;
	end;
end;
--��ʼ��ĳ���ؿ�
function TM_InitStage(nStage)
	TB_STAGE[nStage]:InitStage();
end;
--������Ч
function TM_PlaySound(tbPlayer,szWavFileName)
	local lfFunc = function(tArg)
		PlaySound("\\sound\\"..%szWavFileName);
	end;
	gf_OperatePlayers(tbPlayer,lfFunc,{});
end;	
--��ĳ���ص㲥��һ����Ч
function TM_DoSpecialEffect(nMapX,nMapY,nEffectID,szEffectName,nTime)
	if szEffectName == nil or szEffectName == "" then
		szEffectName = " ";
	end;
	local nMapID = SubWorldIdx2ID(SubWorld);
	local nNpcIdx = CreateNpc("Ng��i V� h�nh",szEffectName,nMapID,nMapX,nMapY);
	SetNpcLifeTime(nNpcIdx,nTime);
	SetCurrentNpcSFX(nNpcIdx,nEffectID,1,1);
end;
--sample:TM_SetRelayTongData("ɽȪ��",5,"d",1);
function TM_SetRelayTongData(szTongName,nDataIdx,szFormat,nsData)
	AddRelayShareData(szTongName,0,0,"","",0,nDataIdx,szFormat,nsData);
	DelRelayShareDataCopy(szTongName,0,0);
end;
--��鵱ǰ�����û�м����
function TM_GetTongFieldState(szTongName)
	for i,v in FTB_CITY do
		for j=1,getn(v) do
			for k=1,getn(v[j]) do
				if tostring(GetMissionExValue(TONG_MISSIONEX,v[j][k])) == szTongName then
					return i,j,k;	--mapid,areaidx,fieldidx
				end;
			end;
		end;
	end;
	return 0,0,0;
end;
--���Ŀ����е����г�����Ϣ
function TM_ClearFieldState(nCityMapID)
	if SubWorldID2Idx(nCityMapID) >= 0 then
		gf_ShowDebugInfor("B�n ��:"..nCityMapID.."T�t c� nh�ng th�ng tin li�n quan v� �i");
		for i,v in FTB_CITY[nCityMapID] do
			for j=1,getn(v) do
				SetMissionExValue(TONG_MISSIONEX,v[j],0);
			end;
		end;
	end;
end;
--������г��еĳ�����Ϣ
function TM_ClearAllFieldState()
	TM_ClearFieldState(100);
	TM_ClearFieldState(150);
	TM_ClearFieldState(200);
	TM_ClearFieldState(300);
	TM_ClearFieldState(350);
end;
--����ĳ�����ص���Ϣ������������ĳ�����ռ��
function TM_SetTongFieldState(nFieldMapID,szTongName)
	SetMissionExValue(TONG_MISSIONEX,nFieldMapID,szTongName);
end;
--����һ���Ի�����
function TM_CreateBox(nStage)
	local nMapID = SubWorldIdx2ID(SubWorld);
	local nNpcIdx = CreateNpc("R��ng ti�n","th�"..nStage.."R��ng c�a �i",nMapID,1569,3175);
	TM_SetUnitCurStates(nNpcIdx,1,nStage);	--�����������ǵڼ��ص�
	SetNpcScript(nNpcIdx,"\\script\\missions\\tong_mission\\npc\\npc_box.lua");
	SetMissionV(MV_GET_BOX,1);
end;
--�������ƣ�NPC����ֵ�趨
--��        �ܣ�ֱ���趨NPC����λ�õ�ֵ
function TM_SetUnitCurStates(Npc_index,att_seq,number)
	if number > 99 and att_seq ~= 1 and att_seq ~= 4 and att_seq ~= 5 and att_seq ~= 6 then
		print("Thi�t l�p tr� s� NPC nh�m: V� tr�:"..att_seq.."Tr�:"..number)
		return 0
	end
	local num_save = GetUnitCurStates(Npc_index,att_seq)
	num_save = number - num_save
	AddUnitStates(Npc_index,att_seq,num_save)
	return 1
end
--�����油����NPC
function TM_CreateSubNpc(nCount)
	local nNpcIdx = 0;
	local nMapID = SubWorldIdx2ID(SubWorld);
	for i=1,nCount do
		nNpcIdx = CreateNpc("Ti�u qu�i � khu v�c b� sung","V� binh ngo�i ���ng",nMapID,1536,3253,-1,1,1,200);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_sub_npc.lua");
	end;
end;
--�޸�NPCѪ��������1��NPC����������2��Ѫ��ֵ������3���Ƿ�Ϊ�ٷֱȣ�1��ʾ�ǣ�0��ʾ���ǣ�Ĭ����1��
function TM_ModifyNpcLife(nNpcIdx,nValue,bPercent)
	if bPercent == 0 then	--������ǰٷֱ�
		ModifyNpcData(nNpcIdx,0,nValue,1);
		return 0;
	end;
	local nNpcMaxLife = GetUnitCurStates(nNpcIdx,1);	
	local nDamage = floor(nNpcMaxLife*nValue/100);	--���ݰٷֱ�������ı��Ѫ��
	ModifyNpcData(nNpcIdx,0,nDamage,1);
end;
--��ȡNPC���Ѫ���͵�ǰѪ������������ʾ��ǰѪ���Ƿ�Ϊ�ٷֱ�,1��ʾ�ǣ�0��ʾ���ǣ�Ĭ����1
function TM_GetNpcLife(nNpcIdx,bPercent)
	if nNpcIdx == 0 then
		return 0,0;
	end;
	local nMaxLife,nCurLife = GetUnitCurStates(nNpcIdx,1);
	if bPercent == 0 then	--������ǰٷֱ�
		return nMaxLife,nCurLife;
	end;
	gf_ShowDebugInfor("nCurLife:"..nCurLife);
	gf_ShowDebugInfor("nMaxLife:"..nMaxLife);
	return nMaxLife,floor(nCurLife/nMaxLife*100);
end;
--��ȡ��ҵ��������ֵ�͵�ǰ����ֵ
function TM_GetPlayerLife(nPlayerIdx)
	local nOldIdx = PlayerIndex;
	if nPlayerIdx ~= nil then
		PlayerIndex = nPlayeridx;
	end;
	local nMaxLife,nCurLife = GetUnitCurStates(PIdx2NpcIdx(PlayerIndex),1);
	PlayerIndex = nOldIdx;
	return nMaxLife,nCurLife;
end;
--������ҹؿ�����
function TM_AddPoint(nPoint,nCurStage,tbPlayer)
	if tbPlayer == nil then --Ĭ�����������
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	if GetMissionV(MV_KILL_SUB_NPC) >= MIN_KILL_SUB_NPC_COUNT then
		nPoint = nPoint + KILL_SUB_NPC_POINT;
		Msg2MSAll(MISSION_ID,"�� gi�t v� binh ngo�i ���ng � �i n�y v��t qu� "..MIN_KILL_SUB_NPC_COUNT..", t�t c� m�i ng��i s� ���c th��ng th�m "..KILL_SUB_NPC_POINT.."�i�m ph�n th��ng t�ch l�y");
	end;
	local funAddPoint = function(tbArg)
		local nPassTimes = TM_GetStagePassTimes(%nCurStage);
		local nP = %nPoint;
		if nPassTimes == 2 then
			nP = floor(nP*4/5);
		elseif nPassTimes == 3 then
			nP = floor(nP*3/5);
		elseif nPassTimes >= 4 then
			nP = floor(nP*1/10);
		end;
--    if %nCurStage == 6 then
--        SetTask(VET_201009_00_TASK_TONGGUAN_ZIGUANG,1)
--    end
		SetTask(TSK_POINT,GetTask(TSK_POINT)+nP);
		Msg2Player("Trong tu�n n�y ��i hi�p ��y l� l�n th� "..nPassTimes.." v��t �i "..%nCurStage..", c� th� thu ���c "..%nPoint.." �i�m quan �i, sau khi tr� xong c� s� �i�m th�c t� l� "..nP.." �i�m quan �i");
	end;
	gf_OperatePlayers(tbPlayer,funAddPoint,{});
end;
--������Ҿ���
function TM_AddExpAward(nCurStage,tbPlayer)
	if tbPlayer == nil then --Ĭ�����������
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funAddExp = function(tbArg)
		local nPassTimes = TM_GetStagePassTimes(%nCurStage);
		local nX = 0;
		if nPassTimes == 1 then
			nX = 1;
		elseif nPassTimes == 2 then
			nX = 2/5;
		elseif nPassTimes == 3 then
			nX =1/5;
		elseif nPassTimes == 4 then
			nX = 1/10
		elseif nPassTimes > 4 then
			nX = 0;
		end;
		if IsPlayerDeath() ~= 1 then	--���û��
			local nExp = floor(GetLevel()^3*4);
			local nExp2 = floor(nX*nExp);
			ModifyExp(nExp2);
			Msg2Player("Trong tu�n n�y ��i hi�p ��y l� l�n th� "..nPassTimes.." v��t �i "..%nCurStage..", c� th� thu ���c "..nExp.." kinh nghi�m, sau khi tr� xong c� s� �i�m th�c t� l� "..nExp2.." �i�m kinh nghi�m");
		end;
	end;
	gf_OperatePlayers(tbPlayer,funAddExp,{});
end;
--��ùֵ�����
function TM_GetNpcFaction(nNpcIdx)
	local szNpcName = GetNpcName(nNpcIdx);
	local szPreName = szNpcName;
	if szPreName == "B�ng h� v� Thi�u L�m" then
		return 1;
	elseif szPreName == "B�ng h� v� V� �ang" then
		return 2;
	elseif szPreName == "B�ng h� v� Nga Mi" then
		return 3;
	elseif szPreName == "B�ng h� v� C�i Bang" then
		return 4;
	elseif szPreName == "B�ng h� v� ���ng M�n" then
		return 5;
	elseif szPreName == "B�ng h� v� D��ng M�n" then
		return 6;
	elseif szPreName == "B�ng h� v� Ng� ��c" then
		return 7;
	elseif szPreName == "C�n L�n �nh T� H� V�" then
		return 8;
	elseif szPreName == "Th�y Y�n �nh T� H� V�" then
		return 10;
	else
		return 0;
	end;
end;
--�������ɹ�
function TM_CreateFactionNpc(nMapX,nMapY,nCount,nNpcTableIdx,nRadius)
	if nRadius == nil then
		nRadius = 50;	--Ĭ����50��Χ�����ˢ
	end;
	local nMapID = SubWorldIdx2ID(SubWorld);
	local szModel,szName = tb_Npc_Info[nNpcTableIdx][1],tb_Npc_Info[nNpcTableIdx][2];
	local nNpcIdx = 0;
	for i=1,nCount do
		nNpcIdx = CreateNpc(szModel,szName,nMapID,nMapX,nMapY,-1,1,1,nRadius);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_npc.lua");
	end;
	SetMissionV(MV_FAC_NPC_COUNT,GetMissionV(MV_FAC_NPC_COUNT)+nCount);
end;
--��ĳ��Ҽ��Ͽ�ʼһ��ʱ�������
function TM_StartTimeGuage(szInfo,nDuration,bRepeat,nCustomID,tbPlayer)
	if tbPlayer == nil then --Ĭ�����������
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funTimeGuage = function(tbArg)
		StartTimeGuage(%szInfo,%nDuration,%bRepeat,%nCustomID)
	end;
	gf_OperatePlayers(tbPlayer,funTimeGuage,{});
end
--ֹͣĳ����ʱ��
function TM_StopTimeGuage(nCustomID,tbPlayer)
	if tbPlayer == nil then --Ĭ�����������
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funTimeGuage = function(tbArg)
		StopTimeGuage(%nCustomID);
	end;
	gf_OperatePlayers(tbPlayer,funTimeGuage,{});
end;
--�ر����г��еĹؿ�
function TM_CloseAllField()
	for i,v in FTB_CITY do
		if SubWorldID2Idx(i) >= 0 then
			for j=1,getn(v) do
				for k=1,getn(v[j]) do
					mf_CloseMission(MISSION_ID,v[j][k]);
				end;
			end;
		end;
	end;
end;
--һ��һ�壨���ڸĳ���6���ո���һ�Σ�
function TM_WeeklyClear()
	local nCurWeek = tonumber(date("%y%W"));
	if GetTask(TSK_WEEK) < nCurWeek then
		SetTask(TSK_WEEK,nCurWeek);
		SetTask(TSK_ATTEND_STAGE_1,0);
		SetTask(TSK_ATTEND_STAGE_2,0);
		SetTask(TSK_ATTEND_STAGE_3,0);
		SetTask(TSK_ATTEND_STAGE_4,0);
		SetTask(TSK_ATTEND_STAGE_5,0);
		SetTask(TSK_ATTEND_STAGE_6,0);
                if tonumber(date("%w")) ~= 6 and tonumber(date("%w")) ~= 0 then
                    SetTask(2122, 0);--�趨������������������
                end
        else
                if GetTask(2122) == 0 then
                    local nDay = tonumber(date("%w"));
                    if nDay == 6 or nDay == 0 then
                        SetTask(TSK_WEEK,nCurWeek);
		        SetTask(TSK_ATTEND_STAGE_1,0);
		        SetTask(TSK_ATTEND_STAGE_2,0);
		        SetTask(TSK_ATTEND_STAGE_3,0);
		        SetTask(TSK_ATTEND_STAGE_4,0);
		        SetTask(TSK_ATTEND_STAGE_5,0);
		        SetTask(TSK_ATTEND_STAGE_6,0);
                        SetTask(2122, 1);--�趨����һ�κ�����������
                    end
                end
	end;
end;
--�����ұ���ͨ��ĳһ��Ĵ���
function TM_GetStagePassTimes(nStage)
	return GetTask(TSK_ATTEND_STAGE_1+nStage-1);
end;
--���ͨ��ĳ�ؿ�������1
function TM_AddStagePassTimes(nStage,tbPlayer)
	if tbPlayer == nil then --Ĭ�����������
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funAddPassTimes = function(tbArg)
		SetTask(TSK_ATTEND_STAGE_1+%nStage-1,TM_GetStagePassTimes(%nStage)+1);	
	end;
	gf_OperatePlayers(tbPlayer,funAddPassTimes,{});
end;

function nothing()

end;
