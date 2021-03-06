--File name:	girl_npc.lua
--Describe:		圣诞节活动冰儿npc文件
--Create Date:	2008-11-18
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\xmas_08\\xmas_func.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Giang Sinh 2008"			--此处分为2段只是为了不增加新的翻译
g_szInfoHead = "<color=green>".."B╪g Nhi".."<color>: "

g_szFileName = "girl_npc.lua"			--文件名


g_tbOldItem = 
{
	--		名字		ID1,ID2,ID3,	数量
	[1] = {"V? Gi竛g Sinh",	2,	1,	30041,	6,	},
	[2] = {"Chu玭g Gi竛g Sinh",	2,	1,	30042,	3,	},
	[3] = {"Nh竛h Th玭g Gi竛g Sinh",	2,	1,	30040,	1,	},
	[4] = {"C﹜ K裲 Gi竛g Sinh",	2,	1,	30043,	1,	},
	[5] = {"Ng玦 Sao Gi竛g Sinh",	2,	1,	30044,	1,	},
}

g_tbNewItem = 
{
	--		名字		ID1,ID2,ID3,	数量
	[1] = {"H閜 Qu? Xanh",	2,	1,	30033,	1,	},
	[2] = {"H閜 Qu? п",	2,	1,	30034,	1,	},
}

function main()
	if is_xmas_08_viet_open() == 0 then
		return
	end
	local selTab = {
				"фi 1 H閜 Qu? Xanh/#want_exchange(1)",
				"фi 1 H閜 Qu? п/#want_exchange(2)",
				"Mua C﹜ K裲 Gi竛g Sinh (1 c﹜ k裲 = 50 b筩)/bug_sugar",
				"Nh薾 v藅 ph萴 c萴 nang i s? ki謓/give_pouch",
				"Ta ch? n xem th?/no",
				}
	Say(g_szInfoHead.."Ho箃 ng gi竛g sinh n╩ nay di詎 ra t? 06-12-2008 n 24:00 04-01-2009. Trong th阨 gian ho箃 ng, c竎 v? v? l﹎ nh﹏ s? th玭g qua nh qu竔 v? c竎 ch鴆 n╪g  thu 頲 h閜 qu? gi竛g sinh, m? h閜 qu? gi竛g sinh  s? thu 頲 H閜 Qu? Xanh v? H閜 Qu? п. \nC竎 h? mu鑞 i lo筰 qu? n祇?",getn(selTab),selTab);
end

function bug_sugar()
	if GetCash() < 5000 then
		Say(g_szInfoHead.."Чi hi謕 kh玭g  ng﹏ lng tr猲 ngi r錳!",1,"Th藅 l? ng筰 qu?! T筰 h? xin c竜 t?./no")
		return
	end
	if gf_Judge_Room_Weight(1,20) == 0 then
		Talk(1,"",g_szInfoHead.."Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!")
		return
	end
	if pay_ex(5000) == 1 then
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
		Say(g_szInfoHead.."\n  6 V? Gi竛g Sinh + 3 Chu玭g Gi竛g Sinh + 1 Nh竛h Th玭g Gi竛g Sinh + 1 C﹜ K裲 Gi竛g Sinh = 1 H閜 Qu? Xanh",getn(selTab),selTab);
	elseif nType == 2 then
		Say(g_szInfoHead.."\n 6 V? Gi竛g Sinh + 3 Chu玭g Gi竛g Sinh + 1 Nh竛h Th玭g Gi竛g Sinh + 1 Ng玦 Sao Gi竛g Sinh = 1 H閜 Qu? п",getn(selTab),selTab);
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


function add_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0

	nRetCode = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲  "..nItemNum.." c竔 "..szItemName);
		WriteLogEx(g_szLogTitle, "B╪g Nhi", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "B╪g Nhi", "", "", "", "", "Thu 頲 th蕋 b筰, ".."AddItem return value = "..nRetCode)
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

