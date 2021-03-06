-- 门派类称号的物品脚本

START_INDEX = 23

tTab_chu =
{
	["index"] = 1,
--物品大类，副类，详细类别，流派，需要声望，称号名称，对应称号表内的大类，副类，持续时间(真实时间)，流派名
	[2] = 	{80,	"H祅h gi?",		23,	1 ,	3600 * 24 * 30, "Thi誹 L﹎ t鬰 gia"	  },
	[4] = 	{80,	"Sa Di",		23,	2 ,	3600 * 24 * 30, "Thi誹 L﹎ v? t╪g"    },
	[3] = 	{80,	"Kh? H祅h T╪g",	23,	3 ,	3600 * 24 * 30, "Thi誹 L﹎ thi襫 t╪g"    },
	[6] = 	{80,	"Trang Kh竎h",		23,	4 ,	3600 * 24 * 30, "Л阯g M玭"        },
	[8] = 	{80,	"Thanh T﹎ S?"  ,	23,	5 ,	3600 * 24 * 30, "Nga My ph藅 gia"    },
	[9] = 	{80,	"T? Kh骳 S?"  ,	23,	6 ,	3600 * 24 * 30, "Nga My t鬰 gia"    },
	[11] = 	{80,	"Ch蕄 B竧 е T?",	23,	7 ,	3600 * 24 * 30, "C竔 Bang T躰h y"    },
	[12] = 	{80,	"Ch蕄 B鎛g е T?",	23,	8 ,	3600 * 24 * 30, "C竔 Bang ? Y"    },
	[14] = 	{80,	"Thanh Tu o nh﹏",	23,	9 ,	3600 * 24 * 30, "V? ng o gia"    },
	[15] = 	{80,	"Thanh Phong o nh﹏",	23,	10,	3600 * 24 * 30, "V? ng t鬰 gia"    },
	[17] = 	{80,	"Khinh k? binh",	23,	11,	3600 * 24 * 30, "Dng M玭 thng K?"    },
	[18] = 	{80,	"Xuy猲 Dng Th?",	23,	12,	3600 * 24 * 30, "Dng M玭 Cung K?"    },
	[20] = 	{80,	"箃 Ph竎h T秐 Nh﹏",	23,	13,	3600 * 24 * 30, "Hi謕 чc"    },
	[21] = 	{80,	"чc T祄 T秐 Nh﹏",	23,	14,	3600 * 24 * 30, "T? чc"    },
}

tTab_zhong =
{
	["index"] = 2,
--物品大类，副类，详细类别，流派，需要声望，称号名称，对应称号表内的大类，副类，持续时间(真实时间)，流派名
	[2] = 	{3000,	"H鏽 Nguy猲 T╪g",	24,	1 ,	3600 * 24 * 30, "Thi誹 L﹎ t鬰 gia"	  },
	[4] = 	{3000,	"u T╪g",		24,	2 ,	3600 * 24 * 30, "Thi誹 L﹎ v? t╪g"    },
	[3] = 	{3000,	"Thi襫 Tu T╪g",	24,	3 ,	3600 * 24 * 30, "Thi誹 L﹎ thi襫 t╪g"    },
	[6] = 	{3000,	"H? V?",		24,	4 ,	3600 * 24 * 30, "Л阯g M玭"        },
	[8] = 	{3000,	"V? Y S?"  ,	24,	5 ,	3600 * 24 * 30, "Nga My ph藅 gia"    },
	[9] = 	{3000,	"Ph筺  S?"  ,	24,	6 ,	3600 * 24 * 30, "Nga My t鬰 gia"    },
	[11] = 	{3000,	"Tr? Gian е T?",	24,	7 ,	3600 * 24 * 30, "C竔 Bang T躰h y"    },
	[12] = 	{3000,	"Tr鮪g 竎 е T?",	24,	8 ,	3600 * 24 * 30, "C竔 Bang ? Y"    },
	[14] = 	{3000,	"Nh藀 Quan o nh﹏",	24,	9 ,	3600 * 24 * 30, "V? ng o gia"    },
	[15] = 	{3000,	"S琻 Dng o nh﹏",	24,	10,	3600 * 24 * 30, "V? ng t鬰 gia"    },
	[17] = 	{3000,	"Hi謚 髖",		24,	11,	3600 * 24 * 30, "Dng M玭 thng K?"    },
	[18] = 	{3000,	"Й 髖",		24,	12,	3600 * 24 * 30, "Dng M玭 Cung K?"    },
	[20] = 	{3000,	"Th玦 M謓h T秐 Nh﹏",	24,	13,	3600 * 24 * 30, "Hi謕 чc"    },
	[21] = 	{3000,	"Th鵦 T﹎ T秐 Nh﹏",	24,	14,	3600 * 24 * 30, "T? чc"    },
}

tTab_gao =
{
	["index"] = 3,
--物品大类，副类，详细类别，流派，需要声望，称号名称，对应称号表内的大类，副类，持续时间(真实时间)，流派名
	[2] = 	{6000,	"Чt Ma Kim Cang",	25,	1 ,	3600 * 24 * 30, "Thi誹 L﹎ t鬰 gia"	  },
	[4] = 	{6000,	"La H竛 H? Ph竝",	25,	2 ,	3600 * 24 * 30, "Thi誹 L﹎ v? t╪g"    },
	[3] = 	{6000,	"Truy襫 kinh ph竝 s?",	25,	3 ,	3600 * 24 * 30, "Thi誹 L﹎ thi襫 t╪g"    },
	[6] = 	{6000,	"B? c th輈h kh竎h",	25,	4 ,	3600 * 24 * 30, "Л阯g M玭"        },
	[8] = 	{6000,	"T? Tr骳 s?"  ,	25,	5 ,	3600 * 24 * 30, "Nga My ph藅 gia"    },
	[9] = 	{6000,	"H秈 Nguy謙 s?"  ,	25,	6 ,	3600 * 24 * 30, "Nga My t鬰 gia"    },
	[11] = 	{6000,	"T? H秈 hi謕"  ,	25,	7 ,	3600 * 24 * 30, "C竔 Bang T躰h y"    },
	[12] = 	{6000,	"е t? t竚 t骾",	25,	8 ,	3600 * 24 * 30, "C竔 Bang ? Y"    },
	[14] = 	{6000,	"V? ng? o nh﹏",	25,	9 ,	3600 * 24 * 30, "V? ng o gia"    },
	[15] = 	{6000,	"Nh祅 V﹏ Hi謕 Чo",	25,	10,	3600 * 24 * 30, "V? ng t鬰 gia"    },
	[17] = 	{6000,	"Ph蕁 v? tng qu﹏",	25,	11,	3600 * 24 * 30, "Dng M玭 thng K?"    },
	[18] = 	{6000,	"Ph蕁 uy tng qu﹏",	25,	12,	3600 * 24 * 30, "Dng M玭 Cung K?"    },
	[20] = 	{6000,	"H綾 V? Thng"  ,	25,	13,	3600 * 24 * 30, "Hi謕 чc"    },
	[21] = 	{6000,	"B筩h V? Thng"  ,	25,	14,	3600 * 24 * 30, "T? чc"    },
}                                   

tTab_zuigao =
{
	["index"] = 4,
--物品大类，副类，详细类别，流派，需要声望，称号名称，对应称号表内的大类，副类，持续时间(真实时间)，流派名
	[2] = 	{10000,	"B竧 B? Thi猲 Long",	26,	1 ,	3600 * 24 * 30, "Thi誹 L﹎ t鬰 gia"	  },
	[4] = 	{10000,	"B竧 B秓 La H竛",	26,	2 ,	3600 * 24 * 30, "Thi誹 L﹎ v? t╪g"    },
	[3] = 	{10000,	"V? Lng Ph竝 T玭",	26,	3 ,	3600 * 24 * 30, "Thi誹 L﹎ thi襫 t╪g"    },
	[6] = 	{10000,	"Thi猲 C? S? Gi?",	26,	4 ,	3600 * 24 * 30, "Л阯g M玭"        },
	[8] = 	{10000,	"B筩h Li猲 Ti猲 T?",	26,	5 ,	3600 * 24 * 30, "Nga My ph藅 gia"    },
	[9] = 	{10000,	"Ng鋍 V薾 Ti猲 T?",	26,	6 ,	3600 * 24 * 30, "Nga My t鬰 gia"    },
	[11] = 	{10000,	"Long u Th莕 C竔",	26,	7 ,	3600 * 24 * 30, "C竔 Bang T躰h y"    },
	[12] = 	{10000,	"Kh蕋 Thi猲 Th莕 C竔",	26,	8 ,	3600 * 24 * 30, "C竔 Bang ? Y"    },
	[14] = 	{10000,	"Chng Kinh o nh﹏",	26,	9 ,	3600 * 24 * 30, "V? ng o gia"    },
	[15] = 	{10000,	"Th竔 蕋 T秐 Nh﹏",	26,	10,	3600 * 24 * 30, "V? ng t鬰 gia"    },
	[17] = 	{10000,	"Long Tng tng qu﹏",	26,	11,	3600 * 24 * 30, "Dng M玭 thng K?"    },
	[18] = 	{10000,	"H? D鵦 tng qu﹏",	26,	12,	3600 * 24 * 30, "Dng M玭 Cung K?"    },
	[20] = 	{10000,	"U Minh Qu? S竧",	26,	13,	3600 * 24 * 30, "Hi謕 чc"    },
	[21] = 	{10000,	"V? фng La S竧",	26,	14,	3600 * 24 * 30, "T? чc"    },
}

tItem =
{
	{2, 1, 1053, tTab_chu},
	{2, 1, 1054, tTab_zhong},
	{2, 1, 1018, tTab_gao},
	{2, 1, 1055, tTab_zuigao},
}

function GetPlayerSex()
	if GetSex() == 1 then
		return "Thi誹 hi謕"
	else
		return "N? hi謕 "
	end
end

function OnUse(nidx)
	local nItemIndex = tonumber(nidx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	local nTabIndex = 0
	for index, value in tItem do
		if value[1] == nGenre and value[2] == nDetail and value[3] == nParticular then
			nTabIndex = index
			break
		end
	end
	
	if nTabIndex == 0 then
		return
	end
	SetTaskTemp(30, nTabIndex)
	local tTab = tItem[nTabIndex][4]
	
	local nRoute = GetPlayerRoute()
	if tTab[nRoute] == nil then
		Say("Ngi ch璦 gia nh藀 m玭 ph竔, kh玭g th? s? d鬾g v藅 ph萴 n祔", 0)
		return
	end
	Say(tTab[nRoute][6].."觤 c鑞g hi課  t? s? m玭 t 頲 <color=yellow>"..tTab[nRoute][1].."<color> l? 頲 phong <color=green> "..tTab[nRoute][2].." <color>, mu鑞 d飊g kh玭g?", 2, "ng/yes_say", "Sai/no_say")
end

function yes_say()
	local nIndex = GetTaskTemp(30)
	local tTab = tItem[nIndex][4]
	local nRoute = GetPlayerRoute()
	
	local nExist = 0
	for i = 1, getn(tItem) do
		if IsTitleExist(i + START_INDEX - 1, tTab[nRoute][4]) > 0 then
			local t = tItem[i][4]
			nExist = t["index"]
			break
		end
	end
	
	if nIndex < nExist then
		Say("Ъng c蕄 x璶g hi謚 s? m玭 c馻 b筺 l韓 h琻 ng c蕄 x璶g hi謚 s? d鬾g v藅 ph萴, kh玭g c莕 d飊g v藅 ph萴 n祔.", 0)
	elseif nIndex == nExist then
		Say("Ngi  l? <color=green> "..tTab[nRoute][2].." <color> r錳.", 0)
	elseif GetTask(336) < tTab[nRoute][1] then
		Say(GetPlayerSex().."ч c鑞g hi課 s? m玭 c馻 b筺 kh玭g .", 0)
	elseif nExist > 0 then
		Say("Hi謓 ngi  c? danh hi謚 <color=red> "..tItem[nExist][4][nRoute][2].." <color>! C? mu鑞 i th祅h <color=green> "..tTab[nRoute][2].." <color>?", 2, "ng/#yes_change_title("..nIndex..")", "Sai/no_say")
	else
		yes_change_title(nIndex)
	end
end

function yes_change_title(nIndex)
	local tTab = tItem[nIndex][4]
	local nRoute = GetPlayerRoute()

	if DelItem(tItem[nIndex][1], tItem[nIndex][2], tItem[nIndex][3], 1) == 1 then
		-- 删除掉低级声望
		for i = START_INDEX, START_INDEX + getn(tItem) do
			RemoveTitle(i, tTab[nRoute][4])
		end
		local nGenre = tTab[nRoute][3]
		local nDetail = tTab[nRoute][4]
		local nTime = tTab[nRoute][5]
		AddTitle(nGenre, nDetail)
		SetTitleTime(nGenre, nDetail, GetTime() + nTime)
		local nYear, nMonth, nDay, nHour, nMin, nSec = AddTitleTime(nGenre, nDetail, 0)
		Msg2Player("B筺 nh薾 頲 x璶g hi謚"..tTab[nRoute][2])
		SetCurTitle(nGenre, nDetail)
	end
end

function no_say()

end