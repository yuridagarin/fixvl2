--File name:	uncle_qin.lua
--Describe:		�����ش���npc�ļ�
--Create Date:	2008-08-22
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Ho�t ��ng trung thu : ".."T�n ��i Th�c"		--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_szInfoHead = "<color=green>T�n ��i th�c<color>: "


g_tbItem = 
{
	--		����		G1	G2	G3		����
	[1] = {" ��c Phong th�ch",	2,	1,	176,	8	},
	[2] = {" Gi�p x�c phi�n",	2,	1,	177,	8	},
	[3] = {" Kh� S�n ch�",2,	1,	98,	8	},
	[4] = {" V� s� y�u ��i",	2,	1,	174,	8	},
	[5] = {" �m d��ng k�nh",	2,	1,	294,	8	},
	[6] = {" Nh�m M�c B�i",	2,	1,	83,		8	},
	[7] = {" V� s� �ao",	2,	1,	173,	8	},
	[8] = {" ��i Cang �ao",	2,	1,	295,	6	},
	[9] = {" R�ng Tinh Tinh",	2,	1,	296,	6	},
	[10] = {" V�y K� L�n",	2,	1,	106,	6	},
	[11] = {" Ph� �n",		2,	1,	302,	6	},
	[12] = {" Thu�c n�",	2,	1,	298,	6	},
	[13] = {" H�a �nh Th�n �ao",	2,	1,	178,	6	},
	[14] = {" G�ng tay",	2,	1,	303,	6	},
	[15] = {" T�n ki�m",		2,	1,	299,	6	},
	[16] = {" Linh T�n",		2,	1,	185,	6	},
	[17] = {" �� La tr��ng",	2,	1,	305,	6	},
	[18] = {" Linh C�m",		2,	1,	186,	6	},
	[19] = {" Ph�t Kinh",		2,	1,	304,	6	},
	[20] = {" Linh ��ch",		2,	1,	187,	6	},
}

g_tbOption = {}

function main()
	if is_mooncake_viet_open() == 0 then
		return
	end
	exchange_confirm()
end

function exchange_confirm()
	local selTab = {
				"T�i h� mu�n ��i v�t ph�m thu th�p l�y t�i nguy�n li�u/exchange_talk",
				"Ta ch� ��n xem th�/no",
				}
	Say(g_szInfoHead.."T� 05-09-2008 ��n 24:00 ng�y 05-10-2008, ng��i ch�i c� th� ��nh qu�i �� thu th�p nguy�n li�u l�m b�nh trung thu (xem chi ti�t tr�n trang ch�).",getn(selTab),selTab);
end

function exchange_talk()
	if GetLevel() < 60 then
		Say(g_szInfoHead.."��ng c�p kh�ng �� �� ��i nguy�n li�u.", 0)
		return
	end
	local i = 0
	local nTableSize = getn(g_tbItem)
	for i = 1, nTableSize do
		g_tbOption[i] = g_tbItem[i][5]..g_tbItem[i][1].." = 1 "..format("Bao nguy�n li�u/#exchange_prize(%d)", i)
	end
	local selTab = {
				g_tbOption[1],
				g_tbOption[2],
				g_tbOption[3],
				g_tbOption[4],
				g_tbOption[5],
				g_tbOption[6],
				"Xem trang sau/exchange_talk_2",
				"K�t th�c ��i tho�i/no",
				}
	Say(g_szInfoHead.."T� 05-09-2008 ��n 24:00 ng�y 05-10-2008, ng��i ch�i c� th� ��nh qu�i �� thu th�p nguy�n li�u l�m b�nh trung thu (xem chi ti�t tr�n trang ch�).",getn(selTab),selTab);
end

function exchange_talk_2()
	local selTab = {
				g_tbOption[7],
				g_tbOption[8],
				g_tbOption[9],
				g_tbOption[10],
				g_tbOption[11],
				"Xem trang tr��c/exchange_talk",
				"Xem trang sau/exchange_talk_3",
				"K�t th�c ��i tho�i/no",
				}
	Say(g_szInfoHead.."T� 05-09-2008 ��n 24:00 ng�y 05-10-2008, ng��i ch�i c� th� ��nh qu�i �� thu th�p nguy�n li�u l�m b�nh trung thu (xem chi ti�t tr�n trang ch�).",getn(selTab),selTab);
end

function exchange_talk_3()
	local selTab = {
				g_tbOption[12],
				g_tbOption[13],
				g_tbOption[14],
				g_tbOption[15],
				g_tbOption[16],
				"Xem trang tr��c/exchange_talk_2",
				"Xem trang sau/exchange_talk_4",
				"K�t th�c ��i tho�i/no",
				}
	Say(g_szInfoHead.."T� 05-09-2008 ��n 24:00 ng�y 05-10-2008, ng��i ch�i c� th� ��nh qu�i �� thu th�p nguy�n li�u l�m b�nh trung thu (xem chi ti�t tr�n trang ch�).",getn(selTab),selTab);
end

function exchange_talk_4()
	local selTab = {
				g_tbOption[17],
				g_tbOption[18],
				g_tbOption[19],
				g_tbOption[20],
				"Xem trang tr��c/exchange_talk_3",
				"K�t th�c ��i tho�i/no",
				}
	Say(g_szInfoHead.."T� 05-09-2008 ��n 24:00 ng�y 05-10-2008, ng��i ch�i c� th� ��nh qu�i �� thu th�p nguy�n li�u l�m b�nh trung thu (xem chi ti�t tr�n trang ch�).",getn(selTab),selTab);
end

function exchange_prize(nType)
	local nTableSize = getn(g_tbItem)
	if nType >= 1 and nType <= nTableSize then
		if GetItemCount(g_tbItem[nType][2],g_tbItem[nType][3],g_tbItem[nType][4]) < g_tbItem[nType][5] then
			Say(g_szInfoHead.."V�t ph�m "..g_tbItem[nType][1].." h�nh nh� kh�ng �� ",1,"Th�t ng�i qu�, �� ta ki�m tra l�i!/no");
			return
		else
			if gf_Judge_Room_Weight(1, 20) == 0 then
				Talk(1,"",g_szInfoHead.."Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!");
				return
			end;
			if DelItem(g_tbItem[nType][2],g_tbItem[nType][3],g_tbItem[nType][4],g_tbItem[nType][5]) == 1 then
				add_item_ex("Bao nguy�n li�u",2,1,30016,1);
			else
				Say(g_szInfoHead.."Th�i gian s� d�ng"..g_tbItem[nType][1].."  H�nh nh� kh�ng �� ",1,"Th�t ng�i qu�, �� ta ki�m tra l�i!/no");
				return
			end
		end
		
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] function exchange_prize(nType), parameter nType error, nType = "..nType);
	end
end


function add_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c  "..nItemNum.." c�i "..szItemName);
		WriteLogEx(szLogTrungThuName,"��i nguy�n li�u",nItemNum,szItemName)
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function no()
end

