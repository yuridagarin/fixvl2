--File name:	red_box.lua
--Describe:		�챦��ű�
--Item ID:		2,1,30059
--Create Date:	2008-12-24
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\writelog.lua")

--=========================================================================================
g_szLogTitle = "N�m m�i m�ng xu�n : ".."H�ng B�o R��ng"			--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_nNeedRoom = 1
g_nNeedWeight = 20

--=========================================================================================
function OnUse(nItemIdx)
	if gf_JudgeRoomWeight(g_nNeedRoom,g_nNeedWeight) == 0 then
		Talk(1,"","Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!")
		return
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		add_item_ex( {"Bao Tay Thu Th�p",	2,	1,	30058,	10} )
	end
end

function add_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0

	nRetCode = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c  "..nItemNum.." c�i "..szItemName);
		WriteLogEx(g_szLogTitle, "Nh�n ���c", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "Nh�n ���c", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName(), "Thu ���c th�t b�i, ".."AddItem return value = "..nRetCode)
	end
end

