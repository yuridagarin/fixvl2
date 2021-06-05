--create date:2007-07-13 16:15
--author:yanjun
--describe:���ؿ�stage�ļ�����Ҫ�ǹؿ�����ز���


--MV_VALUE9��ʾҪȥ���ĵ�һ��ְҵ
--MV_VALUE10��ʾҪȥ���ĵڶ���ְҵ
Include("\\script\\missions\\tong_mission\\stage\\base_stage.lua");
CSTAGE1 = OO_Inherit(CBASE_STAGE);	--�̳л���
--=========�������������ݵĶ��������=========================================================
CSTAGE1.nStage = 1;	
CSTAGE1.tbTimerEven = {};
CSTAGE1.nMaxNpcCount = 12;
CSTAGE1.tbBossInfo = {"boss2","Li Y�n"};
--����BOSS
function CSTAGE1:OnCreateBoss()
	local nMapID = SubWorldIdx2ID(SubWorld);
	local szModel = self.tbBossInfo[1];
	local szName = self.tbBossInfo[2];
	local nPosX = tPos_Boss[1][1];
	local nPosY = tPos_Boss[1][2];
	local nNpcIdx = CreateNpc(szModel,szName,nMapID,nPosX,nPosY);
	SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_boss.lua");
	SetMissionV(MV_BOSS1,nNpcIdx);
	Msg2MSAll(MISSION_ID,"Nhi�m v� c�a �i: ��nh b�i "..szName);
	local tbPlayer = TM_GetPlayerTable();
	TM_StartTimeGuage("B�ng h� v�",60,0,1,tbPlayer);
	TM_StartTimeGuage("Li Ph� N� T��ng",30,0,2,tbPlayer);
end;
--���ĸ�ˢ�ֵ�ˢ�������Ĺ�
function CSTAGE1:CreateOpposedNpc(tbArg)	
	local nBossIdx = GetMissionV(MV_BOSS1);
	local nCurStage = self.nStage;
	local nMapID = SubWorldIdx2ID(SubWorld);
	local tbNpc = {1,2,3,4,5,6,7};
	local nNpcIdx = 0;
	local nRand = 0;
	local nRandNpcIdx = 0;
	local szModel,szName = "","";
	local nNpcCount = 0;
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
		nNpcCount = tb_Npc_Info[nRandNpcIdx][3][nCurStage];
		nMapX,nMapY = tPos_Rect[i][1],tPos_Rect[i][2];
		TM_CreateFactionNpc(nMapX,nMapY,nNpcCount,nRandNpcIdx);
		tremove(tbNpc,nRand);
	end;
	if self:CheckNpcCount() == 1 then
		self:EndStage(0);	--����ʧ��
		return 0;
	end;
	local tbChat = {
				"Ha ha, �� ta cho ng��i bi�t s� l�i h�i c�a c�c �� �� ta!",
				"Ng��i ��u, mau ��n ��y ti�u di�t b�n nay cho ta!",
				"T� ��i h� v� ��ng Nam T�y B�c, x�ng l�n n�o c�c anh em!",
				}
	NpcChat(nBossIdx,tbChat[random(1,getn(tbChat))]);
	local tbPlayer = TM_GetPlayerTable();
	TM_StopTimeGuage(1);
	TM_StartTimeGuage("B�ng h� v�",90,0,1,tbPlayer);
end;
--BOSS��С��
function CSTAGE1:CreateBossChild(tbArg)
	local nBossIdx = GetMissionV(MV_BOSS1);
	if GetNpcName(nBossIdx) ~= self.tbBossInfo[2] then
		self:EndStage(0);	--����ʧ��
		WriteLog("[V��t �i bang h�i c� l�i]: CreateOpposedNpc c�a �i 1 c� h�m s� t�n BOSS kh�ng ph�i l� Li Y�n, l�"..tostring(GetNpcName(nBossIdx)));
		return 0;
	end;
	PlayerIndex = 1;
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nBossIdx);
	PlayerIndex = nil;
	local nNpcIdx = 0;
	for i=1,tbArg[1] do
		nNpcIdx = CreateNpc("Ti�u qu�i �i 2","Li Ph� N� V� T��ng",nMapID,nMapX,nMapY,-1,1,1,100);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_npc.lua");
		AddGroupUnit(NPC_GROUP_ID,nNpcIdx);
	end;
	local tbChat = {
				"Li Ph� N� V� T��ng mau hi�n th�n!!!",
				"Ng��i ��u, mau ��n ��y ti�u di�t b�n nay cho ta!",
				"�� cho c�c ng��i bi�t th�c l�c c�a �� �� ta!!",
				}
	NpcChat(nBossIdx,tbChat[random(1,getn(tbChat))]);
	local tbPlayer = TM_GetPlayerTable();
	TM_StopTimeGuage(2);
	TM_StartTimeGuage("Li Ph� N� T��ng",60,0,2,tbPlayer);
end;
--BOSS�������ű�ִ�к���
function CSTAGE1:OnBossDeath(szNpcIdx)
	local nNpcIdx = tonumber(szNpcIdx);
	SetNpcLifeTime(nNpcIdx,0);
	self:EndStage();
	self:CheckAllStagePass();
end;

function CSTAGE1:LostLifePerMin()
	local tbPlayer = TM_GetPlayerTable();
	local funLostLife = function(tArg)
		CastState("state_lost_life_per18",5,60*18);
	end;
	gf_OperatePlayers(tbPlayer,funLostLife,{});
end;
--��ʼ��tbTimerEven
CSTAGE1.tbTimerEven = 
{	--tbTimerEven�ĸ���Ԫ�ص����ݾ���ProcessTimeCheckPoint�������ĸ�����
	--	����ʱ�� ������� �����ĺ��� 			���������Ĳ���table
	[1] = {60,		90,	CSTAGE1.CreateOpposedNpc,	{}},
	[2] = {30,		60,	CSTAGE1.CreateBossChild,	{6}},	
	[3] = {30*60,	0,	CSTAGE1.AllDeath,			{}},
	[4] = {0,		60, CSTAGE1.LostLifePerMin,		{}},
}
