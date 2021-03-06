--=============================================
--create by baiyun 2009.5.29
--describe:越南版7月份活动之五种树
--=============================================
Include("\\script\\online\\viet_event\\200907\\5\\planttrees_head.lua")
Include("\\script\\lib\\writelog.lua");
Include ("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Include("\\script\\vng\\award\\feature_award.lua");
Include("\\script\\vng\\config\\vng_feature.lua")

-----------------------------------------------
--OnUse()
--点击树种触发事件
-----------------------------------------------

function OnUse(nItemIdx)
-----检查是否符合种树的条件
--	if checkEventDate() == 0 then
--		Talk(1, "", "Th阨 gian ho箃 ng  h誸.");
--		return 0;
--	end
--	if tonumber(date("%y%m%d%H")) >= 09082108 and  tonumber(date("%y%m%d%H")) < 09082118 then 
--		Msg2Player("Hi謓 t筰 kh玭g th? s? d鬾g 頲 v藅 ph蒻 n祔");
--		return
--	end
--	if checkEventTime() == 0 then
--		Talk(1, "", "种树时间为00:00 – 12:00和17:00 – 00:00两个时间段");
--		return 0;
--	end
	if GetFreeItemRoom() < 2 then
		Talk(1, "", "H祅h trang kh玭g  2 ? tr鑞g, kh玭g th? tr錸g c﹜");
		return 0;
	end
	
	if GetLevel() < PLANT_TREE_ROLE_LEVEL_LIMIT then
		Talk(1, "", "V蒼 ch璦 t n c蕄 <color=yellow>" .. PLANT_TREE_ROLE_LEVEL_LIMIT .. "<color> c蕄 kh玭g th? tr錸g c﹜");
		return 0;
	end
	if checkPlaceMainCity() == 0 then
		Talk(1, "", "мa 甶觤 tr錸g c﹜ kh玭g th輈h h頿");
		return 0;
	end
-----种树的日期检查，如果今天第一次种树，表示现在可以种树了，则清空任务变量-----
-----将种树的数量设为0，种树日期设为今天，种下树的时间和浇水时间设为现在--------
	local nDate = tonumber(date("%y%m%d"));
--如果今天还没有种树，则表示可以种树
	if GetTask(TASK_PLANT_TREE_DATE) < nDate then 
		SetTask(TASK_PLANT_TREE_COUNT, 0);
		SetTask(TASK_WATER_TREE_TIME, 0);
		SetTask(TASK_PLANT_TREE_TIME, 0);
	else
-----检查今天种的树是否已经到允许的最大数量--------------------------------------
		if GetTask(TASK_PLANT_TREE_COUNT) >= PLANT_TREE_LIMIT then
			Talk(1, "", "H玬 nay b筺  tr錸g <color=yellow>".. GetTask(TASK_PLANT_TREE_COUNT) .."<color> c﹜ r錳, i ngay mai h穣 ti誴 t鬰 nh?.");
			return 0;
		end
-----检查是否已经种下一棵树了----------------------------------------------------
		for i = 1, 6 do
			if GetTask(TASK_TREE_GROW) == i and GetTime() - GetTask(TASK_PLANT_TREE_TIME) < TREE_PARAM[i][2] and GetTask(TASK_WATER_TREE_TIME) ~= 0 then
				Talk(1, "", "Чi hi謕  tr錸g 1 c﹜ r錳");
				return 0;
			end
		end
		if GetTask(TASK_PLANT_TREE_TYPE) == 2 and GetTime() - GetTask(TASK_PLANT_TREE_TIME) < 300 then--如果种下不死树，则在没拨之前，都不能种别的树
				Talk(1, "", "Чi hi謕  tr錸g 1 c﹜ r錳");
				return 0;
		end
-----检查离上次种树是否已经过了PLANT_TREE_INTERVAL这么长时间---------------------
		if GetTime() - GetTask(TASK_PLANT_TREE_TIME) < PLANT_TREE_INTERVAL then
			Talk(1, "", "Th阨 gian gi穘 c竎h gi鱝 hai l莕 tr錸g c﹜ l? <color=yellow>" .. PLANT_TREE_INTERVAL .. " gi﹜.");
			return 0;
		end
	end
-----可以种树了------------------------------------------------------------------
	local selTab = {
				"H穣 mau tr錸g c﹜/#plantTree("..nItemIdx..")",
	 			"Sau n祔 tr錸g s? t鑤 h琻!/doNothing"
	 		}
	Say("Чi hi謕 mu鑞 tr錸g c﹜?", getn(selTab), selTab);		 
end

---------------------------
--plantTree()
--种树操作
---------------------------
function plantTree(nItemIdx)
	if checkPlaceMainCity() == 0 then
		Talk(1, "", "мa 甶觤 tr錸g c﹜ kh玭g th輈h h頿");
		return 0;
	end
	local nDate = tonumber(date("%y%m%d"));
-----删除身上的一个树种-------------------------------------------------------------------------
	if DelItem(2, 1, 30086, 1) == 1 then
		----------------------- Chu鏸 nhi謒 v? Chuy觧 Sinh Кn, l璾 3 s? u b猲 ph秈
		local nCSD_HG = mod(GetTask(TSK_CSD_COUNT_B), 1000)
		if nCSD_HG < 300 and GetTask(TSK_CSD) == 1 then
			SetTask(TSK_CSD_COUNT_B, GetTask(TSK_CSD_COUNT_B) + 1)
		end
		----------------------- Chu鏸 nhi謒 v? M秐h Thi猲 Th筩h, l璾 3 s? u b猲 ph秈
		local nMTT_HG = mod(GetTask(TSK_MTT_COUNT), 1000)
		local nMTT_HG_NV =  mod(floor(GetTask(TSK_MTT_COUNT) / 10000000),10)
		if nMTT_HG < 150 and nMTT_HG_NV == 1 then
			SetTask(TSK_MTT_COUNT, GetTask(TSK_MTT_COUNT) + 1)
		end
		------------------------Chu鏸 nhi謒 v? Chuy觧 Sinh 6
		local nCS6_HG =  floor(GetTask(TSK_CS6_COUNTA)/10000000)
		local nCS6_HG_Num = mod(GetTask(TSK_CS6_COUNTA),10000000)
		if mod(nCS6_HG,1000) < 150 and GetTask(TSK_CS6_TULINH) < 2 then
			nCS6_HG = (nCS6_HG + 1) * 10000000 + nCS6_HG_Num
			SetTask(TSK_CS6_COUNTA, nCS6_HG)
		end
		-----------------------------------------------------------------
		local nMapID, nMapX, nMapY = GetWorldPos();
-----此处运用树出现的概率来得到种下树的类型-----------------------------------------------------
		local nRand = 0;
		local nTreeType = 0;
		local nMin = 0;
		
		nRand = random(1, 100);
		
		for i=1,getn(TREE_TYPE) do
			if nRand > nMin and nRand <=  TREE_TYPE[i][3] + nMin then
				nTreeType = i
				break
			end		
			nMin = nMin + TREE_TYPE[i][3]
		end
		
		local npcTreeIndex = CreateNpc(TREE_TYPE[nTreeType][1], GetName().." tr錸g "..TREE_TYPE[nTreeType][2], nMapID, nMapX, nMapY);

		KichHoatHatGiong() -- ph莕 thu雗g khi k輈h ho箃
		--- 觤 V薾 May
--		local nBonusExp = 1200000
--		local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--		local nExpVM = (nPointVM - 100)/100*nBonusExp
--		ModifyExp(nExpVM)
--		if nExpVM > 0 then
--			Msg2Player("B筺 nh薾 th猰 ".. nExpVM.." 甶觤 kinh nghi謒 t? v薾 may!")
--		else
--			Msg2Player("B筺 b? t鎛 th蕋 ".. nExpVM.." 甶觤 kinh nghi謒 do kh玭g may m緉. H穣 甶 gi秈 v薾 xui ? Th莥 B鉯 Si猽 H筺g!")
--		end
		---------			
		WriteLogEx("Hoat dong trong cay","Tr錸g",1,TREE_TYPE[nTreeType][4])
		if npcTreeIndex == 0 then
			WriteLog("[Hoat dong trong cay loi]:"
								..GetName..
								"Trong l骳 tr錸g c﹜, CreatNpc h祄 s? tr? v? 0. Nh藀 tham s? CreateNPC l?:"
								 ..TREE_TYPE[nTreeType][1]..", " ..GetName().. " tr錸g "
								  ..TREE_TYPE[nTreeType][2].. ", " ..nMapID.. "," ..nMapX.. "," ..nMapY);
		end

-----如果获得白金树，则向全世界发公告
		if nTreeType == 5 then
			AddGlobalNews("Ch骳 m鮪g  "..GetName().." Х nh薾 頲." .. "C﹜ B筩h Kim" .. " T筰 ".. CITY_NAME_ID[GetWorldPos()]);
		end
		
-----设置树的存活时间----------------------------------------------------------------------------		
		SetTask(TASK_PLANT_TREE_TYPE, nTreeType);
		if nTreeType == 2 then
			SetNpcLifeTime(npcTreeIndex, TREE_PARAM[6][2]);--如果是不死树，不用露水浇灌，生存时间直接是300秒
		else
			SetNpcLifeTime(npcTreeIndex, TREE_PARAM[1][2]);--刚种下肯定是第一阶段
		end
		SetTask(TASK_TREE_INDEX, npcTreeIndex);
		SetTask(TASK_TREE_GROW, 1);
		SetTask(TASK_WATER_TREE_TIME, GetTime());
		SetNpcScript(npcTreeIndex, "\\script\\online\\viet_event\\200907\\5\\tree_npc.lua");
		SetTask(TASK_PLANT_TREE_DATE, nDate);
		SetTask(TASK_PLANT_TREE_COUNT, GetTask(TASK_PLANT_TREE_COUNT) + 1);
		SetTask(TASK_PLANT_TREE_TIME, GetTime());

		if nTreeType ~= 2 then
			StartTimeGuage("Ti c﹜",TREE_PARAM[GetTask(TASK_TREE_GROW)][3],0,1)
		else
			StartTimeGuage("Thu ho筩h",240,0,1)
		end
		Say("H玬 nay, y l? l莕 th? <color=yellow>"..GetTask(TASK_PLANT_TREE_COUNT).."<color> l莕 tr錸g c﹜, h玬 nay c遪 c? th? tr錸g <color=yellow>"..PLANT_TREE_LIMIT - GetTask(TASK_PLANT_TREE_COUNT).."<color> c﹜. N誹 nh? " .. TREE_PARAM[1][2] .. " gi﹜ kh玭g ti nc, c﹜ s? t? ng ch誸 甶.", 0);

		--if GetTask(TASK_PLANT_TREE_COUNT) == PLANT_TREE_LIMIT and nDate <= 130120 then	
		if nDate >= 130214 and nDate <= 130228 then	
			gf_AddItemEx2({2,1,30357, 200}, "H箃 Ca Cao", "VALENTINE 2013", "H箃 ca cao")
		end	
	end
end
