--=======================================================
--create by baiyun 2009.5.31
--describe:越南版7月份活动之二夜草，夜草脚本
--======================================================
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function main()
	if VerifyDate(1) == 1 then
		Say("D? Th秓: T?  <color=red>19-06-2009 n 24:00 19-07-2009<red>, ng o c? th? d飊g уng Ti襫 V祅g  i l蕐 c竎 ph莕 thng h蕄 d蒼 sau y::",
				7,
				"1 Чi B筩h C﹗ Ho祅 ? (c莕 1 уng Ti襫 V祅g)/#duihuan_aword(1)",
				"1 Cng Hi謚 Tam Thanh Ho祅 ? (c莕 1 уng Ti襫 V祅g)/#duihuan_aword(2)",
				"1 Cng Hi謚 L鬰 Th莕 Ho祅 ? (c莕 1 уng Ti襫 V祅g)/#duihuan_aword(3)",
				"1 C鰑 Chuy觧 H錳 H錸 Кn ? (c莕 1 уng Ti襫 V祅g)/#duihuan_aword(4)",
				"1 Thi猲 Hng C萴 T鬰_T骾 Nh? ? (c莕 1 уng Ti襫 V祅g)/#duihuan_aword(5)",
				"Trang k?/#NextPage(2)",
				"T筰 h? ch? gh? ngang!/end_dialogover");
	else
		Say("Ho箃 ng n祔  k誸 th骳!",0)
	end
end

function NextPage(nPage)
	if VerifyDate(1) == 1 then
		if nPage == 2 then
			Say("D? Th秓: T?  <color=red>19-06-2009 n 24:00 19-07-2009<red>, ng o c? th? d飊g уng Ti襫 V祅g  i l蕐 c竎 ph莕 thng h蕄 d蒼 sau y::",
				7,
				"1 Nh蕋 nguy猲 ph鬰 th駓 n (ti觰) ? (c莕 1 уng Ti襫 V祅g)/#duihuan_aword(6)",
				"1 Ng? hoa ng鋍 l? ho祅 (ti觰) ? (c莕 1 уng Ti襫 V祅g)/#duihuan_aword(7)",
				"1 B錸g Lai Ti猲 Кn ? (c莕 2 уng Ti襫 V祅g)/#duihuan_aword(8)",
				"1 V筺 v藅 quy nguy猲 n (Ti觰) ? (c莕 2 уng Ti襫 V祅g)/#duihuan_aword(9)",
				"1 Ti觰 Th莕 Th玭g Ph? ? (c莕 2 уng Ti襫 V祅g)/#duihuan_aword(10)",
				"Trang trc/main",
				"Trang k?/#NextPage(3)");
		elseif nPage == 3 then
				Say("D? Th秓: T?  <color=red>19-06-2009 n 24:00 19-07-2009<red>, ng o c? th? d飊g уng Ti襫 V祅g  i l蕐 c竎 ph莕 thng h蕄 d蒼 sau y::",
				8,
				"1 Ti觰 Ni猲 Th? Th莕 Ph? ? (c莕 3 уng Ti襫 V祅g)/#duihuan_aword(11)",
				"1 H綾 ng鋍 畂筺 t鬰 cao (ti觰) ? (c莕 3 уng Ti襫 V祅g)/#duihuan_aword(12)",
				"1 B筩h C﹗ Ti猲 Кn ? (c莕 4 уng Ti襫 V祅g)/#duihuan_aword(13)",
				"1 Tam Thanh Ti猲 Кn ? (c莕 4 уng Ti襫 V祅g)/#duihuan_aword(14)",
				"1 L鬰 Th莕 Ti猲 Кn ? (c莕 4 уng Ti襫 V祅g)/#duihuan_aword(15)",
				"Trang trc/#NextPage(2)",
				"Trang k?/#NextPage(4)",
				"tr? l筰/main");
		elseif nPage == 4 then
				Say("D? Th秓: T?  <color=red>19-06-2009 n 24:00 19-07-2009<red>, ng o c? th? d飊g уng Ti襫 V祅g  i l蕐 c竎 ph莕 thng h蕄 d蒼 sau y::",
				8,
				"1 Sinh sinh h鉧 t竛 (ti觰) ? (c莕 4 уng Ti襫 V祅g)/#duihuan_aword(16)",
				"1 L鬰 l﹎ lang y猲 ? (c莕 5 уng Ti襫 V祅g)/#duihuan_aword(17)",
				"1 Th駓 ho祅g b? chi誹 ? (c莕 5 уng Ti襫 V祅g)/#duihuan_aword(18)",
				"1 Uy猲 ng kim ti b筩 ? (c莕 7 уng Ti襫 V祅g)/#duihuan_aword(19)",
				"1 S? tay s鑞g ? (c莕 20 уng Ti襫 V祅g)/#duihuan_aword(20)",
				"Trang trc/#NextPage(3)",
				"Trang k?/#NextPage(5)",
				"tr? l筰/main");
		elseif nPage == 5 then
				Say("D? Th秓: T?  <color=red>19-06-2009 n 24:00 19-07-2009<red>, ng o c? th? d飊g уng Ti襫 V祅g  i l蕐 c竎 ph莕 thng h蕄 d蒼 sau y::",
				8,
				"1 Th莕 h祅h b秓 甶觧 ? (c莕 25 уng Ti襫 V祅g)/#duihuan_aword(21)",
				"1 Huy hi謚 chi課 c玭g (huy ho祅g) ? (c莕 50 уng Ti襫 V祅g)/#duihuan_aword(22)",
				"1 T葃 T駓 Linh Кn ? (c莕 80 уng Ti襫 V祅g)/#duihuan_aword(23)",
				"1 B竧 B秓 T葃 T駓 Ti猲 Кn ? (c莕 100 уng Ti襫 V祅g)/#duihuan_aword(24)",
				"1 Phi猽 V? ? (c莕 250 уng Ti襫 V祅g) /#duihuan_aword(25)",
				"Trang trc/#NextPage(4)",
				"tr? l筰/main",
				"T筰 h? ch? gh? ngang!/end_dialogover");
		end
	else
		Say("Ho箃 ng n祔  k誸 th骳!",0)
	end
end

--兑换奖励
function duihuan_aword(nIndex)
	if GetItemCount(2, 1, 30094) < tb_yecao_aword[nIndex][3] then
		Talk(1, "", "уng Ti襫 V祅g mang theo kh玭g !");
		return
	end
	if gf_Judge_Room_Weight(2, 50, " ") == 0 then
		return
	end
	if DelItem(2, 1, 30094, tb_yecao_aword[nIndex][3]) == 1 then
		local nRetCode, nItem = gf_AddItemEx(tb_yecao_aword[nIndex][2], tb_yecao_aword[nIndex][1]);
		WriteLogEx("Hoat dong thang 6","D? Th秓 Tr? l筰",tb_yecao_aword[nIndex][2][4],tb_yecao_aword[nIndex][1]);
		if nRetCode == 1 and tb_yecao_aword[nIndex][4] ~= 0 then
			SetItemExpireTime(nItem, tb_yecao_aword[nIndex][4]);
		end
	end
end

--结束对话
function end_dialogover()
end