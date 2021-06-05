--File name:	plum_blossom.lua
--Describe:		÷���ű�
--Item ID:		2,1,30053
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
g_nExpNum = 125000								--ʹ��һ��÷����õľ���ֵ

g_szFileName = "plum_blossom.lua"				--�ļ���

g_tbItem = 
{
	--		����	   ����		���� ����			ID1,ID2,ID3		����(-1Ϊû��ʱ������)
	[1] = {TYPE_ITEM,	2,			1,	"Kim Cang Ph�c Ma kinh",			0,	107,	1,	-1,	},
	[2] = {TYPE_ITEM,	2,			1,	"Ti�m Long M�t t�ch",				0,	107,	3,	-1,	},
	[3] = {TYPE_ITEM,	2,			1,	"V� Tr�n M�t t�ch",				0,	107,	5,	-1,	},
	[4] = {TYPE_ITEM,	2,			1,	"Thi�n La M�t T�ch",				0,	107,	7,	-1,	},
	[5] = {TYPE_ITEM,	2,			1,	"Nh� � M�t T�ch",				0,	107,	9,	-1,	},
	[6] = {TYPE_ITEM,	2,			1,	"B�ch H�i Ph�",				0,	107,	11,	-1,	},
	[7] = {TYPE_ITEM,	2,			1,	"H�n ��n M�t t�ch",				0,	107,	13,	-1,	},
	[8] = {TYPE_ITEM,	2,			1,	"Qu� Thi�n M�t t�ch",				0,	107,	15,	-1,	},
	[9] = {TYPE_ITEM,	2,			1,	"Huy�n �nh M�t t�ch",				0,	107,	17,	-1,	},
	[10] = {TYPE_ITEM,	2,			1,	"Qu�n T� M�t t�ch",				0,	107,	19,	-1,	},
	[11] = {TYPE_ITEM,	2,			1,	"Tr�n Qu�n M�t t�ch",				0,	107,	21,	-1,	},
	[12] = {TYPE_ITEM,	2,			1,	"Xuy�n V�n M�t t�ch",				0,	107,	23,	-1,	},
	[13] = {TYPE_ITEM,	2,			1,	"U Minh Qu� L�c",				0,	107,	25,	-1,	},
	[14] = {TYPE_ITEM,	2,			1,	"Linh C� M�t t�ch",				0,	107,	27,	-1,	},
	[15] = {TYPE_ITEM,	10,			1,	"B�t B�o T�y T�y Ti�n ��n",			2,	0,	138,	7,	},
	[16] = {TYPE_ITEM,	50,			1,	"T�y T�y linh ��n",				2,	0,	137,	7,	},
	[17] = {TYPE_ITEM,	1000,		1,	"Chi�m Y Ph�",				0,	107,	66,	-1,	},
	[18] = {TYPE_ITEM,	2000,		1,	"T� H� M�t t�ch",				0,	107,	65,	-1,	},
	[19] = {TYPE_ITEM,	3000,		1,	"Thi�n H� M�t t�ch",				0,	107,	64,	-1,	},
	[20] = {TYPE_ITEM,	10000,		1,	"M�nh Thi�n th�ch",				2,	2,		7,	-1,	},
	[21] = {TYPE_ITEM,	10000,		1,	"Thi�n th�ch",					2,	2,		8,	-1,	},
	[22] = {TYPE_ITEM,	40000,		1,	"M�nh B�ng th�ch",				2,	1,	148,	-1,	},
	[23] = {TYPE_ITEM,	40000,		1,	"B�ng th�ch",					2,	1,	149,	-1,	},
	[24] = {TYPE_ITEM,	10000,		1,	"B�ng Lai Ti�n Th�y",				2,	1,	1012,	-1,	},
	[25] = {TYPE_ITEM,	20000,		1,	"B�ng Lai L� Th�y",				2,	1,	1052,	-1,	},
	[26] = {TYPE_ITEM,	10000,		1,	"Ch� Mai",					2,	1,	30054,	-1,	},
	[27] = {TYPE_ITEM,	10000,		1,	"Ch� Lan",					2,	1,	30055,	-1,	},
	[28] = {TYPE_ITEM,	10000,		1,	"Ch� C�c",					2,	1,	30057,	-1,	},
	[29] = {TYPE_ITEM,	10000,		1,	"Ch� Tr�c",					2,	1,	30056,	-1,	},
	[30] = {TYPE_ITEM,	10000,		1,	"Th� Th�n ph�",				2,	0,	556,	7,	},
	[31] = {TYPE_ITEM,	2000,		1,	"Th�n h�nh b� ph�",				0,	200,	39,	7,	},
	[32] = {TYPE_ITEM,	20000,		1,	"Ti�u Ki�p t�n",				2,	0,	141,	7,	},
	[33] = {TYPE_EQUIP,	100,		1,	"Ho�ng T�ng m�",				0,	105,	6,	7,	},
	[34] = {TYPE_EQUIP,	100,		1,	"H�ng T�ng m�",				0,	105,	5,	7,	},
	[35] = {TYPE_EQUIP,	100,		1,	"B�ch K�",					0,	105,	4,	7,	},
	[36] = {TYPE_EQUIP,	100,		1,	"B�ch T�ng m�",				0,	105,	8,	7,	},
	[37] = {TYPE_EQUIP,	100,		1,	"H�c T�ng m�",				0,	105,	7,	7,	},
	[38] = {TYPE_ITEM,	20000,		1,	"Ng�ng H�n t�n",				1,	0,		63,	-1,	},
	[39] = {TYPE_ITEM,	20000,		1,	"V� �y t�n",				1,	0,		65,	-1,	},
	[40] = {TYPE_ITEM,	10000,		1,	"Th�n Gi�p ��n",				1,	0,		54,	-1,	},
	[41] = {TYPE_ITEM,	10000,		1,	"Th�n Tr�o ��n",				1,	0,		55,	-1,	},
	[42] = {TYPE_ITEM,	15000,		1,	"Th�t X�o Linh ��n",				1,	0,		68,	-1,	},
	[43] = {TYPE_ITEM,	15000,		1,	"Ng� Chuy�n Linh B�o ��n",			1,	0,		53,	-1,	},
	[44] = {TYPE_ITEM,	12000,		1,	"Ch�nh Nguy�n H�i T�m ��n",			1,	0,		50,	-1,	},
	[45] = {TYPE_ITEM,	70000,		15,	"D��c th�o qu�n d�ng",				2,	0,	312,	-1,	},
	[46] = {TYPE_ITEM,	70000,		15,	"L�a m�ch qu�n d�ng",				2,	0,	309,	-1,	},
	[47] = {TYPE_ITEM,	70000,		15,	"Kho�ng th�ch qu�n d�ng",				2,	0,	307,	-1,	},
	[48] = {TYPE_ITEM,	70000,		15,	"Linh huy�t qu�n d�ng",				2,	0,	313,	-1,	},
	[49] = {TYPE_ITEM,	70000,		15,	"T� t�m qu�n d�ng",				2,	0,	311,	-1,	},
	[50] = {TYPE_ITEM,	70000,		15,	"G� qu�n d�ng",				2,	0,	308,	-1,	},
	[51] = {TYPE_ITEM,	70000,		15,	"Thu�c da qu�n d�ng",				2,	0,	310,	-1,	},
	[52] = {TYPE_ITEM,	1,			1,	"��t Ma V� quy�t",			2,	6,	10,		-1,	},
	[53] = {TYPE_ITEM,	1,			1,	"Long Tr�o Th� quy�t",		2,	6,	20,		-1,	},
	[54] = {TYPE_ITEM,	1,			1,	"Kim Cang Ch� quy�t",		2,	6,	31,		-1,	},
	[55] = {TYPE_ITEM,	1,			1,	"M�n Thi�n V� quy�t",			2,	6,	46,		-1,	},
	[56] = {TYPE_ITEM,	1,			1,	"��i Bi quy�t",		2,	6,	59,		-1,	},
	[57] = {TYPE_ITEM,	1,			1,	"M� T�m Kh�c quy�t",		2,	6,	70,		-1,	},
	[58] = {TYPE_ITEM,	1,			1,	"T�y Quy�n",				2,	6,	79,		-1,	},
	[59] = {TYPE_ITEM,	1,			1,	"�� C�u quy�t",			2,	6,	88,		-1,	},
	[60] = {TYPE_ITEM,	1,			1,	"Th�t Ti�t Ki�m quy�t",		2,	6,	108,	-1,	},
	[61] = {TYPE_ITEM,	1,			1,	"Th��ng Thanh C�ng quy�t",		2,	6,	119,	-1,	},
	[62] = {TYPE_ITEM,	1,			1,	"B�ch Th��ng quy�t",		2,	6,	130,	-1,	},
	[63] = {TYPE_ITEM,	1,			1,	"L�u Tuy�t Ti�n quy�t",		2,	6,	141,	-1,	},
	[64] = {TYPE_ITEM,	1,			1,	"B� ki�p Thi Li�t Ma C�ng",			2,	6,	154,	-1,	},
	[65] = {TYPE_ITEM,	1,			1,	"B� ki�p T�m C�",				2,	6,	168,	-1,	},

	--		����	   ���� ��ֵ	��ʾ�ַ��� 		�����ַ���
	[66] = {TYPE_CMD,	50000,	3,	{"�i�m danh v�ng"},		"ModifyReputation(%d,0)"},
	[67] = {TYPE_CMD,	70000,	20,	"�i�m tu luy�n",		"ModifyPopur(%d)"},
	[68] = {TYPE_CMD,	79398,	100,"�i�m T�ng ki�m",	"SetTask(1801, GetTask(1801)+%d)"},
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
		WriteLogEx(g_szLogTitle, "Hoa Mai", nItemNum, szItemName, szInfoDescribe, GetTongName() )
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
		WriteLogEx(g_szLogTitle, "Hoa Mai", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "Hoa Mai", "", "", szInfoDescribe, GetTongName(), "Thu ���c th�t b�i, ".."AddItem return value = "..nRetCode)
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

