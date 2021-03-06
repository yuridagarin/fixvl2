--梁山精力箱
--消耗20点精力打开，打开后不消失，每人每关可以开启一次
--Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\vip_feedback_system\\yinjuan_api.lua")
Include("\\script\\missions\\liangshan\\head.lua");

JINGLI_BOX_INDEX=0
function main()
	--SendScript2VM("\\script\\missions\\liangshan\\mission\\mission.lua", format("jingli_box_main()"))
	Say("Ngi quy誸 nh ti猽 hao 20 甶觤 tinh l鵦  m? tinh l鵦 b秓 rng kh玭g?", 2, "X竎 nh m?/ensure_openBox", "T筰 h? ch? xem qua th玦/do_nothing");
end

--function jingli_box_main()	
--	Say("你确定消耗20点精力开启精力宝箱吗？", 2, "确定开启/ensure_openBox", "我只是看看而已/do_nothing");
--end

--掉落梁山精力箱
function drop_jingli_box(nBossNpcIdx)
	do return end
--	if JINGLI_BOX_INDEX ~= 0 then--一次掉一个箱子
--		return
--	end
--	set_jingli_box_open_flag(0)--先清除标志位
--	local nLifeTime = nil
--	local m, x, y = GetNpcWorldPos(nBossNpcIdx);
--	if m and x and y then
--		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--    	local npc = CreateNpc("箱子钱", "精力宝箱", m, x2, y2);
--    	if npc and npc > 0 then
--    		JINGLI_BOX_INDEX=npc
--    		if nLifeTime then
--        		SetNpcLifeTime(npc, nLifeTime);
--        	end
--        	SetNpcScript(npc, "\\script\\missions\\liangshan\\npc\\box_jingli.lua");
--    	else
--    		print(format("create npc jinglibox fail"))
--    	end
--	end
end

function remove_jingli_box()
	if JINGLI_BOX_INDEX ~= 0 then--一次掉一个箱子
		SetNpcLifeTime(JINGLI_BOX_INDEX, 0);
	end
	JINGLI_BOX_INDEX=0
end

function set_jingli_box_open_flag(nVal)
	if 0 == nVal then
		JINGLI_BOX_INDEX=0
	end
	SetMissionV(MV_LS_OPEN_JINGLI_BOX_FLAG, nVal);
end

tJingLiAward = {
	{1, 300, "M秐h Thi猲 Cang", {2, 1, 30390, 1, 4}, 0},
	{1, 200, "M秐h Thi猲 Cang", {2, 1, 30390, 2, 4}, 0},
	{1, 100, "M秐h Thi猲 Cang", {2, 1, 30390, 4, 4}, 0},
	{31, 1000, "rand_start_equip()", 1},
	{1, 600, "Thi誸 Tinh c蕄 2", {2, 1, 30534, 1, 4}, 0},
	{1, 200, "Thi誸 Tinh c蕄 3", {2, 1, 30535, 1, 4}, 0},
	{1, 100, "B? Ng﹏ To秐", {2, 1, 30538, 1, 4}, 0},
	{1, 100, "B? Ng﹏ Ch飝", {2, 1, 30539, 1, 4}, 0},
	{1, 500, "B╪g Tinh Th筩h", {2, 1, 30554, 1, 4}, 0},
	{1, 250, "M秐h Thi猲 th筩h", {2, 2, 7, 1, 4}, 0},
	{1, 525, "Thi猲 th筩h", {2, 2, 8, 1, 4}, 0},
	{1, 25, "Thi猲 Th筩h Tinh Th筩h", {2, 1, 1009, 1, 4}, 0, 0, 0, 1},
	{1, 300, "Linh Th筩h Nguy猲 Th筩h c蕄 4", {2, 1, 30416, 1, 4}, 0},
	{1, 200, "Linh Th筩h Nguy猲 Th筩h c蕄 5", {2, 1, 30417, 1, 4}, 0},
	{1, 100, "Linh Th筩h Nguy猲 Th筩h c蕄 6", {2, 1, 30418, 1, 4}, 0, 0, 0, 1},
	{31, 800, "api_daily_limit_award_yinquan(10,0)", 1},
	{31, 200, "api_daily_limit_award_yinquan(20,0)", 1},
	{31, 100, "api_daily_limit_award_yinquan(100,0)", 1},
	{1, 500, "C蕄 2 T葃 T﹎ Th筩h", {2, 1, 30522, 1, 4}, 0},
	{1, 500, "C蕄 2 Luy謓 L? Thi誸", {2, 1, 30528, 1, 4}, 0},
	{1, 100, "C蕄 3 T葃 T﹎ Th筩h", {2, 1, 30523, 1, 4}, 0, 0, 0, 1},
	{1, 100, "C蕄 3 Luy謓 L? Thi誸", {2, 1, 30529, 1, 4}, 0, 0, 0, 1},
	{1, 200, "Ng? Hoa T? Nguy猲 T竛 (s鴆 m筺h)", {1, 0, 261, 1}, 0},
	{1, 200, "Ng? Hoa T? Nguy猲 T竛 (n閕 c玭g)", {1, 0, 262, 1}, 0},
	{1, 200, "Ng? Hoa T? Nguy猲 T竛 (g﹏ c鑤)", {1, 0, 263, 1}, 0},
	{1, 200, "Ng? Hoa T? Nguy猲 T竛 (th﹏ ph竝)", {1, 0, 264, 1}, 0},
	{1, 200, "Ng? Hoa T? Nguy猲 T竛 (nhanh nh裯)", {1, 0, 265, 1}, 0},
	{1, 600, "H綾 Ng鋍 筺 T鬰 Cao", {1, 0, 6, 1, 4}, 0},
	{1, 600, "Sinh Sinh H鉧 T竛", {1, 0, 16, 1, 4}, 0},
	{1, 600, "V筺 V藅 Quy Nguy猲 Кn", {1, 0, 11, 1, 4}, 0},
	{1, 400, "C鰑 chuy觧 h錳 h錸 n", {1, 0, 32, 1, 4}, 0},
}
function ensure_openBox()
	local nOpenFlag = GetMissionV(MV_LS_OPEN_JINGLI_BOX_FLAG)
	local nTeamMemberBitIdx = getIndexAtTeam() + 1
	local bOpened = SafeGetBit(nOpenFlag, nTeamMemberBitIdx)
	if bOpened ~= 0 then
		Say("Ngi  m? b秓 rng tinh l鵦 r錳, kh玭g th? m? ti誴.", 0);
		return 0;
	end
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh玭g gian h祅h trang kh玭g ");
		return 0
	end
	local nRet1, nRet2 = ModifyEnergy(-20, 1);
	if -1 ~= nRet1 then
		set_jingli_box_open_flag(SafeSetBit(nOpenFlag, nTeamMemberBitIdx, 1))
		local nRandIndex = gf_EventGiveRandAward(tJingLiAward, gf_SumRandBase(tJingLiAward), 1, "Lng S琻", "M? b秓 rng tinh l鵦 Lng S琻");
		
		
--		--精力宝箱开启次数统计
--		AddRuntimeStat(1,10,0,1);
--		--统计道具
--		if tJingLiAward[nRandIndex] then
--			if tJingLiAward[nRandIndex][3] == "3级炼炉铁" then
--				AddRuntimeStat(1,16,0,tJingLiAward[nRandIndex][4][4]);
--			elseif tJingLiAward[nRandIndex][3] == "3级洗心石" then
--				AddRuntimeStat(1,17,0,tJingLiAward[nRandIndex][4][4]);
--			elseif tJingLiAward[nRandIndex][3] == "秘银钻" then
--				AddRuntimeStat(1,18,0,tJingLiAward[nRandIndex][4][4]);
--			elseif tJingLiAward[nRandIndex][3] == "秘银锤" then
--				AddRuntimeStat(1,19,0,tJingLiAward[nRandIndex][4][4]);
--			end
--		end
	else
		Say("Tinh l鵦 kh玭g , kh玭g th? m? b秓 rng tinh l鵦.",0);	
	end
end

function do_nothing()
--do nothing
end

function getIndexAtTeam()
	for i = 1, GetTeamSize() do
		if PlayerIndex == GetTeamMember(i) then
			return i - 1;
		end
	end	
end

function rand_start_equip()
	local tAward = {
		{1, 7000, "Huy Chng уng Ch?", {0, 153, 1, 1, 4}, 0},
		{1, 2500, "Huy Chng Thi誸 Ch?", {0, 153, 2, 1, 4}, 0},
		{1, 380, "Huy Chng Ng鋍 Ch?", {0, 153, 3, 1, 4}, 0},
		{1, 20, "Huy Chng Kim Ch? ng? h祅h", {0, 153, 4, 1, 4}, 0, 0, 0, 1},
		{1, 20, "Huy Chng M閏 Ch? ng? h祅h", {0, 153, 5, 1, 4}, 0, 0, 0, 1},
		{1, 20, "Huy Chng Th駓 Ch? ng? h祅h", {0, 153, 6, 1, 4}, 0, 0, 0, 1},
		{1, 20, "Huy Chng H醓 Ch? ng? h祅h", {0, 153, 7, 1, 4}, 0, 0, 0, 1},
		{1, 20, "Huy Chng Th? Ch? ng? h祅h", {0, 153, 8, 1, 4}, 0, 0, 0, 1},
		{1, 20, "Huy Chng  Ch? ng? h祅h", {0, 153, 9, 1, 4}, 0, 0, 0, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Lng S琻", "M? b秓 rng tinh l鵦");
end