--File name:	mystery_box.lua
--Describe:		神秘宝箱脚本
--Item ID:		2,1,30031
--Create Date:	2008-09-26
--Author:		chenbenqian
Include("\\script\\lib\\writelog.lua")

--DATE_FRUIT_ITEM_VIET_END		= 2008102100;		-- 神秘宝箱使用结束日期
g_LogTitle = "B秓 rng Th莕 b?";
strLogCaption = "Hoat Dong Thang 10"

g_tPrizeItemList =
{
	--		"名称",		G1,	G2,		G3,		概率,	固定属性
	[1] = {"M秐h Thi猲 th筩h",	2,	2,		7,		500,	0},
	[2] = {"Thi猲 th筩h",		2,	2,		8,		900,	0},
	[3] = {"B錸g Lai Ti猲 Th駓",	2,	1,		1012,	1700,	0},
	[4] = {"C鰑 chuy觧 h錳 h錸 n",1,	0,		32,		1320,	0},
	[5] = {"Ch﹏ th?",	2,	1,		112,	1000,		0},
	[6] = {"Thi猲 H? M藅 t辌h",	0,	107,	64,		1000,		0},
	[7] = {"T? H? M藅 t辌h",	0,	107,	65,		500,		0},
	[8] = {"Chi猰 Y Ph?",	0,	107,	66,		210,		0},
	[9] = {"Ti觰 Th? Gi韎 Ch?",	0,	102,	36,		1000,		1},
	[10] = {"Trang Ch? m穙",	0,	103,	91,		50,		1},
	[11] = {"Trang Ch? m穙",	0,	103,	92,		50,		1},
	[12] = {"Trang Ch? m穙",	0,	103,	93,		50,		1},
	[13] = {"Trang Ch? m穙",	0,	103,	94,		50,		1},
	[14] = {"T鎛g Qu秐 Ngo筰 trang",	0,	100,	91,		200,		1},
	[15] = {"T鎛g Qu秐 Ngo筰 trang",	0,	100,	92,		200,		1},
	[16] = {"T鎛g Qu秐 Ngo筰 trang",	0,	100,	93,		200,		1},
	[17] = {"T鎛g Qu秐 Ngo筰 trang",	0,	100,	94,		200,		1},
	[18] = {"T鎛g Qu秐 kh?",	0,	101,	91,		200,		1},
	[19] = {"T鎛g Qu秐 kh?",	0,	101,	92,		200,		1},
	[20] = {"T鎛g Qu秐 kh?",	0,	101,	93,		200,		1},
	[21] = {"T鎛g Qu秐 kh?",	0,	101,	94,		200,		1},
	[22] = {"Trng L穙 Ch? Ho祅",	0,	102,		37,	70,		1},

}


function OnUse(nItemIdx)
--	local nDate = tonumber(date("%Y%m%d%H"));
--	if nDate >= DATE_FRUIT_ITEM_VIET_END then
--		return
--	end

	if DelItemByIndex(nItemIdx,1) == 1 then
		use();
	end;
end;

function use()
	local nRandom = random(1,10000);
	local nBase = 0;
	for i=1, getn(g_tPrizeItemList) do
		nBase = nBase + g_tPrizeItemList[i][5];
		if nRandom <= nBase then
			add_item_ex(g_tPrizeItemList[i]);
			return
		end;
	end;
end;


function add_item_ex(tItem)
	local nRetCode = 0;
	if tItem[6] == 0 then
		nRetCode = AddItem(tItem[2],tItem[3],tItem[4],1);
	elseif tItem[6] == 1 then
		nRetCode = AddItem(tItem[2],tItem[3],tItem[4],1,1,-1,-1,-1,-1,-1,-1);
	end
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲 1  "..tItem[1]);		
		WriteLogEx(strLogCaption,"B秓 rng Th莕 b?",1,tItem[1])
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain 1 "..tItem[1].." Failed, return value = "..nRetCode);
	end
end

