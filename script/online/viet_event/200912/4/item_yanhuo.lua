--=============================================
--create by baiyun 2009.11.18
--describe:越南版12月份活动 烟火脚本文件
--=============================================
Include("\\script\\online\\viet_event\\200912\\event_head.lua");

function OnUse(nItemIdx)
	do return end
    local nDate = tonumber(date("%y%m%d"));
    local nDay = tonumber(date("%w"))
    local nLastUseDate = GetTask(VIET_0912_TASK_USE_YANHUO_DATE);

    if GetCaptainName() ~= GetName() or GetTeamSize() ~= 8 or GetLevel() < 10 or GetPlayerRoute() == 0 then
        Talk(1, "", VIET_0912_NPC_NAME_3.."Ph秈 c蕄 10 tr? l猲 v?  gia nh藀 m玭 ph竔, t? i  8 ngi th? i trng m韎 c? th? s? d鬾g ph竜 hoa");
        return 0;
    end

    if nDate > 100117 then
        Talk(1, "", VIET_0912_NPC_NAME_3.."V藅 ph萴 n祔  qu? h筺 s? d鬾g.");
        return 0;
    end

    if nDay == 2 or nDay == 3 or nDay == 4 then
        Talk(1, "", VIET_0912_NPC_NAME_3.."V藅 ph萴 n祔 ch? v祇 th? hai, th? s竨, th? b秠, ch? nh藅 m韎 c? th? s? d鬾g");
        return 0;
    end

    if nDate > nLastUseDate then
        SetTask(VIET_0912_TASK_USE_YANHUO_COUNT, 0);
    end

    --判断是否可以使用烟火
    local nOldIndex = PlayerIndex;
    local nCanUse = 1;
    for i = 1, GetTeamSize() do
        PlayerIndex = GetTeamMember(i)
        if PlayerIndex > 0 then                                                  
            if check_can_use() == 0 then
                nCanUse = 0;
            end
        end
    end
    PlayerIndex = nOldIndex;
    if nCanUse == 0 then
        Talk(1, "", VIET_0912_NPC_NAME_3.."Trong t? i c? ngi kh玭g  甶襲 ki謓 t ph竜 hoa, v? v藋 kh玭g th? ti課 h祅h t ph竜 hoa 頲.");
        gf_Msg2Team("Trong t? i c? ngi kh玭g  甶襲 ki謓 t ph竜 hoa, v? v藋 kh玭g th? ti課 h祅h t ph竜 hoa 頲.", 1);
        return 0;
    end
    
    --给烟火奖励
    if DelItemByIndex(nItemIdx, 1) == 1 then
        local nOldIndex = PlayerIndex;
        for i = 1, GetTeamSize() do
            PlayerIndex = GetTeamMember(i)
            if PlayerIndex > 0 then                                                  
                use_yanhuo();
            end
        end
        PlayerIndex = nOldIndex;
        DoFireworks(801, 10);
    end
end

function check_can_use()
    local nDate = tonumber(date("%y%m%d"));
    local nTime = GetTime();
    local nLastUseDate = GetTask(VIET_0912_TASK_USE_YANHUO_DATE);
    local nLastUseTime = GetTask(VIET_0912_TASK_USE_YANHUO_TIME);
    
    if nDate > nLastUseDate then
        SetTask(VIET_0912_TASK_USE_YANHUO_COUNT, 0);
    end

    local nHasUseCount = GetTask(VIET_0912_TASK_USE_YANHUO_COUNT);

    if GetLevel() < 10 then
        Talk(1, "", VIET_0912_NPC_NAME_3.."C竎 h? kh玭g  c蕄 10, kh玭g  甶襲 ki謓 nh薾 ph莕 thng.");
        return 0;
    end

    if GetPlayerRoute() == 0 then
        Talk(1, "", VIET_0912_NPC_NAME_3.."Ch璦 gia nh藀 m玭 ph竔 kh玭g th? nh薾 ph莕 thng");
        return 0;
    end

    if nHasUseCount >= VIET_0912_YANHUO_MAX_COUNT then
        Talk(1, "",  VIET_0912_NPC_NAME_3.."S? l莕 nh薾 ph莕 thng c馻 h玬 nay  n m鴆 cao nh蕋, kh玭g th? nh薾 th猰.");
        return 0;
    end

    if nTime - nLastUseTime < 300 then
        Talk(1, "",  VIET_0912_NPC_NAME_3.."Gi穘 c竎h c馻 hai l莕 nh薾 ph莕 thng ch璦 n 5 ph髏, xin h穣 i th猰 l竧 n鱝.");
        return 0;
    end

    return 1;
    
end

function use_yanhuo()
    gf_EventGiveCustomAward(1, 100000, 1);
    SetTask(VIET_0912_TASK_USE_YANHUO_DATE, tonumber(date("%y%m%d")));
    SetTask(VIET_0912_TASK_USE_YANHUO_TIME, GetTime());
    SetTask(VIET_0912_TASK_USE_YANHUO_COUNT, GetTask(VIET_0912_TASK_USE_YANHUO_COUNT) + 1);
end
