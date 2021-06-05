--npc�����ű�
--by vivi

Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");
Include("\\script\\missions\\tianmenzhen\\runtime_data_stat.lua")

function OnDeath(npcIndex,f,x)
	if f ~= 1 and x then
		SubWorld = f;
	end
	if GetMissionV(MV_TMZ_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	if PlayerIndex == 0 then	--����Ǳ�NPCɱ���������ģ�PlayerIndex��Ϊ0
		tmz_npc_kill_npc(npcIndex);
	else
		tmz_player_kill_npc(npcIndex);
	end;
end;

--npcɱ��npc��Ŀǰֻ��һ�����������npc��������
function tmz_npc_kill_npc(npcIndex)
	local sNpcName = GetNpcName(npcIndex); --������npc������
	local nMapID = GetNpcWorldPos(npcIndex);
	for i = 1,2 do
		for j = 1,getn(tPositionNpcEye[i]) do
			if sNpcName == tPositionNpcEye[i][j][2] then --��������۲Ŵ���
				SetNpcLifeTime(npcIndex,0);
				local nEyeIndex = CreateNpc(tPositionNpcEye[0][j][1],tPositionNpcEye[0][j][2],nMapID,tPositionNpcEye[0][j][3],tPositionNpcEye[0][j][4]);
				SetNpcDeathScript(nEyeIndex,NPC_DEATH_SCRIPT);
				SetCampToNpc(nEyeIndex,tCampType[0]);
				SetMissionV(MV_TMZ_CAMPONE_EYE-1+i,GetMissionV(MV_TMZ_CAMPONE_EYE-1+i)-1);
				break;
			end
		end
	end	
end

--Ŀǰ��8�������A��B��C��S�����ӡ����ۡ�ս�졢����
function tmz_player_kill_npc(npcIndex)
	local sNpcName = GetNpcName(npcIndex); --������npc������
	local nPlayerCamp = TMZ_GetCamp(); --��ȡ��ҵ���Ӫ
	local nMapID = GetWorldPos();
	--���ж��ǲ���A��B��C
	local tABC = {tPositionNpcA,tPositionNpcB,tPositionNpcC};
	local nABC_IDX,nNPC_IDX = 0,0;
	
	if sNpcName == "L�ng Nguy�t" or sNpcName == "T�o T�n Tr�n" then
		return 0;
	end

	for i = 1, getn(tPositionNpcBOSS) do
		if sNpcName == tPositionNpcBOSS[i][1][2] then
			SetNpcLifeTime(npcIndex,0);
			local nMVPoint = MV_TMZ_CAMPONE_POINT-1+nPlayerCamp;
			SetMissionV(nMVPoint,GetMissionV(nMVPoint)+tPositionNpcBOSS[i][3][1]);
			local nTVPoint = gf_GetTaskByte(tPositionNpcBOSS[i][3][2], i);
			gf_SetTaskByte(tPositionNpcBOSS[i][3][2], i, nTVPoint + 1);
			Msg2MSAll(MISSION_ID,format("Phe %s, %s �� ti�u di�t ���c BOSS%s, gi�p tr�n doanh t�ng th�m %d �i�m th�i gian chi�m tr�n.",tCampName[nPlayerCamp],GetName(),tPositionNpcBOSS[i][1][2],tPositionNpcBOSS[i][3][1]));
			WriteLogEx(THIENMON_LOG_TITLE, format("BOSS Thi�n M�n Tr�n [Acc: %s] [Role: %s] [Boss: %s] [OPoint: %d] [NPoint: %d]", GetAccount(), GetName(), tPositionNpcBOSS[i][1][2], nTVPoint, gf_GetTaskByte(tPositionNpcBOSS[i][3][2], i)))
			WriteLog(format("BOSS Thi�n M�n Tr�n [Acc: %s] [Role: %s] [Boss: %s] [OPoint: %d] [NPoint: %d]", GetAccount(), GetName(), tPositionNpcBOSS[i][1][2], nTVPoint, gf_GetTaskByte(tPositionNpcBOSS[i][3][2], i)));
			
			_stat_when_kill_flag()
			return
		end
	end

	for i = 1,getn(tABC) do
		for j = 1,getn(tABC[i])-1 do
			if sNpcName == tABC[i][j][2] then
				nABC_IDX = i;
				nNPC_IDX = j;
				break;
			end
		end
	end
	if nABC_IDX ~= 0 then --A��B��C�е�һ��
		if nABC_IDX == 2 then
			SetNpcLifeTime(npcIndex,0);
		end
		SetTask(TASKID_TMZ_KILL_NPC,GetTask(TASKID_TMZ_KILL_NPC)+1);
		--���������Ʒ
--		tmz_npc_add_item(tABC[nABC_IDX][getn(tABC[nABC_IDX])]);
		return 0;
	end
	if sNpcName == tPositionNpcS[1][2] then --����npc
		SetTask(TASKID_TMZ_KILL_NPC,GetTask(TASKID_TMZ_KILL_NPC)+1);
		return 0;
	end
	--�ж�ɱ���ǲ��ǵ�����
	local nBoxIdx = 0;
	for i = 1,getn(tPositionBox) do
		if sNpcName == tPositionBox[i][2] then
			nBoxIdx = i;
			break;
		end
	end
	if nBoxIdx ~= 0 then
		CastState(tPositionBox[nBoxIdx][7],tPositionBox[nBoxIdx][8],tPositionBox[nBoxIdx][9]*18);
		if tPositionBox[nBoxIdx][10] ~= nil then
			CastState(tPositionBox[nBoxIdx][10],tPositionBox[nBoxIdx][11],tPositionBox[nBoxIdx][12]*18);
		end
		Msg2Player("B�n nh�n ���c "..tPositionBox[nBoxIdx][5].."Hi�u qu�: "..tPositionBox[nBoxIdx][6]);
		return 0;
	end
	--�ж�ɱ���ǲ�������npc
			
	if sNpcName == tPositionNpcFlag[3-nPlayerCamp][1][2] then --�з�����
		local nMVPoint = MV_TMZ_CAMPONE_POINT-1+nPlayerCamp;
		SetTask(TASKID_TMZ_KILL_FLAG,1);
		Msg2MSAll(MISSION_ID,format("%s �� �o�t ���c ��i Tr�n K� c�a phe %s",GetName(),tCampName[3-nPlayerCamp]))
		SetMissionV(nMVPoint,GetMissionV(nMVPoint)+BROKEN_FLAG_POINT); --��������+200��
		TMZ_Set_ShowData_Msg();	
		--����һ�����������죿
		SetNpcLifeTime(npcIndex,0);
		CreateNpc(tPositionNpcFlag[3-nPlayerCamp][2][1],tPositionNpcFlag[3-nPlayerCamp][2][2],nMapID,tPositionNpcFlag[3-nPlayerCamp][2][3],tPositionNpcFlag[3-nPlayerCamp][2][4]);
		if GetMissionV(nMVPoint) >= OVER_GAME_POINT then
			StopMissionTimer(MISSION_ID,TIMER_ID);
			StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
			SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
			SetMissionV(MV_TMZ_STATE,MS_STATE_COMPLETE);
			SetMissionV(MV_TMZ_WINNER_CAMP,nPlayerCamp);
			Msg2MSAll(MISSION_ID,format("Phe %s chi�m tr�n ��t t� s� %d, �� gi�nh chi�n th�ng.",tCampName[nPlayerCamp],OVER_GAME_POINT));			
			TMZ_OperateAllPlayer(tmz_tell_end,{},ALL_ID);
		end
		
		_stat_when_kill_flag()
	else --����
		local nEyeCamp = 3;
		local nEyePosition = 0;
		local nEyeOne = GetMissionV(MV_TMZ_CAMPONE_EYE-1+nPlayerCamp); --����������
		local nEyeTwo = GetMissionV(MV_TMZ_CAMPONE_EYE-nPlayerCamp+2); --�Է�������
		for i = 1,getn(tPositionNpcEye[0]) do --��������
			if sNpcName == tPositionNpcEye[0][i][2] then
				nEyeCamp = 0;
				nEyePosition = i;
				SetMissionV(MV_TMZ_CAMPONE_EYE-1+nPlayerCamp,nEyeOne+1);
				break;
			end
		end
		for j = 1,getn(tPositionNpcEye[3-nPlayerCamp]) do --�з�����
			if sNpcName == tPositionNpcEye[3-nPlayerCamp][j][2] then
				nEyeCamp = 3-nPlayerCamp;
				nEyePosition = j;
				SetMissionV(MV_TMZ_CAMPONE_EYE-1+nPlayerCamp,nEyeOne+1);
				SetMissionV(MV_TMZ_CAMPONE_EYE-nPlayerCamp+2,nEyeTwo-1);
				break;				
			end
		end
		if nEyeCamp == 3 then
			for j = 1,getn(tPositionNpcEye[nPlayerCamp]) do --��������
				if sNpcName == tPositionNpcEye[nPlayerCamp][j][2] then
					nEyeCamp = nPlayerCamp;
					nEyePosition = j;
					break;				
				end
			end
		end
		SetTask(TASKID_TMZ_KILL_EYE,GetTask(TASKID_TMZ_KILL_EYE)+1);
		SetNpcLifeTime(npcIndex,0); 
		local nEyeIndex = CreateNpc(tPositionNpcEye[nPlayerCamp][nEyePosition][1],tPositionNpcEye[nPlayerCamp][nEyePosition][2],nMapID,tPositionNpcEye[nPlayerCamp][nEyePosition][3],tPositionNpcEye[nPlayerCamp][nEyePosition][4]);
		SetNpcDeathScript(nEyeIndex,NPC_DEATH_SCRIPT);
		SetCampToNpc(nEyeIndex,tCampType[nPlayerCamp]);	
		local tEyeName = {"Tr�n nh�n Sinh M�n","Tr�n nh�n T� M�n","Tr�n nh�n C�nh M�n","Tr�n nh�n Di�t M�n"};
		Msg2MSAll(MISSION_ID,tCampName[nPlayerCamp].." �� chi�m ���c "..tEyeName[nEyePosition]);
		--д����ʾ����
		local nCurN = GetMissionV(MV_TMZ_SHOWDATA_IDX);
		local nKillNum1 = GetTask(TASKID_TMZ_KILL_PLAYER);
		local nKillNum2 = GetTask(TASKID_TMZ_PLAYER_KILLED);
		local nKillNum3 = GetTask(TASKID_TMZ_KILL_EYE);	
		TMZ_Write_TableData(nCurN,nPlayerCamp,nKillNum1,nKillNum2,nKillNum3);
		
		local nMVPoint = MV_TMZ_CAMPONE_POINT-1+nPlayerCamp;
		SetMissionV(nMVPoint,GetMissionV(nMVPoint)+BROKEN_EYE_POINT); --��������+5��
		TMZ_Set_ShowData_Msg();
		
		_stat_when_kill_flag()
	end
end

function tmz_npc_add_item(tItem)
	local nRand = random(1,1000);
	for i = 1,getn(tItem[1]) do
		if nRand <= tItem[1][i] then
			if gf_Judge_Room_Weight(1,10) == 1 then
				AddItem(tItem[i+1][2],tItem[i+1][3],tItem[i+1][4],1);
				Msg2Player("B�n nh�n ���c ["..tItem[i+1][1].."]x1, h�y s� d�ng trong chi�n tr�n.");
				break;
			end
		end
	end
end
