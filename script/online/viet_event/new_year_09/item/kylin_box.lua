--File name:	kylin_box.lua
--Describe:		���뱦��ű�
--Item ID:		2,1,30060
--Create Date:	2008-12-24
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\writelog.lua")

--=========================================================================================
g_szLogTitle = "N�m m�i m�ng xu�n : ".."K� L�n B�o R��ng"			--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_nVietUseBoxEnd = 2009021600						--ʹ�ý�ֹ����
g_nNeedRoom = 1
g_nNeedWeight = 100

--=========================================================================================
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate >= g_nVietUseBoxEnd then
		Msg2Player("V�t ph�m n�y �� qu� h�n, kh�ng th� s� d�ng th�m n�a.")
		return
	end
	if gf_JudgeRoomWeight(g_nNeedRoom,g_nNeedWeight) == 0 then
		Talk(1,"","Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!")
		return
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		add_item_ex( {"K� l�n",	0,	105,	30000,	1} )
	end
end

function add_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode, nItemIdx = 0, 0

	nRetCode, nItemIdx = AddItem(G, D, P, nItemNum, 1, -1, -1, -1, -1, -1, -1)
	if nRetCode == 1 then
		SetItemExpireTime(nItemIdx, 7*24*3600)
		Msg2Player("B�n nh�n ���c  "..nItemNum.." c�i "..szItemName);
		WriteLogEx(g_szLogTitle, "Nh�n ���c", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "Nh�n ���c", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName(), "Thu ���c th�t b�i, ".."AddItem return value = "..nRetCode)
	end
end

