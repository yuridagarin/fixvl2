-- =========================================================
-- File: ���б���Ľű�
-- Name: shenxingbaodian.lua
-- ID:   0, 200, 39
-- Desc: ʹ�ú�ȥ��ָ���ص㣬ͬʱ����һ�����;ö�
-- Creator: Tony(Jizheng)
-- Date: Nov 30th, 2006
-- =========================================================


--����һ���������б������ܵ���ĵص�����ݽṹ
--���Ժܷ���ظ�������ṹ���������ĳһĿ����Ҫ���е����б������˳�����һҳ�Ի�ѡ�ڼ���ڶ�ҳ�Ի�ѡ�ڼ��etc
TB_DES_INFO = 
--Ŀ�ĵأ�Ŀ�ĵ������������;ã���Ŀ�ĵغ��ս��״̬
{
	[1] = 	--����ȥ������ͼ
	{
		[0] = "Khu v�c luy�n c�p",
		[1] = {21,"Nh� Long s�n",3,1},
		[2] = {22,"Ki�m M�n quan",3,1},
		[3] = {24,"Mi�u L�nh",3,1},
		[4] = {30,"H�nh Hoa th�n",3,1},
		[5] = {31,"Ng� ��c m� cung t�ng 1",3,1},
		[6] = {32,"Ng� ��c cung t�ng 2",3,1},
		[7] = {33,"D� Tr� l�m",3,1},
		[8] = {34,"Long Tuy�n Th�n",3,1},
		[9] = {35,"M� Tuy�t s�n trang",3,1},
		[10] = {36,"� M�ng B�",3,1},
		[11] = {37,"V�n M�ng Tr�ch",3,1},
		[12] = {38,"Linh B�o s�n",3,1},
		[13] = {39,"Giang T�n Th�n",4,1},
		[14] = {40,"V� L�ng s�n",3,1},
		[15] = {41,"Ch�n n�i V� L�ng",3,1},
		[16] = {42,"Thanh Kh� ��ng",3,1},
		[17] = {43,"Thi�u L�m m�t th�t-1",3,1},
		[18] = {44,"Thi�u L�m m�t th�t-2",3,1},
		[19] = {45,"T��ng V�n ��ng",3,1},
		[20] = {46,"D��ng Trung ��ng-1",3,1},
		[21] = {47,"D��ng Trung ��ng-2",4,1},
		[22] = {48,"D��ng Trung ��ng-3",5,1},
		[23] = {49,"B�ng T�m ��ng_1",4,1},
		[24] = {50,"B�ng T�m ��ng_2",5,1},
		[25] = {51,"Tr�c Ty ��ng_1",3,1},
		[26] = {52,"Tr�c Ty ��ng-2",4,1},
		[27] = {53,"Th�t Tinh ��ng-1",3,1},
		[28] = {54,"Th�t Tinh ��ng-2",4,1},
		[29] = {55,"Nh�n M�n quan",3,1},
		[30] = {56,"Ki�m C�c Th�c ��o",3,1},
		[31] = {57,"�i�m Th��ng s�n",3,1},
		[32] = {58,"V� Di s�n",3,1},
		[33] = {59,"Ph�c Ng�u s�n",3,1},
		[34] = {60,"L��ng S�n B�c",3,1},
		[35] = {61,"L��ng Th�y ��ng_1",4,1},
		[36] = {62,"L��ng Th�y ��ng_2",5,1},
		[37] = {63,"Kim Quang ��ng",3,1},
		[38] = {64,"Thanh Th�nh s�n",3,1},
		[39] = {65,"Phong Ma ��ng-1",4,1},
		[40] = {66,"Phong Ma ��ng-2",5,1},
		[41] = {67,"Y�n T� ��ng-1",3,1},
		[42] = {68,"Y�n T� ��ng-2",4,1},
		[43] = {69,"H�c Phong ��ng",3,1},
		[44] = {70,"Long H� ��ng-1",3,1},
		[45] = {71,"Long H� ��ng-2",4,1},
		[46] = {72,"Ph�ng Nh�n ��ng",3,1},
		[47] = {73,"B�ch Th�y ��ng-1",3,1},
		[48] = {74,"B�ch Th�y ��ng-2",4,1},
		[49] = {75,"��ng H�i H�i T�n 1",3,1},
		[50] = {76,"��ng H�i H�i T�n 2",4,1},
		[51] = {77,"Long Nh�n ��ng-1",6,1},
		[52] = {78,"Long Nh�n ��ng-2",7,1},
		[53] = {79,"Thi�n S� ��ng-1",5,1},
		[54] = {80,"Thi�n S� ��ng-2",6,1},
		[55] = {81,"Phong ��",6,1},
		[56] = {82,"��i Th�o Nguy�n 1",3,1},
		[57] = {83,"��i Th�o Nguy�n 2",4,1},
		[58] = {84,"B� l�c V��ng K�",4,1},
		[59] = {85,"��o Hoa ��o",5,1},
		[60] = {86,"Qu� M�n H�i Lang",7,1},
		[61] = {87,"Thanh �m ��ng_1",5,1},
		[62] = {88,"Thanh �m ��ng_2",6,1},
		[63] = {89,"T�y Song B�n N�p B�c ",5,1},
		[64] = {90,"T�y Song B�n N�p Nam ",6,1},
		[65] = {91,"Thi�n T�m th�p_1",6,1},
		[66] = {92,"Thi�n T�m th�p_2",7,1},
		[67] = {93,"Thi�n T�m th�p_3",8,1},
		[68] = {94,"V��ng M�u ��ng_1",6,1},
		[69] = {95,"V��ng M�u ��ng_2",7,1},
		[70] = {96,"V��ng M�u ��ng-3",8,1},
		[71] = {98,"Thi�n s� b� c�nh",8,1},
		[72] = {99,"B�c Ph�ng T��ng",4,1},
		[73] = {100,"Nam Ph�ng T��ng",4,1},
		[74] = {101,"Long M�n tr�n",5,1},
		[75] = {102,"Quang Minh ��nh",7,1},
		[76] = {103,"T�n L�ng",8,1},
		[77] = {104,"Ho�ng L�ng m� th�t t�ng 1",9,1},
		[78] = {105,"Ho�ng L�ng m� th�t t�ng 2",10,1},
		[79] = {106,"C� D��ng ��ng_1",8,1},
		[80] = {107,"C� D��ng ��ng_2",9,1},
		[81] = {108,"D��c V��ng c�c",9,1},
		[82] = {109,"D��c V��ng ��ng",10,1},
		[83] = {110,"M� cung sa m�c",10,1},
		[84] = {111,"Dao Ti�n ��ng",4,1},
	},
	[2] = 	--����ȥ���ɵ�ͼ
	{
		[0] = "Khu v�c m�n ph�i",
		[1] = {"NewWorld(204,1599,3182)","Thi�u L�m",5,0,1},
		[2] = {"NewWorld(312,1825,3323)","V� �ang",5,0,1},
		[3] = {"NewWorld(209,1547,3183)","C�i Bang",5,0,1},
		[4] = {"NewWorld(303,1645,3159)","Nga My",5,0,1},
		[5] = {"NewWorld(305,1598,2824)","���ng M�n",5,0,1},
		[6] = {"NewWorld(219,1538,3151)","D��ng M�n",5,0,1},
		[7] = {"NewWorld(407,1609,3193)","Ng� ��c",5,0,1},
		[8] = {"NewWorld(509,1424,3444)","C�n L�n",5,0,1},
		[9] = {"NewWorld(404,1484,2828)","Th�y Y�n",5,0,1},
	},
	[3] = 	--����ȥ����NPC��
	{
		[0] = "Ch� NPC th�nh th�",
		[1] = 
		{
			[0] = "Bi�n Kinh",
			[1] = {"NewWorld(200,1488,2953)","Th� kh� (��ng)",5,0},
			[2] = {"NewWorld(200,1296,2990)","Th� kh� (Nam)",5,0},
			[3] = {"NewWorld(200,1272,2774)","Th� kh� (T�y)",5,0},
			[4] = {"NewWorld(200,1183,2826)","D� T�u",5,0},
			[5] = {"NewWorld(200,1169,2845)","Th� Ti�u Nha",5,0},
			[6] = {"NewWorld(200,1360,2925)","Ch� th��ng h�i",5,0},
			[7] = {"NewWorld(200,1439,2956)","Th��ng nh�n T�y V�c",5,0},
			[8] = {"NewWorld(200,1482,2764)","L� quan",5,0},
			[9] = {"NewWorld(200,1392,2659)","B� ��u",5,0},
			[10] = {"NewWorld(200,1150,2850)","Th�n Du Ch�n Nh�n",5,0},
			[11] = {"NewWorld(200,1228,2761)","S� gi� T�ng Ki�m",5,0},
			[12] = {"NewWorld(200,1379,2870)","��i s� ho�t ��ng cu�i tu�n",5,0},
			[13] = {"NewWorld(200,1401,2663)","Tri�u Ph�",5,0},
			[14] = {"NewWorld(200,1392,2817)","Ch�n T� ��n",5,0},
		},
		[2] = 
		{
			[0] = "Th�nh ��",
			[1] = {"NewWorld(300,1682,3652)","Th� kh� (Nam)",5,0},
			[2] = {"NewWorld(300,1693,3460)","Th� kh� (T�y)",5,0},
			[3] = {"NewWorld(300,1925,3473)","Th� kh� (B�c)",5,0},
			[4] = {"NewWorld(300,1634,3549)","D� T�u",5,0},
			[5] = {"NewWorld(300,1653,3559)","Th� Ti�u Nha",5,0},
			[6] = {"NewWorld(300,1897,3492)","Ch� th��ng h�i",5,0},
			[7] = {"NewWorld(300,1794,3608)","Th��ng nh�n T�y V�c",5,0},
			[8] = {"NewWorld(300,1787,3497)","L� quan",5,0},
			[9] = {"NewWorld(300,1779,3473)","B� ��u",5,0},
			[10] = {"NewWorld(300,1974,3552)","Th�n Du Ch�n Nh�n",5,0},
			[11] = {"NewWorld(300,1776,3701)","S� gi� T�ng Ki�m",5,0},
			[12] = {"NewWorld(300,1742,3549)","��i s� c�ng th�nh",5,0},
			[13] = {"NewWorld(300,1728,3536)","Qu�n th�nh s�",5,0},
			[14] = {"NewWorld(300,1822,3378)","Ti�u s�",5,0},
			[15] = {"NewWorld(300,1840,3570)","Ch� l�i ��i",5,0},
			[16] = {"NewWorld(300,1959,3545)","Chu Thi�n Nh�n",5,0},
		},
		[3] = 
		{
			[0] = "Tuy�n Ch�u",
			[1] = {"NewWorld(100,1554,3075)","Th� kh� (��ng)",5,0},
			[2] = {"NewWorld(100,1387,2902)","Th� kh� (T�y)",5,0},
			[3] = {"NewWorld(100,1518,2869)","Th� kh� (B�c)",5,0},
			[4] = {"NewWorld(100,1447,2800)","D� T�u",5,0},
			[5] = {"NewWorld(100,1459,2811)","Th� Ti�u Nha",5,0},
			[6] = {"NewWorld(100,1537,2933)","Ch� th��ng h�i",5,0},
			[7] = {"NewWorld(100,1499,3059)","Th��ng nh�n T�y V�c",5,0},
			[8] = {"NewWorld(100,1512,2990)","L� quan",5,0},
			[9] = {"NewWorld(100,1519,2988)","B� ��u",5,0},
			[10] = {"NewWorld(100,1381,2857)","Th�n Du Ch�n Nh�n",5,0},
			[11] = {"NewWorld(100,1509,3107)","S� gi� T�ng Ki�m",5,0},
		},
		[4] = 
		{
			[0] = "D��ng Ch�u",
			[1] = {"NewWorld(150,1757,3178)","Th� kh� (��ng)",5,0},
			[2] = {"NewWorld(150,1614,3173)","Th� kh� (Nam)",5,0},
			[3] = {"NewWorld(150,1633,3052)","Th� kh� (T�y)",5,0},
			[4] = {"NewWorld(150,1727,3073)","Th� kh� (B�c)",5,0},
			[5] = {"NewWorld(150,1680,3118)","Th� Ti�u Nha",5,0},
			[6] = {"NewWorld(150,1635,3139)","Ch� th��ng h�i",5,0},
			[7] = {"NewWorld(150,1653,3109)","Th��ng nh�n T�y V�c",5,0},
			[8] = {"NewWorld(150,1738,3158)","B� ��u",5,0},
			[9] = {"NewWorld(150,1744,3121)","S� gi� T�ng Ki�m",5,0},
			[10] = {"NewWorld(150,1713,3137)","��i s� ho�t ��ng cu�i tu�n",5,0},
			[11] = {"NewWorld(150,1680,3161)","Ch� huy s�",5,0},
			[12] = {"NewWorld(150,1650,3174)","T� Quang C�c L�o Nh�n",5,0},
			[13] = {"NewWorld(150,1600,3136)","B� mai",5,0},
			[14] = {"NewWorld(150,1588,3143)","X�o n�",5,0},
			[15] = {"NewWorld(150,1711,3046)","S� gi� h�n l�",5,0},
			[16] = {"NewWorld(150,1701,3170)","��c s� V� L�m",5,0},
		},
		[5] = 
		{
			[0] = "T��ng D��ng",
			[1] = {"NewWorld(350,1387,3065)","Th� kh� (Nam)",5,0},
			[2] = {"NewWorld(350,1359,2869)","Th� kh� (T�y)",5,0},
			[3] = {"NewWorld(350,1532,2861)","Th� kh� (B�c)",5,0},
			[4] = {"NewWorld(350,1436,2808)","Th� Ti�u Nha",5,0},
			[5] = {"NewWorld(350,1455,2924)","Ch� th��ng h�i",5,0},
			[6] = {"NewWorld(350,1497,2882)","Th��ng nh�n T�y V�c",5,0},
			[7] = {"NewWorld(350,1506,2997)","B� ��u",5,0},
			[8] = {"NewWorld(350,1394,2850)","S� gi� T�ng Ki�m",5,0},
			[9] = {"NewWorld(350,1452,2968)","��i s� ho�t ��ng cu�i tu�n",5,0},
			[10] = {"NewWorld(350,1503,3023)","Ch� huy s�",5,0},
			[11] = {"NewWorld(350,1415,2930)","Th� r�n L�u",5,0},
			[12] = {"NewWorld(350,1345,2924)","M�c Tam",5,0},
			[13] = {"NewWorld(350,1433,2769)","Minh Ch� Kim S�n",5,0},
		},
		[6] = 
		{
			[0] = "��i L�",
			[1] = {"NewWorld(400,1528,3111)","Th� kh� (��ng)",5,0},
			[2] = {"NewWorld(400,1455,3070)","Th� kh� (Nam)",5,0},
			[3] = {"NewWorld(400,1553,2912)","Th� kh� (B�c)",5,0},
			[4] = {"NewWorld(400,1485,3018)","Th� Ti�u Nha",5,0},
			[5] = {"NewWorld(400,1486,2924)","Ch� th��ng h�i",5,0},
			[6] = {"NewWorld(400,1428,3005)","Th��ng nh�n T�y V�c",5,0},
			[7] = {"NewWorld(400,1506,2847)","L� quan",5,0},
		},
		[7] = 
		{
			[0] = "Ph�ng T��ng",
			[1] = {"NewWorld(500,1795,3216)","Th� kh� (��ng)",5,0},		
			[2] = {"NewWorld(500,1656,3215)","Th� kh� (Nam)",5,0},
			[3] = {"NewWorld(500,1677,3095)","Th� kh� (T�y)",5,0},
			[4] = {"NewWorld(500,1827,3049)","Th� kh� (B�c)",5,0},
			[5] = {"NewWorld(500,1771,3186)","Ch� th��ng h�i",5,0},
			[6] = {"NewWorld(500,1893,3113)","B� ��u",5,0},
			[7] = {"NewWorld(500,1762,3127)","Th� t�ng qu�n",5,0},
			[8] = {"NewWorld(500,1640,3183)","Long Quang Ch�n Nh�n",5,0},
		},		
	},
	[4] = 	--����ȥ����ɼ�����ʦ����
	{
		[0] = "K� n�ng thu th�p n�i s� ph�",
		[1] = {"NewWorld(300,1836,3430)","Th�nh �� ��i Kho�ng C�ng (��o kho�ng)",3,0},
		[2] = {"NewWorld(300,1848,3493)","Th�nh �� Ho�ng ��i Th�m (K�o t�)",3,0},
		[3] = {"NewWorld(200,1220,2909)","Bi�n Kinh L�u Nh�t Ph� (��n g�)",3,0},
		[4] = {"NewWorld(200,1347,3029)","Bi�n Kinh th� s�n Tr��ng (Thu�c da)",3,0},
		[5] = {"NewWorld(100,1393,2969)","Tuy�n Ch�u M�c Qu�n ��o tr��ng (T�p linh)",3,0},
		[6] = {"NewWorld(100,1555,2961)","Tuy�n Ch�u L�m D��c S� (H�i thu�c)",3,0},
		[7] = {"NewWorld(100,1603,2968)","Tuy�n Ch�u L� Phong Thu (Canh t�c)",3,0},
	},
	[5] = 	--������Ϸ���ܵ�ͼ
	{
		[0] = "Ch� b�o danh ch�c n�ng game",
		[1] = 
			{
				[0] = "Khu v�c ho�t ��ng c�a S�t Th� ���ng",
				[1] = {97,"Ph�n �� s�t th� ���ng",10,1},
			},
		[2] = 
			{
				[0] = "M�t th�t s� m�n",
				[1] = {"NewWorld(204,1644,3270)","Thi�u L�m Huy�n Kh�ng",5,0},
				[2] = {"NewWorld(305,1674,2936)","���ng M�n ���ng T� M�c",5,0},
				[3] = {"NewWorld(303,1715,3059)","Nga My Tu� V�n S� Th�i",5,0},
				[4] = {"NewWorld(209,1530,3209)","C�i Bang B�ng L� V�ng",5,0},
				[5] = {"NewWorld(312,1871,3276)","V� �ang Ti�t V�n Tranh",5,0},
				[6] = {"NewWorld(219,1542,2939)","D��ng M�n D��ng Di�n Chi�u",5,0},
				[7] = {"NewWorld(407,1572,3160)","Ng� ��c C�u S�ch",5,0},
				[8] = {"NewWorld(509,1539,3230)","C�n L�n  Tr�n B�t Vi",5,0},
				[9] = {"NewWorld(404,1539,2698)","Th�y Y�n  L�u Thanh Mi",5,0},
		},
		[3] = 
			{
				[0] = "Chi�n tr��ng T�ng Li�u",
				[1] = {"NewWorld(200,1291,2873)","Tri�u Di�n Ni�n (b�o danh Nh�n M�n quan-T�ng) ",5,0},
				[2] = {"NewWorld(200,1301,2793)","Ti�u Vi�n L�u (b�o danh Nh�n M�n quan-Li�u)",5,0},
				[3] = {"NewWorld(500,1830,3144)","D��ng Hi�t (Ng�c M�n quan b�o danh_T�ng)",5,0},
				[4] = {"NewWorld(500,1710,3238)","T�n Thi�n T�n (b�o danh Ng�c m�n quan-Li�u)",5,0},
				[5] = {"NewWorld(808,1645,3180)","Chi�u m� s�-Li�u",5,0},
				[6] = {"NewWorld(808,1735,3074)","Chi�u m� s�-T�ng",5,0},
				[7] = {"NewWorld(806,1643,3180)","Chi�u m� s�-Li�u",5,0},
				[8] = {"NewWorld(806,1733,3073)","Chi�u m� s�-T�ng",5,0},
			},
		[4] =
			{ 
				[0] = "D� th�m T�y V�c",
				[1] = {"NewWorld(500,1762,3147)","M�t th�m ��i T�ng T�y V�c (m�t th�m T�y V�c)",5,0},
				[2] = {"NewWorld(512,2052,3416)","�� t� C�n L�n (m�t ��ng C� D��ng)",10,1},
				[3] = {"NewWorld(513,1595,3190)","Th� M� Nh�n (m�t ��o Ho�ng l�ng)",10,1},
				[4] = {"NewWorld(510,1574,2867)","D��c th�t th� v� (Luy�n ��n ��ng)",10,1},
				[5] = {"NewWorld(514,1725,2873)","Th� M� T��ng Qu�n (m�t th�t Ho�ng l�ng)",10,1},
				[6] = {"NewWorld(506,1316,2726)","Ng� H�nh Tr�n S� (Ng� H�nh Tr�n)",10,1},
				[7] = {"NewWorld(506,1544,2668)","B�ch Thi�n Th�nh (T�n c�ng sa m�c)",10,1},
				[8] = {"NewWorld(507,1651,3304)","Ti�u Nh� (y�n ti�c Long M�n)",5,1},
			},
		[5] = 
			{
				[0] = "B�n �� nhi�m v�",
				[1] = {"NewWorld(502,1637,3237)","Hoa S�n",4,0},
				[2] = {"NewWorld(6016,1499,3094)","Mai Trang",4,1},
				[3] = {"NewWorld(6024,1652,3093)","Thi�t Ch��ng S�n Trang",4,1},
				[4] = {"NewWorld(6025,1699,3397)","Th�n �i�n",4,1},
			},
	},
}

FLIGHTPOSTASKID_BEGIN = 90
FLIGHTPOSTASKID_1 = 90
FLIGHTPOSTASKID_2 = 91
FLIGHTPOSTASKID_3 = 92
FLIGHTPOSTASKID_4 = 93
FLIGHTPOSTASKID_5 = 94
FLIGHTPOSTASKID_END = 94

Tb_map_caiji = {704,705,706,707,710,711,712,713,714,715,716,717,718,719,720,721,722,723,724,6024,6025}
-- ʹ����Ʒ��ʱ��Ĭ�ϵ���ں���
function OnUse(nIdx)
--	if GetFightState() == 1 and GetPKFlag() ~= 0 then	--ս��״̬��PKģʽ������ʹ��
--		Talk(1,"","��ս��״̬�£�Ҫ������Ϊ����ģʽ����ʹ�����б��䡣");
--		return 0;
--	end;
	local nMapID = GetWorldPos()
	local caji_map_chk_flag = 0
	for i = 1, getn(Tb_map_caiji) do
		if nMapID == Tb_map_caiji[i] then
			caji_map_chk_flag = 1
			break
		end
	end
	if nMapID == 606 or nMapID == 101 or (nMapID >= 700 and caji_map_chk_flag == 0) then
		Talk(1,"","Khu v�c n�y kh�ng th� d�ng Th�n H�nh b�o �i�n.");
		return 0;
	end;
	
	if 	GetPKFlag() ~= 0 then
		Talk(1,"","Luy�n c�ng m�i c� th� d�ng th�n h�nh b�o �i�n")
		return 0
	end
	
	local nScrollIndex = tonumber(nIdx)		-- ��ʹ�õ����б����Index
	
	local nleft = AbradeItem(nScrollIndex, 0)
	if (nleft == 0) then
		Say("�� b�n Th�n H�nh b�o �i�n c�a b�n l� 0, tan r� th�nh t�ng m�nh!", 0)
		DelItemByIndex(nScrollIndex, 0)					-- �;�Ϊ0Ҫɾ������Ʒ
	end
	local selTab = {};
	tinsert(selTab,"Ta mu�n t�i 1 v�i n�i m� ta �i g�n ��y/#flight_recently("..nScrollIndex..")");
	for i=1,getn(TB_DES_INFO) do
		tinsert(selTab,"Ta mu�n �i"..format(TB_DES_INFO[i][0].."/#list_destination(%d,%d)",nScrollIndex,i));
	end;
	tinsert(selTab,"T�m th�i ch�a s� d�ng!/cancel_dialog");
	Say("B�n mu�n d�ng Th�n H�nh b�o �i�n ��n ��u?",getn(selTab),selTab);
end;

function list_destination(nScrollIndex,...)
	local tbDes = TB_DES_INFO;
	for i=1,getn(arg) do
		tbDes = tbDes[arg[i]];
	end;
	local nArgSize = arg.n;
	local szCmdStr = "";
	if type(tbDes[1][1]) == "table" then	--��������һ��
		local selTab = {};
		for i=1,getn(tbDes) do
			arg[nArgSize+1] = i;
			arg.n = nArgSize+1;
			szCmdStr = tbDes[i][0]..get_cmd_string("list_destination",nScrollIndex,gf_UnPack(arg));
			tinsert(selTab,szCmdStr);
		end;
		tinsert(selTab,"Quay v� trang trang ��i tho�i/#OnUse("..nScrollIndex..")")
		tinsert(selTab,"T�m th�i ch�a s� d�ng!/cancel_dialog");
		Say("Ng��i mu�n �i ��u?",getn(selTab),selTab);
	else
		list_page(1,nScrollIndex,gf_UnPack(arg))
	end;
end;

function gf_UnPack(tbTable,nStartIdx,nEndIdx)
	local nSize = getn(tbTable);
	nStartIdx = nStartIdx or 1;
	nEndIdx = nEndIdx or nSize;
	if tbTable[nStartIdx] and nStartIdx <= nEndIdx then
		return tbTable[nStartIdx],gf_UnPack(tbTable,nStartIdx+1,nEndIdx);
	end;
end;

MAX_SEL_PER_PAGE = 7;	--һҳ������ʾ����

function list_page(nPageNum,nScrollIndex,...)
	local tbDesTab = get_destination_list(nScrollIndex,gf_UnPack(arg));
	local nRecordCount = getn(tbDesTab);
	local GetMaxItemCountPerPage = function(nPN,nRC)	--���������������õ�ǰҳ���������ʾ��Ŀ����
		local nCount = nRC-(nPN-1)*MAX_SEL_PER_PAGE;
		if nCount >= MAX_SEL_PER_PAGE then
			return MAX_SEL_PER_PAGE
		else
			return mod(nCount,MAX_SEL_PER_PAGE);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nRecordCount);
	local nCurStartIndex = (nPageNum-1)*MAX_SEL_PER_PAGE+1;
	local selTab = {};
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbDesTab[i]);
	end;
	local szCmdStr = "";
	if nPageNum ~= 1 then
		szCmdStr = "Trang tr��c"..get_cmd_string("list_page",nPageNum-1,nScrollIndex,gf_UnPack(arg));
		tinsert(selTab,szCmdStr);
	end;
	if nPageNum ~= ceil(nRecordCount/MAX_SEL_PER_PAGE) then
		szCmdStr = "Trang k�"..get_cmd_string("list_page",nPageNum+1,nScrollIndex,gf_UnPack(arg));
		tinsert(selTab,szCmdStr);	
	end;
	tinsert(selTab,"Quay v� trang trang ��i tho�i/#OnUse("..nScrollIndex..")")
	tinsert(selTab,"T�m th�i ch�a s� d�ng!/cancel_dialog");
	local nMaxPage = ceil(getn(tbDesTab)/MAX_SEL_PER_PAGE);
	Say("Ng��i mu�n ��n n�i n�o? Hi�n l� trang <color=yellow>"..nPageNum.."<color>, t�ng c�ng <color=yellow>"..nMaxPage.."<color> trang.",getn(selTab),selTab);
end;

function get_destination_list(nScrollIndex,...)
	if IsPlayerDeath() == 1 or IsStalling() == 1 then
		Talk(1,"","Tr�ng th�i hi�n t�i kh�ng th� s� d�ng th�n h�nh.")
		return 0
	end
	local tSelTab = {};
	local tbDes = TB_DES_INFO;
	for i=1,getn(arg) do
		tbDes = tbDes[arg[i]];
	end;
	local nArgSize = arg.n;
	local szCmdStr = "";
	for i=1,getn(tbDes) do
		arg[nArgSize+1] = i;
		arg.n = nArgSize+1;
		szCmdStr = tbDes[i][2].."(ti�u hao �� b�n "..tbDes[i][3].." �i�m)"..get_cmd_string("go_to_destination",nScrollIndex,gf_UnPack(arg));
		tinsert(tSelTab,szCmdStr);
	end;
	return tSelTab;
end;

function go_to_destination(nScrollIndex,...)
	if IsPlayerDeath() == 1 or IsStalling() == 1 then
		Talk(1,"","Tr�ng th�i hi�n t�i kh�ng th� s� d�ng th�n h�nh.")
		return 0
	end
	
	if 	GetPKFlag() ~= 0 then
		Talk(1,"","Luy�n c�ng m�i c� th� d�ng th�n h�nh b�o �i�n")
		return 0
	end
	
	local tbDes = TB_DES_INFO;
	for i=1,getn(arg) do
		tbDes = tbDes[arg[i]];
	end;
	local nCost = tbDes[3];
	local nFightState = tbDes[4];
	CleanInteractive();
	if type(tbDes[1]) == "string" then
		dostring(tbDes[1]);
		AbradeItem(nScrollIndex, nCost);
		SetFightState(nFightState);
	elseif type(tbDes[1]) == "number" then
		AbradeItem(nScrollIndex, nCost);
		UseFlightList(tbDes[1],nScrollIndex,nCost);
	end;
	set_recently_pos(arg)
	Msg2Player("Ti�u hao �� b�n"..nCost.." �i�m");
end;

-- ȥ�����һЩ�ط�
function flight_recently(nScrollIndex)
	local tbPosInfo = {};
	for i=FLIGHTPOSTASKID_BEGIN,FLIGHTPOSTASKID_END do
		tinsert(tbPosInfo,GetTask(i));
	end;
	if GetTask(FLIGHTPOSTASKID_BEGIN) == 0 then
		Talk(1,"#OnUse("..nScrollIndex..")","G�n ��y ng��i kh�ng d�ng Th�n h�nh b�o �i�n sao.");
		return 0;
	end;
	local selTab = {};
	local tbDes = {};
	local tbIndex = {};
	for i=1,getn(tbPosInfo) do
		tbIndex = get_pos_index(tbPosInfo[i]);
		local szPlaceHeader = "";
		if getn(tbIndex) >= 2 then	--�ɵ�����getn(tbIndex) == 1
			tbDes = TB_DES_INFO;
			for j=1,getn(tbIndex) do
				tbDes = tbDes[tbIndex[j]];
				--���tbDes��nil����ô���п��������������ֵ������
				if tbDes ~= nil and tbDes[0] ~= nil then
					szPlaceHeader = szPlaceHeader..tbDes[0].."--";
				end;
			end;
			if tbDes ~= nil then	--�����nilֵ������
				szCmdStr = szPlaceHeader..tbDes[2].."(ti�u hao �� b�n "..tbDes[3].." �i�m)"..get_cmd_string("go_to_destination",nScrollIndex,gf_UnPack(tbIndex));
				tinsert(selTab,szCmdStr);
			end;
		end;
	end;
	tinsert(selTab,"\nTr� v� khung ��i tho�i ch�nh/#OnUse("..nScrollIndex..")")
	tinsert(selTab,"T�m th�i ch�a s� d�ng!/cancel_dialog");
	Say("Xin ch�n ��a �i�m mu�n ��n:",getn(selTab),selTab);
end;
--��������������λ�õ�����
function get_pos_index(nTaskValue)
	local tbRet = {};
	local nIndex1 = mod(nTaskValue,1000);
	local nIndex2 = floor(mod(nTaskValue,100000)/1000);
	local nIndex3 = floor(nTaskValue/100000);
	local tb = {nIndex3,nIndex2,nIndex1};
	for i=1,getn(tb) do
		if tb[i] ~= 0 then
			tinsert(tbRet,tb[i]);
		end;
	end;
	return tbRet;
end;
--����λ����Ϣֵ
function generate_pos_index_value(tbPos)
	local nRetValue = 0;
	if getn(tbPos) == 2 then
		nRetValue = tbPos[1]*1000+tbPos[2];
	else
		nRetValue = tbPos[1]*100000+tbPos[2]*1000+tbPos[3];
	end;
	return nRetValue;
end;
-- �������ȥ���ĵط�
function set_recently_pos(tbPos)
	local nPosTskValue = generate_pos_index_value(tbPos);
	for i=FLIGHTPOSTASKID_BEGIN,FLIGHTPOSTASKID_END do	--����������
		if GetTask(i) == nPosTskValue then
			for j=i,FLIGHTPOSTASKID_BEGIN+1,-1 do	--��ǰ��������
				SetTask(j,GetTask(j-1));
			end;
			SetTask(FLIGHTPOSTASKID_BEGIN,nPosTskValue);
			return 1;
		end;
	end;
	for i=FLIGHTPOSTASKID_END,FLIGHTPOSTASKID_BEGIN+1,-1 do	--�Ӻ���ǰ����
		SetTask(i,GetTask(i-1));
	end;
	SetTask(FLIGHTPOSTASKID_BEGIN,nPosTskValue);
	return 1;
end;

function get_cmd_string(szCallBackFunc,...)
	local szCmdStr = "";
	szCmdStr = "/#"..szCallBackFunc.."(";
	for i=1,getn(arg) do
		szCmdStr = szCmdStr.."%d,"
	end;
	szCmdStr = strsub(szCmdStr,1,strlen(szCmdStr)-1);
	szCmdStr = szCmdStr..")";	--��������Ǹ����Ż���������
	szCmdStr = format(szCmdStr,gf_UnPack(arg));
	return szCmdStr;
end;

function cancel_dialog()
end;


