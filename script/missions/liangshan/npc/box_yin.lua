Include("\\script\\class\\clause3.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\define.lua")
--Include("\\script\\missions\\dixuangong\\mission_head.lua")
Include("\\script\\online\\zgc_public_fun.lua")
--Include("\\script\\misc\\data_state\\state.lua")
--Include("\\script\\online_activites\\award.lua")
Include("\\script\\missions\\liangshan\\runtime_data_stat.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

msg = "Ch�c m�ng $n m� R��ng L��ng S�n Qu�n Anh H�i ���c $i";

MV_WHO_IS_DAYE = 26
MV_LOOT_ID = 28
TSK_SCRORE = VET_MS_TASKID_JUYILING
TSK_SCRORE_ACC_CODE=0
LOG_TITLE="liangshan yin box"
NEED_ROOM=2
OPEN_BOX_NEED = {"Thi�n Ki�u L�nh",2, 97, 236,1}

T_YinBoxScript={
	"\\script\\missions\\liangshan\\npc\\box_yin.lua",
	"\\script\\missions\\liangshan\\npc\\box_yin.lua",
	"\\script\\missions\\liangshan\\npc\\box_yin.lua",
	nil,
	"\\script\\missions\\liangshan\\npc\\box_yin.lua",
	"\\script\\missions\\liangshan\\npc\\box_yin.lua",
	"\\script\\missions\\liangshan\\npc\\box_yin.lua",
	nil,
}

T_YIN_BOX_IDX = {}
function remove_yin_box()
	for i,v in T_YIN_BOX_IDX do
		if GetNpcName(i) == "R��ng B�c" then
			SetNpcLifeTime(i, 0);
		end
	end
	T_YIN_BOX_IDX = {}
end

function create_box_yin(m,x,y, nStage)
	if not T_YinBoxScript[nStage] then
		return
	end
	--local m, x, y = GetNpcWorldPos(nNpcIdx);
	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
	local npc = CreateNpc("yinbaoxiang", "R��ng B�c", m, x2, y2);
	if npc and npc > 0 then
		T_YIN_BOX_IDX[npc] = 1
		--SetNpcLifeTime(npc, 180);
		SetNpcScript(npc, T_YinBoxScript[nStage]);
	else
		print("create ls yinbaoxiang fail")
	end
end

tAward = {
	randMulti = 1,
	subclauses = {
        {{"C�y B�t Nh� nh�"    ,{2,0,504,1},nil,{7*24*3600}},6000},
        {{"C�y B�t Nh�"    ,{2,0,398,1},nil,{7*24*3600}},6000},
        {{"C�y T� Linh"    ,{2,1,30269,1},nil,{7*24*3600}},6000},
        {{"B�ch C�u Ho�n"    ,{2,1,270,1},nil,{7*24*3600}},6000},
        {{"��i B�ch C�u ho�n"    ,{2,1,1007,1},nil,{7*24*3600}},8000},
        {{"B�ch C�u Ti�n ��n"    ,{2,1,1008,1},nil,{7*24*3600}},6000},
        {{"��i Nh�n s�m"    ,{2,0,553,1},nil,{7*24*3600}},5000},
        {{"Hu�n ch��ng anh h�ng"    ,{2,1,30499,1,4}},15000},
        {{"Hu�n ch��ng anh h�ng"    ,{2,1,30499,2,4}},6000},
        {{"Hu�n ch��ng anh h�ng"    ,{2,1,30499,4,4}},2000},
        {{"Hu�n ch��ng anh h�ng"    ,{2,1,30499,10,4}},500},
        {{"M�nh Thi�n Cang"    ,{2,1,30390,10}},12000},
        {{"M�nh Thi�n Cang"    ,{2,1,30390,20}},3910},
        {{"M�nh Thi�n Cang"    ,{2,1,30390,100}},400},
        {{"Thi�n Cang L�nh"    ,{2,95,204,1},msg},100},
        {{"Huy Ch��ng ��ng Ch�", {0,153,1,1}}, 4000},
        {{"Huy Ch��ng Thi�t Ch�", {0,153,2,1}}, 4000},
        {{"Huy Ch��ng Ng�c Ch�", {0,153,3,1}}, 3060},
        {{"Huy Ch��ng Kim Ch� ng� h�nh", {0,153,4,1}}, 1000},
        {{"Huy Ch��ng M�c Ch� ng� h�nh", {0,153,5,1}}, 1000},
        {{"Huy Ch��ng Th�y Ch� ng� h�nh", {0,153,6,1}}, 1000},
        {{"Huy Ch��ng H�a Ch� ng� h�nh", {0,153,7,1}}, 1000},
        {{"Huy Ch��ng Th� Ch� ng� h�nh", {0,153,8,1}}, 1000},
        {{"Huy Ch��ng �m Ch� ng� h�nh", {0,153,9,1}}, 1000},
        {{"Huy Ch��ng Du Hi�p"    ,{0,153,26,1},msg},10},
        {{"Huy Ch��ng Thi�t Huy�t"    ,{0,153,27,1},msg},10},
        {{"Huy Ch��ng V�n Du"    ,{0,153,28,1},msg},10},
	},
	giveClause = ClauseRandom.giveClause,
	give = ClauseRandom.giveClause,
}

--needItem = {T_TIANJIAOLING[4], {T_TIANJIAOLING[1],T_TIANJIAOLING[2],T_TIANJIAOLING[3],N_CALL_BOSS_TIANJIAOLING_NEED}};

tTemp = {};

function main()
	local npcIdx = GetTargetNpc();
	if GetMissionV(MV_WHO_IS_DAYE) == 0 then
		Say("M� [R��ng B�c] c�n 1 [Thi�n Ki�u L�nh] (Ng� C�c c� b�n).",
			2,
			"\n x�c nh�n m�/#IamDaye("..npcIdx..")",
			"\n h�y m�/nothing");
		return
	else
		speLoot(npcIdx);
	end
end

function IamDaye(npcIdx)
	local daye = GetMissionV(MV_WHO_IS_DAYE);

	if 0 ~= daye then
		Talk(1, "", "�� c� ng��i m� r��ng n�y r�i");
		return 0;
	end

	if DelItem(OPEN_BOX_NEED[2],OPEN_BOX_NEED[3],OPEN_BOX_NEED[4],OPEN_BOX_NEED[5]) == 1 then
		SetMissionV(MV_WHO_IS_DAYE, PlayerIndex);
		--SetMissionV(MV_LAO_ER_2, PlayerIndex);
		if TSK_SCRORE and TSK_SCRORE > 0 then
			gf_ModifyTask(TSK_SCRORE, OPEN_BOX_NEED[5], TSK_SCRORE_ACC_CODE);
		end
		speLoot(npcIdx);
		_stat_when_ib_consume(OPEN_BOX_NEED[5])--IB����ͳ��
		--2Xu�
		vaf_award_api("tLiangShanYinBox")
		Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {OPEN_BOX_NEED[2],OPEN_BOX_NEED[3],OPEN_BOX_NEED[4],OPEN_BOX_NEED[5]})
	else
		Talk(1, "", "Tr�n ng��i kh�ng c� [Thi�n Ki�u L�nh], kh�ng th� m� <color=green>R��ng B�c<color>. [Thi�n Ki�u L�nh] c� th� mua trong <color=yellow>Ng� C�c<color>");
	end
end

function getLootSeting()
	return tAward.subclauses;
end

function getLootItem()
	local tClause = getLootSeting();

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

function speLoot(npcIdx)
	local daye = GetMissionV(MV_WHO_IS_DAYE);
	if daye == 0 then
		return 0;
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
				tinsert(tSel, 1, "Ta c�n mang ph�n th��ng ph�n cho "..player_name.."/#lootAwardOther("..PlayerIndex..","..npcIdx..")");
			end
		end
		PlayerIndex = OldPlayerIndex;
		tinsert(tSel, 1, "Ta mu�n nh�n ph�n th��ng/#lootAward("..PlayerIndex..","..npcIdx..")");
	end


	local nLootItemId = GetMissionV(MV_LOOT_ID);
	if nLootItemId == 0 then
		nLootItemId = getLootItem();
		SetMissionV(MV_LOOT_ID, nLootItemId);
	end

	local tClause = getLootSeting();
	local tLootItem = tClause[nLootItemId][1];
	local nCount = 1;
	if tLootItem[2] and type(tLootItem[2]) == "table" then
		nCount = tLootItem[2][4];
	end
	local msg = format("<color=yellow>[%s]x%d<color>",tLootItem[1], nCount);
	Say("<color=green>B�o r��ng<color>: � ��y c�"..msg, getn(tSel), tSel);
end

function lootAwardOther(player_index, box_index)
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
	if GetFreeItemRoom()  < NEED_ROOM then
		Talk(1,"","<color=green>Th�ng b�o<color>: <color=yellow>H�nh trang<color> c�c h� kh�ng ��!")
		PlayerIndex = player_index_save
		Talk(1,"","<color=green>Th�ng b�o<color>: : <color=green>"..s_palyer_name.."<color><color=yellow>H�nh trang<color> �� ��y, kh�ng th� ph�n ph�i!")
		return
	end

	PlayerIndex = player_index_save
	lootAward(player_index, box_index)
end

function lootAward(player_index, box_index)
	local player_index_save = PlayerIndex

	PlayerIndex = player_index;
	if gf_JudgeRoomWeight(NEED_ROOM, 100, "") ~= 1 then return end
	PlayerIndex = player_index_save;

	local nLootItemId = GetMissionV(MV_LOOT_ID);
	if nLootItemId == 0 then
		nLootItemId = getLootItem();
	end
	local tLoot = getLootSeting()[nLootItemId][1];
	SetMissionV(MV_LOOT_ID, 0);
	SetMissionV(MV_WHO_IS_DAYE, 0);
	--SetMissionV(MV_LAO_ER_2, 0);

	SetNpcLifeTime(box_index, 0);
	PlayerIndex = player_index;
	gf_SetLogCaption(LOG_TITLE);
	Clause3.giveClause(tLoot);
	gf_SetLogCaption("");
	
	if tLoot[1] == "Thi�n Cang L�nh" then
		_stat_when_ib_produce(tLoot[2][4])--IB���߲���ͳ��
	end
	
--	--ͳ�Ƶ���
--	if tLoot[1] == "���Ž���" then
--		AddRuntimeStat(1,14,0,tLoot[2][4]);
--	elseif tLoot[1] == "3����¯��" then
--		AddRuntimeStat(1,16,0,tLoot[2][4]);
--	elseif tLoot[1] == "3��ϴ��ʯ" then
--		AddRuntimeStat(1,17,0,tLoot[2][4]);
--	elseif tLoot[1] == "������" then
--		AddRuntimeStat(1,18,0,tLoot[2][4]);
--	elseif tLoot[1] == "������" then
--		AddRuntimeStat(1,19,0,tLoot[2][4]);
--	end
	
	PlayerIndex = player_index_save;
end
