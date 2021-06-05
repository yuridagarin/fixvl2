Include("\\script\\missions\\liangshan\\head.lua")
Include("\\script\\missions\\liangshan\\mission\\tmission.lua")
Include("\\script\\class\\clause3.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\lib\\lingshi_head.lua")
Include("\\settings\\static_script\\lib\\itemfunctions.lua")

Include("\\script\\missions\\liangshan\\runtime_data_stat.lua")

msg = format("Ch�c m�ng $n �� nh�n ���c $i t� L��ng S�n Qu�n Anh H�i", itemName);
--�ú�����
function giveItem(self)
	ItemCreate:create(self[1])
	local notice = gsub(msg, "\$n", GetName());
	notice = gsub(notice, "\$i", self[1]);
	Msg2Global(notice);
end
tClause1 = {
    {{"Thi�n Cang L�nh"          ,{2,95,204,1},msg},     80000},
    {{"Thi�n Cang L�nh"          ,{2,95,204,2},msg},     10000},
    {{"Thi�n Cang L�nh"          ,{2,95,204,3},msg},     5000},
    {{"Huy Ch��ng Du Hi�p"          ,{0,153,26,1},msg},     2000},
    {{"Huy Ch��ng Thi�t Huy�t"          ,{0,153,27,1},msg},     2000},
    {{"Huy Ch��ng V�n Du"          ,{0,153,28,1},msg},     1000},
}
tClause2 = {
--	{{"С����������ʯ"    	,{2,1,3356,1},msg},    10.00*100,7},
--	{{"���������"         	,{2,1,1050,1}},        5.00*100,7},
--	{{"7����ʯ��"          	,{2,1,30305,1},msg}, 	10.00*100,7},
--	{{TTGLInfo[4]          	,{TTGLInfo[1],TTGLInfo[2],TTGLInfo[3],1},msg},    1.00*100 },
--	{{TTGLInfo[4]          	,{TTGLInfo[1],TTGLInfo[2],TTGLInfo[3],1},msg},    0.50*100 },
--	{{"�����������Ƭ"     	,{2,1,1049,1},msg},   	3.00*100,7},
--	{{"6����ʯ��"          	,{2,1,30306,1},msg}, 	10.00*100,7},
--	{{"�ƽ�������գ�"   	,{2,1,538,1},msg}, 	17.00*100,30},
--	{{"����������ʯ"       	,{2,1,1067,1},msg},    3.00*100,30},
--	{{"�������"       		,{2,1,9998,1}},    	23.00*100,7},
--	{{"�Ի;�����"       	,{2,1,9977,1},msg},    10.00*100,7},
--	{{"�貨΢��"       		,{0,112,78,1},msg},    1.00*100 },
--	{{"�����"       		,{2,1,1001,1},msg},    2.50*100,7},
--	
--	{{"3��ǧ�ÿ̰�"       		,{2,1,30408,1}},    	1.00*100 ,30},
--	{{"15��ǿ����"       		,{2,1,30427,1},msg},    	0.50*100 ,30},
--	{{"14��ǿ����"       		,{2,1,30426,1},msg},    	1.00*100 ,30},
--	{{"3��ĥ��ʯ"       		,{2,1,30430,1}},    	1.50*100 ,7},
    {{"C�y B�t Nh� nh�"          ,{2,0,504,1}},     6000, 7},
    {{"C�y B�t Nh�"          ,{2,0,398,1}},     6000, 7},
    {{"C�y T� Linh"          ,{2,1,30269,1}},     6000, 7},
    {{"B�ch C�u Ho�n"          ,{2,1,270,1}},     6000, 7},
    {{"��i B�ch C�u ho�n"          ,{2,1,1007,1}},     8000, 7},
    {{"B�ch C�u Ti�n ��n"          ,{2,1,1008,1}},     6000, 7},
    {{"��i Nh�n s�m"          ,{2,0,553,1}},     5000, 7},
    {{"Hu�n ch��ng anh h�ng"          ,{2,1,30499,1,4}},     15000},
    {{"Hu�n ch��ng anh h�ng"          ,{2,1,30499,2,4}},     6000},
    {{"Hu�n ch��ng anh h�ng"          ,{2,1,30499,4,4}},     2000},
    {{"Hu�n ch��ng anh h�ng"          ,{2,1,30499,10,4}},     500},
    {{"M�nh Thi�n Cang"          ,{2,1,30390,10}},     12000},
    {{"M�nh Thi�n Cang"          ,{2,1,30390,20}},     3910},
    {{"M�nh Thi�n Cang"          ,{2,1,30390,100}},     400},
    {{"Thi�n Cang L�nh"          ,{2,95,204,1},msg},     100},
    {{"Huy Ch��ng ��ng Ch�", {0,153,1,1}}, 4000},
    {{"Huy Ch��ng Thi�t Ch�", {0,153,2,1}}, 4000},
    {{"Huy Ch��ng Ng�c Ch�", {0,153,3,1}}, 3060},
    {{"Huy Ch��ng Kim Ch� ng� h�nh", {0,153,4,1}}, 1000},
    {{"Huy Ch��ng M�c Ch� ng� h�nh", {0,153,5,1}}, 1000},
    {{"Huy Ch��ng Th�y Ch� ng� h�nh", {0,153,6,1}}, 1000},
    {{"Huy Ch��ng H�a Ch� ng� h�nh", {0,153,7,1}}, 1000},
    {{"Huy Ch��ng Th� Ch� ng� h�nh", {0,153,8,1}}, 1000},
    {{"Huy Ch��ng �m Ch� ng� h�nh", {0,153,9,1}}, 1000},
    {{"Huy Ch��ng Du Hi�p"          ,{0,153,26,1},msg},     10},
    {{"Huy Ch��ng Thi�t Huy�t"          ,{0,153,27,1},msg},     10},
    {{"Huy Ch��ng V�n Du"          ,{0,153,28,1},msg},     10},
}
tClause3 = {
--	{{"�����"           	,{2,1,1000,1}},        15.00*100 ,7},
--	{{"������"       		,{2,1,9999,1},msg},    6.00*100 ,7},
--	{{"���˲ι�"           	,{2,0,553,1}},        	5.00*100 ,7},
--	{{"�߼�ʦ���ؼ���"      ,{2,1,30627,1}},        5.00*100 ,7},
----	{{"��հ�����"          ,{0,107,166,1}},      	0.29*100 },
----	{{"Ǳ������"          ,{0,107,167,1}},      	0.29*100 },
----	{{"�޳����ᾭ"          ,{0,107,168,1}},      	0.29*100 },
----	{{"��������¼"          ,{0,107,169,1}},      	0.29*100 },
----	{{"������ؼ�"        ,{0,107,170,1}},      	0.29*100 },
----	{{"�̺�������"          ,{0,107,171,1}},      	0.29*100 },
----	{{"���������ؼ�"        ,{0,107,172,1}},      	0.29*100 },
----	{{"���������ؼ�"        ,{0,107,173,1}},      	0.29*100 },
----	{{"��Ӱ�����ؼ�"        ,{0,107,174,1}},      	0.29*100 },
----	{{"���ӽط��ؼ�"        ,{0,107,175,1}},      	0.29*100 },
----	{{"�������ǹ��"        ,{0,107,176,1}},      	0.29*100 },
----	{{"��������ؼ�"        ,{0,107,177,1}},      	0.29*100 },
----	{{"��ڤ��ħ¼"          ,{0,107,178,1}},      	0.29*100 },
----	{{"��ƻ�а¼"          ,{0,107,179,1}},      	0.29*100 },
----	{{"������׾�"        ,{0,107,198,1}},      	0.29*100 },
----	{{"�쳾������"          ,{0,107,202,1}},      	0.29*100 },
----	{{"�绨ǧҶ��"          ,{0,107,203,1}},      	0.29*100 },
--	{{"�����������Ƭ"     	,{2,1,1049,1},msg},   	5.00*100 ,7},
--	{{"����"     			,{2,1,1157,1},msg},   	5.00*100 ,30},
--	{{"�������"       		,{2,1,9998,1}},      	5.00*100 ,7},
--	--{{"������ʯ"       		,{2,1,30302,100},msg},	3.00*100 },
--	{{"����"               	,{0,105,15,1,1,-1,-1,-1,-1,-1,-1},msg,{30*24*60*60}},    5.00*100,45},
--	{{"����"               	,{0,105,19,1,1,-1,-1,-1,-1,-1,-1},msg,{30*24*60*60}},    5.00*100,45},
--	{{"����"               	,{0,105,16,1,1,-1,-1,-1,-1,-1,-1},msg,{30*24*60*60}},    5.00*100,45},
--	{{"����"               	,{0,105,20,1,1,-1,-1,-1,-1,-1,-1},msg,{30*24*60*60}},    5.00*100,45},
--	{{"��������"           	,{0,105,34,1,1,-1,-1,-1,-1,-1,-1},msg,{30*24*60*60}},    5.00*100,45},
--	--{{"�޺�ˮ"       		,{2,1,503,1},msg},	3.00*100 ,30},
--	--{{"ϴ�赤"       		,{2,0,136,1}},	2.00*100 ,30},
--	--{{"ϴ���鵤"       		,{2,0,137,1},msg},	1.00*100 ,30},
--	{{"���Ӱ�"       		,{2,1,30087,1}},	4.00*100 ,7},
--	{{"���������"       	,{2,0,398,1}},	5.00*100 ,7},
--	{{"С��������"       	,{2,0,504,1}},	7.00*100 ,7},
--	
--	{{"2��ǧ�ÿ̰�"       		,{2,1,30407,1}},    	1.00*100 ,30},
--	{{"14��ǿ����"       		,{2,1,30426,1},msg},    0.25*100 ,30},
--	{{"13��ǿ����"       		,{2,1,30425,1}},    	0.50*100 ,30},
--	{{"2��ĥ��ʯ"       		,{2,1,30429,1}},    	1.00*100 ,7},
--	{{"�̰�"       				,{2,1,30373,1}},    	1.25*100},
--	
--	{{"3������"       		,{2,1,30535,1},msg},      	3.00*100},
--	{{"������"       		,{2,1,30539,1}},      	3.00*100},
--	{{"������"       		,{2,1,30538,1}},      	2.00*100},
--	{{"����ʯ"       		,{2,1,30554,1}},      	1.00*100},
    {{"T� Linh Quy Nguy�n ��n"          ,{2,1,30352,1,4}},     5000},
    {{"B�i Nguy�n ��n"          ,{2,1,30351,1,4}},     5000},
    {{"Truy�n C�ng ��n"          ,{2,1,30313,1,4}},     5000},
    {{"M�nh Tu Ch�n Y�u Quy�t"          ,{2,1,30315,1,4}},     5000},
    {{"Thi�t Tinh c�p 1"          ,{2,1,30533,1,4}},     10000},
    {{"Thi�t Tinh c�p 2"          ,{2,1,30534,1,4}},     10000},
    {{"Thi�t Tinh c�p 3"          ,{2,1,30535,1,4}},     10000},
    {{"Huy Ch��ng ��ng Ch�"          ,{0,153,1,1}},     15000},
    {{"Huy Ch��ng Thi�t Ch�"          ,{0,153,2,1}},     20000},
    {{"Huy Ch��ng Ng�c Ch�"          ,{0,153,3,1}},     15000},
}
tClause4 = {
--	{{"С�׾���"          	,{2,1,30307,1}},       5.00*100 ,7},
--	{{"С������"          	,{2,1,30308,1}},       5.00*100 ,7},
--	{{"С������"          	,{2,1,30309,1}},       5.00*100 ,7},
--	{{"������"         	 	,{2,1,30313,1}},       5.00*100 ,7},
--	{{"�߼�ʦ���ؼ���"      ,{2,1,30627,1}},        2.80*100 ,7},
----	{{"��հ�����"          ,{0,107,166,1}},      	0.16*100 },
----	{{"Ǳ������"          ,{0,107,167,1}},      	0.16*100 },
----	{{"�޳����ᾭ"          ,{0,107,168,1}},      	0.16*100 },
----	{{"��������¼"          ,{0,107,169,1}},      	0.16*100 },
----	{{"������ؼ�"        ,{0,107,170,1}},      	0.16*100 },
----	{{"�̺�������"          ,{0,107,171,1}},      	0.16*100 },
----	{{"���������ؼ�"        ,{0,107,172,1}},      	0.16*100 },
----	{{"���������ؼ�"        ,{0,107,173,1}},      	0.16*100 },
----	{{"��Ӱ�����ؼ�"        ,{0,107,174,1}},      	0.16*100 },
----	{{"���ӽط��ؼ�"        ,{0,107,175,1}},      	0.16*100 },
----	{{"�������ǹ��"        ,{0,107,176,1}},      	0.16*100 },
----	{{"��������ؼ�"        ,{0,107,177,1}},      	0.16*100 },
----	{{"��ڤ��ħ¼"          ,{0,107,178,1}},      	0.16*100 },
----	{{"��ƻ�а¼"          ,{0,107,179,1}},      	0.16*100 },
----	{{"������׾�"        ,{0,107,198,1}},      	0.16*100 },
----	{{"�쳾������"          ,{0,107,202,1}},      	0.16*100 },
----	{{"�绨ǧҶ��"          ,{0,107,203,1}},      	0.16*100 },
--	--{{"������ʯ"         	,{2,1,30302,2}},  	 	10.00*100 },
--	--{{"���б���"         	,{2,1,30320,1}},   	3.00*100 },
--	{{"����ɢ"         		,{2,0,141,1}},   		3.00*100 ,30},
--	{{"�˱�����"         	,{2,1,1125,1}},   		5.00*100 },
--	{{"��ɽ�ز�"         	,{2,1,30310,1}},   	14.20*100 },
--	{{"��Ԫ��"         		,{2,1,30351,1}},		10.00*100},
--	
--	{{"1��ǧ�ÿ̰�"       	,{2,1,30406,1}},    	0.50*100 ,30},
--	{{"1��ĥ��ʯ"       	,{2,1,30428,1}},    	0.50*100 ,7},
--	
--	{{"��ʿѫ��"       	,{2,1,30498,1}},    	10*100},
--	{{"1������"       	,{2,1,30533,1}},    	10*100},
--	{{"2������"       	,{2,1,30534,1}},    	5*100},
--	{{"ǧ�ﴫ����ֽ"       	,{2,1,3508,1}},    	10*100},
--	{{"ϴ����"       	,{2,1,30613,1}},    	4*100},
--	{{"�����Ԫ��"       	,{2,1,30352,1}},    5.00*100},
    {{"T� Linh Quy Nguy�n ��n"          ,{2,1,30352,1,4}},     5000},
    {{"B�i Nguy�n ��n"          ,{2,1,30351,1,4}},     10000},
    {{"Truy�n C�ng ��n"          ,{2,1,30313,1,4}},     10000},
    {{"M�nh Tu Ch�n Y�u Quy�t"          ,{2,1,30315,1,4}},     5000},
    {{"Thi�t Tinh c�p 1"          ,{2,1,30533,1,4}},     20000},
    {{"Thi�t Tinh c�p 2"          ,{2,1,30534,1,4}},     10000},
    {{"Thi�t Tinh c�p 3"          ,{2,1,30535,1,4}},     10000},
    {{"Huy Ch��ng ��ng Ch�"          ,{0,153,1,1}},     15000},
    {{"Huy Ch��ng Thi�t Ch�"          ,{0,153,2,1}},     15000},
}
tClause5 = {
--	{{"�����籨"         	,{2,1,30314,1}},       20.00*100,7},
--	{{"ʦ��ʥ��"         	,{2,1,30311,1}},      	20.00*100,7},
--	{{"С������"          	,{2,1,30312,1}},      	18.00*100,7},
--	{{"����Ҫ����ҳ"        ,{2,1,30315,1}},      	10.00*100,7},
----	{{"��շ�ħ��"			,{0,107,1,1}},			0.14*100},
----	{{"��շ�ħ�ķ�"		,{0,107,2,1}},			0.14*100},
----	{{"Ǳ���ؼ�"			,{0,107,3,1}},			0.14*100},
----	{{"Ǳ���ķ�"			,{0,107,4,1}},			0.14*100},
----	{{"�޳��ؼ�"			,{0,107,5,1}},			0.14*100},
----	{{"�޳��ķ�"			,{0,107,6,1}},			0.14*100},
----	{{"�����ؼ�"			,{0,107,7,1}},			0.14*100},
----	{{"�����ķ�"			,{0,107,8,1}},			0.14*100},
----	{{"�����ؼ�"			,{0,107,9,1}},			0.14*100},
----	{{"�����ķ�"			,{0,107,10,1}},			0.14*100},
----	{{"�̺���"				,{0,107,11,1}},			0.14*100},
----	{{"�̺��ķ�"			,{0,107,12,1}},			0.14*100},
----	{{"�����ؼ�"			,{0,107,13,1}},			0.14*100},
----	{{"�����ķ�"			,{0,107,14,1}},			0.14*100},
----	{{"�����ؼ�"			,{0,107,15,1}},			0.14*100},
----	{{"�����ķ�"			,{0,107,16,1}},			0.14*100},
----	{{"��Ӱ�ؼ�"			,{0,107,17,1}},			0.14*100},
----	{{"��Ӱ�ķ�"			,{0,107,18,1}},			0.14*100},
----	{{"�����ؼ�"			,{0,107,19,1}},			0.14*100},
----	{{"�����ķ�"			,{0,107,20,1}},			0.14*100},
----	{{"����ؼ�"			,{0,107,21,1}},			0.14*100},
----	{{"����ķ�"			,{0,107,22,1}},			0.14*100},
----	{{"�����ؼ�"			,{0,107,23,1}},			0.14*100},
----	{{"�����ķ�"			,{0,107,24,1}},			0.14*100},
----	{{"��ڤ��¼"			,{0,107,25,1}},			0.14*100},
----	{{"��ڤ�ķ�"			,{0,107,26,1}},			0.14*100},
----	{{"����ؼ�"			,{0,107,27,1}},			0.14*100},
----	{{"����ķ�"			,{0,107,28,1}},			0.14*100},
----	{{"�����ؼ�"			,{0,107,180,1}},			0.14*100},
----	{{"�����ķ�"			,{0,107,181,1}},			0.14*100},
----	{{"�����ؼ�"			,{0,107,188,1}},			0.14*100},
----	{{"�����ķ�"			,{0,107,189,1}},			0.14*100},
----	{{"�����ؼ�"			,{0,107,190,1}},			0.14*100},
----	{{"�����ķ�"			,{0,107,191,1}},			0.14*100},
----	{{"������ʯ"         	,{2,1,30302,1}},          9.00*100},
----	{{"���б���"         	,{2,1,30320,1}},   	1.00*100},
--	
--	{{"��ʿѫ��"       	,{2,1,30498,1}},    	4.80*100},
--	{{"1������"       	,{2,1,30533,1}},    	9*100},
--	{{"2������"       	,{2,1,30534,1}},    	0.70*100},
--	{{"ϴ����"       	,{2,1,30613,1}},    	5*100},
--	{{"ǧ�ﴫ����ֽ"       	,{2,1,3508,1}},    	8*100},
--	{{"�����Ԫ��"       	,{2,1,30352,1}},    2.00*100},
--	{{"��Ԫ��"         		,{2,1,30351,1}},		2.50*100},

    {{"Ti�u truy�n c�ng ��n"          ,{2,1,30312,1,4}},     10000},
    {{"M�nh Tu Ch�n Y�u Quy�t"          ,{2,1,30315,1,4}},     10000},
    {{"Thi�t Tinh c�p 1"          ,{2,1,30533,1,4}},     40000},
    {{"Thi�t Tinh c�p 2"          ,{2,1,30534,1,4}},     30000},
    {{"Huy Ch��ng ��ng Ch�"          ,{0,153,1,1}},     10000},
}
function getLootSeting(bossLv)
	local t = {tClause1,tClause2,tClause3,tClause4,tClause5}
	tClause = t[bossLv];
	if not tClause then
		print(format("[getLootSeting] [error bossLv] [bossLv=%s]", tostring(bossLv)));
		assert()
	end
	return tClause;
end

function getLootItem(bossLv)
	local tClause = getLootSeting(bossLv);

	local nMax = 0;
	for i = 1, getn(tClause) do
		nMax = nMax + tClause[i][2];
	end
	local rnd = random(1, nMax);
	for i = 1, getn(tClause) do
		rnd = rnd - tClause[i][2];
		if rnd <= 0 then
			return i, tClause[i][1];
		end
	end
	print("[getLootItem] [error random] [nMax=%d, rnd=%d]", nMax, rnd);
	assert();
end

function main()
	speLoot();
end

function speLoot()
	local nNpcIdx = GetTargetNpc();
    local bossId = GetMissionV(MV_CUR_BOSS_ID);
	local bossLv = tMission:getBossLv(bossId);
	local daye = GetMissionV(MV_DAYE);
	if daye == -1 or daye == 0 then
		return
	end
	local tSel = {
			"K�t th�c ��i tho�i/nothing",
		}
	local OldPlayerIndex = PlayerIndex;
	if daye == PlayerIndex then
		local player_name = ""
		for i = 1,GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex ~= OldPlayerIndex then
				player_name = GetName();
				player_name = zgc_pub_name_replace(player_name,"/","-");
				player_name = zgc_pub_name_replace(player_name,"|","-");
				player_name = zgc_pub_name_replace(player_name,":","-");
				tinsert(tSel, 1, "Ta c�n mang ph�n th��ng ph�n cho "..player_name.."/#lootAwardOther("..PlayerIndex..","..nNpcIdx..")");
			end
		end
		PlayerIndex = OldPlayerIndex;
		tinsert(tSel, 1, "Ta mu�n nh�n ph�n th��ng/#lootAward("..PlayerIndex..","..nNpcIdx..")");
	end


	local nLootItemId = GetMissionV(MV_LOOT_ID);
	if nLootItemId == 0 then
		nLootItemId = getLootItem(bossLv);
		SetMissionV(MV_LOOT_ID, nLootItemId);
	end

	local tClause = getLootSeting(bossLv);
	if not tClause or not tClause[nLootItemId] or not tClause[nLootItemId][1] then
		WriteLog(format("[ERROR] [liangshan:lootError] [Role:%s Acc:%s][bossLv=%s, nLootItemId=%s]",
			GetName(), GetAccount(), tostring(bossLv), tostring(nLootItemId)));
		nLootItemId = getLootItem(bossLv);
		SetMissionV(MV_LOOT_ID, nLootItemId);
	end
	local tLootItem = tClause[nLootItemId][1];
	local nCount = (tLootItem[2] and tLootItem[2][4]) or 1;
	local msg = format("<color=yellow>[%s]x%d<color>",tLootItem[1], nCount);
	Say("<color=green>B�o r��ng<color>: � ��y c�"..msg, getn(tSel), tSel);
end

function lootAwardOther(player_index, box_index)

	if 1 ~= tMission:CheckTargetNpc(box_index) then return end

	local player_index_save = PlayerIndex
	--�жϸ������Ƿ����ڸö�����
	local index_chg_chk_flag = 0
	local team_size = GetTeamSize()
	if team_size ~= 0 then
		index_chg_chk_flag = zgc_pub_same_team_chk(player_index)
	else
		index_chg_chk_flag = 1
	end
	if index_chg_chk_flag ~= 1 then
		Talk(1,"","<color=green>Ch� �<color>: Xin m�i h�y ki�m tra l�i nh�ng ng��i m� b�n ph�n chia c� ph�i c� c�ng <color=yellow>t� ��i<color> v�i b�n!")
		return
	end
	--�������Ŀռ为�ؼ��
	PlayerIndex = player_index
	local s_palyer_name = GetName()
	if GetFreeItemRoom()  < 3 then
		Talk(1,"","<color=green>Th�ng b�o<color>: <color=yellow>H�nh trang<color> c�c h� kh�ng ��!")
		PlayerIndex = player_index_save
		Talk(1,"","<color=green>Th�ng b�o<color>: : <color=green>"..s_palyer_name.."<color><color=yellow>H�nh trang<color> �� ��y, kh�ng th� ph�n ph�i!")
		return
	end

	PlayerIndex = player_index_save

	lootAward(player_index, box_index)

end

function lootAward(player_index, box_index)

	if 1 ~= tMission:CheckTargetNpc(box_index) then return end

	local player_index_save = PlayerIndex

	PlayerIndex = player_index;
	if gf_JudgeRoomWeight(3, 100, "") ~= 1 then return end
	PlayerIndex = player_index_save;

	local bossId = GetMissionV(MV_CUR_BOSS_ID);
	local bossLv = tMission:getBossLv(bossId);

	local daye = GetMissionV(MV_DAYE);
	if daye == -1 then
		daye = GetTeamMember(0);
	end
	if daye ~= PlayerIndex then
		return
	end

	local nLootItemId = GetMissionV(MV_LOOT_ID);
	if nLootItemId == 0 then
		nLootItemId = getLootItem(bossLv);
	end
	local tLoot = getLootSeting(bossLv)[nLootItemId];
	SetMissionV(MV_LOOT_ID, 0);
	SetMissionV(MV_DAYE, 0);
	SetMissionV(MV_LAO_ER, 0);

	SetNpcLifeTime(box_index, 0);
	PlayerIndex = player_index;
	gf_SetLogCaption("liangshan:ib_box");
	local nItemIndex = Clause3.giveClause(tLoot[1]);
	if tLoot[3] then
		SetItemExpireTime(nItemIndex,tLoot[3]*DAY_SECOND_NUM)
	end
	gf_SetLogCaption("");
	PlayerIndex = player_index_save;
	
		--�����
	if tLoot[1][1] == TTGLInfo[4] then
		_stat_when_ib_produce(tLoot[1][2][4])--IB���߲���ͳ��
	end
end
