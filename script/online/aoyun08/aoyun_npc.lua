--圣火传递活动大使
--by vivi
--2008/05/09

Include("\\script\\online\\aoyun08\\aoyun_head.lua")
Include("\\script\\online\\aoyun08\\huojushou_name.lua")

function main()
--	local strtab = {
--		"我要报名参加圣火传递活动/aoyun_canjia_huoju",
--		"我要了解火炬手的参选资格/aoyun_about_huoju",
--		"我要了解本次活动的奖励/aoyun_about_jiangli",
--		"我要了解本次活动安排/aoyun_about_anpai",
--		"我只是来看看/nothing"
--		};
--	Say("<color=green>圣火传递活动大使<color>：武林大会已经召开了，天下英雄在此比武较艺，为了体现比武切磋，公平公正的原则，我们即将进行剑网2武林圣火传递，不知你们是否也有兴趣参加。只要到达<color=red>70级<color>就有了报名参加的资格了，<color=red>如果您参加了火炬手选拔，请留意官网公告，我们会进行符合火炬手资格的玩家名单公告，进行第二轮选举。<color>",
--		getn(strtab),
--		strtab)
	local strtab = {
			"Ta mu鑞 t譵 hi觰 ho箃 ng/chuandi_detail",
			"S緋 x誴 th阨 gian ho箃 ng ti誴 s鴆/chuandi_time",
			"Nh薾 quy襫 tham gia ho箃 ng/chuandi_get_prove",
			"T譵 t鋋  Уi 畊鑓/huoju_zuobiao",
			"Ta ch? n xem th?/nothing"
			}
	Say("<color=green>Чi s? ho箃 ng rc Th竛h H醓<color>: Ho箃 ng rc Th竛h H醓 V? L﹎ s緋 b総 u, m阨 nh鱪g ngi tham gia n y nh薾 quy襫 tham gia v? t譵 hi觰 n閕 dung ho箃 ng.",
		getn(strtab),
		strtab)
end

function aoyun_canjia_huoju()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate > 20080612 then
		Talk(1,"","<color=green>Чi s? ho箃 ng rc Th竛h H醓<color>: Th阨 h筺 b竜 danh ho箃 ng rc Th竛h H醓 l? 12 th竛g 6.");
		return
	end
	if GetTask(547) == 1 then
		Talk(1,"","<color=green>Чi s? ho箃 ng rc Th竛h H醓<color>: Ngi  b竜 danh tham gia ho箃 ng tuy觧 ch鋘 rc Th竛h H醓, xin ch? ? th玭g b竜.");
		return
	end
	if GetLevel() < 70 then
		Talk(1,"","<color=green>Чi s? ho箃 ng rc Th竛h H醓<color>: Ъng c蕄 tham gia ho箃 ng rc Th竛h H醓 ph秈 tr猲 70.");
		return
	end
	Say("<color=green>Чi s? ho箃 ng rc Th竛h H醓<color>: Ngi mu鑞 tham gia ho箃 ng, ch? c莕 tr猲 c蕄 70 l? c? th? b竜 danh, <color=red>30 th竛g 6<color> s? b総 u rc Th竛h H醓. Xin ch? ?, b蕋 k? ai n誹 tham gia ho箃 ng u c? th? nh薾 頲 ph莕 thng.",
		2,
		"Л頲/aoyun_ask_canjia",
		"Kh玭g c莕/nothing")
end

function aoyun_ask_canjia()
	Say("<color=green>Чi s? ho箃 ng rc Th竛h H醓<color>: Xin ch? ?, m鏸 t礽 kho秐 ch? c? th? c? 1 nh﹏ v藅 頲 ch鋘 l祄 ngi rc 畊鑓, n誹 b竜 danh c飊g l骳 nhi襲 nh﹏ v藅 th? s? ch鋘 ngi c? 甶觤 t輈h l騳 cao nh蕋.",
		2,
		"Л頲/aoyun_confirm_canjia",
		"Kh玭g c莕/nothing")
end

function aoyun_confirm_canjia()
	SetTask(547,1);
	Talk(1,"","<color=green>Чi s? ho箃 ng rc Th竛h H醓<color>: Ngi  b竜 danh tham gia ho箃 ng tuy觧 ch鋘 rc Th竛h H醓, xin ch? ? th玭g b竜.")
end

function aoyun_about_huoju()
	Talk(1,"aoyun_about_huoju2","<color=green>Чi s? ho箃 ng rc Th竛h H醓<color>: M鋓 ngi u c? t? c竎h tham gia rc 畊鑓, ch髇g t玦 s? c╪ c? th﹏ ph薾 trong V? L﹎ 2  tuy觧 ch鋘 ngi rc 畊鑓, th薽 ch? khi b筺 kh玭g 頲 ch鋘 v蒼 c? th? l祄 ngi c? v?  tham gia ho苩 ng v? nh薾 ph莕 thng, tuy觧 c? ngi rc 畊鑓 ch? y誹 tham kh秓 nh? ph輆 dc:\n1. Ъng c蕄 v? th? h筺g\n2. Qu﹏ chng\n3. Qu﹏ c玭g\n4. 詍 t輈h l騳 n筽 th蝄n5. Danh v鋘g\n6. ч c鑞g hi課 s? m玭\n7. Th祅h t輈h Чi h閕 v? l﹎");
end

function aoyun_about_huoju2()
	Talk(1,"main","<color=green>Чi s? ho箃 ng rc Th竛h H醓<color>: Sau khi b竜 danh, xin l璾 ? trang ch?, ngi ch琲 c? 甶襲 ki謓 ph? h頿 tuy觧 ch鋘 ngi rc 畊鑓, t? <color=red>18/6 n 25/6<color> ch髇g t玦 s? th玭g b竜 tr猲 trang ch?, v? do ngi ch琲 b? phi誹 v遪g 2.\n<color=red>Xin ch? ?, n╪g l鵦 tuy觧 ch鋘 l? n╪g l鵦 b竜 danh ng祔 cu鑙 c飊g, trc n祔 cu鑙 c飊g b筺 c? th? t╪g t? c竎h li猲 quan.<color>")
end

function aoyun_about_jiangli()
	Talk(1,"main","<color=green>Чi s? ho箃 ng rc Th竛h H醓<color>: Ch? c莕 b筺 b竜 danh ho箃 ng rc 畊鑓 th? d? b筺 l? ngi rc 畊鑓 hay ngi c? v? c騨g u c? th? nh薾 頲 ph莕 thng phong ph?.")
end

function aoyun_about_anpai()
	Talk(1,"main","<color=green>Чi s? ho箃 ng rc Th竛h H醓<color>: Th阨 gian b竜 danh ho箃 ng n祔 t? <color=red>b﹜ gi? n 12/6<color>, m鋓 ngi c? th? b竜 danh tuy觧 ch鋘 ngi rc 畊鑓.\nT? <color=red>13/6 n 1-7/6<color>, ch髇g t玦 s? tuy觧 ch鋘 bc u.\nT? <color=red>18/6 n 25/6<color>, s? ti課 h祅h b? phi誹 tr猲 trang ch?, trong 50 ngi s? tuy觧 ch鋘 ra 30 ngi.\nT? <color=red>26/6 n 29/6<color>, c玭g b? danh s竎h cu鑙 c飊g tr猲 trang ch?.\n<color=red>30/6<color> l? ng祔 rc 畊鑓, m鋓 ngi c飊g nhau  Th竛h H醓.")
end

function chuandi_detail()
	Talk(1,"chuandi_detail2","<color=green>Чi s? ho箃 ng rc Th竛h H醓<color>: N鉯 th? v? ho箃 ng l莕 n祔.\nHo箃 ng rc 畊鑓:\nCh? c莕 ngi tham gia b竜 danh l? c? th? nh薾 'Ch鴑g nh薾 quy襫 rc 畊鑓' v? 'Ch鴑g nh薾 quy襫 c? v?' t筰 y, c莕 c╪ c? b筺  t? c竎h li猲 quan kh玭g.\nPh輒 ph秈 tra xem 'Ch鴑g nh薾 quy襫 rc 畊鑓' v? 'Ch鴑g nh薾 quy襫 c? v?' c馻 m譶h, x竎 nh薾 nhi謒 v? m譶h c莕 ho祅 th祅h v? 甶觤 th阨 gian rc 畊鑓.\nSau khi n 甶觤 th阨 gian rc 畊鑓, rc 畊鑓 v? c? v? theo hng d蒼.");
end

function chuandi_detail2()
	Talk(1,"main","<color=green>Чi s? ho箃 ng rc Th竛h H醓<color>: Ho箃 ng i h閕 t? v? m鮪g Th竛h H醓:\nSau khi ho箃 ng b総 u 30/3, khi kh玭g ph秈 th阨 gian ng祔 rc 畊鑓 m竬 ch? n祔, ai c騨g c? th? mua 'уng ph鬰 rc 畊鑓' t筰 t筽 h鉧, t? Th竛h H醓 Уi b総 u th緋 畊鑓, qua t蕋 c? Уi 畊鑓, sau khi n Th竛h H醓 Уi Th辬h Th? cu鑙 c飊g, u c? th? nh薾 ph莕 thng, nh璶g c莕 ch? ? r籲g m鏸 ngi m鏸 ng祔 ch? nh薾 頲 m閠 l莕.");
end

function chuandi_time()
	Talk(1,"chuandi_time2","<color=green>Чi s? ho箃 ng rc Th竛h H醓<color>: Th阨 gian nh? sau, ho箃 ng b総 u t? 30/6 n 6/8 k誸 th骳.\nB総 u t? 30/6, tu莕 u 30/6 l? khu thu ph? 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 rc 畊鑓.\nTu莕 2 7/7 l? khu thu ph? 11, 12, 13, 14, 15, 16, 1-7, 18, 19, 20 rc 畊鑓.\nTu莕 3 14/7 l? khu thu ph? 21, 22, 23, 24, 25, 26, 27, 28, 29, 30 rc 畊鑓.");
end

function chuandi_time2()
	Talk(1,"main","<color=green>Чi s? ho箃 ng rc Th竛h H醓<color>: Tu莕 4 21/7 l? khu thu ph? 31, 32, 33, 34, 35, 36, 37, 38, 39, 40 rc 畊鑓.\nTu莕 5 28/7 l? khu thu ph? 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52 rc 畊鑓.\nTu莕 6 4/8 to祅 b? khu mi詎 ph? rc 畊鑓.\nTh阨 gian ho箃 ng chuy觧 畊鑓 l? <color=yellow>20 gi? m 21 gi? t鑙<color>.")
end

function chuandi_get_prove()
	if GetTask(547) ~= 0 then
		local sName = tostring(GetName());
		local nIsHuojushou = 0;
		for i=1,getn(tHuojushouName) do
			for j=1,getn(tHuojushouName[i]) do
				if sName == tHuojushouName[i][j] then
					nIsHuojushou = j;
					break
				end
			end
		end
		if nIsHuojushou == 0 then
			Say("<color=green>Чi s? ho箃 ng rc Th竛h H醓<color>: Ngi 產ng l? ngi c? v?, ngi mu鑞 nh薾 <color=yellow>quy襫 tham gia c? v?<color> kh玭g?",
				2,
				"Ta mu鑞 nh薾 /#chuandi_confirm_get(1)",
				"в nh薾 sau/nothing")
		else
			SetTask(TASK_AOYUN_HUOJU_NUM,nIsHuojushou);
			Say("<color=green>Чi s? ho箃 ng rc Th竛h H醓<color>: Ngi 產ng l? ngi rc 畊鑓, mu鑞 nh薾 <color=yellow>Ch鴑g nh薾 quy襫 rc 畊鑓<color> kh玭g?",
				2,
				"Ta mu鑞 nh薾 /#chuandi_confirm_get(2)",
				"в nh薾 sau/nothing")
		end
	else
		Talk(1,"","<color=green>Чi s? ho箃 ng rc Th竛h H醓<color>: Ngi ch璦 b竜 danh tham gia ho箃 ng.");
	end
end

function chuandi_confirm_get(nType)
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	if nType == 1 then
		if BigGetItemCount(2,1,3377) < 1 then
			AddItem(2,1,3377,1); --助威者资格证书
		else
			Talk(1,"","<color=green>Чi s? ho箃 ng rc Th竛h H醓<color>: Kh玭g ph秈 ngi  c? r錳 sao?")
		end 
	elseif nType == 2 then
		local nBody = GetBody();
		if BigGetItemCount(0,105,44+nBody) < 1 then
			AddItem(0,105,44+nBody,1); --火炬手服饰
		end		
		if BigGetItemCount(2,1,3376) < 1 then
			AddItem(2,1,3376,1); --火炬手资格证书
		else
			Talk(1,"","<color=green>Чi s? ho箃 ng rc Th竛h H醓<color>: Kh玭g ph秈 ngi  c? r錳 sao?")
		end
	end
end

function huoju_zuobiao()
	Talk(1,"huoju_zuobiao2","Ph鬾g Tng: Th竛h H醓 Уi [228,191], Уi 畊鑓 1 [209,200], Уi 畊鑓 2 [207,193], Уi 畊鑓 3 [222,200]\nTng Dng: Уi 畊鑓 4 [192,1-79], Уi 畊鑓 5 [1-77,1-74], Уi 畊鑓 6 [168,1-79], Уi 畊鑓 7 [1-70,190], Уi 畊鑓 8 [189,190]\nTh祅h Й: Уi 畊鑓 9 [209,229], Уi 畊鑓 10 [213,21-7], Уi 畊鑓 11 [232,218], Уi 畊鑓 12 [220,221], Уi 畊鑓 13 [233,226]\nЧi L?: Уi 畊鑓 14 [191,182], Уi 畊鑓 15 [1-78,185], Уi 畊鑓 16 [181,193], Уi 畊鑓 1-7 [195,194]");
end

function huoju_zuobiao2()
	Talk(1,"OnUse","Tuy襫 Ch﹗: Уi 畊鑓 18 [169,180], Уi 畊鑓 19 [169,190], Уi 畊鑓 20 [189,190], Уi 畊鑓 21 [188,181]\nDng Ch﹗: Уi 畊鑓 22 [203,191], Уi 畊鑓 23 [203,198], Уi 畊鑓 24 [218,198], Уi 畊鑓 25 [21-7,192]\nBi謓 Kinh: Уi 畊鑓 26 [158,185], Уi 畊鑓 27 [183,184], Уi 畊鑓 28 [183,1-73], Уi 畊鑓 29 [162,1-72], Уi 畊鑓 th辬h th? [1-70,1-79]");
end