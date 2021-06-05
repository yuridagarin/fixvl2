Include("\\script\\lib\\lingshi_head.lua")
Include("\\settings\\static_script\\lib\\itemfunctions.lua")

tItems = { -- ���ơ�GDP���ȼ�����ͨ|̩ʽ
	[30413] = {"Linh Th�ch Nguy�n Th�ch c�p 1",		{2,1,30413,1},	1,	1},
	[30414] = {"Linh Th�ch Nguy�n Th�ch c�p 2",		{2,1,30414,1},	2,	1},
	[30415] = {"Linh Th�ch Nguy�n Th�ch c�p 3",		{2,1,30415,1},	3,	1},
	[30416] = {"Linh Th�ch Nguy�n Th�ch c�p 4",		{2,1,30416,1},	4,	1},
	[30417] = {"Linh Th�ch Nguy�n Th�ch c�p 5",		{2,1,30417,1},	5,	1},
	[30418] = {"Linh Th�ch Nguy�n Th�ch c�p 6",		{2,1,30418,1},	6,	1},
	[30419] = {"Linh Th�ch Nguy�n Th�ch c�p 7",		{2,1,30419,1},	7,	1},
--	[30413] = {"5��̫ʼ��ʯԭʯ",	{2,95,840,1},	5,	2},
--	[30413] = {"6��̫ʼ��ʯԭʯ",	{2,95,841,1},	6,	2},
--	[30413] = {"7��̫ʼ��ʯԭʯ",	{2,95,842,1},	7,	2},
}

function OnUse(nItemIdx)
	local g,d,p	= getItemGDP(nItemIdx);

	if not tItems[p] then
		return
	end

	if DelItemByIndex(nItemIdx, 1) == 1 then
		if 1 == tItems[p][4] then
			lspf_AddLingShiInBottleEx(tItems[p][3], 1);
		else
			lspf_AddTaiShiLingShiInBottleEx(tItems[p][3], 1);
		end
	end
end
