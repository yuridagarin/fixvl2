--File name:	special_mooncake.lua
--Describe:		�ر��±��ű�
--Item ID:		2,1,30026
--Create Date:	2008-08-20
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")

TYPE_NULL = 0;	--û�н���
TYPE_ITEM = 1;	--��ͨ��Ʒ
TYPE_EQUIP = 2;	--������װ������Ʒ
TYPE_CMD = 3;	--����

--=========================================================================================
g_szLogTitle = "Ho�t ��ng trung thu : ".."B�nh Trung thu ��c bi�t"		--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_nVietUseMoonCakeEnd = 2008101300				--�±���ʹ�ý�ֹ����
g_nNeedRoom = 1;
g_nNeedWeight = 20;	
g_nDenominator = 1000000						--��ĸ����ʾ���ʵĵ�λ��x��֮1
g_nExpNum = 50000								--ʹ��һ���±���õľ���ֵ

g_szFileName = "special_mooncake.lua"			--�ļ���

g_tbItem = 
{
	--		����	   ����		���� ����			ID1,ID2,ID3
	[1] = {TYPE_ITEM,	1,		1,	"Kim Cang Ph�c Ma kinh",	0,	107,	1},
	[2] = {TYPE_ITEM,	1,		1,	"Ti�m Long M�t t�ch",		0,	107,	3},
	[3] = {TYPE_ITEM,	1,		1,	"V� Tr�n M�t t�ch",		0,	107,	5},
	[4] = {TYPE_ITEM,	1,		1,	"Thi�n La M�t T�ch",		0,	107,	7},
	[5] = {TYPE_ITEM,	1,		1,	"Nh� � M�t T�ch",		0,	107,	9},
	[6] = {TYPE_ITEM,	1,		1,	"B�ch H�i Ph�",		0,	107,	11},
	[7] = {TYPE_ITEM,	1,		1,	"H�n ��n M�t t�ch",		0,	107,	13},
	[8] = {TYPE_ITEM,	1,		1,	"Qu� Thi�n M�t t�ch",		0,	107,	15},
	[9] = {TYPE_ITEM,	1,		1,	"Huy�n �nh M�t t�ch",		0,	107,	17},
	[10] = {TYPE_ITEM,	1,		1,	"Qu�n T� M�t t�ch",		0,	107,	19},
	[11] = {TYPE_ITEM,	1,		1,	"Tr�n Qu�n M�t t�ch",		0,	107,	21},
	[12] = {TYPE_ITEM,	1,		1,	"Xuy�n V�n M�t t�ch",		0,	107,	23},
	[13] = {TYPE_ITEM,	1,		1,	"U Minh Qu� L�c",		0,	107,	25},
	[14] = {TYPE_ITEM,	1,		1,	"Linh C� M�t t�ch",		0,	107,	27},
	[15] = {TYPE_ITEM,	5,		1,	"B�t B�o T�y T�y Ti�n ��n",	2,	0,		138},
	[16] = {TYPE_ITEM,	10,		1,	"T�y T�y linh ��n",		2,	0,		137},
	[17] = {TYPE_ITEM,	3000,	1,	"Ti�u Nh� �",		2,	1,		30030},
	[18] = {TYPE_ITEM,	70,		1,	"Chi�m Y Ph�",		0,	107,	66},
	[19] = {TYPE_ITEM,	100,	1,	"T� H� M�t t�ch",		0,	107,	65},
	[20] = {TYPE_ITEM,	150,	1,	"Thi�n H� M�t t�ch",		0,	107,	64},
	[21] = {TYPE_ITEM,	2000,	1,	"M�nh Thi�n th�ch",		2,	2,		7},
	[22] = {TYPE_ITEM,	5000,	1,	"Thi�n th�ch",			2,	2,		8},
	[23] = {TYPE_ITEM,	5000,	1,	"M�nh B�ng th�ch",		2,	1,		148},
	[24] = {TYPE_ITEM,	5000,	1,	"B�ng th�ch",			2,	1,		149},
	[25] = {TYPE_ITEM,	10000,	1,	"C�y B�t Nh�",		2,	0,		398},
	[26] = {TYPE_ITEM,	20000,	1,	"C�y B�t Nh� nh�",	2,	0,		504},
	[27] = {TYPE_ITEM,	140000,	1,	"L� th�y",			2,	0,		351},
	[28] = {TYPE_ITEM,	10000,	1,	"B�ng Lai Ti�n Th�y",		2,	1,		1012},
	--		����	   ���� ��ֵ	��ʾ�ַ��� 		�����ַ���
	[29] = {TYPE_CMD,	50000,	1,	"�i�m danh v�ng",	"ModifyReputation(%d,0)"},
	[30] = {TYPE_CMD,	150000,	2,	"�i�m danh v�ng","ModifyReputation(%d,0)"},
	[31] = {TYPE_CMD,	150000,	3,	"�i�m danh v�ng","ModifyReputation(%d,0)"},
	[32] = {TYPE_CMD,	200000,	20,	"�i�m tu luy�n",		"ModifyPopur(%d)"},
	[33] = {TYPE_CMD,	150000,	1,	"�i�m c�ng hi�n s� m�n",	"SetTask(336, GetTask(336)+%d)"},
	[34] = {TYPE_CMD,	99651,	100,"�i�m T�ng ki�m",	"SetTask(1801, GetTask(1801)+%d)"},
}

--=========================================================================================
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate >= g_nVietUseMoonCakeEnd then
		return
	end
	if GetLevel() < 20 then
		Talk(1,"","Ch� c� ng��i ch�i ��t ��ng c�p t� 20 tr� l�n m�i c� th� s� d�ng v�t ph�m n�y.")
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
	local nExpTotal = GetTask(TOTALEXP_08_MOONCAKE_VIET)
	if nExpTotal >= g_nExpTotal_MoonCakeViet then
		Msg2Player("B�n �� ��t gi�i h�n �i�m kinh nghi�m c� th� nh�n ���c trong ho�t ��ng Trung thu l�n n�y. "..g_nExpTotal_MoonCakeViet.." , Hi�n t�i s� d�ng B�nh trung thu s� kh�ng nh�n ���c �i�m kinh nghi�m nh�ng s� c� c� h�i nh�n ���c ph�n th��ng kh�c.");
		nExp = 0;
	elseif nExpTotal + g_nExpNum > g_nExpTotal_MoonCakeViet then
		nExp = g_nExpTotal_MoonCakeViet - nExpTotal;
	end
	if nExp ~= 0 then
		ModifyExp(nExp);
		SetTask( TOTALEXP_08_MOONCAKE_VIET, (nExpTotal+nExp) )
		Msg2Player("B�n nh�n ���c  "..nExp.."  �i�m kinh nghi�m");		
		WriteLogEx(szLogTrungThuName,"nh�n",nExp,"�i�m kinh nghi�m")
	end
	--��Ʒ��������
	local nRandIdx = get_random_item(g_tbItem)
	if nRandIdx == 0 then
		return
	end
	local nType = g_tbItem[nRandIdx][1]
	local szItemName = g_tbItem[nRandIdx][4]
	local nItemNum = g_tbItem[nRandIdx][3]
	local szMsgText = ""
	if szItemName ~= "�i�m danh v�ng" then
		szMsgText = "B�n nh�n ���c  "..nItemNum.." c�i "..szItemName
	end
	local nRetCode = 0
	if nType == TYPE_NULL then
		return
	elseif nType == TYPE_ITEM then
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3])
	elseif nType == TYPE_EQUIP then
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3],1,-1,-1,-1,-1,-1,-1)
	elseif nType == TYPE_CMD then
		dostring(format(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][3]))
		nRetCode = 1	--Ĭ������ɹ�ִ��
		if szItemName ~= "�i�m danh v�ng" then
			szMsgText = "B�n nh�n ���c  "..nItemNum.." "..szItemName
		end
	end;
	if nRetCode == 1 then
		if g_tbItem[nRandIdx][4] ~= "�i�m danh v�ng"  then
			Msg2Player(szMsgText)
		end
		WriteLogEx(szLogTrungThuName,"B�nh trung thu ��c bi�t",nItemNum,szItemName)			
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name: "..GetName().."] "..szMsgText.." Failed, return value = "..nRetCode)
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
