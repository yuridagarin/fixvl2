--File name:	stone.lua
--Describe:		��ʯ�ű�
--Item ID:		2,1,30068
--Create Date:	2009-02-18
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\march_event_09\\march_event_func.lua")

TYPE_NULL 	= 0;	--û�н���
TYPE_ITEM 	= 1;	--��ͨ��Ʒ
TYPE_EQUIP 	= 2;	--������װ������Ʒ
TYPE_CMD 	= 3;	--����

--=========================================================================================
g_szLogTitle = "Event th�ng 3"			--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_nVietUseBoxEnd = 2009041300					--ʹ�ý�ֹ����
g_nNeedRoom = 1
g_nNeedWeight = 20
g_nDenominator = 100000							--��ĸ����ʾ���ʵĵ�λ��x��֮1
--g_nExpNum = 125000								--ʹ��һ����ʯ��õľ���ֵ

g_szFileName = "stone.lua"						--�ļ���

g_tbItem = 
{
	--		����	   ����			���� ����			ID1,ID2,ID3		����(-1Ϊû��ʱ������)
	[1] = {TYPE_ITEM,	10000,		100,	"Bao nguy�n li�u",		2,	1,		30061,	-1,	},
	[2] = {TYPE_ITEM,	10000,		1,	"M�nh Thi�n th�ch",		2,	2,		7,		-1,	},
	[3] = {TYPE_ITEM,	3000,		3,	"M�nh Thi�n th�ch",		2,	2,		7,		-1,	},
	[4] = {TYPE_ITEM,	15000,		1,	"Thi�n th�ch",			2,	2,		8,		-1,	},
	[5] = {TYPE_ITEM,	5000,		3,	"Thi�n th�ch",			2,	2,		8,		-1,	},
	[6] = {TYPE_ITEM,	50,			1,	"Kim Cang Ph�c Ma T�m Ph�p",	0,	107,	2,		-1,	},
	[7] = {TYPE_ITEM,	20,			1,	"Ti�m Long T�m Ph�p",		0,	107,	4,		-1,	},
	[8] = {TYPE_ITEM,	40,			1,	"V� Tr�n T�m Ph�p",		0,	107,	6,		-1,	},
	[9] = {TYPE_ITEM,	40,			1,	"Thi�n La T�m Ph�p",		0,	107,	8,		-1,	},
	[10] = {TYPE_ITEM,	20,			1,	"Nh� � T�m Ph�p",		0,	107,	10,		-1,	},
	[11] = {TYPE_ITEM,	40,			1,	"B�ch H�i T�m Ph�p",		0,	107,	12,		-1,	},
	[12] = {TYPE_ITEM,	40,			1,	"H�n ��n T�m Ph�p",		0,	107,	14,		-1,	},
	[13] = {TYPE_ITEM,	20,			1,	"Qu� Thi�n T�m Ph�p",		0,	107,	16,		-1,	},
	[14] = {TYPE_ITEM,	40,			1,	"Huy�n �nh T�m Ph�p",		0,	107,	18,		-1,	},
	[15] = {TYPE_ITEM,	30,			1,	"Qu�n T� T�m Ph�p",		0,	107,	20,		-1,	},
	[16] = {TYPE_ITEM,	40,			1,	"Tr�n Qu�n T�m Ph�p",		0,	107,	22,		-1,	},
	[17] = {TYPE_ITEM,	30,			1,	"Xuy�n V�n T�m Ph�p",		0,	107,	24,		-1,	},
	[18] = {TYPE_ITEM,	50,			1,	"U Minh T�m Ph�p",		0,	107,	26,		-1,	},
	[19] = {TYPE_ITEM,	50,			1,	"Linh C� T�m Ph�p",		0,	107,	28,		-1,	},
	[20] = {TYPE_ITEM,	6490,		1,	"T�ng Ki�m anh h�ng thi�p",	2,	0,		31,		7,	},
	[21] = {TYPE_ITEM,	50000,		1,	"Ng�c Trai",			2,	1,		30067,	-1,	},
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
	local szInfoDescribe = ""

	local nRetCode, nItemIdx = 0, 0
	if nType == TYPE_NULL then
		return
	elseif nType == TYPE_ITEM then
		nRetCode,nItemIdx = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3])
		szInfoDescribe = format("(%d,%d,%d)", g_tbItem[nRandIdx][5], g_tbItem[nRandIdx][6], g_tbItem[nRandIdx][7])
	elseif nType == TYPE_EQUIP then
		nRetCode,nItemIdx = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3],1,-1,-1,-1,-1,-1,-1)
		szInfoDescribe = format("(%d,%d,%d)", g_tbItem[nRandIdx][5], g_tbItem[nRandIdx][6], g_tbItem[nRandIdx][7])
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
		if (nType == TYPE_ITEM or nType == TYPE_EQUIP) and g_tbItem[nRandIdx][8] > 0 then
			SetItemExpireTime(nItemIdx, g_tbItem[nRandIdx][8]*24*3600)
		end
		WriteLogEx(g_szLogTitle, "K� Th�ch", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "", nItemNum, szItemName, szInfoDescribe, GetTongName(), "Thu ���c th�t b�i, ".."AddItem return value = "..nRetCode)
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

