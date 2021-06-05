--create date:2007-07-15 12:51
--author:yanjun
--describe:���ؿ�stage�ļ�����Ҫ�ǹؿ�����ز���

--MV_VALUE1��¼ˢ�˶��ٴ�BOSS��ߵ�С��
--MV_VALUE9��ʾҪȥ���ĵ�һ��ְҵ
--MV_VALUE10��ʾҪȥ���ĵڶ���ְҵ
Include("\\script\\missions\\tong_mission\\stage\\base_stage.lua");
LARGE = 1;
EQUAL = 0;
SHORT = -1;

CSTAGE3 = OO_Inherit(CBASE_STAGE);	--�̳л���
--=========�������������ݵĶ��������=========================================================
CSTAGE3.nStage = 3;	
CSTAGE3.tbTimerEven = {};
CSTAGE3.nNpcCount = 4;
CSTAGE3.nMaxNpcCount = 20;
CSTAGE3.tbBossInfo = 
{
	[1] = {"Boss41","Phong D��ng"},
	[2] = {"boss42","V�n Th�y"},
}
--����BOSS
function CSTAGE3:OnCreateBoss()
	self:CreateBossByType(1);
	self:CreateBossByType(2);
	Msg2MSAll(MISSION_ID,"Nhi�m v� c�a �i: ��nh b�i Phong D��ng v� V�n Th�y");
	local tbPlayer = TM_GetPlayerTable();
	TM_StartTimeGuage("Hai tay nh� m�t",2*60,0,1,tbPlayer);
	TM_StartTimeGuage("V�t ��i sao d�i",60,0,2,tbPlayer);
	TM_StartTimeGuage("T� ��i Ti�n Nh�n",2*60,0,3,tbPlayer);
end;
--�������ʹ���BOSS
function CSTAGE3:CreateBossByType(nType)
	local nMapID = SubWorldIdx2ID(SubWorld);
	nNpcIdx = CreateNpc(self.tbBossInfo[nType][1],self.tbBossInfo[nType][2],nMapID,tPos_Boss[nType][1],tPos_Boss[nType][2]);
	SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_boss.lua");
	SetMissionV(MV_BOSS1+nType-1,nNpcIdx);
	SetMissionV(MV_BOSS_COUNT,GetMissionV(MV_BOSS_COUNT)+1);
	--NpcChat(nNpcIdx,self.tbBossInfo[nType][2].."�����ǳ�");
end;
--BOSS��С��
function CSTAGE3:CreateBossChild(tbArg)
	local nTimes = GetMissionV(MV_VALUE1);
	SetMissionV(MV_VALUE1,nTimes+1);
	local nNpcIdx = 0;
	local nBossIdx = GetMissionV(MV_BOSS1);
	if nBossIdx == 0 then	--���BOSS1����
		nBossIdx = GetMissionV(MV_BOSS2);
	elseif mod(nTimes,2) == 0 and nBossIdx ~= 0 then	--ż������BOSS1û��
		nBossIdx = GetMissionV(MV_BOSS2);
	end;
	PlayerIndex = 1;
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nBossIdx);
	PlayerIndex = nil;
	local tbNpcName = {"M�t d�y","V� li�m s�","�� ti�n","H� l�u"};
	for i=1,tbArg[1] do
		nNpcIdx = CreateNpc("Ti�u qu�i �i 4",tbNpcName[i],nMapID,nMapX,nMapY,-1,1,1,100);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_npc.lua");	
		SetMissionV(MV_NPC_COUNT,GetMissionV(MV_NPC_COUNT)+1);
	end;
	local nNpcCount = GetMissionV(MV_NPC_COUNT);
	Msg2MSAll(MISSION_ID,"Hi�n t�i s� T� ��i Ti�n Nh�n l�: "..nNpcCount.."/"..self.nMaxNpcCount);
	if nNpcCount >= self.nMaxNpcCount then
		self:EndStage(0);	--����ʧ��
		return 0;
	end;
	local tbPlayer = TM_GetPlayerTable();
	TM_StopTimeGuage(3);
	TM_StartTimeGuage("T� ��i Ti�n Nh�n",45,0,3,tbPlayer);
end;
--BOSS�������ű�ִ�к���
function CSTAGE3:OnBossDeath(nNpcIdx)
	local nBossCount = GetMissionV(MV_BOSS_COUNT);
	nNpcIdx = tonumber(nNpcIdx);
	if nNpcIdx == GetMissionV(MV_BOSS1) then
		SetMissionV(MV_BOSS1,0);
	else
		SetMissionV(MV_BOSS2,0);
	end;
	SetNpcLifeTime(nNpcIdx,0);
	SetMissionV(MV_BOSS_COUNT,nBossCount-1);
	if nBossCount == 1 then
		self:EndStage();
		self:CheckAllStagePass();
		SetMissionV(MV_CHECK_POINT,-1);	--��Ϊ-1�ͱ�ʾ������Ч��
	else
		local nLoop = GetMissionV(MV_TIMER_LOOP);
		SetMissionV(MV_CHECK_POINT,nLoop+3);	--����ѭ����15�룩����
	end;
end;
--�������BOSS�ľ���
function CSTAGE3:CheckBossDistance(tbArg)
	local nBoss1Idx = GetMissionV(MV_BOSS1);
	local nBoss2Idx = GetMissionV(MV_BOSS2);
	if nBoss1Idx == 0 or nBoss2Idx == 0 then	--���������һ��BOSS����
		return 0;
	end;
	PlayerIndex = 1;
	local nMapID,nMapX1,nMapY1 = GetNpcWorldPos(nBoss1Idx);
	local nMapID,nMapX2,nMapY2 = GetNpcWorldPos(nBoss2Idx);
	PlayerIndex = nil;
	local nDis = gf_GetDistance(nMapX1,nMapY1,nMapX2,nMapY2);
	Msg2MSAll(MISSION_ID,"Kho�ng c�ch c�a 2 BOSS:"..nDis);
	local tbPlayer = TM_GetPlayerTable();
	if tbArg[1] == LARGE then
		TM_StopTimeGuage(2);
		TM_StartTimeGuage("V�t ��i sao d�i",2*60,0,2,tbPlayer);	
	else
		TM_StopTimeGuage(1);
		TM_StartTimeGuage("Hai tay nh� m�t",2*60,0,1,tbPlayer);
	end;
	if nDis >= 10 and tbArg[1] == LARGE then
		local funLostLifePercent = function(tArg)
			local nMaxLife = GetMaxLife();
			local nLostLife = floor(nMaxLife*tArg[1]/100);
			CastState("state_lost_life_per18",nLostLife,tArg[2]*18);
		end;
		gf_OperatePlayers(tbPlayer,funLostLifePercent,{5,20});
		Msg2MSAll(MISSION_ID,"T�t c� ng��i ch�i m�i gi�y m�t 5% sinh l�c, k�o d�i tr�ng 20 gi�y");
		return LARGE;
	elseif nDis <= 30 and tbArg[1] == SHORT then
		local funLostLifePercent = function(tArg)
			local nMaxLife = GetMaxLife();
			local nLostLife = floor(nMaxLife/2);
			CastState("imme_damage_life_directly",nLostLife,0);
		end;
		Msg2MSAll(MISSION_ID,"T�t c� ng��i ch�i b� s�t th��ng m�t m�t n�a sinh l�c");
		gf_OperatePlayers(tbPlayer,funLostLifePercent,{});
		return SHORT;
	else
		return EQUAL;
	end;
end;
--����ʱ�䴥����ִ�к���
function CSTAGE3:OnTimerTriggerEven()
	self:CreateBossChild({self.nNpcCount});	--������С��
	self:RemoveTimerTrigger();	--ֹͣ������ʱ��
end;
--С�������ű�ִ�к���
function CSTAGE3:OnNpcDeath(szNpcIdx)
	local nNpcIdx = tonumber(szNpcIdx);
	local nNpcCount = GetMissionV(MV_NPC_COUNT);
	if self:GetTimerTriggerState() == 0 then	--�����ǰû�п�ʼ������ʱ��
		self:SetTimerTrigger(20);	--��ʼһ��������ʱ��
	elseif nNpcCount == 1 then	--��������һֻ
		self:RemoveTimerTrigger();	--ֹͣ������ʱ��
	end;
	SetMissionV(MV_NPC_COUNT,nNpcCount-1);
	SetNpcLifeTime(nNpcIdx,0);
end;
--����ִ�к��������ﴦ������BOSS���������
function CSTAGE3:OnProcessCheckPoint()
	local nBoss1Idx = GetMissionV(MV_BOSS1);
	local nBoss2Idx = GetMissionV(MV_BOSS2);
	local nBossCount = GetMissionV(MV_BOSS_COUNT);	
	if nBossCount == 1 then
		if nBoss1Idx == 0 then
			self:CreateBossByType(1);
		elseif nBoss2Idx == 0 then
			self:CreateBossByType(2);
		end;
	else
		gf_ShowDebugInfor("Trong s� l��ng BOSS c� OnProcessCheckPoint l�i, nBossCount: "..nBossCount);
	end;	
end;
--��ʼ��tbTimerEven
CSTAGE3.tbTimerEven = 
{	--tbTimerEven�ĸ���Ԫ�ص����ݾ���ProcessTimeCheckPoint�������ĸ�����
	--	����ʱ�� ������� �����ĺ��� 			���������Ĳ���table
	[1] = {60,		120,	CSTAGE3.CheckBossDistance,	{LARGE}},	--���BOSS�����Ƿ����ĳ��ֵ
	[2] = {120,		120,	CSTAGE3.CheckBossDistance,	{SHORT}},	--���BOSS�����Ƿ�С��ĳ��ֵ
	[3] = {120,		45,		CSTAGE3.CreateBossChild,	{CSTAGE3.nNpcCount}},
	[4] = {30*60,	0,		CSTAGE3.AllDeath,			{}},
}
