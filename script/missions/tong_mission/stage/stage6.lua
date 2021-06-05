--create date:2007-07-16 15:55
--author:yanjun
--describe:���ؿ�stage�ļ�����Ҫ�ǹؿ�����ز���

--MV_VALUE9��ʾҪȥ���ĵ�һ��ְҵ
--MV_VALUE10��ʾҪȥ���ĵڶ���ְҵ
Include("\\script\\missions\\tong_mission\\stage\\base_stage.lua");
CSTAGE6 = OO_Inherit(CBASE_STAGE);	--�̳л���
--=========�������������ݵĶ��������=========================================================
CSTAGE6.nStage = 6;	
CSTAGE6.tbTimerEven = {};
CSTAGE6.nMaxNpcCount = 24;
CSTAGE6.tbBossInfo = 
{
	[1] = {"boss61","H�a V�"},
	[2] = {"boss62","L�u Quang"},
}
--����BOSS
function CSTAGE6:OnCreateBoss()
	local nMapID = SubWorldIdx2ID(SubWorld);
	local nNpcIdx = 0;
	for i=1,getn(self.tbBossInfo) do
		nNpcIdx = CreateNpc(self.tbBossInfo[i][1],self.tbBossInfo[i][2],nMapID,tPos_Boss[i][1],tPos_Boss[i][2]);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_boss.lua");
		SetMissionV(MV_BOSS1+i-1,nNpcIdx);
		SetMissionV(MV_BOSS_COUNT,GetMissionV(MV_BOSS_COUNT)+1);
		--NpcChat(nNpcIdx,self.tbBossInfo[i][2].."�����ǳ�");
	end;
	Msg2MSAll(MISSION_ID,"Nhi�m v� �i: ��nh b�i hai ��i th�n th� H�a V� v� L�u Quang");
	local tbPlayer = TM_GetPlayerTable();
	TM_StartTimeGuage("Di Hoa Ti�p M�c",2*60,0,1,tbPlayer);
	TM_StartTimeGuage("B�ng h� v�",90,0,2,tbPlayer);
end;
--ˢС��
function CSTAGE6:CreateOpposedNpc(tbArg)
	local nNpcCount = 0;
	local nCurStage = self.nStage;
	local tbNpc = {1,2,3,4,5,6,7};
	local nNpcIdx = 0;
	local nRand = 0;
	local nRandNpcIdx = 0;
	local szModel,szName = "","";
	local nMapX,nMapY = 0,0;
	for i=1,getn(tbNpc) do
		if GetMissionV(MV_VALUE9) == tbNpc[i] then
			tremove(tbNpc,i);
		end;
	end;
	for i=1,getn(tbNpc) do
		if GetMissionV(MV_VALUE10) == tbNpc[i] then
			tremove(tbNpc,i);
		end;
	end;
	for i=1,4 do	--�ĸ���ˢ
		nRand = random(1,getn(tbNpc));
		nRandNpcIdx = tbNpc[nRand];
		nMapX,nMapY = tPos_Rect[i][1],tPos_Rect[i][2];
		nNpcCount = tb_Npc_Info[nRandNpcIdx][3][nCurStage];
		TM_CreateFactionNpc(nMapX,nMapY,nNpcCount,nRandNpcIdx);
		tremove(tbNpc,nRand);
	end;
	if self:CheckNpcCount() == 1 then
		self:EndStage(0);	--����ʧ��
		return 0;
	end;
	local tbPlayer = TM_GetPlayerTable();
	TM_StopTimeGuage(2);
	TM_StartTimeGuage("B�ng h� v�",90,0,2,tbPlayer);
end;
--�޸�BOSSѪ��
function CSTAGE6:ModifyBossLife(tbArg)
	local nBossIdx1 = GetMissionV(MV_BOSS1);
	local nBossIdx2 = GetMissionV(MV_BOSS2);
	if tbArg[1] == 1 then
		if nBossIdx1 ~= 0 then
			if GetNpcName(nBossIdx1) == self.tbBossInfo[1][2] then
				TM_ModifyNpcLife(nBossIdx1,1);
				Msg2MSAll(MISSION_ID,self.tbBossInfo[1][2].."Sinh l�c h�i ph�c 1%");
			else
				WriteLog("[T� Quang C�c g�p l�i]: BOSS1 �i 6 g�p l�i, t�n l�"..GetNpcName(nBossIdx1));
			end;
		end;
		if nBossIdx2 ~= 0 then
			if GetNpcName(nBossIdx2) == self.tbBossInfo[2][2] then
				TM_ModifyNpcLife(nBossIdx2,-1);
				Msg2MSAll(MISSION_ID,self.tbBossInfo[2][2].."Sinh l�c gi�m 1%");	
			else
				WriteLog("[T� Quang C�c g�p l�i]: BOSS2 c�a �i 6 g�p l�i, t�n th�nh"..GetNpcName(nBossIdx1));
			end;
		end;
	else
		if nBossIdx1 ~= 0 then
			if GetNpcName(nBossIdx1) == self.tbBossInfo[1][2] then
				TM_ModifyNpcLife(nBossIdx1,-6);
				Msg2MSAll(MISSION_ID,self.tbBossInfo[1][2].."Sinh l�c gi�m 6%");
			else
				WriteLog("[T� Quang C�c g�p l�i]: BOSS1 �i 6 g�p l�i, t�n l�"..GetNpcName(nBossIdx1));
			end;
		end;
		if nBossIdx2 ~= 0 then
			if GetNpcName(nBossIdx2) == self.tbBossInfo[2][2] then
				TM_ModifyNpcLife(nBossIdx2,6);
				Msg2MSAll(MISSION_ID,self.tbBossInfo[2][2].."Sinh l�c h�i ph�c 6%");	
			else
				WriteLog("[T� Quang C�c g�p l�i]: BOSS2 c�a �i 6 g�p l�i, t�n th�nh"..GetNpcName(nBossIdx1));
			end;
		end;
		local tbPlayer = TM_GetPlayerTable();
		TM_StopTimeGuage(1);
		TM_StartTimeGuage("Di Hoa Ti�p M�c",2*60,0,1,tbPlayer);
	end;
end;
--���BOSSѪ��
function CSTAGE6:CheckBoss(tbArg)
	local nLifePercent1,nLifePercent2 = 0,0;
	local nBossIdx1,nBossIdx2 = GetMissionV(MV_BOSS1),GetMissionV(MV_BOSS2);
	gf_ShowDebugInfor("nBossIdx1:"..nBossIdx1);
	gf_ShowDebugInfor("nBossIdx2:"..nBossIdx2);
	_,nLifePercent1 = TM_GetNpcLife(nBossIdx1);
	_,nLifePercent2 = TM_GetNpcLife(nBossIdx2);
	local nPercent = abs(nLifePercent1-nLifePercent2);	--�ٷֱ�֮��
	local tbPlayer = TM_GetPlayerTable();
	local tbPercent = {1,1,2,2,3,5,10,30,30,30};
	local funLostLifePercent = function(tArg)
		local nMaxLife = GetMaxLife();
		local nLostLife = floor(nMaxLife*tArg[1]/100);
		CastState("state_lost_life_per18",nLostLife,tArg[2]*18);
	end;
	Msg2MSAll(MISSION_ID,"Ch�nh l�ch l��ng m�u c�a Boss: (ph�n tr�m)"..nPercent);
	if nPercent == 0 then
		return 0;
	end;
	if nPercent > 10 then
		nPercent = 10;
	end;
	gf_OperatePlayers(tbPlayer,funLostLifePercent,{tbPercent[nPercent],5});
end;
--BOSS�������ű�ִ�к���
function CSTAGE6:OnBossDeath(szNpcIdx)
	local nNpcIdx = tonumber(szNpcIdx);
	local nBossCount = GetMissionV(MV_BOSS_COUNT);
	if nNpcIdx == GetMissionV(MV_BOSS1) then
		SetMissionV(MV_BOSS1,0);
		Msg2MSAll(MISSION_ID,self.tbBossInfo[1][2].."�� b� ��nh b�i");
	else
		SetMissionV(MV_BOSS2,0);
		Msg2MSAll(MISSION_ID,self.tbBossInfo[2][2].."�� b� ��nh b�i");
	end;
	SetNpcLifeTime(nNpcIdx,0);
	SetMissionV(MV_BOSS_COUNT,nBossCount-1);
	if nBossCount == 1 then	--��������һ��BOSS
		self:EndStage();
		self:CheckAllStagePass();
	end;
end;
--��ʼ��tbTimerEven
CSTAGE6.tbTimerEven = 
{	--tbTimerEven�ĸ���Ԫ�ص����ݾ���ProcessTimeCheckPoint�������ĸ�����
	--	����ʱ�� ������� �����ĺ��� 				���������Ĳ���table
	[1] = {115,		20,		CSTAGE6.ModifyBossLife,		{1}},
	[2] = {120,		120,	CSTAGE6.ModifyBossLife,		{2}},
	[3] = {0,		10,		CSTAGE6.CheckBoss,			{}},	--�����BOSSѪ��
	[4] = {90,		90,		CSTAGE6.CreateOpposedNpc,	{}},
	[5] = {30*60,	0,		CSTAGE6.AllDeath,			{}},
}
