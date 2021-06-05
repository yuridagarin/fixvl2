Include("\\script\\missions\\dixuangong\\mission_head.lua")
Include("\\script\\class\\clause3.lua")
Include("\\script\\lib\\globalfunctions.lua")
--Include("\\script\\misc\\data_state\\state.lua")
Include("\\script\\online_activites\\award.lua")

msg = "Ch�c m�ng $n m� B�o R��ng ��a Huy�n Cung  nh�n ���c $i";

--��Ӣ����
tClause1 = {
    {{"T� Linh Quy Nguy�n ��n"     , {2,1,30352,1,4}}, 500},
    {{"B�i Nguy�n ��n"     , {2,1,30351,1,4}}, 1000},
    {{"Truy�n C�ng ��n"     , {2,1,30313,1,4}}, 1000},
    {{"M�nh Tu Ch�n Y�u Quy�t"     , {2,1,30315,1,4}}, 500},
    {{"Thi�t Tinh c�p 1"     , {2,1,30533,1,4}}, 2000},
    {{"Thi�t Tinh c�p 2"     , {2,1,30534,1,4}}, 1000},
    {{"Thi�t Tinh c�p 3"     , {2,1,30535,1,4}}, 1000},
    {{"�o Cho�ng T�o B�"     , {0,152,1,1}}, 1500},
    {{"�o Cho�ng C�m �o�n"     , {0,152,2,1}}, 1500},
}

--���챦��
tClause2 = {
    {{"V� l�m b�o m�i"     , {2,1,30314,1,4}}, 500},
    {{"Th�nh V�t S� M�n"     , {2,1,30311,1,4}}, 500},
    {{"Truy�n C�ng ��n"     , {2,1,30313,1,4}}, 500},
    {{"M�nh Tu Ch�n Y�u Quy�t"     , {2,1,30315,1,4}}, 500},
    {{"Thi�t Tinh c�p 1"     , {2,1,30533,1,4}}, 1000},
    {{"Thi�t Tinh c�p 2"     , {2,1,30534,1,4}}, 1000},
    {{"Thi�t Tinh c�p 3"     , {2,1,30535,1,4}}, 1000},
    {{"�o Cho�ng T�o B�"     , {0,152,1,1}}, 1500},
    {{"�o Cho�ng C�m �o�n"     , {0,152,2,1}}, 2000},
    {{"�o Cho�ng H�a V�n"     , {0,152,3,1}}, 1500},
}

--���ñ���
tClause3 = {
    {{"C�y B�t Nh� nh�"     , {2,0,504,1},nil,{7*24*3600}}, 600},
    {{"C�y B�t Nh�"     , {2,0,398,1},nil,{7*24*3600}}, 600},
    {{"C�y T� Linh"     , {2,1,30269,1},nil,{7*24*3600}}, 600},
    {{"B�ch C�u Ho�n"     , {2,1,270,1},nil,{7*24*3600}}, 600},
    {{"��i B�ch C�u ho�n"     , {2,1,1007,1},nil,{7*24*3600}}, 800},
    {{"B�ch C�u Ti�n ��n"     , {2,1,1008,1},nil,{7*24*3600}}, 600},
    {{"��i Nh�n s�m"     , {2,0,553,1},nil,{7*24*3600}}, 500},
    {{"Hu�n ch��ng anh h�ng"     , {2,1,30499,1,4}}, 1500},
    {{"Hu�n ch��ng anh h�ng"     , {2,1,30499,2,4}}, 600},
    {{"Hu�n ch��ng anh h�ng"     , {2,1,30499,4,4}}, 200},
    {{"Hu�n ch��ng anh h�ng"     , {2,1,30499,10,4}}, 50},
    {{"M�nh Thi�n M�n"     , {2,1,30410,2}}, 1200},
    {{"M�nh Thi�n M�n"     , {2,1,30410,4}}, 391},
    {{"M�nh Thi�n M�n"     , {2,1,30410,20}}, 40},
    {{"Thi�n M�n Kim L�nh"     , {2,1,30370,1},msg}, 10},
    {{"�o Cho�ng T�o B�"     , {0,152,1,1}}, 400},
    {{"�o Cho�ng C�m �o�n"     , {0,152,2,1}}, 400},
    {{"�o Cho�ng H�a V�n"     , {0,152,3,1}}, 306},
    {{"�o Cho�ng Ng� H�nh Kim Ch�"     , {0,152,4,1}}, 100},
    {{"�o Cho�ng Ng� H�nh M�c Ch�"     , {0,152,5,1}}, 100},
    {{"�o Cho�ng Ng� H�nh Th�y Ch�"     , {0,152,6,1}}, 100},
    {{"�o Cho�ng Ng� H�nh H�a Ch�"     , {0,152,7,1}}, 100},
    {{"�o Cho�ng Ng� H�nh Th� Ch�"     , {0,152,8,1}}, 100},
    {{"�o Cho�ng Ng� H�nh �m Ch�"     , {0,152,9,1}}, 100},
    {{"�o Cho�ng Du Hi�p"     , {0,152,26,1},msg}, 1},
    {{"�o Cho�ng Thi�t Huy�t"     , {0,152,27,1},msg}, 1},
    {{"�o Cho�ng V�n Du"     , {0,152,28,1},msg}, 1},
}

--���±���
tClause4 = {
    {{"Thi�n M�n Kim L�nh"     , {2,1,30370,1},msg}, 8000},
    {{"Thi�n M�n Kim L�nh"     , {2,1,30370,2},msg}, 1000},
    {{"Thi�n M�n Kim L�nh"     , {2,1,30370,3},msg}, 500},
    {{"�o Cho�ng Du Hi�p"     , {0,152,26,1},msg}, 200},
    {{"�o Cho�ng Thi�t Huy�t"     , {0,152,27,1},msg}, 200},
    {{"�o Cho�ng V�n Du"     , {0,152,28,1},msg}, 100},
}

tClause = {
	tClause1,
	tClause2,
	tClause3,
	tClause4,
}

function main()
	local tItem = getLootItem();
	if not tItem then return end

	local Daye = GetMissionV(MV_SP_DAYE)
	local tSel = {"K�t th�c ��i tho�i/nothing"}
	if PlayerIndex == Daye then
		tSel = {
			format("Thu th�p v�t ph�m/#lootAwardOther(%d, %d)",PlayerIndex, GetTargetNpc()),
			format("Ph�n chia cho t� ��i/#giveOther(%d)",GetTargetNpc()),
			"K�t th�c ��i tho�i/nothing",
		}
	end
	local msg = format("Trong b�o r��ng c� [%s *%d]",tItem[1], tItem[2][4]);
	Say(msg, getn(tSel), tSel);
end

function getRandItem(tClause)
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

function getLootItem()
	local lv = GetMissionV(MV_SP_BOSS_LV);
	local clause = tClause[lv];
	if not clause then return end;

	local sp = GetMissionV(MV_SP_LOOT_ID);
	if sp == 0 then
		sp = getRandItem(clause)
		SetMissionV(MV_SP_LOOT_ID, sp);
		local tItem = clause[sp][1];
		WriteLog(format("[dixuangong:lootItem2] [Role:%s Acc:%s] [bossLv=%d, lootId=%d, itemName=%sx%d]",
			GetName(), GetAccount(), lv, sp, tItem[1], tItem[2][4]));
		--����ͳ��
		if tItem[1] == "Thi�n M�n Kim L�nh" then
			AddRuntimeStat(1,14,0,tItem[2][4]);
		elseif tItem[1] == "C�p 3 Luy�n L� Thi�t" then
			AddRuntimeStat(1,16,0,tItem[2][4]);
		elseif tItem[1] == "C�p 3 T�y T�m Th�ch" then
			AddRuntimeStat(1,17,0,tItem[2][4]);
		elseif tItem[1] == "B� Ng�n To�n" then
			AddRuntimeStat(1,18,0,tItem[2][4]);
		elseif tItem[1] == "B� Ng�n Ch�y" then
			AddRuntimeStat(1,19,0,tItem[2][4]);
		end
		--2Xu
		--open_dxg_tyjyx_award();
	end
	local tItem = clause[sp][1];
	return tItem;
end

function giveOther(npcId)
	local oldPidx = PlayerIndex;
	local tSel = {}
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if oldPidx ~= PlayerIndex then
			local player_name = GetName();
			player_name = gsub(player_name,"/","-");
			player_name = gsub(player_name,"|","-");
			player_name = gsub(player_name,":","-");
			tinsert(tSel, 1, "Ta c�n mang ph�n th��ng ph�n cho   "..player_name.."/#lootAwardOther("..PlayerIndex..","..npcId..")");
		end
	end
	tinsert(tSel, "K�t th�c ��i tho�i/nothing");
	PlayerIndex = oldPidx;
	local tLootItem = getLootItem();
	local nCount = (tLootItem[2] and tLootItem[2][4]) or 1;
	local msg = format("<color=yellow>[%s]x%d<color>",tLootItem[1], nCount);
	Say("<color=green>B�o r��ng<color>: � ��y c�"..msg, getn(tSel), tSel);
end

function lootAwardOther(pidx, npcId)
	local oldPidx = PlayerIndex;
	PlayerIndex = pidx;
	local name = GetName();
	if gf_JudgeRoomWeight(1,10) ~= 1 then
		Msg2Player("Kh�ng gian ho�c s�c n�ng c�a ng��i kh�ng ��, kh�ng th� nh�n v�t ph�m");
		if pidx ~= oldPidx then
			PlayerIndex = oldPidx;
			Msg2Player(format("%s kh�ng gian ho�c s�c n�ng kh�ng ��, kh�ng th� nh�n v�t ph�m", name));
		end
		return
	end
	giveAward(npcId);
	PlayerIndex = oldPidx;
end

function giveAward(npcId)
	local tItem = getLootItem();
	if not tItem then return end

	SetMissionV(MV_SP_LOOT_ID, 0);
	SetMissionV(MV_SP_DAYE, 0);
	SetNpcScript(npcId, "");
	SetNpcLifeTime(npcId, 0);

	gf_SetLogCaption("dixuangong:ibbox2");
	Clause3.giveClause(tItem);
	gf_SetLogCaption("");
end
