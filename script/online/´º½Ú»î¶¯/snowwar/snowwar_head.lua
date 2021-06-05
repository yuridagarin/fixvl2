--Create Date:2006�����һ��
--Describe:�����괺��ѩ��Missionͷ�ļ�
--Author:yanjun
Include("\\script\\online\\���ڻ\\newyear_head.lua")	
Include("\\script\\lib\\globalfunctions.lua");

DEBUG_VERSION = 1;
--===============================������ϵͳ��س���=========================================
FRAME_PER_SECOND = 18;								--��Ϸ�����ٶȣ�ÿ�룱��֡
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--ÿ������Ϸ֡��

GLB_SNOWWAR_TIME = 4580;								--������ȫ�ֱ�������¼��ǰѩ�̳��ص���Ϣ
--===============================������Mission��س���======================================
MISSION_ID = 31;									--Mission��ID

TIMER_ID = 59;										--Mission��ʱ����ID
TIMER_INTERVAL = 30*FRAME_PER_SECOND;				--��ʱ��������ʱ��������λ��
TIMER_COUNT = (30*FRAME_PER_MIN/TIMER_INTERVAL)-1;	--�ܵļ�ʱ��������������
TIMER_WAITOUT_COUNT = (20*FRAME_PER_MIN/TIMER_INTERVAL)-1;--��ȡ����ʱ�䣬��������

MV_FIELD_STATE = 1;									--��¼ѩ�̳��ص�״̬
MV_TIMER_LOOP = 2;									--��¼��ʱ����

MS_STATE_PEACE = 0;									--���ؿ���
MS_STATE_READY = 1;									--׼���׶�
MS_STATE_FIGHT = 2;									--��ս�׶�
MS_STATE_COMPLETE = 3;								--�ȴ������׶�
--===============================����������������=========================================
PT_STATUS = 1715;									--�������������������ֵΪ��ʱ����Ҳ����κ�װ��
PT_POINT = 2380;									--���˻���
PT_SIGNUP_TIME = 2381;								--�μ�ĳ��ѩ�̵���Ϣ
PT_KILL_COUNT = 2382;								--ɱ����Ҵ���	
PT_DEATH_COUNT = 2383;								--��ɱ����0
--===============================��������������=============================================
tMAP_CITY_FIELD =									--������ѩ�̵�ͼ�Ķ�Ӧ��ϵ
{	
	{100,963,"Tuy�n Ch�u"},	--Ȫ��
	{200,962,"Bi�n Kinh"},	--�꾩
	{300,961,"Th�nh ��"},	--�ɶ�
}

tBORN_POS = 										--���������������
{
	{1859,3230},
	{1664,3654},
	{1664,3229},
	{1854,3654}
}

tEXIT_POS = 
{
	{100,1365,2932},	--Ȫ��
	{200,1409,3048},	--�꾩
	{300,1820,3573},	--�ɶ�
}

LOG_ID = 203;										--��½������ID
LOG_CUSTOM_ID = 3017;								--��½�������Զ�����

MAX_PLAYER = 100;									--�������
BASE_POINT = 10;									--ԭʼ��
LIMIT_POINT = 50;									--��������
--===============================�����ǹ�������=============================================
--������ص�NPC
function SW_CreateSnowWarNpc()
	local nCityMapID,nFieldID,nIndex = SW_GetMapIDFromSubWorld(SubWorld);
	local npcIndex = CreateNpc("Giang h� h�o ki�t","Xa phu_n�m tuy�t",nFieldID,1665,3652)
	SetNpcScript(npcIndex,"\\script\\online\\���ڻ\\�ɶ�ѩ�̴�����out.lua")
	npcIndex = CreateNpc("Giang h� h�o ki�t","Xa phu_n�m tuy�t",nFieldID,1665,3224)
	SetNpcScript(npcIndex,"\\script\\online\\���ڻ\\�ɶ�ѩ�̴�����out.lua")
	npcIndex = CreateNpc("Giang h� h�o ki�t","Xa phu_n�m tuy�t",nFieldID,1857,3226)
	SetNpcScript(npcIndex,"\\script\\online\\���ڻ\\�ɶ�ѩ�̴�����out.lua")
	npcIndex = CreateNpc("Giang h� h�o ki�t","Xa phu_n�m tuy�t",nFieldID,1856,3652)
	SetNpcScript(npcIndex,"\\script\\online\\���ڻ\\�ɶ�ѩ�̴�����out.lua")	
end;
--������ҵ�һЩ״̬
function SW_SetPlayerState()
	SW_NewSnowWarClear();
	AddItem(2,3,216,50)
	Msg2Player("B�n nh�n ���c 50 ��n Ti�u Tuy�t C�u.")
	local nBornPos = random(1,getn(tBORN_POS))
	local nMapID = GetWorldPos();
	local nSnowWarMapID = SW_GetFieldIDFromMapID(nMapID);
	SetTempRevPos(nSnowWarMapID,tBORN_POS[nBornPos][1]*32,tBORN_POS[nBornPos][2]*32)	--���������
	SetDeathScript("\\script\\online\\���ڻ\\playerdeath.lua")
	SetDeathPunish(0)
	SetFightState(0)
	SetPKFlag(2,1)
	ForbidChangePK(1);	--��ֹ�ı�PK״̬
	UseScrollEnable(0)
	LeaveTeam();	--�뿪����
	SetLogoutRV(1);	--���õ�½��Ϊ����������
	ForbitTrade(1);	--��ֹ����
	StallEnable(0);	--��ֹ��̯(���ߺ�ᱻ���)
	CreateTrigger(3,LOG_ID,LOG_CUSTOM_ID);
	for SkillID=843,851 do
		LearnSkill(SkillID)	--ѧ���ѩ�̼���
	end
	Msg2Player("B�n �� h�c ���c t�t c� c�c k� n�ng s� d�ng tuy�t c�u, nh�p chu�t ph�i v�o bi�u t��ng k� n�ng �� ch�n k� thu�t t��ng �ng.");
	Say("B�n �� h�c ���c t�t c� c�c k� n�ng s� d�ng tuy�t c�u, nh�p chu�t ph�i v�o bi�u t��ng k� n�ng �� ch�n k� thu�t t��ng �ng.",0);
	SetTask(PT_SIGNUP_TIME,GetGlbValue(GLB_SNOWWAR_TIME));
	SetLRSkill(843,0);
	SetTask(PT_STATUS,2);
end;
--�ָ���ҵ�һЩ״̬
function SW_RestorePlayerState()
	SetTempRevPos(0,0,0);
	SetDeathScript("");
	SetDeathPunish(1);
	SetFightState(0);
	ForbidChangePK(0);	--����ı�PK״̬
	SetPKFlag(0,0);
	UseScrollEnable(1);
	SetLogoutRV(0);
	ForbitTrade(0);
	InteractiveEnable(1);
	StallEnable(1);
	RemoveTrigger(GetTrigger(LOG_CUSTOM_ID));
	for SkillID=843,851 do
		if HaveLearnedSkill(SkillID) == 1 then
			RemoveSkill(SkillID)	--���Ǵ�ѩ�̼���
		end;
	end
	SetTask(PT_STATUS,0);
	for i=216,221 do	--ɾ��ѩ��
		local nItemCount = BigGetItemCount(2,3,i);
		if nItemCount > 0 then
			BigDelItem(2,3,i,nItemCount)	
		end;
	end;
end;
--�ɵ�ͼID���Ŀ��ѩ�̵�ͼ��ID
function SW_GetFieldIDFromMapID(nMapID)
	for i=1,getn(tMAP_CITY_FIELD) do
		if tMAP_CITY_FIELD[i][1] == nMapID then
			return tMAP_CITY_FIELD[i][2]
		end;
	end;
	return 0;
end;
--��ѩ�̵�ͼ���������Ӧ�ĳ��е�ͼID��ѩ�̵�ͼID�Լ���Ӧ�ڱ��������
--�������ʹ��SubWorldIdx2IDָ��ֱ�Ӵӵ�ͼ������idx����ȡ��ͼID
function SW_GetMapIDFromSubWorld(nFieldSubWorld)
	for i=1,getn(tMAP_CITY_FIELD) do
		if SubWorldID2Idx(tMAP_CITY_FIELD[i][2]) == nFieldSubWorld then
			return tMAP_CITY_FIELD[i][1],tMAP_CITY_FIELD[i][2],i;
		end;
	end;
	return 0,0,0;
end;
--ѩ�̳�ʼ��ʱҪ����һЩ����
function SW_InitSnowWar()
	SetGlbValue(GLB_SNOWWAR_TIME,tonumber(date("%y%m%d%H")));
	SW_CreateSnowWarNpc();
	RunMission(MISSION_ID);
	WriteLog("[n�m tuy�tn�m 2007]: Ho�t ��ng n�m tuy�t �� k�t th�c, ID n�m tuy�t"..GetGlbValue(GLB_SNOWWAR_TIME));
end;
--ѩ�̿�ʼʱMissionҪ����һЩ����
function SW_RunSnowWar()
	gf_ShowDebugInfor("MISSION_ID:"..MISSION_ID.." TIMER_ID:"..TIMER_ID.." TIMER_INTERVAL:"..TIMER_INTERVAL);
	StartMissionTimer(MISSION_ID,TIMER_ID,TIMER_INTERVAL);
	SetMissionV(MV_TIMER_LOOP,TIMER_COUNT);
	SetMissionV(MV_FIELD_STATE,MS_STATE_FIGHT);	--��ս״̬
end;
--ѩ�̽���ʱMissionҪ����һЩ����
function SW_EndSnowWar()
	local nCityMapID,nFieldID,nIndex = SW_GetMapIDFromSubWorld(SubWorld);
	StopMissionTimer(MISSION_ID,TIMER_ID);
	ClearMapNpc(nFieldID);
	Msg2SubWorld(tMAP_CITY_FIELD[nIndex][3].." n�m tuy�t �� k�t th�c.");
	SW_DelAllMSPlayer();
	SetMissionV(MV_FIELD_STATE,MS_STATE_PEACE);
	WriteLog("[n�m tuy�tn�m 2007]: Ho�t ��ng n�m tuy�t �� k�t th�c, ID n�m tuy�t"..GetGlbValue(GLB_SNOWWAR_TIME));
end;
--����뿪ѩ��
function SW_LeaveSnowWar()
	local nCityMapID,nFieldID,nIndex = SW_GetMapIDFromSubWorld(SubWorld);
	Msg2MSAll(MISSION_ID,GetName().."R�i kh�i khu n�m tuy�t")
	SW_RestorePlayerState();
	NewWorld(tEXIT_POS[nIndex][1],tEXIT_POS[nIndex][2],tEXIT_POS[nIndex][3])
end;
--��Ҽ���ѩ��
function SW_JoinSnowWar()
	local nRandPos = random(1,getn(tBORN_POS));
	local nMapID = GetWorldPos();
	local nFieldID = SW_GetFieldIDFromMapID(nMapID);
	CleanInteractive();
	SW_SetPlayerState();
	if NewWorld(nFieldID,tBORN_POS[nRandPos][1],tBORN_POS[nRandPos][2]) == 1 then
		RemvoeTempEffect()
		Msg2MSAll(MISSION_ID,GetName().."V�o khu n�m tuy�t")
		InteractiveEnable(0);	--�رս���	������NewWorld֮��ִ�в���Ч
		AddMSPlayer(MISSION_ID,0);
	else
		WriteLog("[n�m tuy�t]:"..GetName().."V�o chi�n ��a NewWorld th�t b�i!!!");
	end;
end;
--ɾ��������ѩ�̳�����������
function SW_DelAllMSPlayer()
	local tPlayer = mf_GetMSPlayerIndex(MISSION_ID,0);
	local nOldPlayerIndex = PlayerIndex;
	gf_ShowDebugInfor("S� l��ng ng��i ch�i:"..getn(tPlayer));
	for i=1,getn(tPlayer) do
		PlayerIndex = tPlayer[i];
		if PlayerIndex > 0 then
			gf_ShowDebugInfor("H��ng d�n ng��i ch�i:"..PlayerIndex);
			--SetTask(PT_SIGNUP_TIME,0);	--���Խ׶�ʹ��
			DelMSPlayer(MISSION_ID,0);
		end
	end;
	PlayerIndex = nOldPlayerIndex;
end;
--��ʱ��������ѩ�̿�ʼ�׶ε�һЩ����
function SW_ProcessFightTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		SetMissionV(MV_FIELD_STATE,MS_STATE_COMPLETE);
		SetMissionV(MV_TIMER_LOOP,TIMER_WAITOUT_COUNT);
		Msg2MSAll(MISSION_ID,"Th�i gian n�m tuy�t �� k�t th�c, xin c�c v� ��n g�p Tuy�t Gi� �� nh�n ph�n th��ng.");
		local fFunc = function(tArg)
			Say("Th�i gian n�m tuy�t �� k�t th�c, xin c�c v� ��n g�p Tuy�t Gi� �� nh�n ph�n th��ng.",0);
			SetFightState(0);
		end;
		mf_OperateAllPlayer(MISSION_ID,fFunc,{},0);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"Ti�n �� th�i gian: ["..(TIMER_COUNT-nLoop+1)..":"..(TIMER_COUNT+1).."]");
	end;
end;
--��ʱ��������ѩ�̽������Ƕ�ʱ���һЩ����
function SW_ProcessWaitOutTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		if mod(nLoop,2) == 0 then
			Msg2MSAll(MISSION_ID,"T�t c� m�i ng��i d�ng �i�m t�ch l�y c�a m�nh ��i ph�n th��ng."..(nLoop/2).." ph�t.");
		end;
	end;
end;
--ѩ�̼��
function SW_KnowSnowWar()
	Talk(3,"","<color=green>"..g_sNpcName.."<color>: K� n�ng kh�c nhau s� ti�u hao Tuy�t C�u kh�c nhau. M�i ng�y v�o khu n�m tuy�t s� ���c ph�t 50 Tuy�t C�u mi�n ph�, c�ng c� th� mua t�i Tuy�t Gi�.","<color=green>"..g_sNpcName.."<color>: T�i Tuy�n Ch�u, Th�nh �� v� Bi�n Kinh c� 3 khu v�c ��u c� Tuy�t Gi�","<color=green>"..g_sNpcName.."<color>: Ch� �: Trong khu v�c n�m tuy�t kh�ng th� s� d�ng H�i Th�nh ph� hay M�t H�m c�a s� ph�.")
end;
--�����µ�ѩ��ս��ʱҪ���Ĳ���
function SW_NewSnowWarClear()
	if GetGlbValue(GLB_SNOWWAR_TIME) - GetTask(PT_SIGNUP_TIME) >= 1 or GetGlbValue(GLB_SNOWWAR_TIME) == 0 then
		SetTask(PT_POINT,BASE_POINT);--������˻��֣����Ҫ��SystemTimeTask������
		SetTask(PT_KILL_COUNT,0);
		SetTask(PT_DEATH_COUNT,0);
		return 1;
	end;
	return 0;
end;
--��������Ƿ�װ����װ֮���װ��
function SW_CheckEquipment()
	for i=0,11 do
		if i~= 6 and i~= 7 and i~= 8 then
			local nGenre,nDetail,nParticular = GetPlayerEquipInfo(i);
			if nGenre ~= 0 or nDetail ~= 0 or nParticular ~= 0 then
				return 0;
			end;
		end;
	end;
	return 1;
end;
--��½��������Ϊ�˼����ļ��������Ժ���㲻�ٵ�������һ��trigger�ű��ˡ�
function OnLogin()
	SW_RestorePlayerState();
end;

function nothing()

end