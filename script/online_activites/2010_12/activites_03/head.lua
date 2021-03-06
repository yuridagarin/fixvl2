--=============================================
--create by xiongyizhi
--describe:越南版2010年12月活动3 头文件
--related files: 
--=============================================

Include("\\script\\online_activites\\task_values.lua");--任务变量头文件
Include("\\script\\online_activites\\2010_12\\activites_03\\strings.lua");--活动字符串
Include("\\script\\lib\\globalfunctions.lua");--公共函数文件

VET_201012_03_EVENT_NUMBER = 21;--在活动表上的编号是13
VET_201012_03_TIME_USER_DEFINE = 2517;--火堆时间触发器自定义ID
VET_201012_03_TIME_TB_DEFINE = 1506;--火堆时间触发器表内ID
VET_201012_03_MATCH_COST = 200000; --火柴价格20金
VET_201012_03_MAX_FIRE_TIMES = 4; --每人最多参与活动4次
VET_201012_03_FIRE_LIFE = 5*60;         --火堆npc存活时间，实际时限和触发器时限都略微有加长修复

function VET_201012_03_JingNangDaShiJiangDialog(tbSayDialog, szSayHead)
    if gf_CheckEventDateEx(VET_201012_03_EVENT_NUMBER) == 1 then
        tinsert(tbSayDialog, VET_201012_03_TB_STRING_LIST[1].."/active_fire_for_warm"); --保持功能独立性，添加到本独立文件夹
        tinsert(tbSayDialog, VET_201012_03_TB_STRING_LIST[2].."/buy_match");
    end
    return tbSayDialog, szSayHead;
end

function active_fire_for_warm()
    local nTeamSize = GetTeamSize()
    if nTeamSize < 2 then
        Talk(1, "", VET_201012_03_TB_STRING_LIST[6])
        return
    end
    if GetCaptainName() ~= GetName() then
        Talk(1, "", VET_201012_03_TB_STRING_LIST[5])
        return
    end
    if Check_team_member(nTeamSize) == 0 then
        return 0;
    end
    to_set_fire_now(nTeamSize)
end

function buy_match()
    if GetCash() < VET_201012_03_MATCH_COST then
        Talk(1, "", VET_201012_03_TB_STRING_LIST[4])
        return
    end
    if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        return
    end
    if Pay(VET_201012_03_MATCH_COST) == 1 then
        --SetTask(VET_201012_03_TASK_DATE_GOUMAILAZHU,nDate)
        local tbItemIds = {VET_201012_03_TB_ITEM_LIST[1][2],VET_201012_03_TB_ITEM_LIST[1][3],VET_201012_03_TB_ITEM_LIST[1][4],1}
        gf_AddItemEx2(tbItemIds, VET_201012_03_TB_ITEM_LIST[1][1],VET_201012_03_STR_LOG_TITLE,VET_201012_03_TB_LOG_ACTION_LIST[1],24*3600,1)
    end
end

function Is_In_City_Map()
    local nMapId = GetWorldPos()
    local bMapIsOk = 0
    for i = 1, getn(VET_201012_03_TB_MAPID) do
        if nMapId == VET_201012_03_TB_MAPID[i] then
            bMapIsOk = 1;
            break
        end
    end
    if bMapIsOk == 0 then
        return 0;
    end
end

function Check_team_member(nTeamSize)
    local nOldPlayer = PlayerIndex
    for i = 1, nTeamSize do
        PlayerIndex = GetTeamMember(i)
        if PlayerIndex <= 0 then
            Talk(1, "", VET_201012_03_TB_STRING_LIST[7]);
            return 0;
        end
        if Is_In_City_Map() == 0 then
            PlayerIndex = nOldPlayer; --这个消息告诉队长就行了
            Talk(1, "", VET_201012_03_TB_STRING_LIST[12]);
            return 0;
        end
        local nLevel = GetLevel()
        if nLevel < 77 or GetPlayerFaction() == 0 or gf_Check55FullSkill() == 0 then
            Talk(1, "", VET_201012_03_TB_STRING_LIST[10]);
            PlayerIndex = nOldPlayer; --这个消息告诉队长就行了
            Talk(1, "", VET_201012_03_TB_STRING_LIST[10]);
            return 0;
        end
        if GetItemCount(VET_201012_03_TB_ITEM_LIST[1][2],VET_201012_03_TB_ITEM_LIST[1][3],VET_201012_03_TB_ITEM_LIST[1][4]) < 1 then
            PlayerIndex = nOldPlayer; --这个消息告诉队长就行了
            Talk(1, "", VET_201012_03_TB_STRING_LIST[8]);
            return 0;
        end
        local nTimes = GetTask(VET_201012_03_FIRE_TIMES)
        if times == nil then
            times = 0
        end
        if nTimes >= VET_201012_03_MAX_FIRE_TIMES then
            Talk(1, "", format(VET_201012_03_TB_STRING_LIST[11], VET_201012_03_MAX_FIRE_TIMES));
            return 0;
        end
    end
    PlayerIndex = nOldPlayer
end

function to_set_fire_now(nTeamSize)
    if GetTrigger(VET_201012_03_TIME_USER_DEFINE) ~= 0 then
    		Talk(1,"","B筺 產ng t 1 l? l鯽 r錳, kh玭g th? t th猰!")
    		return
    end
    local nOldPlayer = PlayerIndex
    for i = 1, nTeamSize do
        PlayerIndex = GetTeamMember(i)
        if PlayerIndex <= 0 then
            Talk(1, "", VET_201012_03_TB_STRING_LIST[7])
            return
        end
        if DelItem(VET_201012_03_TB_ITEM_LIST[1][2],VET_201012_03_TB_ITEM_LIST[1][3],VET_201012_03_TB_ITEM_LIST[1][4],1) ~= 1 then
            return
        end
    end
    PlayerIndex = nOldPlayer

    local nNpcIndex = CreateNpc(VET_201012_03_TB_NPCS[1][1],VET_201012_03_TB_NPCS[1][2],GetWorldPos())
    SetNpcLifeTime(nNpcIndex, VET_201012_03_FIRE_LIFE + 10)  --修正防止NPC消失拿不到最后一次经验

    local nOldPlayer = PlayerIndex
    local nEndTime = GetTime() + 300
    for i = 1, nTeamSize do
        PlayerIndex = GetTeamMember(i)
        if PlayerIndex <= 0 then
            Talk(1, "", VET_201012_03_TB_STRING_LIST[7])
            return
        end
        SetTask(VET_201012_03_TASK_TIME_END_HUOCHAI, GetTime() + VET_201012_03_FIRE_LIFE + 20)     --触发器终止时间，防止NPC意外丢失。触发器将在NPC时限10秒后消失
        CreateTrigger(1, VET_201012_03_TIME_TB_DEFINE, VET_201012_03_TIME_USER_DEFINE);
        ContinueTimer(GetTrigger(VET_201012_03_TIME_USER_DEFINE));
        gf_WriteLogEx(VET_201012_03_STR_LOG_TITLE,VET_201012_03_TB_LOG_ACTION_LIST[2]) --by xiongyizhi 新加参加活动log
        SetTask(VET_201012_03_NPCIDX,nNpcIndex);
        SetTask(VET_201012_03_FIRE_TIMES, GetTask(VET_201012_03_FIRE_TIMES) + 1);
    end
    PlayerIndex = nOldPlayer
end

