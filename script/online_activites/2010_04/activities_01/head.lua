Include("\\script\\online_activites\\task_values.lua");                         --任务变量头文件
Include("\\script\\online_activites\\2010_04\\activities_01\\strings.lua");     --活动字符串
Include("\\script\\lib\\globalfunctions.lua");                                  --公共函数文件

DEBUG = 0;
VET_201004_01_EVENT_NUMBER = 5;                                                --在活动表上的编号是5
VET_201004_01_MAX_TIMES_EXP_FROM_VICBOX = 2400;                                --从胜利礼盒获得经验的最大次数 315000000/175000=1800
VET_201004_01_NUM_GET_FACTION_AWARD_MAX_COUNT = 10;                            --每天能领的原料袋个数

function VET_201004_01_JingNangDaShiJiangDialog(tbSayDialog, szSayHead)
    if gf_CheckEventDateEx(VET_201004_01_EVENT_NUMBER) == 1 then
        szSayHead = VET_201004_01_TB_STRINGS[1][1];                            --锦囊大事件say的标题
        tinsert(tbSayDialog, VET_201004_01_TB_STRINGS[1][2].."/vet_201004_01_exchange_vicbox");        
--     tinsert(tbSayDialog, VET_201004_01_TB_STRINGS[1][4].."/vet_201004_01_exchange_luckystar");        
    end
    local nDate = tonumber(date("%y%m%d"));	
    if nDate >= 100416 and nDate <= 100523 then
    	   szSayHead = VET_201004_01_TB_STRINGS[1][1];
    	   tinsert(tbSayDialog, VET_201004_01_TB_STRINGS[1][3].."/vet_201004_01_exchange_limitedexp_award");
    end
    return tbSayDialog, szSayHead;
end

function vet_201004_01_exchange_vicbox()
    if gf_CheckEventDateEx(VET_201004_01_EVENT_NUMBER) == 0 then
        return 0;
    end
    --负重检测
    if gf_Judge_Room_Weight(2, 10, "") == 0 then
        return 0;
    end
    
	if DEBUG ~= 1 then                      --DEBUG滤过判断
	    --判断材料携带
	    local tbMaterial = {
	        [1] = { VET_201004_01_TB_ITEMS[2][1], VET_201004_01_TB_ITEMS[2][2], VET_201004_01_TB_ITEMS[2][3], VET_201004_01_TB_ITEMS[2][4], 1},
	        [2] = { VET_201004_01_TB_ITEMS[3][1], VET_201004_01_TB_ITEMS[3][2], VET_201004_01_TB_ITEMS[3][3], VET_201004_01_TB_ITEMS[3][4], 1},
	        [3] = { VET_201004_01_TB_ITEMS[4][1], VET_201004_01_TB_ITEMS[4][2], VET_201004_01_TB_ITEMS[4][3], VET_201004_01_TB_ITEMS[4][4], 1},
	        [4] = { VET_201004_01_TB_ITEMS[5][1], VET_201004_01_TB_ITEMS[5][2], VET_201004_01_TB_ITEMS[5][3], VET_201004_01_TB_ITEMS[5][4], 1},
	        [5] = { VET_201004_01_TB_ITEMS[6][1], VET_201004_01_TB_ITEMS[6][2], VET_201004_01_TB_ITEMS[6][3], VET_201004_01_TB_ITEMS[6][4], 1},
	    };
	    for i = 1, getn(tbMaterial) do
	        if GetItemCount(tbMaterial[i][2], tbMaterial[i][3], tbMaterial[i][4]) < tbMaterial[i][5] then
	            Talk(1, "", format(VET_201004_01_TB_STRINGS[1][7], tbMaterial[i][5],tbMaterial[i][1]))
	            return 0;
	        end
	    end
	    --检测完毕开始删除物品
	    for i = 1, getn(tbMaterial) do
	        if DelItem(tbMaterial[i][2], tbMaterial[i][3], tbMaterial[i][4], tbMaterial[i][5]) ~= 1 then
	            Talk(1, "", format(VET_201004_01_TB_STRINGS[1][7], tbMaterial[i][5],tbMaterial[i][1]));
	            return 0;
	        end
	    end
	end

    --给胜利礼盒
    local tbVicbox = {VET_201004_01_TB_ITEMS[1][2], VET_201004_01_TB_ITEMS[1][3], VET_201004_01_TB_ITEMS[1][4], 1};
    gf_AddItemEx2(tbVicbox, VET_201004_01_TB_ITEMS[1][1], VET_201004_01_STR_LOG_TITLE, VET_201004_01_TB_LOG_ACTION_LIST[2], 0, 1);
    SelectSay()
end

function vet_201004_01_exchange_limitedexp_award()
    --if gf_CheckEventDateEx(VET_201004_01_EVENT_NUMBER) == 0 then
    if tonumber(date("%y%m%d")) > 100523 then
        return 0;
    end
    --负重检测
    if gf_Judge_Room_Weight(2, 10, "") == 0 then
        return 0;
    end
if DEBUG ~= 1 then --                   --非DEBUG模式滤过
    --检测是否达到上限经验
    if GetTask(VET_201004_01_TASK_TIMES_OPEN_VICBOX) < VET_201004_01_MAX_TIMES_EXP_FROM_VICBOX then
        Talk(1, "", VET_201004_01_TB_STRINGS[1][13].."S? l莕 s? d鬾g v藅 ph萴 l? <color=yellow>"..GetTask(VET_201004_01_TASK_TIMES_OPEN_VICBOX).."/2400<color>" );
        return 0;
    end
end
    --检测是否已经领取
    if GetTask(VET_201004_01_TASK_MAX_TIMES_AWARD) ~= 0 then
        Talk(1, "", VET_201004_01_TB_STRINGS[1][10]);
        return 0;
    end
    --记任务变量
    SetTask(VET_201004_01_TASK_MAX_TIMES_AWARD, 1);
    --给经验
    ModifyExp(30000000);
    Msg2Player(1, "", format(VET_201004_01_TB_STRINGS[1][8], 30000000));
    --给物品
    gf_EventGiveRandAward(VET_201004_01_TB_VICBOX_AWARD_LIST_3, 10000, 1, VET_201004_01_STR_LOG_TITLE, VET_201004_01_TB_LOG_ACTION_LIST[4]);
end

function vet_201004_01_exchange_luckystar()
    if gf_CheckEventDateEx(VET_201004_01_EVENT_NUMBER) == 0 then
        return 0;
    end
    --初始化数据
    local nDate = tonumber(date("%Y%m%d"));
    if GetLevel() < 73 or GetPlayerRoute() == 0 then
        Talk(1, "", VET_201004_01_TB_STRINGS[1][11]);
        return 0;
    end
    --负重检测
    if gf_Judge_Room_Weight(2, 10, "") == 0 then
        return 0;
    end
    if GetTask(VET_201004_01_TASK_DATE_LUCKYSTAR) < nDate then
        SetTask(VET_201004_01_TASK_MAX_TIMES_LUCKYSTAR, 0);
        SetTask(VET_201004_01_TASK_DATE_LUCKYSTAR, nDate);
    end
    if GetTask(VET_201004_01_TASK_MAX_TIMES_LUCKYSTAR) < 2 and GetTask(VET_201004_01_TASK_MAX_TIMES_LUCKYSTAR) >= 0 then
if DEBUG ~= 1 then
        --检测原料
        if GetItemCount(VET_201004_01_TB_ITEMS[8][2], VET_201004_01_TB_ITEMS[8][3], VET_201004_01_TB_ITEMS[8][4]) < 20 then
            Talk(1, "", format(VET_201004_01_TB_STRINGS[1][7], VET_201004_01_TB_ITEMS[8][1], 20));
            return 0;
        end
        --删除原料
        if DelItem(VET_201004_01_TB_ITEMS[8][2], VET_201004_01_TB_ITEMS[8][3], VET_201004_01_TB_ITEMS[8][4], 20) ~= 1 then
            Talk(1, "", format(VET_201004_01_TB_STRINGS[1][7], VET_201004_01_TB_ITEMS[8][1], 20));
            return 0;
        end
end
        --给幸运星
        local tbLuckystar = {VET_201004_01_TB_ITEMS[7][2], VET_201004_01_TB_ITEMS[7][3], VET_201004_01_TB_ITEMS[7][4], 2};
        gf_AddItemEx2(tbLuckystar, VET_201004_01_TB_ITEMS[7][1], VET_201004_01_STR_LOG_TITLE, VET_201004_01_TB_LOG_ACTION_LIST[5], 24*3600, 1);
        --加任务变量
        SetTask(VET_201004_01_TASK_MAX_TIMES_LUCKYSTAR, GetTask(VET_201004_01_TASK_MAX_TIMES_LUCKYSTAR)+1);
    else
        Talk(1, "", VET_201004_01_TB_STRINGS[1][12]);
    end 
end

function vet_201004_01_buy_dew()
    if gf_CheckEventDateEx(VET_201004_01_EVENT_NUMBER) == 0 then
        return 0;
    end
    if gf_Judge_Room_Weight(1, 10, "") == 0 then
        return 0;
    end
    if Pay(1000) == 0 then
        Talk(1, "", format(VET_201004_01_TB_STRINGS[1][6], 1));
        return 0;
    end
    local tbDew = {VET_201004_01_TB_ITEMS[9][2], VET_201004_01_TB_ITEMS[9][3], VET_201004_01_TB_ITEMS[9][4], 1};
    gf_AddItemEx2(tbDew, VET_201004_01_TB_ITEMS[9][1], VET_201004_01_STR_LOG_TITLE, VET_201004_01_TB_LOG_ACTION_LIST[1], 0, 1);
end

function VET_201004_01_Give_Faction_Award()
    if gf_CheckEventDateEx(VET_201004_01_EVENT_NUMBER) == 0 then
        return 0;
    end
    local tbAwardList = {
            [1] = 30, 
            [2] = 30, 
            [3] = 30, 
            [4] = 30, 
            [5] = 30, 
            [6] = 50, 
            [7] = 60, 
            [8] = 70, 
            [9] = 80, 
        };
    gf_EventFactionAward(
        {VET_201004_01_TB_ITEMS[8][2], VET_201004_01_TB_ITEMS[8][3], VET_201004_01_TB_ITEMS[8][4]},
        VET_201004_01_TB_ITEMS[8][1],
        tbAwardList,
        VET_201004_01_NUM_GET_FACTION_AWARD_MAX_COUNT,
        GLB_TASK_FACTION_GET_DATE,
        GLB_TASK_FACTION_GET_COUNT,
        VET_201004_01_STR_LOG_TITLE
    );
end

function VET_201004_01_GivePlantSmallTreeAward()	
    if gf_CheckEventDateEx(VET_201004_01_EVENT_NUMBER) == 1 then
        gf_GivePlantSmallTreeAward(
            {VET_201004_01_TB_ITEMS[8][2], VET_201004_01_TB_ITEMS[8][3], VET_201004_01_TB_ITEMS[8][4], 50},
            VET_201004_01_TB_ITEMS[8][1], 
            VET_201004_01_STR_LOG_TITLE
        );
    end
end

function VET_201004_01_GivePlantBigTreeAward()
    if gf_CheckEventDateEx(VET_201004_01_EVENT_NUMBER) == 1 then
        gf_GivePlantSmallTreeAward(
            {VET_201004_01_TB_ITEMS[8][2], VET_201004_01_TB_ITEMS[8][3], VET_201004_01_TB_ITEMS[8][4], 50},
            VET_201004_01_TB_ITEMS[8][1], 
            VET_201004_01_STR_LOG_TITLE
        );
    end
end

function VET_201004_01_Give_DailyTaskPersonalAward()
    if gf_CheckEventDateEx(VET_201004_01_EVENT_NUMBER) == 1 then
        gf_GiveDailyTaskPersonalAward(
            {VET_201004_01_TB_ITEMS[8][2], VET_201004_01_TB_ITEMS[8][3], VET_201004_01_TB_ITEMS[8][4], 50},
            VET_201004_01_TB_ITEMS[8][1], 
            VET_201004_01_STR_LOG_TITLE
        );
    end
end

function VET_201004_01_Give_DailyTaskTeamAward()
    if gf_CheckEventDateEx(VET_201004_01_EVENT_NUMBER) == 1 then
        gf_GiveDailyTaskPersonalAward(
            {VET_201004_01_TB_ITEMS[8][2], VET_201004_01_TB_ITEMS[8][3], VET_201004_01_TB_ITEMS[8][4], 100},
            VET_201004_01_TB_ITEMS[8][1], 
            VET_201004_01_STR_LOG_TITLE
        );
    end
end