--File name:	jixiang_npc.lua
--Describe:		����С���npc�ű�
--Create Date:	2008-06-24
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\jixiang_event\\jixiang_head.lua");
Include("\\script\\lib\\globalfunctions.lua")

g_LogTitle = "C�t t��ng th�ch : ".."��i";		--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���

g_tBookList =
{
	[2] = {"Kim Cang Ph�c Ma kinh",0,	107,	1,	1},
	[3] = {"V� Tr�n M�t t�ch",	0,	107,	5,	1},
	[4] = {"Ti�m Long M�t t�ch",	0,	107,	3,	1},
	[6] = {"Thi�n La M�t T�ch",	0,	107,	7,	1},
	[8] = {"Nh� � M�t T�ch",	0,	107,	9,	1},
	[9] = {"B�ch H�i Ph�",	0,	107,	11,	1},
	[11] = {"H�n ��n M�t t�ch",	0,	107,	13,	1},
	[12] = {"Qu� Thi�n M�t t�ch",	0,	107,	15,	1},
	[14] = {"Huy�n �nh M�t t�ch",	0,	107,	17,	1},
	[15] = {"Qu�n T� M�t t�ch",	0,	107,	19,	1},
	[17] = {"Tr�n Qu�n M�t t�ch",	0,	107,	21,	1},
	[18] = {"Xuy�n V�n M�t t�ch",	0,	107,	23,	1},
	[20] = {"U Minh Qu� L�c",	0,	107,	25,	1},
	[21] = {"Linh C� M�t t�ch",	0,	107,	27,	1},
}

g_tItemList =
{
	--		����			G1	G2	G3	����	����ʯ����	����
	[1] = {"Tam Thanh ho�n",		2,	1,	1097,	1,	1,		1},
	[2] = {"B�o r��ng T�ng Ki�m y gi�p",	2,	1,	1060,	1,	10,		1},
	[3] = {"B�o r��ng T�ng Ki�m v� kh�",	2,	1,	1063,	1,	20,		1},
	[4] = {"Phi�u V�",			0,	105,15,		1,	30,		10},
	[5] = {"B�o r��ng T�ng Ki�m trang s�c",	2,	1,	1062,	1,	80,		1},
	[6] = {"Huy hi�u chi�n c�ng (huy ho�ng)",	2,	1,	9977,	1,	100,	1},
	[7] = {"B�o r��ng T�ng Ki�m hoa kh�",	2,	1,	1061,	1,	150,	1},
	[8] = {"B�o r��ng T�ng Ki�m ��u qu�n",	2,	1,	1059,	1,	200,	1},
	[9] = {"Thi�n Th�ch linh th�ch",		2,	1,	1068,	1,	400,	1},
	[10] = {"��u th�nh bi�u",		2,	1,	9978,	1,	500,	1},
}

function main()
	if is_jixiang_event_viet_open() == 0 then
		return
	end
	exchange_talk()
end

function exchange_talk()
	local selTab = {
				"1 C�t T��ng Th�ch = 1 Tam thanh ho�n/#exchange_prize(1)",
				"10 C�t T��ng Th�ch = 1 B�o r��ng t�ng ki�m y gi�p/#exchange_prize(2)",
				"20 C�t T��ng Th�ch = 1 B�o r��ng t�ng ki�m v� kh�/#exchange_prize(3)",
				"30 C�t T��ng Th�ch = 1 ng�a Phi�n V�/#exchange_prize(4)",
				"80 C�t T��ng Th�ch = 1 B�o r��ng t�ng ki�m trang s�c/#exchange_prize(5)",
				"100 C�t T��ng Th�ch = 1 Huy hi�u chi�n c�ng (huy ho�ng)/#exchange_prize(6)",
				"Xem trang sau/exchange_talk_2",
				"K�t th�c ��i tho�i/no",
				}
	Say("<color=green>D� Th�o<color>: ".."T� 01-08-2008 ��n 24:00 10-08-2008, c�c v� ��i hi�p c� th� d�ng C�t T��ng Th�ch �� ��i nh�ng ph�n th��ng d��i ��y, c� mu�n ��i ph�n th��ng b�y gi� hay kh�ng?",getn(selTab),selTab);
end

function exchange_talk_2()
	local selTab = {
				"150 C�t T��ng Th�ch = 1 B�o r��ng t�ng ki�m hoa kh�/#exchange_prize(7)",
				"200 C�t T��ng Th�ch = 1 B�o r��ng t�ng ki�m ��u qu�n/#exchange_prize(8)",
				"400 C�t T��ng Th�ch = 1 Thi�n th�ch linh th�ch/#exchange_prize(9)",
				"500 C�t T��ng Th�ch = 1 ��u th�nh bi�u/#exchange_prize(10)",
				"900 C�t T��ng Th�ch = 1 M�t t�ch m�n ph�i/#exchange_prize(11)",
				"Xem trang tr��c/exchange_talk",
				"K�t th�c ��i tho�i/no",
				}
	Say("<color=green>D� Th�o<color>: ".."T� 01-08-2008 ��n 24:00 10-08-2008, c�c v� ��i hi�p c� th� d�ng C�t T��ng Th�ch �� ��i nh�ng ph�n th��ng d��i ��y, c� mu�n ��i ph�n th��ng b�y gi� hay kh�ng?",getn(selTab),selTab);
end

function exchange_prize(nType)
	if nType == 11 then
		local nRoute = GetPlayerRoute();
		local tRoutes = {0,1,5,7,10,13,16,19};
		local i = 0;
		for i=1,getn(tRoutes) do
			if nRoute == tRoutes[i] then
				Say("<color=green>D� Th�o<color>: Ph�i gia nh�p tr��ng ph�i v� c�ng m�i m�i c� th� ��i S� m�n m�t t�ch.",0);
				return
			end
		end
		give_book_prize(nRoute);
	elseif nType >= 1 and nType <= 10 then

		if GetItemCount(2,1,30015) < g_tItemList[nType][6] then
			Say("<color=green>D� Th�o<color>: C�t t��ng th�ch mang theo kh�ng ��.",1,"Th�t ng�i qu�, �� ta ki�m tra l�i!/no");
			return
		else
			if gf_Judge_Room_Weight( g_tItemList[nType][5], g_tItemList[nType][5] * g_tItemList[nType][7] ) == 0 then
				Talk(1,"","<color=green>D� Th�o<color>: H�y ��m b�o h�nh trang �� ch� tr�ng v� tr�ng l��ng �� tr�nh l�ng ph� kh�ng c�n thi�t.");
				return
			end;
			if DelItem(2,1,30015,g_tItemList[nType][6]) == 1 then
				if nType == 4 then		--����
					add_fanyu(g_tItemList[nType][5], g_tItemList[nType][1]);
				else
					add_item_ex(g_tItemList[nType][1],g_tItemList[nType][2],g_tItemList[nType][3],g_tItemList[nType][4],g_tItemList[nType][5]);
				end
			else
				Say("<color=green>D� Th�o<color>: C�t t��ng th�ch mang theo kh�ng ��.",1,"Th�t ng�i qu�, �� ta ki�m tra l�i!/no");
				return
			end
		end
		
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] function exchange_prize(nType), parameter nType error, nType = "..nType);
	end
end


function add_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	local nItemIdx = 0;
	nRetCode,nItemIdx = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		SetItemExpireTime(nItemIdx,30*24*3600)	
		Msg2Player("B�n nh�n ���c  "..nItemNum.." c�i "..szItemName);
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName);
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function add_item_ex3(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;	
	nRetCode = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c  "..nItemNum.." c�i "..szItemName);
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName);
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function give_book_prize(nType)
	if GetItemCount(2,1,30015) < 900 then
		Say("<color=green>D� Th�o<color>: C�t t��ng th�ch mang theo kh�ng ��.",1,"Th�t ng�i qu�, �� ta ki�m tra l�i!/no");
		return
	else
		if gf_Judge_Room_Weight(1,20) == 0 then
			Talk(1,"","<color=green>D� Th�o<color>: H�y ��m b�o h�nh trang �� ch� tr�ng v� tr�ng l��ng �� tr�nh l�ng ph� kh�ng c�n thi�t.");
			return
		end;
		if DelItem(2,1,30015,900) == 1 then
			add_item_ex3(g_tBookList[nType][1],g_tBookList[nType][2],g_tBookList[nType][3],g_tBookList[nType][4],g_tBookList[nType][5]);
		else
			Say("<color=green>D� Th�o<color>: C�t t��ng th�ch mang theo kh�ng ��.",1,"Th�t ng�i qu�, �� ta ki�m tra l�i!/no");
			return
		end
	end
end

function give_suipian_prize()
	if GetItemCount(2,1,30015) < 900 then
		Say("<color=green>D� Th�o<color>: C�t t��ng th�ch mang theo kh�ng ��.",1,"Th�t ng�i qu�, �� ta ki�m tra l�i!/no");
		return
	else
		if gf_Judge_Room_Weight(1,50) == 0 then
			Talk(1,"","<color=green>D� Th�o<color>: H�y ��m b�o h�nh trang �� ch� tr�ng v� tr�ng l��ng �� tr�nh l�ng ph� kh�ng c�n thi�t.");
			return
		end;
		if DelItem(2,1,30015,900) == 1 then
			add_item_ex("B�n v� ��c t�o th�n kh�",2,1,1086,10);
		else
			Say("<color=green>D� Th�o<color>: C�t t��ng th�ch mang theo kh�ng ��.",1,"Th�t ng�i qu�, �� ta ki�m tra l�i!/no");
			return
		end
	end
end

function add_fanyu(nItemNum,szItemName)
	local nRetCode = 0;
	local nItemIdx = 0;
	nRetCode, nItemIdx = AddItem(0, 105, 15, nItemNum, 1, -1,-1,-1,-1,-1,-1);
	if nRetCode == 1 then
		SetItemExpireTime(nItemIdx,30*24*3600)				
		Msg2Player("B�n nh�n ���c  "..nItemNum.." c�i "..szItemName);
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName);
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function no()
end

