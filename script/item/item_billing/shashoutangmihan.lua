--create date:2007-07-02
--author:yanjun
--describe:
--��ɱ������ʹ�ú󣬿����ٻ���һ��BOSS�������������ط�ʹ�ã�������ɱ�������ʹ�á�
--�ٻ��������£�
--��������75%
--����������20%
--����졪��5%
--�õ��߱���������д��ڵ���5��ʱ������ʹ�á�
--ÿ������ʹ��ʱ�����ʱ��Ϊ2���ӣ�ֻҪ��������һ����ʹ�ù����������ٻ�������ȴ�2����
Include("\\script\\task\\killer_hall\\mission\\mission_head.lua");
NEED_TEAM_MEMBER = 5;	--��Ҫ�Ķ�Ա����
NEED_INTERVAL = 2*60;	--��Ҫ�ļ��ʱ��
function OnUse(nItemIdx)
	local nCurMapID = GetWorldPos();
	if nCurMapID ~= MAP_ID then
		Talk(1,"","M�t h�m S�t Th� ���ng ch� ���c s� d�ng trong S�t Th� ���ng. ");
		return 0;
	end;
	if GetMissionV(MV_MISSION_STATE) ~= MS_STATE_STARTED then
		Talk(1,"","M�t h�m S�t Th� ���ng ch� ���c s� d�ng khi s�t th� xu�t hi�n. ");
		return 0;
	end;
	local nTeamSize = GetTeamSize();
	if nTeamSize < NEED_TEAM_MEMBER then
		Talk(1,"","Ph�i s� d�ng M�t h�m S�t Th� ���ng, �t nh�t ph�i c� <color=yellow>"..(NEED_TEAM_MEMBER-1).."<color> ��ng ��i gi�p b�n. ");
		return 0;
	end;
	local nTimeElapse = GetTime() - get_team_use_time(nTeamSize);
	if nTimeElapse <= NEED_INTERVAL then	--ʱ�仹û��
		Talk(1,"","c�n <color=yellow>"..tf_GetTimeString(NEED_INTERVAL-nTimeElapse).."<color> m�i c� th� ti�p t�c s� d�ng M�t h�m S�t Th� ���ng. ");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		set_team_time(nTeamSize);
		create_boss();
	end;
end;
--���ض��������������ʹ��ɱ�����غ���ʱ��
function get_team_use_time(nTeamSize)
	local nOldPlayerIdx = PlayerIndex;
	local nNearestTime = 0;
	local nUseTime = 0;
	for i=1,nTeamSize do
		PlayerIndex = GetTeamMember(i);
		nUseTime = GetTask(KH_TASK_USE_MIHAN_TIME);
		nNearestTime = max(nUseTime,nNearestTime);
	end;
	PlayerIndex = nOldPlayerIdx;
	return nNearestTime;
end;
--���ö�������������ҵ�ʹ��ʱ��
function set_team_time(nTeamSize)
	local nOldPlayerIdx = PlayerIndex;
	local nTime = GetTime();
	for i=1,nTeamSize do
		PlayerIndex = GetTeamMember(i);
		SetTask(KH_TASK_USE_MIHAN_TIME,nTime);
	end;
	PlayerIndex = nOldPlayerIdx;
end;
--�������һ��boss
function create_boss()
	local nRand = random(1,100);
	local nType = 0;
	if nRand <= 75 then
		nType = NPC_TYPE_XIANGZHU;
	elseif nRand <= 95 then
		nType = NPC_TYPE_FUTANGZHU;
	else
		nType = NPC_TYPE_LIDAZUI;
	end;
	local sBossModel,sBossName,nLifeTime = tNpcInfo[nType][1],tNpcInfo[nType][2],tNpcInfo[nType][3];
	local nNpcIdx = CreateNpc(sBossModel,sBossName,GetWorldPos());
	SetNpcDeathScript(nNpcIdx,"\\script\\task\\killer_hall\\npc_death.lua");
	SetNpcLifeTime(nNpcIdx,nLifeTime);
	gf_Msg2Team(GetName().."s� d�ng 1 M�t h�m S�t Th� ���ng, tri�u t�p "..sBossName);
	WriteLog("[S�t Th� ���ng]::"..GetName().."s� d�ng 1 M�t h�m S�t Th� ���ng, t�o ra "..sBossName)
end;