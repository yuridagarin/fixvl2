Include("\\script\\missions\\taiyi\\head.lua");
Include("\\script\\missions\\taiyi\\tyfunctions.lua");
Include("\\script\\lib\\missionfunctions.lua");
Include("\\settings\\static_script\\missions\\base\\phasebase.lua");
Include("\\script\\system_switch_config.lua")

g_szNpcName = "<color=green>Ti猲 Phong Dng T玭 B秓:<color>";

function main()
	if _check_subsystem_open(SYS_SWITCH_TAIYI, 2) ~= 1 then
		return 0;
	end
	local szName;
	local strTab = {
		format("Ta mu鑞 tham gia Ph筺 Thi猲 L﹎-Thng (T鑞 %s)/Talk_1_1", "Tinh L鵦*"..TYT_JOIN_COST_JINGLI[1][1]),
		format("Ta mu鑞 tham gia Ph筺 Thi猲 L﹎-Thng (чi trng t鑞 %s)/Talk_1_1_IB", TYT_JOIN_COST_ITEM[1][1][2].."*"..TYT_JOIN_COST_ITEM[1][1][1][4]),
		--format("我要参加普通难度的太一塔(消耗%s)/Talk_1_2", "精力*"..TYT_JOIN_COST_JINGLI[2][1]),
		--format("我要参加普通难度的太一塔(队长消耗%s)/Talk_1_2_IB", TYT_JOIN_COST_ITEM[2][1][2].."*"..TYT_JOIN_COST_ITEM[2][1][1][4]),
		--"关卡首通奖励领取/Talk_1_6",
		"H駓 b?/nothing",
	};
	
	if GetSex() == 1 then
		szName = "Чi hi謕";
	elseif GetSex() == 2 then
		szName = "N? hi謕 ";
	end
	Say(format(g_szNpcName.."Tr薾 chi課 Kim Sa Than, Dng L謓h C玭g b? gian th﹏ Phan M? b竛 ng n猲  di tay c馻 qu﹏ li猽, v? hi sinh n琲 t Li猽.Sau khi bi誸 tin Dng Nghi謕 頲 an t竛g t筰 n琲 c? t猲 l? Th竔 Nh蕋 Th竝, th? ta v? Qu? Anh ph鬾g l謓h x玭g v祇 Th竔 Nh蕋 Th竝  t譵 h礽 c鑤 v? b閕 產o Hoang H醓 L璾 Kim c馻 L謓h C玭g. Th竔 Nh蕋 Th竝 n祔 c? quan tr飊g tr飊g, %s  s絥 s祅g ch璦?", szName), getn(strTab), strTab);
end

function Talk_1_1()
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.FOREST, eDifType.NORMAL) then
		return 0;
	end

	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.FOREST, eDifType.NORMAL) then
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.FOREST, eDifType.NORMAL, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."Ph筺 Thi猲 L﹎ 產ng r蕋 ch藅 ch閕, h穣 quay l筰 sau!");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.FOREST, eDifType.NORMAL) then
		return 0;
	end
	
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.FOREST, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.NORMAL, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 0, 0));
	tTY:TeamEnter(nMapId, 1);
	
	AddRuntimeStat(18, 1, 0, 1);
	AddRuntimeStat(18, 2, 0, 1);
	if gf_GetRouteCount() >= 8 then
		AddRuntimeStat(18, 4, 0, 1);
	end
	gf_TeamOperateEX(function ()
		AddRuntimeStat(18, 40, GetPlayerRoute(), 1);		
	end);
	
	--cdkey活动
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Raid_Set(5)");	
	end);
end

function Talk_1_1_IB()
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.FOREST, eDifType.NORMAL) then
		return 0;
	end

	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.FOREST, eDifType.NORMAL) then
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.FOREST, eDifType.NORMAL, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."Ph筺 Thi猲 L﹎ 產ng r蕋 ch藅 ch閕, h穣 quay l筰 sau!");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.FOREST, eDifType.NORMAL) then
		return 0;
	end
	
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.FOREST, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.NORMAL, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 0, 0));
	tTY:TeamEnter(nMapId, 1);
	
	AddRuntimeStat(18, 1, 0, 1);
	AddRuntimeStat(18, 3, 0, 1);
	if gf_GetRouteCount() >= 8 then
		AddRuntimeStat(18, 4, 0, 1);
	end
	gf_TeamOperateEX(function ()
		AddRuntimeStat(18, 40, GetPlayerRoute(), 1);		
	end);
	
	--cdkey活动
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Raid_Set(5)");	
	end);
end

function Talk_1_2()
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.TOWER, eDifType.NORMAL) then
		return 0;
	end

	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.TOWER, eDifType.NORMAL) then
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.TOWER, eDifType.NORMAL, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."Ph筺 Thi猲 L﹎ 產ng r蕋 ch藅 ch閕, h穣 quay l筰 sau!");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.TOWER, eDifType.NORMAL) then
		return 0;
	end
	
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.TOWER, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.NORMAL, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 0, 0));
	tTY:TeamEnter(nMapId, 1);
end

function Talk_1_2_IB()
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.TOWER, eDifType.NORMAL) then
		return 0;
	end

	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.TOWER, eDifType.NORMAL) then
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.TOWER, eDifType.NORMAL, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."Ph筺 Thi猲 L﹎ 產ng r蕋 ch藅 ch閕, h穣 quay l筰 sau!");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.TOWER, eDifType.NORMAL) then
		return 0;
	end
	
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.TOWER, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.NORMAL, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 0, 0));
	tTY:TeamEnter(nMapId, 1);
end

function Talk_1_6()
	local strTab = {
		"Nh薾 l蕐 ph莕 thng./Talk_1_6_1",
		"H駓 b?/nothing",
	};
	local msg = "в b祔 t? l遪g bi誸 琻 i v韎 nh鱪g hi謕 s? u ti猲 vt qua Th竔 Nh蕋 Th竝-Anh H飊g  畂箃 l筰 tro c鑤 c馻 Gia Gia, t蕋 c? ngi ch琲 tr猲 c蕄 80 u nh薾 頲 1 ph莕 thng L莕 u Qua 秈";
	msg = msg..""
	Say(g_szNpcName..msg, getn(strTab), strTab);
end

function Talk_1_6_1()
--	local nDate = tonumber(date("%Y%m%d"));
--	local szGroupName = GetRelayGroup();
--	if 1 == _JX2WZ then
--		szGroupName = "wz"..szGroupName;
--	elseif 1 == _JX2PAY then
--		szGroupName = "pay"..szGroupName;
--	elseif 1 == _JX2IB then
--		szGroupName = "free"..szGroupName;
--	end
--	
--	if nDate < 20120331 or nDate > 20120405 then
--		Talk(1, "", g_szNpcName.."首通纪念奖励领取时间为2012年3月31日-2012年4月05日。");
--		return 0;
--	end
--
--	if GetLevel() < 80 then
--		Talk(1, "", "只有80级以上的玩家才能领取！");
--		return 0;
--	end
--	
--	local tSpecGroup = {
--		["wz1-1"] = 1,
--		["wz3-1"] = 1,
--		["free100-8"] = 1,
--		["pay1-3"] = 1,
--	};
--	if 0 == GetTask(TASKID_TAIYI_SHOUTUI_PRIZE) then
--		if tSpecGroup[szGroupName] then
--			if 1 ~= gf_Judge_Room_Weight(13, 100, g_szNpcName) then
--				return 0;
--			end
--		else
--			if 1 ~= gf_Judge_Room_Weight(7, 100, g_szNpcName) then
--				return 0;
--			end
--		end
--	end
--	
--	if 0 ~= GetTask(TASKID_TAIYI_SHOUTUI_PRIZE) then
--		Talk(1, "", g_szNpcName.."此奖励你已领取。");
--		return 0;
--	end
--	SetTask(TASKID_TAIYI_SHOUTUI_PRIZE, nDate);
--	
--	WriteLog(format("[太一塔首推奖励] [%s 领取奖励, Account:%s]", GetName(), GetAccount()));
--	if tSpecGroup[szGroupName] then
--		gf_Modify("Exp", (10000000 + 1000000*(GetLevel()-80)) * 2);
--		gf_AddItemEx({2, 95, 1506, 10, 4}, "洪荒碎片");
--		gf_AddItemEx({2, 0, 553, 2, 4}, "大人参果");
--		gf_AddItemEx({2, 1, 270, 10, 4}, "白驹丸");
--	else
--		gf_Modify("Exp", 10000000 + 1000000*(GetLevel()-80));
--		gf_AddItemEx({2, 95, 1506, 5, 4}, "洪荒碎片");
--		gf_AddItemEx({2, 0, 553, 1, 4}, "大人参果");
--		gf_AddItemEx({2, 1, 270, 5, 4}, "白驹丸");
--	end
end
