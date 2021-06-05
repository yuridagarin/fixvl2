--File name:	butter_sugar.lua
--Describe:		���ǽű�
--Item ID:		2,1,30066
--Create Date:	2009-02-17
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
g_nDenominator = 1000000						--��ĸ����ʾ���ʵĵ�λ��x��֮1
g_nExpNum = 125000								--ʹ��һ�����ǻ�õľ���ֵ

g_szFileName = "butter_sugar.lua"				--�ļ���

g_tbItem = 
{
	--		����	   ����		���� ����			ID1,ID2,ID3		����(-1Ϊû��ʱ������)
	[1] = {TYPE_ITEM,	30000,		1,	"M�nh Thi�n th�ch",		2,	2,		7,		-1,	},
	[2] = {TYPE_ITEM,	20000,		1,	"Thi�n th�ch",			2,	2,		8,		-1,	},
	[3] = {TYPE_ITEM,	30000,		1,	"M�nh B�ng th�ch",		2,	1,		148,	-1,	},
	[4] = {TYPE_ITEM,	20000,		1,	"B�ng th�ch",			2,	1,		149,	-1,	},
	[5] = {TYPE_ITEM,	50000,		1,	"B�ng Lai Ti�n Th�y",		2,	1,		1012,	-1,	},
	[6] = {TYPE_ITEM,	80000,		1,	"B�ng Lai L� Th�y",		2,	1,		1052,	-1,	},
	[7] = {TYPE_ITEM,	20000,		1,	"Th� Th�n ph�",		2,	0,		556,	7,	},
	[8] = {TYPE_ITEM,	30000,		1,	"Ti�u Ki�p t�n",		2,	0,		141,	7,	},
	[9] = {TYPE_ITEM,	10,			1,	"B�t B�o T�y T�y Ti�n ��n",	2,	0,		138,	7,	},
	[10] = {TYPE_ITEM,	40,			1,	"T�y T�y linh ��n",		2,	0,		137,	7,	},
	[11] = {TYPE_ITEM,	5000,		1,	"Thi�n H� M�t t�ch",		0,	107,	64,		-1,	},
	[12] = {TYPE_ITEM,	3000,		1,	"T� H� M�t t�ch",		0,	107,	65,		-1,	},
	[13] = {TYPE_ITEM,	2000,		1,	"Chi�m Y Ph�",		0,	107,	66,		-1,	},
	[14] = {TYPE_ITEM,	10,			1,	"Kim Cang Ph�c Ma kinh",	0,	107,	1,		-1,	},
	[15] = {TYPE_ITEM,	5,			1,	"Ti�m Long M�t t�ch",		0,	107,	3,		-1,	},
	[16] = {TYPE_ITEM,	10,			1,	"V� Tr�n M�t t�ch",		0,	107,	5,		-1,	},
	[17] = {TYPE_ITEM,	10,			1,	"Thi�n La M�t T�ch",		0,	107,	7,		-1,	},
	[18] = {TYPE_ITEM,	5,			1,	"Nh� � M�t T�ch",		0,	107,	9,		-1,	},
	[19] = {TYPE_ITEM,	10,			1,	"B�ch H�i Ph�",		0,	107,	11,		-1,	},
	[20] = {TYPE_ITEM,	10,			1,	"H�n ��n M�t t�ch",		0,	107,	13,		-1,	},
	[21] = {TYPE_ITEM,	5,			1,	"Qu� Thi�n M�t t�ch",		0,	107,	15,		-1,	},
	[22] = {TYPE_ITEM,	10,			1,	"Huy�n �nh M�t t�ch",		0,	107,	17,		-1,	},
	[23] = {TYPE_ITEM,	5,			1,	"Qu�n T� M�t t�ch",		0,	107,	19,		-1,	},
	[24] = {TYPE_ITEM,	5,			1,	"Tr�n Qu�n M�t t�ch",		0,	107,	21,		-1,	},
	[25] = {TYPE_ITEM,	10,			1,	"Xuy�n V�n M�t t�ch",		0,	107,	23,		-1,	},
	[26] = {TYPE_ITEM,	20,			1,	"U Minh Qu� L�c",		0,	107,	25,		-1,	},
	[27] = {TYPE_ITEM,	10,			1,	"Linh C� M�t t�ch",		0,	107,	27,		-1,	},
	[28] = {TYPE_ITEM,	20000,		1,	"Ch�a Kh�a V�ng",		2,	1,		30069,	30,	},

	--		����	   ���� ��ֵ	��ʾ�ַ��� 		�����ַ���
	[29] = {TYPE_CMD,	249825,	3,	{" �i�m danh v�ng"},		"ModifyReputation(%d,0)"},
	[30] = {TYPE_CMD,	170000,	5,	{" �i�m danh v�ng"},		"ModifyReputation(%d,0)"},
	[31] = {TYPE_CMD,	100000,	10,	{" �i�m danh v�ng"},		"ModifyReputation(%d,0)"},
	[32] = {TYPE_CMD,	20000,	50,	{" �i�m danh v�ng"},		"ModifyReputation(%d,0)"},
	[33] = {TYPE_CMD,	100000,	20,	" �i�m tu luy�n",		"ModifyPopur(%d)"},
	[34] = {TYPE_CMD,	50000,	100,"�i�m T�ng ki�m",	"SetTask(1801, GetTask(1801)+%d)"},
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
	local nExpTotal = GetTask(SUGAR_TOTALEXP_09_MARCH_VIET)
	if nExpTotal >= SUGAR_EXP_LIMIT_09_MARCH_VIET then
		Msg2Player("C�c h� �� thu ���c kinh nghi�m cao nh�t t� v�t ph�m K�o S�a "..SUGAR_EXP_LIMIT_09_MARCH_VIET.." , Hi�n t�i kh�ng th� nh�n th�m kinh nghi�m t� ho�t ��ng n�y, nh�ng c� th� s� c� c� h�i nh�n ph�n th��ng kh�c.");
		nExp = 0;
	elseif nExpTotal + g_nExpNum > SUGAR_EXP_LIMIT_09_MARCH_VIET then
		nExp = SUGAR_EXP_LIMIT_09_MARCH_VIET - nExpTotal;
	end
	if nExp ~= 0 then
		ModifyExp(nExp);
		SetTask( SUGAR_TOTALEXP_09_MARCH_VIET, (nExpTotal+nExp) )
		Msg2Player("B�n nh�n ���c  "..nExp.."  �i�m kinh nghi�m");

		local szItemName = "�i�m kinh nghi�m"
		local nItemNum = nExp
		local szInfoDescribe = format("ModifyExp(%d)", nItemNum)
		WriteLogEx(g_szLogTitle, "K�o s�a", nItemNum, szItemName, szInfoDescribe, GetTongName() )
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
		WriteLogEx(g_szLogTitle, "K�o s�a", nItemNum, szItemName, szInfoDescribe, GetTongName() )
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

