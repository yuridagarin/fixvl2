--File name:	box_npc.lua
--Describe:		神秘宝箱npc脚本
--Create Date:	2009-02-18
--Author:		chenbenqian

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\march_event_09\\march_event_func.lua")

g_szLogTitle = "Event th竛g 3"				--此处分为2段只是为了不增加新的翻译
g_szInfoHead = "<color=green>".."B秓 rng Th莕 b?".."<color>: "

g_tbItem = 
{
	--		名字		ID1,ID2,	ID3,	数量
	[1] = {"K? Th筩h",		2,	1,		30068,	1,	},
	[2] = {"Ch譨 Kh鉧 V祅g",	2,	1,		30069,	1,	},
}


function main()
	if is_march_09_viet_open() == 0 then
		Talk(1,"",g_szInfoHead.."Ho箃 ng th竛g 3  k誸 th骳 r錳");
		return
	end
	local selTab = {
				"Ta mu鑞 m? B秓 Rng/open_box",
				"Ta ch? n xem th?/no",
				}
	Say(g_szInfoHead.."в m? 頲 Th莕 B? B秓 Rng, c竎 h? ph秈 mang theo Ch譨 Kh鉧 V祅g tr猲 h祅h trang, m鏸 l莕 m? B秓 Rng s? t鑞 1 Ch譨 Kh鉧 V祅g.\n- Ch譨 Kh鉧 V祅g c? b竛 t筰 Ng? C竎..\n- Ho芻 s? d鬾g K裲 S鱝 c騨g c? th? thu th藀 頲 Ch譨 Kh鉧 V祅g..",getn(selTab),selTab);
end

function open_box()
	if check_item_count(g_tbItem[2]) == 0 then
		Say(g_szInfoHead.."C竎 h? kh玭g mang theo Ch譨 Kh鉧 V祅g tr猲 h祅h trang, h穣 ki觤 tra l筰 h祅h trang c馻 m譶h xem!",1,"K誸 th骳 i tho筰/no");
		return
	end
	if gf_Judge_Room_Weight(1,20) == 0 then
		Say(g_szInfoHead.."Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!",1,"K誸 th骳 i tho筰/no");
		return
	end
	if del_item_ex(g_tbItem[2]) == 1 then
		add_item_ex(g_tbItem[1])
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
		WriteLogEx(g_szLogTitle, "B秓 rng Th莕 b?", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName(), "Thu 頲 th蕋 b筰, ".."AddItem return value = "..nRetCode)
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

function check_item_count(tItem)
	if GetItemCount(tItem[2],tItem[3],tItem[4]) < tItem[5] then
		return 0
	else
		return 1
	end
end


function no()

end

