--����װ����������
--ע�⣺�˴���д����ֻ�������޸ģ���Ϊ��ҿ����Ѿ������˸����Ե�װ����
--˵����1�����ࣨװ�����඼Ϊ0ʡ�ԣ���2��С�࣬3�Ƿ������( ������Ϊ1ʡ�ԣ�0δ���� ��1�Ѽ����� 2ʰȡ�� ��3װ���󶨣� 4�Ѿ���)��4-9��1-3��ħ�����Ժ͵ȼ���10�����У�����11������
Include("\\script\\lib\\writelog.lua")
strLogCaption = "Nhiem vu Bang hoi"
prize_att = {}
for i = 1,7 do
	prize_att[i] = {}
end
prize_att[1] = {
-----------1--------------2-------------3--------4------------5--------6------------7-------8------9-----10--------------11
	{102,	10, 	4,	357,	4,	358,	4,	0,	0,	0,	"M�t Ng�c Ng�c B�i (nam)"},
	{102,	10, 	4,	357,	4,	361,	4,	0, 	0,	0,	"M�t Ng�c Ng�c B�i (nam)"},
	{102,	5,  	4,	357,	4,	358,	4,	0,  0,	0,	"Long Di�n H��ng Nang (n�)"},
	{102,	5,  	4,	357,	4,	361,	4,	0,  0,	0,	"Long Di�n H��ng Nang (n�)"},
	{100,	14, 	4,	333,	4,	340,	5,	341,5,	0,	"X�ch Long B�o (nam ti�u chu�n)"},
	{100,	32, 	4,	333,	4,	340,	5,	341,5,	0,	"L�i Ng�n Gi�p (nam kh�i ng�)"},
	{100,	50, 	4,	333,	4,	340,	5,	341,5,	0,	"H� C� V� Y (n� g�i c�m)"},
	{100,	68, 	4,	333,	4,	340,	5,	341,5,	0,	"Th�i Hoa Th��ng (Ki�u n�)"},
	{0,  	12, 	4,	333,	4,	65, 	6,	43,	7,	0,	"Ng� Ph��ng Qu� Ch�ng (bao tay)"},
	{1,  	51, 	4,	333,	4,	65, 	6,	43,	7,	0,	"Th�t S�t Thi�n La (�m kh�)"},
	{4,  	117,	4,	333,	4,	65, 	6,	43,	7,	0,	"Xi Nha (cung)"},
}
prize_att[2] = {
-----------1--------------2-------------3--------4------------5--------6------------7-------8------9-----10--------------11
	{102,	10,		4,	360,	4,	361,	4,	0,	0,	0,	"M�t Ng�c Ng�c B�i (nam)"},
	{102,	10,		4,	358,	4,	361,	4,	0,	0,	0,	"M�t Ng�c Ng�c B�i (nam)"},
	{102,	5,		4,	357,	4,	358,	4,	0,	0,	0,	"Long Di�n H��ng Nang (n�)"},
	{102,	5,		4,	357,	4,	361,	4,	0,	0,	0,	"Long Di�n H��ng Nang (n�)"},
	{101,	14,		4,	333,	4,	340,	5,	341,5,	0,	"Phi Ng� Trang (nam ti�u chu�n)"},
	{101,	32,		4,	333,	4,	340,	5,	341,5,	0,	"Thi�n L�i Trang (nam kh�i ng�)"},
	{101,	50,		4,	333,	4,	340,	5,	341,5,	0,	"Thi�n M� (n� g�i c�m)"},
	{101,	68,		4,	333,	4,	340,	5,	341,5,	0,	"Th�n N� (Ki�u n�)"},
	{0,		12,		4,	333,	4,	67,		6,	43,	7,	0,	"Ng� Ph��ng Qu� Ch�ng (bao tay)"},
	{3,		62,		4,	333,	4,	65,		6,	43,	7,	0,	"Thi�n S�t (�ao)"},
	{11,	10,		4,	333,	4,	65,		6,	43,	7,	0,	"Ng�ng S��ng (tr�o)"},
}
prize_att[3] = {
-----------1--------------2-------------3--------4------------5--------6------------7-------8------9-----10--------------11
	{102,	10,		4,	358,	4,	359,	4,	0,	0,	0,	"M�t Ng�c Ng�c B�i (nam)"},
	{102,	10,		4,	358,	4,	360,	4,	0,	0,	0,	"M�t Ng�c Ng�c B�i (nam)"},
	{102,	10,		4,	357,	4,	359,	4,	0,	0,	0,	"M�t Ng�c Ng�c B�i (nam)"},
	{102,	5,		4,	358,	4,	359,	4,	0,	0,	0,	"Long Di�n H��ng Nang (n�)"},
	{102,	5,		4,	358,	4,	360,	4,	0,	0,	0,	"Long Di�n H��ng Nang (n�)"},
	{102,	5,		4,	357,	4,	359,	4,	0,	0,	0,	"Long Di�n H��ng Nang (n�)"},
	{103,	14,		4,	333,	4,	340,	5,	341,5,	0,	"X�ch Thanh Nh�n Tr�o (nam ti�u chu�n)"},
	{103,	32,		4,	333,	4,	340,	5,	341,5,	0,	"Ng� Qu� ��u C�n (nam kh�i ng�)"},
	{103,	50,		4,	333,	4,	340,	5,	341,5,	0,	"�o�t H�n (n� g�i c�m)"},
	{103,	68,		4,	333,	4,	340,	5,	341,5,	0,	"Thi�n Nga (Ki�u n�)"},
	{5,		38,		4,	333,	4,	65,		6,	43,	7,	0,	"Thi�n X� c�n (c�n)"},
	{10,	73,		4,	333,	4,	67,		6,	43,	7,	0,	"L�c Kh�i (c�m)"},
	{9,		84,		4,	333,	4,	65,		6,	43,	7,	0,	"Ph� Qu�n (b�t)"},
}
prize_att[4] = {
-----------1--------------2-------------3--------4------------5--------6------------7-------8------9-----10--------------11
	{102,	10,		4,	359,	4,	360,	4,	0,	0,	0,	"M�t Ng�c Ng�c B�i (nam)"},
	{102,	10,		4,	359,	4,	361,	4,	0,	0,	0,	"M�t Ng�c Ng�c B�i (nam)"},
	{102,	10,		4,	357,	4,	360,	4,	0,	0,	0,	"M�t Ng�c Ng�c B�i (nam)"},
	{102,	5,		4,	359,	4,	360,	4,	0,	0,	0,	"Long Di�n H��ng Nang (n�)"},
	{102,	5,		4,	359,	4,	361,	4,	0,	0,	0,	"Long Di�n H��ng Nang (n�)"},
	{102,	5,		4,	357,	4,	360,	4,	0,	0,	0,	"Long Di�n H��ng Nang (n�)"},
	{102,	8,		4,	333,	4,	340,	5,	341,5,	0,	"��o Hoa Ng�c B�i (nam)"},
	{102,	3,		4,	333,	4,	340,	5,	341,5,	0,	"Tr�m ��n H��ng Nang (n�)"},
	{2,		25,		4,	333,	4,	67,		6,	43,	7,	0,	"B�ch Huy�t (ki�m)"},
	{8,		95,		4,	333,	4,	67,		6,	43,	7,	0,	"��i B�t Nh� tr��ng (tr��ng)"},
	{6,		106,	4,	333,	4,	65,		6,	43,	7,	0,	"Tr��ng B�t X� m�u (th��ng)"},
	{7,		10,		4,	333,	4,	65,		6,	43,	7,	0,	"T�i Nguy�t (song �ao)"},
}
--����װ��:1�����ࣨװ�����඼Ϊ0ʡ�ԣ���2��С�࣬3�Ƿ������( ������Ϊ1ʡ�ԣ�0δ���� ��1�Ѽ����� 2ʰȡ�� ��3װ���󶨣� 4�Ѿ���)��4���������ԣ�5������
prize_att[5] = {
-------------1------------2-----3------4-------5-------------6--------7------------8--------9------------10-------11-----------12-------13----14-----15-----16------17----18-----19---------20
	{100,	18,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	2,	0,	"Thi�n Gi�ng B�o (nam ti�u chu�n)"},
	{100,	18,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	2,	0,	"Thi�n Gi�ng B�o (nam ti�u chu�n)"},
	{100,	36,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Long B� � kim Y (nam kh�i ng�)"},
	{100,	36,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Long B� � kim Y (nam kh�i ng�)"},
	{100,	54,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Phi Thi�n Th�i Th��ng (n� g�i c�m)"},
	{100,	54,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Phi Thi�n Th�i Th��ng (n� g�i c�m)"},
	{100,	72,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Ng� Th�i Ngh� Th��ng (Ki�u n�)"},
	{100,	72,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Ng� Th�i Ngh� Th��ng (Ki�u n�)"},
	{101,	18,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"� T�m Trang (nam ti�u chu�n)"},
	{101,	18,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"� T�m Trang (nam ti�u chu�n)"},
	{101,	18,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"� T�m Trang (nam ti�u chu�n)"},
	{101,	36,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Thi�n Canh Trang (nam kh�i ng�)"},
	{101,	36,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Thi�n Canh Trang (nam kh�i ng�)"},
	{101,	36,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Thi�n Canh Trang (nam kh�i ng�)"},
	{101,	54,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Th�i Thanh (n� g�i c�m)"},
	{101,	54,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Th�i Thanh (n� g�i c�m)"},
	{101,	54,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Th�i Thanh (n� g�i c�m)"},
	{101,	72,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Xu�t V�n (Ki�u n�)"},
	{101,	72,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Xu�t V�n (Ki�u n�)"},
	{101,	72,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Xu�t V�n (Ki�u n�)"},
	{103,	18,	4,	2,	371,	6,	357,	3,	360,	3,	361,	3,	0,	0,	0,	0,	0,	0,	0,	"B� Th�n Qu�n (nam ti�u chu�n)"},
	{103,	36,	4,	2,	371,	6,	357,	3,	360,	3,	361,	3,	0,	0,	0,	0,	0,	0,	0,	"Di Th�n ��u C�n (nam kh�i ng�)"},
	{103,	54,	4,	2,	371,	6,	357,	3,	360,	3,	361,	3,	0,	0,	0,	0,	0,	0,	0,	"Chu T��c (n� g�i c�m)"},
	{103,	72,	4,	2,	371,	6,	357,	3,	360,	3,	361,	3,	0,	0,	0,	0,	0,	0,	0,	"Tr��ng Sinh (Ki�u n�)"},
}
prize_att[6] = {
-------------1------------2-----3------4-------5-------------6--------7------------8--------9------------10-------11-----------12-------13----14-----15-----16------17----18-----19---------20
	{100,	17,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"S�n Qu� Huy�t y (nam ti�u chu�n)"},
	{100,	17,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"S�n Qu� Huy�t y (nam ti�u chu�n)"},
	{100,	35,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Huy�t H� Qu� V��ng Kh�i (nam kh�i ng�)"},
	{100,	35,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Huy�t H� Qu� V��ng Kh�i (nam kh�i ng�)"},
	{100,	53,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Thi�n Y (n� g�i c�m)"},
	{100,	53,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Thi�n Y (n� g�i c�m)"},
	{100,	71,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"V� Song ��u y (Ki�u n�)"},
	{100,	71,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"V� Song ��u y (Ki�u n�)"},
	{101,	17,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"S�t Ki�p Trang (nam ti�u chu�n)"},
	{101,	17,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"S�t Ki�p Trang (nam ti�u chu�n)"},
	{101,	17,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"S�t Ki�p Trang (nam ti�u chu�n)"},
	{101,	35,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Huy�t H� Trang (nam kh�i ng�)"},
	{101,	35,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Huy�t H� Trang (nam kh�i ng�)"},
	{101,	35,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Huy�t H� Trang (nam kh�i ng�)"},
	{101,	53,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"H� Ti�u (n� g�i c�m)"},
	{101,	53,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"H� Ti�u (n� g�i c�m)"},
	{101,	53,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"H� Ti�u (n� g�i c�m)"},
	{101,	71,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"H�ng Ng�c (Ki�u n�)"},
	{101,	71,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"H�ng Ng�c (Ki�u n�)"},
	{101,	71,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"H�ng Ng�c (Ki�u n�)"},
	{103,	17,	4,	2,	371,	6,	357,	3,	358,	3,	359,	3,	0,	0,	0,	0,	0,	0,	0,	"M�t n� S�n Qu� (nam ti�u chu�n)"},
	{103,	35,	4,	2,	371,	6,	357,	3,	358,	3,	359,	3,	0,	0,	0,	0,	0,	0,	0,	"M�t n� Chung Qu�"},
	{103,	53,	4,	2,	371,	6,	357,	3,	358,	3,	359,	3,	0,	0,	0,	0,	0,	0,	0,	"Tu La (n� g�i c�m)"},
	{103,	71,	4,	2,	371,	6,	357,	3,	358,	3,	359,	3,	0,	0,	0,	0,	0,	0,	0,	"Vu H�m (Ki�u n�)"},
}
--�ƽ�װ������Ҫ����1�����ࣨװ�����඼Ϊ0ʡ�ԣ���2��С�࣬3�Ƿ������( ������Ϊ1ʡ�ԣ�0δ���� ��1�Ѽ����� 2ʰȡ�� ��3װ���󶨣� 4�Ѿ���)��4�����ƣ�5�����ԡ�
prize_att[7] = {
{3,		6001,	1,	0,	"Ph� Y�n �ao"},
{5,		6002,	1,	0,	"Ph� Y�n c�n"},
{0,		6004,	1,	0,	"H�m Y�n th�"},
{8,		6003,	1,	0,	"Ph� Y�n tr��ng"},
{1,		6005,	1,	0,	"T�ng Y�n ch�m"},
{2,		6006,	1,	0,	"Phi Y�n ki�m"},
{10,	6007,	1,	0,	"V�n Y�n c�m"},
{0,		6008,	1,	0,	"V�n Y�n th�"},
{5,		6009,	1,	0,	"L�u Y�n c�n"},
{2,		6010,	1,	0,	"Huy�n Y�n ki�m"},
{9,		6011,	1,	0,	"V� Y�n b�t"},
{6,		6012,	1,	0,	"H� Ti�m Th��ng"},
{4,		6013,	1,	0,	"H�nh Y�n Cung"},
{7,		6014,	1,	0,	"Tr�c Y�n nh�n"},
{11,	6015,	1,	0,	"Y�u Y�n tr�o"},
}
--װ�����Զ�Ӧ����
prize_att_string = {
	"Th� l�c +",
	"Ph�n ��n",
	"Ph�m vi t�n c�ng �m kh� +",
	"H�t n�i mi�n d�ch",
	"H�t huy�t mi�n d�ch",
	"T� l� t�n c�ng nh�t ��nh",
	"T� l� t�n c�ng d�y l�i ��i ph��ng",
	"Kh�ng ch� ��i ph��ng ph�c h�i m�u",
	"T� l� m�i m�n v� kh� gi�m",
	"M�i 10 gi�y �m kh� t�ng",
	"Sinh l�c +",
	"N�i l�c +",
	"M�i 10 gi�y n�i l�c h�i ph�c",
	"M�i 10 gi�y sinh l�c h�i ph�c",
	"H�y mi�n d�ch c�a ��i ph��ng",
	"10 gi�y sinh l�c gi�m, ngo�i c�ng t�ng",
	" 10 gi�y n�i l�c gi�m, n�i c�ng t�ng ",
	"Ngo�i ph�ng gi�m, ngo�i k�ch t�ng",
	"N�i ph�ng gi�m, N�i c�ng t�ng",
	"H� g�c ��i ph��ng n�i l�c h�i ph�c ",
	"H� g�c ��i ph��ng sinh l�c h�i ph�c ",
	"S�t th��ng �m kh� gi�m",
	"Ch�nh x�c t�ng",
	"T�c �� thi tri�n v� c�ng t�ng",
	"Sau khi tr�ng sinh n�i th��ng gi�m nh�",
	"Sau khi tr�ng sinh ngo�i th��ng gi�m nh�",
	"T� l� xu�t chi�u t�ng",
	"V� c�ng hao n�i gi�m",
	"Khi�n ��i ph��ng gi�m t�c",
	"T� l� nh�t ��nh t�n c�ng m�nh nh�t",
	"H� g�c ��i ph��ng s�c m�nh t�ng ",
	"H� g�c ��i ph��ng g�n c�t t�ng",
	"H� g�c ��i ph��ng th�n ph�p t�ng ",
	"H� g�c ��i ph��ng Linh ho�t t�ng",
	"H� g�c ��i ph��ng n�i c�ng t�ng ",
	"H� g�c ��i ph��ng ch�nh x�c t�ng ",
	"H� g�c ��i ph��ng n� tr�nh t�ng ",
	"H� g�c ��i ph��ng ch� m�ng t�ng",
	"D��c hi�u k�o d�i",
	"T� l� nh�t ��nh gi�m mi�n d�ch",
	"H� tr� t�n c�ng  duy tr� ",
	"H� tr� ph�ng th� duy tr� ",
	"600 gi�y �� b�n v� kh� h�i ph�c",
	"N�i ph�ng t�ng ",
	"Ph�ng th� ngo�i c�ng t�ng",
	"Chuy�n h�a s�t th��ng th�nh n�i l�c",
	"V�i thu�c t�nh �m s�t th��ng t�ng",
	"V�i thu�c t�nh �m ch�nh x�c t�ng",
	"T�n c�ng l�m ��i ph��ng hao t�n n�i l�c",
	"Ph� ph�ng th� ��i ph��ng",
	"H�t n�i l�c",
	"H�t sinh l�c",
	"T� l� nh�t ��nh l�m ��i ph��ng kh� huy�t hao t�n",
	"T� l� nh�t ��nh l�m ��i ph��ng ch�n nguy�n hao t�n",
	"T�n c�ng l�m s�c m�nh ��i ph��ng gi�m",
	"T�n c�ng l�m g�n c�t ��i ph��ng gi�m",
	"T�n c�ng l�m n�i c�ng ��i ph��ng gi�m",
	"Khi�n ��i ph��ng gi�m Linh ho�t ",
	"T�n c�ng l�m th�n ph�p ��i ph��ng gi�m",
	"T� l� nh�t ��nh t�n c�ng ph�m vi",
	"T�n c�ng l�m ph�ng ngo�i ��i ph��ng gi�m",
	"T�n c�ng l�m gi�m n�i ph�ng ��i ph��ng",
	"T�n c�ng l�m ph�ng ngo�i ��i ph��ng gi�m",
	"Khi�n ��i ph��ng gi�m N�i ph�ng",
	"V� kh� ��nh ngo�i l�n nh�t t�ng ",
	"V� kh� ��nh ngo�i th�p nh�t t�ng ",
	"V� kh� ��nh n�i l�n nh�t t�ng",
	"V� kh� ��nh n�i th�p nh�t t�ng ",
	"T�n c�ng k�m ��c s�t",
	"L�m ch�m ��i ph��ng m�i th�i gian",
	"T� li�t ��i ph��ng m�t th�i gian",
	"L�m cho�ng ��i ph��ng m�t th�i gian",
	"��nh th�n ��i ph��ng m�t th�i gian",
	"H�n lo�n ��i ph��ng m�t th�i gian",
	"L�m ��i ph��ng ng� m�t th�i gian",
	"Kh� n�ng ��nh b�i ��i ph��ng",
	"T�n c�ng t�ng ",
	"S�t th��ng �m kh� t�ng",
	"Sinh l�c t�i �a t�ng",
	"N�i l�c + ",
	"Kh� n�ng ��y l�i ��i ph��ng",
	"��c s�t gi�m",
	"H� g�c ��i ph��ng n�i l�c h�i ph�c ",
	"H� g�c ��i ph��ng sinh l�c h�i ph�c ",
	"Ngo�i k�ch + ",
	"N�i k�ch t�ng ",
	"Ngo�i ph�ng+",
	"N�i ph�ng + ",
	"Gi�m th�i gian tr�ng th��ng",
	"L�m gi�m n�i- ngo�i ph�ng c�a ��i ph��ng",
	"T�c �� h�i ph�c ngo�i th��ng t�ng",
	"T�c �� h�i ph�c n�i th��ng t�ng ",
	"T� l� ��nh ch�n xu�t chi�u c�a ��i ph��ng",
	"G�n c�t t�ng",
	"S�c m�ng t�ng",
	"Th�n ph�p t�ng",
	"Linh ho�t t�ng",
	"N�i c�ng t�ng ",
	"Kinh nghi�m nh�n ���c t�ng",
	"T� l� nh�t ��nh kh�ng ��c",
	"Di chuy�n t�ng",
	"T�t c� thu�c t�nh t�ng",
	"��nh n�i-kh�a v�t ph�m",
	"��nh n�i-kh�a k� n�ng t�n c�ng",
	"��nh n�i-kh�a k� n�ng h� tr�",
	"T� l� nh�t ��nh tr�nh b�y",
	"T� l� nh�t ��nh ch�u ��n gi�m n�a",
	"N� tr�nh + ",
	"y�u c�u ��ng c�p gi�m ",
	"S�c l�c t�ng",
	"��nh t�p trung t�ng",
	"600 gi�y �� b�n th��ng y h�i ph�c ",
	"600 gi�y �� b�n n�n h�i ph�c ",
	"600 gi�y �� b�n h� y h�i ph�c ",
	"Kinh nghi�m nh�n ���c t�ng",
	"Ch�ng gi�m t�c �� ��nh t�ng",
	"Ch�ng gi�m t�c di chuy�n t�ng",
	"T� l� ��nh ng� ��i ph��ng",
	"��nh ch�n ��i ph��ng xu�t chi�u",
	"T� kh� t�i �a t�ng 1 �",
	"Mi�n d�ch ��nh ng�",
	"T� l� mi�n d�ch ��nh lui",
	"T� l� mi�n d�ch t� li�t",
	"T� l� mi�n d�ch cho�ng",
	"T� l� mi�n d�ch ��nh th�n",
	"T� l� mi�n d�ch h�n lo�n",
	"T� l� mi�n d�ch g�y ng�",
	"T� l� mi�n d�ch l�m ch�m ",
	"T� l� mi�n d�ch gi�m t�c",
	"N� tr�nh t�ng",
	"Ngo�i k�ch + ",
	"N�i k�ch t�ng ",
	"Ngo�i k�ch + ",
	"N�i k�ch t�ng ",
	"Ngo�i k�ch + ",
	"N�i k�ch t�ng ",
	"Ngo�i k�ch + ",
	"S�c l�c t�ng",
	"Khi�n ��i ph��ng gi�m t�c",
	"L�m ch�m ��i ph��ng",
	"L�m t� li�t ��i ph��ng",
	"L�m cho�ng ��i ph��ng",
	"�i�m huy�t ��i ph��ng",
	"L�m h�n lo�n ��i ph��ng",
	"G�y ng�",
	"Kh� n�ng ��nh b�i ��i ph��ng",
	"Kh� n�ng ��y l�i ��i ph��ng",
	"��nh n�i-kh�a v�t ph�m",
	"��nh n�i-kh�a k� n�ng t�n c�ng",
	"��nh n�i-kh�a k� n�ng h� tr�",
	"Khi�n ��i ph��ng gi�m t�c",
	"L�m ch�m ��i ph��ng",
	"L�m t� li�t ��i ph��ng",
	"L�m cho�ng ��i ph��ng",
	"�i�m huy�t ��i ph��ng",
	"L�m h�n lo�n ��i ph��ng",
	"G�y ng�",
	"Kh� n�ng ��nh b�i ��i ph��ng",
	"Kh� n�ng ��y l�i ��i ph��ng",
	"��nh n�i-kh�a v�t ph�m",
	"��nh n�i-kh�a k� n�ng t�n c�ng",
	"��nh n�i-kh�a k� n�ng h� tr�",
	"Khi�n ��i ph��ng gi�m t�c",
	"L�m ch�m ��i ph��ng",
	"L�m t� li�t ��i ph��ng",
	"L�m cho�ng ��i ph��ng",
	"�i�m huy�t ��i ph��ng",
	"L�m h�n lo�n ��i ph��ng",
	"G�y ng�",
	"Kh� n�ng ��nh b�i ��i ph��ng",
	"Kh� n�ng ��y l�i ��i ph��ng",
	"��nh n�i-kh�a v�t ph�m",
	"��nh n�i-kh�a k� n�ng t�n c�ng",
	"��nh n�i-kh�a k� n�ng h� tr�",
	"Khi�n ��i ph��ng gi�m t�c",
	"L�m ch�m ��i ph��ng",
	"L�m t� li�t ��i ph��ng",
	"L�m cho�ng ��i ph��ng",
	"�i�m huy�t ��i ph��ng",
	"L�m h�n lo�n ��i ph��ng",
	"G�y ng�",
	"Kh� n�ng ��nh b�i ��i ph��ng",
	"Kh� n�ng ��y l�i ��i ph��ng",
	"��nh n�i-kh�a v�t ph�m",
	"��nh n�i-kh�a k� n�ng t�n c�ng",
	"��nh n�i-kh�a k� n�ng h� tr�",
	"Khi�n ��i ph��ng gi�m t�c",
	"L�m ch�m ��i ph��ng",
	"L�m t� li�t ��i ph��ng",
	"L�m cho�ng ��i ph��ng",
	"�i�m huy�t ��i ph��ng",
	"L�m h�n lo�n ��i ph��ng",
	"G�y ng�",
	"Kh� n�ng ��nh b�i ��i ph��ng",
	"Kh� n�ng ��y l�i ��i ph��ng",
	"��nh n�i-kh�a v�t ph�m",
	"��nh n�i-kh�a k� n�ng t�n c�ng",
	"��nh n�i-kh�a k� n�ng h� tr�",
	"Khi�n ��i ph��ng gi�m t�c",
	"L�m ch�m ��i ph��ng",
	"L�m t� li�t ��i ph��ng",
	"L�m cho�ng ��i ph��ng",
	"�i�m huy�t ��i ph��ng",
	"L�m h�n lo�n ��i ph��ng",
	"G�y ng�",
	"Kh� n�ng ��nh b�i ��i ph��ng",
	"Kh� n�ng ��y l�i ��i ph��ng",
	"��nh n�i-kh�a v�t ph�m",
	"��nh n�i-kh�a k� n�ng t�n c�ng",
	"��nh n�i-kh�a k� n�ng h� tr�",
	"Khi�n ��i ph��ng gi�m t�c",
	"L�m ch�m ��i ph��ng",
	"L�m t� li�t ��i ph��ng",
	"L�m cho�ng ��i ph��ng",
	"�i�m huy�t ��i ph��ng",
	"L�m h�n lo�n ��i ph��ng",
	"G�y ng�",
	"Kh� n�ng ��nh b�i ��i ph��ng",
	"Kh� n�ng ��y l�i ��i ph��ng",
	"��nh n�i-kh�a v�t ph�m",
	"��nh n�i-kh�a k� n�ng t�n c�ng",
	"��nh n�i-kh�a k� n�ng h� tr�",
	"Khi�n ��i ph��ng gi�m t�c",
	"L�m ch�m ��i ph��ng",
	"L�m t� li�t ��i ph��ng",
	"L�m cho�ng ��i ph��ng",
	"�i�m huy�t ��i ph��ng",
	"L�m h�n lo�n ��i ph��ng",
	"G�y ng�",
	"Kh� n�ng ��nh b�i ��i ph��ng",
	"Kh� n�ng ��y l�i ��i ph��ng",
	"��nh n�i-kh�a v�t ph�m",
	"��nh n�i-kh�a k� n�ng t�n c�ng",
	"��nh n�i-kh�a k� n�ng h� tr�",
	"T� l� nh�t ��nh khi�n ��i ph��ng ch�u n�i th��ng c�p 1",
	"T� l� nh�t ��nh khi�n ��i ph��ng ch�u ngo�i th��ng c�p 1",
	"T� l� nh�t ��nh khi�n ��i ph��ng ch�u n�i th��ng c�p 2",
	"T� l� nh�t ��nh khi�n ��i ph��ng ch�u ngo�i th��ng c�p 2",
	"T� l� nh�t ��nh khi�n ��i ph��ng ch�u n�i th��ng c�p 3",
	"T� l� nh�t ��nh khi�n ��i ph��ng ch�u ngo�i th��ng c�p 3",
	"T� l� nh�t ��nh khi�n ��i ph��ng ch�u n�i th��ng c�p 4",
	"T� l� nh�t ��nh khi�n ��i ph��ng ch�u ngo�i th��ng c�p 4",
	"T� l� nh�t ��nh khi�n ��i ph��ng ch�u n�i th��ng c�p 5",
	"T� l� nh�t ��nh khi�n ��i ph��ng ch�u ngo�i th��ng c�p 5",
	"G�n c�t t�ng",
	"S�c m�ng t�ng",
	"Th�n ph�p t�ng",
	"Linh ho�t t�ng",
	"N�i c�ng t�ng ",
	"Sinh l�c +",
	"T�n c�ng k�m ��c s�t",
	"Ph� ph�ng th� ��i ph��ng",
	"Sinh l�c t�i �a t�ng",
	"N�i l�c + ",
	"V� kh� ��nh ngo�i l�n nh�t t�ng ",
	"V� kh� ��nh n�i l�n nh�t t�ng",
	"M�i 10 gi�y n�i l�c h�i ph�c",
	"M�i 10 gi�y sinh l�c h�i ph�c",
	"��c s�t t�ng",
	"H� g�c ��i ph��ng sinh l�c h�i ph�c ",
	"Ngo�i k�ch + ",
	"N�i k�ch t�ng ",
	"G�n c�t t�ng",
	"S�c m�ng t�ng",
	"Th�n ph�p t�ng",
	"Linh ho�t t�ng",
	"N�i c�ng t�ng ",
	"S�t th��ng t�ng ",
	"Khi�n ��i ph��ng gi�m t�c",
	"L�m ch�m ��i ph��ng",
	"Khi�n ��i ph��ng gi�m t�c",
	"L�m ch�m ��i ph��ng",
	"L�m gi�m ph�ng th� N�i-ngo�i c�ng ��i ph��ng",
	"Gi�m l�c ��nh ��i ph��ng",
	"T�n c�ng k�m ��c s�t",
	"T�c �� thi tri�n v� c�ng t�ng",
	"Sinh l�c t�i �a t�ng",
	"N�i l�c + ",
	"N�i ph�ng t�ng ",
	"Ngo�i ph�ng +",
	"T�n c�ng k�m ��c s�t",
	"N� tr�nh t�ng",
	"��nh ch�n ��i ph��ng xu�t chi�u",
	"��c s�t t�ng",
	"��c s�t t�ng",
	"Gi�m th�i gian tr�ng th��ng",
	"M�c t� kh� l�n nh�t t�ng",
	"T� l� ��nh ch�n xu�t chi�u c�a ��i ph��ng",
	"N� tr�nh t�ng",
	"Sinh l�c t�i �a t�ng",
	"N�i l�c + ",
	"H� tr� t�n c�ng  duy tr� ",
	"H� tr� ph�ng th� duy tr� ",
	"Ngo�i ph�ng gi�m, ngo�i k�ch t�ng",
	"Ngo�i ph�ng gi�m, N�i k�ch t�ng",
	"Kh�c n�",
	"T�n c�ng l�m s�c m�nh ��i ph��ng gi�m",
	"T�n c�ng l�m g�n c�t ��i ph��ng gi�m",
	"T�n c�ng l�m n�i c�ng ��i ph��ng gi�m",
	"Khi�n ��i ph��ng gi�m Linh ho�t ",
	"T�n c�ng l�m th�n ph�p ��i ph��ng gi�m",
	"T� l� ch�u ��n gi�m n�a",
	"Ph�t huy c�ng k�ch l�n nh�t",
	"V� c�ng hao n�i gi�m",
	"D��c hi�u k�o d�i",
	"Ch�nh x�c t�ng",
	"Ch�nh x�c t�ng",
	"Chuy�n h�a s�t th��ng th�nh n�i l�c",
	"V� kh� ��nh ngo�i l�n nh�t t�ng ",
	"V� kh� ��nh ngo�i th�p nh�t t�ng ",
	"V� kh� ��nh n�i l�n nh�t t�ng",
	"V� kh� ��nh n�i th�p nh�t t�ng ",
	"Th�i gian duy tr� Kim Chung Tr�o k�o d�i",
	"Th�i gian duy tr� Kim Cang B�t Ho�i k�o d�i",
	"Th�i gian duy tr� Hu� Nh�n Ch� k�o d�i",
	"Th�i gian duy tr� T�m Nh�n k�o d�i",
	"L�c ��nh Ng�c N� Ki�m ph�p t�ng",
	"L�c ��nh T�y � Kh�c t�ng",
	"L�c ��nh Th�ng T� Quy�n t�ng ",
	"L�c ��nh Khu X� c�n ph�p t�ng",
	"Th�i gian duy tr� V� Ng� T�m Ph�p k�o d�i",
	"L�c ��nh Th�i �t Ti�u Di�u C�ng t�ng",
	"L�c ��nh D��ng Gia Ph� Phong Th��ng t�ng",
	"T� l� ��nh ��y l�i t�ng",
	"L�c ��nh D��ng Gia Li�n X� Thu�t t�ng",
	"T�n c�ng b� qua n� tr�nh c�a ��i ph��ng",
	"R�t ng�n gi�n c�ch xu�t chi�u Thi B�c ��i Ph�p",
	"L�c ��nh Cu�ng Phong Tr�o t�ng",
	"T�t c� thu�c t�nh t�ng",
	"Trong 5 gi�y t�c �� ch�y t�ng 100, c�ch nhau 10 ph�t",
	"S�t th��ng t�ng ",
	"��c s�t t�ng",
	"H� g�c ��i ph��ng sinh l�c h�i ph�c ",
	"y�u c�u ��ng c�p gi�m ",
	"T� l� ��nh ph�m vi",
	"Th� l�c t�i �a t�ng",
	"Ch�nh x�c t�ng",
	"N� tr�nh t�ng",
	"Ph�n ��n",
	"M�i 10 gi�y n�i l�c h�i ph�c",
	"M�i 10 gi�y sinh l�c h�i ph�c",
	"��nh t�p trung t�ng",
	"N�i ph�ng t�ng ",
	"Ph�ng th� ngo�i c�ng t�ng",
	"V� c�ng hao n�i gi�m",
	"Ph�t huy c�ng k�ch l�n nh�t",
	"��c s�t gi�m",
	"T�n c�ng l�m s�c m�nh ��i ph��ng gi�m",
	"T�n c�ng l�m g�n c�t ��i ph��ng gi�m",
	"T�n c�ng l�m n�i c�ng ��i ph��ng gi�m",
	"Khi�n ��i ph��ng gi�m Linh ho�t ",
	"T�n c�ng l�m th�n ph�p ��i ph��ng gi�m",
	"T�n c�ng l�m ph�ng ngo�i ��i ph��ng gi�m",
	"T�n c�ng l�m gi�m n�i ph�ng ��i ph��ng",
	"Gi�m th�i gian tr�ng th��ng",
	"T� l� ��nh ch�n xu�t chi�u c�a ��i ph��ng",
	"G�n c�t t�ng",
	"S�c m�ng t�ng",
	"Th�n ph�p t�ng",
	"Linh ho�t t�ng",
	"N�i c�ng t�ng ",
	"Ph� ph�ng th� ��i ph��ng",
	"T�n c�ng k�m ��c s�t",
	"Kh�c n�",
	"T� l� nh�t ��nh ch�u ��n gi�m n�a",
	"Kinh nghi�m nh�n ���c t�ng",
	"T�t c� thu�c t�nh t�ng",
	"Ngo�i k�ch + ",
	"N�i k�ch t�ng ",
	"T� l� xu�t chi�u t�ng",
	"T�c �� thi tri�n v� c�ng t�ng",
	"S�t th��ng t�ng ",
	"T� l� tr�nh gi�m t�c t�ng",
	"T� l� tr�nh l�m ch�m t�ng ",
	"T� l� tr�nh ��nh lui t�ng",
	"T� l� tr�nh ��nh ng� t�ng",
	"T� l� tr�nh t� li�t t�ng",
	"T� l� tr�nh cho�ng t�ng",
	"T� l� tr�nh ��nh th�n t�ng",
	"T� l� tr�nh h�n lo�n t�ng",
	"T� l� tr�nh ng� t�ng",
	"T�n c�ng l�m ph�ng ngo�i ��i ph��ng gi�m",
	"Khi�n ��i ph��ng gi�m N�i ph�ng",
	"G�n c�t t�ng",
	"S�c m�ng t�ng",
	"Th�n ph�p t�ng",
	"Linh ho�t t�ng",
	"N�i c�ng t�ng ",
	"C�ng k�ch + ",
	"T� l� xu�t chi�u t�ng",
	"D�ng linh ��n Nguy�t L��ng Th�, c�ch nhau 5 ph�t",
	"Tri�u g�i H�ng Nga ti�n t� gi�p phe m�nh h�i ph�c. Gi�n c�ch 5 ph�t",
	"Tri�u g�i H�u Ngh� b�n m�t tr�i, c�ch nhau 5 ph�t",
	"S�t th��ng t�ng ",
	"(Tr�ng th�i PK kh�ng th� s� d�ng)",										
}
prize_iron_num = {5,5,5,5,5,5,20}
prize_water_num = {3,3,3,3,5,5,10}
prize_zhuangbei_jilv = {220,220,260,240,24,24,30}
--======================================����������װ��=============================
function OnUse(id)
	local box_diff = GetItemParticular(id)
	local PlayerIndex_save = PlayerIndex 											--�����������
	--��Ʒ��ʼ������У��--
	for i = 1,2 do
		if GetItemParam(id,i) > 10000 then
			SetItemParam(id,0,0)
			SetItemParam(id,1,0)
			SetItemParam(id,2,0)
		end
	end
	--�������--
	local prize_level = box_diff - 525										--�����ȼ�
	-----------------------------------��������-------------------------------------------
	if GetItemParam(id,1) == 0 then											--�����ж������Ƿ���
		if zgc_conf_task_iron_add(prize_level) == 1 then
			if prize_level == 7 and random(1000) <= prize_zhuangbei_jilv[7] then
				local add_flag = AddItem(2,0,1082,50)
				if add_flag == 1 then
					AddGlobalNews("Ng��i ch�i"..GetName().."D�ng 'B�ch B�o r��ng B� Phi Y�n' m� 50 quy�n 'Th�i D�ch H�n Nguy�n C�ng ��'!")
					SendTongMessage(GetName().."D�ng 'B�ch B�o r��ng B� Phi Y�n' m� 50 quy�n 'Th�i D�ch H�n Nguy�n C�ng ��'!")
				else
					WriteLog("B� Phi Y�n: Ng��i ch�i["..GetName().."]d�ng 'B�ch B�o r��ng B� Phi Y�n' th�m 50 quy�n 'Th�i D�ch H�n Nguy�n C�ng ��' th�t b�i, ��nh d�u:  "..add_flag)
				end
			end
			SetItemParam(id,1,1)
		else
			return
		end		
	end
	---------------------------------װ������д��---------------------------------------
	if GetItemParam(id,0) == 0 then											--�����һ�η���
		if random(1,1000) > prize_zhuangbei_jilv[prize_level] then			--��װ������
			local del_flag = DelItemByIndex(id,1)
			if del_flag ~= 1 then				
				WriteLogEx(strLogCaption, "" ,"", "", "", GetTongName(), "x�a b�o r��ng th�t b�i, tr� ph�n h�i:"..del_flag)				
			end
			return
		else																--��װ������
			local prize_seq = 0
			if prize_level <= 4 then										--1-4��ֱ�ӱ���˳���
				prize_seq = random(1,getn(prize_att[prize_level]))
			elseif prize_level == 7 then									--7��ֱ�ӱ������ݺ�
				prize_seq = random(1,getn(prize_att[7]))
			else															--���ȴ����Ϊ����
				prize_seq = random(1,getn(prize_att[prize_level]))
				local att_1,att_2,att_3 = zgc_conf_task_att_return(prize_level,prize_seq)
				prize_seq = Zgc_conf_task_att_dealin(prize_seq,att_1,att_2,att_3)
			end
			SetItemParam(id,0,prize_seq)
		end
	end
	------------------------------------װ�����Զ�ȡ--------------------------------------
	local prize_jieshi = ""
	local prize_jieshi_1 = ""
	local prize_jieshi_2 = ""	
	local prize_seq = 0
	local att_1 = 0
	local att_2 = 0
	local att_3 = 0
	prize_seq = GetItemParam(id,0)
	if prize_level <= 4 then
		att_1 = prize_att[prize_level][prize_seq][4]
		att_2 = prize_att[prize_level][prize_seq][6]
		att_3 = prize_att[prize_level][prize_seq][8]
		prize_jieshi_1 = " (thu�c t�nh:"..prize_att_string[att_1]
		prize_jieshi_2 = ";"..prize_att_string[att_2]
		if att_3 ~= 0 then
			prize_jieshi_2 = prize_jieshi_2..";"..prize_att_string[att_3].."; kh�a)."
		else
			prize_jieshi_2 = prize_jieshi_2.."; kh�a)."
		end
		prize_jieshi_1 = prize_att[prize_level][prize_seq][11]..prize_jieshi_1
	elseif prize_level == 7 then
		prize_jieshi_1 = "Trang b� Ho�ng Kim:"..prize_att[7][prize_seq][5]
		--�����ӽ��Ҫ�����������Ϣ
		AddGlobalNews("Ng��i ch�i"..GetName().."S� d�ng \'B�ch B�u R��ng c�a B� Phi Y�n\' m� Ho�ng Kim V� Kh�:"..prize_att[7][prize_seq][5])
	else
		prize_seq,att_seq_1,att_seq_2,att_seq_3 = Zgc_conf_task_att_dealout(prize_seq)				--���Խ���ȡ��������ţ����������Դ���
		if prize_att[prize_level][prize_seq][4] == 3 then
			att_1 = prize_att[prize_level][prize_seq][5+(att_seq_1*2)]
			att_2 = prize_att[prize_level][prize_seq][11+(att_seq_2*2)]
			att_3 = prize_att[prize_level][prize_seq][15+(att_seq_3*2)]
		elseif prize_att[prize_level][prize_seq][4] == 2 then
			att_1 = prize_att[prize_level][prize_seq][5]
			att_2 = prize_att[prize_level][prize_seq][7+(att_seq_2*2)]			
		end
		prize_jieshi_1 = " (thu�c t�nh:"..prize_att_string[att_1]
		prize_jieshi_2 = ";"..prize_att_string[att_2]
		if att_3 ~= 0 then
			prize_jieshi_2 = prize_jieshi_2..";"..prize_att_string[att_3].."; kh�a)."
		else
			prize_jieshi_2 = prize_jieshi_2.."; kh�a)."
		end
		prize_jieshi_1 = prize_att[prize_level][prize_seq][20]..prize_jieshi_1
	end
	------------------------------------���ѶԻ����-------------------------------------
		local teamer_dialog = {}											--����table
		local player_name = ""
		if GetTeamSize() == 0 then
			player_name = GetName()
			player_name = replace(player_name,"/","-")
			player_name = replace(player_name,"|","-")
			player_name = replace(player_name,":","-")
			teamer_dialog[1]=player_name..": "..player_fini_cond().." (Ch� ph�t cho bang ch�ng)./#Prize_add(0)"
			teamer_dialog[2]="�em trang b� c�t gi� t�m th�i/Zgc_end_dialog"
		else
			local conf_name_save = GetTongName()
			local team_number = GetTeamSize()
			local team_seq = 1
			for i = 1, team_number do
				PlayerIndex = GetTeamMember(i)									--�޸ĵ�ǰ�������
				if conf_name_save == GetTongName() then
					player_name = GetName()
					player_name = replace(player_name,"/","-")
					player_name = replace(player_name,"|","-")
					player_name = replace(player_name,":","-")
					local finish_condition = player_fini_cond()
					teamer_dialog[team_seq] = player_name.." V�ng 3:"..finish_condition.."/#Prize_add("..i..")"
					team_seq = team_seq + 1
				end
			end
			teamer_dialog[team_seq]="�em trang b� c�t gi� t�m th�i/Zgc_end_dialog"
			PlayerIndex = PlayerIndex_save
		end
	------------------------------------����Ի����--------------------------------------
	SendTongMessage(GetName().." M� b�o r��ng, ph�t hi�n "..prize_jieshi_1)
	if prize_level ~= 7 then
		SendTongMessage(prize_jieshi_2)
	end
	SetTaskTemp(155,id)
	prize_jieshi = prize_jieshi_1..prize_jieshi_2
	Say("B�n ph�t hi�n b�n trong b�o r��ng c� 1 "..prize_jieshi.." Nh�n v�o b�n m�t h�o h�u trong danh s�ch, s� kho�t ���c trang b� l�n ng��i ��. <color=red>(Kh�ng ph�i trang b� Ho�ng Kim sau khi m�c l�n ng��i s� b� kh�a!)<color>.",
		getn(teamer_dialog),teamer_dialog
	)
end
--*****************************************��Ʒ���亯��*******************************
function Prize_add(player_seq)
	local PlayerIndex_save = PlayerIndex 											--�����������
	local box_index = GetTaskTemp(155)
	local box_diff = GetItemParticular(box_index)
	local prize_level = box_diff - 525												--�����ȼ�
	local prize_seq = 0
	local att_1 = 0
	local att_level_1 = 0
	local att_2 = 0
	local att_level_2 = 0
	local att_3 = 0
	local att_level_3 = 0
	local prize_jieshi = ""
	local prize_jieshi_1 = ""
	local prize_jieshi_2 = ""
	prize_seq = GetItemParam(box_index,0)
	if prize_level <= 4 then
		att_1 = prize_att[prize_level][prize_seq][4]
		att_level_1 = prize_att[prize_level][prize_seq][5]
		att_2 = prize_att[prize_level][prize_seq][6]
		att_level_2 = prize_att[prize_level][prize_seq][7]
		att_3 = prize_att[prize_level][prize_seq][8]
		att_level_3 = prize_att[prize_level][prize_seq][9]
		prize_jieshi_1 = " (thu�c t�nh:"..prize_att_string[att_1]
		prize_jieshi_2 = ";"..prize_att_string[att_2]
		if att_3 ~= 0 then
			prize_jieshi_2 = prize_jieshi_2..";"..prize_att_string[att_3]..")."
		else
			prize_jieshi_2 = prize_jieshi_2..")."
		end
		prize_jieshi_1 = prize_att[prize_level][prize_seq][11]..prize_jieshi_1
	elseif prize_level == 7 then
		att_1 = -1
		att_level_1 = -1
		att_2 = -1
		att_level_2 = -1
		att_3 = -1
		att_level_3 = -1
		prize_jieshi_1 = "Trang b� Ho�ng Kim:"..prize_att[7][prize_seq][5]
	else
		prize_seq,att_1,att_2,att_3 = Zgc_conf_task_att_dealout(prize_seq)				--���Խ���
		if prize_att[prize_level][prize_seq][4] == 3 then
			att_level_1 = prize_att[prize_level][prize_seq][(att_1*2)+6]
			att_1 = prize_att[prize_level][prize_seq][(att_1*2)+5]
			att_level_2 = prize_att[prize_level][prize_seq][(att_2*2)+12]
			att_2 = prize_att[prize_level][prize_seq][(att_2*2)+11]
			att_level_3 = prize_att[prize_level][prize_seq][(att_3*2)+16]
			att_3 = prize_att[prize_level][prize_seq][(att_3*2)+15]		
		elseif prize_att[prize_level][prize_seq][4] == 2 then
			att_level_1 = prize_att[prize_level][prize_seq][6]
			att_1 = prize_att[prize_level][prize_seq][5]
			att_level_2 = prize_att[prize_level][prize_seq][(att_2*2)+8]
			att_2 = prize_att[prize_level][prize_seq][(att_2*2)+7]		
		end
		prize_jieshi_1 = " (thu�c t�nh:"..prize_att_string[att_1]
		prize_jieshi_2 = ";"..prize_att_string[att_2]
		if att_3 ~= 0 then
			prize_jieshi_2 = prize_jieshi_2..";"..prize_att_string[att_3]..")."
		else
			prize_jieshi_2 = prize_jieshi_2..")."
		end
		prize_jieshi_1 = prize_att[prize_level][prize_seq][20]..prize_jieshi_1
	end
	if player_seq == 0 then
		if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 250 then			--�ж���Ҹ��غͿռ�						--=========================�ڴ˼��븺�غͿո������ж�
			Say ("H�nh trang c�a b�n qu� ��y, s�p x�p r�i quay l�i!",
					1,
					"Ta bi�t r�i!/Zgc_dialog_end"
				)
				return
		else
			local del_flag = DelItemByIndex(box_index,1)
			if del_flag == 1 then
				local add_flag = 0
				if prize_level <=4 then
					add_flag = AddItem(0,prize_att[prize_level][prize_seq][1],prize_att[prize_level][prize_seq][2],1,prize_att[prize_level][prize_seq][3],att_level_1,att_1,att_level_2,att_2,att_level_3,att_3,prize_att[prize_level][prize_seq][10])
				elseif prize_level == 7 then
					add_flag = AddItem(0,prize_att[prize_level][prize_seq][1],prize_att[prize_level][prize_seq][2],1,prize_att[prize_level][prize_seq][3],att_level_1,att_1,att_level_2,att_2,att_level_3,att_3,prize_att[prize_level][prize_seq][4])
				else
					add_flag = AddItem(0,prize_att[prize_level][prize_seq][1],prize_att[prize_level][prize_seq][2],1,prize_att[prize_level][prize_seq][3],att_level_1,att_1,att_level_2,att_2,att_level_3,att_3,prize_att[prize_level][prize_seq][19])
				end
				if add_flag ~= 0 then
					SendTongMessage(GetName().."�em 1:"..prize_jieshi_1..prize_jieshi_2)
					SendTongMessage(" m�c l�n m�nh, nhi�m v� v�ng 3:"..player_fini_cond())
					if prize_level == 7 then												
						WriteLogEx(strLogCaption, "trang b� Ho�ng Kim" ,"1", prize_att[prize_level][prize_seq][5], "", GetTongName())				
					end
				else
					WriteLogEx(strLogCaption, "" ,"", "", "", GetTongName(),"th�m trang b� th�t b�i, tr� ph�n h�i:"..add_flag)
				end
			else
				WriteLogEx(strLogCaption, "" ,"", "", "", GetTongName(),"x�a b�o r��ng th�t b�i, tr� ph�n h�i:"..del_flag)
			end
		end
	else
		-------------------------------------�жϸ�����Ƿ����ڸö�����-------------------------------------
		local player_belong_flag = 0
		PlayerIndex = GetTeamMember(player_seq)
		local player_name = GetName()
		for i = 1,GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			if player_name == GetName() then
				player_belong_flag = 1
			end
		end
		PlayerIndex = PlayerIndex_save
		if player_belong_flag ~= 1 then			
			Say("Xin x�c nh�n ng��i ch�i �� c� trong ��i ng�, n�u t� ��i thay ��i ph�i ph�n b� l�i!",
				1,
				"Ta bi�t r�i/Zgc_end_dialog"
			)
			return
		else
			PlayerIndex = GetTeamMember(player_seq)
			if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 250 then			--�ж���Ҹ��غͿռ�						--=========================�ڴ˼��븺�غͿո������ж�
				PlayerIndex = PlayerIndex_save				
				Say ("H�nh trang huynh �� c�a b�n qu� ��y, s�p x�p r�i quay l�i!",
					1,
					"Ta bi�t r�i!/Zgc_dialog_end"
				)
				return
			else
				PlayerIndex = PlayerIndex_save
				local del_flag = DelItemByIndex(box_index,1)
				PlayerIndex = GetTeamMember(player_seq)
				if del_flag == 1 then
					local add_flag = 0
					if prize_level <=4 then
						add_flag = AddItem(0,prize_att[prize_level][prize_seq][1],prize_att[prize_level][prize_seq][2],1,prize_att[prize_level][prize_seq][3],att_level_1,att_1,att_level_2,att_2,att_level_3,att_3,prize_att[prize_level][prize_seq][10])
					elseif prize_level == 7 then
						add_flag = AddItem(0,prize_att[prize_level][prize_seq][1],prize_att[prize_level][prize_seq][2],1,prize_att[prize_level][prize_seq][3],att_level_1,att_1,att_level_2,att_2,att_level_3,att_3,prize_att[prize_level][prize_seq][4])
					else
						add_flag = AddItem(0,prize_att[prize_level][prize_seq][1],prize_att[prize_level][prize_seq][2],1,prize_att[prize_level][prize_seq][3],att_level_1,att_1,att_level_2,att_2,att_level_3,att_3,prize_att[prize_level][prize_seq][19])
					end
					if add_flag ~= 0 then
						local name = GetName()
						local task_fini_cond = player_fini_cond()
						PlayerIndex = PlayerIndex_save
						SendTongMessage(GetName().."�em 1:"..prize_jieshi_1..prize_jieshi_2)
						SendTongMessage("ph�n b� cho "..name.." , nhi�m v� v�ng 3:"..task_fini_cond)
						WriteLog("Nhi�m v?B?Phi Y�n: Ng��i ch�i ["..GetName().."] T�i b�n �� ID"..GetWorldPos().."L�y 1 "..prize_jieshi_1..prize_jieshi_2.."Cho "..name)
						PlayerIndex = GetTeamMember(player_seq)
						if prize_level == 7 then														
							WriteLogEx(strLogCaption, "trang b� Ho�ng Kim" ,"1", prize_att[prize_level][prize_seq][5], "", GetTongName())
						end
					else
						WriteLogEx(strLogCaption, "" ,"", "", "", GetTongName(),"th�m trang b� th�t b�i, tr� ph�n h�i:"..add_flag)
					end
				else
					WriteLogEx(strLogCaption, "" ,"", "", "", GetTongName(),"x�a b�o r��ng th�t b�i, tr� ph�n h�i:"..del_flag)
				end
				PlayerIndex = PlayerIndex_save
			end
		end
	end
end
--===================================���ű����ú���===================================
--*********************************�����������Լ��㺯��********************************
function zgc_conf_task_att_return(prize_level,prize_seq)
	local att_1 = 0
	local att_2 = 0
	local att_3 = 0
	local random_num = 0
	if prize_att[prize_level][prize_seq][4] == 2 then
		random_num = random(0,2)
		att_2 = random_num
		return 0,att_2,0
	else
		random_num = random(0,2)
		att_1 = random_num
		random_num = random(0,1)
		att_2 = random_num
		random_num = random(0,1)
		att_3 = random_num
		return att_1,att_2,att_3
	end
end
--***********************************��������*************************************
function Zgc_conf_task_att_dealin(prize_seq,att_1,att_2,att_3)
	local att_save_num = prize_seq*1000+att_1*100+att_2*10+att_3
	return att_save_num
end
--***********************************���Էֽ�*************************************
function Zgc_conf_task_att_dealout(att_save_num)
	local prize_seq = 0
	local att_1 = 0
	local att_2 = 0
	local att_3 = 0
	prize_seq = floor(att_save_num/1000)
	att_1 = floor((att_save_num - prize_seq*1000)/100)
	att_2 = floor((att_save_num - prize_seq*1000 - att_1*100)/10)
	att_3 = floor((att_save_num - prize_seq*1000 - att_1*100 - att_2*10)/10)
	return prize_seq,att_1,att_2,att_3
end
--***********************************�������Ӻ���**********************************
function zgc_conf_task_iron_add(prize_level)
	if GetFreeItemRoom() < (prize_water_num[prize_level] + 1) or (GetMaxItemWeight() - GetCurItemWeight()) < (prize_iron_num[prize_level] + 50) then			--�ж���Ҹ��غͿռ�					--=========================�ڴ˼��븺�غͿո������ж�
		Say ("H�nh trang c�a b�n qu� ��y, kh�ng th� l�y Thi�n Th�ch ra, xin ki�m tra l�i!",
			1,
			"Ta bi�t r�i!/Zgc_dialog_end"
			)
		return 0
	else	
		local iron_name = "Thi�n th�ch"
		local add_flag = 0
		if prize_level < 5 then
			add_flag = AddItem(2,2,7,prize_iron_num[prize_level])
			iron_name = "M�nh Thi�n th�ch"
		else
			add_flag = AddItem(2,2,8,prize_iron_num[prize_level])
		end
		add_flag = add_flag + AddItem(2,1,1052,prize_water_num[prize_level])
		if add_flag == 0 then
			WriteLogEx(strLogCaption, "" ,"", "", "", GetTongName(), "nh�n ���c "..iron_name.." th�t b�i, tr� quay v�:"..add_flag)				
		else
			Msg2Player("B�n ph�t hi�n b�n trong b�o r��ng c�"..prize_iron_num[prize_level].."c�i"..iron_name.."!")
			Msg2Player("B�n ph�t hi�n b�n trong b�o r��ng c�"..prize_water_num[prize_level].." B�ng Lai L� Th�y!")
			SendTongMessage(GetName().."M� b�o r��ng th�nh c�ng, nh�n ���c"..prize_iron_num[prize_level].."c�i"..iron_name.."!")
			SendTongMessage(GetName().."M� b�o r��ng th�nh c�ng, nh�n ���c"..prize_water_num[prize_level].." B�ng Lai L� Th�y!")
			WriteLogEx(strLogCaption, "nh�n" ,prize_iron_num[prize_level], iron_name, "", GetTongName())
			WriteLogEx(strLogCaption, "nh�n" ,prize_water_num[prize_level], "B�ng Lai L� Th�y", "", GetTongName())			
		end
		return 1
	end
end
--***************************������ҽ����ֵ��ռ�Ʒ�������***********************
function player_fini_cond()
	local string_return = ""
	local goods_num_count = 0
	local turn_num_sum = 0
	for i = 956,958 do
		if (Zgc_conf_task_time_return() - Zgc_conf_task_cent_date(1,i)) <=2 then
			goods_num_count = goods_num_count + Zgc_conf_task_cent_date(0,i)
			turn_num_sum = turn_num_sum + 1
		end
	end
	string_return = "("..turn_num_sum.." v�ng,"..goods_num_count.." �i�m t�ch l�y)"
	return string_return
end
--**************************���������ڷ�װ����*************************
function Zgc_conf_task_cent_date(diff_flag,task_id)
	local cent_return = 0
	local date_return = 0
	local data_save = GetTask(task_id)
	if diff_flag == 0 then
		cent_return = floor (data_save/10000)
		return cent_return
	else
		date_return = data_save - ((floor (data_save/10000))*10000)
		return date_return
	end
end
--**************************�ִμ��㺯��*******************************
function Zgc_conf_task_time_return()
	local time_return = floor((GetTime() - 57600)/(172800))
	return time_return
end
--***********************************�ַ��滻����*********************************
function replace(str,pattern,s)
	local startS,endS = strfind(str,pattern)
	while(startS) do
		str = strsub(str,1,startS-1)..s..strsub(str,endS+1,strlen(str))
		startS,endS = strfind(str,pattern)
	end
	return str
end
--***********************************�Ի��������գ�*******************************
function Zgc_end_dialog()

end