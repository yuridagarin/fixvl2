--  文件说明
--  对应NPC名称：刘明晖
--  created by lizhi
--  2005-8-4 15:14

Include("\\script\\task\\world\\lizhi_泉州\\14级\\task_main.lua");

function main()
    
    local nLevel = 0;
    local nStep = 0;
    local szTalk = {
        "Ha ha! N鯽 i sau c馻 ta kh玭g c莕 s鑞g l? thu閏 v祇 ngi kh竎!"
    };

    nStep = GetTask(TASK_LEV_14_ID);

    if (nStep == 3) then
        task_003_02();
    elseif (nStep == 4) then
        task_004_01();
    else
        TalkEx("", szTalk);
    end;

end;
