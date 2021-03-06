--Create Date:2006年最后一天
--Describe:０７年春节雪仗Mission头文件
--Author:yanjun
Include("\\script\\online\\春节活动\\newyear_head.lua")	
Include("\\script\\lib\\globalfunctions.lua");

DEBUG_VERSION = 1;
--===============================以下是系统相关常量=========================================
FRAME_PER_SECOND = 18;								--游戏运行速度：每秒１８帧
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--每分钟游戏帧数

GLB_SNOWWAR_TIME = 4580;								--服务器全局变量，记录当前雪仗场地的信息
--===============================以下是Mission相关常量======================================
MISSION_ID = 31;									--Mission的ID

TIMER_ID = 59;										--Mission计时器的ID
TIMER_INTERVAL = 30*FRAME_PER_SECOND;				--计时器触发的时间间隔，单位秒
TIMER_COUNT = (30*FRAME_PER_MIN/TIMER_INTERVAL)-1;	--总的计时次数，３０分钟
TIMER_WAITOUT_COUNT = (20*FRAME_PER_MIN/TIMER_INTERVAL)-1;--领取奖励时间，２０分针

MV_FIELD_STATE = 1;									--记录雪仗场地的状态
MV_TIMER_LOOP = 2;									--记录计时器的

MS_STATE_PEACE = 0;									--场地空闲
MS_STATE_READY = 1;									--准备阶段
MS_STATE_FIGHT = 2;									--开战阶段
MS_STATE_COMPLETE = 3;								--等待结束阶段
--===============================以下是玩家任务变量=========================================
PT_STATUS = 1715;									--特殊任务变量，当它的值为２时，玩家不能任何装备
PT_POINT = 2380;									--个人积分
PT_SIGNUP_TIME = 2381;								--参加某场雪仗的信息
PT_KILL_COUNT = 2382;								--杀死玩家次数	
PT_DEATH_COUNT = 2383;								--被杀次数0
--===============================以下是其它常量=============================================
tMAP_CITY_FIELD =									--城市与雪仗地图的对应关系
{	
	{100,963,"Tuy襫 Ch﹗"},	--泉州
	{200,962,"Bi謓 Kinh"},	--汴京
	{300,961,"Th祅h Й"},	--成都
}

tBORN_POS = 										--场地里面的重生点
{
	{1859,3230},
	{1664,3654},
	{1664,3229},
	{1854,3654}
}

tEXIT_POS = 
{
	{100,1365,2932},	--泉州
	{200,1409,3048},	--汴京
	{300,1820,3573},	--成都
}

LOG_ID = 203;										--登陆触发器ID
LOG_CUSTOM_ID = 3017;								--登陆触发器自定义编号

MAX_PLAYER = 100;									--最大人数
BASE_POINT = 10;									--原始分
LIMIT_POINT = 50;									--积分上限
--===============================以下是公共函数=============================================
--创建相关的NPC
function SW_CreateSnowWarNpc()
	local nCityMapID,nFieldID,nIndex = SW_GetMapIDFromSubWorld(SubWorld);
	local npcIndex = CreateNpc("Giang h? h祇 ki謙","Xa phu_n衜 tuy誸",nFieldID,1665,3652)
	SetNpcScript(npcIndex,"\\script\\online\\春节活动\\成都雪仗传送人out.lua")
	npcIndex = CreateNpc("Giang h? h祇 ki謙","Xa phu_n衜 tuy誸",nFieldID,1665,3224)
	SetNpcScript(npcIndex,"\\script\\online\\春节活动\\成都雪仗传送人out.lua")
	npcIndex = CreateNpc("Giang h? h祇 ki謙","Xa phu_n衜 tuy誸",nFieldID,1857,3226)
	SetNpcScript(npcIndex,"\\script\\online\\春节活动\\成都雪仗传送人out.lua")
	npcIndex = CreateNpc("Giang h? h祇 ki謙","Xa phu_n衜 tuy誸",nFieldID,1856,3652)
	SetNpcScript(npcIndex,"\\script\\online\\春节活动\\成都雪仗传送人out.lua")	
end;
--设置玩家的一些状态
function SW_SetPlayerState()
	SW_NewSnowWarClear();
	AddItem(2,3,216,50)
	Msg2Player("B筺 nh薾 頲 50 n Ti觰 Tuy誸 C莡.")
	local nBornPos = random(1,getn(tBORN_POS))
	local nMapID = GetWorldPos();
	local nSnowWarMapID = SW_GetFieldIDFromMapID(nMapID);
	SetTempRevPos(nSnowWarMapID,tBORN_POS[nBornPos][1]*32,tBORN_POS[nBornPos][2]*32)	--随机重生点
	SetDeathScript("\\script\\online\\春节活动\\playerdeath.lua")
	SetDeathPunish(0)
	SetFightState(0)
	SetPKFlag(2,1)
	ForbidChangePK(1);	--禁止改变PK状态
	UseScrollEnable(0)
	LeaveTeam();	--离开队伍
	SetLogoutRV(1);	--设置登陆点为城市重生点
	ForbitTrade(1);	--禁止交易
	StallEnable(0);	--禁止摆摊(下线后会被清掉)
	CreateTrigger(3,LOG_ID,LOG_CUSTOM_ID);
	for SkillID=843,851 do
		LearnSkill(SkillID)	--学会打雪仗技能
	end
	Msg2Player("B筺  h鋍 頲 t蕋 c? c竎 k? n╪g s? d鬾g tuy誸 c莡, nh蕄 chu閠 ph秈 v祇 bi觰 tng k? n╪g  ch鋘 k? thu藅 tng 鴑g.");
	Say("B筺  h鋍 頲 t蕋 c? c竎 k? n╪g s? d鬾g tuy誸 c莡, nh蕄 chu閠 ph秈 v祇 bi觰 tng k? n╪g  ch鋘 k? thu藅 tng 鴑g.",0);
	SetTask(PT_SIGNUP_TIME,GetGlbValue(GLB_SNOWWAR_TIME));
	SetLRSkill(843,0);
	SetTask(PT_STATUS,2);
end;
--恢复玩家的一些状态
function SW_RestorePlayerState()
	SetTempRevPos(0,0,0);
	SetDeathScript("");
	SetDeathPunish(1);
	SetFightState(0);
	ForbidChangePK(0);	--允许改变PK状态
	SetPKFlag(0,0);
	UseScrollEnable(1);
	SetLogoutRV(0);
	ForbitTrade(0);
	InteractiveEnable(1);
	StallEnable(1);
	RemoveTrigger(GetTrigger(LOG_CUSTOM_ID));
	for SkillID=843,851 do
		if HaveLearnedSkill(SkillID) == 1 then
			RemoveSkill(SkillID)	--忘记打雪仗技能
		end;
	end
	SetTask(PT_STATUS,0);
	for i=216,221 do	--删除雪球
		local nItemCount = BigGetItemCount(2,3,i);
		if nItemCount > 0 then
			BigDelItem(2,3,i,nItemCount)	
		end;
	end;
end;
--由地图ID获得目标雪仗地图的ID
function SW_GetFieldIDFromMapID(nMapID)
	for i=1,getn(tMAP_CITY_FIELD) do
		if tMAP_CITY_FIELD[i][1] == nMapID then
			return tMAP_CITY_FIELD[i][2]
		end;
	end;
	return 0;
end;
--由雪仗地图索引获得相应的城市地图ID和雪仗地图ID以及对应在表里的索引
--这里可以使用SubWorldIdx2ID指令直接从地图索引（idx）获取地图ID
function SW_GetMapIDFromSubWorld(nFieldSubWorld)
	for i=1,getn(tMAP_CITY_FIELD) do
		if SubWorldID2Idx(tMAP_CITY_FIELD[i][2]) == nFieldSubWorld then
			return tMAP_CITY_FIELD[i][1],tMAP_CITY_FIELD[i][2],i;
		end;
	end;
	return 0,0,0;
end;
--雪仗初始化时要做的一些操作
function SW_InitSnowWar()
	SetGlbValue(GLB_SNOWWAR_TIME,tonumber(date("%y%m%d%H")));
	SW_CreateSnowWarNpc();
	RunMission(MISSION_ID);
	WriteLog("[n衜 tuy誸n╩ 2007]: Ho箃 ng n衜 tuy誸  k誸 th骳, ID n衜 tuy誸"..GetGlbValue(GLB_SNOWWAR_TIME));
end;
--雪仗开始时Mission要做的一些操作
function SW_RunSnowWar()
	gf_ShowDebugInfor("MISSION_ID:"..MISSION_ID.." TIMER_ID:"..TIMER_ID.." TIMER_INTERVAL:"..TIMER_INTERVAL);
	StartMissionTimer(MISSION_ID,TIMER_ID,TIMER_INTERVAL);
	SetMissionV(MV_TIMER_LOOP,TIMER_COUNT);
	SetMissionV(MV_FIELD_STATE,MS_STATE_FIGHT);	--开战状态
end;
--雪仗结束时Mission要做的一些操作
function SW_EndSnowWar()
	local nCityMapID,nFieldID,nIndex = SW_GetMapIDFromSubWorld(SubWorld);
	StopMissionTimer(MISSION_ID,TIMER_ID);
	ClearMapNpc(nFieldID);
	Msg2SubWorld(tMAP_CITY_FIELD[nIndex][3].." n衜 tuy誸  k誸 th骳.");
	SW_DelAllMSPlayer();
	SetMissionV(MV_FIELD_STATE,MS_STATE_PEACE);
	WriteLog("[n衜 tuy誸n╩ 2007]: Ho箃 ng n衜 tuy誸  k誸 th骳, ID n衜 tuy誸"..GetGlbValue(GLB_SNOWWAR_TIME));
end;
--玩家离开雪仗
function SW_LeaveSnowWar()
	local nCityMapID,nFieldID,nIndex = SW_GetMapIDFromSubWorld(SubWorld);
	Msg2MSAll(MISSION_ID,GetName().."R阨 kh醝 khu n衜 tuy誸")
	SW_RestorePlayerState();
	NewWorld(tEXIT_POS[nIndex][1],tEXIT_POS[nIndex][2],tEXIT_POS[nIndex][3])
end;
--玩家加入雪仗
function SW_JoinSnowWar()
	local nRandPos = random(1,getn(tBORN_POS));
	local nMapID = GetWorldPos();
	local nFieldID = SW_GetFieldIDFromMapID(nMapID);
	CleanInteractive();
	SW_SetPlayerState();
	if NewWorld(nFieldID,tBORN_POS[nRandPos][1],tBORN_POS[nRandPos][2]) == 1 then
		RemvoeTempEffect()
		Msg2MSAll(MISSION_ID,GetName().."V祇 khu n衜 tuy誸")
		InteractiveEnable(0);	--关闭交互	必须在NewWorld之后执行才有效
		AddMSPlayer(MISSION_ID,0);
	else
		WriteLog("[n衜 tuy誸]:"..GetName().."V祇 chi課 a NewWorld th蕋 b筰!!!");
	end;
end;
--删除所有在雪仗场地里面的玩家
function SW_DelAllMSPlayer()
	local tPlayer = mf_GetMSPlayerIndex(MISSION_ID,0);
	local nOldPlayerIndex = PlayerIndex;
	gf_ShowDebugInfor("S? lng ngi ch琲:"..getn(tPlayer));
	for i=1,getn(tPlayer) do
		PlayerIndex = tPlayer[i];
		if PlayerIndex > 0 then
			gf_ShowDebugInfor("Hng d蒼 ngi ch琲:"..PlayerIndex);
			--SetTask(PT_SIGNUP_TIME,0);	--测试阶段使用
			DelMSPlayer(MISSION_ID,0);
		end
	end;
	PlayerIndex = nOldPlayerIndex;
end;
--计时器处理在雪仗开始阶段的一些事情
function SW_ProcessFightTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		SetMissionV(MV_FIELD_STATE,MS_STATE_COMPLETE);
		SetMissionV(MV_TIMER_LOOP,TIMER_WAITOUT_COUNT);
		Msg2MSAll(MISSION_ID,"Th阨 gian n衜 tuy誸  k誸 th骳, xin c竎 v? n g苝 Tuy誸 Gi?  nh薾 ph莕 thng.");
		local fFunc = function(tArg)
			Say("Th阨 gian n衜 tuy誸  k誸 th骳, xin c竎 v? n g苝 Tuy誸 Gi?  nh薾 ph莕 thng.",0);
			SetFightState(0);
		end;
		mf_OperateAllPlayer(MISSION_ID,fFunc,{},0);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"Ti課  th阨 gian: ["..(TIMER_COUNT-nLoop+1)..":"..(TIMER_COUNT+1).."]");
	end;
end;
--计时器处理在雪仗结束后那段时间的一些事情
function SW_ProcessWaitOutTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		if mod(nLoop,2) == 0 then
			Msg2MSAll(MISSION_ID,"T蕋 c? m鋓 ngi d飊g 甶觤 t輈h l騳 c馻 m譶h i ph莕 thng."..(nLoop/2).." ph髏.");
		end;
	end;
end;
--雪仗简介
function SW_KnowSnowWar()
	Talk(3,"","<color=green>"..g_sNpcName.."<color>: K? n╪g kh竎 nhau s? ti猽 hao Tuy誸 C莡 kh竎 nhau. M鏸 ng祔 v祇 khu n衜 tuy誸 s? 頲 ph竧 50 Tuy誸 C莡 mi詎 ph?, c騨g c? th? mua t筰 Tuy誸 Gi?.","<color=green>"..g_sNpcName.."<color>: T筰 Tuy襫 Ch﹗, Th祅h Й v? Bi謓 Kinh c? 3 khu v鵦 u c? Tuy誸 Gi?","<color=green>"..g_sNpcName.."<color>: Ch? ?: Trong khu v鵦 n衜 tuy誸 kh玭g th? s? d鬾g H錳 Th祅h ph? hay M藅 H祄 c馻 s? ph?.")
end;
--进入新的雪仗战场时要做的操作
function SW_NewSnowWarClear()
	if GetGlbValue(GLB_SNOWWAR_TIME) - GetTask(PT_SIGNUP_TIME) >= 1 or GetGlbValue(GLB_SNOWWAR_TIME) == 0 then
		SetTask(PT_POINT,BASE_POINT);--清除个人积分，这个要走SystemTimeTask才有用
		SetTask(PT_KILL_COUNT,0);
		SetTask(PT_DEATH_COUNT,0);
		return 1;
	end;
	return 0;
end;
--检查身上是否装有外装之外的装备
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
--登陆触发器。为了减少文件数量，以后打算不再单独创建一个trigger脚本了。
function OnLogin()
	SW_RestorePlayerState();
end;

function nothing()

end