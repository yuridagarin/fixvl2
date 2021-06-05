--File name:	blue_xmas_box.lua
--Describe:		��ɫ��нű�
--Item ID:		2,1,30033
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
g_nDenominator = 10000							--��ĸ����ʾ���ʵĵ�λ��x��֮1
g_nExpNum = 80000								--ʹ��һ����ɫ��л�õľ���ֵ

g_szFileName = "blue_xmas_box.lua"			--�ļ���

g_tbItem = 
{
	--		����	   ����		���� ����		ID1,ID2,ID3
	[1]  = {TYPE_NULL,	4535},
	[2]  = {TYPE_ITEM,	10,		1,	"Thi�n H� M�t t�ch",	0,	107,64},
	[3]  = {TYPE_ITEM,	10,	1,	"Ng� Qu� M�t t�ch",	0,	107,63},
	[4]  = {TYPE_ITEM,	10,	1,	"B� Kim M�t t�ch",	0,	107,61},
	[5]  = {TYPE_ITEM,	10,	1,	"B� Th�ch M�t t�ch",	0,	107,62},
	[6]  = {TYPE_ITEM,	2,	1,	"M�nh Thi�n th�ch",	2,	2,	7},
	[7]  = {TYPE_ITEM,	10,	1,	"Thi�n th�ch",		2,	2,	8},
	[8]  = {TYPE_ITEM,	10,	1,	"M�nh B�ng th�ch",	2,	1,	148},
	[9]  = {TYPE_ITEM,	10,	1,	"B�ng th�ch",		2,	1,	149},
	[10]  = {TYPE_ITEM,	1,	1,	"C�y B�t Nh�",	2,	0,	398},
	[11] = {TYPE_ITEM,	1,	1,	"C�y B�t Nh� nh�",	2,	0,	504},
	[12] = {TYPE_ITEM,	341,	1,	"L� th�y",		2,	0,	351},
	[13] = {TYPE_ITEM,	50,	1,	"B�ng Lai L� Th�y",	2,	1,	1052},
	--		����	   ���� ��ֵ	��ʾ�ַ��� 	�����ַ���
	[14] = {TYPE_CMD,	3000,	1,	{"�i�m danh v�ng"},	"ModifyReputation(%d,0)"},
	[15] = {TYPE_CMD,	2000,	5,	"�i�m tu luy�n",	"ModifyPopur(%d)"},
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
		WriteLogEx(g_szLogTitle, "H�p Qu� Xanh", nItemNum, szItemName, szInfoDescribe, GetTongName() )
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
		WriteLogEx(g_szLogTitle, "H�p Qu� Xanh", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "H�p Qu� Xanh", "", "", "", "", "Thu ���c th�t b�i, ".."AddItem return value = "..nRetCode)
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
