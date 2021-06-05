--create date:2007-07-15 10:09
--author:yanjun
--describe:���ؿ�stage�ļ�����Ҫ�ǹؿ�����ز���


--MV_VALUE1��ʾBOSS����������
--MV_VALUE9��ʾҪȥ���ĵ�һ��ְҵ
--MV_VALUE10��ʾҪȥ���ĵڶ���ְҵ
Include("\\script\\missions\\tong_mission\\stage\\base_stage.lua");
CSTAGE2 = OO_Inherit(CBASE_STAGE);	--�̳л���
--=========�������������ݵĶ��������=========================================================
CSTAGE2.nStage = 2;	
CSTAGE2.tbTimerEven = {};
CSTAGE2.nMaxDeath = 4;	--��4�����������
CSTAGE2.nMaxNpcCount = 12;
CSTAGE2.tbBossInfo = {"boss3","B� Ki�u"};
--����BOSS
function CSTAGE2:OnCreateBoss()
	self:CreateBossByLevel(1);
	local szName = self.tbBossInfo[2];
	Msg2MSAll(MISSION_ID,"Nhi�m v� c�a �i: ��nh b�i "..szName);
	local tbPlayer = TM_GetPlayerTable();
	TM_StartTimeGuage("B�ng h� v�",45,0,1,tbPlayer);
end;
--���ĸ�ˢ�ֵ�ˢ�������Ĺ�
function CSTAGE2:CreateOpposedNpc(tbArg)
	local nBossIdx = GetMissionV(MV_BOSS1);
	local nCurStage = self.nStage;
	local nMapID = SubWorldIdx2ID(SubWorld);
	local tbNpc = {1,2,3,4,5,6,7};
	local nNpcIdx = 0;
	local nRand = 0;
	local nRandNpcIdx = 0;
	local szModel,szName = "","";
	local nNpcCount = 0;
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
				"H�i c�c anh em, x�ng l�n n�o!",
				"Ng��i ��ng l�c m�nh, �� b�p ch�ng cho ta!",
				"C�c ng��i h� c�c �� t� c�a ta r�i n�i chuy�n sau nh�!",
				}
	if GetNpcName(nBossIdx) == self.tbBossInfo[2] then
		NpcChat(nBossIdx,tbChat[random(1,getn(tbChat))]);
	end;
	local tbPlayer = TM_GetPlayerTable();
	TM_StopTimeGuage(1);
	TM_StartTimeGuage("B�ng h� v�",90,0,1,tbPlayer);
end;
--BOSS��С��
function CSTAGE2:CreateBossChild(tbArg)
	local nBossIdx = GetMissionV(MV_BOSS1);
	if GetNpcName(nBossIdx) ~= self.tbBossInfo[2] then
		self:EndStage(0);	--����ʧ��
		WriteLog("[V��t �i bang h�i c� l�i]: CreateOpposedNpc c�a �i 2 c� h�m s� t�n BOSS kh�ng ph�i l� B� Ki�u, l�"..tostring(GetNpcName(nBossIdx)));
		return 0;
	end;
	PlayerIndex = 1;
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nBossIdx);
	PlayerIndex = nil;
	local nNpcIdx = 0;
	for i=1,tbArg[1] do
		nNpcIdx = CreateNpc("Ti�u qu�i �i 3","C�m v� binh",nMapID,nMapX,nMapY,-1,1,1,100);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_npc.lua");
	end;
end;
--BOSS�������ű�ִ�к���
function CSTAGE2:OnBossDeath(szNpcIdx)
	local nNpcIdx = tonumber(szNpcIdx);
	local nDeathTimes = GetMissionV(MV_VALUE1);
	if nDeathTimes >= self.nMaxDeath-1 then			
		self:EndStage();		
		self:CheckAllStagePass();
	else
		self:SetTimerTrigger(10);
		SetMissionV(MV_VALUE1,nDeathTimes+1);
		self:CreateBossChild({nDeathTimes+2});
		SetMissionV(MV_BOSS1,0);
	end;
	SetNpcLifeTime(nNpcIdx,2);
end;
--���ݵȼ�����BOSS
function CSTAGE2:CreateBossByLevel(nLevel)
	local nMapID = SubWorldIdx2ID(SubWorld);
	local szModel = self.tbBossInfo[1];
	local szName = self.tbBossInfo[2];
	local nPosX = tPos_Boss[1][1];
	local nPosY = tPos_Boss[1][2];
	local nNpcIdx = CreateNpc(szModel,szName,nMapID,nPosX,nPosY);
	SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_boss.lua");
	SetMissionV(MV_BOSS1,nNpcIdx);
end;
--����ʱ�䴥����ִ�к���
function CSTAGE2:OnTimerTriggerEven()
	local nDeathTimes = GetMissionV(MV_VALUE1);
	self:CreateBossByLevel(nDeathTimes+1);
	local nBossIdx = GetMissionV(MV_BOSS1);
	NpcChat(nBossIdx,"��ng c� t��ng nh� th� n�y l� d� h� ���c ta, ng��i ��u qu�t s�ch l� n�y cho ta!");
end;
--��ʼ��tbTimerEven
CSTAGE2.tbTimerEven = 
{	--tbTimerEven�ĸ���Ԫ�ص����ݾ���ProcessTimeCheckPoint�������ĸ�����
	--	����ʱ�� ������� �����ĺ��� 			���������Ĳ���table
	[1] = {45,		90,	CSTAGE2.CreateOpposedNpc,	{}},
	[2] = {30*60,	0,	CSTAGE2.AllDeath,			{}},
}
