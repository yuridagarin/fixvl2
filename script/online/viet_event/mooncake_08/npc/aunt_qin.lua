--File name:	shop_manager.lua
--Describe:		�����ش���npc�ļ�
--Create Date:	2008-08-25
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Ho�t ��ng trung thu : ".."T�n ��i th�m"		--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_szInfoHead = "<color=green>T�n ��i th�m<color>: "


function main()
	if is_mooncake_viet_open() == 0 then
		return
	end
	local selTab = {
				"Nh� ��i Th�m gi�p t�i h� l�m ra B�nh trung thu ch�a n��ng lo�i th��ng./#make_mooncake(1)",
				"Nh� ��i Th�m gi�p t�i h� l�m ra B�nh trung thu ch�a n��ng lo�i ��c bi�t./#make_mooncake(2)",
				"C�ch l�m B�nh trung thu/mooncake_guide",
				"T�i h� mu�n mua 1 b� c�i (1 b� c�i = 10 b�c)/bug_wood",
				"Ta ch� ��n xem th�/no",
				}
	Say(g_szInfoHead.."Ho�t ��ng l�m B�nh Trung Thu di�n ra t� ng�y 05-09-2008 ��n 24:00 ng�y 05-10-2008. Trong th�i gian n�y, ng��i ch�i tham gia c�c ho�t ��ng trong tr� ch�i �� thu th�p c�c T�i Nguy�n Li�u, b�n trong c� ch�a c�c nguy�n li�u c�n thi�t �� l�m B�nh Trung Thu. Ngo�i ra, ng��i ch�i c� th� l�m ra nh�ng chi�c b�nh trung thu ��c bi�t khi mua g�i Gia V� t� Ng� C�c. S� d�ng c�c lo�i B�nh Trung Thu s� ���c �i�m kinh nghi�m v� v�t ph�m c� gi� tr�.",getn(selTab),selTab);
end

function bug_wood()
	if GetCash() < 1000 then
		Say(g_szInfoHead.."1 B� C�i = 10 B�c, c�c h� mang theo kh�ng �� B�c th� ph�i!",1,"Th�t ng�i qu�, �� ta ki�m tra l�i!/no")
		return
	end
	if gf_Judge_Room_Weight(1,20) == 0 then
		Talk(1,"",g_szInfoHead.."Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!")
		return
	end
	if pay_ex(1000) == 1 then
		add_item_ex("C�i",2,1,30022,1)
	else
		Say(g_szInfoHead.."1 B� C�i = 10 B�c, c�c h� mang theo kh�ng �� B�c th� ph�i!",1,"Th�t ng�i qu�, �� ta ki�m tra l�i!/no")
		return
	end
end

function mooncake_guide()
	Say(g_szInfoHead.."Nguy�n li�u c�n thi�t:\n- 1 B�nh trung thu ch�a n��ng lo�i th��ng c�n c�: 2 B�t M� + 1 ���ng C�t + 1 Tr�ng Mu�i + 1 Nguy�n Li�u Th�p C�m + 40B�c\n- 1 B�nh trung thu ch�a n��ng lo�i ��c bi�t c�n c�: 2 B�t M� + 1 ���ng C�t + 1 Tr�ng Mu�i + 1 Nguy�n Li�u Th�p C�m + 1 G�i Gia V�\nNg��i ch�i mua m�t �t B� C�i �� n��ng b�nh, m�t l�n c� th� n��ng 8 B�nh. T�y theo s� l�n b� c�i th�nh c�ng trong qu� tr�nh n��ng b�nh m� ng��i ch�i s� nh�n ���c nh�ng chi�c B�nh trung thu th�m ngon.",1,"C�m �n T�n ��i Th�m �� t�n t�nh h��ng d�n!/no");
end

function make_mooncake(nType)
	if GetLevel() < 20 then
		Talk(1,"",g_szInfoHead.."Ng��i ch�i ph�i c�p 20 tr� l�n m�i c� th� ti�n h�nh n��ng B�nh trung thu");
		return
	end

	local nRetCode = 0;
	if nType == 1 then
		if GetItemCount(2,1,30017) < 2 or GetItemCount(2,1,30018) < 1 or GetItemCount(2,1,30019) < 1 or GetItemCount(2,1,30020) < 1 or GetCash() < 4000 then
			Say(g_szInfoHead.."Kh�ng �� c�c nguy�n li�u c�n thi�t th� ta kh�ng th� l�m ra nh�ng chi�c B�nh trung thu ch�a n��ng ���c. H�y c� g�ng t�m th�m nguy�n li�u nh�!",1,"V�ng! T�i h� s� quay l�i sau khi c� �� nguy�n li�u!!/no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"",g_szInfoHead.."Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!");
				return
			end;
			if del_item_ex("B�t m�",2,1,30017,2) == 1 and del_item_ex("���ng c�t",2,1,30018,1) == 1 and del_item_ex("Tr�ng mu�i",2,1,30019,1) == 1 and del_item_ex("Nguy�n li�u th�p c�m",2,1,30020,1) == 1 and pay_ex(4000) == 1 then
				add_item_ex("B�nh ch�a n��ng th��ng",2,1,30023,1)
			else
				Say(g_szInfoHead.."Kh�ng �� c�c nguy�n li�u c�n thi�t th� ta kh�ng th� l�m ra nh�ng chi�c B�nh trung thu ch�a n��ng ���c. H�y c� g�ng t�m th�m nguy�n li�u nh�!",1,"V�ng! T�i h� s� quay l�i sau khi c� �� nguy�n li�u!!/no");
				return
			end
		end
	elseif nType == 2 then
		if GetItemCount(2,1,30017) < 2 or GetItemCount(2,1,30018) < 1 or GetItemCount(2,1,30019) < 1 or GetItemCount(2,1,30020) < 1 or GetItemCount(2,1,30021) < 1 then
			Say(g_szInfoHead.."Kh�ng �� c�c nguy�n li�u c�n thi�t th� ta kh�ng th� l�m ra nh�ng chi�c B�nh trung thu ch�a n��ng ���c. H�y c� g�ng t�m th�m nguy�n li�u nh�!",1,"V�ng! T�i h� s� quay l�i sau khi c� �� nguy�n li�u!!/no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"",g_szInfoHead.."Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!");
				return
			end;
			if del_item_ex("B�t m�",2,1,30017,2) == 1 and del_item_ex("���ng c�t",2,1,30018,1) == 1 and del_item_ex("Tr�ng mu�i",2,1,30019,1) == 1 and del_item_ex("Nguy�n li�u th�p c�m",2,1,30020,1) == 1 and del_item_ex("G�i gia v�",2,1,30021,1) == 1 then
				add_item_ex("B�nh ch�a n��ng �B",2,1,30024,1)
			else
				Say(g_szInfoHead.."Kh�ng �� c�c nguy�n li�u c�n thi�t th� ta kh�ng th� l�m ra nh�ng chi�c B�nh trung thu ch�a n��ng ���c. H�y c� g�ng t�m th�m nguy�n li�u nh�!",1,"V�ng! T�i h� s� quay l�i sau khi c� �� nguy�n li�u!!/no");
				return
			end
		end
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] function make_mooncake(nType), parameter nType error, nType = "..nType);
	end
end


function add_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c  "..nItemNum.." c�i "..szItemName);
		WriteLogEx(szLogTrungThuName,"nh�n",nItemNum,szItemName)
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function del_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = DelItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		return 1;
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] delete "..nItemNum.." "..szItemName.." Failed, DelItem("..genre..", "..detail..", "..particular..", "..nItemNum..") return value = "..nRetCode);
		return 0;
	end
end

function pay_ex(nNum)
	local nRetCode = 0;
	nRetCode = Pay(nNum)
	if nRetCode == 1 then
		return 1
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Pay("..nNum..") Failed, return value = "..nRetCode);
		return 0
	end
end

function no()
end

