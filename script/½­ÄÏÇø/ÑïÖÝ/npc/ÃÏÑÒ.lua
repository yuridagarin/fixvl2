--在扬州任务孟岩
--created by lizhi
--2005-8-24 10:34

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_扬州\\task_main.lua");

function main()
    local nStep = GetTask(TASK_FIVE);
    if nStep == 13 then
        task_13_00();
    elseif nStep == 14 then
        task_14_00();
    elseif nStep >= 15 then
        local szTalk = {"<sex>, mu鑞 mua binh kh? ?? Ti誧 r籲g ta  b竛 h誸 r錳!"};
        TalkEx("", szTalk);
    else
        Talk(1,"","Th藅 xui x蝟! u n╩ u th竛g ch? mua 頲 t? ph玦 th衟 n祇!");
    end;
end;