--��ʯϵͳ��������ű�
--by vivi
--08/13/2007

--�������
TASK_LINGSHI_ID = 2;

--��ұnpc���ݡ�����������
tGongyeNpc = {
	{150,1647,3152},
	{350,1399,2992},
	{400,1493,3058}
	}

--��������NPC����	
tShenyouNpc = {
	{100,1379,2860},
	{200,1151,2855},
	{300,1975,3557}
	}
	
tZhizaoNpc = {--npc���꣬������Ī��Ī����Ī��������Ͼ�����ʦ��
	{200,1426,3025},
	{300,1709,3459},
	{350,1345,2929},
	{300,1862,3479},
	{400,1409,2985},
	{350,1546,2935}
	}
	
tNpcName = {"<color=green>M�c ��i<color>","<color=green>M�c Nh�<color>","<color=green>M�c Tam<color>","<color=green>C�m N��ng<color>","<color=green>T� Quy�n C� N��ng<color>","<color=green>Minh S� ph�<color>"};

tZhuangbeiOne = {
	{0,103,1,0,100,1,0,101,1},
	{0,103,19,0,100,19,0,101,19},
	{0,103,37,0,100,37,0,101,37},
	{0,103,55,0,100,55,0,101,55}
	}
	
tZhuangbeiTwo = {
	{0,103,1,0,100,1,0,101,1},
	{0,103,19,0,100,19,0,101,19},
	{0,103,37,0,100,37,0,101,37},
	{0,103,55,0,100,55,0,101,55}
	}	
	
tZhuangbeiThree = {
	{0,103,1,0,100,1,0,101,1,0,0,1},
	{0,103,19,0,100,19,0,101,19,0,0,1},
	{0,103,37,0,100,37,0,101,370,0,1},
	{0,103,55,0,100,55,0,101,55,0,0,3}
	}
	
tWeapon10 = {
	[2]= {0,3,53,30},
	[3]= {0,8,86,30},
	[4]= {0,0,3,35},
	[6]= {0,1,42,20},	
	[8]= {0,2,16,25},	
	[9]= {0,10,64,30},
	[11]= {0,0,3,35},
	[12]= {0,5,29,50},
	[14]= {0,2,16,25},	
	[15]= {0,9,75,20},	
	[17]= {0,6,97,20},	
	[18]= {0,4,108,20},
	[20]= {0,7,1,35},
	[21]= {0,11,1,35},
	}

--���ս�����ʯ�䷽��Id3
tPeiFang = {2012,2013,2014,2017,2018,2019,2022,2025,2028,2031,2070,2071,2072,2073,2077,2078,2079,
	2080,2084,2085,2086,2089,2090,2094,2095,2099,2100,2104,2105,2109,2110,2113,2114,2118,2121,2122,
	2123,2124,2125,2128,2131,2132,2133,2134,2138,2139,2140,2141,2145,2146,2147,2148,2152,2153,2154,
	2155,2159,2160,2161,2162,2166,2167,2168,2169,2173,2174,2175,2176,2180,2181,2182,2183,2187,2188,
	2189,2192,2193,2194,2195,2196,2199,2200,2201,2202,2203,2206,2207,2208,2209,2210,2213,2214,2215,
	2216,2217,2220,2221,2222,2223,2224,2227,2228,2229,2230,2231,2234,2235,2236,2237,2241,2242,2243,
	2244,2248,2249,2251,2252,2254,2255,2257,2258,2259,2260,2264,2265,2266,2267,2268,2271,2272,2273,
	2274,2278,2279,2280,2281,2285,2286,2287,2288,2292,2293,2294,2295,2299,2302,2305,2308,2311,2314,
	2317,2318,2319,2320,2324,2325,2326,2327,2328,2331,2332,2333,2334,2335,2338,2339,2340,2341,2342,
	2345,2346,2347,2348,2349,2352,2353,2354,2355,2356,2359,2360,2361,2362,2363,2366,2367,2368,2369,
	2370,2373,2374,2375,2376,2377,2380,2381,2384,2385,2388,2389,2390,2391,2395,2396,2397,2398,2402,
	2403,2404,2405,2409,2410,2411,2412,2413,2416,2417,2418,2419,2420,2423,2424,2425,2426,2427,2430,
	2431,2432,2433,2434,2437,2438,2439,2440,2441,2444,2445,2446,2447,2448,2451,2452,2453,2454,2455,
	2458,2459,2460,2461,2465,2466,2467,2470,2471,2472,2473,2474,2477,2478,2479,2480,2481,2484,2485,
	2486,2487,2488,2491,2492,2493,2494,2495,2498,2499,2500,2501,2502,2505,2506,2507,2508,2509,2512,
	2513,2514,2515,2516,2519,2520,2521,2522,2523,2526,2527,2528,2529,2530,2533,2534,2535,2536,2537,
	2540,2541,2542,2543,2544,2547,2548,2549,2550,2551,2554,2555,2556,2557,2558,2561,2562,2563,2564,
	2565,2568,2569,2570,2571,2572,2575,2576,2577,2578,2579,2582,2583,2584,2585,2586,2589,2590,2591,
	2592,2593,2596,2597,2598,2599,2600,2603,2604,2605,2606,2607,2610,2611,2612,2613,2614,2617,2618,
	2619,2620,2621,2624,2625,2626,2627,2628,2631,2632,2634,2635}

tLingqi = {--id  λ��  �ȼ�  ��������ֵ  ż������ֵ
	{113,0,1,3,2},
	{110,0,1,1,2},
	{11,0,1,3,2},
	{112,1,1,3,2},
	{110,1,1,1,2},
	{11,1,1,1,2},
	{114,3,1,3,2},
	{110,3,1,1,2},
	{11,3,1,3,2},
	{333,2,1,1,2},
	{110,2,1,1,2},
	{9,2,1,3,2}
	}
	

function talk_I()
	if GetLevel() >= 20 then
		Say("<color=green>H� th�ng<color>: V� L�m Truy�n K� 2 phi�n b�n 'Linh ��ng S�n H�' �� c�p nh�t th�m t�nh n�ng m�i: 'kh�m n�m Linh th�ch' v� h� th�ng b� trang b� B�t Qu�i. Nhi�u b�t ng� th� v� �ang ch� b�n kh�m ph�!",
			3,
			"Hay qu�! Ta mu�n t�m hi�u 'kh�m n�m Linh th�ch' v� h� th�ng b� trang b� B�t Qu�i/talk_III",
			"���c r�i, ta �� hi�u!/talk_II",
			"Ch�a c�n! Ta mu�n d�ng 'B�t Qu�i B�o �i�n' m� h� th�ng nhi�m v� n�y!/set_id_eight");
	end	
end

function talk_II()
	Say("<color=green>H� th�ng<color>: N�u b�n �� hi�u c�c h� th�ng li�n quan, khi ��n c�p <color=yellow>75<color> c� th� ��n g�p Truy�n nh�n C�ng D� Th� Gia l�nh nh�n Linh th�ch ph�i ph��ng",	
		2,
		"Hay qu�! Ta �� hi�u r�i!/set_id_five",
		"Ch�a hi�u! C�n ch�t m� h�!/talk_I");
end

function talk_III()
	if Zgc_pub_goods_add_chk(8,100) ~= 1 then
		return
	end
	SetTask(TASK_LINGSHI_ID,7);
	local nTi = GetBody(); 
	local nRoute = GetPlayerRoute();
	local flag,idx = 0,0
	flag,idx = AddItem(tZhuangbeiOne[nTi][1],tZhuangbeiOne[nTi][2],tZhuangbeiOne[nTi][3],1,1,1,113,1,110,1,11);
		SetEquipCanChouQu(idx, 1)
	flag,idx = AddItem(tZhuangbeiOne[nTi][4],tZhuangbeiOne[nTi][5],tZhuangbeiOne[nTi][6],1,1,1,112,1,110,1,11);
		SetEquipCanChouQu(idx, 1)
	flag,idx = AddItem(tZhuangbeiOne[nTi][7],tZhuangbeiOne[nTi][8],tZhuangbeiOne[nTi][9],1,1,1,114,1,110,1,11);
		SetEquipCanChouQu(idx, 1)
	if nRoute == 2 or nRoute == 3 or nRoute == 4 or nRoute == 6 or nRoute == 8 or nRoute == 9 or nRoute == 11 or nRoute == 12 or nRoute == 14 or nRoute == 15 or nRoute == 17 or nRoute == 18 or nRoute == 20 or nRoute == 21 then
		flag,idx = AddItem(tWeapon10[nRoute][1],tWeapon10[nRoute][2],tWeapon10[nRoute][3],1,1,1,333,1,110,1,9);
			SetEquipCanChouQu(idx, 1)
	else
		flag,idx = AddItem(0,0,3,1,1,1,333,1,110,1,9);
			SetEquipCanChouQu(idx, 1)
	end
	AddItem(2,1,2003,4,1);
	AddItem(2,1,2006,4,1);
	AddItem(2,1,2009,4,1);
--	AddItem(2,1,2639,1,1);
	Msg2Player("B�n nh�n ���c ��u kh�i, y ph�c, h� trang, v� kh� v� 12 vi�n Nguy�n Th�ch")
--	Msg2Player("B�n nh�n ���c m�r B�t Qu�i B�o �i�n");
	Say("<color=green>H� th�ng<color>: C�c v�t ph�m <color=yellow>nh�t ���c ngo�i th�nh<color> �a s� ��u c� linh kh�. H�y mang theo 4 b� trang b� v� 12 vi�n Nguy�n Th�ch n�y ��n ch� Truy�n nh�n C�ng D� Th� Gia �� th� r�t Linh th�ch! Nh� l� khi ��i tho�i v�i C�ng D� Th� Gia ph�i ghi nh� t�ng l�i n�i, n�u kh�ng s� l�ng ph� nhi�u c� h�i qu� gi�!...",
		3,
		"Ta mu�n ��n ch� Truy�n nh�n C�ng D� Th� Gia r�t Linh th�ch/#goto_gongye(1)",
		"T�m th�i ch�a mu�n �i!/#goto_gongye(2)",
		"���c r�i, ta �� hi�u!/confirm_cancel");
end	

function talk_IV()
	if GetTask(TASK_LINGSHI_ID) == 2 then
		if Zgc_pub_goods_add_chk(4,100) ~= 1 then
			return
		end
		local sNpc = "";
		local nMapId = GetWorldPos();
		for i=1,getn(tZhizaoNpc) do
			if tonumber(nMapId) == tZhizaoNpc[i][1] then
				sNpc = tNpcName[i];
				break
			end
		end
		local nTi = GetBody(); 
		local nRoute = GetPlayerRoute();
		AddItem(tZhuangbeiTwo[nTi][1],tZhuangbeiTwo[nTi][2],tZhuangbeiTwo[nTi][3],1,1,0,0,0,0,0,0,0,0,39);
		AddItem(tZhuangbeiTwo[nTi][4],tZhuangbeiTwo[nTi][5],tZhuangbeiTwo[nTi][6],1,1,0,0,0,0,0,0,0,0,40);
		AddItem(tZhuangbeiTwo[nTi][7],tZhuangbeiTwo[nTi][8],tZhuangbeiTwo[nTi][9],1,1,0,0,0,0,0,0,0,0,39);
		if nRoute == 2 or nRoute == 3 or nRoute == 4 or nRoute == 6 or nRoute == 8 or nRoute == 9 or nRoute == 11 or nRoute == 12 or nRoute == 14 or nRoute == 15 or nRoute == 17 or nRoute == 18 or nRoute == 20 or nRoute == 21 then
			AddItem(tWeapon10[nRoute][1],tWeapon10[nRoute][2],tWeapon10[nRoute][3],1,1,0,0,0,0,0,0,0,0,39);
		else
			AddItem(0,0,3,1,1,0,0,0,0,0,0,0,0,39);
		end
		Msg2Player("B�n nh�n ���c ��u kh�i, y ph�c, h� trang, v� kh� ")		
		Talk(1,"",sNpc.."�� hi�u ���c nguy�n l� ch� t�o trang v� Linh kh� ch�a? Th�y ng��i nhi�t t�nh nh� v�y, ta t�ng lu�n ng��i 4 m�n trang b� n�y. M�c d� linh kh� c�a n� kh�ng cao, nh�ng �� c� th� kh�m ���c 3 Linh th�ch r�i! Ph�i ch� �: linh kh� dung n�p ���c v�o trang b� l� c� h�n, n�n ph�i suy t�nh cho k� l��ng mu�n kh�m Linh th�ch g�. N�u mu�n ch� t�o trang b� B�t Qu�i ph�i kh�m vi�n Linh th�ch v� ph�i k�t h�p ���c linh kh� tr�n trang b� v�i linh kh� c�a Linh th�ch th�nh m�t th� m�i ���c. N�u nh� th�nh c�ng s� nh�n ���c trang b� B�t Qu�i ch�a k�ch ho�t. Ng��i c� th� th� kh�m n�m Linh th�ch l�n trang b�. <color=yellow>Nh�p chu�t ph�i v�o Linh th�ch s� m� ra giao di�n kh�m n�m Linh th�ch<color>.")
		TaskTip("Nhi�m v� h� th�ng Linh th�ch: Nh�p chu�t ph�i v�o Linh th�ch �� m� giao di�n kh�m n�m, th� kh�m Linh th�ch sau �� �i t�m anh em nh� M�c ��i!");
		SetTask(TASK_LINGSHI_ID,11);
	elseif GetTask(TASK_LINGSHI_ID) == 11 then
		local sNpc = "";
		local nMapId = GetWorldPos();
		for i=1,getn(tZhizaoNpc) do
			if tonumber(nMapId) == tZhizaoNpc[i][1] then
				sNpc = tNpcName[i];
				break
			end
		end			
		Say(sNpc.."�� hi�u c�ch kh�m n�m Linh th�ch l�n trang b� r�i ch�? N�u th�nh c�ng s� nh�n ���c trang b� B�t Qu�i ch�a k�ch ho�t! Gi� h�y �i t�m Th�n Du Ch�n Nh�n �i, �ng ta s� gi�p k�ch ho�t n�. �ng ta ch�nh l� B�t Qu�i Th�ng, li�n quan ��n B�t Qu�i kh�ng c� g� �ng ta kh�ng bi�t",
			3,
			"Ta mu�n ��n ch� Th�n Du Ch�n Nh�n/#goto_shenyou(1)",
			"T�m th�i ch�a mu�n �i!/#goto_shenyou(2)",
			"���c r�i! Ta �� hi�u v� hai h� th�ng n�y r�i/confirm_cancel");
	end
end	


function goto_gongye(nType)
	SetTask(TASK_LINGSHI_ID,7); --����ԭ��Ϊ1���¼�һ���Ի���ID==1֮ǰ�����Ķ�����npc���������������Ϊ7��������Ϊ1
	if nType == 1 then
		local nRand = random(1,3);
		NewWorld(tGongyeNpc[nRand][1],tGongyeNpc[nRand][2],tGongyeNpc[nRand][3]);
		SetFightState(0);
	end												--
end

function goto_shenyou(nType)
	SetTask(TASK_LINGSHI_ID,3);
	if nType == 1 then
		local nRand = random(1,3);
		NewWorld(tShenyouNpc[nRand][1],tShenyouNpc[nRand][2],tShenyouNpc[nRand][3]);
	end	
end

function give_final()
	if Zgc_pub_goods_add_chk(10,10) ~= 1 then
		return
	end
	SetTask(TASK_LINGSHI_ID,6);
	local nOne = random(1,getn(tPeiFang));
	local nTwo = random(1,getn(tPeiFang));
	local nThr = random(1,getn(tPeiFang));
	local nFou = random(1,getn(tPeiFang));
	local nFiv = random(1,getn(tPeiFang));
	local nSix = random(1,getn(tPeiFang));
	local nSev = random(1,getn(tPeiFang));
	local nEig = random(1,getn(tPeiFang));
	local nNig = random(1,getn(tPeiFang));
	local nTen = random(1,getn(tPeiFang));
	AddItem(2,21,tPeiFang[nOne],1,1);
	AddItem(2,21,tPeiFang[nTwo],1,1);
	AddItem(2,21,tPeiFang[nThr],1,1);
	AddItem(2,21,tPeiFang[nFou],1,1);
	AddItem(2,21,tPeiFang[nFiv],1,1);
	AddItem(2,21,tPeiFang[nSix],1,1);
	AddItem(2,21,tPeiFang[nSev],1,1);
	AddItem(2,21,tPeiFang[nEig],1,1);
	AddItem(2,21,tPeiFang[nNig],1,1);
	AddItem(2,21,tPeiFang[nTen],1,1);
	Msg2Player("B�n nh�n ���c 10 Linh th�ch ph�i ph��ng");
	Msg2Player("Ho�n th�nh nhi�m v� h� th�ng Linh th�ch B�t Qu�i t�n th�");
end

function set_id_eight()
	SetTask(TASK_LINGSHI_ID,8);
--	AddItem(2,1,2639,1,1);
--	Msg2Player("B�n nh�n ���c m�r B�t Qu�i B�o �i�n");
end

function set_id_five()
	SetTask(TASK_LINGSHI_ID,5);
--	AddItem(2,1,2639,1,1);
--	Msg2Player("B�n nh�n ���c m�r B�t Qu�i B�o �i�n");
end

function confirm_cancel()
	Say("<color=green>H� th�ng<color>: N�u b�n �� hi�u ���c c�c h� th�ng li�n quan, ��n c�p <color=yellow>75<color> c� th� �i t�m Truy�n nh�n C�ng D� Th� Gia l�nh nh�n Linh th�ch ph�i ph��ng",
		2,
		"Hay qu�! Ta �� hi�u r�i!/set_five_two",
		"Ch�a hi�u! C�n ch�t m� h�!/nothing")
end

function set_five_two()
	SetTask(TASK_LINGSHI_ID,5);
end

--�������ƣ���Ʒ��Ӽ�麯��
--��        �ܣ��Ե�ǰ��ҿɷ����������Ʒ���м��
--�峤 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk(1,"","<color=red>kho�ng tr�ng<color> trong h�nh trang kh�ng ��!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--�ж���Ҹ��غͿռ�
			Talk(1,"","<color=red>S�c l�c<color> c�a b�n kh�ng ��!")
			return 0
		else 
			return 1
		end
end

function nothing()

end