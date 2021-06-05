--File name:	red_xmas_box.lua
--Describe:		��ɫ��нű�
--Item ID:		2,1,30034
--Create Date:	2008-11-18
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\xmas_08\\xmas_func.lua")

TYPE_NULL 	= 0;	--û�н���
TYPE_ITEM 	= 1;	--��ͨ��Ʒ
TYPE_EQUIP 	= 2;	--������װ������Ʒ
TYPE_CMD 	= 3;	--����

--=========================================================================================
g_szLogTitle = "Giang Sinh 2008"		--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_nVietUseBoxEnd = 2009011200					--��е�ʹ�ý�ֹ����
g_nNeedRoom = 1
g_nNeedWeight = 20
g_nDenominator = 100000000						--��ĸ����ʾ���ʵĵ�λ��x��֮1
g_nExpNum = 150000								--ʹ��һ����ɫ��л�õľ���ֵ

g_szFileName = "red_xmas_box.lua"			--�ļ���

g_tbItem = 
{
	--		����	   ����		���� ����			ID1,ID2,ID3
	[1] = {TYPE_ITEM,	250,		1,	"Kim Cang Ph�c Ma kinh",	0,	107,	1},
	[2] = {TYPE_ITEM,	250,		1,	"Ti�m Long M�t t�ch",		0,	107,	3},
	[3] = {TYPE_ITEM,	250,		1,	"V� Tr�n M�t t�ch",		0,	107,	5},
	[4] = {TYPE_ITEM,	250,		1,	"Thi�n La M�t T�ch",		0,	107,	7},
	[5] = {TYPE_ITEM,	250,		1,	"Nh� � M�t T�ch",		0,	107,	9},
	[6] = {TYPE_ITEM,	250,		1,	"B�ch H�i Ph�",		0,	107,	11},
	[7] = {TYPE_ITEM,	250,		1,	"H�n ��n M�t t�ch",		0,	107,	13},
	[8] = {TYPE_ITEM,	250,		1,	"Qu� Thi�n M�t t�ch",		0,	107,	15},
	[9] = {TYPE_ITEM,	250,		1,	"Huy�n �nh M�t t�ch",		0,	107,	17},
	[10] = {TYPE_ITEM,	250,		1,	"Qu�n T� M�t t�ch",		0,	107,	19},
	[11] = {TYPE_ITEM,	250,		1,	"Tr�n Qu�n M�t t�ch",		0,	107,	21},
	[12] = {TYPE_ITEM,	250,		1,	"Xuy�n V�n M�t t�ch",		0,	107,	23},
	[13] = {TYPE_ITEM,	250,		1,	"U Minh Qu� L�c",		0,	107,	25},
	[14] = {TYPE_ITEM,	250,		1,	"Linh C� M�t t�ch",		0,	107,	27},
	[15] = {TYPE_ITEM,	250,		1,	"��t Ma V� quy�t",	2,	6,		10},
	[16] = {TYPE_ITEM,	250,		1,	"Long Tr�o Th� quy�t",2,	6,		20},
	[17] = {TYPE_ITEM,	250,		1,	"Kim Cang Ch� quy�t",2,	6,		31},
	[18] = {TYPE_ITEM,	250,		1,	"M�n Thi�n V� quy�t",	2,	6,		46},
	[19] = {TYPE_ITEM,	250,		1,	"��i Bi quy�t",2,	6,		59},
	[20] = {TYPE_ITEM,	250,		1,	"M� T�m Kh�c quy�t",2,	6,		70},
	[21] = {TYPE_ITEM,	250,		1,	"T�y Quy�n",		2,	6,		79},
	[22] = {TYPE_ITEM,	250,		1,	"�� C�u quy�t",	2,	6,		88},
	[23] = {TYPE_ITEM,	250,		1,	"Th�t Ti�t Ki�m quy�t",2,	6,		108},
	[24] = {TYPE_ITEM,	250,		1,	"Th��ng Thanh C�ng quy�t",2,	6,		119},
	[25] = {TYPE_ITEM,	250,		1,	"B�ch Th��ng quy�t",2,	6,		130},
	[26] = {TYPE_ITEM,	250,		1,	"L�u Tuy�t Ti�n quy�t",2,	6,		141},
	[27] = {TYPE_ITEM,	250,		1,	"B� ki�p Thi Li�t Ma C�ng",	2,	6,		154},
	[28] = {TYPE_ITEM,	250,		1,	"B� ki�p T�m C�",		2,	6,		168},
	[29] = {TYPE_ITEM,	1000,		1,	"B�t B�o T�y T�y Ti�n ��n",	2,	0,		138},
	[30] = {TYPE_ITEM,	2000,		1,	"T�y T�y linh ��n",		2,	0,		137},
	[31] = {TYPE_ITEM,	500000,	1,	"Ti�u Nh� �",		2,	1,		30030},
	[32] = {TYPE_ITEM,	10000,		1,	"Chi�m Y Ph�",		0,	107,	66},
	[33] = {TYPE_ITEM,	15000,	1,	"T� H� M�t t�ch",		0,	107,	65},
	[34] = {TYPE_ITEM,	20000,	1,	"Thi�n H� M�t t�ch",		0,	107,	64},
	[35] = {TYPE_ITEM,	400000,	1,	"M�nh Thi�n th�ch",		2,	2,		7},
	[36] = {TYPE_ITEM,	800000,	1,	"Thi�n th�ch",			2,	2,		8},
	[37] = {TYPE_ITEM,	1000000,	1,	"M�nh B�ng th�ch",		2,	1,		148},
	[38] = {TYPE_ITEM,	1000000,	1,	"B�ng th�ch",			2,	1,		149},
	[39] = {TYPE_ITEM,	10000,	1,	"C�y B�t Nh�",		2,	0,		398},
	[40] = {TYPE_ITEM,	10000,	1,	"C�y B�t Nh� nh�",	2,	0,		504},
	[41] = {TYPE_ITEM,	25000000,	1,	"L� th�y",			2,	0,		351},
	[42] = {TYPE_ITEM,	2000000,	1,	"B�ng Lai L� Th�y",		2,	1,		1012},
	--		����	   ���� ��ֵ	��ʾ�ַ��� 		�����ַ���
	[43] = {TYPE_CMD,	14000000,	1,	{"�i�m danh v�ng"},		"ModifyReputation(%d,0)"},
	[44] = {TYPE_CMD,	14000000,	2,	{"�i�m danh v�ng"},		"ModifyReputation(%d,0)"},
	[45] = {TYPE_CMD,	14000000,	3,	{"�i�m danh v�ng"},		"ModifyReputation(%d,0)"},
	[46] = {TYPE_CMD,	14000000,	20,	"�i�m tu luy�n",		"ModifyPopur(%d)"},
	[47] = {TYPE_CMD,	13225000,	100,"�i�m T�ng ki�m",	"SetTask(1801, GetTask(1801)+%d)"},
}



--=========================================================================================
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate >= g_nVietUseBoxEnd then
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
	local nExpTotal = GetTask(TOTALEXP_08_XMAS_VIET)
	if nExpTotal >= EXP_LIMIT_08_XMAS_VIET then
		Msg2Player("�� v��t qu� kinh nghi�m cao nh�t c�a ho�t ��ng gi�ng sinh "..EXP_LIMIT_08_XMAS_VIET.." , Hi�n t�i kh�ng th� nh�n th�m kinh nghi�m t� ho�t ��ng n�y, nh�ng c� th� s� c� c� h�i nh�n ph�n th��ng kh�c.");
		nExp = 0;
	elseif nExpTotal + g_nExpNum > EXP_LIMIT_08_XMAS_VIET then
		nExp = EXP_LIMIT_08_XMAS_VIET - nExpTotal;
	end
	if nExp ~= 0 then
		ModifyExp(nExp);
		SetTask( TOTALEXP_08_XMAS_VIET, (nExpTotal+nExp) )
		Msg2Player("B�n nh�n ���c  "..nExp.."  �i�m kinh nghi�m");

		local szItemName = "�i�m kinh nghi�m"
		local nItemNum = nExp
		local szInfoDescribe = format("ModifyExp(%d)", nItemNum)
		WriteLogEx(g_szLogTitle, "H�p Qu� ��", nItemNum, szItemName, szInfoDescribe, GetTongName() )
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
		WriteLogEx(g_szLogTitle, "H�p Qu� ��", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "H�p Qu� ��", "", "", "", "", "Thu ���c th�t b�i, ".."AddItem return value = "..nRetCode)
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
