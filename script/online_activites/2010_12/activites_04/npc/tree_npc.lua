--=============================================
--create by xiongyizhi 2010-11-5
--describe:越南版12月份四灵树活动 树NPC脚本
--=============================================
Include("\\script\\online_activites\\2010_12\\activites_04\\head.lua")
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")	
Include("\\script\\vng\\award\\feature_award.lua");

function main()
    local nNpcIndex = GetTargetNpc();
    local nLevel = Judge_tree_level_cost() --判断树在哪个阶段
    if Judge_tree_owner(nNpcIndex) == 0 then--只能偷别人的
        stolen_process(nNpcIndex);
        return 0; --偷完走人，不能养别人的树
    end
    if nLevel == tonumber(getn(VET_201012_04_TB_TREE_GROW)) then --全部成长阶段完了，收获
        Say(VET_201012_04_NPC_TALK_STRINGS[12], 2, VET_201012_04_NPC_TALK_STRINGS[13].."/get_4_soul_tree_award",
                                                   VET_201012_04_NPC_TALK_STRINGS[5].."/gf_DoNothing");
    else 
        tree_feed_talk(nNpcIndex);
    end
end

function Judge_tree_owner(nNpcIndex)
    local nNpcName = GetNpcName(nNpcIndex);
    local nNameLen = strlen(GetName());
    if GetName() == strsub(nNpcName, 1, nNameLen) then --用名字来判断是不是玩家的树
	return 1;
    else
        return 0;
    end
end

--偷窃处理,成功返回1，不成功返回0
function stolen_process(nNpcIndex)
    if GetPlayerRoute() == 0 then
    	   Talk(1, "", "Ch璦 gia nh藀 m玭 ph竔 kh玭g th? cp c﹜!")
        return 0;
    end
    local nStolenFlag = GetUnitCurStates(nNpcIndex, 4);--偷取时间为: 0不到可偷的阶段;时间戳为偷的时间, -1为偷过了
    if nStolenFlag == 0 or GetTime() < nStolenFlag then --只能收获阶段偷
        Talk(1, "", VET_201012_04_NPC_TALK_STRINGS[18])
        return 0;
    end
    if nStolenFlag == -1 then 
        Talk(1, "", gf_FixColor(VET_201012_04_NPC_TB[2][2], 2, 1)..VET_201012_04_NPC_TALK_STRINGS[7]);
        return 0;
    else --没有被偷过
        for i = 1, getn(VET_201012_04_TB_ITEM) do
            gf_AddItemEx2({VET_201012_04_TB_ITEM[i][2][1], VET_201012_04_TB_ITEM[i][2][2], VET_201012_04_TB_ITEM[i][2][3], 1}, 
                          VET_201012_04_TB_ITEM[i][1], 
                          VET_201012_04_STR_LOG_TITLE, 
                          VET_201012_04_TB_LOG_ACTION_LIST[4], 
                          0, 
                          1);
        end
        nStolenFlag = - nStolenFlag - 1;
        AddUnitStates(nNpcIndex, 4, nStolenFlag); --使用NPC外防位来记录已经偷取过了
    end
end

--根据从种下到现在的时间,判断树现在处于的成长阶段
--依次返回 成长阶段，描述消耗的字符串
--如 (5, "浇水*1 施肥*2 杀虫*3 ")
function Judge_tree_level_cost()
    local nLife = tonumber(GetTime()) - GetTask(VET_201012_04_PLANT_4_SOUL_TREE_TIME);
    local nLevel, nCostCount; 
    local szCost = "";
    if nLife < 0 then return -1 end

    local nLevelTime = VET_201012_04_TB_TREE_GROW[1][4];
    for nLevel = 1, getn(VET_201012_04_TB_TREE_GROW) do
        if nLife <= nLevelTime then --如果在某个阶段区间，取得这个区间的消耗
            if VET_201012_04_TB_TREE_GROW[nLevel][3] ~= nil then --要有材料消耗，有的阶段可能没消耗
                for nCostCount = 1,getn(VET_201012_04_TB_TREE_GROW[nLevel][3]) do
                    local nSingleAct = get_cost2action_name(VET_201012_04_TB_TREE_GROW[nLevel][3][nCostCount][1]);
                    szCost = szCost..format(nSingleAct.."*%d ", VET_201012_04_TB_TREE_GROW[nLevel][3][nCostCount][2]);--记录下材料消耗的字符串用于对话，
                                                                                                                      --格式 "浇水*1 施肥*2 杀虫*3 "
                end
                return nLevel, "["..szCost.."]";
            else 
                return nLevel, "";
            end
        else
            if nLevel + 1 <= getn(VET_201012_04_TB_TREE_GROW) then
                nLevelTime = nLevelTime + VET_201012_04_TB_TREE_GROW[nLevel + 1][4];
            end
        end
    end
    return 0, ""; --不在任何区间的错误情况
end

--根据VET_201012_04_TREE_ITEM_TO_ACTION表，输入物品ID表{G, D, P}, 返回两个值，依次是"对应动作","物品名"，找不到返回0
function get_cost2action_name(tItem)
    local g, d, p = gf_UnPack(tItem);
    local g1, d1, p1
    for i = 1,getn(VET_201012_04_TREE_ITEM_TO_ACTION) do
        g1, d1, p1 = gf_UnPack(VET_201012_04_TREE_ITEM_TO_ACTION[i][2]);
        if g == g1 and d == d1 and p == p1 then  --不能比较表的笨办法
            return VET_201012_04_TREE_ITEM_TO_ACTION[i][3], VET_201012_04_TREE_ITEM_TO_ACTION[i][1];        
        end
    end
    return 0;
end

--自己的树，主对话,决定是否让浇水施肥
function tree_feed_talk(nNpcIndex)
    local nLevel, szCost = Judge_tree_level_cost();
    if nLevel == 0 then
        reset_npc_player_state(nNpcIndex);
        return 0;
    end
    local tbTreeDialog = {};
    if szCost ~= "" and GetUnitCurStates(nNpcIndex, 5) ~= nLevel then
        tinsert(tbTreeDialog, szCost.."/#tree_feed_process("..nNpcIndex..")")
    end
    tinsert(tbTreeDialog, VET_201012_04_NPC_TALK_STRINGS[5].."/gf_DoNothing");--结束对话

    local nLevelTime = 0;
    for i = 1, nLevel do
        nLevelTime = nLevelTime + VET_201012_04_TB_TREE_GROW[i][4];
    end
    local nTime2NextLevel = nLevelTime - (tonumber(GetTime()) - GetTask(VET_201012_04_PLANT_4_SOUL_TREE_TIME));
    if nTime2NextLevel < 0 then
        reset_npc_player_state(nNpcIndex);
        return 0;
    end
    local szLevelName = "["..VET_201012_04_TB_TREE_GROW[nLevel][1].."]";
    Say(format(VET_201012_04_NPC_TALK_STRINGS[10], szLevelName, nTime2NextLevel), getn(tbTreeDialog), tbTreeDialog);
end

--处理浇水施肥这些操作
function tree_feed_process(nNpcIndex)
    if GetTargetNpc() ~= nNpcIndex then --如果保持对话一直不点,可能树已经死了,但是NpcIndex被其他npc占了
        return 0;
    end
    local nLife = tonumber(GetTime()) - GetTask(VET_201012_04_PLANT_4_SOUL_TREE_TIME);
    local nLevel, nCostCount;
    local szCost = "";
    if nLife < 0 then return -1 end
    local nLevelTime = VET_201012_04_TB_TREE_GROW[1][4];
    for nLevel = 1, getn(VET_201012_04_TB_TREE_GROW) do
        if nLife <= nLevelTime then --如果在某个阶段区间，取得这个区间的消耗
            if VET_201012_04_TB_TREE_GROW[nLevel][3] ~= nil then --要有材料消耗，有的阶段可能没消耗
                for nCostCount = 1, getn(VET_201012_04_TB_TREE_GROW[nLevel][3]) do
                    if GetItemCount(gf_UnPack(VET_201012_04_TB_TREE_GROW[nLevel][3][nCostCount][1])) 
                                    < VET_201012_04_TB_TREE_GROW[nLevel][3][nCostCount][2] then
                        Talk(1, "", VET_201012_04_NPC_TALK_STRINGS[11]); --养树的材料不够
                        return 0;
                    end
                end
                for nCostCount = 1,getn(VET_201012_04_TB_TREE_GROW[nLevel][3]) do
                    DelItem(VET_201012_04_TB_TREE_GROW[nLevel][3][nCostCount][1][1], 
                            VET_201012_04_TB_TREE_GROW[nLevel][3][nCostCount][1][2],
                            VET_201012_04_TB_TREE_GROW[nLevel][3][nCostCount][1][3],
                            VET_201012_04_TB_TREE_GROW[nLevel][3][nCostCount][2]);
                end

                --都处理完了,重新生成下个阶段的NPC
                local nOldNpcIdx = nNpcIndex;
                nNpcIndex = CreateNpc(VET_201012_04_TB_TREE_GROW[nLevel][2], 
                                      GetName()..VET_201012_04_NPC_TALK_STRINGS[17]..VET_201012_04_NPC_TB[2][2], 
                                      GetNpcWorldPos(nOldNpcIdx));
                SetNpcScript(nNpcIndex, VET_201012_04_TREE_SCRIPT);
                SetNpcLifeTime(nOldNpcIdx, 0);  --杀死原NPC

                local nLevelTime = 0;
                for i = 1, (nLevel + 1) do
                    nLevelTime = nLevelTime + VET_201012_04_TB_TREE_GROW[i][4];
                end
                local nTime2NextLevel = nLevelTime - (GetTime() - GetTask(VET_201012_04_PLANT_4_SOUL_TREE_TIME));
                SetNpcLifeTime(nNpcIndex, nTime2NextLevel);
                AddUnitStates(nNpcIndex, 5, nLevel); --使用NPC内防单位记录已经养过这个阶段
                local nStolenTime = GetTime() + nTime2NextLevel - VET_201012_04_TB_TREE_GROW[nLevel + 1][4]
                if nLevel + 1 == getn(VET_201012_04_TB_TREE_GROW) then
                    AddUnitStates(nNpcIndex, 4, nStolenTime) --使用NPC外防位记录可以偷取的时间
                end
                return 0;
            end
        else
            nLevelTime = nLevelTime + VET_201012_04_TB_TREE_GROW[nLevel + 1][4]
        end
    end
end

function get_4_soul_tree_award()
    local nNpcIndex = GetTargetNpc();
    if Judge_tree_owner(nNpcIndex) == 0 then
        return 0;
    end
    local g,d,p;
    if gf_Judge_Room_Weight(4, 0, "") == 1 then
    		  ThuHoachCayTuLinh()
    	   --nhi謒 v? l祄 gi祏
	   if CFG_NhiemVuLamGiau == 1 then
			if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 9) == 0 then
				gf_SetTaskBit(TSK_LAMGIAU, 9, 1, 0)
				TaskTip("Ho祅 th祅h nhi謒 v? l祄 gi祏: Tr錸g th祅h c玭g 01 C﹜ T? Linh.")
			end
	   end
		-----------------------Chu鏸 nhi謒 v? уng H祅h
		if CFG_NhiemVuDongHanh == 1 then
			if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 20 then
				DongHanh_SetStatus()
			end
		end
        gf_EventGiveCustomAward(1, 500000, 1, VET_201012_04_STR_LOG_TITLE, VET_201012_04_TB_LOG_ACTION_LIST[3])
        SetTask(VET_201012_04_PLANT_4_SOUL_TREE_TIME, 0)
        if GetUnitCurStates(nNpcIndex, 4) == -1 then --被偷过了
            for i = 1, getn(VET_201012_04_TB_ITEM) do
                g,d,p = gf_UnPack(VET_201012_04_TB_ITEM[i][2])
                if random(1, 2) == 1 then  --近似给个50%概率
                    gf_AddItemEx2({g, d, p, 3}, 
                                  VET_201012_04_TB_ITEM[i][1], 
                                  VET_201012_04_STR_LOG_TITLE, 
                                  VET_201012_04_TB_LOG_ACTION_LIST[3], 
                                  0, 
                                  1);
                else
                    gf_AddItemEx2({g, d, p, 2}, 
                                  VET_201012_04_TB_ITEM[i][1], 
                                  VET_201012_04_STR_LOG_TITLE, 
                                  VET_201012_04_TB_LOG_ACTION_LIST[3], 
                                  0, 
                                  1);
                end
            end
        else  --没有被偷
            for i = 1, getn(VET_201012_04_TB_ITEM) do
                g,d,p = gf_UnPack(VET_201012_04_TB_ITEM[i][2])
                if random(1, 4) == 1 then  --近似给个25%概率
                    gf_AddItemEx2({g, d, p, 5}, 
                                  VET_201012_04_TB_ITEM[i][1], 
                                  VET_201012_04_STR_LOG_TITLE, 
                                  VET_201012_04_TB_LOG_ACTION_LIST[5], 
                                  0, 
                                  1);
                else
                    gf_AddItemEx2({g, d, p, 3}, 
                                  VET_201012_04_TB_ITEM[i][1], 
                                  VET_201012_04_STR_LOG_TITLE, 
                                  VET_201012_04_TB_LOG_ACTION_LIST[5], 
                                  0, 
                                  1);
                end
            end
        end
         -- Nhi謒 v? chuy觧 sinh 5
        if GetTask(TRANSLIFE_MISSION_ID) == 34 and gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK3) < 69 then
		gf_SetTaskByte(TRANSLIFE_TASK_5_1, TRANSLIFE_BYTE_TASK3, gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK3) +1)
		if gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK3) == 69 then
			TaskTip("Ho祅 th祅h y猽 c莡 c馻 B筩h Ti猲 Sinh ho祅 th祅h tr錸g th祅h c玭g 69 c﹜ T? Linh")
		end
	end
        reset_npc_player_state(nNpcIndex)
    end
end

function reset_npc_player_state(nNpcIndex)
    SetNpcLifeTime(nNpcIndex, 0); --NPC活的时间超过种树时间的错误情况,删除这个NPC
    SetTask(VET_201012_04_PLANT_4_SOUL_TREE_TIME, 0);
    return 0;
end
