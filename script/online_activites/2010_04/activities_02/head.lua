Include("\\script\\online_activites\\task_values.lua");                        --任务变量头文件
Include("\\script\\online_activites\\2010_04\\activities_02\\strings.lua");    --活动字符串
Include("\\script\\lib\\globalfunctions.lua");                                 --公共函数文件

DEBUG = 0;
VET_201004_02_EVENT_NUMBER = 6;                                                --在活动表上的编号是6

function VET_201004_02_GivePlantSmallTreeAward()
	do return end
    if gf_CheckEventDateEx(5) == 1 then
        gf_AddItemEx2({2, 1, 30184, 50}, "T骾 Nguy猲 Li謚","Hoat dong thang 4 nam 2010","Ph莕 thng tr錸g c﹜ b竧 nh? nh?");
    end
    --本活动没有时间限制
    --gf_EventGiveRandAward( VET_201004_02_TB_SMALLTREE_RAND_AWARD_LIST, 100, 1, VET_201004_02_STR_LOG_TITLE, VET_201004_02_TB_LOG_ACTION_LIST[2]);
end

function VET_201004_02_GivePlantBigTreeAward()
	do return end
    if gf_CheckEventDateEx(5) == 1 then
        gf_AddItemEx2({2, 1, 30184, 50}, "T骾 Nguy猲 Li謚","Hoat dong thang 4 nam 2010","Ph莕 thng tr錸g c﹜ b竧 nh? l韓");
    end
    --本活动没有时间限制
    --gf_EventGiveRandAward( VET_201004_02_TB_BIGTREE_RAND_AWARD_LIST, 100, 1, VET_201004_02_STR_LOG_TITLE, VET_201004_02_TB_LOG_ACTION_LIST[3]);
end