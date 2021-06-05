--File name:	peach_blossom.lua
--Describe:		�һ��ű�
--Item ID:		2,1,30052
--Create Date:	2008-12-24
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\new_year_09\\new_year_func.lua")

TYPE_NULL 	= 0;	--û�н���
TYPE_ITEM 	= 1;	--��ͨ��Ʒ
TYPE_EQUIP 	= 2;	--������װ������Ʒ
TYPE_CMD 	= 3;	--����

--=========================================================================================
g_szLogTitle = "Hoat dong Tet 2009"			--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_nVietUseBoxEnd = 2009022300					--ʹ�ý�ֹ����
g_nNeedRoom = 1
g_nNeedWeight = 20
g_nDenominator = 1000000						--��ĸ����ʾ���ʵĵ�λ��x��֮1
g_nExpNum = 50000								--ʹ��һ���һ���õľ���ֵ

g_szFileName = "peach_blossom.lua"				--�ļ���


g_tbItem = 
{
	--		����	   ����		���� ����		ID1,ID2,ID3
	[1] = {TYPE_NULL,	464800,	},
	[2] = {TYPE_ITEM,	500,	1,	"Thi�n H� M�t t�ch",	0,	107,	64,	},
	[3] = {TYPE_ITEM,	200,	1,	"T� H� M�t t�ch",	0,	107,	65,	},
	[4] = {TYPE_ITEM,	100,	1,	"Chi�m Y Ph�",	0,	107,	66,	},
	[5] = {TYPE_ITEM,	1000,	1,	"Ng� Qu� M�t t�ch",	0,	107,	63,	},
	[6] = {TYPE_ITEM,	800,	1,	"B� Kim M�t t�ch",	0,	107,	61,	},
	[7] = {TYPE_ITEM,	600,	1,	"B� Th�ch M�t t�ch",	0,	107,	62,	},
	[8] = {TYPE_ITEM,	10000,	1,	"M�nh Thi�n th�ch",	2,	2,	7,	},
	[9] = {TYPE_ITEM,	2000,	1,	"Thi�n th�ch",	2,	2,	8,	},
	[10] = {TYPE_ITEM,	2000,	1,	"M�nh B�ng th�ch",	2,	1,	148,	},
	[11] = {TYPE_ITEM,	3000,	1,	"B�ng th�ch",	2,	1,	149,	},
	[12] = {TYPE_ITEM,	20000,	1,	"B�ng Lai L� Th�y",	2,	1,	1052,	},
	[13] = {TYPE_ITEM,	10000,	1,	"B�ng Lai Ti�n Th�y",	2,	1,	1012,	},
	[14] = {TYPE_ITEM,	10000,	1,	"Th�n Gi�p ��n (chi�n tr��ng)",	1,	0,	209,	},
	[15] = {TYPE_ITEM,	20000,	1,	"Th�n Tr�o ��n (chi�n tr��ng)",	1,	0,	210,	},
	[16] = {TYPE_ITEM,	15000,	1,	"Th�ng C�n T�n (chi�n tr��ng)",	1,	0,	211,	},
	[17] = {TYPE_ITEM,	8000,	1,	"V� C�c Ti�n ��n (chi�n tr��ng)",	1,	0,	224,	},
	[18] = {TYPE_ITEM,	10000,	1,	"Th�t Khi�u Nguy�n B�o ��n (chi�n tr��ng)",	1,	0,	225,	},
	[19] = {TYPE_ITEM,	12000,	1,	"Th�ng Thi�n V� C�c ��n (chi�n tr��ng)",	1,	0,	227,	},
	[20] = {TYPE_ITEM,	30000,	10,	"D��c th�o qu�n d�ng",	2,	0,	312,	},
	[21] = {TYPE_ITEM,	30000,	10,	"L�a m�ch qu�n d�ng",	2,	0,	309,	},
	[22] = {TYPE_ITEM,	30000,	10,	"Kho�ng th�ch qu�n d�ng",	2,	0,	307,	},
	[23] = {TYPE_ITEM,	30000,	10,	"Linh huy�t qu�n d�ng",	2,	0,	313,	},
	[24] = {TYPE_ITEM,	30000,	10,	"T� t�m qu�n d�ng",	2,	0,	311,	},
	[25] = {TYPE_ITEM,	30000,	10,	"G� qu�n d�ng",	2,	0,	308,	},
	[26] = {TYPE_ITEM,	30000,	10,	"Thu�c da qu�n d�ng",	2,	0,	310,	},
	--		����	   ���� ��ֵ	��ʾ�ַ��� 	�����ַ���
	[27] = {TYPE_CMD,	200000,	2,	{"�i�m danh v�ng"},	"ModifyReputation(%d,0)"},
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
	--���齱������
	local nExp = g_nExpNum
	local nExpTotal = GetTask(PLUM_TOTALEXP_09_NEWYEAR_VIET)
	if nExpTotal >= PLUM_EXP_LIMIT_09_NEWYEAR_VIET then
		Msg2Player("��i hi�p �� thu ���c kinh nghi�m t� ho�t ��ng Mai ��o Ch�c T�t v��t qu� gi�i h�n. "..PLUM_EXP_LIMIT_09_NEWYEAR_VIET.." , Hi�n t�i kh�ng th� nh�n th�m kinh nghi�m t� ho�t ��ng n�y, nh�ng c� th� s� c� c� h�i nh�n ph�n th��ng kh�c.");
		nExp = 0;
	elseif nExpTotal + g_nExpNum > PLUM_EXP_LIMIT_09_NEWYEAR_VIET then
		nExp = PLUM_EXP_LIMIT_09_NEWYEAR_VIET - nExpTotal;
	end
	if nExp ~= 0 then
		ModifyExp(nExp);
		SetTask( PLUM_TOTALEXP_09_NEWYEAR_VIET, (nExpTotal+nExp) )
		Msg2Player("B�n nh�n ���c  "..nExp.."  �i�m kinh nghi�m");

		local szItemName = "�i�m kinh nghi�m"
		local nItemNum = nExp
		local szInfoDescribe = format("ModifyExp(%d)", nItemNum)
		WriteLogEx(g_szLogTitle, "Hoa ��o", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	end
	--��Ʒ��������
	local nRandIdx = get_random_item(g_tbItem)
	if nRandIdx == 0 then
		return
	end
	local nType = g_tbItem[nRandIdx][1]
	local szItemName = g_tbItem[nRandIdx][4]
	local nItemNum = g_tbItem[nRandIdx][3]
	local szInfoDescribe = ""

	local nRetCode = 0
	if nType == TYPE_NULL then
		return
	elseif nType == TYPE_ITEM then
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3])
		szInfoDescribe = format("(%d,%d,%d)", g_tbItem[nRandIdx][5], g_tbItem[nRandIdx][6], g_tbItem[nRandIdx][7])
	elseif nType == TYPE_EQUIP then
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3],1,-1,-1,-1,-1,-1,-1)
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
		WriteLogEx(g_szLogTitle, "Hoa ��o", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "Hoa ��o", "", "", szInfoDescribe, GetTongName(), "Thu ���c th�t b�i, ".."AddItem return value = "..nRetCode)
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

