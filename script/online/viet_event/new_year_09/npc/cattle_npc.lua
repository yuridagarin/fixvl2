--File name:	cattle_npc.lua
--Describe:		春节活动牛王npc脚本
--Create Date:	2008-12-24
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\new_year_09\\new_year_func.lua")


g_szLogTitle = "Hoat dong Tet 2009"				--此处分为2段只是为了不增加新的翻译
g_szFileName = "cattle_npc.lua"						--文件名


g_tbPrizeItem = 
{
	--		"名称",				G1,	G2,	G3,		数量	概率
	[1] = {"Чt Ma V? quy誸",		2,	6,	10,		1,		7,	},
	[2] = {"Long Tr秓 Th? quy誸",	2,	6,	20,		1,		8,	},
	[3] = {"Kim Cang Ch? quy誸",	2,	6,	31,		1,		7,	},
	[4] = {"M穘 Thi猲 V? quy誸",		2,	6,	46,		1,		7,	},
	[5] = {"Чi Bi quy誸",	2,	6,	59,		1,		7,	},
	[6] = {"M? T﹎ Kh骳 quy誸",	2,	6,	70,		1,		7,	},
	[7] = {"T髖 Quy襫",			2,	6,	79,		1,		7,	},
	[8] = {"Ф C萿 quy誸",		2,	6,	88,		1,		7,	},
	[9] = {"Th蕋 Ti謙 Ki誱 quy誸",	2,	6,	108,	1,		7,	},
	[10] = {"Thng Thanh C玭g quy誸",	2,	6,	119,	1,		7,	},
	[11] = {"B輈h Thng quy誸",	2,	6,	130,	1,		7,	},
	[12] = {"L璾 Tuy謙 Ti詎 quy誸",	2,	6,	141,	1,		8,	},
	[13] = {"B? ki誴 Thi Li謙 Ma C玭g",		2,	6,	154,	1,		7,	},
	[14] = {"B? ki誴 T祄 C?",			2,	6,	168,	1,		7,	},

}

function OnDeath(nNpcIndex)
	SetNpcLifeTime(nNpcIndex, 0)
	SetNpcScript(nNpcIndex, "")

	if is_new_year_09_viet_open() == 0 then
		return
	end

	local nExp = 500000
	ModifyExp(nExp)
	Msg2Player("B筺 nh薾 頲  "..nExp.."  甶觤 kinh nghi謒")
	WriteLogEx(g_szLogTitle, "Ng璾 Vng", nExp, " 甶觤 kinh nghi謒", format("ModifyExp(%d)", nExp), GetTongName() )

	local nRandom = random(1, 100)
	if nRandom <= 5 then
		give_item_award()
	end
end


function give_item_award()
	local nRandom = random(1,100);
	local nBase = 0;
	for i=1, getn(g_tbPrizeItem) do
		nBase = nBase + g_tbPrizeItem[i][6];
		if nRandom <= nBase then
			add_item_award(g_tbPrizeItem[i]);
			return
		end;
	end;
end

function add_item_award(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0

	nRetCode = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲  "..nItemNum.." c竔 "..szItemName);
		WriteLogEx(g_szLogTitle, "Ng璾 Vng", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "Ng璾 Vng", "", "", format("(%d,%d,%d)", G, D, P), GetTongName(), "Thu 頲 th蕋 b筰, ".."AddItem return value = "..nRetCode)
	end
end

