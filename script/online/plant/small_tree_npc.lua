Include("\\script\\online\\plant\\tree_head.lua");
--越南09年7月活动开关头文件
Include("\\script\\online\\viet_event\\200907\\eventopen.lua");
Include("\\script\\lib\\globalfunctions.lua");
--越南09年12月活动头文件
Include("\\script\\online\\viet_event\\200912\\event_head.lua");
--所有活动给种树奖励的统一头文件
Include("\\script\\online_activites\\award.lua");
Include("\\script\\online\\plant\\guoshi13_24.lua");
Include("\\script\\online\\viet_event\\award\\award_head.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")	
Include("\\script\\vng\\award\\feature_award.lua");

function main()
	local npcIdx,npcModel,npcName = GetTriggeringUnit();
	if npcIdx == 0 then
		WriteLog("[L鏸 ho箃 ng tr錸g c﹜ Th竔 H璢:"..GetName().."Khi ti nc, GetTriggeringUnit th? 1, tr? quay l筰 l? 0");
		return 0;
	end;
	local nNameLen = strlen(GetName());
	local bJudgeByName = 0;
	if GetName() == strsub(npcName,1,nNameLen) then
		bJudgeByName = 1;
	end;
	local bIsTree = 0;
	for i=1,getn(SMALLTREETYPE) do	--这个是用来检查目标NPC是不是树，不过感觉好像没什么意义
		if npcModel == SMALLTREETYPE[i][1] then
			bIsTree = 1;
			break;
		end;
	end;
	if bIsTree == 0 then
		SetNpcScript(npcIdx,"");
		WriteLog("[L鏸 ho箃 ng tr錸g c﹜ Th竔 H璢:NPC:"..npcName.."L鏸 files g鑓");
		return 0;
	end;
	local npcTreeIndex = GetTargetNpc();
	if npcTreeIndex == 0 then
		 WriteLog("[L鏸 ho箃 ng tr錸g c﹜ Th竔 H璢:"..GetName().."Khi ti nc, GetTargetNpc tr? quay l筰 l? 0");
		 return 0;
	end;
	if bJudgeByName == 0 then
		if GetTime() - GetTask(TASK_PLANTTIME_SMALL) > TREELIFETIME or GetTask(TASK_PLANTTIME_SMALL) == 0 or npcTreeIndex ~= GetTask(TASK_TREEINDEX_SMALL) then
			Msg2Player("Зy kh玭g ph秈 l? c﹜ b筺 tr錸g");
			return 0;
		end;
	end;
	local nTreeGrow = GetTask(TASK_TREEGROW_SMALL);
	local nTimePassed = GetTime() - GetTask(TASK_PLANTTIME_SMALL);
	if nTreeGrow < 3 then
		if nTimePassed < SMALLTREETYPE[nTreeGrow][3] then
			Talk(1,"",SMALLTREETYPE[nTreeGrow][2].." sinh trng r蕋 t鑤, t筸 th阨 kh玭g c莕 ti nc nh璶g kh玭g n猲 甶 qu? xa, n誹 sau <color=yellow>"..Get_Time_String(TREELIFETIME-GetTime()+GetTask(TASK_PLANTTIME_SMALL)).."<color> sau kh玭g ti, c﹜ s? thi誹 nc m? ch誸. Th阨 gian ti nc l莕 sau c遪 <color=yellow>"..Get_Time_String(SMALLTREETYPE[nTreeGrow][3]-nTimePassed).."<color>.");
			return 0;
		end;
	end;
	local sSaySth = "";
	local selTab = {};
	if nTreeGrow == 3 then
		if nTimePassed < SMALLTREETYPE[nTreeGrow][3] then
			Talk(1,"",SMALLTREETYPE[nTreeGrow][2].." v鮝 m韎 ph竧 tri觧, kh玭g n猲 nh? c﹜, sau <color=yellow>"..Get_Time_String(SMALLTREETYPE[nTreeGrow][3]-nTimePassed).."<color> h穣 nh?.");
			return 0;
		end;
		tinsert(selTab,"H穣 nh? c﹜ 甶! Tr錸g ti誴 n? c騨g kh玭g ph竧 tri觧./getfruit");
		tinsert(selTab,"Sau n祔 h穣 nh?!/nothing");
		sSaySth = "H箃 Th竔 H? nh? ch? c? th? ph竧 tri觧 th祅h c﹜ Th竔 H? nh?! B﹜ gi? nh? c﹜ c? th? nh薾 頲 qu? b蕋 ng?! C? mu鑞 nh? c﹜? N誹 sau <color=yellow>"..Get_Time_String(TREELIFETIME-GetTime()+GetTask(TASK_PLANTTIME_SMALL)).."<color> sau kh玭g nh? th? c﹜ s? ch誸!";
	else
		tinsert(selTab,"Ti nc (c莕 "..SMALLTREETYPE[nTreeGrow+1][4].." ph莕 L? Th駓)/givewater");
		tinsert(selTab,"Sau n祔 h穣 ti./nothing");
		sSaySth = SMALLTREETYPE[nTreeGrow][2].." 產ng c莕 ti L? Th駓, c? mu鑞 ti kh玭g? N誹 sau <color=yellow>"..Get_Time_String(TREELIFETIME-GetTime()+GetTask(TASK_PLANTTIME_SMALL)).."<color> kh玭g ti th? c﹜ thi誹 nc m? ch誸.";
	end;
	
	Say(sSaySth,getn(selTab),selTab);
end;

function givewater()
	local nTreeGrow = GetTask(TASK_TREEGROW_SMALL);
	local npcTreeIndex = GetTask(TASK_TREEINDEX_SMALL);
	if npcTreeIndex == 0 then
		WriteLog("[L鏸 ho箃 ng tr錸g c﹜ Th竔 H璢:"..GetName().."L骳 ti nc, TASK_TREEINDEX bi課 lng nhi謒 v? l? 0");
		return 0;
	end;	
	if DelItem(2,0,351,SMALLTREETYPE[nTreeGrow+1][4]) ~= 1 then
		Talk(1,"","Kh玭g  L? Th駓!");
		return 0;
	end;
	local MapID,MapX,MapY = GetNpcWorldPos(npcTreeIndex)
	SetNpcLifeTime(npcTreeIndex,0);
	SetNpcScript(npcTreeIndex,"");
	npcTreeIndex = CreateNpc(SMALLTREETYPE[nTreeGrow+1][1],GetName().." tr錸g "..SMALLTREETYPE[nTreeGrow+1][2],MapID,MapX,MapY);
	if npcTreeIndex == 0 then
		WriteLog("[L鏸 ho箃 ng tr錸g c﹜ Th竔 H璢:"..GetName().."L骳 ti c﹜, tr? quay l筰 h祄 s? CreateNpc l? 0. Tham s? nh藀 CreateNpc:"..SMALLTREETYPE[nTreeGrow+1][1]..","..GetName().." tr錸g "..SMALLTREETYPE[nTreeGrow+1][2]..","..MapID..","..MapX..","..MapY);
	end;
	SetNpcLifeTime(npcTreeIndex,TREELIFETIME);
	SetNpcScript(npcTreeIndex,"\\script\\online\\plant\\small_tree_npc.lua")
	SetTask(TASK_TREEINDEX_SMALL,npcTreeIndex);
	SetTask(TASK_TREEGROW_SMALL,nTreeGrow+1);
	SetTask(TASK_PLANTTIME_SMALL,GetTime());
	local nTimePassed = GetTime() - GetTask(TASK_PLANTTIME_SMALL);
	local nTreeGrow = GetTask(TASK_TREEGROW_SMALL);
	if nTreeGrow ==3 then
		StartTimeGuage("Thu ho筩h",SMALLTREETYPE[nTreeGrow][3]-nTimePassed,0,1)			
	else
		StartTimeGuage("Ti c﹜",SMALLTREETYPE[nTreeGrow][3]-nTimePassed,0,1)	
	end
end;

function getfruit()
	if GetTask(TASK_TREEGROW_SMALL) == 3 then
		local npcTreeIndex = GetTargetNpc();
		if npcTreeIndex == 0 then
			 WriteLog("[L鏸 ho箃 ng tr錸g c﹜ Th竔 H璢:"..GetName().."L骳 nh? c﹜, GetTargetNpc tr? quay l筰 l? 0");
			 return 0;
		end;
		SetNpcScript(npcTreeIndex,"");
		SetNpcLifeTime(npcTreeIndex,0);
		SetTask(TASK_TREEINDEX_SMALL,0);
		SetTask(TASK_TREEGROW_SMALL,0);
		SetTask(TASK_PLANTTIME_SMALL,0);
		ModifyExp(100000);	--十万经验
		Msg2Player("B筺 nh薾 頲 100000 甶觤 kinh nghi謒");
		local nRandomNum = 0;
		nRandomNum = random(1,100);
		if nRandomNum <= 20 then
			ModifyExp(100000);	--十万经验
			Msg2Player("B筺 nh薾 頲 100000 甶觤 kinh nghi謒");
			WriteLog("[Ho箃 ng tr錸g c﹜ Th竔 H璢:"..GetName().."Nh薾 頲 100000 甶觤 kinh nghi謒");
		end;
		nRandomNumSuper = random(1,100);
		if nRandomNumSuper <=80 then
			nRandomNum = random(1,100);
			if nRandomNum <= 20 then
				if AddItem(2,2,7,1,4) == 1 then
					Msg2Player("B筺 nh薾 頲 1 m秐h Thi猲 Th筩h");
					WriteLog("[Ho箃 ng tr錸g c﹜ Th竔 H璢:"..GetName().."Nh薾 頲 1 m秐h Thi猲 Th筩h");
				end;		
			end;
			
			
			nRandomNum = random(1,100);
			if nRandomNum <= 5 then
				local nWhat = random(469,476);
				if AddItem(2,1,nWhat,1,4) == 1 then
					Msg2Player("B筺 nh薾 頲 1 Th竔 H? B竧 Qu竔 B礽");
					WriteLog("[Ho箃 ng tr錸g c﹜ Th竔 H璢:"..GetName().."Nh薾 頲 1 Th竔 H? B竧 Qu竔 B礽");
				end;		
			end;

			nRandomNum = random(1,100);
			if nRandomNum <=5  then
				if AddItem(2,1,473,2) == 1 then
					Msg2Player("B筺 nh薾 頲 1 Th竔 H? B竧 Qu竔 B礽-Li");
					WriteLog("[Ho箃 ng tr錸g c﹜ Th竔 H璢:"..GetName().."Nh薾 頲 1 Th竔 H? B竧 Qu竔 B礽-Li");
				end;		
			end;
		else
			local nRetCode, nIndex = gf_AddItemEx({2, 1, 30114, 1}, "B竧 Nh? Ch鴑g Th?");
			if nRetCode == 1 then
				SetItemExpireTime(nIndex, 15 * 24 * 3600);
				WriteLogEx("Uy thac trong cay", "Trong cay Bat Nha nho", 1, "Bat Nha Chung Thu");
			end
		end
		--Give_YuanXiao_Award(1);
		
		--给09年6月7月活动陈旧密本奖励
		--give_viet20090607_miben();
		--给09年8月活动水果袋奖励
		--give_viet200908_shuiguodai();
		--给09年9月中秋活动白面包奖励
		--give_viet200909_baimianbao();
		--give_viet200911_hoacuc()
          -- give_viet200912_shengdantangguo()
         --  Give_XiaoBanRuoShu_Award();
         -- Give_Fruit_Award();
         --  VietSmallFruit_Award();
         --  ThuHoachBatNhaNho();
           --IP Bonus
		--Give_IpBonus_SmallTree()
		
--           if GetTask(TASK_PLAN_SMALLTREE_COUNT) == 8 then
--           	local nGroup = fruitcheckserver()
--			gf_AddItemEx2({tFruitAwardJune2010[nGroup][6][1], tFruitAwardJune2010[nGroup][6][2], tFruitAwardJune2010[nGroup][6][3], 2}, tFruitAwardJune2010[nGroup][7], "Trong Bat Nha Nho", "nh薾 khi tr錸g 8 c﹜")
--           end
           
           --Bang h閕 tinh anh 6 , ngu錸 ra hoa h錸g
           if (GetTask(TASK_PLAN_SMALLTREE_COUNT) == 8 or GetTask(TASK_PLAN_SMALLTREE_COUNT) == 16) and tonumber(date("%Y%m%d")) >= 20110930 and tonumber(date("%Y%m%d")) <= 20111023 then
           	gf_AddItemEx2({2, 0, 1164, 20, 1}, "Hoa H錸g Ph蕁", "Bang Hoi Tinh Anh 6", "tr錸g B竧 Nh? Nh?")
           end
	     --nhi謒 v? l祄 gi祏
	     if CFG_NhiemVuLamGiau == 1 then
		     if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 7) == 0 then
		     		gf_SetTaskBit(TSK_LAMGIAU, 7, 1, 0)
		     		TaskTip("Ho祅 th祅h nhi謒 v? l祄 gi祏: Tr錸g th祅h c玭g 01 B竧 Nh? Nh?.")
		     end
		end
		-----------------------Chu鏸 nhi謒 v? уng H祅h
		if CFG_NhiemVuDongHanh == 1 then
			if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 18 then
				if DongHanh_GetMissionPart() > 0 then
					DongHanh_SetMissionPart()
					if DongHanh_GetMissionPart() == 0 then
						DongHanh_SetStatus()
					end
				end
			end
		end
  		-- Nhi謒 v? Chuy觧 Sinh 3        	
          	if GetTask(TRANSLIFE_MISSION_ID) == 19 and gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK3) < 128 then
			gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK3, gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK3) +1)
			if gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK3) == 128 then
				TaskTip("Ho祅 th祅h y猽 c莡 c馻 Фo Ch? Уo Hoa Фo 128 l莕 tr錸g th祅h c玭g B竧 Nh? Nh?")
			end
		end
		
		-- Nhi謒 v? Chuy觧 Sinh 4
		if GetTask(TRANSLIFE_MISSION_ID) == 26 and gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK3) < 32 then
			gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK3, gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK3) +1)
			if gf_GetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK3) == 10 then
				gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK3, 0)
				gf_SetTaskByte(TRANSLIFE_TASK_34_FLAG, TRANSLIFE_BYTE_TASK3, gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK3) +1)
			end
			if gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK3) == 32 then
				TaskTip("Ho祅 th祅h y猽 c莡 c馻 B筩h Ti猲 Sinh 320 l莕 tr錸g th祅h c玭g B竧 Nh? Nh?")
			end
		end
		
		-- Nhi謒 v? chuy觧 sinh 5
	if GetTask(TRANSLIFE_MISSION_ID) == 34 and gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK3) < 32 then
		gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK3, gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK3) +1)
		if gf_GetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK3) == 10 then
			gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK3, 0)
			gf_SetTaskByte(TRANSLIFE_TASK_34_FLAG, TRANSLIFE_BYTE_TASK3, gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK3) +1)
		end
		if gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK3) == 32 then
			TaskTip("Ho祅 th祅h y猽 c莡 c馻 B筩h Ti猲 Sinh 320 l莕 tr錸g th祅h c玭g C﹜ B竧 Nh? Nh?")
		end
	end
		
		if GetTask(TASK_PLAN_SMALLTREE_COUNT) > 3 then
	           local nLastLingshuDate = GetTask(85)
	           local nMultiCount = GetTask(86)
			local nDate = tonumber(date("%Y%m%d"))
			local nSMPoint = 5
			if nDate >= 20100821 and nDate <= 20100822 then
				nSMPoint = 10
			end
	           if nLastLingshuDate == nDate then
	           	local nBonusExp = nMultiCount * nSMPoint
	           	SetTask(336, GetTask(336) + nBonusExp)
	           	Msg2Player("Nh薾 頲 "..nBonusExp.." 甶觤 c鑞g hi課 S? M玭.")
	           else
				SetTask(86, 1)
				SetTask(336, GetTask(336) + nSMPoint)
	           	Msg2Player("Nh薾 頲 "..nSMPoint.." 甶觤 c鑞g hi課 S? M玭.")
			end
		end
	end;
end;

function Give_Fruit_Award()
--		gf_AddItemEx2({2, 1, 30165, 1}, "Ch玬 Ch玬","Hoat dong thang 4 nam 2010","Ph莕 thng tr錸g c﹜ b竧 nh? nh?");
	if GetTask(TASK_PLAN_SMALLTREE_COUNT) >= 9 then
		local nGroup = fruitcheckserverNov()
		if nGroup == 0 then
			nGroup = mod(random(0,1000),20) + 1
		end
		gf_AddItemEx2(tFruitAwardNov2010[nGroup][6], tFruitAwardNov2010[nGroup][7], "Trong Bat Nha Nho", "nh薾 khi tr錸g 1 c﹜")
	end
end

function nothing()

end;

--给09年6月7月陈旧密本奖励
function give_viet20090607_miben()
	if EventOpen0906() == 0 then
		return
	end
	if tonumber(date("%y%m%d%H")) >= 09061900 and tonumber(date("%y%m%d%H")) < 09071924 then
		gf_SetLogCaption("Truy t譵 trng sinh ph?");
		gf_AddItemEx({2, 1, 30088, 100}, "B? Ph? C? N竧");
		WriteLogEx("Hoat dong thang 6","B竧 Nh? Nh?",100,"B? Ph? C? N竧");
		gf_SetLogCaption("");
	end
end

--给09年8月活动水果袋奖励
function give_viet200908_shuiguodai()
	if tonumber(date("%y%m%d")) >= 090807 and tonumber(date("%y%m%d")) < 090907 then
		gf_SetLogCaption("[Hoat dong thang 8]");
		nRet = gf_AddItemEx({2, 1, 30097, 100}, "T骾 Tr竔 C﹜");
		if nRet == 1 then
			WriteLogEx("Hoat dong thang 8","Nhan tui trai cay",100,"Trong cay bat nha nho");
		end
		gf_SetLogCaption("");
	end
end

--给09年9月中秋活动白面包奖励
function give_viet200909_baimianbao()
	if tonumber(date("%y%m%d")) >= 090918 and tonumber(date("%y%m%d")) < 091026 then
		gf_SetLogCaption("[Hoat dong trung thu 2009]");
		gf_AddItemEx({2, 1, 30106, 100}, "B閠 M?");
		WriteLogEx("Hoat dong trung thu","B竧 Nh? Nh?",100,"B閠 M?");
		gf_SetLogCaption("");
	end
end

function give_viet200911_hoacuc()
	if tonumber(date("%y%m%d")) >= 091106 and tonumber(date("%y%m%d")) <= 091206 then		
		gf_AddItemEx({2, 1, 30118, 20}, "Hoa C骳");
		WriteLogEx("Hoat dong thang 11","B竧 Nh? Nh?",20,"Hoa C骳");		
	end
end

--给09年12月圣诞糖果奖励
function give_viet200912_shengdantangguo()
	if tonumber(date("%y%m%d")) >= 091218 and tonumber(date("%y%m%d")) <= 100117 then
	    local szFullLog = VIET_0912_STR_EVENT_LOG_TITLE
	    gf_AddItemEx2({2, 1, 30138, 40}, "C﹜ K裲 Gi竛g Sinh", szFullLog, 0, 1, 10, 1,"B竧 Nh? nh?");
	end
end

function  Give_IpBonus_SmallTree()
	if GetExtPoint(4) == 1 then
		local nTimes = GetTask(429)
		if  nTimes >= 1 and nTimes <= 3 then
			ModifyExp(100000 )
			Msg2Player("B筺 nh薾 頲 100000 甶觤 kinh nghi謒 ")
			gf_WriteLogEx("IpBonus trong cay bat nha nho" ,"nh薾 100000 甶觤 kinh nghi謒")
		elseif  nTimes >= 4 and nTimes <= 8 then
			ModifyExp(150000 )
			Msg2Player("B筺 nh薾 頲 150000 甶觤 kinh nghi謒 ")
			gf_WriteLogEx("IpBonus trong cay bat nha nho" ,"nh薾 150000 甶觤 kinh nghi謒")
		elseif  nTimes >= 9 and nTimes <= 16 then
			ModifyExp(250000 )
			Msg2Player("B筺 nh薾 頲 250000 甶觤 kinh nghi謒 ")
			gf_WriteLogEx("IpBonus trong cay bat nha nho" ,"nh薾 250000 甶觤 kinh nghi謒")
		else
			return
		end
	end
end