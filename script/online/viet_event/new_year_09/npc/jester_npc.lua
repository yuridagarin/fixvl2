--File name:	jester_npc.lua
--Describe:		���ڻС��npc�ļ�
--Create Date:	2008-12-24
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\new_year_09\\new_year_func.lua")
Include("\\script\\lib\\globalfunctions.lua")

TYPE_NULL 	= 0;	--û�н���
TYPE_ITEM 	= 1;	--��ͨ��Ʒ
TYPE_EQUIP 	= 2;	--������װ������Ʒ
TYPE_CMD 	= 3;	--����

g_szLogTitle = "Hoat dong Tet 2009"				--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_szInfoHead = "<color=green>".."Ti�u S�u".."<color>: "

g_nDenominator = 10000								--��ĸ����ʾ���ʵĵ�λ��x��֮1
g_nExpNum = 100000									--ʹ��÷�C���C�ըC���õľ���ֵ

g_szFileName = "jester_npc.lua"						--�ļ���


g_tbOldItem = 
{
	--		����		ID1,ID2,ID3,	����
	[1] = {"N��c Tinh Khi�t",		2,	1,	30047,	5,	},
	[2] = {"B�nh Hoa",		2,	1,	30048,	1,	},
	[3] = {"D��ng Ch�t",		2,	1,	30049,	4,	},
	[4] = {"Nh�nh ��o",	2,	1,	30050,	1,	},
	[5] = {"Nh�nh hoa Mai",	2,	1,	30051,	1,	},
}

g_tbNewItem = 
{
	--		����		ID1,ID2,ID3,	����
	[1] = {"Hoa ��o",	2,	1,	30052,	1,	},
	[2] = {"Hoa Mai",	2,	1,	30053,	1,	},
}

g_tbWord =
{
	--		����		ID1,ID2,ID3,	����
	[1] = {"Ch� Mai",	2,	1,	30054,	1,	},
	[2] = {"Ch� Lan",	2,	1,	30055,	1,	},
	[3] = {"Ch� Tr�c",	2,	1,	30056,	1,	},
	[4] = {"Ch� C�c",	2,	1,	30057,	1,	},
}

g_tbWordAward = 
{
	--		����	   ����		���� ����		ID1,ID2,ID3
	[1] = {TYPE_NULL,	9545,	},
	[2] = {TYPE_EQUIP,	10,		1,	"Ti�u Th� Gi�i Ch�",		0,	102,	36,	},
	[3] = {TYPE_EQUIP,	10,		1,	"Trang Ch� m�o",		0,	103,	91,	},
	[4] = {TYPE_EQUIP,	10,		1,	"Trang Ch� m�o",		0,	103,	92,	},
	[5] = {TYPE_EQUIP,	10,		1,	"Trang Ch� m�o",		0,	103,	93,	},
	[6] = {TYPE_EQUIP,	10,		1,	"Trang Ch� m�o",		0,	103,	94,	},
	[7] = {TYPE_EQUIP,	50,		1,	"T�ng Qu�n Ngo�i trang",		0,	100,	91,	},
	[8] = {TYPE_EQUIP,	50,		1,	"T�ng Qu�n Ngo�i trang",		0,	100,	92,	},
	[9] = {TYPE_EQUIP,	50,		1,	"T�ng Qu�n Ngo�i trang",		0,	100,	93,	},
	[10] = {TYPE_EQUIP,	50,		1,	"T�ng Qu�n Ngo�i trang",		0,	100,	94,	},
	[11] = {TYPE_EQUIP,	50,		1,	"T�ng Qu�n kh�",		0,	101,	91,	},
	[12] = {TYPE_EQUIP,	50,		1,	"T�ng Qu�n kh�",		0,	101,	92,	},
	[13] = {TYPE_EQUIP,	50,		1,	"T�ng Qu�n kh�",		0,	101,	93,	},
	[14] = {TYPE_EQUIP,	50,		1,	"T�ng Qu�n kh�",		0,	101,	94,	},
	[15] = {TYPE_EQUIP,	5,		1,	"Tr��ng L�o Ch� Ho�n",		0,	102,	37,	},
}

function main()
	if is_new_year_09_viet_open() == 0 then
		Talk(1,"",g_szInfoHead.."Ho�t ��ng t�t �� k�t th�c.");
		return
	end
	local selTab = {
				"��i 1 hoa ��o/#want_exchange(1)",
				"��i 1 hoa Mai/#want_exchange(2)",
				"Mua nh�nh hoa ��o (1 v�ng 50 b�c)/bug_peach",
				"Ta �� thu th�p �� b� ch� [Mai-Lan-Tr�c-C�c]/exchange_word",
				"Nh�n v�t ph�m c�m nang ��i s� ki�n/give_pouch",
				"Ta ch� ��n xem th�/no",
				}
	Say(g_szInfoHead.."T�i h� l� ng��i tr�ng ch�m s�c Hoa Mai v� Hoa ��o ��n t� v�ng giang nam, ch�ng hay t�i h� c� th� gi�p g� cho ��i hi�p?",getn(selTab),selTab);
end

function bug_peach()
	if GetCash() < 15000 then
		Say(g_szInfoHead.."��i hi�p kh�ng �� ng�n l��ng tr�n ng��i r�i!",1,"Th�t l� ng�i qu�! T�i h� xin c�o t�./no")
		return
	end
	if gf_Judge_Room_Weight(1,20) == 0 then
		Talk(1,"",g_szInfoHead.."Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!")
		return
	end
	if pay_ex(15000) == 1 then
		add_item_ex(g_tbOldItem[4])
	else
		Say(g_szInfoHead.."��i hi�p kh�ng �� ng�n l��ng tr�n ng��i r�i!",1,"Th�t l� ng�i qu�! T�i h� xin c�o t�./no")
		return
	end
	main()
end

function give_pouch()
	if GetItemCount(2, 1, 30045) > 0 then
		Say(g_szInfoHead.."��i hi�p �� c� m�t c�i r�i, kh�ng th� nh�n ti�p ���c n�a!",1,"K�t th�c ��i tho�i/no")
		return
	end
	if gf_Judge_Room_Weight(1,20) == 0 then
		Talk(1,"",g_szInfoHead.."Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!")
		return
	end
	add_item_ex( {"C�m Nang ��i S� Ki�n",	2,	1,	30045,	1} )
end

function want_exchange(nType)
	local selTab = {
				format("��ng � ��i /#exchange_box(%d)", nType),
				"Ta ch� ��n xem th�/no",
				}
	if nType == 1 then
		Say(g_szInfoHead.."\n  5 N��c Tinh Khi�t + 1 B�nh Hoa + 4 D��ng Ch�t + 1 Nh�nh Hoa ��o = 1 Hoa ��o \n ��i hi�p c� mu�n ��i kh�ng?",getn(selTab),selTab);
	elseif nType == 2 then
		Say(g_szInfoHead.."\n  5 N��c Tinh Khi�t + 1 B�nh Hoa + 4 D��ng Ch�t + 1 Nh�nh Hoa Mai = 1 Hoa Mai \n ��i hi�p c� mu�n ��i kh�ng?",getn(selTab),selTab);
	else
		WriteLogEx(g_szLogTitle, "NULL", "NULL", "NULL", "NULL", GetTongName(), "function want_exchange(nType) in file "..g_szFileName..", parameter nType error, nType = "..nType)
	end
end

function exchange_box(nType)
	if nType == 1 then
		if check_item_count(g_tbOldItem[1]) == 0 or check_item_count(g_tbOldItem[2]) == 0 or check_item_count(g_tbOldItem[3]) == 0 or check_item_count(g_tbOldItem[4]) == 0 then
			Say(g_szInfoHead.."Kh�ng �� nguy�n li�u c�n thi�t.",1,"Th�t l� ng�i qu�! T�i h� xin c�o t�./no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"",g_szInfoHead.."Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!");
				return
			end;
			if del_item_ex(g_tbOldItem[1]) == 1 and del_item_ex(g_tbOldItem[2]) == 1 and del_item_ex(g_tbOldItem[3]) == 1 and del_item_ex(g_tbOldItem[4]) == 1 then
				add_item_ex(g_tbNewItem[1])
			else
				Say(g_szInfoHead.."Kh�ng �� nguy�n li�u c�n thi�t.",1,"Th�t l� ng�i qu�! T�i h� xin c�o t�./no");
				return
			end
		end
	elseif nType == 2 then
		if check_item_count(g_tbOldItem[1]) == 0 or check_item_count(g_tbOldItem[2]) == 0 or check_item_count(g_tbOldItem[3]) == 0 or check_item_count(g_tbOldItem[5]) == 0 then
			Say(g_szInfoHead.."Kh�ng �� nguy�n li�u c�n thi�t.",1,"Th�t l� ng�i qu�! T�i h� xin c�o t�./no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"",g_szInfoHead.."Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!");
				return
			end;
			if del_item_ex(g_tbOldItem[1]) == 1 and del_item_ex(g_tbOldItem[2]) == 1 and del_item_ex(g_tbOldItem[3]) == 1 and del_item_ex(g_tbOldItem[5]) == 1 then
				add_item_ex(g_tbNewItem[2])
			else
				Say(g_szInfoHead.."Kh�ng �� nguy�n li�u c�n thi�t.",1,"Th�t l� ng�i qu�! T�i h� xin c�o t�./no");
				return
			end
		end
	else
		WriteLogEx(g_szLogTitle, "NULL", "NULL", "NULL", "NULL", GetTongName(), "function exchange_box(nType) in file "..g_szFileName..", parameter nType error, nType = "..nType)
	end
	main()
end

function exchange_word()
	if check_item_count(g_tbWord[1]) == 0 or check_item_count(g_tbWord[2]) == 0 or check_item_count(g_tbWord[3]) == 0 or check_item_count(g_tbWord[4]) == 0 then
		Say(g_szInfoHead.."Kh�ng �� nguy�n li�u c�n thi�t.",1,"Th�t l� ng�i qu�! T�i h� xin c�o t�./no");
		return
	else
		if gf_Judge_Room_Weight(1,100) == 0 then
			Talk(1,"",g_szInfoHead.."Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!");
			return
		end;
		if del_item_ex(g_tbWord[1]) == 1 and del_item_ex(g_tbWord[2]) == 1 and del_item_ex(g_tbWord[3]) == 1 and del_item_ex(g_tbWord[4]) == 1 then
			give_word_award()
		else
			Say(g_szInfoHead.."Kh�ng �� nguy�n li�u c�n thi�t.",1,"Th�t l� ng�i qu�! T�i h� xin c�o t�./no");
			return
		end
	end
end

function give_word_award()
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
		WriteLogEx(g_szLogTitle, "Nh�n ���c", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	end
	--��Ʒ��������
	local nRandIdx = get_random_item(g_tbWordAward)
	if nRandIdx == 0 then
		return
	end
	local nType = g_tbWordAward[nRandIdx][1]
	local szItemName = g_tbWordAward[nRandIdx][4]
	local nItemNum = g_tbWordAward[nRandIdx][3]
	local szInfoDescribe = ""

	local nRetCode = 0
	if nType == TYPE_NULL then
		return
	elseif nType == TYPE_ITEM then
		nRetCode = AddItem(g_tbWordAward[nRandIdx][5],g_tbWordAward[nRandIdx][6],g_tbWordAward[nRandIdx][7],g_tbWordAward[nRandIdx][3])
		szInfoDescribe = format("(%d,%d,%d)", g_tbWordAward[nRandIdx][5], g_tbWordAward[nRandIdx][6], g_tbWordAward[nRandIdx][7])
	elseif nType == TYPE_EQUIP then
		nRetCode = AddItem(g_tbWordAward[nRandIdx][5],g_tbWordAward[nRandIdx][6],g_tbWordAward[nRandIdx][7],g_tbWordAward[nRandIdx][3],1,-1,-1,-1,-1,-1,-1)
		szInfoDescribe = format("(%d,%d,%d)", g_tbWordAward[nRandIdx][5], g_tbWordAward[nRandIdx][6], g_tbWordAward[nRandIdx][7])
	elseif nType == TYPE_CMD then
		szInfoDescribe = format(g_tbWordAward[nRandIdx][5],g_tbWordAward[nRandIdx][3])
		dostring(szInfoDescribe)
		nRetCode = 1	--Ĭ������ɹ�ִ��
	end;

	if nRetCode == 1 then
		if type(szItemName) == "table" then
			szItemName = szItemName[1]
		else
			Msg2Player("B�n nh�n ���c  "..nItemNum.." "..szItemName)
		end
		WriteLogEx(g_szLogTitle, "Nh�n ���c", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "Nh�n ���c", "", "", szInfoDescribe, GetTongName(), "Thu ���c th�t b�i, ".."AddItem return value = "..nRetCode)
	end
	main()
end

--���ո��ʻ��g_tbWordAward�����һ������
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

function add_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0

	nRetCode = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c  "..nItemNum.." c�i "..szItemName);
		WriteLogEx(g_szLogTitle, "Nh�n ���c", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "Nh�n ���c", "", "", format("(%d,%d,%d)", G, D, P), GetTongName(), "Thu ���c th�t b�i, ".."AddItem return value = "..nRetCode)
	end
end

function del_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0
	
	nRetCode = DelItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		return 1
	else
		WriteLogEx(g_szLogTitle, "Tr� v�t ph�m ", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName(), "Tr� v�t ph�m th�t b�i, ".."DelItem return value = "..nRetCode)
		return 0
	end
end

function pay_ex(nNum)
	local nRetCode = 0;
	nRetCode = Pay(nNum)
	if nRetCode == 1 then
		return 1
	else
		WriteLogEx(g_szLogTitle, format("Pay(%d)", nItemNum), nItemNum, "NULL", "NULL", GetTongName(), format("Pay(%d)", nItemNum).." Failed, return value = "..nRetCode)
		return 0
	end
end

function check_item_count(tItem)
	if GetItemCount(tItem[2],tItem[3],tItem[4]) < tItem[5] then
		return 0
	else
		return 1
	end
end

function no()
end

