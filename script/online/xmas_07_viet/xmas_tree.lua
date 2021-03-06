--
-- 剑侠情缘网络版2
-- xmas_seed.lua
-- 2007越南圣诞活动 种子脚本
-- 2007-12-12
--

Include("\\script\\online\\xmas_07_viet\\xmas_head.lua");

function main()
	local npcTreeIndex = GetTargetNpc();
	if npcTreeIndex == 0 then
		 WriteLog("[xmas_tree]:"..GetName().."Khi ti nc, GetTargetNpc tr? quay l筰 l? 0");
		 return 0;
	end;
	
	local nnpc_type = GetTask(TASKID_XMAS_TREE_TYPE );
	setup_global_value(nnpc_type);

	local npcName = GetTargetNpcName();
	local nNameLen = strlen(GetName());

	if GetName() ~= strsub(npcName,1,nNameLen) then
		if GetTime() - GetTask(TASKID_XMAS_PLANTTIME) > XMAS_TREELIFETIME 
			or GetTask(TASKID_XMAS_PLANTTIME) == 0 
			or npcTreeIndex ~= GetTask(TASKID_XMAS_TREEINDEX) 
		then
			Msg2Player("Зy kh玭g ph秈 l? c﹜ b筺 tr錸g");
			return 0;
		end;
	end;

	local nTreeGrow = GetTask(TASKID_XMAS_TREE_GROW);
	local nTimePassed = GetTime() - GetTask(TASKID_XMAS_PLANTTIME);
	local nScore = GetTask(TASKID_XMAS_TREE_SCORE);
	
	local sSaySth = "";
	local selTab = {};
	if floor(nTimePassed/60) >= XMAS_GATHER_TIME then
		if nScore < XMAS_GATHER_SCORE_LIMIT then
			Say("  "..XMAS_TREE_NAME.." c馻 b筺 kh玭g 頲 ch╩ s鉩 t鑤 n猲  b? , l莕 sau c? g緉g h琻!.", 0);
			SetNpcLifeTime(npcTreeIndex, 0);
			clear_xmas_state();
			return 1;
		else
			tinsert(selTab,"Ta s? nh薾 thng/get_award");
			tinsert(selTab,"Kh玭g c? g?/nothing");
			sSaySth = "Hi謓 gi? b筺 c? th? nh薾 ph莕 thng Gi竛g Sinh, n誹 sau <color=yellow>"..Get_Time_String(XMAS_TREELIFETIME-nTimePassed).."<color> kh玭g nh薾, c﹜ th玭g s? bi課 m蕋.";
			Say( sSaySth, getn(selTab), selTab );
			return 1;
		end;
	else
		local nwater_time = next_water_time();
		if nwater_time == 0 then
			select_water();
			return 1;
		end
	end;
	local nwater_time = next_water_time();
	if nwater_time == nil then
		local naward_time = XMAS_GATHER_TIME * 60 - nTimePassed;
		Talk(1,"","B筺 c莕 ph秈 <color=yellow>"..Get_Time_String(naward_time).."<color> m韎 c? th? nh薾 l蕐 ph莕 thng.");
		return 0;
	end
	Talk( 1, "", "  "..XMAS_TREE_NAME.." C﹜ p l緈, th阨 gian trang tr? c﹜ l莕 sau c遪 <color=yellow>"..Get_Time_String(nwater_time).."<color>" );
end;

function nothing()

end;

function next_water_time()
	local nplanted_time = GetTime() - GetTask(TASKID_XMAS_PLANTTIME);
	local nplanted_min = floor(nplanted_time / 60);
	local nlast_water = floor((GetTask(TASKID_XMAS_LAST_WATER_TIME) - GetTask(TASKID_XMAS_PLANTTIME))/60);
	for i = 1, getn(XMAS_WATER_TIME[1]) do
		if nplanted_min >= XMAS_WATER_TIME[1][i] 
			and nplanted_min < XMAS_WATER_TIME[1][i] + XMAS_WATER_TIME[2] 
			and not (nlast_water >= XMAS_WATER_TIME[1][i] and nlast_water < XMAS_WATER_TIME[1][i] + XMAS_WATER_TIME[2] )
		then
			return 0;
		elseif nplanted_min < XMAS_WATER_TIME[1][i] then
			return 1 + XMAS_WATER_TIME[1][i] * 60 - nplanted_time;
		end
	end
	return nil;
end

function select_water()
	local sSayStr = "B筺 ph秈 treo v藅 ph萴 trang tr? c﹜ th玭g?";
	local tSaytab = {};
	
	local nTreeType = is_jh_xmas_tree();
	if nTreeType == -1 then
		return
	elseif nTreeType == 1 then
		if GetItemCount( tTreeItem[1][1], tTreeItem[1][2], tTreeItem[1][3] ) > 0 then
			tinsert( tSaytab, tTreeItem[1][4].."/#put_water(1)" );
		end
	else
		for i = 2, 5 do
			if GetItemCount( tTreeItem[i][1], tTreeItem[i][2], tTreeItem[i][3] ) > 0 then
				tinsert( tSaytab, tTreeItem[i][4].."/#put_water("..i..")" );
			end		
		end
	end
	if getn(tSaytab) < 1 then
		Say("B筺 kh玭g c? v藅 ph萴 trang tr? c﹜ th玭g.", 0);
		return
	end
	tinsert(tSaytab , "L骳 kh竎 s? trang tr? sau/nothing")
	Say(sSayStr, getn(tSaytab), tSaytab);
end

function put_water(nwater_type)
	if DelItem(tTreeItem[nwater_type][1], tTreeItem[nwater_type][2], tTreeItem[nwater_type][3], 1) == 1 then
		SetTask( TASKID_XMAS_LAST_WATER_TIME, GetTime() );
		local nscore = GetTask(TASKID_XMAS_TREE_SCORE) + tTreeItem[nwater_type][5];
		SetTask(TASKID_XMAS_TREE_SCORE, nscore );
		change_tree(nscore);
	end
end

function change_tree(nscore)
	local ngrow = floor( nscore/8 );
	local nlast_grow = GetTask(TASKID_XMAS_TREE_GROW);
	if ngrow > nlast_grow then
		local old_tree_index = GetTargetNpc();
		local new_tree_index = CreateNpc( txmas_tree_mode[2], GetTargetNpcName(), GetNpcWorldPos(old_tree_index)); --树的形态怎么确定？
		SetNpcLifeTime(old_tree_index, 0);
		SetCurrentNpcSFX(new_tree_index, Xmas_tree_SFX_table[ngrow], 1, 1);
		SetNpcLifeTime(new_tree_index, 25*60);
		SetNpcScript(new_tree_index,"\\script\\online\\xmas_07_viet\\xmas_tree.lua");
		SetTask(TASKID_XMAS_TREEINDEX, new_tree_index);
		SetTask(TASKID_XMAS_TREE_GROW, ngrow);
	end
end

function get_award()
	local nTreeType = is_jh_xmas_tree();
	if nTreeType == 1 then
		get_jh_award();
	elseif nTreeType == 0 then
		get_ml_award();
	else
		WriteLog("[xmas_tree] get_award nTreeType sai");
		return
	end
	clear_xmas_state();
end

function get_jh_award()
	local nscore = GetTask(TASKID_XMAS_TREE_SCORE);
	if nscore < 15 then
		Msg2Player("[xmas]error!");
		return 0;
	end
	SetNpcLifeTime(GetTargetNpc(), 0);
	local nrnd = random(1,100);
	if nrnd < 24 then	-- 1个圣诞装 & 1000 exp
		local tAward = {
			{ {0, 108, 109, 1, 1}, "N鉵 gi竛g sinh chu萵"},		
			{ {0, 109, 109, 1, 1}, "Thng y gi竛g sinh chu萵"},	
			{ {0, 110, 73,  1, 1}, "H? y Gi竛g sinh chu萵"},	
			{ {0, 108, 110, 1, 1}, "N鉵 gi竛g sinh kh玦 ng?"},		
			{ {0, 109, 110, 1, 1}, "Gi竛g sinh kh玦 ng?"},	
			{ {0, 110, 74,  1, 1}, "Trang ph鬰 gi竛g sinh kh玦 ng?"},	
			{ {0, 108, 111, 1, 1}, "N鉵 gi竛g sinh nh?"},		
			{ {0, 109, 111, 1, 1}, "Thng y gi竛g sinh Ki襲 n?"},	
			{ {0, 110, 75,  1, 1}, "Gi竛g sinh Ki襲 n?"},	
			{ {0, 108, 112, 1, 1}, "N鉵 gi竛g sinh g頸 c秏"},		
			{ {0, 109, 112, 1, 1}, "Thng y gi竛g sinh g頸 c秏"},	
			{ {0, 110, 76,  1, 1}, "H? y gi竛g sinh n? g頸 c秏"},	
		};
		award = tAward[random(1, getn(tAward))];
		gf_SetLogCaption("xmas_tree");
		gf_AddItemEx( award[1], award[2] );
		gf_Modify("Exp", 1000);
		gf_SetLogCaption("");
	else
		gf_SetLogCaption("xmas_tree");
		gf_Modify("Exp", random(2,5) * 1000);
		gf_SetLogCaption("");
	end
end

function get_ml_award()
	local nscore = GetTask(TASKID_XMAS_TREE_SCORE);
	if nscore < 3 then 
		Msg2Player("[xmas]error!");
		return 0;
	end
	SetNpcLifeTime(GetTargetNpc(), 0);
	local tAward = {
		{ {1, 0, 9  , 5, 1}, "Чi Ho祅 n"     , 3, 5},	
		{ {1, 0, 4  , 5, 1}, "B筩h V﹏ t竛"     , 6, 9},
		{ {1, 0, 14 , 5, 1}, "Ng鋍 Linh t竛"     , 10, 15},
		{ {1, 5, 1  ,10, 1}, "Bi謓 Kinh H錳 ph?" , 16, 18},
		{ {2, 0, 141, 1, 1}, "Ti猽 Ki誴 t竛"     , 19, 21},
		{ {2, 1, 343, 1, 1}, "Th莕 N玭g Кn"     , 22, 24},
	}
	for i = 1, getn(tAward) do
		if nscore >= tAward[i][3] and nscore <= tAward[i][4] then
			gf_SetLogCaption("xmas_tree");
			award = tAward[i];
			gf_AddItemEx( award[1], award[1][4].."c竔"..award[2] );
			gf_SetLogCaption("");
			return 1;
		end
	end
end
