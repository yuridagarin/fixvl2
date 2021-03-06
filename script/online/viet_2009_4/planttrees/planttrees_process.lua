--=============================================
--create by baiyun 2009.4.9
--describe:越南版4月份种树活动
--=============================================
Include("\\script\\online\\viet_2009_4\\planttrees\\planttrees_head.lua")

-----------------------------------------------
--OnUse()
--点击树种触发事件
-----------------------------------------------
function OnUse()
-----检查是否符合种树的条件
	if checkEventDate() == 0 then
		Talk(1, "", "Th阨 gian ho箃 ng  h誸.");
		return 0;
	end
	if checkEventTime() == 0 then
		Talk(1, "", "Th阨 gian tr錸g c﹜ l? 0:00 - 12:00 v? 17:00 - 0:00");
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
-----检查离上次种树是否已经过了PLANT_TREE_INTERVAL这么长时间---------------------
		local nTreeType = GetTask(TASK_PLANT_TREE_TYPE)
		if nTreeType == 2 then
			if GetTime() - GetTask(TASK_PLANT_TREE_TIME) < PLANT_TREE_INTERVAL * 2  then
				Talk(1, "", "Th阨 gian gi穘 c竎h gi鱝 hai l莕 tr錸g c﹜ l? <color=yellow>" .. PLANT_TREE_INTERVAL * 2 .. " gi﹜.");
				return 0;
			end
		else			
			if GetTime() - GetTask(TASK_PLANT_TREE_TIME) < PLANT_TREE_INTERVAL then
				Talk(1, "", "Th阨 gian gi穘 c竎h gi鱝 hai l莕 tr錸g c﹜ l? <color=yellow>" .. PLANT_TREE_INTERVAL .. " gi﹜.");
				return 0;
			end
		end
	end
-----可以种树了------------------------------------------------------------------
	local selTab = {
				"H穣 mau tr錸g c﹜/plantTree",
	 			"Sau n祔 tr錸g s? t鑤 h琻!/doNothing"
	 		}
	Say("Чi hi謕 mu鑞 tr錸g c﹜?", getn(selTab), selTab);		 
end

---------------------------
--plantTree()
--种树操作
---------------------------
function plantTree()
	local nDate = tonumber(date("%y%m%d"));
-----删除身上的一个树种-------------------------------------------------------------------------
	if DelItem(2, 1, 30075, 1) == 1 then
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
		WriteLogEx("Hoat dong thang 4","tr錸g c﹜",1,TREE_TYPE[nTreeType][2])
		if npcTreeIndex == 0 then
			WriteLog("[Ho箃 ng tr錸g c﹜ th竛g 4  sai s鉻]:"
								..GetName..
								"Trong l骳 tr錸g c﹜, CreatNpc h祄 s? tr? v? 0. Nh藀 tham s? CreateNPC l?:"
								 ..TREE_TYPE[nTreeType][1]..", " ..GetName().. " tr錸g "
								  ..TREE_TYPE[nTreeType][2].. ", " ..nMapID.. "," ..nMapX.. "," ..nMapY);
		end

-----如果获得白金树，则向全世界发公告
		if nTreeType == 5 then
			AddGlobalNews("Ch骳 m鮪g  "..GetName().." Х nh薾 頲." .. "C﹜ B筩h Kim" .. "T筰".. CITY_NAME_ID[GetWorldPos()]);
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
		SetNpcScript(npcTreeIndex, "\\script\\online\\viet_2009_4\\planttrees\\tree_npc.lua");
		SetTask(TASK_PLANT_TREE_DATE, nDate);
		SetTask(TASK_PLANT_TREE_COUNT, GetTask(TASK_PLANT_TREE_COUNT) + 1);
		SetTask(TASK_PLANT_TREE_TIME, GetTime());
		Say("H玬 nay, y l? l莕 th? <color=yellow>"..GetTask(TASK_PLANT_TREE_COUNT).."<color> l莕 tr錸g c﹜, h玬 nay c遪 c? th? tr錸g <color=yellow>"..PLANT_TREE_LIMIT - GetTask(TASK_PLANT_TREE_COUNT).."<color> c﹜. N誹 nh? " .. TREE_PARAM[1][2] .. " gi﹜ kh玭g ti nc, c﹜ s? t? ng ch誸 甶.", 0);
	end
end