--08����ͷ�ļ��ű�
--by vivi
--2007/11/12

--�������
TASK_IS_PLANT = 1450; --��¼�Ƿ����ʥ����
TASK_PLANT_TIME = 1451; --��¼����ʥ������ʱ��
TASK_CHRIMS_TREE_IDX = 1452; --��¼ʥ����������
TASK_IS_STREW = 1453; --�Ƿ������װ������
TASK_TREE_NUM = 1454; --���װ��ʥ���������������0Ϊû�н�����
TASK_TABLE_IDX = 1455; --��¼��ӦtStrewTask�������
TASK_STEP_AWARD = 1456;--��10�ֽ�ʹ�� ��¼�Ƿ���ȡ�ֽ׶�����ʥ��������Ʒ
TASK_FINAL_AWARD = 1457;--��¼�Ƿ�ȡ�����ս���
TASK_GET_TREE = 1458; --����ʿ���Ƿ���ȡ��ʥ����
TASK_SHARP_IDX = 1459;--��¼ģ��������ӦtTreeNpc��
TASK_PLANT_NUM = 1460; --��¼һ�����˼���������ʽΪ��2007122400 ����λΪ����
TASK_BAI_DATE = 1461; --��¼��ʦ�����ڣ�ÿ���һ��
TASK_TAIYI_TUPU = 584; --99������̫��ͼ��һ��

--���ڻ
TASK_WIND_ID = 1462; --�Ƿ�����˷�ý����
TASK_WIND_FINISH = 1463; --��ɱ�־
TASK_WIND_POS = 1464; --��ý�������ڵص�
TASK_WIND_STEP = 1465; --��ý������еĲ���
TASK_WIND_RAND = 1466; --�����Ƿ��¼��
TASK_WIND_DATE = 1467; --ÿ��ֻ����һ�η�ý����
TASK_BATTLE_AWARD = 1468; --��¼�����Ƿ���ȡ����ս���Ľ���
TASK_WIND_TABLE_IDX = 1469; --��¼��ǰҪ�ҵ�npc��tWindNpc���������
TASK_WIND_NUM = 1470;   --��¼��ɹ����ٴΰ����������ڰ���������
TASK_DASAN_NUM = 1471;  --��¼���������Ӵ���ɢ����װ���Ĵ���
TASK_BAGUA_GOLD = 1472; --��¼���������Ӵ���ɢ����װ�����ѵĽ�Ǯ ��λ��ͭ
TASK_BAGUA_BUCHANG = 1473; --���������Ӵ���ȡ�Ĳ�������
TASK_BUCHANG_GOLD = 1474; --��¼���������Ӵ���ȡ�˶��ٲ���
TASK_TONGQI_AWARD = 1475; --һ��ͭ����Ƭ��ȡ�����Ĵ�������
TASK_QTD_AWARD = 1476; --�ļ���ͭ����ȡ�����Ĵ�������
TASK_HONGBAO_DATE = 1478; --��¼�����Ƿ���ȡ�����
TASK_CHUWUXIANG_JIAYE = 1479;--��¼�Ƿ���Ѽӹ�������ҳ��

--TASK_GET_DRINK = 1467; --��¼�����Ƿ���ȡ��Ӣ�۾�
--TASK_HERO_DRINK = 1468; --��¼�����Ƿ�ȹ�Ӣ�۾�
--TASK_DRINK_TIME = 1469; --��¼����ȾƵ�ʱ��
--TASK_HERO_IDX = 1470; --��¼�ӳ�������
--TASK_DRINK_IDX = 1471; --��¼��ϯNPC������

--��ͼ����
MAP_WIND_TIME = 4; --��¼��ý����
MAP_WIND_RAND = 5; --��ý�������а�
MAP_HONGBAO_NUM = 6; --��¼��������

--������ID
WIND_TRIGGER_ID = 700; --��ý�Ի�npc������
QUANBEI_ENTER_TRIGGER_ID = 701; --Ȫ��pk������
QUANBEI_LEAVE_TRIGGER_ID =702;
DIAOLUO_QINGTONG_ID = 703;--������ͭID������
ENTER_RECT_ID = 200; --����id
LEAVE_RECT_ID = 201; 
QINGTONG_KILL_ID = 110;
--HERO_TRIGGER_TIME_ONE = 701; --Ӣ�۾�ʱ�䴥����
--HERO_TRIGGER_TIME_TWO = 702; --��������ǰ��ʱ�䴥����

--HERO_TIME_ID = 500; --time����id 30s����һ��ת���飨ʵ����28s��
--HERO_NPC_ID = 501; --time����id ÿ�������50%���ʴ���npc���֣�ʵ����294s��

--ȫ�ֳ���
PLANT_LIFE_TIME = 1800; --ʥ����npc����ʱ�� ��λ��s
STREW_TREE_TOTAL = 10; --װ��ʥ����������
PLANT_TREE_NUM = 2; --һ�����ֶ��ٿ���
WIND_STEP_TOTAL = 15; --��ý�����ܵĶԻ�����
DASAN_TOTAL_NUM = 3; --��Ѵ�ɢ�Ĵ���
HONGBAO_TOTAL_NUM = 50; --�����ܵ�����

--DRINK_LIFE_TIME = 720; --��ϯ����ʱ�䣬��λ��s
--DRINK_NPC_TIME = 120; --����ǰ������ʱ�䣬��λ��s
--DRINK_GIVE_EXP = 100000; --����һ��ת�����ϵ���������Ϊֱ�Ӹ��裩

tTreeNpc = {--ģ���� npc�� ����1��ʾû��װ�ε�ʱ��
	[1] = {{"C�y Gi�ng sinh 1d","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 2d","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 1d","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 4d","C�y th�ng gi�o h�i"}},
	[2] = {{"C�y Gi�ng sinh 1d","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 2d","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 1d","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 4d","C�y th�ng gi�o h�i"}},
	[3] = {{"C�y Gi�ng sinh 1d","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 2d","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 1d","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 4d","C�y th�ng gi�o h�i"}},
	[4] = {{"C�y Gi�ng sinh 1d","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 2d","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 1d","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 4d","C�y th�ng gi�o h�i"}},
	[5] = {{"C�y Gi�ng sinh 1c","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 2c","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 1c","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 4c","C�y th�ng gi�o h�i"}},
	[6] = {{"C�y Gi�ng sinh 1c","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 2c","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 1c","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 4c","C�y th�ng gi�o h�i"}},
	[7] = {{"C�y Gi�ng sinh 1c","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 2c","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 1c","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 4c","C�y th�ng gi�o h�i"}},
	[8] = {{"C�y Gi�ng sinh 1b","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 2b","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 1b","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 4b","C�y th�ng gi�o h�i"}},
	[9] = {{"C�y Gi�ng sinh 1b","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 2b","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 1b","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 4b","C�y th�ng gi�o h�i"}},
	[10] = {{"C�y Gi�ng sinh 1b","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 2b","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 1b","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 4b","C�y th�ng gi�o h�i"}},
	[11] = {{"C�y Gi�ng sinh 1a","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 2a","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 1a","C�y th�ng gi�o h�i"},{"C�y Gi�ng sinh 4a","C�y th�ng gi�o h�i"}}
	}; 

--װ������ 
tStrewTask = { --��Ҫ���� ��Ʒ�� ��Ʒid ��ͼ�� ������
{20,"�u�i th�",2,1,2," ngo�i th�nh","Th� r�ng"},
{20,"M�u ��n",2,1,76,"H�c Phong ��ng","H�c Phong Ki�m Kh�ch"},
{20,"Di�n Sa",2,1,1400,"B�c Ph�ng T��ng","Y�u c� Ba T�"},
{20,"Da H�a H�",2,1,1404,"C� D��ng ��ng_2","X�ch Luy�n H�a H�"},
{20,"Thi�t Ban Ch�",2,1,10,"���ng M�n","B�ch Nh�t Ti�n"},
{20,"V�n L� th�ch",2,1,9,"C�i Bang ho�c D� Tr� Th�n","Tr�m v�t"},
{20,"H�u Nhi Qu�",2,1,16,"Nga My","M� H�u"},
{20,"L�ng c�o",2,1,155,"Long Tuy�n Th�n","H� Ly"}, 
{20,"Huy�t Nha v�",2,1,285,"B�ch Th�y ��ng-2","�c L�"},
{20,"H� v�",2,1,19,"Thi�u L�m ho�c Linh B�o S�n","H�"},
{20,"�t M�c B�i",2,1,33,"� M�ng B�","Thi�u n� � M�ng B�, � M�ng T�c Nh�n"},
{20,"Thi�t Xoa",2,1,47,"Linh B�o s�n","Li�p H�"},
{20,"G�m lam",2,1,15,"Nga Mi ho�c Tr�c T� ��ng","N� Ki�m Kh�ch, N� Ki�m Hi�p"},
{20,"B�o B�nh",2,1,29,"M� Tuy�t S�n Trang ho�cTh�t Tinh ��ng t�ng 1","M� Tuy�t Th��ng Kh�c, Danh Th��ng hi�p"},
{20,"Tr�ng chim",2,1,28,"Th�t Tinh ��ng t�ng 1 ho�c Thanh th�nh S�n ho�c Giang T�n Th�n","Qu� �en"},
{20,"Ly Tr�ng L�n Phi�n",2,1,1416,"C� D��ng ��ng_2","Li�t Nhan Li Long"},
{20,"Thanh Long V�n K�nh",2,1,1407,"Ho�ng L�ng m� th�t t�ng 1","��ng t��ng"}, 
{20,"Gi�p M�c B�i",2,1,25,"B�ng T�m ��ng_1","Linh H�"},
{20,"H�p trang s�c",2,1,57,"Th�t Tinh ��ng-2","N� Ki�m h�o"},
{20,"Kim Thoa",2,1,41,"Ki�m C�c Th�c ��o","�ao Tuy�t"},
{20,"Mi�ng ��ng",2,1,42,"Thi�u L�m m�t th�t-2","��ng nh�n"},
{20,"Mao Ng�u b�",2,1,287,"Mi�u L�nh","Mao Ng�u"},
{20,"T�u B�i",2,1,44,"D��ng Trung ��ng-3","�ao V��ng"},
{20,"Di T�c Chung",2,1,53,"Kim Quang ��ng","Huy�n V� �ao"},
{20,"D� T�c Qu�i Li�n",2,1,164,"V�n M�ng Tr�ch","Xi H�a �ao Kh�ch"},
{20,"B�nh M�c B�i",2,1,46,"Nh� Long s�n","Cung Li�p"},
{20,"Ng�n H� ��n",2,1,167,"V� Di s�n","Ng�n H�"},
{20,"Ho�ng Kim Ban Ch�",2,1,69,"Ph�c Ng�u S�n, Nh�n M�n quan ","Li�u ti�n binh"},
{20,"D� M�c B�i",2,1,66,"Nh�n M�n quan","T�ng n� binh"},
{20,"L�c Ph�ch",2,1,62,"Tr�c Ty ��ng-2","Thi�n S�t"},
{20,"M�u M�c B�i",2,1,64,"Nh�n M�n quan ho�c Ki�m M�n Quan ho�c L��ng S�n B�c","T�ng qu�n t� s�"},
{20,"da Th��ng Vi�n",2,1,166,"V� Di s�n","Th��ng Vi�n"},
{20,"T� Ph�t Ban Ch�",2,1,94,"Ph�c Ng�u s�n","T� T�ng"},
{20,"Tuy�t Ph�ch",2,1,45,"B�ng T�m ��ng_2","B�ng Qu�i"},
{1,"�inh M�c B�i",2,1,59,"Thi�u L�m m�t th�t-1","C� quan M�c nh�n"},
{20,"Kh�n tay",2,1,289,"Y�n T� ��ng t�ng 1 ho�c Y�n T� ��ng t�ng 2","Mi�u L�nh Phu nh�n"},
{20,"B�ch Ng� L�n",2,1,170,"��ng H�i H�i T�n 1","��ng H�i Th�y T�c"},
{20,"V� nhung",2,1,291,"Ph�ng Nh�n ��ng","B�ch ��u �i�u"},
{20,"Qu� M�c B�i",2,1,85,"Thi�n S� ��ng-1","Th� Qu�i"},
{20,"Da h�",2,1,292,"Ph�ng Nh�n ��ng","T� D� H�"},
{20,"M�u ��n",2,1,76,"H�c Phong ��ng","H�c Phong Ki�m Kh�ch"},
{20,"Ch� Nam Ng�",2,1,96,"Long H� ��ng-1","L�u Kh�u"},
{1,"Th� gi�ng sinh-H�nh ph�c",2,1,3390,"M�i ng�y l�m "," nhi�m v� s� m�n v�ng 2"},
{1,"Th� gi�ng sinh-Vui m�ng",2,1,3391,"M�i ng�y l�m "," nhi�m v� s� m�n v�ng 2"},
{1,"Th� gi�ng sinh-Vui v�",2,1,3392,"M�i ng�y l�m "," nhi�m v� s� m�n v�ng 2"},
{1,"Th� gi�ng sinh-B�n b�",2,1,3393,"M�i ng�y l�m "," nhi�m v� s� m�n v�ng 2"},
{1,"Th� gi�ng sinh-May m�n",2,1,3394,"M�i ng�y l�m "," nhi�m v� s� m�n v�ng 2"},
{1,"Th� gi�ng sinh-Nh� �",2,1,3395,"M�i ng�y l�m "," nhi�m v� s� m�n v�ng 2"},
{1,"Th� gi�ng sinh-Thanh v�n",2,1,3396,"M�i ng�y l�m "," nhi�m v� s� m�n v�ng 2"},
{1,"Th� gi�ng sinh-Th�n t�i",2,1,3397,"M�i ng�y l�m "," nhi�m v� s� m�n v�ng 2"},
{1,"Th� gi�ng sinh-Kh�e m�nh",2,1,3398,"M�i ng�y l�m "," nhi�m v� s� m�n v�ng 2"},
{1,"Th� gi�ng sinh-C� nh�",2,1,3399,"M�i ng�y l�m "," nhi�m v� s� m�n v�ng 2"}
};
	
tWindNpc = {--Ȫ�� ���� �꾩 �ɶ� ���� ����
	[100]={"Tuy�n Ch�u",{"D� T�u","Ch� Ti�m v� kh�","Ch� D��c �i�m","Ch� T�p h�a","Ch� Ti�m Nam ph�c","Ch� Ti�m N� ph�c","Ch� Kim ho�n","Ch� ti�n trang","Th� kh�","Xa phu","Qu�n l� c�a hi�u","L�m D��c S�","L� Phong Thu","Ch� l�i ��i","Ch� huy s�","S� gi� bang ph�i","L� quan","B� ��u","H�nh C��c Th��ng Nh�n","S� gi� T�ng Ki�m","Ch� th��ng h�i","V� s�","Ti�u ��ng","��i Ch� C��ng","Th�i th� ","V� binh th�nh m�n","La Sa","V��ng Nghi�p V�","Ti�u s�","Nha d�ch","Uy Nh� T�n","H� Ki�t","Chung Ph�ng","Ch� t�u l�u","B�ch Hi�u Sinh","Chu B�n C�"},
								{2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2018,2019,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,}},
	[150]={"D��ng Ch�u",{"Ch� Ti�m v� kh�","Ch� D��c �i�m","Ch� T�p h�a","Ch� Ti�m Nam ph�c","Ch� Ti�m N� ph�c","Ch� Kim ho�n","Ch� ti�n trang","Th� kh�","Xa phu","Ch� th��ng h�i","Ch�n T� ��n","Ch� huy s�","B� ��u","S� gi� T�ng Ki�m","Ch� l�i ��i","H�nh C��c Th��ng Nh�n","L� Ti�n D�ng","H� H�u C�m","Tr��ng B� H�n","Thu Dung","Ch� t�u l�u","H� H�u Anh","H� H�u Li�n","L�u Huy�n Thanh","M�nh Nham ","Ph�ng ��ng Nhi","Tr�n M�n","T��ng Duy"},
								{2041,2042,2043,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068}},
	[200]={"Bi�n Kinh",{"D� T�u","Ch� Ti�m v� kh�","Ch� D��c �i�m","Ch� T�p h�a","Ch� Ti�m Nam ph�c","Ch� Ti�m N� ph�c","Ch� Kim ho�n","Ch� ti�n trang","Th� kh�","Xa phu","Qu�n l� c�a hi�u","M�c ��i","V�n Du ��o Nh�n","Ng� Tr�","L�u Nh�t Ph�","Th� s�n Tr��ng","B� ��u","L� quan","Ch� th��ng h�i","H�nh C��c Th��ng Nh�n","Ch�n T� ��n","S� gi� T�ng Ki�m","Tri�u Di�n Ni�n","Ti�u Vi�n L�u","S� gi� bang ph�i","V� binh th�nh m�n","T�o B�n","Binh B� Th� Lang","Binh B� Th� v�","Tri�u Ph�","Th� V� T��ng ph�","C�m qu�n","Kh�u Chu�n","C�m qu�n","Ch� t�u l�u","Ti�u nh�","Nh�n s� giang h�","T�o ��i L�c","Gi�o s�","V� s�","H�ng x�m H�n Tr� Nh��ng","Ti�u s�","V� N��ng","Th�y b�i","Quan vi�n tho�i nhi�m","Ti�u ��ng","B�ch Hi�u Sinh","L� S� S�","Ng��i b�n ng�a"},
								{2071,2072,2073,2074,2075,2076,2077,2078,2079,2080,2081,2082,2083,2084,2085,2086,2087,2088,2089,2090,2093,2094,2095,2096,2097,2098,2099,2100,2101,2102,2103,2104,2105,2106,2107,2108,2109,2110,2111,2112,2113,2114,2115,2116,2117,2118,2119,2120,2121}},
	[300]={"Th�nh ��",{"D� T�u","Ch� Ti�m v� kh�","Ch� D��c �i�m","Ch� T�p h�a","Ch� Ti�m Nam ph�c","Ch� Ti�m N� ph�c","Ch� Kim ho�n","Ch� ti�n trang","Th� kh�","Xa phu","Qu�n l� c�a hi�u","M�c Nh�","C�m n��ng","Du Ph��ng ��i phu","��i Kho�ng C�ng","Ho�ng ��i Th�m","B� ��u","L� quan","Ch� th��ng h�i","S� gi� T�ng Ki�m","H�nh C��c Th��ng Nh�n","S� gi� bang ph�i","V� N��ng","N�n d�n_B�nh","N�n d�n_�inh","N�n d�n_Gi�p","N�n d�n �t","N�n d�n","Chu Thi�n Nh�n","A Th�nh","Chu U�t Ly","Th�i th� ","Ch� l�i ��i","Nha d�ch","Nha d�ch","V� binh th�nh m�n","V� s�","Th�y b�i","Quan vi�n tho�i nhi�m","Ch� t�u l�u","V��ng C�n","B�ch Hi�u Sinh","Ti�u s�","Gi�o s�","Ti�u ��ng","Ti�u s�"},
								{2131,2132,2133,2134,2135,2136,2137,2138,2139,2140,2141,2142,2143,2144,2145,2146,2147,2148,2149,2150,2151,2153,2155,2156,2157,2158,2159,2160,2161,2162,2163,2164,2165,2166,2167,2168,2169,2170,2171,2172,2173,2174,2175,2176,2177,2178}},
	[350]={"T��ng D��ng",{"Ch� Ti�m v� kh�","Ch� D��c �i�m","Ch� T�p h�a","Ch� Ti�m Nam ph�c","Ch� Ti�m N� ph�c","Ch� Kim ho�n","Th� kh�","Xa phu","B� ��u","Tr�c Thi�n H�nh","Ch� l�i ��i","Minh Ch� Kim S�n","Ch�n T� ��n","Ch� huy s�","Ch� th��ng h�i","Th� r�n L�u","M�c Tam","H�nh C��c Th��ng Nh�n","S� gi� T�ng Ki�m","Th�i th�","Ch� t�u l�u","Ph��ng Khanh","Vu D�n","T�ng binh","Tr��ng �nh","M�c H�u Vi","Ti�u s�","T� M� T�n Nguy�n","H�n Ngh�a","C� M�c","Thi�n T�c Minh","C� L�o Ta","Ph� Nghi"},
								{2181,2182,2183,2184,2185,2186,2187,2188,2189,2190,2191,2192,2193,2194,2195,2196,2197,2198,2199,2200,2201,2202,2203,2204,2205,2206,2207,2208,2209,2210,2211,2212,2213}},
	[400]={"��i L�",{"Ch� Ti�m v� kh�","Ch� D��c �i�m","Ch� T�p h�a","Ch� Ti�m Nam ph�c","Ch� Ti�m N� ph�c","Ch� Kim ho�n","Th� kh�","Xa phu","Ch� th��ng h�i","L� quan","Ch� t�u l�u","Tr�nh Qu�n Chi","��ng Gi� La","Tr�n L�p H�nh","L�u �i�n","Cao Th�ng Tuy�n"},
								{2221,2222,2223,2224,2225,2226,2227,2228,2229,2230,2231,2233,2234,2235,2236,2237}}
	};
	
--ʥ�������� 	 11Ϊ���ս�������
tChrimsExp = {3000,6000,12000,24000,48000,96000,192000,384000,768000,1536000,3072000};

--ʥ����99�������ʯ�ȼ���Χ ���� 11Ϊ��װ��ֱ�Ӹ������ʯ 12Ϊ99����װ��ֱ�Ӹ������ʯ 13Ϊ���ս���
tChrimsLingshi = {{1,4,1},{1,4,1},{1,4,1},{1,4,1},{1,4,1},{1,4,1},{1,5,1},{1,5,1},{1,5,1},{5,7,1},{1,4,2},{1,4,2},{5,7,2}};

--ʥ����װ
tNewCloth = {--�б꣬�п���Ů�ԸУ�Ů��С
						--��װ����id������
	{{"T�n Nguy�n ngo�i trang",0,109,495,10},{"Tri�u Hoa ngo�i trang",0,109,499,1}},
	{{"T�n Nguy�n ngo�i trang",0,109,496,10},{"Tri�u Hoa ngo�i trang",0,109,500,1}},
	{{"T�n Nguy�n ngo�i trang",0,109,497,10},{"Tri�u Hoa ngo�i trang",0,109,501,1}},
	{{"T�n Nguy�n ngo�i trang",0,109,498,10},{"Tri�u Hoa ngo�i trang",0,109,502,1}}	
	}

--��ý������
tWindExp = {100,200,400,800,1600,3200,6400,12800,25600,51200,102400,204800,409600,819200,1638400,3276800};

--��ͭ���ϳɹ���
tTingTong = {--������Ʒ�� ���� ID �ϳɺ���Ʒ�� ���� ID �ɹ�����
	{"M�nh ��ng c�p 2",5,2	,1,3212,"M�nh ��ng c�p 1",1,2,1,3211,100},
	{"M�nh ��ng c�p 1",5,2,1,3211,"Ph�i ki�n Thanh ��ng ��nh c�p 4",5,2,1,3223,"Thanh ��ng ��nh c�p 4",1,2,1,3216,50},
	{"Thanh ��ng ��nh c�p 4",1,2,1,3216,"Ph�i ki�n Thanh ��ng ��nh c�p 3",5,2,1,3222,"Thanh ��ng ��nh c�p 3",1,2,1,3215,50},
	{"Thanh ��ng ��nh c�p 3",1,2,1,3215,"Ph�i ki�n Thanh ��ng ��nh c�p 2",2,2,1,3221,"Thanh ��ng ��nh c�p 2",1,2,1,3214,30},
	{"Thanh ��ng ��nh c�p 2",1,2,1,3214,"Ph�i ki�n Thanh ��ng ��nh c�p 1",2,2,1,3220," Thanh ��ng ��nh c�p 1",1,2,1,3213,20}
	}

tSanjiAward = {
	{"Nguy�t Hoa ",2,1,2002},
	{"Thi�n � Ph� (s� d�ng c�p 79 may H� Gi�p gi�i h�n t�ng ��n c�p 99)",2,1,3000},
	{"Ch�c N� Kinh (s� d�ng c�p 79 may n�n gi�i h�n t�ng ��n c�p 99)",2,1,3050},
	{"Luy T� T�m Kinh (s� d�ng c�p 79 may h� y gi�i h�n t�ng ��n c�p 99)",2,1,3051},
	{"�u D� T�y Ch� Kinh (s� d�ng c�p 79 ch� t�o v� kh� ng�n gi�i h�n t�ng ��n c�p 99)",2,1,3001},
	{"Can T��ng Ch� Kinh (s� d�ng c�p 79 ch� t�o binh kh� d�i gi�i h�n t�ng ��n c�p 99)",2,1,3002},
	{"M�c T� Ch� Kinh (s� d�ng c�p 79 ch� t�o binh kh� k� m�n gi�i h�n t�ng ��n c�p 99)",2,1,3003},
	{"V�n M�c �� (s� d�ng k� n�ng ��n g� c�p 79 gi�i h�n t�ng ��n c�p 99)",2,1,3007},
	{"V�n Th� Ph� (s� d�ng c�p 79 k� n�ng Thu�c da gi�i h�n t�ng ��n ca61p)",2,1,3008},
	{"Ng� T�ng S�n Kinh (s� d�ng c�p 79 k� n�ng ��o kho�ng gi�i h�n t�ng ��n c�p 99)",2,1,3011},
	{"M� M�u T�m Kinh (s� d�ng c�p 79 k� n�ng k�o t� gi�i h�n t�ng ��n c�p 99)",2,1,3012}};


tErjiAward = {
	{"Nguy�t Hoa Chi Tinh",2,1,3219},
	{"Th�n Quy �� Ph� (Y�u c�u: c�p 80 v� ch� t�o binh kh� ng�n)",2,1,3013},
	{"�m D��ng �n �� Ph� (Y�u c�u: c�p 90 v� ch� t�o binh kh� ng�n)",2,1,3014},
	{"H�a �nh �� Ph� (Y�u c�u: c�p 80 v� ch� t�o binh kh� ng�n)",2,1,3015},        
	{"Nha C�u �� Ph� (Y�u c�u: c�p 90 v� ch� t�o binh kh� ng�n)",2,1,3016},        
	{"Ng�c tr� �� Ph� (Y�u c�u: c�p 80 v� ch� t�o binh kh� d�i)",2,1,3017},        
	{"Th�n Ch�m �� Ph� (Y�u c�u: c�p 90 v� ch� t�o binh kh� d�i)",2,1,3018},        
	{"Khoa Ph� �� Ph� (Y�u c�u: c�p 80 v� ch� t�o binh kh� k� m�n)",2,1,3019},      
	{"M�t V� �� Ph� (Y�u c�u: c�p 90 v� ch� t�o binh kh� k� m�n )",2,1,3020},      
	{"L�u C�nh �� Ph� (Y�u c�u: c�p 80 v� ch� t�o binh kh� ng�n)",2,1,3021},        
	{"Ngh�ch L�n �� Ph� (Y�u c�u: c�p 90 v� ch� t�o binh kh� ng�n)",2,1,3022},        
	{"��i Th�nh D� �m �� Ph� (Y�u c�u: c�p 80 v� ch� t�o binh kh� K� m�n)",2,1,3023},  
	{"Kh� M�c Long Ng�m �� Ph� (Y�u c�u: c�p 90 v� ch� t�o v� binh kh� k� m�n)",2,1,3024},  
	{"Toan D� �� Ph� (Y�u c�u: c�p 80 v� ch� t�o v� binh kh� k� m�n)",2,1,3025},      
	{"Th�i H� �� Ph� (Y�u c�u: c�p 90 v� ch� t�o v� binh kh� k� m�n)",2,1,3026},      
	{"M�c Ki�n Li�n Tr��ng�� Ph� ( Y�u c�u: c�p 80 v� ch� t�o v� binh kh� d�i)",2,1,3027},    
	{"D��c S� Tr��ng �� Ph� (Y�u c�u: c�p 90 v� ch� t�o v� binh kh� d�i)",2,1,3028},      
	{"C�u Long To�n K�ch �� Ph� (Y�u c�u: c�p 80 v� ch� t�o v� binh kh� d�i)",2,1,3029},    
	{"Th��ng N� �� Ph� (Y�u c�u: c�p 90 v� ch� t�o v� binh kh� d�i)",2,1,3030},        
	{"Vi�n �� �� Ph� (Y�u c�u: c�p 80 v� ch� t�o v� binh kh� k� m�n)",2,1,3031},      
	{"B�t X� chi X� �� Ph� (Y�u c�u: c�p 90 v� ch� t�o v� binh kh� k� m�n)",2,1,3032},  
	{"V� Ng�n �� Ph� (Y�u c�u: c�p 80 v� ch� t�o v� binh kh� k� m�n)",2,1,3033},      
	{"Thanh Long �� Ph� (Y�u c�u: c�p 90 v� ch� t�o v� binh kh� k� m�n)",2,1,3034},      
	{"B�ch Th�y �� Ph� (Y�u c�u: c�p 80 v� ch� t�o v� binh kh� ng�n)",2,1,3035},        
	{"Thi�n T�n �� Ph� (Y�u c�u: c�p 90 v� ch� t�o v� binh kh� ng�n)",2,1,3036},        
	{"Qu�n ph�i ph��ng c�p 8 (Y�u c�u: c�p 80 v� k� n�ng may n�n)",2,1,3044},  
	{"Th��ng y ph�i ph��ng c�p 8 (Y�u c�u: c�p 80 v� k� n�ng may H� Gi�p)",2,1,3045},  
	{"H� y ph�i ph��ng c�p 8 (Y�u c�u: c�p 80 v� k� n�ng may h� y)",2,1,3046},  
	{"Qu�n ph�i ph��ng c�p 9 (Y�u c�u: c�p 90 v� k� n�ng may n�n)",2,1,3047},  
	{"Th��ng y ph�i ph��ng c�p 9 (Y�u c�u: c�p 90 v� k� n�ng may H�)",2,1,3048},  
	{"H� y ph�i ph��ng c�p 9 (Y�u c�u: c�p 90 v� k� n�ng may h� y)",2,1,3049}}; 

tTiandi = {
	{{"Thi�n ��a Huy�n Ho�ng Kh�i",0,103,85},{"Thi�n ��a Huy�n Ho�ng Kh�i",0,103,86},{"Thi�n ��a Huy�n Ho�ng Kh�i",0,103,87},{"Thi�n ��a Huy�n Ho�ng Kh�i",0,103,88}},
	{{"Thi�n ��a Huy�n Ho�ng Gi�p ",0,100,85},{"Thi�n ��a Huy�n Ho�ng Gi�p ",0,100,86},{"Thi�n ��a Huy�n Ho�ng Gi�p ",0,100,87},{"Thi�n ��a Huy�n Ho�ng Gi�p ",0,100,88}},
	{{"Thi�n ��a Huy�n Ho�ng Trang",0,101,85},{"Thi�n ��a Huy�n Ho�ng Trang",0,101,86},{"Thi�n ��a Huy�n Ho�ng Trang",0,101,87},{"Thi�n ��a Huy�n Ho�ng Trang",0,101,88}},
	{[0]={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17},{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39},{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43},{"Thi�n ��a Huy�n Ho�ng Kh� ",0,1,56},{"Thi�n ��a Huy�n Ho�ng Dao",0,3,67},{"Thi�n ��a Huy�n Ho�ng C�m",0,10,78},{"Thi�n ��a Huy�n Ho�ng B�t ",0,9,89},{"Thi�n ��a Huy�n Ho�ng Tr��ng",0,8,100},{"Thi�n ��a Huy�n Ho�ng Th��ng ",0,6,111},{"Thi�n ��a Huy�n Ho�ng Cung ",0,4,122},{"Thi�n ��a Huy�n Ho�ng Tr�o",0,11,15},{"Thi�n ��a Huy�n Ho�ng Nh�n ",0,7,15}},
	 [1]={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17},{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43},{"Thi�n ��a Huy�n Ho�ng Dao",0,3,67},{"Thi�n ��a Huy�n Ho�ng Tr��ng",0,8,100}},
	 [2]={{"Thi�n ��a Huy�n Ho�ng Dao",0,3,67},{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43}},
	 [3]={{"Thi�n ��a Huy�n Ho�ng Tr��ng",0,8,100}},
	 [4]={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17}},
	 [5]={{"Thi�n ��a Huy�n Ho�ng Kh� ",0,1,56}},
	 [6]={{"Thi�n ��a Huy�n Ho�ng Kh� ",0,1,56}},
	 [7]={{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39},{"Thi�n ��a Huy�n Ho�ng C�m",0,10,78}},
	 [8]={{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39}},
	 [9]={{"Thi�n ��a Huy�n Ho�ng C�m",0,10,78}},
	 [10]={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17},{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43}},
	 [11]={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17}},
	 [12]={{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43}},
	 [13]={{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39},{"Thi�n ��a Huy�n Ho�ng B�t ",0,9,89}},
	 [14]={{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39}},
	 [15]={{"Thi�n ��a Huy�n Ho�ng B�t ",0,9,89}},
	 [16]={{"Thi�n ��a Huy�n Ho�ng Th��ng ",0,6,111},{"Thi�n ��a Huy�n Ho�ng Cung ",0,4,122}},
	 [17]={{"Thi�n ��a Huy�n Ho�ng Th��ng ",0,6,111}},
	 [18]={{"Thi�n ��a Huy�n Ho�ng Cung ",0,4,122}},
	 [19]={{"Thi�n ��a Huy�n Ho�ng Tr�o",0,11,15},{"Thi�n ��a Huy�n Ho�ng Nh�n ",0,7,15}},
	 [20]={{"Thi�n ��a Huy�n Ho�ng Nh�n ",0,7,15}},
	 [21]={{"Thi�n ��a Huy�n Ho�ng Tr�o",0,11,15}}}
	};

function get_chrims_state()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20081222 and nDate <= 20090104 then
		return 1;
	else
	 	return 0;
	end
end

--���ڻ��־
function get_spring_festival_state()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20080128 and nDate <= 20080218 then
		return 1;
	else
	 	return 0;
	end	
end

function getwindstate()
	local nState,nActionStep = 0,0;
	local nDate = tonumber(date("%H%M"));
	local tTime = {{900,930},{930,1000},{1000,1030},{1030,1100},{1100,1130},{1130,1200},{1200,1230},{1230,1300},{1300,1330},{1330,1400},{1400,1430},{1430,1500},{1500,1530},{1530,1600},{1600,1630},{1630,1700},{1700,1730},{1730,1800},{1800,1830},{1830,1900},{1900,1930},{1930,2000},{2000,2030},{2030,2100},{2100,2130},{2130,2200},{2200,2230},{2230,2300}};
	for i = 1,getn(tTime) do
		if nDate < tTime[i][2] and nDate >= tTime[i][1] then
			nState = 1;
			local nDay = tonumber(date("%Y%m%d%H"));
			local nNd = floor(nDay/100)*100;
			nActionStep = nNd+i;
			break
		end
	end
	return nState,nActionStep
end

--�������ƣ���Ʒ��Ӽ�麯��
--��        �ܣ��Ե�ǰ��ҿɷ����������Ʒ���м��
--�峤 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho�ng tr�ng<color> trong h�nh trang kh�ng ��!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--�ж���Ҹ��غͿռ�
			Talk (1,"","<color=red>S�c l�c<color> c�a b�n kh�ng ��!")
			return 0
		else 
			return 1
		end
end

--��������ת��Ϊ���� yanjun
function gf_GoldenExp2Exp(nGoldenExp)
	local nCurrGoldenExp = GetGoldenExp();
	if nCurrGoldenExp < nGoldenExp then
		nGoldenExp = nCurrGoldenExp
	end;
	ModifyGoldenExp(-nGoldenExp);
	ModifyExp(nGoldenExp)
	Msg2Player(nGoldenExp.."�i�m s�c kh�e �� ��i th�nh"..nGoldenExp.." �i�m kinh nghi�m");
	return nGoldenExp;
end;

function nothing()

end