Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
g_ItemName = "Trung Hoa Ph骳 bao";
g_NeedRoom = 16;
g_NeedWeight = 200;
TSK_COUNTER = 562;

function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;	--当前是第几次开启
	local nRoute = GetPlayerRoute();
	if gf_JudgeRoomWeight(g_NeedRoom,g_NeedWeight) == 1 then
		if DelItemByIndex(nItemIdx,1) == 1 then
			SetTask(TSK_COUNTER,nCurCount);
			local nRand = 0;
			local nRetCode,nItemIdx = 0,0;
			AddItem(2,1,1000,2);
			Msg2Player("Nh薾 頲 2 B祅 Long B輈h");
			AddItem(2,1,1090,1);
			Msg2Player("B筺 nh薾 頲 1 C秈 ");
			if GetPlayerRoute() ~= 0 then	
				SetTask(336,GetTask(336)+25);	--师门贡献度25
				Msg2Player("B筺 nh薾 頲 25 甶觤 c鑞g hi課 s? m玭");
			end
			ModifyReputation(50,0);	--声望50			
			nRand = random(1,100);
			if nRand <= 60 then
				AddItem(2,0,597,3);
				Msg2Player("B筺 t 頲 3 Sinh Vi猲 Ch鴑g Th?");			
			elseif nRand <= 90 then
				AddItem(2,0,598,3);
				Msg2Player("B筺 t 頲 3 T? T礽 Ch鴑g Th?");			
			else
				AddItem(2,0,599,3);
				Msg2Player("B筺 t 頲 3 C? Nh﹏ ch鴑g th?");			
			end;			
			give_item(2,0,141,1,"1 Ti猽 Ki誴 t竛",10,4,0);  --1个消劫散，10%且每开4个包必给1个
			give_item(2,1,3219,1,"1 Nguy謙 Hoa tinh",5,10,0); --1个月华之精,5%且每开10个包必给1个
			add_lingshi(6,1,5,15,0);	--随机6级灵石1颗,5%且每开15个包必给1个	
			--以下需要发全服公告
			add_peifang(7,1,2,30,1);	--随机7级灵石配方1张,2%且每开30个包必给1个
			add_lingshi(7,1,0.5,50,1);	--随机7级灵石1颗,0.5%且每开50个包必给1个
			give_item(2,1,3331,15,"15 Tam Di謚 Long Hi",0.2,80,1);	--三耀龙爔,0.2%且每开80个包必给15个
			give_item(2,1,3206,1,"1V? L﹎ b秓 甶觧",0.1,160,1);--武林宝典1本,0.1%且每开160个包必给1个
			give_item(2,0,1028,1,"1 Rng v祅g Th辬h Th?",0.2,200,1); --1个盛世金宝箱0.2%且每开200个包必给1个
			--以下需要发全服公告和滚屏公告
			give_item(2,1,1005,1,"1 Chi課 Th莕 ho祅",0.02,480,2); --1个战神丸0.02%且每开480个包必给1个
			give_item(2,1,1146,1,"1 Vi猰 Ho祅g Thi誸 h錸",0.01,1600,2);	--炎黄铁魂1个,0.01%且每开1600个包必给 1个
			Msg2Player("Зy l? l莕 th? "..nCurCount.." m? "..g_ItemName);
			WriteLog("["..g_ItemName.."]:"..GetName().."th?"..nCurCount.." m? "..g_ItemName);
		end;
	else
		Talk(1,"","Kho秐g tr鑞g ho芻s鴆 l鵦c馻 b筺 kh玭g . Xin ki觤 tra l筰 h祅h trang trc!"..g_ItemName.."!");
	end;
end;
--系统提示及日志。第二个参数填1表示发全服务器系统消息，填2表示发全服务器系统消息和全服务器滚动信息。
function show_msg(szItemName,bGlobalMsg)
	Msg2Player("B筺 nh薾 頲 "..szItemName);
	if bGlobalMsg == 1 then
		Msg2Global(get_name().."M? '"..g_ItemName.." nh薾 頲 "..szItemName);
	elseif bGlobalMsg == 2 then
		Msg2Global(get_name().."M? '"..g_ItemName.." nh薾 頲 "..szItemName);
		AddGlobalNews(get_name().."M? '"..g_ItemName.." nh薾 頲 "..szItemName);
	end;
	WriteLog("["..g_ItemName.."]:"..GetName().."Nh薾 頲"..szItemName);	
end;
--给镇派残篇的函数
function give_zpcp(tbZPCP,nCount)
	local nRoute = GetPlayerRoute();
	local nRand = random(1,getn(tbZPCP[nRoute]));
	local nId1 = tbZPCP[nRoute][nRand][2];
	local nId2 = tbZPCP[nRoute][nRand][3];
	local nId3 = tbZPCP[nRoute][nRand][4];
	local szName = tbZPCP[nRoute][nRand][1];		
	AddItem(nId1,nId2,nId3,nCount);		
	show_msg(szName,1);
end;
--给物品，参数依次为：物品ID1,物品ID2,物品ID3,数量，物品名字，概率，必给的次数，是否发全服公告，有限天数
function give_item(nID1,nID2,nID3,nCount,szItemName,nP,nModCount,bGlobalMsg,nDate)
	local nCurCount = GetTask(TSK_COUNTER);
	local nRetCode,nItemIdx = 0,0;
	local nRetResult = 0;
	if gf_ProbabilityJudge(nP) == 1 then 
		nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,nCount);
		if nDate ~= nil then
			SetItemExpireTime(nItemIdx,nDate*24*3600);
		end;
		show_msg(szItemName,bGlobalMsg);
		nRetResult = 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,nCount);
		show_msg(szItemName,bGlobalMsg);
		if nDate ~= nil then
			SetItemExpireTime(nItemIdx,nDate*24*3600);
		end;
		nRetResult = 1;
	end;
	return nRetResult;
end;

function give_chest_key(nID1,nID2,nID3,nCount,szItemName,nP,nModCount,bGlobalMsg,nDate)
	local nCurCount = GetTask(TSK_COUNTER);
	local nRetCode,nItemIdx = 0,0;
	if gf_ProbabilityJudge(nP) == 1 then 
		nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,nCount);
		if nDate ~= nil then
			SetItemExpireTime(nItemIdx,nDate*24*3600);
		end;
		show_msg(szItemName,bGlobalMsg);
		return 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,nCount);
		show_msg(szItemName,bGlobalMsg);
		if nDate ~= nil then
			SetItemExpireTime(nItemIdx,nDate*24*3600);
		end;
		return 1;
	end;
	return 0;
end;
--给灵石。参数：等级，数量，概率，必给的次数，是否发全服公告：0不发，1发
function add_lingshi(nLevel,nCount,nP,nModCount,bGlobalMsg)
	if bGlobalMsg == nil then
		bGlobalMsg = 1;	--默认发全服公告
	end;
	local nCurCount = GetTask(TSK_COUNTER);
	local nRetCode,nItemIdx = 0,0;
	local nRetResult = 0;
	if gf_ProbabilityJudge(nP) == 1 then 
		lspf_AddLingShiInBottle(nLevel,nCount);
		show_msg(nCount.." "..nLevel.." (c蕄) Linh Th筩h",bGlobalMsg);
		nRetResult = 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		lspf_AddLingShiInBottle(nLevel,nCount);
		show_msg(nCount.." "..nLevel.." (c蕄) Linh Th筩h",bGlobalMsg);
		nRetResult = 1;
	end;
	return nRetResult;
end;
--给灵石配方。参数：等级，数量，概率，必给的次数
function add_peifang(nLevel,nCount,nP,nModCount,bGlobalMsg)
	if bGlobalMsg == nil then
		bGlobalMsg = 1;	--默认发全服公告
	end;
	local nCurCount = GetTask(TSK_COUNTER);
	local nRetCode,nItemIdx = 0,0;
	local nRetResult = 0;
	if gf_ProbabilityJudge(nP) == 1 then 
		lspf_AddPeiFangInBottle(nLevel,nCount);
		show_msg(nCount.."Trng"..nLevel.." (c蕄)-linh th筩h ph鑙 phng.",bGlobalMsg);
		nRetResult = 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		lspf_AddPeiFangInBottle(nLevel,nCount);
		show_msg(nCount.."Trng"..nLevel.." (c蕄)-linh th筩h ph鑙 phng.",bGlobalMsg);
		nRetResult = 1;
	end;
	return nRetResult;
end;

function add_zpcp(tbZPCP,nCount,nP,nModCount)
	local nCurCount = GetTask(TSK_COUNTER);
	local nRetResult = 0;
	if gf_ProbabilityJudge(nP) == 1 then 
		give_zpcp(tbZPCP,nCount);
		nRetResult = 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		give_zpcp(tbZPCP,nCount);
		nRetResult = 1;
	end;
	return nRetResult;
end;

function add_horse(nP,nModCount)
	local nCurCount = GetTask(TSK_COUNTER);
	local szItemName = "";
	local nRetResult = 0;
	if gf_ProbabilityJudge(nP) == 1 then 		--奔宵或腾雾随机1匹
		if random(1,2) == 1 then
			szItemName = "1 B玭 ti猽";
			AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,2)
		else
			szItemName = "1 Щng V?";
			AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,2)
		end;
		nRetResult = 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		if random(1,2) == 1 then
			szItemName = "1 B玭 ti猽";
			AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,2)
		else
			szItemName = "1 Щng V?";
			AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,2)
		end;	
		nRetResult = 1;		
	end;
	return nRetResult;
end;

function get_name()
	local szName = "Чi hi謕";
	return szName;
end;

function nothing()

end;