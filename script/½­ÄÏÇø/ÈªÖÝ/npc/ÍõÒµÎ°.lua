
-- ====================== 文件信息 ======================
-- 对应NPC名称：王业伟
-- Edited by lizhi
-- 2005/02/22 PM 18:03
-- ======================================================

Include("\\script\\task\\world\\lizhi_泉州\\10级\\task_main.lua");

function main()
    
    local nLevel = 0;
    local nStep = 0;
    
    if GetTask(1) == 25 and GetTask(130) == 1 then
        local szMsg = {
            "Tri謚 Di猲 Ni猲 v? D? T萿 l穙 nh﹏ nh? t筰 h? mang th? t韎 cho Vng huynh! Xin huynh xem qua!",
            "Qu? l? b籲g h鱱 t鑤! Xem ra c竎 huynh v蒼 c遪 nh? n ta!",
            "[Vng Nghi謕 V? nh薾 l蕐 b鴆 th璢",
            "Xin 產 t? <sex>!",
            "Kh玭g c? chi."
        };
        SetTask(130, 2);
        if GetTask(131) == 2 and GetTask(132) == 2 then
            SetTask(1, 26); --如果完成新手任务的送信任务(最后一步)，则关闭任务面板
        end;
        TalkEx("", szMsg);
        DelItem(2,0,49,1);
        return
    end;
    
    if GetLevel() < 10 then
        can_not_accept_task();
        return
    end;

    nStep = GetTask(TASK_LEV_12_ID);
    if (nStep == 5) then
        local szTalk = {
            "Phi襫 huynh theo d鈏 s? n? xem chuy謓 mua b竛 g莕 y  b竛 cho nh鱪g ai? Hi謓 ta ch糿g r? g? h誸! Huynh mau xem th?!",
            "G莕 y, ph莕 l韓 chuy謓 mua b竛 l? b竛 cho i ph? 玭g {Чi Ch? Cng} ? {Tuy襫 Ch﹗}, v? h緉 cho l? h祅g h鉧 c馻 ta t鑤 n猲 ta m韎 l苙 l閕 ng祅 d苖 chuy觧 t? Dng Ch﹗ n y.",
            "{Чi Ch? Cng} c? th?  g苝 chuy謓! в ta 甶 xem th?, sau n祔 n鉯 ti誴 nh?!",
        };
        SetTask(TASK_LEV_12_ID, 6);
        SetTask(TASK_LEV_14_ID, 100);   --泉州代志强任务开启
        TalkEx("", szTalk);
        return
    end;

    nStep = GetTask(TASK_LEV_10_ID);
    if (nStep == 0) then
        task_000_00();
        return
    elseif (nStep == 1) then
        task_001_00();
        return
    elseif (nStep == 2) then
        task_002_00();
        return
    elseif (nStep == 3) then
        task_003_00();
        return
    elseif (nStep >= 4) then
        task_004_00();
        return
    end;

    can_not_accept_task();
end;