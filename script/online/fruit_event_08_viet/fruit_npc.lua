--File name:	fruit_npc.lua
--Describe:		ˮ�����npc�ű�
--Create Date:	2008-06-23
--Author:		chenbenqian

Include("\\script\\online\\fruit_event_08_viet\\fruit_event_head.lua");
Include("\\script\\lib\\globalfunctions.lua")

g_LogTitle = "L� h�i tr�i c�y : ".."��i";		--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���

function main()
	if is_fruit_event_viet_open() == 0 then
		return
	end
	local selTab = {
				"T�m hi�u c�ch th�c ��i tr�i c�y./fruit_event",
				"K�t th�c ��i tho�i/no",
				}
	Say("<color=green>Th��ng nh�n tr�i c�y<color>: ".."T� 04-07-2008 ��n 24:00 27-07-2008, ".."Trong th�i gian L� h�i tr�i c�y, ng��i ch�i c� th� th�ng qua tham gia Nhi�m v� s� m�n, T�ng ki�m s�n trang v� tr�ng c�y B�t nh� �� thu th�p T�i tr�i c�y. Sau khi m� T�i tr�i c�y s� nh�n ���c 1 trong 5 lo�i tr�i c�y, nh�: Nho, M�ng c�u, M�ng c�t, V� s�a, S�u ri�ng. Sau khi s� d�ng tr�i c�y s� nh�n ���c ph�n th��ng �i�m kinh nghi�m v� v�t ph�m qu� b�u.",getn(selTab),selTab);
end

function fruit_event()
		local selTab = {
					"��i tr�i c�y theo h�nh th�c 1/#exchange_fruit(1)",
					"��i tr�i c�y theo h�nh th�c 2/#exchange_fruit(2)",
					"��i tr�i c�y theo h�nh th�c 3/#exchange_fruit(3)",
					"��i tr�i c�y theo h�nh th�c 4/#exchange_fruit(4)",
					"K�t th�c ��i tho�i/no",
					}
		Say("<color=green>Th��ng nh�n tr�i c�y<color>: C� 4 c�ch ��i:\n<color=yellow>C�ch th�c 1<color>: 3 Nho = 1 M�ng c�u.\n<color=yellow>C�ch th�c 2<color>: 3 M�ng c�u + 1 Nho = 1 M�ng c�t.\n<color=yellow>C�ch th�c 3<color>: 3 M�ng c�t + 1 M�ng c�u + 1 Nho + 10 B�c = 1 V� s�a.\n<color=yellow>C�ch th�c 4<color>: 3 V� s�a + 1 M�ng c�t + 1 M�ng c�u + 1 Nho + 80 B�c = 1 S�u ri�ng.",getn(selTab),selTab);
end

function exchange_fruit(nType)
	local nRetCode = 0;
	if nType == 1 then
		if GetItemCount(2,1,30009) < 3 then
			Say("<color=green>Th��ng nh�n tr�i c�y<color>: Nguy�n li�u mang theo kh�ng ��.",1,"Th�t ng�i qu�, �� ta ki�m tra l�i!/no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"","<color=green>Th��ng nh�n tr�i c�y<color>: H�y ��m b�o h�nh trang �� ch� tr�ng v� tr�ng l��ng �� tr�nh l�ng ph� kh�ng c�n thi�t.");
				return
			end;
			if del_item_ex("Nho",2,1,30009,3) == 1 then
				add_item_ex("M�ng c�u",2,1,30010,1)
			else
				Say("<color=green>Th��ng nh�n tr�i c�y<color>: Nguy�n li�u mang theo kh�ng ��.",1,"Th�t ng�i qu�, �� ta ki�m tra l�i!/no");
				return
			end
		end
	elseif nType == 2 then
		if GetItemCount(2,1,30009) < 1 or GetItemCount(2,1,30010) < 3 then
			Say("<color=green>Th��ng nh�n tr�i c�y<color>: Nguy�n li�u mang theo kh�ng ��.",1,"Th�t ng�i qu�, �� ta ki�m tra l�i!/no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"","<color=green>Th��ng nh�n tr�i c�y<color>: H�y ��m b�o h�nh trang �� ch� tr�ng v� tr�ng l��ng �� tr�nh l�ng ph� kh�ng c�n thi�t.");
				return
			end;
			if del_item_ex("Nho",2,1,30009,1) == 1 and del_item_ex("M�ng c�u",2,1,30010,3) then
				add_item_ex("M�ng c�t",2,1,30011,1)
			else
				Say("<color=green>Th��ng nh�n tr�i c�y<color>: Nguy�n li�u mang theo kh�ng ��.",1,"Th�t ng�i qu�, �� ta ki�m tra l�i!/no");
				return
			end
		end
	elseif nType == 3 then
		if GetItemCount(2,1,30009) < 1 or GetItemCount(2,1,30010) < 1 or GetItemCount(2,1,30011) < 3 or GetCash() < 1000 then
			Say("<color=green>Th��ng nh�n tr�i c�y<color>: Nguy�n li�u mang theo kh�ng ��.",1,"Th�t ng�i qu�, �� ta ki�m tra l�i!/no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"","<color=green>Th��ng nh�n tr�i c�y<color>: H�y ��m b�o h�nh trang �� ch� tr�ng v� tr�ng l��ng �� tr�nh l�ng ph� kh�ng c�n thi�t.");
				return
			end;
			if del_item_ex("Nho",2,1,30009,1) == 1 and del_item_ex("M�ng c�u",2,1,30010,1) and del_item_ex("M�ng c�t",2,1,30011,3) and pay_ex(1000) then
				add_item_ex("V� s�a",2,1,30012,1)
			else
				Say("<color=green>Th��ng nh�n tr�i c�y<color>: Nguy�n li�u mang theo kh�ng ��.",1,"Th�t ng�i qu�, �� ta ki�m tra l�i!/no");
				return
			end
		end
	elseif nType == 4 then
		if GetItemCount(2,1,30009) < 1 or GetItemCount(2,1,30010) < 1 or GetItemCount(2,1,30011) < 1 or GetItemCount(2,1,30012) < 3 or GetCash() < 8000 then
			Say("<color=green>Th��ng nh�n tr�i c�y<color>: Nguy�n li�u mang theo kh�ng ��.",1,"Th�t ng�i qu�, �� ta ki�m tra l�i!/no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"","<color=green>Th��ng nh�n tr�i c�y<color>: H�y ��m b�o h�nh trang �� ch� tr�ng v� tr�ng l��ng �� tr�nh l�ng ph� kh�ng c�n thi�t.");
				return
			end;
			if del_item_ex("Nho",2,1,30009,1) == 1 and del_item_ex("M�ng c�u",2,1,30010,1) and del_item_ex("M�ng c�t",2,1,30011,1) and del_item_ex("V� s�a",2,1,30012,3) and pay_ex(8000) then
				add_item_ex("S�u ri�ng",2,1,30013,1)
			else
				Say("<color=green>Th��ng nh�n tr�i c�y<color>: Nguy�n li�u mang theo kh�ng ��.",1,"Th�t ng�i qu�, �� ta ki�m tra l�i!/no");
				return
			end
		end
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] function exchange_fruit(nType), parameter nType error, nType = "..nType);
	end
end


function add_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c  "..nItemNum.." c�i "..szItemName);
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName);
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function del_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = DelItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		return 1;
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] delete "..nItemNum.." "..szItemName.." Failed, DelItem("..genre..", "..detail..", "..particular..", "..nItemNum..") return value = "..nRetCode);
		return 0;
	end
end

function pay_ex(nNum)
	local nRetCode = 0;
	nRetCode = Pay(nNum)
	if nRetCode == 1 then
		return 1
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Pay("..nNum..") Failed, return value = "..nRetCode);
		return 0
	end
end

function no()
end

