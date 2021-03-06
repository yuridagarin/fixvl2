Include("\\script\\online\\qixi08\\light\\light_head.lua");

--点灯对话主入口
function aoyun_light_main()
	local szGameName,nGameID = QX08_GetTodayGame();
	if nGameID ~= GAME_ID_LIGHT then
		Talk(1,"","<color=green>c s? Чi H閕 V? l﹎<color>: H玬 nay <color=yellow>"..szGameName.."<color>ho箃 ng b総 u, th藅 th? v?.");
		return
	end;
	local strtab = {
		"H閕 th緋 n, kh玭g c? g? kh? kh╪ c?, h穣 th? xem./aoyun_light_try",
		"Quy t綾 H閕 th緋 n/aoyun_light_rule",
		"Ta n nh薾 ph莕 thng H? R閚 R祅g - Vui Ng藀 Tr祅/aoyun_light_award",
		"в ta chu萵 b?/nothing"
	};
	Say("<color=green>c s? Чi H閕 V? l﹎<color>: N鉯 giang h?, giang h? ? trong tim. в ch骳 m鮪g Чi h閕 t? v? Thi猲 h?  nh蕋, ch髇g t玦 c bi謙 c? h祅h H閕 th緋 n t? v? V? L﹎ 2 l莕 th? nh蕋, hoan ngh猲h m鋓 ngi tham gia, c祅g ng c祅g vui. Ta  chu萵 b? cho m鋓 ngi v礽 m鉵 qu?, 畂竛 tr髇g c? l蕐. Th阨 gian ho箃 ng: <color=yellow>m鏸 ch? nh藅<color> m? ho箃 ng n祔.",
		getn(strtab),
		strtab)
end

function aoyun_light_try()
	local nHour = tonumber(date("%H"));
	if nHour < 9 or nHour >= 23 then
		Talk(1,"","<color=green>c s? Чi H閕 V? l﹎<color>: Th阨 gian ho箃 ng l? <color=yellow>9h s竛g-11h t鑙<color>, v? thi誹 hi謕 n祔 mu鑞 xem gi? ch輓h x竎 ?.");
		return 0;
	end;
	local nDate = tonumber(date("%Y%m%d"));
	local nTeamSize = GetTeamSize();

	if nTeamSize ~= 0 and GetName() ~= GetCaptainName() then
		Talk(1,"","<color=green>c s? Чi H閕 V? l﹎<color>: Tham gia H閕 th緋 n c莕 i trng kh雐 ng.");
		return
	end
	--变量清0
	if nTeamSize == 0 or nTeamSize == 1 then 
		if GetTask(TSK_AOYUN_LIGHT_DATE) < nDate then
			SetTask(TSK_AOYUN_LIGHT_AWARD,0);
			SetTask(TSK_AOYUN_LIGHT_NUM,0);
			SetTask(TSK_AOYUN_LIGHT_GUAN,0);
			SetTask(TSK_AOYUN_LIGHT_DATE,nDate);
		end
	else
		local nOldPlayerIndex = PlayerIndex;
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i);
			if GetTask(TSK_AOYUN_LIGHT_DATE) < nDate then
				SetTask(TSK_AOYUN_LIGHT_AWARD,0);
				SetTask(TSK_AOYUN_LIGHT_NUM,0);
				SetTask(TSK_AOYUN_LIGHT_GUAN,0);
				SetTask(TSK_AOYUN_LIGHT_DATE,nDate);
			end			
		end
		PlayerIndex = nOldPlayerIndex;
	end
	if nTeamSize == 0 or nTeamSize == 1 then
		local nLv = GetLevel();
		if nLv <= 30 then
			Talk(1,"","<color=green>c s? Чi H閕 V? l﹎<color>: Tham gia H閕 th緋 n c莕 tr猲 c蕄 30.");
			return
		end	
--		if GetItemCount(2,0,1069) < 1 then
--			Talk(1,"","<color=green>武林大会特使<color>：参加点灯会需要<color=yellow>天下第一比武邀请函<color>。");
--			return
--		end
	else
		local nOldPlayerIndex = PlayerIndex;
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i);
			local nLv = GetLevel(); 
			if nLv	<= 30 then
				PlayerIndex = nOldPlayerIndex;
				Talk(1,"","<color=green>c s? Чi H閕 V? l﹎<color>: Tham gai H閕 th緋 n c莕 t蕋 c? i vi猲 tr猲 c蕄 30. чi ng? c馻 b筺 甶襲 ki謓 kh玭g ph? h頿.");
				return
			end			
--			if GetItemCount(2,0,1069) < 1 then
--				local nName = GetName();
--				PlayerIndex = nOldPlayerIndex;
--				Talk(1,"","<color=green>武林大会特使<color>：你的队伍中 "..nName.." 没有<color=yellow>天下第一比武邀请函<color>。");
--				return
--			end
		end
		PlayerIndex = nOldPlayerIndex;
	end
	if nTeamSize == 0 or nTeamSize == 1 then
		Say("<color=green>c s? Чi H閕 V? l﹎<color>: M閠 ngi s? c? n y, sao kh玭g r? th猰 b筺 c飊g ch琲?",
			2,
			"G鋓 th猰 b筺/nothing",
			"Кn c khi猽 chi課/aoyun_light_go");
	else
		aoyun_light_go();
	end
end

function aoyun_light_go()
	--删除门票
--	local nTeamSize = GetTeamSize();
--	if nTeamSize == 0 or nTeamSize == 1 then	
--		if DelItem(2,0,1069,1) == 1 then
--			aoyun_light_OpenMatch();
--		end
--	else
--		local nOldPlayerIndex = PlayerIndex;
--		for i=1,nTeamSize do
--			PlayerIndex = GetTeamMember(i);
--			DelItem(2,0,1069,1);
--		end
--		PlayerIndex = nOldPlayerIndex;
--		aoyun_light_OpenMatch();
--	end
		aoyun_light_OpenMatch();
end

function aoyun_light_rule()
	Talk(1,"aoyun_light_rule2","<color=green>c s? Чi H閕 V? l﹎<color>: H閕 th緋 n ph﹏ 5 秈, ph秈 th緋 theo th? t? 頲 th緋 qua. M? v祇 m鏸 ch? nh藅.\n秈 1: T鎛g c閚g 8 ng鋘, h? th鑞g s? th緋 1 lt theo th? t? ng蓇 nhi猲, ghi nh? v? th緋 theo th? t? .\n秈 2: T鎛g c閚g 8 ng鋘, h? th鑞g s? theo th? t? ng蓇 nhi猲 th緋 8 l莕 n, ghi nh? v? th緋 theo th? t? .\n秈 3: T鎛g c閚g 12 ng鋘, h? th鑞g s? th緋 1 lt theo th? t? ng蓇 nhi猲, ghi nh? v? th緋 theo th? t? .")
end

function aoyun_light_rule2()
	Talk(1,"aoyun_light_rule3","<color=green>c s? Чi H閕 V? l﹎<color>: \n秈 4: T鎛g c閚g 12 ng鋘, h? th鑞g s? theo th? t? ng蓇 nhi猲 th緋 12 l莕 n, ghi nh? v? th緋 theo th? t? .\n秈 5: T鎛g c閚g 16 ng鋘, h? th鑞g s? th緋 1 lt theo th? t? ng蓇 nhi猲, ghi nh? v? th緋 theo th? t? .")
end

function aoyun_light_rule3()
	if IB_VERSION == 0 then
		Talk(1,"aoyun_light_rule4","<color=green>c s? Чi H閕 V? l﹎<color>: Ph莕 thng nh? sau:\n    Ngi vt qua 5 秈 c? th? nh薾 b譶h phng ng c蕄/b譶h phng 80*200w kinh nghi謒, c遪 c? th? chuy觧 b譶h phng ng c蕄/b譶h phng 80*400w s鴆 kh醗. Ngi ch琲 c蕄 99 t苙g 6 T骾 b秓 th筩h.\n    Ngi vt qua 4 秈 c? th? nh薾 b譶h phng ng c蕄/b譶h phng 80*100w kinh nghi謒, c遪 c? th? chuy觧 b譶h phng ng c蕄/b譶h phng 80*400w s鴆 kh醗. Ngi ch琲 c蕄 99 t苙g 5 T骾 b秓 th筩h.\n    Ngi vt qua 3 秈 c? th? nh薾 b譶h phng ng c蕄/b譶h phng 80*100w kinh nghi謒, c遪 c? th? chuy觧 b譶h phng ng c蕄/b譶h phng 80*350w s鴆 kh醗. Ngi ch琲 c蕄 99 t苙g 4 T骾 b秓 th筩h.")
	else
		Talk(1,"aoyun_light_rule5","<color=green>c s? Чi H閕 V? l﹎<color>: Ph莕 thng nh? sau:\n    Ngi vt qua 5 秈 c? th? nh薾 b譶h phng ng c蕄/b譶h phng 80*500w kinh nghi謒, ngi ch琲 c蕄 99 t苙g 6 T骾 b秓 th筩h.\n    Ngi vt qua 4 秈 c? th? nh薾 b譶h phng ng c蕄/b譶h phng 80*420w kinh nghi謒, ngi ch琲 c蕄 99 t苙g 5 T骾 b秓 th筩h.\n    Ngi vt qua 3 秈 c? th? nh薾 b譶h phng ng c蕄/b譶h phng 80*380w kinh nghi謒, ngi ch琲 c蕄 99 t苙g 4 T骾 b秓 th筩h.\n    Ngi vt qua 2 秈 c? th? nh薾 b譶h phng ng c蕄/b譶h phng 80*350w kinh nghi謒, ngi ch琲 c蕄 99 t苙g 3 T骾 b秓 th筩h.\n    Ngi vt qua 1 秈 c? th? nh薾 b譶h phng ng c蕄/b譶h phng 80*300w kinh nghi謒, ngi ch琲 c蕄 99 t苙g 2 T骾 b秓 th筩h.")	
	end
end

function aoyun_light_rule4()
	Talk(1,"aoyun_light_rule5","<color=green>c s? Чi H閕 V? l﹎<color>: \n    Ngi vt qua 2 秈 c? th? nh薾 b譶h phng ng c蕄/b譶h phng 80*100w kinh nghi謒, c遪 c? th? chuy觧 b譶h phng ng c蕄/b譶h phng 80*300w s鴆 kh醗. Ngi ch琲 c蕄 99 t苙g 3 T骾 b秓 th筩h.\n    Ngi vt qua 1 秈 c? th? nh薾 b譶h phng ng c蕄/b譶h phng 80*100w kinh nghi謒, c遪 c? th? chuy觧 b譶h phng ng c蕄/b譶h phng 80*250w s鴆 kh醗. Ngi ch琲 c蕄 99 t苙g 2 T骾 b秓 th筩h.")
end

function aoyun_light_rule5()
	Talk(1,"aoyun_light_main","<color=green>c s? Чi H閕 V? l﹎<color>: N誹 vt 5 秈 10 l莕 li猲 t鬰, khi nh薾 ph莕 thng c? th? nh薾 danh hi謚 c bi謙--'Vua 畂竛 n'! <color=red>Ch? ?: Ph莕 thng tham gia ho箃 ng h玬  ph秈 nh薾 trong ng祔.<color>\n")
end

function aoyun_light_award()
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TSK_AOYUN_LIGHT_DATE) < nDate then
		SetTask(TSK_AOYUN_LIGHT_AWARD,0);
		SetTask(TSK_AOYUN_LIGHT_NUM,0);
		SetTask(TSK_AOYUN_LIGHT_GUAN,0);
		SetTask(TSK_AOYUN_LIGHT_DATE,nDate);
	end	
	if GetTask(TSK_AOYUN_LIGHT_AWARD) ~= 0  then
		Talk(1,"","<color=green>c s? Чi H閕 V? l﹎<color>: B筺  nh薾 ph莕 thng tu莕 n祔.");
	else
		local nGuan = GetTask(TSK_AOYUN_LIGHT_GUAN);
		local nNum = GetTask(TSK_AOYUN_LIGHT_NUM);
		if nGuan == 0 then
			Talk(1,"","<color=green>c s? Чi H閕 V? l﹎<color>: 秈 1 ch璦 qua, ch? tr竎h kh玭g tr? l阨 頲, h穣 th? l筰, qua 秈 r錳 h穣 n nh薾 ph莕 thng.");
		else
			QX08_GetAward(3,6-nGuan,TSK_AOYUN_LIGHT_AWARD);
		end
	end
end