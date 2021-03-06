--File name:	xmas_npc.lua
--Describe:		西洋传教士npc文件
--Create Date:	2008-11-18
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\xmas_08\\xmas_func.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Giang Sinh 2008"				--此处分为2段只是为了不增加新的翻译
g_szInfoHead = "<color=green>".."Gi竜 s?".."<color>: "

g_szFileName = "xmas_npc.lua"			--文件名


g_tbItem = 
{
	--		名称					G1	G2		G3	数量	幸运礼盒数量	物品期限
	[1] = {"S? m玭 l謓h th?",				2,	1,	1016,	1,		3,			30,	},
	[2] = {"H綾 Ng鋍 筺 T鬰 Cao",			1,	0,	6,		30,		5,			-1,	},
	[3] = {"Sinh Sinh H鉧 T竛",			1,	0,	16,		30,		5,			-1,	},
	[4] = {"V筺 V藅 Quy Nguy猲 Кn",			1,	0,	11,		30,		5,			-1,	},
	[5] = {"Th蕋 C蕄 Gi竚 мnh ph?-bao nh?",		2,	1,	1057,	1,		5,			30,	},
	[6] = {"M秐h m藅 t辌h th蕋 l筩",		2,	1,	1088,	10,		10,			-1,	},
	[7] = {"V遪g Th竔 H? B竧 Qu竔 - Ly",			2,	1,	473,	1,		10,			-1,	},
	[8] = {"B筩h C﹗ Ti猲 n",				2,	1,	1008,	1,		10,			30,	},
	[9] = {"V遪g Th竔 H? B竧 Qu竔 - C蕁",			2,	1,	475,	1,		20,			-1,	},
	[10] = {"S? tay ch? t筼 v? kh?",	2,	0,	397,	1,		20,			-1,	},
	[11] = {"Qu﹏ C玭g b礽",				2,	1,	9997,	1,		20,			30,	},
	[12] = {"Щng V?",					0,	105,20,		1,		30,			30,	},
	[13] = {"Qu﹏ d鬾g-thu th藀 th?",			2,	1,	1028,	1,		30,			30,	},
	[14] = {"Qu﹏ C玭g Чi",				2,	1,	9998,	1,		30,			7,	},
	[15] = {"T葃 T駓 n",				2,	0,	136,	1,		30,			30,	},
	[16] = {"S? m玭 i s? h祄",			2,	1,	1021,	1,		30,			30,	},
	[17] = {"Ng? d鬾g b筩h ng鋍 th筩h",			2,	1,	1024,	1,		60,			30,	},
	[18] = {"Qu﹏ C玭g Huy Ho祅g",			2,	1,	9977,	1,		150,		7,	},
	[19] = {"K? L﹏ ho祅",				2,	1,	1003,	1,		300,		7,	},
	[20] = {"T葃 T駓 linh n",				2,	0,	137,	1,		600,		30,	},	
	[21] = {"Kim Chung Tr竜 quy誸",			2,	6,	5,		1,		1200,		-1,	},
	[22] = {"Чt Ma V? quy誸",			2,	6,	10,		1,		1200,		-1,	},
	[23] = {"Hu? Nh穘 quy誸",			2,	6,	14,		1,		1200,		-1,	},
	[24] = {"Long Tr秓 Th? quy誸",		2,	6,	20,		1,		1200,		-1,	},
	[25] = {"S? T? H鑞g",			2,	6,	29,		1,		1200,		-1,	},
	[26] = {"Kim Cang Ch? quy誸",		2,	6,	31,		1,		1200,		-1,	},
	[27] = {"M穘 Thi猲 V? quy誸",			2,	6,	46,		1,		1200,		-1,	},
	[28] = {"Thanh Ph筺 quy誸",			2,	6,	53,		1,		1200,		-1,	},
	[29] = {"Чi Bi quy誸",		2,	6,	59,		1,		1200,		-1,	},
	[30] = {"Ph骳 Th駓 ph竝",			2,	6,	67,		1,		1200,		-1,	},
	[31] = {"M? T﹎ Kh骳 quy誸",		2,	6,	70,		1,		1200,		-1,	},
	[32] = {"T髖 謕",				2,	6,	78,		1,		1200,		-1,	},
	[33] = {"T髖 Quy襫",				2,	6,	79,		1,		1200,		-1,	},
	[34] = {"N? Thu quy誸",			2,	6,	83,		1,		1200,		-1,	},
	[35] = {"Ф C萿 quy誸",			2,	6,	88,		1,		1200,		-1,	},
	[36] = {"T輈h Dng Ki誱 quy誸",			2,	6,	99,		1,		1200,		-1,	},
	[37] = {"Th蕋 Ti謙 Ki誱 quy誸",		2,	6,	108,	1,		1200,		-1,	},
	[38] = {"Thi誹 Dng Quy誸",			2,	6,	114,	1,		1200,		-1,	},
	[39] = {"Thng Thanh C玭g quy誸",		2,	6,	119,	1,		1200,		-1,	},
	[40] = {"Ng? M? quy誸",		2,	6,	129,	1,		1200,		-1,	},
	[41] = {"B輈h Thng quy誸",		2,	6,	130,	1,		1200,		-1,	},
	[42] = {"To竔 Ti詎 quy誸",		2,	6,	138,	1,		1200,		-1,	},
	[43] = {"L璾 Tuy謙 Ti詎 quy誸",		2,	6,	141,	1,		1200,		-1,	},
	[44] = {"B? ki誴 Th玦 Thi T? Kh?",			2,	6,	151,	1,		1200,		-1,	},
	[45] = {"B? ki誴 Thi Li謙 Ma C玭g",			2,	6,	154,	1,		1200,		-1,	},
	[46] = {"B? ki誴 T祄 C?",				2,	6,	168,	1,		1200,		-1,	},
	[47] = {"B? ki誴 Huy詎 C?",				2,	6,	167,	1,		1200,		-1,	},
	[48] = {"B秐 v? c t筼 th莕 kh?",			2,	1,	1086,	10,		1200,		-1,	},
	[49] = {"Thi猲 Th筩h linh th筩h",				2,	1,	1068,	1,		1500,		7,	},
}

g_tbOption = {}

function main()
	if is_xmas_08_viet_open() == 0 then
		Say(g_szInfoHead.."Gi竛g Sinh vui v? !", 0)
		return
	end
	
	local nMapID = GetWorldPos()
	if nMapID ~= 200 then
		Say(g_szInfoHead.."Gi竛g Sinh vui v? !", 0)
		return
	end

	local i = 0
	local nTableSize = getn(g_tbItem)
	for i = 1, nTableSize do
		g_tbOption[i] = g_tbItem[i][6].." H閜 Qu? May M緉".." = "..g_tbItem[i][5]..g_tbItem[i][1]..format("/#exchange_prize(%d)", i)
	end

	exchange_talk()
end

function exchange_talk()
	local selTab = {
				g_tbOption[1],
				g_tbOption[2],
				g_tbOption[3],
				g_tbOption[4],
				g_tbOption[5],
				g_tbOption[6],
				"Xem trang sau/exchange_talk_2",
				"K誸 th骳 i tho筰/no",
				}
	Say(g_szInfoHead.."S? d鬾g H閜 Qu? May M緉 i 頲 nh鱪g ph莕 qu? nh? sau:",getn(selTab),selTab);
end

function exchange_talk_2()
	local selTab = {
				g_tbOption[7],
				g_tbOption[8],
				g_tbOption[9],
				g_tbOption[10],
				g_tbOption[11],
				"Xem trang trc/exchange_talk",
				"Xem trang sau/exchange_talk_3",
				"K誸 th骳 i tho筰/no",
				}
	Say(g_szInfoHead.."S? d鬾g H閜 Qu? May M緉 i 頲 nh鱪g ph莕 qu? nh? sau:",getn(selTab),selTab);
end

function exchange_talk_3()
	local selTab = {
				g_tbOption[12],
				g_tbOption[13],
				g_tbOption[14],
				g_tbOption[15],
				g_tbOption[16],
				"Xem trang trc/exchange_talk_2",
				"Xem trang sau/exchange_talk_4",
				"K誸 th骳 i tho筰/no",
				}
	Say(g_szInfoHead.."S? d鬾g H閜 Qu? May M緉 i 頲 nh鱪g ph莕 qu? nh? sau:",getn(selTab),selTab);
end

function exchange_talk_4()
	local selTab = {
				g_tbOption[17],
				g_tbOption[18],
				g_tbOption[19],
				g_tbOption[20],
				g_tbOption[21],
				"Xem trang trc/exchange_talk_3",
				"Xem trang sau/exchange_talk_5",
				"K誸 th骳 i tho筰/no",
				}
	Say(g_szInfoHead.."S? d鬾g H閜 Qu? May M緉 i 頲 nh鱪g ph莕 qu? nh? sau:",getn(selTab),selTab);
end

function exchange_talk_5()
	local selTab = {
				g_tbOption[22],
				g_tbOption[23],
				g_tbOption[24],
				g_tbOption[25],
				g_tbOption[26],
				"Xem trang trc/exchange_talk_4",
				"Xem trang sau/exchange_talk_6",
				"K誸 th骳 i tho筰/no",
				}
	Say(g_szInfoHead.."S? d鬾g H閜 Qu? May M緉 i 頲 nh鱪g ph莕 qu? nh? sau:",getn(selTab),selTab);
end

function exchange_talk_6()
	local selTab = {
				g_tbOption[27],
				g_tbOption[28],
				g_tbOption[29],
				g_tbOption[30],
				g_tbOption[31],
				"Xem trang trc/exchange_talk_5",
				"Xem trang sau/exchange_talk_7",
				"K誸 th骳 i tho筰/no",
				}
	Say(g_szInfoHead.."S? d鬾g H閜 Qu? May M緉 i 頲 nh鱪g ph莕 qu? nh? sau:",getn(selTab),selTab);
end

function exchange_talk_7()
	local selTab = {
				g_tbOption[32],
				g_tbOption[33],
				g_tbOption[34],
				g_tbOption[35],
				g_tbOption[36],
				"Xem trang trc/exchange_talk_6",
				"Xem trang sau/exchange_talk_8",
				"K誸 th骳 i tho筰/no",
				}
	Say(g_szInfoHead.."S? d鬾g H閜 Qu? May M緉 i 頲 nh鱪g ph莕 qu? nh? sau:",getn(selTab),selTab);
end

function exchange_talk_8()
	local selTab = {
				g_tbOption[37],
				g_tbOption[38],
				g_tbOption[39],
				g_tbOption[40],
				g_tbOption[41],
				"Xem trang trc/exchange_talk_7",
				"Xem trang sau/exchange_talk_9",
				"K誸 th骳 i tho筰/no",
				}
	Say(g_szInfoHead.."S? d鬾g H閜 Qu? May M緉 i 頲 nh鱪g ph莕 qu? nh? sau:",getn(selTab),selTab);
end

function exchange_talk_9()
	local selTab = {
				g_tbOption[42],
				g_tbOption[43],
				g_tbOption[44],
				g_tbOption[45],
				g_tbOption[46],
				"Xem trang trc/exchange_talk_8",
				"Xem trang sau/exchange_talk_10",
				"K誸 th骳 i tho筰/no",
				}
	Say(g_szInfoHead.."S? d鬾g H閜 Qu? May M緉 i 頲 nh鱪g ph莕 qu? nh? sau:",getn(selTab),selTab);
end

function exchange_talk_10()
	local selTab = {
				g_tbOption[47],
				g_tbOption[48],
				g_tbOption[49],
				"Xem trang trc/exchange_talk_9",
				"K誸 th骳 i tho筰/no",
				}
	Say(g_szInfoHead.."S? d鬾g H閜 Qu? May M緉 i 頲 nh鱪g ph莕 qu? nh? sau:",getn(selTab),selTab);
end

function exchange_prize(nType)
	local nTableSize = getn(g_tbItem)
	if nType >= 1 and nType <= nTableSize then
		if GetItemCount(2, 1, 30038) < g_tbItem[nType][6] then
			Say(g_szInfoHead.."C竎 h? v蒼 ch璦  H閜 Qu? May M緉  i th祅h t苙g ph萴",1,"V﹏g! T筰 h? s? quay l筰 sau khi c?  nguy猲 li謚!/no");
			return
		else
			if gf_Judge_Room_Weight(1, 120) == 0 then
				Talk(1,"",g_szInfoHead.."Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!");
				return
			end;
			if DelItem(2, 1, 30038, g_tbItem[nType][6]) == 1 then
				add_item_ex(g_tbItem[nType]);
			else
				Say(g_szInfoHead.."C竎 h? v蒼 ch璦  H閜 Qu? May M緉  i th祅h t苙g ph萴",1,"V﹏g! T筰 h? s? quay l筰 sau khi c?  nguy猲 li謚!/no");
				return
			end
		end
		
	else
		WriteLogEx(g_szLogTitle, "NULL", "NULL", "NULL", "NULL", GetTongName(), "function exchange_prize(nType) in file "..g_szFileName..", parameter nType error, nType = "..nType)
	end
end

function add_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode, nItemIdx = 0, 0

	if G == 0 and D == 105 then
		nRetCode,nItemIdx = AddItem(G, D, P, nItemNum, 1, -1, -1, -1, -1, -1, -1)
	else
		nRetCode,nItemIdx = AddItem(G, D, P, nItemNum)
	end
	if nRetCode == 1 then
		if tItem[7] > 0 then
			SetItemExpireTime(nItemIdx, tItem[7]*24*3600)
		end
		Msg2Player("B筺 nh薾 頲  "..nItemNum.." c竔 "..szItemName)
		WriteLogEx(g_szLogTitle, "Gi竜 s?", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "Gi竜 s?", "", "", "", "", "Thu 頲 th蕋 b筰, ".."AddItem return value = "..nRetCode)
	end
end

function no()
end

