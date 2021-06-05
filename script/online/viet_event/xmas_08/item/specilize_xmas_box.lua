--File name:	specilize_xmas_box.lua
--Describe:		�ر���нű�
--Item ID:		2,1,30037
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
g_nNeedWeight = 100
g_nDenominator = 100							--��ĸ����ʾ���ʵĵ�λ��x��֮1

g_szFileName = "specilize_xmas_box.lua"			--�ļ���

g_tbItem = 
{
	--		����	   ����		���� ����		ID1,ID2,ID3
	[1]  = {TYPE_EQUIP,	6,		1,	"Ph� Y�n �ao",	0,	3,	6001},
	[2]  = {TYPE_EQUIP,	6,		1,	"Ph� Y�n c�n",	0,	5,	6002},
	[3]  = {TYPE_EQUIP,	6,		1,	"H�m Y�n th�",	0,	0,	6004},
	[4]  = {TYPE_EQUIP,	6,		1,	"Ph� Y�n tr��ng",	0,	8,	6003},
	[5]  = {TYPE_EQUIP,	6,		1,	"Phi Y�n ki�m",	0,	2,	6006},
	[6]  = {TYPE_EQUIP,	7,		1,	"V�n Y�n c�m",	0,	10,	6007},
	[7]  = {TYPE_EQUIP,	7,		1,	"V�n Y�n th�",	0,	0,	6008},
	[8]  = {TYPE_EQUIP,	7,		1,	"L�u Y�n c�n",	0,	5,	6009},
	[9]  = {TYPE_EQUIP,	7,		1,	"Huy�n Y�n ki�m",	0,	2,	6010},
	[10] = {TYPE_EQUIP,	7,		1,	"V� Y�n b�t",	0,	9,	6011},
	[11] = {TYPE_EQUIP,	7,		1,	"H� Ti�m Th��ng",	0,	6,	6012},
	[12] = {TYPE_EQUIP,	7,		1,	"H�nh Y�n Cung",	0,	4,	6013},
	[13] = {TYPE_EQUIP,	7,		1,	"Tr�c Y�n nh�n",	0,	7,	6014},
	[14] = {TYPE_EQUIP,	7,		1,	"Y�u Y�n tr�o",	0,	11,	6015},
	[15] = {TYPE_EQUIP,	7,		1,	"T�ng Y�n ch�m",	0,	1,	6005},
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

		for i=1, 3 do
			AddGlobalNews("Ch�c m�ng  "..GetName().." M� H�p Qu� ��c Bi�t thu ���c  "..szItemName)
		end
		WriteLogEx(g_szLogTitle, "H�p Qu� ��c Bi�t", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "H�p Qu� ��c Bi�t", "", "", "", "", "Thu ���c th�t b�i, ".."AddItem return value = "..nRetCode)
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

