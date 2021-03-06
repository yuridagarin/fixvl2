--=============================================
--create by baiyun 2009.12.14
--describe:越南版武林使者日常任务 头文件
--=============================================

Include("\\script\\task\\richangrenwu\\init_task.lua");
--今后在每次活动里面出现“完成日常任务给奖励的”由此文件中的Give_Daily_Personal_Task_Award和Give_Daily_Team_Task_Award实现
Include("\\script\\online_activites\\award.lua");
--Include ("\\script\\meridian\\meridian_award_zhenqi.lua")--奖励真气的接口

DAILY_TASK_0912_PERSONAL_TASK_DATE = 2123; --任务变量，接受个人日常任务的日期
DAILY_TASK_0912_TEAM_TASK_DATE = 2124; --任务变量，接受团队日常任务的日期
DAILY_TASK_0912_PERSONAL_TASK_ID = 2125;--任务变量，个人日常任务的值
DAILY_TASK_0912_TEAM_TASK_ID = 2126;--任务变量，团队日常任务的值
DAILY_TASK_0912_PERSONAL_TASK_COUNT = 2127;--今天已经完成的个人日常任务次数
DAILY_TASK_0912_TEAM_TASK_COUNT = 2128;--今天已经完成的团队日常任务次数

DAILY_CONST_0912_PERSONAL_TASK_MAX_COUNT = 5;--每天个人日常任务的最大次数
DAILY_CONST_0912_TEAM_TASK_MAX_COUNT = 3;--每天个人日常任务的最大次数

DAILY_TASK_0912_PERSONAL_LOG_TITLE = "Vo Lam Su Gia";
DAILY_TASK_0912_TEAM_LOG_TITLE = "Vo Lam Su Gia";
DAILY_TASK_0912_PERSONAL_LOG_ACTION = "Ho祅 th祅h nhi謒 v? c? nh﹏";
DAILY_TASK_0912_TEAM_LOG_ACTION = "Ho祅 th祅h nhi謒 v? t? i";
DAILY_TASK_0912_NPC = "<color=green>V? l﹎ s? gi?: <color>";


--个人日常任务奖励
DALIY_TASK_0912_PERSONAL_TASK_AWARD_LIST = {
        {1, 250, "u h錸", {2, 1, 1157, 1}, 15 * 24 * 3600},
        {1, 500, "Ti猽 Ki誴 t竛", {2, 0, 141, 1}, 15 * 24 * 3600},
        {1, 90, "Th莕 N玭g Кn", {2, 1, 343, 1}, 15 * 24 * 3600},
        {1, 115, "B竧 Nh? Ch鴑g Th?", {2, 1, 30114, 1}, 15 * 24 * 3600},
        {1, 5, "Ng? d鬾g b筩h ng鋍 th筩h", {2, 1, 1024, 1}, 15 * 24 * 3600},
        {4, 40, 5, 1},--5点声望
}
DALIY_TASK_0912_PERSONAL_TASK_AWARD_EXP = 1000000;

--团队日常任务奖励
DALIY_TASK_0912_TEAM_TASK_AWARD_LIST = {
        {1, 250, "u h錸", {2, 1, 1157, 1}, 15 * 24 * 3600},
        {1, 500, "Ti猽 Ki誴 t竛", {2, 0, 141, 1}, 15 * 24 * 3600},
        {1, 90, "Th莕 N玭g Кn", {2, 1, 343, 1}, 15 * 24 * 3600},
        {1, 115, "B竧 Nh? Ch鴑g Th?", {2, 1, 30114, 1}, 15 * 24 * 3600},
        {1, 5, "Ng? d鬾g b筩h ng鋍 th筩h", {2, 1, 1024, 1}, 15 * 24 * 3600},
        {4, 40, 5, 1},--5点声望
}
DALIY_TASK_0912_TEAM_TASK_AWARD_EXP = 1000000;


function DaliyTask0912About()
    local nDate = tonumber(date("%y%m%d"));
    if GetTask(DAILY_TASK_0912_PERSONAL_TASK_DATE) < nDate then
        SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 0);
        SetTask(DAILY_TASK_0912_PERSONAL_TASK_COUNT, 0);
    end
    if GetTask(DAILY_TASK_0912_TEAM_TASK_DATE) < nDate then
        SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 0);
        SetTask(DAILY_TASK_0912_TEAM_TASK_COUNT, 0);
    end
    
    --如果系统触发没有触发到或者服务器宕机导致没有任务产生，则设置一个
    if GetGlbValue(DAILY_TASK_0912_PERSONAL_TASK) == 0 then
        SetGlbValue(DAILY_TASK_0912_PERSONAL_TASK, random(1, getn(DALIY_TASK_0912_PERSONAL_TASK_LIST)));
    end
    if GetGlbValue(DAILY_TASK_0912_TEAM_TASK) == 0 then
        SetGlbValue(DAILY_TASK_0912_TEAM_TASK, random(1, getn(DALIY_TASK_0912_TEAM_TASK_AWARD_LIST)));
    end

    local nPersonalTask = GetGlbValue(DAILY_TASK_0912_PERSONAL_TASK);
    local nTeamTask = GetGlbValue(DAILY_TASK_0912_TEAM_TASK);

    local tb_main_dialog = {
        "Nh薾 nhi謒 v? thng nh藅 c? nh﹏/get_daliy_personal_task",
        "Nh薾 nhi謒 v? thng nh藅 t? i/get_daliy_team_task",
        "Ki觤 tra t譶h h譶h nhi謒 v? thng nh藅/view_today_task_info",
        "H駓 nhi謒 v? thng nh藅 c? nh﹏/cancel_personal_task",
        "H駓 nhi謒 v? thng nh藅 t? i/cancel_team_task",
        "N閜 v? nh薾 thng nhi謒 v? thng nh藅 c? nh﹏/finish_daliy_personal_task_dlg",
        "N閜 v? nh薾 thng nhi謒 v? thng nh藅 t? i/finish_daliy_team_task_dlg",
        "K誸 th骳 i tho筰/dialog_over",
    };

    Say(DAILY_TASK_0912_NPC .. format("H玬 nay nhi謒 v? thng nh藅 c? nh﹏ l? <color=yellow>%s<color>, nhi謒 v? thng nh藅 t? i l? <color=yellow>%s<color>",DALIY_TASK_0912_PERSONAL_TASK_LIST[nPersonalTask][1], DALIY_TASK_0912_TEAM_TASK_LIST[nTeamTask][1]), getn(tb_main_dialog), tb_main_dialog);
end

function finish_daliy_personal_task_dlg()
	local tb_sub_dialog =
	 {
	        format("%s/%s", "Nh薾 ph莕 thng nhi謒 v?", "finish_daliy_personal_task"),
	        format("%s/#%s", format("S? d鬾g %d %s i ph莕 thng",2,"Xu"), "finish_daliy_personal_task(1)"),
	        "K誸 th骳 i tho筰/dialog_over",
    	};
	Say(DAILY_TASK_0912_NPC .. format("L謓h t? Minh Ch?, nay ho祅 th祅h nhi謒 v? v? l﹎ h籲g ng祔 u 頲 nh薾 th猰 <color=yellow>%s<color>, v韎 l謓h b礽 n祔 c? th? n t譵 Th莕 Binh C竎 Trng L穙 (Tng Dng:183, 175) i l蕐 trang b? S? M玭 Ho祅g Kim b? 4. <enter>N誹 nh? s? d鬾g <color=yellow>%s<color>  nh薾 thng th? s? nh薾 頲 <color=yellow>%s<color> s? lng g蕄 <color=green>%d<color> l莕, ph莕 thng kinh nghi謒 t╪g cao <color=green>%s<color>.","V? L﹎ Ho祅g Kim L謓h","Xu","V? L﹎ Ho祅g Kim L謓h",2,"30%"), getn(tb_sub_dialog), tb_sub_dialog);
end

function finish_daliy_team_task_dlg()
	local tb_sub_dialog =
	 {
	        format("%s/%s", "Nh薾 ph莕 thng nhi謒 v?", "finish_daliy_team_task"),
	        format("%s/#%s", format("S? d鬾g %d %s i ph莕 thng",2,"Xu"), "finish_daliy_team_task(1)"),
	        "K誸 th骳 i tho筰/dialog_over",
    	};
	Say(DAILY_TASK_0912_NPC .. format("L謓h t? Minh Ch?, nay ho祅 th祅h nhi謒 v? v? l﹎ h籲g ng祔 u 頲 nh薾 th猰 <color=yellow>%s<color>, v韎 l謓h b礽 n祔 c? th? n t譵 Th莕 Binh C竎 Trng L穙 (Tng Dng:183, 175) i l蕐 trang b? S? M玭 Ho祅g Kim b? 4. <enter>N誹 nh? s? d鬾g <color=yellow>%s<color>  nh薾 thng th? s? nh薾 頲 <color=yellow>%s<color> s? lng g蕄 <color=green>%d<color> l莕, ph莕 thng kinh nghi謒 t╪g cao <color=green>%s<color>.","V? L﹎ Ho祅g Kim L謓h","Xu","V? L﹎ Ho祅g Kim L謓h",2,"30%"), getn(tb_sub_dialog), tb_sub_dialog);
end

--完成个人日常任务
function finish_daliy_personal_task(bBonus)
    local nPersonalTask = GetTask(DAILY_TASK_0912_PERSONAL_TASK_ID);
    if nPersonalTask == 0 then
        Talk(1, "", DAILY_TASK_0912_NPC.."C竎 h? v蒼 ch璦 nh薾 nhi謒 v? thng nh藅 c? nh﹏ c馻 h玬 nay, kh玭g th? nh薾 ph莕 thng n祔.");
    elseif nPersonalTask == 1 then
        Talk(1, "", DAILY_TASK_0912_NPC.."C竎 h? v蒼 ch璦 ho祅 th祅h nhi謒 v? thng nh藅 c? nh﹏ c馻 h玬 nay, kh玭g th? nh薾 ph莕 thng n祔");
    elseif nPersonalTask == 2 then
        if gf_JudgeRoomWeight(2, 100, DAILY_TASK_0912_NPC) == 0 then
            return 0;
        end
        local nExp = DALIY_TASK_0912_PERSONAL_TASK_AWARD_EXP;
        if (bBonus == 1) then
        	if (DelItem(2, 1, 30230, 2) == 1) then
        		nExp = floor(nExp * 1.3);
        	else
        		Talk(1,"",format("C竎 h? mang <color=yellow>%s<color> kh玭g  <color=green>%d<color>!","Xu",2));
        		return 0;
        	end
        end
        gf_EventGiveRandAward(DALIY_TASK_0912_PERSONAL_TASK_AWARD_LIST, 1000, 2, DAILY_TASK_0912_PERSONAL_LOG_TITLE, DAILY_TASK_0912_PERSONAL_LOG_ACTION);
        gf_EventGiveCustomAward(1, nExp, 1, DAILY_TASK_0912_PERSONAL_LOG_TITLE, DAILY_TASK_0912_PERSONAL_LOG_ACTION);
        SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 0);
        Give_Daily_Personal_Task_Award(bBonus);--from "\\script\\online_activites\\award.lua"
       -- AwardZhenQi_WuLingShiZhe(1)
    end
end

--完成团队日常任务
function finish_daliy_team_task(bBonus)
    local nTeamTask = GetTask(DAILY_TASK_0912_TEAM_TASK_ID);
    if nTeamTask == 0 then
        Talk(1, "", DAILY_TASK_0912_NPC.."C竎 h? v蒼 ch璦 nh薾 nhi謒 v? thng nh藅 t? i c馻 h玬 nay, kh玭g th? nh薾 ph莕 thng n祔.");
    elseif nTeamTask == 1 then
        Talk(1, "", DAILY_TASK_0912_NPC.."C竎 h? v蒼 ch璦 ho祅 th祅h nhi謒 v? thng nh藅 t? i c馻 h玬 nay, kh玭g th? nh薾 ph莕 thng n祔");
    elseif nTeamTask == 2 then
        if gf_JudgeRoomWeight(2, 100, DAILY_TASK_0912_NPC) == 0 then
            return 0;
        end
        local nExp = DALIY_TASK_0912_TEAM_TASK_AWARD_EXP;
        if (bBonus == 1) then
        	if (DelItem(2, 1, 30230, 2) == 1) then
        		nExp = floor(nExp * 1.3);
        	else
        		Talk(1,"",format("C竎 h? mang <color=yellow>%s<color> kh玭g  <color=green>%d<color>!","Xu",2));
        		return 0;
        	end
        end
        gf_EventGiveRandAward(DALIY_TASK_0912_TEAM_TASK_AWARD_LIST, 1000, 2, DAILY_TASK_0912_TEAM_LOG_TITLE, DAILY_TASK_0912_TEAM_LOG_ACTION);
        gf_EventGiveCustomAward(1, nExp, 1, DAILY_TASK_0912_TEAM_LOG_TITLE, DAILY_TASK_0912_TEAM_LOG_ACTION);
        SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 0);
        Give_Daily_Team_Task_Award(bBonus);--from "\\script\\online_activites\\award.lua"
       -- AwardZhenQi_WuLingShiZhe(2)
    end
end

--领取个人日常任务
function get_daliy_personal_task()
    local nPersonalCount = GetTask(DAILY_TASK_0912_PERSONAL_TASK_COUNT);
    local nPersonalTask = GetTask(DAILY_TASK_0912_PERSONAL_TASK_ID);
    local nDate = tonumber(date("%y%m%d"));

    if GetLevel() < 70 then
        Talk(1, "", DAILY_TASK_0912_NPC.."C蕄 70 tr? l猲 m韎 c? th? nh薾 nhi謒 v? thng nh藅 c? nh﹏");
        return 0;
    end
    
    if GetPlayerRoute() == 0 then
         Talk(1, "", DAILY_TASK_0912_NPC.."Gia nh藀 m玭 ph竔 m韎 c? th? nh薾 nhi謒 v? thng nh藅 c? nh﹏");
        return 0;
    end

    if nPersonalTask ~= 0 then
        Talk(1, "", DAILY_TASK_0912_NPC.."C竎 h?  nh薾 1 nhi謒 v? thng nh藅 c? nh﹏ r錳, trc ti猲 h穣 ho祅 th祅h v? n閜 nhi謒 v? r錳 quay tr? l筰 y");
        return 0;
    end

    if nPersonalCount >= DAILY_CONST_0912_PERSONAL_TASK_MAX_COUNT then
        Talk(1, "", DAILY_TASK_0912_NPC.."H玬 nay  nh薾 s? l莕 nhi謒 v? thng nh藅 c? nh﹏ t n gi韎 h筺, ng祔 mai h穣 quay l筰 nh?.");
        return 0;
    end
    
    SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 1);
    SetTask(DAILY_TASK_0912_PERSONAL_TASK_COUNT, nPersonalCount + 1);
    SetTask(DAILY_TASK_0912_PERSONAL_TASK_DATE, nDate);
    Talk(1, "", DAILY_TASK_0912_NPC.."H玬 nay c竎 h?  nh薾 nhi謒 v? thng nh藅 c? nh﹏, ph秈 ho祅 th祅h nhi謒 v? trong ng祔 m韎 c? th? nh薾 thng!");

    local szPersonalTask = DALIY_TASK_0912_PERSONAL_TASK_LIST[GetGlbValue(DAILY_TASK_0912_PERSONAL_TASK)][1];
    TaskTip(szPersonalTask);
end
--领取团队日常任务
function get_daliy_team_task()
    local nTeamSize = GetTeamSize();
    if nTeamSize == 0 or nTeamSize == 1 then
        if check_can_get_team_task() == 1 then
            get_daliy_personal_task_perman();  
        end
    else
        --检查是不是队长
        if GetName() ~= GetCaptainName() then
            Talk(1, "", DAILY_TASK_0912_NPC.."L骳 nh薾 nhi謒 v? t? i, ch? c? i trng m韎 c? th? nh薾.");
            return 0;
        end

        --检查是否所有人都可以接
        local nRetCode = 1;
        local nOldIndex = PlayerIndex;
        for i = 1, nTeamSize do
            PlayerIndex = GetTeamMember(i);
            if check_can_get_team_task() == 0 then
                nRetCode = 0;
            end
        end
        PlayerIndex = nOldIndex;

        if nRetCode == 0 then
            Talk(1, "", DAILY_TASK_0912_NPC.."Trong t? i c? ngi kh玭g  甶襲 ki謓, nh薾 nhi謒 v? th蕋 b筰.");
        else
            local nOldIndex = PlayerIndex;
            for i = 1, nTeamSize do
                PlayerIndex = GetTeamMember(i);
                get_daliy_personal_task_perman();
            end
            PlayerIndex = nOldIndex;
            Talk(1, "", DAILY_TASK_0912_NPC.."T? i  nh薾 nhi謒 v? thng nh藅 t? i c馻 h玬 nay, ph秈 ho祅 th祅h nhi謒 v? trong ng祔 m韎 c? th? nh薾 thng!");
        end
    end
end
--检查是否有资格领取团队日常任务
function check_can_get_team_task()
    local nDate = tonumber(date("%y%m%d"));
    if GetTask(DAILY_TASK_0912_PERSONAL_TASK_DATE) < nDate then
        SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 0);
        SetTask(DAILY_TASK_0912_PERSONAL_TASK_COUNT, 0);
    end
    if GetTask(DAILY_TASK_0912_TEAM_TASK_DATE) < nDate then
        SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 0);
        SetTask(DAILY_TASK_0912_TEAM_TASK_COUNT, 0);
    end

    local nTeamCount = GetTask(DAILY_TASK_0912_TEAM_TASK_COUNT);
    local nTeamTask = GetTask(DAILY_TASK_0912_TEAM_TASK_ID);

    if GetLevel() < 70 then
        Talk(1, "", DAILY_TASK_0912_NPC.."Ngi ch琲 ph秈 c蕄 70 tr? l猲 m韎 c? th? nh薾 nhi謒 v? thng nh藅 t? i.");
        return 0;
    end
    
    if GetPlayerRoute() == 0 then
         Talk(1, "", DAILY_TASK_0912_NPC.."Gia nh藀 m玭 ph竔 m韎 c? th? nh薾 nhi謒 v? thng nh藅 t? i");
        return 0;
    end

    if nTeamTask ~= 0 then
        Talk(1, "", DAILY_TASK_0912_NPC.."C竎 h?  nh薾 1 nhi謒 v? thng nh藅 t? i, trc ti猲 h穣 ho祅 th祅h v? n閜 nhi謒 v? r錳 m韎 頲 nh薾 ti誴.");
        return 0;
    end

    if nTeamCount >= DAILY_CONST_0912_TEAM_TASK_MAX_COUNT then
        Talk(1, "", DAILY_TASK_0912_NPC.."H玬 nay c竎 h?  nh薾 nhi謒 v? thng nh藅 t? i t n m鴆 cao nh蕋, ngay mai quay l筰 nh?");
        return 0;
    end

    return 1;
end
--每个人接团队日常任务
function get_daliy_personal_task_perman()
    local nDate = tonumber(date("%y%m%d"));
    local nTeamCount = GetTask(DAILY_TASK_0912_TEAM_TASK_COUNT);
    SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 1);
    SetTask(DAILY_TASK_0912_TEAM_TASK_COUNT, nTeamCount + 1);
    SetTask(DAILY_TASK_0912_TEAM_TASK_DATE, nDate);
    Talk(1, "", DAILY_TASK_0912_NPC.."C竎 h?  nh薾 nhi謒 v? thng nh藅 t? i! Trong ng祔 ph秈 ho祅 th祅h xong m韎 c? th? nh薾 thng!");

    local szTeamTask = DALIY_TASK_0912_TEAM_TASK_LIST[GetGlbValue(DAILY_TASK_0912_TEAM_TASK)][1];
    TaskTip(szTeamTask);
end

--查看本日的任务完成情况
function view_today_task_info()
    local nPersonalCount = GetTask(DAILY_TASK_0912_PERSONAL_TASK_COUNT);
    local nTeamCount = GetTask(DAILY_TASK_0912_TEAM_TASK_COUNT);
    local nTaskPersonalStep = GetTask(DAILY_TASK_0912_PERSONAL_TASK_ID);
    local nTaskTeamStep = GetTask(DAILY_TASK_0912_TEAM_TASK_ID);

    local szPersonalState = "";
    local szTeamState = "";

    if nTaskPersonalStep == 0 then
        szPersonalState = "V蒼 ch璦 nh薾 nhi謒 v?  thng nh藅 c? nh﹏";
    elseif nTaskPersonalStep == 1 then
        szPersonalState = "Х nh薾 nhi謒 v? thng nh藅 c? nh﹏ v? v蒼 ch璦 ho祅 th祅h";
    elseif nTaskPersonalStep == 2 then
        szPersonalState = "Х nh薾 nhi謒 v? thng nh藅 c? nh鈔, v蒼 ch璦 n閜 nhi謒 v? v? nh薾 ph莕 thng";
    end

    if nTaskTeamStep == 0 then
        szTeamState = "V蒼 ch璦 nh薾 nhi謒 v? thng nh藅 t? i";
    elseif nTaskTeamStep == 1 then
        szTeamState = "Х nh薾 nhi謒 v? thng nh藅 t? i v? v蒼 ch璦 ho祅 th祅h";
    elseif nTaskTeamStep == 2 then
        szTeamState = "Х nh薾 nhi謒 v? thng nh藅 t? i, v蒼 ch璦 n閜 nhi謒 v? v? nh薾 ph莕 thng";
    end

    Say(DAILY_TASK_0912_NPC..format("H玬 nay i hi謕  nh薾 <color=red>%d<color> l莕 nhi謒 v? thng nh藅 c? nh﹏ <color=red>%d<color> l莕 nhi謒 v? thng nh藅 t? i<enter>Hi謓 t筰, <color=yellow> nhi謒 v? thng nh藅 c? nh﹏ <color>  nh薾: <color=red>%s<color><enter>Hi謓 t筰,  <color=yellow> nhi謒 v? thng nh藅 t? i <color>  nh薾: <color=red>%s<color><enter>", nPersonalCount, nTeamCount, szPersonalState, szTeamState), 0);
end

--取消个人日常
function cancel_personal_task()
    local nPersonalTask = GetTask(DAILY_TASK_0912_PERSONAL_TASK_ID);
    if nPersonalTask == 0 then
        Say(DAILY_TASK_0912_NPC.."C竎 h? v蒼 ch璦 nh薾 nhi謒 v? thng nh藅 c? nh﹏, v? v藋 kh玭g th? h駓 b? 頲.", 0);
    else
        Say(DAILY_TASK_0912_NPC.."X竎 nh薾 mu鑞 b? nhi謒 v? thng nh藅 c? nh﹏?", 2, "уng ?/confirm_cancel_persional_task", "tr? l筰/DaliyTask0912About");
    end
end
function confirm_cancel_persional_task()
    SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 0);
    Talk(1, "", DAILY_TASK_0912_NPC.."Х h駓 b? th祅h c玭g nhi謒 v? thng nh藅 c? nh﹏ c馻 h玬 nay");
end

--取消团队日常
function cancel_team_task()
    local nTeamTask = GetTask(DAILY_TASK_0912_TEAM_TASK_ID);
    if nTeamTask == 0 then
        Say(DAILY_TASK_0912_NPC.."C竎 h? v蒼 ch璦 nh薾 nhi謒 v? thng nh藅 t? i, v? v藋 kh玭g th? h駓 b? 頲.", 0);
    else
        Say(DAILY_TASK_0912_NPC.."X竎 nh薾 mu鑞 b? nhi謒 v? thng nh藅 t? i!", 2, "уng ?/confirm_cancel_team_task", "tr? l筰/DaliyTask0912About");
    end
end
function confirm_cancel_team_task()
    SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 0);
    Talk(1, "", DAILY_TASK_0912_NPC.."Х h駓 b? th祅h c玭g nhi謒 v? thng nh藅 t? i c馻 h玬 nay");
end

--完成个人日常任务
function is_he_finish_the_personal_task(szMonsterName)
	if random(1, 1000) > 17 then
	    return 0;
	end
	    
	local nPersonalTask = GetGlbValue(DAILY_TASK_0912_PERSONAL_TASK);
	if nPersonalTask == 0 then
	    return 0;
	end
	
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(DAILY_TASK_0912_PERSONAL_TASK_DATE) < nDate then
	    SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 0);
	    SetTask(DAILY_TASK_0912_PERSONAL_TASK_COUNT, 0);
	end
	
	local nMatch = 0;
	local tbMonsterList = DALIY_TASK_0912_PERSONAL_TASK_LIST[nPersonalTask][3]
	for i = 1, getn(tbMonsterList) do
		if tbMonsterList[i] == szMonsterName then
		    nMatch = 1;
		    break;
		end
	end
	
	local nTeamSize = GetTeamSize();
	if nTeamSize == 0 or nTeamSize == 1 then	
	  	if GetTask(DAILY_TASK_0912_PERSONAL_TASK_ID) == 1 then
	      	if nMatch == 1 then
	          		SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 2);
	          		TaskTip("Чi hi謕  ho祅 th祅h nhi謒 v? thng nh藅 c? nh﹏ c馻 h玬 nay!");
	      	end
	  	end
	else
	    local nOldIndex = PlayerIndex;
	    for i = 1, nTeamSize do
			PlayerIndex = GetTeamMember(i);	
			if GetTask(DAILY_TASK_0912_PERSONAL_TASK_DATE) < nDate then
			    		SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 0);
			    		SetTask(DAILY_TASK_0912_PERSONAL_TASK_COUNT, 0);
			end			
			if GetTask(DAILY_TASK_0912_PERSONAL_TASK_ID) == 1 then
				if nMatch == 1 then
			        	SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 2);
			        	TaskTip("Чi hi謕  ho祅 th祅h nhi謒 v? thng nh藅 c? nh﹏ c馻 h玬 nay!");
			  	end
			end
		end         
	     PlayerIndex = nOldIndex;
	end
end

--完成团队日常任务
function is_he_finish_the_team_task(szItemName)
    --if random(1, 1000) > 17 then
    --    return 0;
    --end

    local nTeamTask = GetGlbValue(DAILY_TASK_0912_TEAM_TASK);
    if nTeamTask == 0 then
        return 0;
    end

    local nDate = tonumber(date("%y%m%d"));
    if GetTask(DAILY_TASK_0912_TEAM_TASK_DATE) < nDate then
        SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 0);
        SetTask(DAILY_TASK_0912_TEAM_TASK_COUNT, 0);
    end

    if DALIY_TASK_0912_TEAM_TASK_LIST[nTeamTask][3] ~= szItemName then
        return 0;
    end

    local nTeamSize = GetTeamSize();
    if nTeamSize == 0 or nTeamSize == 1 then
        if GetTask(DAILY_TASK_0912_TEAM_TASK_ID) == 1 then
            SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 2);
            TaskTip("Чi hi謕  ho祅 th祅h nhi謒 v? thng nh藅 t? i c馻 h玬 nay!");
        end
    else
        local nOldIndex = PlayerIndex;
        for i = 1, nTeamSize do
            PlayerIndex = GetTeamMember(i);
            if GetTask(DAILY_TASK_0912_TEAM_TASK_DATE) < nDate then
                SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 0);
                SetTask(DAILY_TASK_0912_TEAM_TASK_COUNT, 0);
            end
            if GetTask(DAILY_TASK_0912_TEAM_TASK_ID) == 1 then
                SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 2);
                TaskTip("Чi hi謕  ho祅 th祅h nhi謒 v? thng nh藅 t? i c馻 h玬 nay!");
            end
        end
        PlayerIndex = nOldIndex;
    end
    
end

function dialog_over()
end
