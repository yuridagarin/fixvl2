--create date:2007-07-15 10:09
--author:yanjun
--describe:帮会关卡stage文件，主要是关卡的相关操作


--MV_VALUE1表示BOSS的死亡次数
--MV_VALUE9表示要去掉的第一种职业
--MV_VALUE10表示要去掉的第二种职业
Include("\\script\\missions\\tong_mission\\stage\\base_stage.lua");
CSTAGE2 = OO_Inherit(CBASE_STAGE);	--继承基类
--=========下面是子类内容的定义和重载=========================================================
CSTAGE2.nStage = 2;	
CSTAGE2.tbTimerEven = {};
CSTAGE2.nMaxDeath = 4;	--第4次死亡后过关
CSTAGE2.nMaxNpcCount = 12;
CSTAGE2.tbBossInfo = {"boss3","B? Ki襲"};
--创建BOSS
function CSTAGE2:OnCreateBoss()
	self:CreateBossByLevel(1);
	local szName = self.tbBossInfo[2];
	Msg2MSAll(MISSION_ID,"Nhi謒 v? c馻 秈: Цnh b筰 "..szName);
	local tbPlayer = TM_GetPlayerTable();
	TM_StartTimeGuage("B鉵g h? v?",45,0,1,tbPlayer);
end;
--在四个刷怪点刷随机种类的怪
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
	for i=1,4 do	--四个点刷
		nRand = random(1,getn(tbNpc));
		nRandNpcIdx = tbNpc[nRand];
		nNpcCount = tb_Npc_Info[nRandNpcIdx][3][nCurStage];
		nMapX,nMapY = tPos_Rect[i][1],tPos_Rect[i][2];
		TM_CreateFactionNpc(nMapX,nMapY,nNpcCount,nRandNpcIdx);
		tremove(tbNpc,nRand);
	end;
	if self:CheckNpcCount() == 1 then
		self:EndStage(0);	--闯关失败
		return 0;
	end;
	local tbChat = {
				"H靑 c竎 anh em, x玭g l猲 n祇!",
				"Ngi ng l鵦 m筺h,  b裵 ch髇g cho ta!",
				"C竎 ngi h? c竎  t? c馻 ta r錳 n鉯 chuy謓 sau nh?!",
				}
	if GetNpcName(nBossIdx) == self.tbBossInfo[2] then
		NpcChat(nBossIdx,tbChat[random(1,getn(tbChat))]);
	end;
	local tbPlayer = TM_GetPlayerTable();
	TM_StopTimeGuage(1);
	TM_StartTimeGuage("B鉵g h? v?",90,0,1,tbPlayer);
end;
--BOSS生小孩
function CSTAGE2:CreateBossChild(tbArg)
	local nBossIdx = GetMissionV(MV_BOSS1);
	if GetNpcName(nBossIdx) ~= self.tbBossInfo[2] then
		self:EndStage(0);	--闯关失败
		WriteLog("[Vt 秈 bang h閕 c? l鏸]: CreateOpposedNpc c馻 秈 2 c? h祄 s? t猲 BOSS kh玭g ph秈 l? B? Ki襲, l?"..tostring(GetNpcName(nBossIdx)));
		return 0;
	end;
	PlayerIndex = 1;
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nBossIdx);
	PlayerIndex = nil;
	local nNpcIdx = 0;
	for i=1,tbArg[1] do
		nNpcIdx = CreateNpc("Ti觰 qu竔 秈 3","C蕀 v? binh",nMapID,nMapX,nMapY,-1,1,1,100);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_npc.lua");
	end;
end;
--BOSS的死亡脚本执行函数
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
--根据等级创建BOSS
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
--辅助时间触发器执行函数
function CSTAGE2:OnTimerTriggerEven()
	local nDeathTimes = GetMissionV(MV_VALUE1);
	self:CreateBossByLevel(nDeathTimes+1);
	local nBossIdx = GetMissionV(MV_BOSS1);
	NpcChat(nBossIdx,"ng c? tng nh? th? n祔 l? d? h? 頲 ta, ngi u qu衪 s筩h l? n祔 cho ta!");
end;
--初始化tbTimerEven
CSTAGE2.tbTimerEven = 
{	--tbTimerEven的各个元素的内容就是ProcessTimeCheckPoint函数的四个参数
	--	触发时间 触发间隔 触发的函数 			触发函数的参数table
	[1] = {45,		90,	CSTAGE2.CreateOpposedNpc,	{}},
	[2] = {30*60,	0,	CSTAGE2.AllDeath,			{}},
}
