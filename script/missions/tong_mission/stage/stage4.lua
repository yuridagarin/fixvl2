--create date:2007-07-09 23:16
--author:yanjun
--describe:帮会关卡stage文件，主要是关卡的相关操作

--MV_VALUE9表示要去掉的第一种职业
--MV_VALUE10表示要去掉的第二种职业
Include("\\script\\missions\\tong_mission\\stage\\base_stage.lua");
CSTAGE4 = OO_Inherit(CBASE_STAGE);	--继承基类
--=========下面是子类内容的定义和重载=========================================================
CSTAGE4.nStage = 4;	
CSTAGE4.tbTimerEven = {};
CSTAGE4.nMaxNpcCount = 12;
CSTAGE4.tbBossInfo = {"boss1","мa Huy襫"};
--创建BOSS
function CSTAGE4:OnCreateBoss()
	local nMapID = SubWorldIdx2ID(SubWorld);
	local szModel = self.tbBossInfo[1];
	local szName = self.tbBossInfo[2];
	local nPosX = tPos_Boss[1][1];
	local nPosY = tPos_Boss[1][2];
	local nNpcIdx = CreateNpc(szModel,szName,nMapID,nPosX,nPosY);
	SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_boss.lua");
	SetMissionV(MV_BOSS1,nNpcIdx);
	Msg2MSAll(MISSION_ID,"Nhi謒 v? c馻 秈: Цnh b筰 "..szName);
	local tbPlayer = TM_GetPlayerTable();
	TM_StartTimeGuage("B鉵g h? v? (tr竔)",20,0,1,tbPlayer);
	TM_StartTimeGuage("B蓎 tr竔",60,0,2,tbPlayer);
	TM_StartTimeGuage("B鉵g h? v? (ph秈)",80,0,3,tbPlayer);
	TM_StartTimeGuage("B蓎 ph秈",120,0,4,tbPlayer);
end;
--在某个区域创建NPC，tbArg[1]小于0表示在左边区域创建，大于0表示在右边
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
		self:EndStage(0);	--闯关失败
		return 0;
	end;
	local nBossIdx = GetMissionV(MV_BOSS1);
	local tbChat = {
				"Ha ha,  ta cho ngi bi誸 s? l頸 h筰 c馻 c竎   ta!",
				"Ngi u, mau n y ti猽 di謙 b鋘 nay cho ta!",
				"H? ph竝 b猲 tr竔 ph秈, x玭g l猲!",
				}
	NpcChat(nBossIdx,tbChat[random(1,getn(tbChat))]);
	local tbPlayer = TM_GetPlayerTable();
	if nRegion == LEFT_REGION then
		TM_StopTimeGuage(1,tbPlayer);
		TM_StartTimeGuage("B鉵g h? v? (tr竔)",120,0,1,tbPlayer);
	else
		TM_StopTimeGuage(3,tbPlayer);
		TM_StartTimeGuage("B鉵g h? v? (ph秈)",120,0,3,tbPlayer);
	end;
end;
--混乱某个区域，死亡中间区域，tbArg[1]小于0表示在左边区域创建，大于0表示在右边
--tbArg[2]表示混乱持续时间
function CSTAGE4:ConfusionRegion(tbArg)
	local funConfuse = function(tbArg)
		local nPos = %self:GetPlayerSection();
		local nRegion = tbArg[1];
		local nDuration = tbArg[2];
		if (nPos == nRegion and nPos ~= MID_REGION)then
			CastState("state_confusion",1,nDuration*18);	--混乱n秒
		elseif nPos == MID_REGION then
			ModifyLife(0);	--如果在中间就立刻死亡
		end;
		gf_ShowDebugInfor("Th鵦 hi謓 h祄 s? h鏽 lo筺!!!!  nPos:"..nPos..",nRegion:"..nRegion);
	end;
	local tbNormalPlayer = TM_GetPlayerTable();
	gf_ShowDebugInfor("TM_GetPlayerTable h祄 s? tr? v? table l韓 nh?:"..getn(tbNormalPlayer));
	gf_OperatePlayers(tbNormalPlayer,funConfuse,tbArg);
	local nBossIdx = GetMissionV(MV_BOSS1);
	local tbChat = {
				"Cho ngi bi誸 th? n祇 g鋓 l? v? c玭g, xem chi猽: Thi猲 H? Чi Lo筺!!!!",
				"Ta mu鑞 chi課 th緉g trong s? h鏽 lo筺, h穣  chi猽!!!!",
				"H穣 xem s? l頸 h筰 c馻 ta y!!!!",
				}
	NpcChat(nBossIdx,tbChat[random(1,getn(tbChat))]);
	TM_DoSpecialEffect(1569,3175,953,"Ph竜 hoa ch誸 ch鉩",10);	--MapX,MapY,EffectID,EffectName
	TM_DoSpecialEffect(1582,3163,953,"Ph竜 hoa ch誸 ch鉩",10);
	TM_DoSpecialEffect(1555,3191,953,"Ph竜 hoa ch誸 ch鉩",10);
	if tbArg[1] == LEFT_REGION then
		TM_DoSpecialEffect(1548,3156,936,"Ph竜 hoa h鏽 lo筺",10);
		TM_DoSpecialEffect(1559,3140,936,"Ph竜 hoa h鏽 lo筺",10);
		TM_DoSpecialEffect(1534,3168,936,"Ph竜 hoa h鏽 lo筺",10);
	else
		TM_DoSpecialEffect(1591,3202,936,"Ph竜 hoa h鏽 lo筺",10);
		TM_DoSpecialEffect(1601,3191,936,"Ph竜 hoa h鏽 lo筺",10);
		TM_DoSpecialEffect(1579,3214,936,"Ph竜 hoa h鏽 lo筺",10);
	end;
	local nRegion = tbArg[1];
	local tbPlayer = TM_GetPlayerTable();
	if nRegion == LEFT_REGION then
		TM_StopTimeGuage(2,tbPlayer);
		TM_StartTimeGuage("B蓎 tr竔",120,0,2,tbPlayer);
	else
		TM_StopTimeGuage(4,tbPlayer);
		TM_StartTimeGuage("B蓎 ph秈",120,0,4,tbPlayer);
	end;
end;
--BOSS的死亡脚本执行函数
function CSTAGE4:OnBossDeath(szNpcIdx)
	local nNpcIdx = tonumber(szNpcIdx);
	SetNpcLifeTime(nNpcIdx,0);
	self:EndStage();
	self:CheckAllStagePass();
end;
--初始化tbTimerEven
CSTAGE4.tbTimerEven = 
{	--tbTimerEven的各个元素的内容就是ProcessTimeCheckPoint函数的四个参数
	--	触发时间 触发间隔 	触发的函数 			触发函数的参数table
	[1] = {20,		120,	CSTAGE4.CreateOpposedNpc,	{LEFT_REGION}},	--左边区域刷NPC
	[2] = {80,		120,	CSTAGE4.CreateOpposedNpc,	{RIGHT_REGION}},	--右边区域刷NPC
	[3] = {60,		120,	CSTAGE4.ConfusionRegion,	{LEFT_REGION,20}},	--左边混乱20秒
	[4] = {120,		120,	CSTAGE4.ConfusionRegion,	{RIGHT_REGION,20}},	--右边混乱20秒
	[5] = {30*60,	0,		CSTAGE4.AllDeath,			{}},
}
