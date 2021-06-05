DebugOutput = nothing;
SP_SWITCH = 1;
-----------------------------

--�ʱ��
--\script\misc\taskmanager.lua
SP_START_TIME = 2014013100;
SP_END_TIME = 2014021500;

SP_CITY_TABLE = {
	[1] = {
		[1] = 200,
		[2] = "Bi�n Kinh",
	},
	[2] = {
		[1] = 150,
		[2] = "D��ng Ch�u",
	},
	[3] = {
		[1] = 500,
		[2] = "Ph�ng T��ng",
	},
	[4] = {
		[1] = 350,
		[2] = "T��ng D��ng",
	},
	[5] = {
		[1] = 300,
		[2] = "Th�nh ��",
	},
	[6] = {
		[1] = 100,
		[2] = "Tuy�n Ch�u",
	},
	[7] = {
		[1] = 400,
		[2] = "��i L�",
	},
}

SP_TARGER_NPC_TABLE = {
	[1] = {
		"D� T�u",
		"Ti�u s�",
		"Kh�u Chu�n",
		"V� L�m S� Gi�",
		"V�n S� Th�ng",
	},
	[2] = {
		"L�u T� Anh",
		"��c s� V� L�m",
		"T� Quang C�c L�o Nh�n",
		"Ch� th��ng h�i",
		"B� mai",
	},
	[3] = {
		"Giang Bi�t H�c",
		"Th�n gi�o H�c T�ng Qu�n",
		"Th�nh N� Nh�m Doanh Doanh",
		"C�n L�n Ph�i V�n Hi H�a",
		"Ph�ng T��ng ph�Th�i th� ",
	},
	[4] = {
		"T� M� T�n Nguy�n",
		"Thi�n C� L�o Nh�n",
		"Th� r�n L�u",
		"C�ng D� binh ",
		"T�ng binh",
	},
	[5] = {
		"Th�nh �� ��i s� c�ng th�nh",
		"Ng� H�nh T�n Gi�",
		"Th�i th�",
		"Ti�u s�",
		"Lien Dau Tiep Dan Quan",
	},
	[6] = {
		"Th�n Du Ch�n Nh�n",
		"Th�n H�nh Th�i B�o ��i T�ng",
		"S� gi� bang ph�i",
		"Th�i th�",
		"#Th��ng Nh�n B�o R��ng",
	},
	[7] = {
		"L� quan",
		"��ng Gi� La",
		"Tr�nh Qu�n Chi",
		"Cao Th�ng Tuy�n",
		"T� Quy�n",
	},
}

SP_NPC_TABLE = {
	[1]	= "Ha ha, �a t� %s �� ��n th�m ta, ch�c ng��i n�m m�i v� c�ng cao c��ng, h�nh t�u giang h� k�t giao nhi�u b�ng h�u!",
	[2]	= "Ch�c M�ng N�m M�i! Nh�n th�y ng��i l� ta vui m�ng l�m l�m! Hy v�ng %s m�t n�m m�i An Khang Th�nh V��ng, Thu�n Bu�m Xu�i Gi�! ",
	[3]	= "Th�t vui qu� �i, �� c� ng��i ��n th�m ta, ch�c m�i vi�c may m�n %s!",
	[4]	= "Ha ha, %s ng��i th�t c� l�ng t�t, n�m m�i ch�c ng��i s� s� thu�n t�m, ��i c�t ��i l�i!",
	[5]	= "Cung Ch�c Ph�t T�i, ch�c %s n�m m�i vui v�, h�nh ph�c an khang!",
}

SP_NIANSHOU_POS = {
	{200, 1381, 2894, "Bi�n Kinh(172,180)"},
	{150, 1687, 3131, "D��ng Ch�u(210,195)"},
	{500, 1743, 3152, "Ph�ng T��ng(218,196)"},
	{350, 1441, 3010, "T��ng D��ng(180,188)"},
	{300, 1764, 3554, "Th�nh ��(220,222)"},
	{100, 1416, 2996, "Tuy�n Ch�u(176,187)"},	
}

SP_NIANSHOU_AI_POS = {
	[200] = {{1380,2906},{1369,2893},{1380,2880},{1393,2893}},
	[150] = {{1686,3144},{1676,3130},{1686,3114},{1699,3130}},
	[500] = {{1743,3164},{1730,3152},{1741,3136},{1754,3152}},
	[350] = {{1440,3022},{1429,3009},{1440,2994},{1453,3009}},
	[300] = {{1763,3565},{1752,3554},{1763,3539},{1776,3553}},
	[100] = {{1416,3007},{1403,2995},{1416,2982},{1428,2995}},
}

SP_NIANSHOU_TALK  = {
	[1] = "Oa oa oa, ta s� nh�t l� ph�o, ��ng ��nh ta n�a, ta t�ng ng��i 1 ��i B�o R��ng, �� ng��i �n T�t, ng��i xem ta d� th��ng kh�ng ch�!",
	[2] = "He he he, Xu�n ��n r�i, h�m nay ta c�m th�y th�t vui v�, ng��i ��nh ta ta v�n vui nh� th��ng, t�ng ng��i 1 B�o R��ng!",
	[3] = "A a a, xin ��i hi�p tha m�ng, t�ng ng��i 1 ��i B�o R��ng, ta d� th��ng nh� th� n�y hay l� th� ta ra �i, ch�c ng��i N�m M�i Vui V�!",
	[4] = "L� l� la, N�m m�i vui v� nh�, ��i hi�p th�t l� may m�n, ta gi�u b�o r��ng k� nh� th�, ng��i v�n t�m ra ���c, th�t ��ng m�t anh h�ng h�o ki�t!",
	[5] = "Ha ha ha, Cung ch�c ph�t t�i, ng��i th�t l� ��p m�, t�ng ng��i 1 b�o r��ng, �� ng��i ng�y n�o c�ng vui t��i, ng�y ng�y ng��i ��n ��y t�m ch�i v�i ta ch�?",
}

SP_NIANSHOU_EXTALK = {
	[1] = "Hi hi hi, ��i hi�p ng��i th�ch ch�i v�i ta ��n th� sao, gi� ta m�t l�m r�i, ta �i ng� ��y, ng�y mai l�i ��n ��y ch�i v�i ta nh�!",
	[2] = "Oa oa oa, c�u ch� nh�, ta �� ��a b�o r��ng cho ng��i r�i, ��ng ��nh ta n�a, ng�y mai l�i ��n ��y t�m ta vui ch�i ti�p nh�!",
	[3] = "Ha ha ha, ta th�t vui qu� �i, c� nhi�u ng��i ��n ch�i v�i ta qu�, t�ng qu� nhi�u b�o r��ng cho h� r�i, th�t ��ng ti�c b�y gi� kh�ng c� b�o r��ng t�ng ng��i r�i, ng�y mai l�i ��n ��y t�m ta nh�!",	
}
