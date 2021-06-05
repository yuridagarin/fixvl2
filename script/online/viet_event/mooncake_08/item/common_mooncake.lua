--File name:	common_mooncake.lua
--Describe:		��ͨ�±��ű�
--Item ID:		2,1,30025
--Create Date:	2008-08-19
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")

TYPE_NULL = 0;	--û�н���
TYPE_ITEM = 1;	--��ͨ��Ʒ
TYPE_EQUIP = 2;	--������װ������Ʒ
TYPE_CMD = 3;	--����

--=========================================================================================
g_szLogTitle = "Ho�t ��ng trung thu : ".."B�nh Trung Thu th��ng"		--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_nVietUseMoonCakeEnd = 2008101300				--�±���ʹ�ý�ֹ����
g_nNeedRoom = 1
g_nNeedWeight = 20
g_nDenominator = 1000000						--��ĸ����ʾ���ʵĵ�λ��x��֮1
g_nExpNum = 20000								--ʹ��һ���±���õľ���ֵ

g_szFileName = "common_mooncake.lua"			--�ļ���

g_tbItem = 
{
	--		����	   ����		���� ����		ID1,ID2,ID3
	[1]  = {TYPE_NULL,	447780},
	[2]  = {TYPE_ITEM,	20,		1,	"Thi�n H� M�t t�ch",	0,	107,64},
	[3]  = {TYPE_ITEM,	200,	1,	"Ng� Qu� M�t t�ch",	0,	107,63},
	[4]  = {TYPE_ITEM,	500,	1,	"B� Kim M�t t�ch",	0,	107,61},
	[5]  = {TYPE_ITEM,	500,	1,	"B� Th�ch M�t t�ch",	0,	107,62},
	[6]  = {TYPE_ITEM,	500,	1,	"M�nh Thi�n th�ch",	2,	2,	7},
	[7]  = {TYPE_ITEM,	1000,	1,	"Thi�n th�ch",		2,	2,	8},
	[8]  = {TYPE_ITEM,	1000,	1,	"M�nh B�ng th�ch",	2,	1,	148},
	[9]  = {TYPE_ITEM,	1000,	1,	"B�ng th�ch",		2,	1,	149},
	[10]  = {TYPE_ITEM,	2000,	1,	"C�y B�t Nh�",	2,	0,	398},
	[11] = {TYPE_ITEM,	5000,	1,	"C�y B�t Nh� nh�",	2,	0,	504},
	[12] = {TYPE_ITEM,	35500,	1,	"L� th�y",		2,	0,	351},
	[13] = {TYPE_ITEM,	5000,	1,	"B�ng Lai L� Th�y",	2,	1,	1052},
	--		����	   ���� ��ֵ	��ʾ�ַ��� 	�����ַ���
	[14] = {TYPE_CMD,	300000,	1,	"�i�m danh v�ng",	"ModifyReputation(%d,0)"},
	[15] = {TYPE_CMD,	200000,	5,	"�i�m tu luy�n",	"ModifyPopur(%d)"},
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
		if g_tbItem[nRandIdx][4] ~= "�i�m danh v�ng" then
			Msg2Player(szMsgText)
		end
		WriteLogEx(szLogTrungThuName,"B�nh trung thu th��ng",nItemNum,szItemName)		
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
