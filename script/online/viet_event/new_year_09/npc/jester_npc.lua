--File name:	jester_npc.lua
--Describe:		春节活动小丑npc文件
--Create Date:	2008-12-24
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\new_year_09\\new_year_func.lua")
Include("\\script\\lib\\globalfunctions.lua")

TYPE_NULL 	= 0;	--没有奖励
TYPE_ITEM 	= 1;	--普通物品
TYPE_EQUIP 	= 2;	--带属性装备类物品
TYPE_CMD 	= 3;	--命令

g_szLogTitle = "Hoat dong Tet 2009"				--此处分为2段只是为了不增加新的翻译
g_szInfoHead = "<color=green>".."Ti觰 S鰑".."<color>: "

g_nDenominator = 10000								--分母，表示概率的单位是x分之1
g_nExpNum = 100000									--使用梅–兰–菊–竹获得的经验值

g_szFileName = "jester_npc.lua"						--文件名


g_tbOldItem = 
{
	--		名字		ID1,ID2,ID3,	数量
	[1] = {"Nc Tinh Khi誸",		2,	1,	30047,	5,	},
	[2] = {"B譶h Hoa",		2,	1,	30048,	1,	},
	[3] = {"Dng Ch蕋",		2,	1,	30049,	4,	},
	[4] = {"Nh竛h Уo",	2,	1,	30050,	1,	},
	[5] = {"Nh竛h hoa Mai",	2,	1,	30051,	1,	},
}

g_tbNewItem = 
{
	--		名字		ID1,ID2,ID3,	数量
	[1] = {"Hoa Уo",	2,	1,	30052,	1,	},
	[2] = {"Hoa Mai",	2,	1,	30053,	1,	},
}

g_tbWord =
{
	--		名字		ID1,ID2,ID3,	数量
	[1] = {"Ch? Mai",	2,	1,	30054,	1,	},
	[2] = {"Ch? Lan",	2,	1,	30055,	1,	},
	[3] = {"Ch? Tr骳",	2,	1,	30056,	1,	},
	[4] = {"Ch? C骳",	2,	1,	30057,	1,	},
}

g_tbWordAward = 
{
	--		类型	   概率		数量 名字		ID1,ID2,ID3
	[1] = {TYPE_NULL,	9545,	},
	[2] = {TYPE_EQUIP,	10,		1,	"Ti觰 Th? Gi韎 Ch?",		0,	102,	36,	},
	[3] = {TYPE_EQUIP,	10,		1,	"Trang Ch? m穙",		0,	103,	91,	},
	[4] = {TYPE_EQUIP,	10,		1,	"Trang Ch? m穙",		0,	103,	92,	},
	[5] = {TYPE_EQUIP,	10,		1,	"Trang Ch? m穙",		0,	103,	93,	},
	[6] = {TYPE_EQUIP,	10,		1,	"Trang Ch? m穙",		0,	103,	94,	},
	[7] = {TYPE_EQUIP,	50,		1,	"T鎛g Qu秐 Ngo筰 trang",		0,	100,	91,	},
	[8] = {TYPE_EQUIP,	50,		1,	"T鎛g Qu秐 Ngo筰 trang",		0,	100,	92,	},
	[9] = {TYPE_EQUIP,	50,		1,	"T鎛g Qu秐 Ngo筰 trang",		0,	100,	93,	},
	[10] = {TYPE_EQUIP,	50,		1,	"T鎛g Qu秐 Ngo筰 trang",		0,	100,	94,	},
	[11] = {TYPE_EQUIP,	50,		1,	"T鎛g Qu秐 kh?",		0,	101,	91,	},
	[12] = {TYPE_EQUIP,	50,		1,	"T鎛g Qu秐 kh?",		0,	101,	92,	},
	[13] = {TYPE_EQUIP,	50,		1,	"T鎛g Qu秐 kh?",		0,	101,	93,	},
	[14] = {TYPE_EQUIP,	50,		1,	"T鎛g Qu秐 kh?",		0,	101,	94,	},
	[15] = {TYPE_EQUIP,	5,		1,	"Trng L穙 Ch? Ho祅",		0,	102,	37,	},
}

function main()
	if is_new_year_09_viet_open() == 0 then
		Talk(1,"",g_szInfoHead.."Ho箃 ng t誸  k誸 th骳.");
		return
	end
	local selTab = {
				"фi 1 hoa Уo/#want_exchange(1)",
				"фi 1 hoa Mai/#want_exchange(2)",
				"Mua nh竛h hoa o (1 v祅g 50 b筩)/bug_peach",
				"Ta  thu th藀  b? ch? [Mai-Lan-Tr骳-C骳]/exchange_word",
				"Nh薾 v藅 ph萴 c萴 nang i s? ki謓/give_pouch",
				"Ta ch? n xem th?/no",
				}
	Say(g_szInfoHead.."T筰 h? l? ngi tr錸g ch╩ s鉩 Hoa Mai v? Hoa Уo n t? v飊g giang nam, ch糿g hay t筰 h? c? th? gi髉 g? cho i hi謕?",getn(selTab),selTab);
end

function bug_peach()
	if GetCash() < 15000 then
		Say(g_szInfoHead.."Чi hi謕 kh玭g  ng﹏ lng tr猲 ngi r錳!",1,"Th藅 l? ng筰 qu?! T筰 h? xin c竜 t?./no")
		return
	end
	if gf_Judge_Room_Weight(1,20) == 0 then
		Talk(1,"",g_szInfoHead.."Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!")
		return
	end
	if pay_ex(15000) == 1 then
		add_item_ex(g_tbOldItem[4])
	else
		Say(g_szInfoHead.."Чi hi謕 kh玭g  ng﹏ lng tr猲 ngi r錳!",1,"Th藅 l? ng筰 qu?! T筰 h? xin c竜 t?./no")
		return
	end
	main()
end

function give_pouch()
	if GetItemCount(2, 1, 30045) > 0 then
		Say(g_szInfoHead.."Чi hi謕  c? m閠 c竔 r錳, kh玭g th? nh薾 ti誴 頲 n鱝!",1,"K誸 th骳 i tho筰/no")
		return
	end
	if gf_Judge_Room_Weight(1,20) == 0 then
		Talk(1,"",g_szInfoHead.."Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!")
		return
	end
	add_item_ex( {"C萴 Nang Чi S? Ki謓",	2,	1,	30045,	1} )
end

function want_exchange(nType)
	local selTab = {
				format("уng ? i /#exchange_box(%d)", nType),
				"Ta ch? n xem th?/no",
				}
	if nType == 1 then
		Say(g_szInfoHead.."\n  5 Nc Tinh Khi誸 + 1 B譶h Hoa + 4 Dng Ch蕋 + 1 Nh竛h Hoa Уo = 1 Hoa Уo \n Чi hi謕 c? mu鑞 i kh玭g?",getn(selTab),selTab);
	elseif nType == 2 then
		Say(g_szInfoHead.."\n  5 Nc Tinh Khi誸 + 1 B譶h Hoa + 4 Dng Ch蕋 + 1 Nh竛h Hoa Mai = 1 Hoa Mai \n Чi hi謕 c? mu鑞 i kh玭g?",getn(selTab),selTab);
	else
		WriteLogEx(g_szLogTitle, "NULL", "NULL", "NULL", "NULL", GetTongName(), "function want_exchange(nType) in file "..g_szFileName..", parameter nType error, nType = "..nType)
	end
end

function exchange_box(nType)
	if nType == 1 then
		if check_item_count(g_tbOldItem[1]) == 0 or check_item_count(g_tbOldItem[2]) == 0 or check_item_count(g_tbOldItem[3]) == 0 or check_item_count(g_tbOldItem[4]) == 0 then
			Say(g_szInfoHead.."Kh玭g  nguy猲 li謚 c莕 thi誸.",1,"Th藅 l? ng筰 qu?! T筰 h? xin c竜 t?./no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"",g_szInfoHead.."Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!");
				return
			end;
			if del_item_ex(g_tbOldItem[1]) == 1 and del_item_ex(g_tbOldItem[2]) == 1 and del_item_ex(g_tbOldItem[3]) == 1 and del_item_ex(g_tbOldItem[4]) == 1 then
				add_item_ex(g_tbNewItem[1])
			else
				Say(g_szInfoHead.."Kh玭g  nguy猲 li謚 c莕 thi誸.",1,"Th藅 l? ng筰 qu?! T筰 h? xin c竜 t?./no");
				return
			end
		end
	elseif nType == 2 then
		if check_item_count(g_tbOldItem[1]) == 0 or check_item_count(g_tbOldItem[2]) == 0 or check_item_count(g_tbOldItem[3]) == 0 or check_item_count(g_tbOldItem[5]) == 0 then
			Say(g_szInfoHead.."Kh玭g  nguy猲 li謚 c莕 thi誸.",1,"Th藅 l? ng筰 qu?! T筰 h? xin c竜 t?./no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"",g_szInfoHead.."Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!");
				return
			end;
			if del_item_ex(g_tbOldItem[1]) == 1 and del_item_ex(g_tbOldItem[2]) == 1 and del_item_ex(g_tbOldItem[3]) == 1 and del_item_ex(g_tbOldItem[5]) == 1 then
				add_item_ex(g_tbNewItem[2])
			else
				Say(g_szInfoHead.."Kh玭g  nguy猲 li謚 c莕 thi誸.",1,"Th藅 l? ng筰 qu?! T筰 h? xin c竜 t?./no");
				return
			end
		end
	else
		WriteLogEx(g_szLogTitle, "NULL", "NULL", "NULL", "NULL", GetTongName(), "function exchange_box(nType) in file "..g_szFileName..", parameter nType error, nType = "..nType)
	end
	main()
end

function exchange_word()
	if check_item_count(g_tbWord[1]) == 0 or check_item_count(g_tbWord[2]) == 0 or check_item_count(g_tbWord[3]) == 0 or check_item_count(g_tbWord[4]) == 0 then
		Say(g_szInfoHead.."Kh玭g  nguy猲 li謚 c莕 thi誸.",1,"Th藅 l? ng筰 qu?! T筰 h? xin c竜 t?./no");
		return
	else
		if gf_Judge_Room_Weight(1,100) == 0 then
			Talk(1,"",g_szInfoHead.."Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!");
			return
		end;
		if del_item_ex(g_tbWord[1]) == 1 and del_item_ex(g_tbWord[2]) == 1 and del_item_ex(g_tbWord[3]) == 1 and del_item_ex(g_tbWord[4]) == 1 then
			give_word_award()
		else
			Say(g_szInfoHead.."Kh玭g  nguy猲 li謚 c莕 thi誸.",1,"Th藅 l? ng筰 qu?! T筰 h? xin c竜 t?./no");
			return
		end
	end
end

function give_word_award()
	--经验奖励部分
	local nExp = g_nExpNum
	local nExpTotal = GetTask(PLUM_TOTALEXP_09_NEWYEAR_VIET)
	if nExpTotal >= PLUM_EXP_LIMIT_09_NEWYEAR_VIET then
		Msg2Player("Чi hi謕  thu 頲 kinh nghi謒 t? ho箃 ng Mai Уo Ch骳 T誸 vt qu? gi韎 h筺. "..PLUM_EXP_LIMIT_09_NEWYEAR_VIET.." , Hi謓 t筰 kh玭g th? nh薾 th猰 kinh nghi謒 t? ho箃 ng n祔, nh璶g c? th? s? c? c? h閕 nh薾 ph莕 thng kh竎.");
		nExp = 0;
	elseif nExpTotal + g_nExpNum > PLUM_EXP_LIMIT_09_NEWYEAR_VIET then
		nExp = PLUM_EXP_LIMIT_09_NEWYEAR_VIET - nExpTotal;
	end
	if nExp ~= 0 then
		ModifyExp(nExp);
		SetTask( PLUM_TOTALEXP_09_NEWYEAR_VIET, (nExpTotal+nExp) )
		Msg2Player("B筺 nh薾 頲  "..nExp.."  甶觤 kinh nghi謒");

		local szItemName = "甶觤 kinh nghi謒"
		local nItemNum = nExp
		local szInfoDescribe = format("ModifyExp(%d)", nItemNum)
		WriteLogEx(g_szLogTitle, "Nh薾 頲", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	end
	--物品奖励部分
	local nRandIdx = get_random_item(g_tbWordAward)
	if nRandIdx == 0 then
		return
	end
	local nType = g_tbWordAward[nRandIdx][1]
	local szItemName = g_tbWordAward[nRandIdx][4]
	local nItemNum = g_tbWordAward[nRandIdx][3]
	local szInfoDescribe = ""

	local nRetCode = 0
	if nType == TYPE_NULL then
		return
	elseif nType == TYPE_ITEM then
		nRetCode = AddItem(g_tbWordAward[nRandIdx][5],g_tbWordAward[nRandIdx][6],g_tbWordAward[nRandIdx][7],g_tbWordAward[nRandIdx][3])
		szInfoDescribe = format("(%d,%d,%d)", g_tbWordAward[nRandIdx][5], g_tbWordAward[nRandIdx][6], g_tbWordAward[nRandIdx][7])
	elseif nType == TYPE_EQUIP then
		nRetCode = AddItem(g_tbWordAward[nRandIdx][5],g_tbWordAward[nRandIdx][6],g_tbWordAward[nRandIdx][7],g_tbWordAward[nRandIdx][3],1,-1,-1,-1,-1,-1,-1)
		szInfoDescribe = format("(%d,%d,%d)", g_tbWordAward[nRandIdx][5], g_tbWordAward[nRandIdx][6], g_tbWordAward[nRandIdx][7])
	elseif nType == TYPE_CMD then
		szInfoDescribe = format(g_tbWordAward[nRandIdx][5],g_tbWordAward[nRandIdx][3])
		dostring(szInfoDescribe)
		nRetCode = 1	--默认命令成功执行
	end;

	if nRetCode == 1 then
		if type(szItemName) == "table" then
			szItemName = szItemName[1]
		else
			Msg2Player("B筺 nh薾 頲  "..nItemNum.." "..szItemName)
		end
		WriteLogEx(g_szLogTitle, "Nh薾 頲", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "Nh薾 頲", "", "", szInfoDescribe, GetTongName(), "Thu 頲 th蕋 b筰, ".."AddItem return value = "..nRetCode)
	end
	main()
end

--按照概率获得g_tbWordAward里面的一项内容
function get_random_item(nTab)
	local nRandom = random(1,g_nDenominator)
	local nBase = 0
	if check_item_tab(nTab) == 1 then
		for i=1,getn(nTab) do
			if nRandom <= nTab[i][2]+nBase then
				return i
			else
				nBase = nBase + nTab[i][2]
			end
		end
	else
		return 0
	end
end

--检查输入的table是否正确
function check_item_tab(tTab)
	local nTotalProbability= 0
	for i=1,getn(tTab) do
		nTotalProbability = nTotalProbability + tTab[i][2]
	end
	if nTotalProbability == g_nDenominator then
		return 1
	else
		print("\n error item table in "..g_szFileName.." \n")
		return 0
	end
end

function add_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0

	nRetCode = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲  "..nItemNum.." c竔 "..szItemName);
		WriteLogEx(g_szLogTitle, "Nh薾 頲", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "Nh薾 頲", "", "", format("(%d,%d,%d)", G, D, P), GetTongName(), "Thu 頲 th蕋 b筰, ".."AddItem return value = "..nRetCode)
	end
end

function del_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0
	
	nRetCode = DelItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		return 1
	else
		WriteLogEx(g_szLogTitle, "Tr? v藅 ph萴 ", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName(), "Tr? v藅 ph萴 th蕋 b筰, ".."DelItem return value = "..nRetCode)
		return 0
	end
end

function pay_ex(nNum)
	local nRetCode = 0;
	nRetCode = Pay(nNum)
	if nRetCode == 1 then
		return 1
	else
		WriteLogEx(g_szLogTitle, format("Pay(%d)", nItemNum), nItemNum, "NULL", "NULL", GetTongName(), format("Pay(%d)", nItemNum).." Failed, return value = "..nRetCode)
		return 0
	end
end

function check_item_count(tItem)
	if GetItemCount(tItem[2],tItem[3],tItem[4]) < tItem[5] then
		return 0
	else
		return 1
	end
end

function no()
end

