--File name:	xmas_npc.lua
--Describe:		���󴫽�ʿnpc�ļ�
--Create Date:	2008-11-18
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\xmas_08\\xmas_func.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Giang Sinh 2008"				--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_szInfoHead = "<color=green>".."Gi�o s�".."<color>: "

g_szFileName = "xmas_npc.lua"			--�ļ���


g_tbItem = 
{
	--		����					G1	G2		G3	����	�����������	��Ʒ����
	[1] = {"S� m�n l�nh th�",				2,	1,	1016,	1,		3,			30,	},
	[2] = {"H�c Ng�c �o�n T�c Cao",			1,	0,	6,		30,		5,			-1,	},
	[3] = {"Sinh Sinh H�a T�n",			1,	0,	16,		30,		5,			-1,	},
	[4] = {"V�n V�t Quy Nguy�n ��n",			1,	0,	11,		30,		5,			-1,	},
	[5] = {"Th�t C�p Gi�m ��nh ph�-bao nh�",		2,	1,	1057,	1,		5,			30,	},
	[6] = {"M�nh m�t t�ch th�t l�c",		2,	1,	1088,	10,		10,			-1,	},
	[7] = {"V�ng Th�i H� B�t Qu�i - Ly",			2,	1,	473,	1,		10,			-1,	},
	[8] = {"B�ch C�u Ti�n ��n",				2,	1,	1008,	1,		10,			30,	},
	[9] = {"V�ng Th�i H� B�t Qu�i - C�n",			2,	1,	475,	1,		20,			-1,	},
	[10] = {"S� tay ch� t�o v� kh�",	2,	0,	397,	1,		20,			-1,	},
	[11] = {"Qu�n C�ng b�i",				2,	1,	9997,	1,		20,			30,	},
	[12] = {"��ng V�",					0,	105,20,		1,		30,			30,	},
	[13] = {"Qu�n d�ng-thu th�p th�",			2,	1,	1028,	1,		30,			30,	},
	[14] = {"Qu�n C�ng ��i",				2,	1,	9998,	1,		30,			7,	},
	[15] = {"T�y T�y ��n",				2,	0,	136,	1,		30,			30,	},
	[16] = {"S� m�n ��i s� h�m",			2,	1,	1021,	1,		30,			30,	},
	[17] = {"Ng� d�ng b�ch ng�c th�ch",			2,	1,	1024,	1,		60,			30,	},
	[18] = {"Qu�n C�ng Huy Ho�ng",			2,	1,	9977,	1,		150,		7,	},
	[19] = {"K� L�n ho�n",				2,	1,	1003,	1,		300,		7,	},
	[20] = {"T�y T�y linh ��n",				2,	0,	137,	1,		600,		30,	},	
	[21] = {"Kim Chung Tr�o quy�t",			2,	6,	5,		1,		1200,		-1,	},
	[22] = {"��t Ma V� quy�t",			2,	6,	10,		1,		1200,		-1,	},
	[23] = {"Hu� Nh�n quy�t",			2,	6,	14,		1,		1200,		-1,	},
	[24] = {"Long Tr�o Th� quy�t",		2,	6,	20,		1,		1200,		-1,	},
	[25] = {"S� T� H�ng",			2,	6,	29,		1,		1200,		-1,	},
	[26] = {"Kim Cang Ch� quy�t",		2,	6,	31,		1,		1200,		-1,	},
	[27] = {"M�n Thi�n V� quy�t",			2,	6,	46,		1,		1200,		-1,	},
	[28] = {"Thanh Ph�n quy�t",			2,	6,	53,		1,		1200,		-1,	},
	[29] = {"��i Bi quy�t",		2,	6,	59,		1,		1200,		-1,	},
	[30] = {"Ph�c Th�y ph�p",			2,	6,	67,		1,		1200,		-1,	},
	[31] = {"M� T�m Kh�c quy�t",		2,	6,	70,		1,		1200,		-1,	},
	[32] = {"T�y �i�p",				2,	6,	78,		1,		1200,		-1,	},
	[33] = {"T�y Quy�n",				2,	6,	79,		1,		1200,		-1,	},
	[34] = {"N� Thu quy�t",			2,	6,	83,		1,		1200,		-1,	},
	[35] = {"�� C�u quy�t",			2,	6,	88,		1,		1200,		-1,	},
	[36] = {"T�ch D��ng Ki�m quy�t",			2,	6,	99,		1,		1200,		-1,	},
	[37] = {"Th�t Ti�t Ki�m quy�t",		2,	6,	108,	1,		1200,		-1,	},
	[38] = {"Thi�u D��ng Quy�t",			2,	6,	114,	1,		1200,		-1,	},
	[39] = {"Th��ng Thanh C�ng quy�t",		2,	6,	119,	1,		1200,		-1,	},
	[40] = {"Ng� M� quy�t",		2,	6,	129,	1,		1200,		-1,	},
	[41] = {"B�ch Th��ng quy�t",		2,	6,	130,	1,		1200,		-1,	},
	[42] = {"To�i Ti�n quy�t",		2,	6,	138,	1,		1200,		-1,	},
	[43] = {"L�u Tuy�t Ti�n quy�t",		2,	6,	141,	1,		1200,		-1,	},
	[44] = {"B� ki�p Th�i Thi T� Kh�",			2,	6,	151,	1,		1200,		-1,	},
	[45] = {"B� ki�p Thi Li�t Ma C�ng",			2,	6,	154,	1,		1200,		-1,	},
	[46] = {"B� ki�p T�m C�",				2,	6,	168,	1,		1200,		-1,	},
	[47] = {"B� ki�p Huy�n C�",				2,	6,	167,	1,		1200,		-1,	},
	[48] = {"B�n v� ��c t�o th�n kh�",			2,	1,	1086,	10,		1200,		-1,	},
	[49] = {"Thi�n Th�ch linh th�ch",				2,	1,	1068,	1,		1500,		7,	},
}

g_tbOption = {}

function main()
	if is_xmas_08_viet_open() == 0 then
		Say(g_szInfoHead.."Gi�ng Sinh vui v� !", 0)
		return
	end
	
	local nMapID = GetWorldPos()
	if nMapID ~= 200 then
		Say(g_szInfoHead.."Gi�ng Sinh vui v� !", 0)
		return
	end

	local i = 0
	local nTableSize = getn(g_tbItem)
	for i = 1, nTableSize do
		g_tbOption[i] = g_tbItem[i][6].." H�p Qu� May M�n".." = "..g_tbItem[i][5]..g_tbItem[i][1]..format("/#exchange_prize(%d)", i)
	end

	exchange_talk()
end

function exchange_talk()
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
	Say(g_szInfoHead.."S� d�ng H�p Qu� May M�n ��i ���c nh�ng ph�n qu� nh� sau:",getn(selTab),selTab);
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
	Say(g_szInfoHead.."S� d�ng H�p Qu� May M�n ��i ���c nh�ng ph�n qu� nh� sau:",getn(selTab),selTab);
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
	Say(g_szInfoHead.."S� d�ng H�p Qu� May M�n ��i ���c nh�ng ph�n qu� nh� sau:",getn(selTab),selTab);
end

function exchange_talk_4()
	local selTab = {
				g_tbOption[17],
				g_tbOption[18],
				g_tbOption[19],
				g_tbOption[20],
				g_tbOption[21],
				"Xem trang tr��c/exchange_talk_3",
				"Xem trang sau/exchange_talk_5",
				"K�t th�c ��i tho�i/no",
				}
	Say(g_szInfoHead.."S� d�ng H�p Qu� May M�n ��i ���c nh�ng ph�n qu� nh� sau:",getn(selTab),selTab);
end

function exchange_talk_5()
	local selTab = {
				g_tbOption[22],
				g_tbOption[23],
				g_tbOption[24],
				g_tbOption[25],
				g_tbOption[26],
				"Xem trang tr��c/exchange_talk_4",
				"Xem trang sau/exchange_talk_6",
				"K�t th�c ��i tho�i/no",
				}
	Say(g_szInfoHead.."S� d�ng H�p Qu� May M�n ��i ���c nh�ng ph�n qu� nh� sau:",getn(selTab),selTab);
end

function exchange_talk_6()
	local selTab = {
				g_tbOption[27],
				g_tbOption[28],
				g_tbOption[29],
				g_tbOption[30],
				g_tbOption[31],
				"Xem trang tr��c/exchange_talk_5",
				"Xem trang sau/exchange_talk_7",
				"K�t th�c ��i tho�i/no",
				}
	Say(g_szInfoHead.."S� d�ng H�p Qu� May M�n ��i ���c nh�ng ph�n qu� nh� sau:",getn(selTab),selTab);
end

function exchange_talk_7()
	local selTab = {
				g_tbOption[32],
				g_tbOption[33],
				g_tbOption[34],
				g_tbOption[35],
				g_tbOption[36],
				"Xem trang tr��c/exchange_talk_6",
				"Xem trang sau/exchange_talk_8",
				"K�t th�c ��i tho�i/no",
				}
	Say(g_szInfoHead.."S� d�ng H�p Qu� May M�n ��i ���c nh�ng ph�n qu� nh� sau:",getn(selTab),selTab);
end

function exchange_talk_8()
	local selTab = {
				g_tbOption[37],
				g_tbOption[38],
				g_tbOption[39],
				g_tbOption[40],
				g_tbOption[41],
				"Xem trang tr��c/exchange_talk_7",
				"Xem trang sau/exchange_talk_9",
				"K�t th�c ��i tho�i/no",
				}
	Say(g_szInfoHead.."S� d�ng H�p Qu� May M�n ��i ���c nh�ng ph�n qu� nh� sau:",getn(selTab),selTab);
end

function exchange_talk_9()
	local selTab = {
				g_tbOption[42],
				g_tbOption[43],
				g_tbOption[44],
				g_tbOption[45],
				g_tbOption[46],
				"Xem trang tr��c/exchange_talk_8",
				"Xem trang sau/exchange_talk_10",
				"K�t th�c ��i tho�i/no",
				}
	Say(g_szInfoHead.."S� d�ng H�p Qu� May M�n ��i ���c nh�ng ph�n qu� nh� sau:",getn(selTab),selTab);
end

function exchange_talk_10()
	local selTab = {
				g_tbOption[47],
				g_tbOption[48],
				g_tbOption[49],
				"Xem trang tr��c/exchange_talk_9",
				"K�t th�c ��i tho�i/no",
				}
	Say(g_szInfoHead.."S� d�ng H�p Qu� May M�n ��i ���c nh�ng ph�n qu� nh� sau:",getn(selTab),selTab);
end

function exchange_prize(nType)
	local nTableSize = getn(g_tbItem)
	if nType >= 1 and nType <= nTableSize then
		if GetItemCount(2, 1, 30038) < g_tbItem[nType][6] then
			Say(g_szInfoHead.."C�c h� v�n ch�a �� H�p Qu� May M�n �� ��i th�nh t�ng ph�m",1,"V�ng! T�i h� s� quay l�i sau khi c� �� nguy�n li�u!/no");
			return
		else
			if gf_Judge_Room_Weight(1, 120) == 0 then
				Talk(1,"",g_szInfoHead.."Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!");
				return
			end;
			if DelItem(2, 1, 30038, g_tbItem[nType][6]) == 1 then
				add_item_ex(g_tbItem[nType]);
			else
				Say(g_szInfoHead.."C�c h� v�n ch�a �� H�p Qu� May M�n �� ��i th�nh t�ng ph�m",1,"V�ng! T�i h� s� quay l�i sau khi c� �� nguy�n li�u!/no");
				return
			end
		end
		
	else
		WriteLogEx(g_szLogTitle, "NULL", "NULL", "NULL", "NULL", GetTongName(), "function exchange_prize(nType) in file "..g_szFileName..", parameter nType error, nType = "..nType)
	end
end

function add_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode, nItemIdx = 0, 0

	if G == 0 and D == 105 then
		nRetCode,nItemIdx = AddItem(G, D, P, nItemNum, 1, -1, -1, -1, -1, -1, -1)
	else
		nRetCode,nItemIdx = AddItem(G, D, P, nItemNum)
	end
	if nRetCode == 1 then
		if tItem[7] > 0 then
			SetItemExpireTime(nItemIdx, tItem[7]*24*3600)
		end
		Msg2Player("B�n nh�n ���c  "..nItemNum.." c�i "..szItemName)
		WriteLogEx(g_szLogTitle, "Gi�o s�", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "Gi�o s�", "", "", "", "", "Thu ���c th�t b�i, ".."AddItem return value = "..nRetCode)
	end
end

function no()
end

