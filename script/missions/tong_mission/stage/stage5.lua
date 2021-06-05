--create date:2007-07-16 9:18
--author:yanjun
--describe:���ؿ�stage�ļ�����Ҫ�ǹؿ�����ز���

--MV_VALUE9��ʾҪȥ���ĵ�һ��ְҵ
--MV_VALUE10��ʾҪȥ���ĵڶ���ְҵ
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\missions\\tong_mission\\stage\\base_stage.lua");
Include("\\script\\missions\\tong_mission\\position.lua");
CSTAGE5 = OO_Inherit(CBASE_STAGE);	--�̳л���
--=========�������������ݵĶ��������=========================================================
CSTAGE5.nStage = 5;	
CSTAGE5.tbTimerEven = {};
CSTAGE5.nDistance = 20;
CSTAGE5.tbBossInfo = {"boss5","Ti�t Ho�nh Th�"};
CSTAGE5.tbTrap = gf_MergeTable(tPos_Boss,tPos_Rect);	--���صĵ㣺����BOSS����ĸ�NPC��
CSTAGE5.nCurIdx = 1;

--����BOSS
function CSTAGE5:OnCreateBoss()
	local nMapID = SubWorldIdx2ID(SubWorld);
	local szModel = self.tbBossInfo[1];
	local szName = self.tbBossInfo[2];
	local nPosX = tPos_Boss[1][1];
	local nPosY = tPos_Boss[1][2];
	local nNpcIdx = CreateNpc(szModel,szName,nMapID,nPosX,nPosY);
	SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_boss.lua");
	SetMissionV(MV_BOSS1,nNpcIdx);
	Msg2MSAll(MISSION_ID,"Nhi�m v� c�a �i: ��nh b�i "..szName);
	self:CreateRandomTrap(1);
	local tbPlayer = TM_GetPlayerTable();
	TM_StartTimeGuage("��ng c�a th� ch�",60,0,1,tbPlayer);
end;
--�������ˢ�Ա�NPC
function CSTAGE5:CreateOpposedNpc(tbArg)
	local nNpcIdx = 0;
	local nCount = tbArg[1];
	local nMapID = SubWorldIdx2ID(SubWorld);
	for i=1,nCount do
		nNpcIdx = CreateNpc("Ti�u qu�i �i 5","�c Khuy�n",nMapID,1569,3175,-1,1,1,200);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_npc.lua");
	end;
	local tbPlayer = TM_GetPlayerTable();
	TM_StopTimeGuage(1);
	TM_StartTimeGuage("��ng c�a th� ch�",30,0,1);
end;
--BOSS�������ű�ִ�к���
function CSTAGE5:OnBossDeath(szNpcIdx)
	local nNpcIdx = tonumber(szNpcIdx);
	SetNpcLifeTime(nNpcIdx,0);
	self:EndStage();
	self:CheckAllStagePass();
end;
--С�������ű�ִ�к���
function CSTAGE5:OnNpcDeath(szNpcIdx)
	local nNpcIdx = tonumber(szNpcIdx);
	local szNpcName = GetNpcName(nNpcIdx);
	if szNpcName == "C� quan" then
		local nMapID,nMapX1,nMapY1 = GetNpcWorldPos(nNpcIdx);
		local nBossIdx = GetMissionV(MV_BOSS1);
		local nMapID,nMapX2,nMapY2 = GetNpcWorldPos(nBossIdx);
		local nDis = gf_GetDistance(nMapX1,nMapY1,nMapX2,nMapY2);
		if nDis <= self.nDistance then
			TM_ModifyNpcLife(nBossIdx,-5);
			Msg2MSAll(MISSION_ID,GetNpcName(nBossIdx).."Sinh L�c gi�m 5%");
		end;
		self:CreateRandomTrap(1);
	end;
	SetNpcLifeTime(nNpcIdx,0);
end;
--����㴴������
function CSTAGE5:CreateRandomTrap(nCount)
	local nRandom = 0;
	local tNpcModel = {"C� quan 1 �i 5", "C� quan 2 �i 5"}
	local nNpcIdx = 0;
	local nRandPosIdx = 0;
	local nMapID = SubWorldIdx2ID(SubWorld);
	for i=1,nCount do
		nRandPosIdx = gf_GetNextRandomIndex(self.nCurIdx,getn(self.tbTrap));
		self.nCurIdx = nRandPosIdx;
		nRandom = random(1,2)
		nNpcIdx = CreateNpc(tNpcModel[nRandom],"C� quan",nMapID,self.tbTrap[nRandPosIdx][1],self.tbTrap[nRandPosIdx][2]);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_npc.lua");
	end;
end;
--��ʼ��tbTimerEven
CSTAGE5.tbTimerEven = 
{	--tbTimerEven�ĸ���Ԫ�ص����ݾ���ProcessTimeCheckPoint�������ĸ�����
	--	����ʱ�� ������� �����ĺ��� 			���������Ĳ���table
	[1] = {60,		30,		CSTAGE5.CreateOpposedNpc,	{5}},
	[2] = {30*60,	0,		CSTAGE5.AllDeath,			{}},
}
