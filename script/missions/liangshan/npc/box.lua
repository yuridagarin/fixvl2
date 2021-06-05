Include("\\script\\missions\\liangshan\\head.lua")
Include("\\script\\missions\\liangshan\\mission\\tmission.lua")
Include("\\script\\class\\clause3.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

SF_FILE = "\\script\\missions\\liangshan\\npc\\box.lua"
--��ɽ���佱��
tClause4 = {
	{{"Ti�u B�ch C�u ho�n"          	,{2,1,30307,1}},       5.00*100 ,7},
	{{"Ti�u Tam Thanh Ho�n"          	,{2,1,30308,1}},       5.00*100 ,7},
	{{"Ti�u L�c Th�n Ho�n"          	,{2,1,30309,1}},       5.00*100 ,7},
	{{"Truy�n C�ng ��n"         	 	,{2,1,30313,1}},       5.00*100 ,7},
	{{"T�i m�t t�ch s� m�n cao c�p"      ,{2,1,30627,1}},        2.80*100 ,7},
--	{{"��հ�����"          ,{0,107,166,1}},      	0.16*100 },
--	{{"Ǳ������"          ,{0,107,167,1}},      	0.16*100 },
--	{{"�޳����ᾭ"          ,{0,107,168,1}},      	0.16*100 },
--	{{"��������¼"          ,{0,107,169,1}},      	0.16*100 },
--	{{"������ؼ�"        ,{0,107,170,1}},      	0.16*100 },
--	{{"�̺�������"          ,{0,107,171,1}},      	0.16*100 },
--	{{"���������ؼ�"        ,{0,107,172,1}},      	0.16*100 },
--	{{"���������ؼ�"        ,{0,107,173,1}},      	0.16*100 },
--	{{"��Ӱ�����ؼ�"        ,{0,107,174,1}},      	0.16*100 },
--	{{"���ӽط��ؼ�"        ,{0,107,175,1}},      	0.16*100 },
--	{{"�������ǹ��"        ,{0,107,176,1}},      	0.16*100 },
--	{{"��������ؼ�"        ,{0,107,177,1}},      	0.16*100 },
--	{{"��ڤ��ħ¼"          ,{0,107,178,1}},      	0.16*100 },
--	{{"��ƻ�а¼"          ,{0,107,179,1}},      	0.16*100 },
--	{{"������׾�"        ,{0,107,198,1}},      	0.16*100 },
--	{{"�쳾������"          ,{0,107,202,1}},      	0.16*100 },
--	{{"�绨ǧҶ��"          ,{0,107,203,1}},      	0.16*100 },
	--{{"������ʯ"         	,{2,1,30302,2}},  	 	10.00*100 },
	--{{"���б���"         	,{2,1,30320,1}},   	3.00*100 },
	{{"Ti�u Ki�p t�n"         		,{2,0,141,1}},   		3.00*100 ,30},
	{{"b�nh �t B�c B�o"         	,{2,1,1125,1}},   		5.00*100 },
	{{"��c s�n L��ng S�n"         	,{2,1,30310,1}},   	14.20*100 },
	{{"B�i Nguy�n ��n"         		,{2,1,30351,1}},   	10.00*100},
	
	{{"Thi�n Huy�n Kh�c B�n c�p 1 "       	,{2,1,30406,1}},    	0.50*100 ,30},
	{{"Ma �ao Th�ch c�p 1"       	,{2,1,30428,1}},    	0.50*100 ,7},
	
	{{"Hu�n ch��ng d�ng s�"       	,{2,1,30498,1}},    	10*100},
	{{"Thi�t Tinh c�p 1"       	,{2,1,30533,1}},    	10*100},
	{{"Thi�t Tinh c�p 2"       	,{2,1,30534,1}},    	5*100},
	{{"Thi�n L� Truy�n �m Ph� Ch�"       	,{2,1,3508,1}},    	10*100},
	{{"T�y Tr�n �an"       	,{2,1,30613,1}},    	4*100},
	{{"T� Linh Quy Nguy�n ��n"       	,{2,1,30352,1}},    5.00*100},
}
tClause5 = {
	{{"V� l�m b�o m�i"         	,{2,1,30314,1}},       20.00*100,7},
	{{"Th�nh V�t S� M�n"         	,{2,1,30311,1}},      	20.00*100,7},
	{{"Ti�u truy�n c�ng ��n"          	,{2,1,30312,1}},      	18.00*100,7},
	{{"M�nh Tu Ch�n Y�u Quy�t"        ,{2,1,30315,1}},      	10.00*100,7},
--	{{"��շ�ħ��"			,{0,107,1,1}},			0.10*100},
--	{{"��շ�ħ�ķ�"		,{0,107,2,1}},			0.10*100},
--	{{"Ǳ���ؼ�"			,{0,107,3,1}},			0.10*100},
--	{{"Ǳ���ķ�"			,{0,107,4,1}},			0.10*100},
--	{{"�޳��ؼ�"			,{0,107,5,1}},			0.10*100},
--	{{"�޳��ķ�"			,{0,107,6,1}},			0.10*100},
--	{{"�����ؼ�"			,{0,107,7,1}},			0.10*100},
--	{{"�����ķ�"			,{0,107,8,1}},			0.10*100},
--	{{"�����ؼ�"			,{0,107,9,1}},			0.10*100},
--	{{"�����ķ�"			,{0,107,10,1}},			0.10*100},
--	{{"�̺���"				,{0,107,11,1}},			0.10*100},
--	{{"�̺��ķ�"			,{0,107,12,1}},			0.10*100},
--	{{"�����ؼ�"			,{0,107,13,1}},			0.10*100},
--	{{"�����ķ�"			,{0,107,14,1}},			0.10*100},
--	{{"�����ؼ�"			,{0,107,15,1}},			0.10*100},
--	{{"�����ķ�"			,{0,107,16,1}},			0.10*100},
--	{{"��Ӱ�ؼ�"			,{0,107,17,1}},			0.10*100},
--	{{"��Ӱ�ķ�"			,{0,107,18,1}},			0.10*100},
--	{{"�����ؼ�"			,{0,107,19,1}},			0.10*100},
--	{{"�����ķ�"			,{0,107,20,1}},			0.10*100},
--	{{"����ؼ�"			,{0,107,21,1}},			0.10*100},
--	{{"����ķ�"			,{0,107,22,1}},			0.10*100},
--	{{"�����ؼ�"			,{0,107,23,1}},			0.10*100},
--	{{"�����ķ�"			,{0,107,24,1}},			0.10*100},
--	{{"��ڤ��¼"			,{0,107,25,1}},			0.10*100},
--	{{"��ڤ�ķ�"			,{0,107,26,1}},			0.10*100},
--	{{"����ؼ�"			,{0,107,27,1}},			0.10*100},
--	{{"����ķ�"			,{0,107,28,1}},			0.10*100},
--	{{"�����ؼ�"			,{0,107,180,1}},			0.10*100},
--	{{"�����ķ�"			,{0,107,181,1}},			0.10*100},
--	{{"�����ؼ�"			,{0,107,188,1}},			0.10*100},
--	{{"�����ķ�"			,{0,107,189,1}},			0.10*100},
--	{{"�����ؼ�"			,{0,107,190,1}},			0.10*100},
--	{{"�����ķ�"			,{0,107,191,1}},			0.10*100},
--	{{"������ʯ"         	,{2,1,30302,1}},          9.00*100},
--	{{"���б���"         	,{2,1,30320,1}},   	0.70*100},
--	{{"��Ԫ��"         		,{2,1,30351,1}},   	2.50*100, 2},
	
	{{"Hu�n ch��ng d�ng s�"       	,{2,1,30498,1}},    	4.80*100},
	{{"Thi�t Tinh c�p 1"       	,{2,1,30533,1}},    	9*100},
	{{"Thi�t Tinh c�p 2"       	,{2,1,30534,1}},    	0.70*100},
	{{"T�y Tr�n �an"       	,{2,1,30613,1}},    	5*100},
	{{"Thi�n L� Truy�n �m Ph� Ch�"       	,{2,1,3508,1}},    	8*100},
	{{"T� Linh Quy Nguy�n ��n"       	,{2,1,30352,1}},    2.00*100},
	{{"B�i Nguy�n ��n"         		,{2,1,30351,1}},		2.50*100},
}
function getLootSeting(bossLv, bIB)
	if bossLv == 5 then
		tClause = tClause5;
	elseif bossLv == 4 then
		tClause	= tClause4;
	end
	local t = {nil, nil, nil, tClause4,tClause5}
	tClause = t[bossLv];

	if not tClause then
		print(format("[getLootSeting] [error bossLv] [bossLv=%s]", tostring(bossLv)));
		assert()
	end
	return tClause;
end

function getLootItem(bossLv, bIB)
	local tClause = getLootSeting(bossLv, bIB);

	local nMax = 0;
	for i = 1, getn(tClause) do
		nMax = nMax + tClause[i][2];
	end
	local rnd = random(1, nMax);
	for i = 1, getn(tClause) do
		rnd = rnd - tClause[i][2];
		if rnd <= 0 then
			return i,tClause[i][1],tClause[i][3];
		end
	end
	print("[getLootItem] [error random] [nMax=%d, rnd=%d]", nMax, rnd);
	assert();
end

function main()
	local nNpcIdx = GetTargetNpc();
    local nStage = GetMissionV(MV_STAGE_LEVEL);
    local bossId = GetUnitCurStates(nNpcIdx, 5)
    if bossId == 0 then
    	bossId = GetMissionV(MV_CUR_BOSS_ID);
    end
	local bossLv = tMission:getBossLv(bossId);

	normalLoot(nNpcIdx, bossLv);
end

function normalLoot(nNpcIdx, bossLv)
	local dwId = GetUnitCurStates(nNpcIdx, 3)
	if dwId == 0 then
		local nRet = ApplyItemDice(1, 100, 30, SF_FILE, "GD_Time_Over", GetTeamSize())
		dwId = nRet;
		local _, tLootItem,nExpireDay = getLootItem(bossLv);
		WriteLog(format("[liangshan:box] [CreateItem:%s]", tLootItem[1]));
		local nItemIndex = AddDiceItemInfo(dwId, gf_UnPack(tLootItem[2]))
		if nExpireDay then
			SetItemExpireTime(nItemIndex,nExpireDay*DAY_SECOND_NUM)
		end
		AddUnitStates(nNpcIdx, 3, dwId);
		local nPlayerOld = PlayerIndex
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			if IsPlayerDeath() == 0 then
				RollItem(dwId)
				--Observer:onEvent(OE_LIANGSHAN_BOX);
			end
		end
		PlayerIndex = nPlayerOld
		return
	end

	local nState = GetItemDiceState(dwId)
	if nState == 0 then
		Msg2Player(LSMsgToPlayer[2])
	elseif nState == 1 then
		local n, szItem = DiceLootItem(dwId)
		if n == 0 then
			local szMsg = GetName()..LSMsgToPlayer[4]..szItem
			MU_Msg2Team(szMsg)
		elseif n == 1 then
			Msg2Player(LSMsgToPlayer[3])
		end
	elseif nState == 2 then
		Msg2Player(LSMsgToPlayer[5])
	end
end

function GD_Time_Over(dwId)
	local t, nSize, szItem = GetItemDiceRollInfo(dwId)
	local bAllGiveUp = 1
	for index, value in t do
		local str = value[1]..format(LSMsgToPlayer[8],value[2])
		if value[3] == 0 then
			str = value[1]..LSMsgToPlayer[9]
		elseif value[3] == 1 then
			str = str.."("..LSMsgToPlayer[10]..")"
			if value[4] == 1 then
				str = str.." -- "..LSMsgToPlayer[11]..szItem
			end
			bAllGiveUp = 0
		elseif value[3] == 2 then
			str = str.."("..LSMsgToPlayer[12]..")"
			if value[4] == 1 then
				str = str.." -- "..LSMsgToPlayer[11]..szItem
			end
			bAllGiveUp = 0
		end
		Msg2Player(str)
	end
	if bAllGiveUp == 1 then
		Msg2Player(LSMsgToPlayer[6])
	elseif nSize ~= getn(t) then
		Msg2Player(LSMsgToPlayer[7])
	end
end
