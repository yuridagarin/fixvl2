--每个包的固定奖励如下
--4本实战心得
--20点师门贡献度
--1个宝石包裹
--每个包的随机奖励如下
--1个消劫散——10%（每开5个包必得）
--1个磐龙璧——10%（每开10个包必得）
--1颗随机6级灵石——10%（每开10个包必得）
--1张7级灵石配方——10%（每开10个包必得）
--1颗随机7级灵石——每开10个包必得
Include("\\script\\lib\\lingshi_head.lua");
Include("\\script\\biwudahui\\tournament\\tournament_head.lua");
function OnUse(nItemIdx)
	use(nItemIdx);
end;

function use(nItemIdx)
	local nUseTime = GetTask(TSK_USE_GLORY_BAG_TIME);
	if gf_JudgeRoomWeight(6,50,"") == 1 then
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
	if mod(nUseTime,10) == 0 then	--1颗随机7级灵石——每开10个包必得
		lspf_AddLingShiInBottle(7,1);
		Msg2Player("Nh薾 頲 1 Linh th筩h c蕄 7,  b? v祇 T? Linh nh");
	end;
	Msg2Player("Зy l? l莕 th? "..nUseTime.." l莕 d飊g T骾 vinh d? Чi h閕 t? v?");
	WriteLog("[T骾 vinh d? Чi h閕 t? v鈃:"..GetName().."th?"..nUseTime.." l莕 d飊g T骾 vinh d? Чi h閕 t? v?");
end;

function nothing()

end;