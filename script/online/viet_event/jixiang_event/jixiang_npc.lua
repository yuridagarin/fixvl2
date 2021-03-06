--File name:	jixiang_npc.lua
--Describe:		吉祥小包活动npc脚本
--Create Date:	2008-06-24
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\jixiang_event\\jixiang_head.lua");
Include("\\script\\lib\\globalfunctions.lua")

g_LogTitle = "C竧 tng th筩h : ".."фi";		--此处分为2段只是为了不增加新的翻译

g_tBookList =
{
	[2] = {"Kim Cang Ph鬰 Ma kinh",0,	107,	1,	1},
	[3] = {"V? Tr莕 M藅 t辌h",	0,	107,	5,	1},
	[4] = {"Ti襪 Long M藅 t辌h",	0,	107,	3,	1},
	[6] = {"Thi猲 La M藅 T辌h",	0,	107,	7,	1},
	[8] = {"Nh? ? M藅 T辌h",	0,	107,	9,	1},
	[9] = {"B輈h H秈 Ph?",	0,	107,	11,	1},
	[11] = {"H鏽 чn M藅 t辌h",	0,	107,	13,	1},
	[12] = {"Qu? Thi猲 M藅 t辌h",	0,	107,	15,	1},
	[14] = {"Huy襫 秐h M藅 t辌h",	0,	107,	17,	1},
	[15] = {"Qu﹏ T? M藅 t辌h",	0,	107,	19,	1},
	[17] = {"Tr蕁 Qu﹏ M藅 t辌h",	0,	107,	21,	1},
	[18] = {"Xuy猲 V﹏ M藅 t辌h",	0,	107,	23,	1},
	[20] = {"U Minh Qu? L鬰",	0,	107,	25,	1},
	[21] = {"Linh C? M藅 t辌h",	0,	107,	27,	1},
}

g_tItemList =
{
	--		名称			G1	G2	G3	数量	吉祥石数量	负重
	[1] = {"Tam Thanh ho祅",		2,	1,	1097,	1,	1,		1},
	[2] = {"B秓 rng T祅g Ki誱 y gi竝",	2,	1,	1060,	1,	10,		1},
	[3] = {"B秓 rng T祅g Ki誱 v? kh?",	2,	1,	1063,	1,	20,		1},
	[4] = {"Phi猽 V?",			0,	105,15,		1,	30,		10},
	[5] = {"B秓 rng T祅g Ki誱 trang s鴆",	2,	1,	1062,	1,	80,		1},
	[6] = {"Huy hi謚 chi課 c玭g (huy ho祅g)",	2,	1,	9977,	1,	100,	1},
	[7] = {"B秓 rng T祅g Ki誱 hoa kh?",	2,	1,	1061,	1,	150,	1},
	[8] = {"B秓 rng T祅g Ki誱 u qu竛",	2,	1,	1059,	1,	200,	1},
	[9] = {"Thi猲 Th筩h linh th筩h",		2,	1,	1068,	1,	400,	1},
	[10] = {"u th祅h bi觰",		2,	1,	9978,	1,	500,	1},
}

function main()
	if is_jixiang_event_viet_open() == 0 then
		return
	end
	exchange_talk()
end

function exchange_talk()
	local selTab = {
				"1 C竧 Tng Th筩h = 1 Tam thanh ho祅/#exchange_prize(1)",
				"10 C竧 Tng Th筩h = 1 B秓 rng t祅g ki誱 y gi竝/#exchange_prize(2)",
				"20 C竧 Tng Th筩h = 1 B秓 rng t祅g ki誱 v? kh?/#exchange_prize(3)",
				"30 C竧 Tng Th筩h = 1 ng鵤 Phi猲 V?/#exchange_prize(4)",
				"80 C竧 Tng Th筩h = 1 B秓 rng t祅g ki誱 trang s鴆/#exchange_prize(5)",
				"100 C竧 Tng Th筩h = 1 Huy hi謚 chi課 c玭g (huy ho祅g)/#exchange_prize(6)",
				"Xem trang sau/exchange_talk_2",
				"K誸 th骳 i tho筰/no",
				}
	Say("<color=green>D? Th秓<color>: ".."T? 01-08-2008 n 24:00 10-08-2008, c竎 v? i hi謕 c? th? d飊g C竧 Tng Th筩h  i nh鱪g ph莕 thng di y, c? mu鑞 i ph莕 thng b﹜ gi? hay kh玭g?",getn(selTab),selTab);
end

function exchange_talk_2()
	local selTab = {
				"150 C竧 Tng Th筩h = 1 B秓 rng t祅g ki誱 hoa kh?/#exchange_prize(7)",
				"200 C竧 Tng Th筩h = 1 B秓 rng t祅g ki誱 u qu竛/#exchange_prize(8)",
				"400 C竧 Tng Th筩h = 1 Thi猲 th筩h linh th筩h/#exchange_prize(9)",
				"500 C竧 Tng Th筩h = 1 u th祅h bi觰/#exchange_prize(10)",
				"900 C竧 Tng Th筩h = 1 M藅 t辌h m玭 ph竔/#exchange_prize(11)",
				"Xem trang trc/exchange_talk",
				"K誸 th骳 i tho筰/no",
				}
	Say("<color=green>D? Th秓<color>: ".."T? 01-08-2008 n 24:00 10-08-2008, c竎 v? i hi謕 c? th? d飊g C竧 Tng Th筩h  i nh鱪g ph莕 thng di y, c? mu鑞 i ph莕 thng b﹜ gi? hay kh玭g?",getn(selTab),selTab);
end

function exchange_prize(nType)
	if nType == 11 then
		local nRoute = GetPlayerRoute();
		local tRoutes = {0,1,5,7,10,13,16,19};
		local i = 0;
		for i=1,getn(tRoutes) do
			if nRoute == tRoutes[i] then
				Say("<color=green>D? Th秓<color>: Ph秈 gia nh藀 trng ph竔 v? c玭g m韎 m韎 c? th? i S? m玭 m藅 t辌h.",0);
				return
			end
		end
		give_book_prize(nRoute);
	elseif nType >= 1 and nType <= 10 then

		if GetItemCount(2,1,30015) < g_tItemList[nType][6] then
			Say("<color=green>D? Th秓<color>: C竧 tng th筩h mang theo kh玭g .",1,"Th藅 ng筰 qu?,  ta ki觤 tra l筰!/no");
			return
		else
			if gf_Judge_Room_Weight( g_tItemList[nType][5], g_tItemList[nType][5] * g_tItemList[nType][7] ) == 0 then
				Talk(1,"","<color=green>D? Th秓<color>: H穣 m b秓 h祅h trang  ch? tr鑞g v? tr鋘g lng  tr竛h l穘g ph? kh玭g c莕 thi誸.");
				return
			end;
			if DelItem(2,1,30015,g_tItemList[nType][6]) == 1 then
				if nType == 4 then		--翻羽
					add_fanyu(g_tItemList[nType][5], g_tItemList[nType][1]);
				else
					add_item_ex(g_tItemList[nType][1],g_tItemList[nType][2],g_tItemList[nType][3],g_tItemList[nType][4],g_tItemList[nType][5]);
				end
			else
				Say("<color=green>D? Th秓<color>: C竧 tng th筩h mang theo kh玭g .",1,"Th藅 ng筰 qu?,  ta ki觤 tra l筰!/no");
				return
			end
		end
		
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] function exchange_prize(nType), parameter nType error, nType = "..nType);
	end
end


function add_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	local nItemIdx = 0;
	nRetCode,nItemIdx = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		SetItemExpireTime(nItemIdx,30*24*3600)	
		Msg2Player("B筺 nh薾 頲  "..nItemNum.." c竔 "..szItemName);
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName);
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function add_item_ex3(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;	
	nRetCode = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲  "..nItemNum.." c竔 "..szItemName);
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName);
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function give_book_prize(nType)
	if GetItemCount(2,1,30015) < 900 then
		Say("<color=green>D? Th秓<color>: C竧 tng th筩h mang theo kh玭g .",1,"Th藅 ng筰 qu?,  ta ki觤 tra l筰!/no");
		return
	else
		if gf_Judge_Room_Weight(1,20) == 0 then
			Talk(1,"","<color=green>D? Th秓<color>: H穣 m b秓 h祅h trang  ch? tr鑞g v? tr鋘g lng  tr竛h l穘g ph? kh玭g c莕 thi誸.");
			return
		end;
		if DelItem(2,1,30015,900) == 1 then
			add_item_ex3(g_tBookList[nType][1],g_tBookList[nType][2],g_tBookList[nType][3],g_tBookList[nType][4],g_tBookList[nType][5]);
		else
			Say("<color=green>D? Th秓<color>: C竧 tng th筩h mang theo kh玭g .",1,"Th藅 ng筰 qu?,  ta ki觤 tra l筰!/no");
			return
		end
	end
end

function give_suipian_prize()
	if GetItemCount(2,1,30015) < 900 then
		Say("<color=green>D? Th秓<color>: C竧 tng th筩h mang theo kh玭g .",1,"Th藅 ng筰 qu?,  ta ki觤 tra l筰!/no");
		return
	else
		if gf_Judge_Room_Weight(1,50) == 0 then
			Talk(1,"","<color=green>D? Th秓<color>: H穣 m b秓 h祅h trang  ch? tr鑞g v? tr鋘g lng  tr竛h l穘g ph? kh玭g c莕 thi誸.");
			return
		end;
		if DelItem(2,1,30015,900) == 1 then
			add_item_ex("B秐 v? c t筼 th莕 kh?",2,1,1086,10);
		else
			Say("<color=green>D? Th秓<color>: C竧 tng th筩h mang theo kh玭g .",1,"Th藅 ng筰 qu?,  ta ki觤 tra l筰!/no");
			return
		end
	end
end

function add_fanyu(nItemNum,szItemName)
	local nRetCode = 0;
	local nItemIdx = 0;
	nRetCode, nItemIdx = AddItem(0, 105, 15, nItemNum, 1, -1,-1,-1,-1,-1,-1);
	if nRetCode == 1 then
		SetItemExpireTime(nItemIdx,30*24*3600)				
		Msg2Player("B筺 nh薾 頲  "..nItemNum.." c竔 "..szItemName);
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName);
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function no()
end

