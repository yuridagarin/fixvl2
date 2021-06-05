--File name:	lanhua_bag.lua
--Describe:		���ӽű�(����BOSS��Ӣ��BOSS����)
--Create Date:	2009-3-25 15:51
--Author:		chenbenqian

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\writelog.lua")

TYPE_NULL 	= 0;	--û�н���
TYPE_ITEM 	= 1;	--��ͨ��Ʒ
TYPE_EQUIP 	= 2;	--������װ������Ʒ
TYPE_CMD 	= 3;	--����

--=========================================================================================
g_szLogTitle = "T�i H�nh Trang".."(2, 1, 30072)"
g_nNeedRoom = 1
g_nNeedWeight = 20
g_nDenominator = 100							--��ĸ����ʾ���ʵĵ�λ��x��֮1

g_szFileName = "lanhua_bag.lua"					--�ļ���

g_tbItem = 
{
	--		����	   ����	���� ����	ID1,ID2,ID3
	[1] = {TYPE_EQUIP,	50,	1,	"��ng Ph��ng Long Ch�u",	0,	102,	24,	},
	[2] = {TYPE_EQUIP,	25,	1,	"Nh� �",		0,	102,	23,	},
	[3] = {TYPE_EQUIP,	25,	1,	"C�t T��ng",		0,	102,	22,	},
}



--=========================================================================================
function OnUse(nItemIdx)
	if gf_JudgeRoomWeight(g_nNeedRoom,g_nNeedWeight) == 0 then
		Talk(1,"","Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!")
		return
	end
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

	local szItemName = g_tbItem[nRandIdx][4]
	local nItemNum = g_tbItem[nRandIdx][3]
	local szInfoDescribe = format("(%d,%d,%d)", g_tbItem[nRandIdx][5], g_tbItem[nRandIdx][6], g_tbItem[nRandIdx][7])

	local nRetCode = 0
	nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3],1,-1,-1,-1,-1,-1,-1)

	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c  "..nItemNum.." "..szItemName)
		WriteLogEx("Hoat dong thang 6", "Nh�n ���c", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx("Hoat dong thang 6", "Nh�n ���c", nItemNum, szItemName, szInfoDescribe, GetTongName(), "Thu ���c th�t b�i, ".."AddItem return value = "..nRetCode)
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


