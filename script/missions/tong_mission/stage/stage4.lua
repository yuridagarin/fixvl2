--create date:2007-07-09 23:16
--author:yanjun
--describe:���ؿ�stage�ļ�����Ҫ�ǹؿ�����ز���

--MV_VALUE9��ʾҪȥ���ĵ�һ��ְҵ
--MV_VALUE10��ʾҪȥ���ĵڶ���ְҵ
Include("\\script\\missions\\tong_mission\\stage\\base_stage.lua");
CSTAGE4 = OO_Inherit(CBASE_STAGE);	--�̳л���
--=========�������������ݵĶ��������=========================================================
CSTAGE4.nStage = 4;	
CSTAGE4.tbTimerEven = {};
CSTAGE4.nMaxNpcCount = 12;
CSTAGE4.tbBossInfo = {"boss1","��a Huy�n"};
--����BOSS
function CSTAGE4:OnCreateBoss()
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
	TM_StartTimeGuage("B�ng h� v� (tr�i)",20,0,1,tbPlayer);
	TM_StartTimeGuage("B�y tr�i",60,0,2,tbPlayer);
	TM_StartTimeGuage("B�ng h� v� (ph�i)",80,0,3,tbPlayer);
	TM_StartTimeGuage("B�y ph�i",120,0,4,tbPlayer);
end;
--��ĳ�����򴴽�NPC��tbArg[1]С��0��ʾ��������򴴽�������0��ʾ���ұ�
function CSTAGE4:CreateOpposedNpc(tbArg)
	local nMapID = SubWorldIdx2ID(SubWorld);
	local nRegion = tbArg[1];
	local nMapX,nMapY = 0,0;
	local tbNpc = {1,2,3,4,5,6,7};
	local nRand,nRandNpcIdx,nNpcCount = 0,0,0;
	local nCurStage = self.nStage;
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
	for i=1,2 do
		if nRegion == LEFT_REGION then
			nMapX,nMapY = tPos_Rect[i][1],tPos_Rect[i][2];
		else
			nMapX,nMapY = tPos_Rect[i+2][1],tPos_Rect[i+2][2];
		end;
		nRand = random(1,getn(tbNpc));
		nRandNpcIdx = tbNpc[nRand];
		nNpcCount = tb_Npc_Info[nRandNpcIdx][3][nCurStage];
		TM_CreateFactionNpc(nMapX,nMapY,nNpcCount,nRandNpcIdx);
		tremove(tbNpc,nRand);
	end;
	if self:CheckNpcCount() == 1 then
		self:EndStage(0);	--����ʧ��
		return 0;
	end;
	local nBossIdx = GetMissionV(MV_BOSS1);
	local tbChat = {
				"Ha ha, �� ta cho ng��i bi�t s� l�i h�i c�a c�c �� �� ta!",
				"Ng��i ��u, mau ��n ��y ti�u di�t b�n nay cho ta!",
				"H� ph�p b�n tr�i ph�i, x�ng l�n!",
				}
	NpcChat(nBossIdx,tbChat[random(1,getn(tbChat))]);
	local tbPlayer = TM_GetPlayerTable();
	if nRegion == LEFT_REGION then
		TM_StopTimeGuage(1,tbPlayer);
		TM_StartTimeGuage("B�ng h� v� (tr�i)",120,0,1,tbPlayer);
	else
		TM_StopTimeGuage(3,tbPlayer);
		TM_StartTimeGuage("B�ng h� v� (ph�i)",120,0,3,tbPlayer);
	end;
end;
--����ĳ�����������м�����tbArg[1]С��0��ʾ��������򴴽�������0��ʾ���ұ�
--tbArg[2]��ʾ���ҳ���ʱ��
function CSTAGE4:ConfusionRegion(tbArg)
	local funConfuse = function(tbArg)
		local nPos = %self:GetPlayerSection();
		local nRegion = tbArg[1];
		local nDuration = tbArg[2];
		if (nPos == nRegion and nPos ~= MID_REGION)then
			CastState("state_confusion",1,nDuration*18);	--����n��
		elseif nPos == MID_REGION then
			ModifyLife(0);	--������м����������
		end;
		gf_ShowDebugInfor("Th�c hi�n h�m s� h�n lo�n!!!!  nPos:"..nPos..",nRegion:"..nRegion);
	end;
	local tbNormalPlayer = TM_GetPlayerTable();
	gf_ShowDebugInfor("TM_GetPlayerTable h�m s� tr� v� table l�n nh�:"..getn(tbNormalPlayer));
	gf_OperatePlayers(tbNormalPlayer,funConfuse,tbArg);
	local nBossIdx = GetMissionV(MV_BOSS1);
	local tbChat = {
				"Cho ng��i bi�t th� n�o g�i l� v� c�ng, xem chi�u: Thi�n H� ��i Lo�n!!!!",
				"Ta mu�n chi�n th�ng trong s� h�n lo�n, h�y �� chi�u!!!!",
				"H�y xem s� l�i h�i c�a ta ��y!!!!",
				}
	NpcChat(nBossIdx,tbChat[random(1,getn(tbChat))]);
	TM_DoSpecialEffect(1569,3175,953,"Ph�o hoa ch�t ch�c",10);	--MapX,MapY,EffectID,EffectName
	TM_DoSpecialEffect(1582,3163,953,"Ph�o hoa ch�t ch�c",10);
	TM_DoSpecialEffect(1555,3191,953,"Ph�o hoa ch�t ch�c",10);
	if tbArg[1] == LEFT_REGION then
		TM_DoSpecialEffect(1548,3156,936,"Ph�o hoa h�n lo�n",10);
		TM_DoSpecialEffect(1559,3140,936,"Ph�o hoa h�n lo�n",10);
		TM_DoSpecialEffect(1534,3168,936,"Ph�o hoa h�n lo�n",10);
	else
		TM_DoSpecialEffect(1591,3202,936,"Ph�o hoa h�n lo�n",10);
		TM_DoSpecialEffect(1601,3191,936,"Ph�o hoa h�n lo�n",10);
		TM_DoSpecialEffect(1579,3214,936,"Ph�o hoa h�n lo�n",10);
	end;
	local nRegion = tbArg[1];
	local tbPlayer = TM_GetPlayerTable();
	if nRegion == LEFT_REGION then
		TM_StopTimeGuage(2,tbPlayer);
		TM_StartTimeGuage("B�y tr�i",120,0,2,tbPlayer);
	else
		TM_StopTimeGuage(4,tbPlayer);
		TM_StartTimeGuage("B�y ph�i",120,0,4,tbPlayer);
	end;
end;
--BOSS�������ű�ִ�к���
function CSTAGE4:OnBossDeath(szNpcIdx)
	local nNpcIdx = tonumber(szNpcIdx);
	SetNpcLifeTime(nNpcIdx,0);
	self:EndStage();
	self:CheckAllStagePass();
end;
--��ʼ��tbTimerEven
CSTAGE4.tbTimerEven = 
{	--tbTimerEven�ĸ���Ԫ�ص����ݾ���ProcessTimeCheckPoint�������ĸ�����
	--	����ʱ�� ������� 	�����ĺ��� 			���������Ĳ���table
	[1] = {20,		120,	CSTAGE4.CreateOpposedNpc,	{LEFT_REGION}},	--�������ˢNPC
	[2] = {80,		120,	CSTAGE4.CreateOpposedNpc,	{RIGHT_REGION}},	--�ұ�����ˢNPC
	[3] = {60,		120,	CSTAGE4.ConfusionRegion,	{LEFT_REGION,20}},	--��߻���20��
	[4] = {120,		120,	CSTAGE4.ConfusionRegion,	{RIGHT_REGION,20}},	--�ұ߻���20��
	[5] = {30*60,	0,		CSTAGE4.AllDeath,			{}},
}
