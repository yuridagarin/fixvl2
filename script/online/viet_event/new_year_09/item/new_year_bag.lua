--File name:	new_year_bag.lua
--Describe:		�������ű�
--Item ID:		2,1,30046
--Create Date:	2008-12-24
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\new_year_09\\new_year_func.lua")

TYPE_NULL 	= 0;	--û�н���
TYPE_ITEM 	= 1;	--��ͨ��Ʒ
TYPE_EQUIP 	= 2;	--������װ������Ʒ
TYPE_CMD 	= 3;	--����

--=========================================================================================
g_szLogTitle = "Hoat dong Tet 2009"		--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_nVietUseBoxEnd = 2009021600					--ʹ�ý�ֹ����
g_nNeedRoom = 1
g_nNeedWeight = 20
g_nDenominator = 100							--��ĸ����ʾ���ʵĵ�λ��x��֮1

g_szFileName = "new_year_bag.lua"				--�ļ���

g_tbItem = 
{
	--		����	   ����	���� ����	ID1,ID2,ID3
	[1] = {TYPE_ITEM,	50,	1,	"N��c Tinh Khi�t",	2,	1,	30047,	},
	[2] = {TYPE_ITEM,	10,	1,	"B�nh Hoa",	2,	1,	30048,	},
	[3] = {TYPE_ITEM,	40,	1,	"D��ng Ch�t",	2,	1,	30049,	},
}



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
		use_it()
	end
end

function use_it()
	--��Ʒ��������
	local nRandIdx = get_random_item(g_tbItem)
	if nRandIdx == 0 then
		return
	end
	local nType = g_tbItem[nRandIdx][1]
	local szItemName = g_tbItem[nRandIdx][4]
	local nItemNum = g_tbItem[nRandIdx][3]
	local szInfoDescribe = format("(%d,%d,%d)", g_tbItem[nRandIdx][5], g_tbItem[nRandIdx][6], g_tbItem[nRandIdx][7])

	local nRetCode = 0
	if nType == TYPE_NULL then
		return
	elseif nType == TYPE_ITEM then
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3])
	elseif nType == TYPE_EQUIP then
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3],1,-1,-1,-1,-1,-1,-1)
	elseif nType == TYPE_CMD then
		szInfoDescribe = format(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][3])
		dostring(szInfoDescribe)
		nRetCode = 1	--Ĭ������ɹ�ִ��
	end;

	if nRetCode == 1 then
		if type(szItemName) == "table" then
			szItemName = szItemName[1]
		else
			Msg2Player("B�n nh�n ���c  "..nItemNum.." "..szItemName)
		end
		WriteLogEx(g_szLogTitle, "Nh�n ���c", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "", "", "", szInfoDescribe, GetTongName(), "Thu ���c th�t b�i, ".."AddItem return value = "..nRetCode)
	end
end

--���ո��ʻ��g_tbItem�����һ������
function get_random_item(nTab)
	local nRandom = random(1,g_nDenominator)
	local nBase = 0
	if check_item_tab(nTab) == 1 then
		for i=1,getn(nTab) do
			if nRandom <= nTab[i][2]+nBase then
				return i
			else
				nBase = nBase + nTab[i][2]
			end
		end
	else
		return 0
	end
end

--��������table�Ƿ���ȷ
function check_item_tab(tTab)
	local nTotalProbability= 0
	for i=1,getn(tTab) do
		nTotalProbability = nTotalProbability + tTab[i][2]
	end
	if nTotalProbability == g_nDenominator then
		return 1
	else
		print("\n error item table in "..g_szFileName.." \n")
		return 0
	end
end

function nothing()

end

