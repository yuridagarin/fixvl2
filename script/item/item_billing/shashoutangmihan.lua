--create date:2007-07-02
--author:yanjun
--describe:
--在杀手堂中使用后，可以召唤出一个BOSS，不能在其他地方使用，不能在杀手堂完后使用。
--召唤概率如下：
--香主——75%
--副堂主——20%
--李大嘴——5%
--该道具必须队伍中有大于等于5人时才允许使用。
--每个队伍使用时，间隔时间为2分钟，只要队伍中有一个人使用过，所有人召唤都必须等待2分钟
Include("\\script\\task\\killer_hall\\mission\\mission_head.lua");
NEED_TEAM_MEMBER = 5;	--需要的队员数量
NEED_INTERVAL = 2*60;	--需要的间隔时间
function OnUse(nItemIdx)
	local nCurMapID = GetWorldPos();
	if nCurMapID ~= MAP_ID then
		Talk(1,"","M藅 h祄 S竧 Th? 阯g ch? 頲 s? d鬾g trong S竧 Th? Л阯g. ");
		return 0;
	end;
	if GetMissionV(MV_MISSION_STATE) ~= MS_STATE_STARTED then
		Talk(1,"","M藅 h祄 S竧 Th? 阯g ch? 頲 s? d鬾g khi s竧 th? xu蕋 hi謓. ");
		return 0;
	end;
	local nTeamSize = GetTeamSize();
	if nTeamSize < NEED_TEAM_MEMBER then
		Talk(1,"","Ph秈 s? d鬾g M藅 h祄 S竧 Th? 阯g, 輙 nh蕋 ph秈 c? <color=yellow>"..(NEED_TEAM_MEMBER-1).."<color> ng i gi髉 b筺. ");
		return 0;
	end;
	local nTimeElapse = GetTime() - get_team_use_time(nTeamSize);
	if nTimeElapse <= NEED_INTERVAL then	--时间还没到
		Talk(1,"","c遪 <color=yellow>"..tf_GetTimeString(NEED_INTERVAL-nTimeElapse).."<color> m韎 c? th? ti誴 t鬰 s? d鬾g M藅 h祄 S竧 Th? 阯g. ");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		set_team_time(nTeamSize);
		create_boss();
	end;
end;
--返回队伍里面的玩家最近使用杀手堂秘函的时间
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
--设置队伍里面所有玩家的使用时间
function set_team_time(nTeamSize)
	local nOldPlayerIdx = PlayerIndex;
	local nTime = GetTime();
	for i=1,nTeamSize do
		PlayerIndex = GetTeamMember(i);
		SetTask(KH_TASK_USE_MIHAN_TIME,nTime);
	end;
	PlayerIndex = nOldPlayerIdx;
end;
--随机创建一个boss
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
	gf_Msg2Team(GetName().."s? d鬾g 1 M藅 h祄 S竧 Th? 阯g, tri謚 t藀 "..sBossName);
	WriteLog("[S竧 Th? Л阯g]::"..GetName().."s? d鬾g 1 M藅 h祄 S竧 Th? 阯g, t筼 ra "..sBossName)
end;