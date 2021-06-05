--File name:	girl_npc.lua
--Describe:		ʥ���ڻ����npc�ļ�
--Create Date:	2008-11-18
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\xmas_08\\xmas_func.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Giang Sinh 2008"			--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_szInfoHead = "<color=green>".."B�ng Nhi".."<color>: "

g_szFileName = "girl_npc.lua"			--�ļ���


g_tbOldItem = 
{
	--		����		ID1,ID2,ID3,	����
	[1] = {"V� Gi�ng Sinh",	2,	1,	30041,	6,	},
	[2] = {"Chu�ng Gi�ng Sinh",	2,	1,	30042,	3,	},
	[3] = {"Nh�nh Th�ng Gi�ng Sinh",	2,	1,	30040,	1,	},
	[4] = {"C�y K�o Gi�ng Sinh",	2,	1,	30043,	1,	},
	[5] = {"Ng�i Sao Gi�ng Sinh",	2,	1,	30044,	1,	},
}

g_tbNewItem = 
{
	--		����		ID1,ID2,ID3,	����
	[1] = {"H�p Qu� Xanh",	2,	1,	30033,	1,	},
	[2] = {"H�p Qu� ��",	2,	1,	30034,	1,	},
}

function main()
	if is_xmas_08_viet_open() == 0 then
		return
	end
	local selTab = {
				"��i 1 H�p Qu� Xanh/#want_exchange(1)",
				"��i 1 H�p Qu� ��/#want_exchange(2)",
				"Mua C�y K�o Gi�ng Sinh (1 c�y k�o = 50 b�c)/bug_sugar",
				"Nh�n v�t ph�m c�m nang ��i s� ki�n/give_pouch",
				"Ta ch� ��n xem th�/no",
				}
	Say(g_szInfoHead.."Ho�t ��ng gi�ng sinh n�m nay di�n ra t� 06-12-2008 ��n 24:00 04-01-2009. Trong th�i gian ho�t ��ng, c�c v� v� l�m nh�n s� th�ng qua ��nh qu�i v� c�c ch�c n�ng �� thu ���c h�p qu� gi�ng sinh, m� h�p qu� gi�ng sinh  s� thu ���c H�p Qu� Xanh v� H�p Qu� ��. \nC�c h� mu�n ��i lo�i qu� n�o?",getn(selTab),selTab);
end

function bug_sugar()
	if GetCash() < 5000 then
		Say(g_szInfoHead.."��i hi�p kh�ng �� ng�n l��ng tr�n ng��i r�i!",1,"Th�t l� ng�i qu�! T�i h� xin c�o t�./no")
		return
	end
	if gf_Judge_Room_Weight(1,20) == 0 then
		Talk(1,"",g_szInfoHead.."Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!")
		return
	end
	if pay_ex(5000) == 1 then
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
		Say(g_szInfoHead.."\n  6 V� Gi�ng Sinh + 3 Chu�ng Gi�ng Sinh + 1 Nh�nh Th�ng Gi�ng Sinh + 1 C�y K�o Gi�ng Sinh = 1 H�p Qu� Xanh",getn(selTab),selTab);
	elseif nType == 2 then
		Say(g_szInfoHead.."\n 6 V� Gi�ng Sinh + 3 Chu�ng Gi�ng Sinh + 1 Nh�nh Th�ng Gi�ng Sinh + 1 Ng�i Sao Gi�ng Sinh = 1 H�p Qu� ��",getn(selTab),selTab);
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


function add_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0

	nRetCode = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c  "..nItemNum.." c�i "..szItemName);
		WriteLogEx(g_szLogTitle, "B�ng Nhi", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "B�ng Nhi", "", "", "", "", "Thu ���c th�t b�i, ".."AddItem return value = "..nRetCode)
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

