--File name:	cloth_xmas_box.lua
--Describe:		��װ��нű�
--Item ID:		2,1,30036
--Create Date:	2008-11-18
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\xmas_08\\xmas_func.lua")


--=========================================================================================
g_szLogTitle = "Ho�t ��ng gi�ng sinh : ".."H�p Qu� Ngo�i Trang"		--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_nVietUseBoxEnd = 2009010500					--��е�ʹ�ý�ֹ����
g_nNeedRoom = 3
g_nNeedWeight = 100

g_szFileName = "cloth_xmas_box.lua"			--�ļ���

g_tbItem = 
{
	--		����			ID1,ID2,ID3			���� 
	[1] = 
	{
		{"N�n gi�ng sinh chu�n",		0,	108,	109,	1	},
		{"Th��ng y gi�ng sinh chu�n",	0,	109,	109,	1	},
		{"H� y Gi�ng sinh chu�n",	0,	110,	73,		1	},
	},
	[2] = 
	{
		{"N�n gi�ng sinh kh�i ng�",		0,	108,	110,	1	},
		{"Gi�ng sinh kh�i ng�",	0,	109,	110,	1	},
		{"Trang ph�c gi�ng sinh kh�i ng�",	0,	110,	74,		1	},
	},
	[3] = 
	{
		{"N�n gi�ng sinh g�i c�m",		0,	108,	112,	1	},
		{"Th��ng y gi�ng sinh g�i c�m",	0,	109,	112,	1	},
		{"H� y gi�ng sinh n� g�i c�m",	0,	110,	76,		1	},
	},
	[4] = 
	{
		{"N�n gi�ng sinh nh�",		0,	108,	111,	1	},
		{"Th��ng y gi�ng sinh Ki�u n�",	0,	109,	111,	1	},
		{"Gi�ng sinh Ki�u n�",	0,	110,	75,		1	},
	},
}



--=========================================================================================
function OnUse(nItemIdx)
--	local nDate = tonumber(date("%Y%m%d%H"))
--	if nDate >= g_nVietUseBoxEnd then
--		return
--	end
	if gf_JudgeRoomWeight(g_nNeedRoom,g_nNeedWeight) == 0 then
		Talk(1,"","Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!")
		return
	end;
	if GetLevel() < 20 then
		Msg2Player("Ph�i ��t ��ng c�p 20 tr� l�n m�i c� th� m� H�p Qu� Ngo�i Trang")
		return
	end

	if GetPlayerRoute() == 0 then
		Msg2Player("Ch�a v�o m�n ph�i kh�ng th� m� H�p Qu� Ngo�i Trang")
		return
	end
	
	if DelItemByIndex(nItemIdx,1) == 1 then
		use_it()
	end
end

function use_it()
	local nBody = GetBody()
	if nBody ~= 1 and nBody ~= 2 and nBody ~= 3 and nBody ~= 4 then
		WriteLogEx(g_szLogTitle, "NULL", "NULL", "NULL", "NULL", GetTongName(), "function GetBody() in file "..g_szFileName..", return value error, GetBody() = "..nBody)
		return
	end
	add_cloth_xmas( g_tbItem[nBody][1] )
	add_cloth_xmas( g_tbItem[nBody][2] )
	add_cloth_xmas( g_tbItem[nBody][3] )
end

function add_cloth_xmas(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0
	local nItemIdx = 0

	nRetCode, nItemIdx = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		SetItemExpireTime(nItemIdx, 30*24*3600)
		Msg2Player("B�n nh�n ���c  "..nItemNum.." c�i "..szItemName)
		WriteLogEx(g_szLogTitle, "Nh�n ���c", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "Nh�n ���c", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName(), "Thu ���c th�t b�i, ".."AddItem return value = "..nRetCode)
	end
end

