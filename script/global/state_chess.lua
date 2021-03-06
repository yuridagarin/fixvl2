Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\lib\\sdb.lua");
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\lib\\date.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\task\\global_task\\gtask_data.lua");
Include("\\script\\online_activites\\award.lua")

--条件检查----------------------------------------
function scCheckLevel()
	if GetLevel() < 80 then
		return 0
	end
	return 1
end

function scCheckTask()
	if tGtTask:check_task() ~= 1 then
		return 0
	end
	if tGtTask:_CheckRoomWeight("3;50") ~= 1 then
		return 0
	end
	return 1
end

--每次投塞子需要消耗-----------------------------
--成功返回1
--失败返回0
function scCostResources()
	local nRet, nMax = ModifyEnergy(-4, 1);
	if nRet == -1 then
		return 0;
	end
	return 1;
end

--任务------------------------------------------
function scAcceptTask(nTaskID)
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 1 then
		return 1
	end
	return OpenGTask(nTaskID)
end

function scFinishTask(nTaskID)
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 1
	end
	
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return 6
	end
	
	--条件检测
	local nCanOver = tGtTask:IsTaskCanOver(nTaskID)
	if nCanOver ~= 1 then
		return 2
	end
	
	--结束前动作：策划设定，删除
	if tGtCondition:del_item_confirm(tGtNpcInfo[nTaskID]["data"][10]) == nil then
		return 4;
	end
	
	--从manage中移除
	tGtTaskManage:DeleteTask(nTaskID, 1)
	
	--结束动作
	--特效
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 907, 2, 0);
	
	Msg2Player(format("Х ho祅 th祅h nhi謒 v?: %s", tGtNpcInfo[nTaskID].name))
	
	--给与奖励
	tGtTask:DoPrize(nTaskID)
	tGtNpcMain:ShowAward(nTaskID)
	
	--活动
	vaf_get_prize_item_30709(2, 1);
	
	return 1
end

function scConfirmPassTask(nTaskID)
--manage中是否接了,没接的话直接返回Pass成功
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 1
	end
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return 6
	end
	local strTab = {
		format("\nуng ? ti猽 hao %s nh秠 qua nhi謒 v? n祔/StateChessPassTask", "Hu﹏ chng anh h飊g"),
		"\nKh玭g, mu鑞 t? tay ho祅 th祅h nhi謒 v?/nothing",
	};
	Say(format("Nh秠 qua nhi謒 v? (Nh薾 頲 ph莕 thng nhi謒 v?), c莕 ti猽 hao <color=red>%d<color> %s", 2, "Hu﹏ chng anh h飊g"), getn(strTab), strTab);
	return 1;
end

function scPassTask(nTaskID)
	--manage中是否接了,没接的话直接返回Pass成功
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 1
	end
	
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return 6
	end
	
	--条件检测
	local nCanOver = tGtTask:IsTaskCanOver(nTaskID)
	if nCanOver == 1 then
		Talk(1,"","Nhi謒 v?  ho祅 th祅h, kh玭g th? b? qua!")
		return 2
	end
	
	if GetItemCount(2, 1, 30499) < 2 then
		Talk(1,"",format("S? lng [%s] kh玭g  <color=red>%d<color> c竔", "Hu﹏ chng anh h飊g", 2))
		return 3;
	end
	if DelItem(2, 1, 30499, 2) ~= 1 then
		return 4;
	end
	Msg2Player(format("Х ti猽 hao %s*%d", "Hu﹏ chng anh h飊g", 2));
	
	--结束前动作：策划设定，删除
	tGtCondition:del_item_confirm(tGtNpcInfo[nTaskID]["data"][10])

	--删除触发器
	tGtTask:remove_trigger(nTaskID);
	
	--结束动作
	--特效
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 907, 2, 0);
	
	--从manage中移除
	tGtTaskManage:DeleteTask(nTaskID, 1)
	
	--给与奖励
	tGtTask:DoPrize(nTaskID)
	tGtNpcMain:ShowAward(nTaskID)
	
	--活动
	vaf_get_prize_item_30709(2, 1);
	
	return 1
end

function scDeleteTask(nTaskID)
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 1
	end
	return tGtTaskManage:DeleteTask(nTaskID)
end

--日志--------------------------------------------------
function scDailyLogDataModify(nRound, nCell, nValue)
	WriteLog(format("[Trng Ki誱 Thi猲 Nhai] [Nhi謒 v? bi課 h鉧] [Nh﹏ v藅: %s, t礽 kho秐: %s] [S? v遪g: %d, v? tr?: %d, bi課 lng: %d]", GetName(), GetAccount(), nRound, nCell, nValue))
end

--进入下一圈消耗-----------------------------------------
function scConfirmRoundOver(nRound)
	local strTab = {
		format("\nуng ? ti猽 hao %s  bc v祇 v遪g ti誴 theo/StateChessRoundOver", "Hu﹏ chng anh h飊g"),
		"\nT筸 th阨 kh玭g c莕/nothing",
	};
	Say(format("Ch骳 m鮪g,  ho祅 th祅h v遪g <color=green>%d<color>, bc v祇 v遪g ti誴 theo c莕 ti猽 hao <color=red>%d<color> %s", nRound, 4 + (nRound - 1) * 4, "Hu﹏ chng anh h飊g"), getn(strTab), strTab);
	return 1;
end

--进入下一圈消耗
--成功返回1
--失败返回0
function scRoundOver(nRound)
	local nValue = 4 + (nRound - 1) * 4;
	if GetItemCount(2, 1, 30499) < nValue then
		Talk(1,"",format("S? lng [%s] kh玭g  <color=red>%d<color> c竔", "Hu﹏ chng anh h飊g", nValue))
		return 0;
	end
	if DelItem(2, 1, 30499, nValue) ~= 1 then
		return 0;
	end
	Msg2Player(format("Х ti猽 hao %s*%d", "Hu﹏ chng anh h飊g", nValue));
	return 1;
end

--是否消耗银劵获取好运地图奖励--------------------------
function scConfirmFinishGl(nType)
	local strTab = {
		format("\nуng ? ti猽 hao %s nh薾 ph莕 thng/StateChessFinishGl", "Hu﹏ chng anh h飊g"),
		"\nT筸 th阨 kh玭g c莕/nothing",
	};
	Say(format("Ch祇 m鮪g n v韎 <color=green>b秐  may m緉<color>, tham gia c莕 ti猽 hao <color=red>%d<color> %s", 2, "Hu﹏ chng anh h飊g"), getn(strTab), strTab);
	return 1;
end

--成功返回1
--失败返回0
function scFinishGl(nType)
	if GetItemCount(2, 1, 30499) < 2 then
		Talk(1,"",format("S? lng [%s] kh玭g  <color=red>%d<color> c竔", "Hu﹏ chng anh h飊g", 2))
		return 0;
	end
	if DelItem(2, 1, 30499, 2) ~= 1 then
		return 0;
	end
	Msg2Player(format("Х ti猽 hao %s*%d", "Hu﹏ chng anh h飊g", 2));
	return 1;
end

--是否消耗银劵获取随机地图奖励--------------------------
function scConfirmFinishEv(nType)
	local strTab = {
		format("\nуng ? ti猽 hao %s nh薾 ph莕 thng/StateChessFinishEv", "Hu﹏ chng anh h飊g"),
		"\nT筸 th阨 kh玭g c莕/nothing",
	};
	Say(format("Ch祇 m鮪g n v韎 <color=green>b秐  s? ki謓 ng蓇 nhi猲<color>, tham gia c莕 ti猽 hao <color=red>%d<color> %s", 2, "Hu﹏ chng anh h飊g"), getn(strTab), strTab);
	return 1;
end

--成功返回1
--失败返回0
function scFinishEv(nType)
	if GetItemCount(2, 1, 30499) < 2 then
		Talk(1,"",format("S? lng [%s] kh玭g  <color=red>%d<color> c竔", "Hu﹏ chng anh h飊g", 2))
		return 0;
	end
	if DelItem(2, 1, 30499, 2) ~= 1 then
		return 0;
	end
	Msg2Player(format("Х ti猽 hao %s*%d", "Hu﹏ chng anh h飊g", 2));
	return 1;
end


--好运地图奖励------------------------------------------
function scGoodLuck(nValue)
	--print("nValue =", nValue)
	if 1 == nValue then
		local tAward = {
			{3, 5, 50000, 1},
			{3, 30, 100000, 1},
			{3, 30, 150000, 1},
			{3, 20, 200000, 1},
			{3, 5, 250000, 1},
			{3, 5, 300000, 1},
			{3, 2, 500000, 1},
			{3, 1, 600000, 1},
			{3, 1, 800000, 1},
			{3, 1, 2000000, 1},
		}
		local nRand = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1)
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Trng Ki誱 Thi猲 Nhai", "Mi誹 Th莕 T礽", nRand)
		Talk(1,"",format("B筺 nh薾 頲 <color=green>%d %s<color>", tAward[nRand][3]/10000, "V祅g"))
		return 1;
	elseif 2 == nValue then
		if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
			return 0;
		end
		local tAward = {
			{1, 20},
			{2, 20},
			{3, 20},
			{4, 15},
			{5, 15},
			{6, 5},
			{8, 2},
			{10, 1},
			{12, 1},
			{16, 1},
		}
		local nIndex = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1);
		local tGem = {
			{2,	22, 101, "Huy誸Tr輈hTh筩h Lv1"},
			{2,	22, 201, "Nguy謙B筩hTh筩h Lv1"},
			{2,	22, 301, "H? Ph竎h Th筩h C蕄 1"},
			{2,	22, 401, "H綾 Di謚 Th筩h C蕄 1"},
		}
		local nRand = random(getn(tGem));
		gf_AddItemEx2({tGem[nRand][1], tGem[nRand][2], tGem[nRand][3], tAward[nIndex][1]}, tGem[nRand][4], "Trng Ki誱 Thi猲 Nhai", "Ti襫 trang", 0, 1);
		Talk(1,"",format("Ngi nh薾 頲 <color=green>%dc竔%s<color>", tAward[nIndex][1], tGem[nRand][4]))
		return 1;
	elseif 3 == nValue then
		local tAward = {
			{38, 5, 10, 1},
			{38, 10, 15, 1},
			{38, 20, 20, 1},
			{38, 40, 25, 1},
			{38, 15, 30, 1},
			{38, 5, 35, 1},
			{38, 2, 40, 1},
			{38, 1, 45, 1},
			{38, 1, 50, 1},
			{38, 1, 60, 1},
		}
		local nIndex = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1);
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Trng Ki誱 Thi猲 Nhai", "Ti謒 thu鑓", nIndex)
		Talk(1,"",format("Ngi nh薾 頲 <color=green>%d甶觤%s<color>", tAward[nIndex][3], "Tinh L鵦"))
		return 1;
	end
	return 0;
end

--随机事件奖励------------------------------------------
function scEvent(nValue)
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	local tAward = {
		{2, 1500, 10000000,1},
		{2, 1000, 20000000, 1},
		{2, 500,  40000000, 1},
		{3, 500,  100000, 1},
		{3, 1300, 150000, 1},
		{3, 1000, 200000, 1},
		{3, 100,  300000, 1},
		{31, 1583, "sc_GetEventGemAward(1)", 0},
		{31, 800, "sc_GetEventGemAward(2)", 0},
		{31, 200, "sc_GetEventGemAward(4)", 0},
		{1, 1000, "Huy襫 Vi猰 Thi誸", {2, 1, 30670, 1}, 0},
		{1, 300, "Huy襫 Vi猰 Thi誸", {2, 1, 30670, 2}, 0},
		{1, 100, "Huy襫 Vi猰 Thi誸", {2, 1, 30670, 4}, 0},
		{1, 100, "Huy襫 Vi猰 Thi誸", {2, 1, 30670, 8}, 0},
		{1, 1, "Linh у o", {0, 3 , 30207, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у Trng", {0, 8 , 30208, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у Th?", {0, 0 , 30209, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у Ch﹎", {0, 1 , 30210, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у Ki誱", {0, 2 , 30211, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у Уn", {0, 10, 30212, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у Th?", {0, 0 , 30213, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у C玭", {0, 5 , 30214, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у Ki誱", {0, 2 , 30215, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у B髏", {0, 9 , 30216, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у Thng", {0, 6 , 30217, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у Cung", {0, 4 , 30218, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у o", {0, 7 , 30219, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у Tr秓", {0, 11, 30220, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у Ki誱", {0, 2 , 30221, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у Phi課", {0, 13, 30222, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у мch", {0, 12, 30223, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	}
	local nIndex = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1)
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Trng Ki誱 Thi猲 Nhai", "B秐  ng蓇 nhi猲", nIndex);
	if tAward[nIndex][1] == 1 then
		Talk(1,"",format("Ngi nh薾 頲 <color=green>%dc竔%s<color>", tAward[nIndex][4][4], tAward[nIndex][3]))
	elseif tAward[nIndex][1] == 2 then
		Talk(1,"",format("B筺 nh薾 頲 <color=green>%d %s<color>", tAward[nIndex][3], "Kinh nghi謒"))
	elseif tAward[nIndex][1] == 3 then
		Talk(1,"",format("B筺 nh薾 頲 <color=green>%d %s<color>", tAward[nIndex][3]/10000, "V祅g"))
	end
	return 1;
end

function sc_GetEventGemAward(nNum)
	local tGem = {
		{2,	22, 101, "Huy誸Tr輈hTh筩h Lv1"},
		{2,	22, 201, "Nguy謙B筩hTh筩h Lv1"},
		{2,	22, 301, "H? Ph竎h Th筩h C蕄 1"},
		{2,	22, 401, "H綾 Di謚 Th筩h C蕄 1"},
	}
	local nRand = random(getn(tGem));
	gf_AddItemEx2({tGem[nRand][1], tGem[nRand][2], tGem[nRand][3], tonumber(nNum) or 1}, tGem[nRand][4], "Trng Ki誱 Thi猲 Nhai", "B秐  ng蓇 nhi猲", 0, 1);
	Talk(1,"",format("Ngi nh薾 頲 <color=green>%dc竔%s<color>", nNum, tGem[nRand][4]))
end

function scCheckFreeRoom()
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
		return 0;
	end
	return 1;
end

--每圈奖励----------------------------------------------
function scDoPrize(nExp, nBagCount, nBagCountEx)
	--print("scDoPrize =", nExp, nBagCount, nBagCountEx)
	gf_ModifyExp(nExp);
	local nTotal = nBagCount;
	gf_AddItemEx2({2, 1, 30703, nBagCount}, "Bao Trng Ki誱 Thi猲 Nhai", "Trng Ki誱 Thi猲 Nhai", "Ph莕 thng m鏸 v遪g", 0, 1);
	if nBagCountEx > 0 then
		gf_AddItemEx2({2, 1, 30703, nBagCountEx}, "Bao Trng Ki誱 Thi猲 Nhai", "Trng Ki誱 Thi猲 Nhai", "Ph莕 thng m鏸 v遪g", 0, 1);
		nTotal = nTotal + nBagCountEx;
	end
	Say(format("Nh薾 頲 ph莕 thng m鏸 v遪g c馻 Trng Ki誱 Thi猲 Nhai: <color=green>EXP: %d, Bao Trng Ki誱 Thi猲 Nhai*%d<color>", nExp, nTotal), 0);
	WriteLog(format("[Trng Ki誱 Thi猲 Nhai] [Ph莕 thng m鏸 v遪g] [Nh﹏ v藅: %s, t礽 kho秐: %s] [Kinh nghi謒: %d, Bao Trng Ki誱 Thi猲 Nhai: %d]", GetName(), GetAccount(), nExp, nTotal))
end

--仗剑天涯包
function OnUse(nItem)
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	gf_AddItemEx2({2,1,30670,1}, "Vi猰 Huy襫 Thi誸", "Trng Ki誱 Thi猲 Nhai", "Bao Trng Ki誱 Thi猲 Nhai");
	Earn(40000);
	local tAward = {
		{2, 1000, 2000000, 1},
		{2, 1000, 5000000, 1},
		{2, 500, 10000000, 1},
		{3, 1000, 10000, 1},
		{3, 500, 50000, 1},
		{3, 400, 100000, 1},
		{3, 100, 300000, 1},
		{1, 1500, "Vi猰 Huy襫 Thi誸", {2, 1, 30670, 1}, 0},
		{1, 1000, "Vi猰 Huy襫 Thi誸", {2, 1, 30670, 2}, 0},
		{1, 500, "Vi猰 Huy襫 Thi誸", {2, 1, 30670, 4}, 0},
		{1, 500, "Vi猰 Huy襫 Thi誸", {2, 1, 30670, 8}, 0},
		{1, 500, "C﹜ B竧 Nh?", {2, 0, 398, 1, 4}, 0},
		{1, 600, "C﹜ B竧 Nh? nh?", {2, 0, 504, 1, 4}, 0},
		{1, 500, "C﹜ T? Linh", {2, 1, 30269, 1, 4}, 0},
		{1, 383, "T骾 h箃 gi鑞g", {2, 1, 30087, 1, 4}, 0},
		{1, 1, "Linh у o", {0, 3 , 30207, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у Trng", {0, 8 , 30208, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у Th?", {0, 0 , 30209, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у Ch﹎", {0, 1 , 30210, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у Ki誱", {0, 2 , 30211, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у Уn", {0, 10, 30212, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у Th?", {0, 0 , 30213, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у C玭", {0, 5 , 30214, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у Ki誱", {0, 2 , 30215, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у B髏", {0, 9 , 30216, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у Thng", {0, 6 , 30217, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у Cung", {0, 4 , 30218, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у o", {0, 7 , 30219, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у Tr秓", {0, 11, 30220, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у Ki誱", {0, 2 , 30221, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у Phi課", {0, 13, 30222, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh у мch", {0, 12, 30223, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Trng Ki誱 Thi猲 Nhai", "Bao Trng Ki誱 Thi猲 Nhai")
end
