--File name:	mystery_box.lua
--Describe:		���ر���ű�
--Item ID:		2,1,30031
--Create Date:	2008-09-26
--Author:		chenbenqian
Include("\\script\\lib\\writelog.lua")

--DATE_FRUIT_ITEM_VIET_END		= 2008102100;		-- ���ر���ʹ�ý�������
g_LogTitle = "B�o r��ng Th�n b�";
strLogCaption = "Hoat Dong Thang 10"

g_tPrizeItemList =
{
	--		"����",		G1,	G2,		G3,		����,	�̶�����
	[1] = {"M�nh Thi�n th�ch",	2,	2,		7,		500,	0},
	[2] = {"Thi�n th�ch",		2,	2,		8,		900,	0},
	[3] = {"B�ng Lai Ti�n Th�y",	2,	1,		1012,	1700,	0},
	[4] = {"C�u chuy�n h�i h�n ��n",1,	0,		32,		1320,	0},
	[5] = {"Ch�n th�",	2,	1,		112,	1000,		0},
	[6] = {"Thi�n H� M�t t�ch",	0,	107,	64,		1000,		0},
	[7] = {"T� H� M�t t�ch",	0,	107,	65,		500,		0},
	[8] = {"Chi�m Y Ph�",	0,	107,	66,		210,		0},
	[9] = {"Ti�u Th� Gi�i Ch�",	0,	102,	36,		1000,		1},
	[10] = {"Trang Ch� m�o",	0,	103,	91,		50,		1},
	[11] = {"Trang Ch� m�o",	0,	103,	92,		50,		1},
	[12] = {"Trang Ch� m�o",	0,	103,	93,		50,		1},
	[13] = {"Trang Ch� m�o",	0,	103,	94,		50,		1},
	[14] = {"T�ng Qu�n Ngo�i trang",	0,	100,	91,		200,		1},
	[15] = {"T�ng Qu�n Ngo�i trang",	0,	100,	92,		200,		1},
	[16] = {"T�ng Qu�n Ngo�i trang",	0,	100,	93,		200,		1},
	[17] = {"T�ng Qu�n Ngo�i trang",	0,	100,	94,		200,		1},
	[18] = {"T�ng Qu�n kh�",	0,	101,	91,		200,		1},
	[19] = {"T�ng Qu�n kh�",	0,	101,	92,		200,		1},
	[20] = {"T�ng Qu�n kh�",	0,	101,	93,		200,		1},
	[21] = {"T�ng Qu�n kh�",	0,	101,	94,		200,		1},
	[22] = {"Tr��ng L�o Ch� Ho�n",	0,	102,		37,	70,		1},

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
		Msg2Player("B�n nh�n ���c 1  "..tItem[1]);		
		WriteLogEx(strLogCaption,"B�o r��ng Th�n b�",1,tItem[1])
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain 1 "..tItem[1].." Failed, return value = "..nRetCode);
	end
end

