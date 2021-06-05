--File name:	feifei_girl.lua
--Describe:		�Ʒƹ���npc�ű�
--Create Date:	2008-09-26
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\october_event_08\\oct_event_head.lua");
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Ho�t ��ng th�ng 10 : ".."Phi Phi C� N��ng"						--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_szInfoHead = "<color=green>".."Phi Phi C� N��ng".."<color>: "

g_tbItem = 
{
	--		����				G1	G2		G3		����	ʱ������	С��������
	[1] = {" Tam Thanh ho�n",				2,	1,		1097,	1,		30,		1},
	[2] = {" H�c Ng�c �o�n T�c Cao (ti�u)",		2,	1,		489,	1,		30,		1},
	[3] = {" V�n V�t Quy Nguy�n ��n (ti�u)",		2,	1,		495,	1,		30,		1},
	[4] = {" Sinh Sinh H�a T�n (ti�u)",		2,	1,		483,	1,		30,		1},
	[5] = {" Qu�n C�ng b�i",				2,	1,		9997,	1,		7,		1},
	[6] = {" Thi�n H� M�t t�ch",				0,	107,	64,		1,		-1,		2},
	[7] = {" T� H� M�t t�ch",				0,	107,	65,		1,		-1,		4},
	[8] = {" Th�n h�nh b�o �i�n",				0,	200,	40,		1,		30,		5},
	[9] = {" Ph�o hoa ��a tin",				2,	1,		203,	1,		30,		5},
	[10] = {" L�c L�m Lang Y�n",			2,	1,		1014,	1,		30,		6},
	[11] = {" Th�y Ho�ng B� Chi�u",			2,	1,		1047,	1,		30,		6},
	[12] = {" Uy�n ��ng Kim Ti B�c",			2,	1,		1048,	1,		30,		6},
	[13] = {" Chi�m Y Ph�",				0,	107,	66,		1,		-1,		8},
	[14] = {" C�i Th� Anh H�o",	2,	1,		1042,	1,		30,		10},
	[15] = {" ��u th�nh bi�u",				2,	1,		9978,	1,		7,		10},
	[16] = {" Huy hi�u chi�n c�ng (huy ho�ng)",			2,	1,		9977,	1,		7,		10},
	[17] = {" Phong l�nh-cao c�p",		2,	1,		1018,	1,		30,		12},
	[18] = {" S� tay s�ng",			2,	19,		1,		1,		7,		20},
	[19] = {" Chi�n Th�n ho�n",				2,	1,		1005,	1,		7,		25},
	[20] = {" Thi�n Th�ch linh th�ch",			2,	1,		1068,	1,		7,		400},
	[21] = {" B�n v� ��c t�o th�n kh�",		2,	1,		1086,	10,		-1,		450},
	[22] = {" Kim Cang Ph�c Ma kinh",			0,	107,	1,		1,		-1,		500},
	[23] = {" Ti�m Long M�t t�ch",			0,	107,	3,		1,		-1,		500},
	[24] = {" V� Tr�n M�t t�ch",			0,	107,	5,		1,		-1,		500},
	[25] = {" Thi�n La M�t T�ch",			0,	107,	7,		1,		-1,		500},
	[26] = {" Nh� � M�t T�ch",			0,	107,	9,		1,		-1,		500},
	[27] = {" B�ch H�i Ph�",				0,	107,	11,		1,		-1,		500},
	[28] = {" H�n ��n M�t t�ch",			0,	107,	13,		1,		-1,		500},
	[29] = {" Qu� Thi�n M�t t�ch",			0,	107,	15,		1,		-1,		500},
	[30] = {" Huy�n �nh M�t t�ch",			0,	107,	17,		1,		-1,		500},
	[31] = {" Qu�n T� M�t t�ch",			0,	107,	19,		1,		-1,		500},
	[32] = {" Tr�n Qu�n M�t t�ch",			0,	107,	21,		1,		-1,		500},
	[33] = {" Xuy�n V�n M�t t�ch",			0,	107,	23,		1,		-1,		500},
	[34] = {" U Minh Qu� L�c",			0,	107,	25,		1,		-1,		500},
	[35] = {" Linh C� M�t t�ch",			0,	107,	27,		1,		-1,		500},
}

g_tbOption = {}

function main()
	if is_oct_event_viet_open() == 0 then
		return
	end

	local i = 0
	local nTableSize = getn(g_tbItem)
	for i = 1, nTableSize do
		g_tbOption[i] = g_tbItem[i][7].." Ti�u Nh� �".." = "..g_tbItem[i][5]..g_tbItem[i][1]..format("/#exchange_prize(%d)", i)
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
	Say(g_szInfoHead.."T� 10-10-2008 ��n 24:00 20-10-2008. C�c v� l�m nh�n s� s� d�ng v�t ph�m Ti�u Nh� � �� ��i nh�ng v�t ph�m sau ��y:",getn(selTab),selTab);
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
	Say(g_szInfoHead.."T� 10-10-2008 ��n 24:00 20-10-2008. C�c v� l�m nh�n s� s� d�ng v�t ph�m Ti�u Nh� � �� ��i nh�ng v�t ph�m sau ��y:",getn(selTab),selTab);
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
	Say(g_szInfoHead.."T� 10-10-2008 ��n 24:00 20-10-2008. C�c v� l�m nh�n s� s� d�ng v�t ph�m Ti�u Nh� � �� ��i nh�ng v�t ph�m sau ��y:",getn(selTab),selTab);
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
	Say(g_szInfoHead.."T� 10-10-2008 ��n 24:00 20-10-2008. C�c v� l�m nh�n s� s� d�ng v�t ph�m Ti�u Nh� � �� ��i nh�ng v�t ph�m sau ��y:",getn(selTab),selTab);
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
	Say(g_szInfoHead.."T� 10-10-2008 ��n 24:00 20-10-2008. C�c v� l�m nh�n s� s� d�ng v�t ph�m Ti�u Nh� � �� ��i nh�ng v�t ph�m sau ��y:",getn(selTab),selTab);
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
	Say(g_szInfoHead.."T� 10-10-2008 ��n 24:00 20-10-2008. C�c v� l�m nh�n s� s� d�ng v�t ph�m Ti�u Nh� � �� ��i nh�ng v�t ph�m sau ��y:",getn(selTab),selTab);
end

function exchange_talk_7()
	local selTab = {
				g_tbOption[32],
				g_tbOption[33],
				g_tbOption[34],
				g_tbOption[35],
				"Xem trang tr��c/exchange_talk_6",				
				"K�t th�c ��i tho�i/no",
				}
	Say(g_szInfoHead.."T� 10-10-2008 ��n 24:00 20-10-2008. C�c v� l�m nh�n s� s� d�ng v�t ph�m Ti�u Nh� � �� ��i nh�ng v�t ph�m sau ��y:",getn(selTab),selTab);
end

function exchange_prize(nType)
	local nTableSize = getn(g_tbItem)
	if nType >= 1 and nType <= nTableSize then
		if GetItemCount(2, 1, 30030) < g_tbItem[nType][7] then
			Say(g_szInfoHead.."��i hi�p mang kh�ng �� Ti�u Nh� �!",1,"V�ng! T�i h� s� quay l�i sau khi c� �� nguy�n li�u!/no");
			return
		else
			if gf_Judge_Room_Weight(1, 120) == 0 then
				Talk(1,"",g_szInfoHead.."Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!");
				return
			end;
			if DelItem(2, 1, 30030, g_tbItem[nType][7]) == 1 then
				add_item_ex(g_tbItem[nType]);
			else
				Say(g_szInfoHead.."��i hi�p mang kh�ng �� Ti�u Nh� �!",1,"V�ng! T�i h� s� quay l�i sau khi c� �� nguy�n li�u!/no");
				return
			end
		end
		
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] function exchange_prize(nType), parameter nType error, nType = "..nType);
	end
end

function add_item_ex(tItem)
	local nRetCode,nItemIdx = AddItem(tItem[2],tItem[3],tItem[4],tItem[5]);
	if nRetCode == 1 then
		if tItem[6] > 0 then
			SetItemExpireTime(nItemIdx, tItem[6]*24*3600)
		end
		Msg2Player("B�n nh�n ���c  "..tItem[5].." c�i "..tItem[1]);
		WriteLogEx("Hoat Dong Thang 10","Phi Phi C� N��ng",tItem[5],tItem[1])		
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..tItem[5].." c�i "..tItem[1].." Failed, return value = "..nRetCode);
	end
end


function no()
end
