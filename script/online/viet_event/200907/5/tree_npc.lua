--=============================================
--create by baiyun 2009.5.29
--describe:越南版7月份活动之五种树
--=============================================
Include("\\script\\online\\viet_event\\200907\\5\\planttrees_head.lua")
Include("\\script\\online_activites\\award.lua");
Include("\\script\\lib\\writelog.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\plant\\fruit_baoguo.lua");
Include("\\script\\online\\plant\\guoshi13_24.lua");
Include("\\script\\online_activites\\ipbonus\\ipbonus.lua");
Include("\\script\\online\\viet_event\\award\\award_head.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\award\\feature_award.lua");
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")


--------------------------------------
--main()
--主函数
--------------------------------------
function main()
	local nPlantTimePassed = 0;
	local nWaterTimePassed = 0;
	local npcIdx, npcModel, npcName = GetTriggeringUnit();--获得当前触发器里的NPC索引，模板ID，显示名字
	if npcIdx == 0 then
		WriteLog("[Hoat dong trong cay thang 8 loi]:"..GetName().."Trong l骳 ti c﹜, GetTriggeringUnit th? nh蕋 s? tr? v? 0");
		return 0;
	end
	local nNameLen = strlen(GetName());
	local bJudgeByName = 0;
	if GetName() == strsub(npcName, 1, nNameLen) then --用名字来判断是不是玩家的树
		bJudgeByName = 1;
	end
	local bIsTree = 0;
	for i = 1, getn(TREE_TYPE) do
		if npcModel == TREE_TYPE[i][1] then
			bIsTree = 1;
			break;
		end
	end
	if bIsTree == 0 then
		SetNpcScript(npcIdx, "");
		WriteLog("[Hoat dong trong cay thang 8 loi] NPC:"..npcName.."L鏸 files g鑓");
		return 0;
	end
	local npcTreeIndex = GetTargetNpc(); --获取玩家的动作对象Npc
	if npcTreeIndex == 0 then
		WriteLog("[Hoat dong trong cay thang 8 loi]:"..GetName.."Khi ti nc, GetTargetNpc tr? quay l筰 l? 0");
		return 0;
	end;
	if bJudgeByName == 0 then
		Msg2Player("Зy kh玭g ph秈 l? c﹜ b筺 tr錸g");
		return 0;
	end
	if npcTreeIndex ~= GetTask(TASK_TREE_INDEX) then
		Msg2Player("Зy kh玭g ph秈 l? c﹜ b筺 tr錸g");
		return 0;
	end
	
	local nTreeGrow = GetTask(TASK_TREE_GROW);
	nPlantTimePassed = GetTime() - GetTask(TASK_PLANT_TREE_TIME);
	nWaterTimePassed = GetTime() - GetTask(TASK_WATER_TREE_TIME);
	
	local sSysSth = "";
	local selTab = {};
	--如果是不死树
	if GetTask(TASK_PLANT_TREE_TYPE) == 2 then
		if nPlantTimePassed < 240 then
			Talk(1, "", "C﹜ B蕋 T? v蒼 ch璦 trng th祅h, b﹜ gi? kh玭g th? thu ho筩h 頲, i <color=yellow>" .. 240 - nPlantTimePassed .. " gi﹜<color> h穣 ti誴 t鬰 thu ho筩h");
			return 0;
		else
			tinsert(selTab, "B﹜ gi? thu ho筩h /getTree");
			tinsert(selTab, "ьi m閠 l骳 h穣 thu ho筩h ti誴/nothing");
			sSaySth = "C﹜  trng th祅h, mu鑞 thu ho筩h b﹜ gi?? N誹 nh?<color=yellow>" .. 300 - nPlantTimePassed .. "<color> gi﹜ sau kh玭g thu ho筩h, c﹜ s? t? ng ch誸 甶";
		end
	else
		if nTreeGrow == 1 then
			if nPlantTimePassed	< TREE_PARAM[nTreeGrow][3] then
				Talk(1, "", "C莕 ph秈 i th猰 <color=yellow>"
						 .. TREE_PARAM[nTreeGrow][3] - nPlantTimePassed ..
						 "<color> gi﹜ m韎 c? th? ti nc, c? 甶襲 ng c? ch箉 甶 qu? xa, n誹 nh? <color=yellow>"
						 .. TREE_PARAM[nTreeGrow][2] - nPlantTimePassed .. 
						 "<color> gi﹜ sau kh玭g ti nc, c﹜ thi誹 nc s? ch誸 甶."
				);	
				return 0;
			end
		end
		if nTreeGrow < 6 and nTreeGrow ~= 1 then
			if nPlantTimePassed > TREE_PARAM[nTreeGrow - 1][3] and nPlantTimePassed	<= TREE_PARAM[nTreeGrow][3] then
				Talk(1, "", "C莕 ph秈 i th猰 <color=yellow>"
						 .. TREE_PARAM[nTreeGrow][3] - nPlantTimePassed ..
						 "<color> gi﹜ m韎 c? th? ti nc, c? 甶襲 ng c? ch箉 甶 qu? xa, n誹 nh? <color=yellow>"
						 .. TREE_PARAM[nTreeGrow][2] - nPlantTimePassed .. 
						 "<color> gi﹜ sau kh玭g ti nc, c﹜ thi誹 nc s? ch誸 甶."
				);	
				return 0;
			end
		end
		if nTreeGrow == 6 then
			if nPlantTimePassed < TREE_PARAM[nTreeGrow][3] then
				Talk(1, "", TREE_TYPE[GetTask(TASK_PLANT_TREE_TYPE)][2] .. "V蒼 ch璦 trng th祅h, n猲 kh玭g th? thu ho筩h b﹜ gi? 頲<color=yellow>" ..TREE_PARAM[nTreeGrow][3] - nPlantTimePassed .. " gi﹜<color> h穣 ti誴 t鬰 thu ho筩h");
				return 0;
			end
			tinsert(selTab, "B﹜ gi? thu ho筩h /getTree");
			tinsert(selTab, "ьi m閠 l骳 h穣 thu ho筩h ti誴/nothing");
			sSaySth = "C﹜  trng th祅h, mu鑞 thu ho筩h b﹜ gi?? N誹 nh?<color=yellow>" .. getDateTimeString(TREE_PARAM[nTreeGrow][2] - nPlantTimePassed) .. "<color> gi﹜ sau kh玭g thu ho筩h, c﹜ s? t? ng ch誸 甶";
		else
				tinsert(selTab, "Ti nc (c莕 " .. TREE_PARAM[nTreeGrow + 1][4] .. " ph莕 L? Th駓)/giveWater");
				tinsert(selTab, "Sau n祔 h穣 ti./doNothing");
				sSaySth = TREE_TYPE[GetTask(TASK_PLANT_TREE_TYPE)][2] .. " 產ng c莕 ti L? Th駓, c? mu鑞 ti kh玭g? N誹 sau <color=yellow>" .. getDateTimeString(TREE_PARAM[nTreeGrow][2] - nPlantTimePassed) .. "<color> gi﹜ sau kh玭g ti nc, c﹜ thi誹 nc s? ch誸 甶.";
		end
	end
	
	Say(sSaySth, getn(selTab), selTab);
end

function nothing()
end

--------------------------------------
--giveWater()
--给树浇水
--------------------------------------
function giveWater()
	local nTreeGrow = GetTask(TASK_TREE_GROW);
	local npcTreeIndex = GetTargetNpc(); --获取玩家的动作对象Npc
	if npcTreeIndex == 0 then
		WriteLog("[Hoat dong trong cay loi]:" .. GetName() .. "L骳 ti nc, nhi謒 v? bi課 lng TASK_TREE_INDEX l? 0");
		return 0;
	end
	local npcIdx, npcModel, npcName = GetTriggeringUnit()
	local nNameLen = strlen(GetName());
	if GetName() ~= strsub(npcName, 1, nNameLen) then --用名字来判断是不是玩家的树
		Msg2Player("Зy kh玭g ph秈 l? c﹜ b筺 tr錸g");
		return 0;
	end
	if npcTreeIndex ~= GetTask(TASK_TREE_INDEX) then
			Msg2Player("Зy kh玭g ph秈 l? c﹜ b筺 tr錸g");
			return 0;
	end
	
	if DelItem(2, 0, 351, TREE_PARAM[nTreeGrow][4]) ~= 1 then
		Talk(1, "", "Kh玭g  L? Th駓!");
		return 0;
	end

	SetNpcLifeTime(npcTreeIndex, TREE_PARAM[nTreeGrow + 1][2] - (GetTime() - GetTask(TASK_PLANT_TREE_TIME)));
	SetTask(TASK_TREE_GROW, nTreeGrow + 1);
	SetTask(TASK_WATER_TREE_TIME, GetTime());
	
	local nTreeGrow = GetTask(TASK_TREE_GROW);
	nPlantTimePassed = GetTime() - GetTask(TASK_PLANT_TREE_TIME);
	nWaterTimePassed = GetTime() - GetTask(TASK_WATER_TREE_TIME);
	if nTreeGrow < 6 and nTreeGrow ~= 1 then
		StartTimeGuage("Ti c﹜",TREE_PARAM[nTreeGrow][3] - nPlantTimePassed,0,1)
	end
	if nTreeGrow == 6 then
		StartTimeGuage("Thu ho筩h",TREE_PARAM[nTreeGrow][3] - nPlantTimePassed,0,1)
	end
	Talk(1, "", "Ti nc th祅h c玭g!");
end

--------------------------------------
--getTree()
--拔树
--------------------------------------
function getTree()

-----判断背包和负重------------------------
	if gf_Judge_Room_Weight(4, 20, " ") == 0 then
		return 0
	end
	local npcTreeIndex = GetTargetNpc(); --获取玩家的动作对象Npc
	
	local npcIdx, npcModel, npcName = GetTriggeringUnit()
	local nNameLen = strlen(GetName());
	if GetName() ~= strsub(npcName, 1, nNameLen) then --用名字来判断是不是玩家的树		
		Msg2Player("Зy kh玭g ph秈 l? c﹜ b筺 tr錸g");
		return 0;
	end
	if npcTreeIndex ~= GetTask(TASK_TREE_INDEX) then
			Msg2Player("Зy kh玭g ph秈 l? c﹜ b筺 tr錸g");
			return 0;
	end	
	
	local npcTreeIndex = GetTargetNpc();
	if npcTreeIndex == 0 then
		WriteLog("[Hoat dong trong cay thang 8 loi]:" .. GetName() .. "L骳 nh? c﹜, GetTargetNpc tr? quay l筰 l? 0");
		return 0;
	end
	local nTreeType = GetTask(TASK_PLANT_TREE_TYPE);
	if nTreeType ~= 1 and nTreeType ~= 2 and nTreeType ~= 3 and nTreeType ~= 4 and nTreeType ~= 5 then
		WriteLog("[Hoat dong trong cay thang 8 loi]:" .. GetName() .. "Trong l骳 thu ho筩h thu 頲 lo筰 c﹜ kh玭g ng");
		return 0;
	end

	SetNpcScript(npcTreeIndex, "");
	SetNpcLifeTime(npcTreeIndex, 0);
	SetTask(TASK_TREE_INDEX, 0);
	SetTask(TASK_TREE_GROW, 0);
	SetTask(TASK_WATER_TREE_TIME, 0);
	
-----给经验奖励----------------------
	local nRand = 0;
	local nExp = 0;
	local nRep = 0;
	local nSuMon = 0;
	if nTreeType == 1 then			--枯干树
		nExp = 400000;
		nRep = 3;
		nSuMon = 3
	elseif nTreeType == 2 then	--不死树
		nExp = 600000;	
		nRep = 3;
		nSuMon = 3
	elseif nTreeType == 3 then	--白银树
		nRand = PlantTree_GetRandItem(WHITE_SILVER_TREE_EXP_REWARD_PARAM);
		nExp = WHITE_SILVER_TREE_EXP_REWARD_PARAM[nRand][1];
		nRep = 3;
		nSuMon = 3
	elseif nTreeType == 4 then	--黄金树
		nRand = PlantTree_GetRandItem(YELLOW_GOLDEN_TREE_EXP_REWARD_PARAM);
		nExp = YELLOW_GOLDEN_TREE_EXP_REWARD_PARAM[nRand][1];
		nRep = 18;
		nSuMon = 9
	else 												--白金树
		nRand = PlantTree_GetRandItem(WHITE_GOLDEN_TREE_EXP_REWARD_PARAM);
		nExp = WHITE_GOLDEN_TREE_EXP_REWARD_PARAM[nRand][1];
		nRep = 36;
		nSuMon = 18
	end
	
	ModifyExp(nExp);
	Msg2Player("B筺 nh薾 頲 " .. nExp .. " Kinh nghi謒");
	WriteLog("[Hoat dong trong cay]:" .. GetName() .. "Nh薾 頲 " .. nExp .. " Kinh nghi謒");
	--function th猰 ph莕 thng
	ThuHoachHatGiong()
   --nhi謒 v? l祄 gi祏
   	if CFG_NhiemVuLamGiau == 1 then
	     if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 6) == 0 then
	     		gf_SetTaskBit(TSK_LAMGIAU, 6, 1, 0)
	     		TaskTip("Ho祅 th祅h nhi謒 v? l祄 gi祏: Tr錸g th祅h c玭g 01 H箃 Gi鑞g.")
	     end
	end
	-----------------------Chu鏸 nhi謒 v? уng H祅h
	if CFG_NhiemVuDongHanh == 1 then
		if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 17 then
			if DongHanh_GetMissionPart() > 0 then
				DongHanh_SetMissionPart()
				if DongHanh_GetMissionPart() == 0 then
					DongHanh_SetStatus()
				end
			end
		end
	end
	--VET_IpBonusSeedAward()
	VietGetTreeAward()
	
	-- Nhi謒 v? Chuy觧 Sinh 3
	if GetTask(TRANSLIFE_MISSION_ID) == 19 and gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK2) < 192 then
		gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK2, gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK2) +1)
		if gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK2) == 192 then
			TaskTip("Ho祅 th祅h y猽 c莡 c馻 Фo Ch? Уo Hoa Фo 192 l莕 tr錸g th祅h c玭g H箃 Gi鑞g")
		end
	end
	
	-- Nhi謒 v? Chuy觧 Sinh 4
	if GetTask(TRANSLIFE_MISSION_ID) == 26 and gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK2) < 48 then
		gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK2, gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK2) +1)
		if gf_GetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK2) == 10 then
			gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK2, 0)
			gf_SetTaskByte(TRANSLIFE_TASK_34_FLAG, TRANSLIFE_BYTE_TASK2, gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK2) +1)
		end
		if gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK2) == 48 then
			TaskTip("Ho祅 th祅h y猽 c莡 c馻 B筩h Ti猲 Sinh 480 l莕 tr錸g th祅h c玭g H箃 Gi鑞g")
		end
	end
	
	-- Nhi謒 v? chuy觧 sinh 5
	if GetTask(TRANSLIFE_MISSION_ID) == 34 and gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK2) < 50 then
		gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK2, gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK2) +1)
		if gf_GetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK2) == 10 then
			gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK2, 0)
			gf_SetTaskByte(TRANSLIFE_TASK_34_FLAG, TRANSLIFE_BYTE_TASK2, gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK2) +1)
		end
		if gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK2) == 50 then
			TaskTip("Ho祅 th祅h y猽 c莡 c馻 B筩h Ti猲 Sinh 480 l莕 tr錸g th祅h c玭g H箃 Gi鑞g")
		end
	end
	
	
	----- Nh薾 thng theo s? l莕	

	if mod(GetTask(TASK_VNG_PET), 100) > 0 then
		if nTreeType == 4 then
			SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (100))
			Msg2Player("B筺 nh薾 頲 1 甶觤 n﹏g c蕄 B筺 уng H祅h!")
		elseif nTreeType == 5 then
			SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (200))
			Msg2Player("B筺 nh薾 頲 2 甶觤 n﹏g c蕄 B筺 уng H祅h!")
		end
	end
	--VietSeedBagAwardsEvent12()
	VietSeedBagAwardsEvent012012()
	--Give_Iponus_HatGiong()
	-- So lan trong cay trong ngay  
	local nTime = GetTask(TASK_PLANT_TREE_COUNT)
		
	if nTime >= 5 then
		ModifyReputation(nRep,1)
		Msg2Player("B筺 nh薾 頲 "..nRep.." 甶觤 danh v鋘g");
		WriteLog("[Hoat dong trong cay]:" .. GetName() .. "Nh薾 頲 " .. nRep .. " 甶觤 danh v鋘g");
		SetTask(336, GetTask(336) + nSuMon)
		Msg2Player("B筺 nh薾 頲 "..nSuMon.." 甶觤 s? m玭");
		WriteLog("[Hoat dong trong cay]:" .. GetName() .. "Nh薾 頲 " .. nSuMon .. " 甶觤 s? m玭");
	end
--	if nTime == 4 or nTime == 8 then
--		local nReturn, nIndex = AddItem(SEED_AWARD_COUNT[1][2],SEED_AWARD_COUNT[1][3],SEED_AWARD_COUNT[1][4],1);
--		if nReturn == 1 then			
--			SetItemExpireTime(nIndex, SEED_AWARD_COUNT[1][5]);
--			Msg2Player("B筺 nh薾 頲 "..SEED_AWARD_COUNT[1][1]);				
--			WriteLogEx("Hoat dong trong cay", "H箃 Gi鑞g", 1, SEED_AWARD_COUNT[1][1]);				
--		end	
--	elseif nTime == 6 then
--		local nReturn, nIndex = AddItem(SEED_AWARD_COUNT[2][2],SEED_AWARD_COUNT[2][3],SEED_AWARD_COUNT[2][4],1);
--		if nReturn == 1 then			
--			SetItemExpireTime(nIndex, SEED_AWARD_COUNT[2][5]);
--			Msg2Player("B筺 nh薾 頲 "..SEED_AWARD_COUNT[2][1]);				
--			WriteLogEx("Hoat dong trong cay", "H箃 Gi鑞g", 1, SEED_AWARD_COUNT[2][1]);				
--		end

--	if nTime == 12 then
--		--local nReturn, nIndex = AddItem(SEED_AWARD_COUNT[1][2],SEED_AWARD_COUNT[1][3],SEED_AWARD_COUNT[1][4],1);
--		--if nReturn == 1 then			
--		--	SetItemExpireTime(nIndex, SEED_AWARD_COUNT[1][5]);
--		--	Msg2Player("B筺 nh薾 頲 "..SEED_AWARD_COUNT[1][1]);				
--		--	WriteLogEx("Hoat dong trong cay", "H箃 Gi鑞g", 1, SEED_AWARD_COUNT[1][1]);				
--		--end			
--		--local nRand = random(1,1000)		
--		--if nRand > 999 then
--		--		nReturn, nIndex = AddItem(SEED_AWARD_COUNT[4][2],SEED_AWARD_COUNT[4][3],SEED_AWARD_COUNT[4][4],1);
--		--		if nReturn == 1 then			
--		--			SetItemExpireTime(nIndex, SEED_AWARD_COUNT[4][5]);
--		--			Msg2Player("B筺 nh薾 頲 "..SEED_AWARD_COUNT[4][1]);				
--		--			WriteLogEx("Hoat dong trong cay", "H箃 Gi鑞g", 1, SEED_AWARD_COUNT[4][1]);				
--		--		end
--		--elseif nRand > 980 then
--		--	nReturn, nIndex = AddItem(SEED_AWARD_COUNT[3][2],SEED_AWARD_COUNT[3][3],SEED_AWARD_COUNT[3][4],1);
--		--	if nReturn == 1 then			
--		--		SetItemExpireTime(nIndex, SEED_AWARD_COUNT[3][5]);
--		--		Msg2Player("B筺 nh薾 頲 "..SEED_AWARD_COUNT[3][1]);				
--		--		WriteLogEx("Hoat dong trong cay", "H箃 Gi鑞g", 1, SEED_AWARD_COUNT[3][1]);				
--		--	end
--		--elseif nRand > 480 then
--		--	nReturn, nIndex = AddItem(SEED_AWARD_COUNT[5][2],SEED_AWARD_COUNT[5][3],SEED_AWARD_COUNT[5][4],1);
--		--	if nReturn == 1 then			
--		--		SetItemExpireTime(nIndex, SEED_AWARD_COUNT[5][5]);
--		--		Msg2Player("B筺 nh薾 頲 "..SEED_AWARD_COUNT[5][1]);				
--		--		WriteLogEx("Hoat dong trong cay", "H箃 Gi鑞g", 1, SEED_AWARD_COUNT[5][1]);				
--		--	end	
--		--else
--		--	nReturn, nIndex = AddItem(SEED_AWARD_COUNT[2][2],SEED_AWARD_COUNT[2][3],SEED_AWARD_COUNT[2][4],1);
--		--	if nReturn == 1 then			
--		--		SetItemExpireTime(nIndex, SEED_AWARD_COUNT[2][5]);
--		--		Msg2Player("B筺 nh薾 頲 "..SEED_AWARD_COUNT[2][1]);				
--		--		WriteLogEx("Hoat dong trong cay", "H箃 Gi鑞g", 1, SEED_AWARD_COUNT[2][1]);				
--		--	end
--		--end
--		
--		-- Get id cua server hien hanh 
--		-- local nServerID = GetGlbValue(1023) -- get id cua server hien hanh
--		
--		if mod(GetTask(TASK_VNG_PET), 100) > 0 then
--			SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (100))
--			Msg2Player("B筺 nh薾 頲 1 甶觤 n﹏g c蕄 B筺 уng H祅h!")
--		end
--		
--		local nGroup = fruitcheckserver()
--		gf_AddItemEx2({tFruitAwardJune2010[nGroup][6][1], tFruitAwardJune2010[nGroup][6][2], tFruitAwardJune2010[nGroup][6][3], 12}, tFruitAwardJune2010[nGroup][7], "Hoat Dong Trai Cay", "Tr錸g 12 h箃 gi鑞g")
--		
--		local nDate = tonumber(date("%y%m%d"));
--		if nDate >= 100816 and nDate <= 100829 then
--			gf_AddItemEx2({2, 0, 1162, 3}, "Hoa H錸g ", "JX2 Idol", "tr錸g 12 h箃 gi鑞g")
--		end
--	end -- end nTime=12
	
	-- **************************************************************************************************************************************
	-- 20101123
	if ( nTime >= 13 and nTime <= 24 ) then
		local nGroup = fruitcheckserverNov()
		if nGroup == 0 then
			nGroup = mod(random(0,1000),20) + 1
		end
		gf_AddItemEx2 ( tFruitAwardNov2010[nGroup][6],  tFruitAwardNov2010[nGroup][7],  "Hoat Dong Trai Cay", "Tr錸g 24 h箃 gi鑞g" )
	end	
	-- **************************************************************************************************************************************
	
	local nDate = tonumber(date("%y%m%d"));
	
	if nDate >= 100416 and nDate <= 100516 then	
		local tCakeCount = {40,40,40,40,40}
		AddItem(2,1,30184,tCakeCount[nTreeType])
		WriteLogEx("Hoat dong thang 4 nam 2010","tr錸g c﹜",tCakeCount[nTreeType],"T骾 Nguy猲 Li謚")
	end
	
	if nDate >= 100528 and nDate <= 100704 then
		gf_AddItemEx2({2,1,30192,40}, "M﹎ tr竔 c﹜", "Hoat dong thang 6 nam 2010", "nh薾")	
	elseif nDate >= 100709 and nDate <= 100808 then
		gf_AddItemEx2({2,1,30205,40}, "T骾 kho竛g th筩h", "Hoat dong thang 7 nam 2010", "nh薾")	
	elseif nDate >= 100813 and nDate <= 100912 then
		gf_AddItemEx2({ 2, 1, 30225, 80}, "Nguy猲 Li謚 L祄 B竛h", "Hoat dong thang 8 nam 2010", "nh薾")
	elseif nDate >= 100929 and nDate <= 101024 then
		gf_AddItemEx2({ 2, 1, 30233, 75}, "B閠 M?", "Hoat dong thang 9 nam 2010", "Tr錸g H箃 Gi鑞g")
	end
	nTreeType = 0
-----给物品奖励，只有白银树、黄金树和白金树才给
	if nTreeType ~= 0  then
		local nMainType = 0;
		local nSecondryType = 0;
		local nDetailType = 0;
		local nCount = 1;
		local sItemName = "";
		local nLimitFlag = 0;
		local nLimitTime = 0;
		local nItem = 0;
		local nproperty = 0;
		local nReturn = 0;
		local nIndex = 0;
		
			
		if nTreeType == 1 then
			nItem = PlantTree_GetRandItem_new(SMALLEST_TREE_REWARD_ITEM_PARAM, 10000);
			nMainType = SMALLEST_TREE_REWARD_ITEM_PARAM[nItem][3];
			nSecondryType = SMALLEST_TREE_REWARD_ITEM_PARAM[nItem][4];
			nDetailType = SMALLEST_TREE_REWARD_ITEM_PARAM[nItem][5];
			nCount = SMALLEST_TREE_REWARD_ITEM_PARAM[nItem][7];			
			sItemName = SMALLEST_TREE_REWARD_ITEM_PARAM[nItem][1];
			nLimitTime = SMALLEST_TREE_REWARD_ITEM_PARAM[nItem][6];
			nproperty = SMALLEST_TREE_REWARD_ITEM_PARAM[nItem][8];
		elseif nTreeType == 2 then										-- 黄金树
			nItem = PlantTree_GetRandItem_new(ETERNAL_TREE_REWARD_ITEM_PARAM, 10000);
			nMainType = ETERNAL_TREE_REWARD_ITEM_PARAM[nItem][3];
			nSecondryType = ETERNAL_TREE_REWARD_ITEM_PARAM[nItem][4];
			nDetailType = ETERNAL_TREE_REWARD_ITEM_PARAM[nItem][5];
			nCount = ETERNAL_TREE_REWARD_ITEM_PARAM[nItem][7];			
			sItemName = ETERNAL_TREE_REWARD_ITEM_PARAM[nItem][1];
			nLimitTime = ETERNAL_TREE_REWARD_ITEM_PARAM[nItem][6];
			nproperty = ETERNAL_TREE_REWARD_ITEM_PARAM[nItem][8];
		elseif nTreeType == 3 then										-- 黄金树
			nItem = PlantTree_GetRandItem_new(SILVER_TREE_REWARD_ITEM_PARAM, 10000);
			nMainType = SILVER_TREE_REWARD_ITEM_PARAM[nItem][3];
			nSecondryType = SILVER_TREE_REWARD_ITEM_PARAM[nItem][4];
			nDetailType = SILVER_TREE_REWARD_ITEM_PARAM[nItem][5];
			nCount = SILVER_TREE_REWARD_ITEM_PARAM[nItem][7];			
			sItemName = SILVER_TREE_REWARD_ITEM_PARAM[nItem][1];
			nLimitTime = SILVER_TREE_REWARD_ITEM_PARAM[nItem][6];
			nproperty = SILVER_TREE_REWARD_ITEM_PARAM[nItem][8];
		elseif nTreeType == 4 then										-- 黄金树
			nItem = PlantTree_GetRandItem_new(GOLDEN_TREE_REWARD_ITEM_PARAM, 10000);
			nMainType = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][3];
			nSecondryType = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][4];
			nDetailType = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][5];
			nCount = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][7];			
			sItemName = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][1];
			nLimitTime = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][6];
			nproperty = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][8];
		elseif nTreeType == 5 then								--白金树
			nItem = PlantTree_GetRandItem_new(WHITE_TREE_REWARD_ITEM_PARAM,10000);
			nMainType = WHITE_TREE_REWARD_ITEM_PARAM[nItem][3];
			nSecondryType = WHITE_TREE_REWARD_ITEM_PARAM[nItem][4];
			nDetailType = WHITE_TREE_REWARD_ITEM_PARAM[nItem][5];
			nCount = WHITE_TREE_REWARD_ITEM_PARAM[nItem][7];			
			sItemName = WHITE_TREE_REWARD_ITEM_PARAM[nItem][1];
			nLimitTime = WHITE_TREE_REWARD_ITEM_PARAM[nItem][6];
			nproperty = WHITE_TREE_REWARD_ITEM_PARAM[nItem][8];
		end
		
		if nMainType == 0 and nSecondryType == 0 and nDetailType == 0 then		
			 WriteLogEx("Hoat dong trong cay", "C﹜ B筩h Ng﹏", nCount, sItemName);
			 return
		else
			if nproperty == 1 then
				nReturn, nIndex = AddItem(nMainType, nSecondryType, nDetailType, nCount, 1, -1, -1, -1, -1, -1, -1);
			else
				nReturn, nIndex = AddItem(nMainType, nSecondryType, nDetailType, nCount);
			end
		end		
		
		if nReturn == 1 then
			if nLimitTime ~= 0 then
				SetItemExpireTime(nIndex, nLimitTime);
			end
			Msg2Player("B筺 nh薾 頲 " .. nCount .. " " .. sItemName);	
			if nTreeType ==1  then	
				WriteLogEx("Hoat dong trong cay", "C﹜ H衞 骯", nCount, sItemName);
			elseif nTreeType == 2 then	
				WriteLogEx("Hoat dong trong cay", "C﹜ B蕋 T?", nCount, sItemName);
			elseif nTreeType == 3 then	
				WriteLogEx("Hoat dong trong cay", "C﹜ B筩h Ng﹏", nCount, sItemName);
			elseif nTreeType == 4 then	
				WriteLogEx("Hoat dong trong cay", "C﹜ Ho祅g Kim", nCount, sItemName);
				gf_AddItemEx2({2, 0, 1082, 5},"Th竔 D辌h H鏽 Nguy猲 C玭g у","Hoat dong trong cay","C﹜ B筩h Kim")
			elseif nTreeType == 5 then	
				WriteLogEx("Hoat dong trong cay", "C﹜ B筩h Kim", nCount, sItemName);
				gf_AddItemEx2({2, 0, 1082, 10},"Th竔 D辌h H鏽 Nguy猲 C玭g у","Hoat dong trong cay","C﹜ B筩h Kim")
			end		
		end
	end
end

function Give_Iponus_HatGiong()
	if GetExtPoint(4) == 1 then
		local nTimes = GetTask(2059)
		if  nTimes >= 1 and nTimes <= 6 then
			ModifyExp(100000)
			Msg2Player("B筺 nh薾 頲 100000 甶觤 kinh nghi謒 ") 
			gf_WriteLogEx("IpBonus Hat giong" ,"nh薾 100000 甶觤 kinh nghi謒")
		elseif  nTimes >= 7 and nTimes <= 12 then
			ModifyExp(150000)
			Msg2Player("B筺 nh薾 頲 150000 甶觤 kinh nghi謒 ") 
			gf_WriteLogEx("IpBonus Hat giong" ,"nh薾 150000 甶觤 kinh nghi謒")
		elseif  nTimes >= 13 and nTimes <= 24 then
			ModifyExp(250000)
			Msg2Player("B筺 nh薾 頲 250000 甶觤 kinh nghi謒 ") 
			gf_WriteLogEx("IpBonus Hat giong" ,"nh薾 250000 甶觤 kinh nghi謒")
		else
			return
		end
	end
end