--文件说明
--与丐帮弟子对话
--created by lizhi
--2005-8-15 10:11

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_成都\\task_main.lua");

function main()
    local szTalk = {
        "礽?!",
        "V? ti觰 huynh  y c? ph秈  t? C竔 Bang kh玭g? H錸g s? th骳 sai ta t譵 huynh.",
        "<sex> kh玭g hi觰 u! Kh玭g ph秈 ta kh玭g mu鑞 v?, m? l?.....",
        "Sao th??",
        "M蕐 h玬 trc 甶 ngang qua Lng S琻 B筩 b? m s琻 t芻 ph鬰 k輈h, may ch箉 tho竧 nh璶g h祅h l?  b? ch髇g l蕐 m蕋.",
        "в ta gi髉 ngi t譵 {h祅h l齷 v?."
    };
    local szTalk1 = {
        "T譵 頲 h祅h l? ch璦?",
        "? y nhi襲 s琻 t芻 qu?,  ta t譵 l筰!"
    };
    local szFinished = {
        "T譵 頲 h祅h l? ch璦?",
        "H祅h l? n祔 ph秈 c馻 huynh kh玭g?",
        "ng v藋!  t? <sex>, ta l藀 t鴆 v? g苝 s? th骳 y!"
    };
    local szTalk2 = {
        "Kh玭g lo s? th骳 khi觧 tr竎h n鱝 r錳!"
    };
    
    local nStep = GetTask(TASK_CD_FOUR);
    
    if nStep == 2 then
        TalkEx("task_four_02", szTalk);
        return
    elseif nStep == 3 then
        TalkEx("task_four_03", szTalk1);
        return
    elseif nStep == 4 then
        TalkEx("task_four_04", szFinished);
        return
    elseif nStep == 5 then
        TalkEx("", szTalk2);
        return
    end;
    
    Talk(1, "", "竔 da厖");
end;