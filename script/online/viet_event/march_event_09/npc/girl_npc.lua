--File name:	girl_npc.lua
--Describe:		妇女节活动琼儿npc脚本
--Create Date:	2009-02-18
--Author:		chenbenqian

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\march_event_09\\march_event_func.lua")

g_szLogTitle = "Event thang 3"			--此处分为2段只是为了不增加新的翻译
g_szInfoHead = "<color=green>".."Qu鷑h Nhi Ti觰 Th?".."<color>: "

g_tbItem = 
{
	--		名字		ID1,ID2,	ID3,	数量 期限
	[1] = {"Hoa h錸g ",	0,	108,	117,	1,	14},
	[2] = {"Hoa h錸g ph蕁",	0,	108,	118,	1,	14},
	[3] = {"Hoa h錸g v祅g",	0,	108,	119,	1,	14},
	[4] = {"Hoa h錸g ",	0,	108,	120,	1,	14},
	[5] = {"Hoa h錸g ph蕁",	0,	108,	121,	1,	14},
	[6] = {"Hoa h錸g v祅g",	0,	108,	122,	1,	14},
	[7] = {"T? 竜",		2,	1,		30070,	1,	14},
}


function main()
	if is_women_0308_09_viet_open() == 0 then
		Talk(1,"",g_szInfoHead.."Ho箃 ng  qu鑓 t? ph? n?  k誸 th骳");
		return
	end
	local selTab = {
				"T筰 h? n  nh薾 thng.!/want_award",
				"Ta ch? n xem th?/no",
				}
	Say(g_szInfoHead.."Nh籱 ch祇 m鮪g ng祔 Qu鑓 T? Ph? N?, t蕋 c? c竎 nh﹏ v藅 n? t c蕄  40 tr? l猲 c? th? n g苝 Qu鷑h Nhi Ti觰 Th?  nh薾 qu? t苙g..\nHo箃 ng ch? di詎 ra trong 3 ng祔: t? ng祔 06 n 24:00 ng祔 08-03-2009.",getn(selTab),selTab);
end

function want_award()
	if GetSex() ~= 2 then
		Say(g_szInfoHead.."Ch? c? nh﹏ v藅 n? m韎 nh薾 頲 ph莕 thng!",1,"K誸 th骳 i tho筰/no");
		return
	end
	if GetLevel() < 40 then
		Say(g_szInfoHead.."C? nng ch璦  c蕄   nh薾 qu? t苙g l莕 n祔. H穣 c? g緉g l猲 nh?!",1,"V﹏g! T筰 h? s? quay l筰 sau khi c?  nguy猲 li謚!!/no");
		return
	end
	if GetPlayerRoute() == 0 then
		Say(g_szInfoHead.."Ho箃 ng n祔 y猽 c莡 ngi ch琲 ph秈 gia nh藀 v祇 m玭 ph竔.",1,"K誸 th骳 i tho筰/no");
		return
	end
	if GetTask(GAIN_AWARD_09_WOMEN_0308_VIET) == 1 then
		Say(g_szInfoHead.."C? nng  nh薾 ph莕 thng r錳, kh玭g th? nh薾 th猰 頲 n鱝. H裯 g苝 l筰 nh?!",1,"K誸 th骳 i tho筰/no");
		return
	end
	if gf_Judge_Room_Weight(2,20) == 0 then
		Say(g_szInfoHead.."Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!",1,"K誸 th骳 i tho筰/no");
		return
	end
	give_award();
end

function give_award()
	local nRandom = random(1,3)
	if GetBody() == 3 then
		add_item_ex(g_tbItem[nRandom])
	elseif GetBody() == 4 then
		add_item_ex(g_tbItem[nRandom+3])
	end
	add_item_ex(g_tbItem[7])
	SetTask(GAIN_AWARD_09_WOMEN_0308_VIET, 1)
end

function add_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0
	local nItemIdx = 0

	nRetCode, nItemIdx = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		if tItem[6] > 0 then
			SetItemExpireTime(nItemIdx, tItem[6]*24*3600)
		end
		Msg2Player("B筺 nh薾 頲  "..nItemNum.." c竔 "..szItemName);
		WriteLogEx(g_szLogTitle, "Qu鷑h Nhi", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName(), "Thu 頲 th蕋 b筰, ".."AddItem return value = "..nRetCode)
	end
end


function no()

end

