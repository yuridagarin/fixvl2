--Create Date:2007-3-22 23:06
--Author:yanjun(yim)
--Describe:奇门阵符，可传送到战场指定位置，可使用数次(类似神行秘本,耐久99点,每使用一次要掉相
--应的耐久点数,只能在特定战场内,且战场开始后才可使用)。
Include("\\script\\newbattles\\functions.lua");

g_nUseCoolDown = 60;	--使用CD时间

tbPosEmplacement = 
{
	[1] = {"Tuy課 u ph竜 i (t?) (tr? 3 甶觤  b襫)",3,1650,2965},
	[2] = {"Tuy課 u ph竜 i (trung) (tr? 4 甶觤  b襫)",4,1733,2990},
	[3] = {"Tuy課 u ph竜 i (ph秈) (tr? 3 甶觤  b襫)",3,1795,2963},
	[4] = {"Trung qu﹏ ti觰 k輓h (trung) (tr? 2 甶觤  b襫)",2,1718,3192,},
}

tbPosVillage = 
{
	[1] = {"T飝 qu﹏ hng o (tr? 3 甶觤  b襫)",3,1627,3331},
	[2] = {"Trung t﹎ b秐 b? (tr? 2 甶觤  b襫)",2,1671,3370},
	[3] = {"G鉩 tr猲 b秐  (tr? 2 甶觤  b襫)",2,1673,3200},
	[4] = {"G鉩 di b秐  (tr? 2 甶觤  b襫)",2,1682,3548},
}

tbPosMain = 
{
	[1] = {"Ti襫 doanh (tr? 5 甶觤  b襫)",5,1761,3354},
	[2] = {"Khu t? n筺 phe T鑞g (tr? 5 甶觤  b襫)",5,1690,3291},
	[3] = {"Khu t? n筺 phe Li猽 (tr? 5 甶觤  b襫)",5,1836,3305},
	[4] = {"Ti襫 tuy課 phe T鑞g (tr? 4 甶觤  b襫)",4,1676,3409},
	[5] = {"Ti襫 tuy課 phe Li猽 (tr? 4 甶觤  b襫)",4,1842,3410},
	[6] = {"Khu th? d﹏ (tr? 4 甶觤  b襫)",4,1754,3500},
}

tbPos = {tbPosVillage,nil,tbPosEmplacement,tbPosMain,tbPosMain};	--草谷场没有传送点

function OnUse(nItemIdx)
	local nBattleType = BT_GetData(PT_BATTLE_TYPE);
	if nBattleType == 0 or nBattleType == RESOURCE_ID then
		Talk(1,"","K? M玭 Tr薾 Ph? ch? s? d鬾g trong chi課 trng Th玭 L筩, Ph竜 i, Nh筺 M玭 quan, Ng鋍 M玭 quan. ");
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","Khi chi課 tr薾 ch輓h th鴆 b総 u m韎 c? th? s? d鬾g K? M玭 Tr薾 ph?");
		return 0;
	end;
	if judge_use_state() == 0 then
		Talk(1,"","Tr筺g th竔 hi謓 t筰 kh玭g th? s? d鬾g K? M玭 Tr薾 Ph?. <color=red>Ch? 頲 s? d鬾g ? h藆 doanh<color>. ");
		return 0;
	end;
	nItemIdx = tonumber(nItemIdx);
	local nleft = AbradeItem(nItemIdx, 0)
	if (nleft == 0) then
		Say("ч b襫 hi謓 t筰 K? M玭 Tr薾 ph? c馻 b筺 b籲g 0", 0)
		DelItemByIndex(nItemIdx, 0)					-- 耐久为0要删除掉物品
	end
	local nTimeElapse = GetTime() - BT_GetData(PT_QIMENZHENFU_USE_TIME);
	if nTimeElapse <= g_nUseCoolDown then
		Talk(1,"","Sau <color=yellow>"..(g_nUseCoolDown-nTimeElapse).."<color> gi﹜ m韎 c? th? d飊g l筰 K? M玭 Tr薾 ph?.");
		return 0;
	end;
	local selTab = {};
	for i=1,getn(tbPos[nBattleType]) do
		tinsert(selTab,format(tbPos[nBattleType][i][1].."/#go_to(%d,%d,%d)",i,nBattleType,nItemIdx));
	end;
	tinsert(selTab,"Kh玭g s? d鬾g/nothing");
	Say("B筺 hi謓 tham gia <color=yellow>"..tBattleName[nBattleType].."<color>, c? mu鑞 s? d鬾g K? M玭 Tr薾 ph? kh玭g?",getn(selTab),selTab);
end;

function go_to(nIdx,nBattleType,nItemIdx)
	if BT_GetTempData(PTT_ROOMINDEX) ~= 0 then	--如果在单挑场地中
		return 0;
	end;
	local nMapX,nMapY = tbPos[nBattleType][nIdx][3],tbPos[nBattleType][nIdx][4];
	local nCurMapID = GetWorldPos();
	if nCurMapID == 880+nBattleType or nCurMapID == PRIMARY_MAIN_MAP_ID then	--利用地图ID再作一次判断，主要是担心任务变量出现问题
		local nShouldCost = tbPos[nBattleType][nIdx][2];
		AbradeItem(nItemIdx, nShouldCost)
		SetPos(nMapX,nMapY);
		BT_SetData(PT_QIMENZHENFU_USE_TIME,GetTime());
		set_player_state();
	else
		Talk(1,"","Hi謓 t筰 kh玭g th? s? d鬾g K? M玭 Tr薾 ph?");
	end;
end;

function judge_use_state()
	if BT_GetTempData(PTT_LOCK) ~= 0 then	--单挑锁定或单挑中
		return 0;
	end;
	if GetFightState() == 1 then
		return 0;
	end;
	return 1;
end;

function set_player_state()
	if GetFightState() == 0 then
		BT_RestoreAll();
	end;
	BT_SetTempData(PTT_DIE_LOOP,0);
	SetFightState(1);
end;

function nothing()

end;