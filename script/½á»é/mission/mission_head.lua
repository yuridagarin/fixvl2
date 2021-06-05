MISSION_ID = 32;
TIMER_ID = 60;
--========================================================================================
FRAME_PER_SECOND = 18;								--��Ϸ�����ٶȣ�ÿ�룱��֡
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--ÿ������Ϸ֡��

READY_TIME = 30;--���񳡵�׼��ʱ�䣬30����
STARTED_TIME = 60;--���л���ʱ�䣬60����
WAITOUT_TIME = 5;--�ȴ��˳�ʱ�䣬5����

READY_TIMER_INTERVAL = 5*FRAME_PER_MIN;	--��ʱ��������ʱ��������λ����,����ָ5����
READY_TIMER_COUNT = (READY_TIME*FRAME_PER_MIN/READY_TIMER_INTERVAL)-1;	
STARTED_TIMER_INTERVAL = 5*FRAME_PER_MIN;					
STARTED_TIMER_COUNT = (STARTED_TIME*FRAME_PER_MIN/STARTED_TIMER_INTERVAL)-1;	
WAITOUT_TIMER_INTERVAL = 1*FRAME_PER_MIN;
WAITOUT_TIMER_COUNT = (WAITOUT_TIME*FRAME_PER_MIN/WAITOUT_TIMER_INTERVAL)-1;	
--========================================================================================
MS_BRIDEGROOM =1;
MS_BRIDE = 2;
--========================================================================================
MV_FIELD_STATE = 1;									--��¼��鳡�ص�״̬
MV_TIMER_LOOP = 2;									--��¼��ʱ����ǰ�ļ���
MV_WEDDING_ID = 3;									--��¼�����ID

MV_FOOD_BEGIN = 11;
--11��28
MV_FOOD_END = 28;

MV_DAHONGBAO_COUNT = 29;
MV_ZHONGHONGBAO_COUNT = 30;
MV_XIAOHONGBAO_COUNT = 31;
MV_CAN_MARRY = 32;	--�Ƿ���԰��óɻ飬1�ǣ�0��
MV_LIHUA_COUNT = 33;	--�����������Ŀ
MV_XINIANG_INDEX = 34;	--ϲ���NPC����
--========================================================================================
MS_STATE_IDEL = 0;									--���ؿ���
MS_STATE_READY = 1;									--׼���׶�
MS_STATE_STARTED = 2;								--��ս�׶�
MS_STATE_COMPLETE = 3;								--�ȴ������׶�
--=========================================================================================
LOG_ID = 204;										--��½������ID
LOG_CUSTOM_ID = 3018;								--��½�������Զ�����
--=========================================================================================
CAMP_ALL = 0;	--������
CAMP_COUPLE = 1;--����
CAMP_FRIEND = 2;--����
--=========================================================================================
SKILL_CANDY	= 870		-- ����ID����ϲ��
--=========================================================================================
--���񳡵س�ʼ����ֻҪ���˺������˲��ܽ���
function MR_InitMarryField()
	SetMissionV(MV_FIELD_STATE,MS_STATE_READY);
	SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);
	StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL);
	local nMapID = SubWorldIdx2ID(SubWorld);
	local nFieldID = map_field2type[nMapID];
	local nWeddingID = date("%y%m%d%H")..nFieldID;
	MR_CreateMapNPC(nFieldID);
	MR_CreateMapTrap(nFieldID);
	SetMissionV(MV_WEDDING_ID,nWeddingID);
	WriteLog("[K�t h�n]: H�n l� b�t ��u, ID h�n l� l�:"..nWeddingID);
end;
--������ʽ��ʼ�����ѿ����볡
function MR_StartMarry()
	--��ʽ��ʼ����
	Msg2MSAll(MISSION_ID,"H�n l� ch�nh th�c b�t ��u, c� th� m�i ng��i th�n v�o tham d�!");
end;
--�������
function MR_EndMarry()
	SetMissionV(MV_FIELD_STATE,MS_STATE_IDEL)
	local nWeddingID = GetMissionV(MV_WEDDING_ID);
	local nMapID = SubWorldIdx2ID(SubWorld);
	mf_DelAllMSPlayer(MISSION_ID,CAMP_ALL);
	ClearMapNpc(nMapID);
	ClearMapTrap(MAPID);
	WriteLog("[K�t h�n]: H�n l� k�t th�c, ID h�n l� l�:"..nWeddingID);
	local nXiNiang = GetMissionV(MV_XINIANG_INDEX);
	local szXiNiang = GetNpcName(nXiNiang);
	WriteLog("[K�t h�n]: S�n kh�u k�t h�n �� ��ng, NPC H� N��ng:"..nXiNiang..", t�n NPC t��ng �ng"..szXiNiang);
	mf_ClearMissionData();
end;
--����뿪���񳡵�ʱ�Ĳ���
function MR_LeaveMarryField()
	local nMapID = GetWorldPos();
	local nFieldID = map_field2type[nMapID];
	Msg2MSAll(MISSION_ID,GetName().."R�i s�n kh�u k�t h�n")
	MR_RestorePlayerState();
	LeaveChannel(MARRIAGE_CHANNEL);
	NewWorld(map_leavefieldpos[nFieldID][1],map_leavefieldpos[nFieldID][2],map_leavefieldpos[nFieldID][3])
end;
--��ҽ�����񳡵�ʱ�Ĳ���
function MR_JoinMarryField(nCamp)
	local nFieldID = map_field2type[SubWorldIdx2ID(SubWorld)]
	CleanInteractive();
	if nCamp == CAMP_COUPLE then
		LearnSkill(SKILL_CANDY)
		Msg2Player("V�o s�n kh�u, nh�p chu�t ph�i tham gia h�n l� c�ng m�i ng��i �n k�o m�ng.");
		SetMissionS(GetSex(),GetName());	--��¼�������������������
	end;
	if NewWorld(map_fieldpos[nFieldID][1],map_fieldpos[nFieldID][2],map_fieldpos[nFieldID][3]) == 1 then
		Msg2MSAll(MISSION_ID,GetName().."V�o s�n kh�u, ch�c m�ng t�n lang v� t�n n��ng!")
		MR_SetPlayerState();
		EnterChannel(MARRIAGE_CHANNEL);
		AddMSPlayer(MISSION_ID,nCamp);
	end;
end;
--�������׼���׶ε��¼�
function MR_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		SetMissionV(MV_FIELD_STATE,MS_STATE_STARTED);
		SetMissionV(MV_TIMER_LOOP,STARTED_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL);
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"H�n l� s�p k�t th�c, ch� c�n"..(nLoop*5).." ph�t ");
	end;
end;
--�����������е��¼�
function MR_ProcessStartedTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		SetMissionV(MV_FIELD_STATE,MS_STATE_COMPLETE);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIMER_INTERVAL);
		Msg2MSAll(MISSION_ID,"H�n l� �� k�t th�c, m�i ng��i r�i s�n kh�u");
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		if mod(nLoop,2) == 0 then
			Msg2MSAll(MISSION_ID,"H�n l� s�p k�t th�c, ch� c�n"..(nLoop*5).." ph�t ");
		end;
		local fAddExp = function(tArg)
			ModifyExp(GetLevel()^2*15);
			Msg2Player("May m�n: B�n nh�n ���c"..(GetLevel()^2*15).." �i�m kinh nghi�m");
		end;
		mf_OperateAllPlayer(MISSION_ID,fAddExp,{},0);
	end;
end;
--��������������������뿪����
function MR_ProcessWaitOutTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"H�n l� s�p k�t th�c, ch� c�n"..nLoop.." ph�t, xin m�i ng��i r�i kh�i s�n kh�u. T�n Lang ��n ch� T�n N��ng �� nh�n H�ng bao");
	end;
end;
--���볡��ʱͳһ���еĲ���
function MR_SetPlayerState()
	LeaveTeam();	--�뿪����
	SetLogoutRV(1);	--���õ�½��Ϊ����������
	SetFightState(1)
	CreateTrigger(3,LOG_ID,LOG_CUSTOM_ID);
	SetDeathScript("\\script\\���\\mission\\playerdeath.lua");
	local nFieldType = map_field2type[SubWorldIdx2ID(SubWorld)];
	SetTempRevPos(map_RevPos[nFieldType][1],map_RevPos[nFieldType][2]*32,map_RevPos[nFieldType][3]*32)	--������
	SetDeathPunish(0)
	SetTask(TASK_WEDDING1_ID+nFieldType-1,GetMissionV(MV_WEDDING_ID));
end;
--�뿪����ʱͳһ���еĲ���
function MR_RestorePlayerState()
	SetLogoutRV(0)
	SetFightState(0)
	if HaveLearnedSkill(SKILL_CANDY) == 1 then
		RemoveSkill(SKILL_CANDY);
	end;
	SetDeathScript("");
	SetTempRevPos(0,0,0);
	SetDeathPunish(1);
	RemoveTrigger(GetTrigger(LOG_CUSTOM_ID));
end;
--��ȡʳ����Ϣ�ַ�����nTypeΪ1ʱ��ʾ���������ϵ�ʳ����Ϣ��Ϊ2ʱ��ʾ��ȡ���ص�ʳ����Ϣ
function MR_GetFoodsString(nType)
	local sString = "";
	local nFoodCount = 0;
	local nMapID = GetWorldPos();
	for i=1,getn(tFoods) do
		if nType == 1 then
			nFoodCount = GetItemCount(tFoods[i][1],tFoods[i][2],tFoods[i][3]);
		else
			nFoodCount = GetMissionV(MV_FOOD_BEGIN+i-1);
		end;
		if nFoodCount > 0 then
			sString = sString..nFoodCount..tFoods[i][4]..", ";
		end; 
	end;
	return sString;
end;

function MR_CreateMapNPC(nFieldID)
	local nNpcIndex = 0;
	if nFieldID == 1 then
		nNpcIndex = CreateNpc("Th��ng nh�n", "S� gi� h�n l�", 851, 1554, 3232)
	  	SetNpcScript(nNpcIndex, "\\script\\���\\npc\\���촫����.lua");  
		nNpcIndex = CreateNpc("Th��ng nh�n", "D�ch v� h�n nh�n", 851, 1567, 3156)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��������.lua");  		
		nNpcIndex = CreateNpc("Th��ng nh�n", "T�ng qu�n d�ch v� h�n nh�n", 851, 1558, 3165)
		SetNpcScript(nNpcIndex,"\\script\\���\\npc\\���챣����.lua");  		
		nNpcIndex = CreateNpc("H� N��ng", "H� N��ng", 851, 1608, 3142)
		SetMissionV(MV_XINIANG_INDEX,nNpcIndex);
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\ϲ��.lua");  	
		nNpcIndex = CreateNpc("Ng��i th�i k�n", "Nh�c c�ng", 851, 1622, 3155)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\������.lua");  	
		nNpcIndex = CreateNpc("M�m c�", " ", 851, 1586, 3199)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua");  		
		nNpcIndex = CreateNpc("M�m c�", " ", 851, 1591, 3203)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua");  		
		nNpcIndex = CreateNpc("M�m c�", " ", 851, 1586, 3207)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua");  
		nNpcIndex = CreateNpc("M�m c�", " ", 851, 1582, 3203)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua"); 
		WriteLog("[K�t h�n]: T�o NPC ph�c v� h�a trang th�nh c�ng");
	elseif nFieldID == 2 then
		nNpcIndex = CreateNpc("Th��ng nh�n", "S� gi� h�n l�", 852, 1615, 3276)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\���촫����.lua");  		
		nNpcIndex = CreateNpc("Th��ng nh�n", "D�ch v� h�n nh�n", 852, 1600, 3225)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��������.lua"); 		
		nNpcIndex = CreateNpc("Th��ng nh�n", "T�ng qu�n d�ch v� h�n nh�n", 852, 1600, 3235)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\���챣����.lua"); 		
		nNpcIndex = CreateNpc("H� N��ng", "H� N��ng", 852, 1680, 3217)
		SetMissionV(MV_XINIANG_INDEX,nNpcIndex);
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\ϲ��.lua"); 	
		nNpcIndex = CreateNpc("Ng��i th�i k�n", "Nh�c c�ng", 852, 1677, 3223)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\������.lua"); 	
		nNpcIndex = CreateNpc("Ng��i th�i k�n", "Nh�c c�ng", 852, 1683, 3223)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\������.lua"); 		
		nNpcIndex = CreateNpc("M�m c�", " ", 852, 1664, 3237)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua"); 		
		nNpcIndex = CreateNpc("M�m c�", " ", 852, 1664, 3246)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua"); 		
		nNpcIndex = CreateNpc("M�m c�", " ", 852, 1659, 3242)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua"); 		
		nNpcIndex = CreateNpc("M�m c�", " ", 852, 1669, 3242)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua"); 		
		nNpcIndex = CreateNpc("M�m c�", " ", 852, 1659, 3250)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua"); 		
		nNpcIndex = CreateNpc("M�m c�", " ", 852, 1654, 3246)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua"); 	
		WriteLog("[K�t h�n]: T�o NPC ph�c ph�c tu�n tr�ng m�t th�nh c�ng");
	elseif nFieldID == 3 then
		nNpcIndex = CreateNpc("Th��ng nh�n", "S� gi� h�n l�", 853, 1550, 3217)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\���촫����.lua"); 		
		nNpcIndex = CreateNpc("Th��ng nh�n", "D�ch v� h�n nh�n", 853, 1654, 3136)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��������.lua"); 	
		nNpcIndex = CreateNpc("Th��ng nh�n", "D�ch v� h�n nh�n", 853, 1596, 3224)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��������.lua"); 		
		nNpcIndex = CreateNpc("Th��ng nh�n", "D�ch v� h�n nh�n", 853, 1539, 3168)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��������.lua"); 		
		nNpcIndex = CreateNpc("Th��ng nh�n", "T�ng qu�n d�ch v� h�n nh�n", 853, 1536, 3141)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\���챣����.lua"); 	
		nNpcIndex = CreateNpc("Th��ng nh�n", "T�ng qu�n d�ch v� h�n nh�n", 853, 1589, 3108)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\���챣����.lua"); 		
		nNpcIndex = CreateNpc("Th��ng nh�n", "T�ng qu�n d�ch v� h�n nh�n", 853, 1613, 3201)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\���챣����.lua"); 		
		nNpcIndex = CreateNpc("Th��ng nh�n", "T�ng qu�n d�ch v� h�n nh�n", 853, 1657, 3175)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\���챣����.lua"); 	
		nNpcIndex = CreateNpc("H� N��ng", "H� N��ng", 853, 1627, 3142)
		SetMissionV(MV_XINIANG_INDEX,nNpcIndex);
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\ϲ��.lua"); 	
		nNpcIndex = CreateNpc("Ng��i th�i k�n", "Nh�c c�ng", 853, 1640, 3158)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\������.lua"); 	
		nNpcIndex = CreateNpc("Ng��i th�i k�n", "Nh�c c�ng", 853, 1625, 3172)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\������.lua"); 	
		nNpcIndex = CreateNpc("Ng��i th�i k�n", "Nh�c c�ng", 853, 1595, 3113)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\������.lua"); 	
		nNpcIndex = CreateNpc("Ng��i th�i k�n", "Nh�c c�ng", 853, 1575, 3132)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\������.lua"); 		
		nNpcIndex = CreateNpc("M�m c�", " ", 853, 1601, 3174)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua"); 		
		nNpcIndex = CreateNpc("M�m c�", " ", 853, 1605, 3179)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua"); 		
		nNpcIndex = CreateNpc("M�m c�", " ", 853, 1600, 3185)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua"); 		
		nNpcIndex = CreateNpc("M�m c�", " ", 853, 1595, 3180)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua"); 		
		nNpcIndex = CreateNpc("M�m c�", " ", 853, 1589, 3186)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua"); 		
		nNpcIndex = CreateNpc("M�m c�", " ", 853, 1593, 3190)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua"); 	
		nNpcIndex = CreateNpc("M�m c�", " ", 853, 1581, 3153)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua"); 		
		nNpcIndex = CreateNpc("M�m c�", " ", 853, 1576, 3149)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua"); 		
		nNpcIndex = CreateNpc("M�m c�", " ", 853, 1570, 3155)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua"); 		
		nNpcIndex = CreateNpc("M�m c�", " ", 853, 1574, 3160)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua"); 		
		nNpcIndex = CreateNpc("M�m c�", " ", 853, 1569, 3166)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua"); 		
		nNpcIndex = CreateNpc("M�m c�", " ", 853, 1564, 3161)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua"); 	
		WriteLog("[K�t h�n]: T�o NPC ph�c v� ��ng ph�ng th�nh c�ng");
	elseif nFieldID == 4 then
		nNpcIndex = CreateNpc("Th��ng nh�n", "S� gi� h�n l�", 854, 1612, 3324)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\���촫����.lua"); 		
		nNpcIndex = CreateNpc("Th��ng nh�n", "D�ch v� h�n nh�n", 854, 1644, 3277)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��������.lua"); 	
		nNpcIndex = CreateNpc("Th��ng nh�n", "D�ch v� h�n nh�n", 854, 1644, 3277)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��������.lua"); 	
		nNpcIndex = CreateNpc("Th��ng nh�n", "T�ng qu�n d�ch v� h�n nh�n", 854, 1653, 3286)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\���챣����.lua"); 	
		nNpcIndex = CreateNpc("Th��ng nh�n", "T�ng qu�n d�ch v� h�n nh�n", 854, 1608, 3259)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\���챣����.lua"); 		
		nNpcIndex = CreateNpc("H� N��ng", "H� N��ng", 854, 1663, 3267)
		SetMissionV(MV_XINIANG_INDEX,nNpcIndex);
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\ϲ��.lua"); 	
		nNpcIndex = CreateNpc("Ng��i th�i k�n", "Nh�c c�ng", 854, 1670, 3274)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\������.lua"); 	
		nNpcIndex = CreateNpc("Ng��i th�i k�n", "Nh�c c�ng", 854, 1679, 3265)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\������.lua"); 	
		nNpcIndex = CreateNpc("Ng��i th�i k�n", "Nh�c c�ng", 854, 1647, 3254)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\������.lua"); 	
		nNpcIndex = CreateNpc("Ng��i th�i k�n", "Nh�c c�ng", 854, 1658, 3244)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\������.lua"); 		
		nNpcIndex = CreateNpc("M�m c�", " ", 854, 1653, 3300)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua"); 		
		nNpcIndex = CreateNpc("M�m c�", " ", 854, 1658, 3304)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua"); 		
		nNpcIndex = CreateNpc("M�m c�", " ", 854, 1648, 3304)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua"); 		
		nNpcIndex = CreateNpc("M�m c�", " ", 854, 1653, 3308)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua"); 		
		nNpcIndex = CreateNpc("M�m c�", " ", 854, 1648, 3312)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua"); 		
		nNpcIndex = CreateNpc("M�m c�", " ", 854, 1643, 3308)
		SetNpcScript(nNpcIndex, "\\script\\���\\npc\\��ϯ.lua"); 
		WriteLog("[K�t h�n]: Ho�n t�t vi�c t�o NPC tr�n ��nh V�n S�n");
	else
		WriteLog("[K�t h�n b� l�i]: Tham s� t�o NPC s�n kh�u h�n l� b� l�i, t�o NPC th�t b�i, nFieldID:"..nFieldID);
	end;
	local nXiNiang = GetMissionV(MV_XINIANG_INDEX);
	local szXiNiang = GetNpcName(nXiNiang);
	WriteLog("[K�t h�n]: T�o NPC k�t h�n, NPC h��ng d�n H� N��ng:"..nXiNiang..", t�n NPC t��ng �ng"..szXiNiang);
end;
--����TRAP��
function MR_CreateMapTrap(nFieldID)
	local nMapID = map_fieldpos[nFieldID][1];
	if nFieldID == 1 then
		for i=1,10 do
			AddMapTrap(nMapID,(1537-i)*32,(3180-i)*32,"\\script\\���\\mission\\trap.lua")
		end;
		for i=1,10 do
			AddMapTrap(nMapID,(1522+i)*32,(3194-i)*32,"\\script\\���\\mission\\trap.lua")
		end;
	elseif nFieldID == 2 then
		for i=1,10 do
			AddMapTrap(nMapID,(1597+i)*32,3176*32,"\\script\\���\\mission\\trap.lua")
		end;
		for i=1,20 do
			AddMapTrap(nMapID,1607*32,(3176-i)*32,"\\script\\���\\mission\\trap.lua")
		end;		
	elseif nFieldID == 3 then
		for i=1,20 do
			AddMapTrap(nMapID,1510*32,(3163+i)*32,"\\script\\���\\mission\\trap.lua")
		end;	
	else
		for i=1,10 do
			AddMapTrap(nMapID,(1602+i)*32,3232*32,"\\script\\���\\mission\\trap.lua")
		end;
	end;
end;
--��½������
function OnLogin()
	MR_RestorePlayerState();
end;