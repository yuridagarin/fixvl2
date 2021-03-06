--每个包的固定奖励如下
--4本实战心得
--20点师门贡献度
--1个宝石包裹
--每个包的随机奖励如下
--1个消劫散——10%（每开5个包必得）
--1个磐龙璧——10%（每开10个包必得）
--1颗随机6级灵石——10%（每开10个包必得）
--1张7级灵石配方——10%（每开10个包必得）
--50个太易混元功图鉴（2,0,1082）——99级每开20个包必得
--3本师门高级秘籍——每开40个包必得
--1个炎黄铁魂——每开100个包必得
Include("\\script\\lib\\lingshi_head.lua");
Include("\\script\\lib\\globalfunctions.lua");
TSK_USE_GLORY_BAG_TIME = 593;

function OnUse(nItemIdx)
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"","Ngi kh玭g m玭 ph竔 kh玭g th? d飊g T骾 vinh d? Чi h閕 t? v?.");
		return 0;
	end;
	use(nItemIdx);
end;

function use(nItemIdx)
	local nUseTime = GetTask(TSK_USE_GLORY_BAG_TIME);
	if gf_JudgeRoomWeight(11,150,"") == 1 then
		if DelItemByIndex(nItemIdx,1) == 1 then
			get_item();
			get_random_item(nUseTime+1);
			SetTask(TSK_USE_GLORY_BAG_TIME,nUseTime+1);
		end;
	end;
end;

function get_item()
	AddItem(2,1,1101,4);--4本实战心得
	Msg2Player("Nh薾 頲 4 quy觧 Th鵦 Chi課 T﹎ Ьc");
	SetTask(336,GetTask(336)+20);--20点师门贡献度
	Msg2Player("Nh薾 頲 20 甶觤 c鑞g hi課 s? m玭");
	AddItem(2,1,2642,1);--1个宝石包裹
	Msg2Player("Nh薾 頲 1 T骾 b秓 th筩h");
end;

function get_random_item(nUseTime)
	local nLevel = GetLevel();
	local nRand = random(1,100);
	if nRand <= 10 then	--1个消劫散——10%（每开5个包必得）
		AddItem(2,0,141,1);
		Msg2Player("Nh薾 頲 1 Ti猽 Ki誴 T竛");
	end;
	if mod(nUseTime,5) == 0 then
		AddItem(2,0,141,1);
		Msg2Player("Nh薾 頲 1 Ti猽 Ki誴 T竛");
	end;
	--================================================================
	nRand = random(1,100);
	if nRand <= 10 then	--1个磐龙璧——10%（每开10个包必得）
		AddItem(2,1,1000,1);
		Msg2Player("B筺 nh薾 頲 1 B祅 Long B輈h");
	end;
	if mod(nUseTime,10) == 0 then
		AddItem(2,1,1000,1);
		Msg2Player("B筺 nh薾 頲 1 B祅 Long B輈h");
	end;
	--================================================================
	nRand = random(1,100);
	if nRand <= 10 then	--1颗随机6级灵石——10%（每开10个包必得）
		lspf_AddLingShiInBottle(6,1);
		Msg2Player("Nh薾 頲 1 Linh th筩h c蕄 6,  b? v祇 T? Linh nh");
	end;
	if mod(nUseTime,10) == 0 then
		lspf_AddLingShiInBottle(6,1);
		Msg2Player("Nh薾 頲 1 Linh th筩h c蕄 6,  b? v祇 T? Linh nh");
	end;
	--================================================================
	nRand = random(1,100);
	if nRand <= 10 then	--1张7级灵石配方——10%（每开10个包必得）
		lspf_AddPeiFangInBottle(7,1);
		Msg2Player("Nh薾 頲 1 Linh th筩h ph鑙 ch? c蕄 7,  b? v祇 T? Linh nh");
	end;
	if mod(nUseTime,10) == 0 then
		lspf_AddPeiFangInBottle(7,1);
		Msg2Player("Nh薾 頲 1 Linh th筩h ph鑙 ch? c蕄 7,  b? v祇 T? Linh nh");
	end;
	--================================================================
	if mod(nUseTime,20) == 0 and nLevel == 99 then	--50个太易混元功图鉴（2,0,1082）
		AddItem(2,0,1082,50);
		Msg2Player("Nh薾 頲 50 Th竔 D辌h H鏽 Nguy猲 C玭g у");
	end;
	--================================================================
	if mod(nUseTime,40) == 0 then	--3本师门高级秘籍——每开40个包必得
		give_book(3);
	end;
	--================================================================
	if mod(nUseTime,100) == 0 then	--1个炎黄铁魂——每开100个包必得
		AddItem(2,1,1146,1);
		Msg2Player("Nh薾 頲 1 Vi猰 Ho祅g Thi誸 H錸");
	end;
	Msg2Player("Зy l? l莕 th? "..nUseTime.." l莕 d飊g T骾 vinh d? Чi h閕 t? v?");
	WriteLog("[T骾 vinh d? Чi h閕 t? v? l莕 2]:"..GetName().."th?"..nUseTime.." l莕 d飊g T骾 vinh d? Чi h閕 t? v?");
end;

g_tbBook = 
{
	[2] = {"Kim Cang B竧 Nh? Kinh",0,107,166},	--少林俗家
	[4] = {"Ti襪 Long T辌h Di謙 Kinh",0,107,167}, --少林武僧
	[3] = {"V? Tr莕 B? б Kinh",0,107,168}, --少林禅僧
	[6] = {"Thi猲 La Li猲 Ch﹗ L鬰",0,107,169}, --唐门
	[8] = {"Nh? ? Kim жnh M藅 T辌h",0,107,170}, --峨嵋佛家
	[9] = {"B輈h H秈 Tuy謙  Ph? ",0,107,171}, --峨嵋俗家
	[11] = {"H鏽 чn Tr蕁 Nh筩 M藅 T辌h",0,107,172}, --丐帮净衣
	[12] = {"Qu? Thi猲 Du Long M藅 T辌h",0,107,173}, --丐帮污衣
	[14] = {"Huy詎 秐h M? Tung M藅 T辌h",0,107,174}, --武当道家
	[15] = {"Qu﹏ T? Ti謙 Phong M藅 T辌h",0,107,175}, --武当俗家
	[17] = {"Tr蕁 Qu﹏ Phi Long Thng Ph?",0,107,176}, --杨门枪骑
	[18] = {"Xuy猲 V﹏ L筩 H錸g M藅 T辌h",0,107,177}, --杨门弓骑
	[20] = {"U Minh Phong Ma L鬰",0,107,178}, --五毒邪侠
	[21] = {"Linh C? Huy詎 T? L鬰",0,107,179}, --五毒蛊师
	[23] = {"C鰑 Thi猲 Phong L玦 Quy誸",0,107,198},	
	[29] = {"H錸g Tr莕 T髖 M閚g Ph?",0,107,202},
	[30] = {"Phong Hoa Thi猲 Di謕 Ph?",0,107,203},	
}

function give_book(nNum)
	local nRoute = GetPlayerRoute();
	local tbBook = g_tbBook[nRoute];
	if not tbBook then
		return 0;
	end;
	local nID1,nID2,nID3 = tbBook[2],tbBook[3],tbBook[4];
	local szName = tbBook[1];
	AddItem(nID1,nID2,nID3,nNum,4);
	Msg2Player(format("Nh薾 頲 %d quy觧 %s",nNum,szName));
end;

function nothing()

end;