-- =====================================================
-- File : 西域胡商
-- Desc : 出售商会老板需要的物品，随机出现在各个城市的。
-- Creator : Tony(Jizheng)
-- =====================================================
Include("\\script\\lib\\globalfunctions.lua");
-- 默认入口函数
function main()
	local nDate = tonumber(date("%y%m%d"));
	local tb_dialog = {
		"уng ? mua/open_shop",
		"Ngi  甶 nh鱪g n琲 u?/query_pos",
		"L莕 sau l筰 n nh?!/exit_dialog"
	};
--	if nDate >= 091218 and nDate < 100117 then
--		tinsert(tb_dialog, 3, "Mua 1 ph竜 hoa (c莕 1 ng)/buy_yanhuo");
--	end
	Say("H祅g h鉧 ? y 頲 甧m v? t? T﹜ V鵦, kh竎h quan xin c? t飝 ? l鵤 ch鋘.",
		getn(tb_dialog),
		tb_dialog
	);
end;

-- 取走西域物品
function open_shop()
	-- 打开一个策划专门制定的商店
	Sale(88)
end;

-- 你通常在哪里出现
function query_pos()
	Say("Ta thng d鮪g ch﹏ t筰 c竎 i th祅h th?: <color=green>Tuy襫 Ch﹗ (187.191), Bi謓 Kinh (179.184), Th祅h Й (224.225), Tng Dng (187.180), Dng Ch﹗ (206.194), Чi L? (178.187)<color>", 0)
end;

-- 下次有机会再买
function exit_dialog()
end;

-- 买烟火
function buy_yanhuo()
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then 
		return 0;
	end
	if Pay(1) == 1 then
		AddItem(2, 1, 30137, 1);
		WriteLogEx("Giang Sinh","mua ph竜 hoa")
	else
		Talk(1, "", "<color=green>Thng Nh﹏ T﹜ V鵦<color>: Tr猲 h祅h trang kh玭g  ti襫.");
	end
end
