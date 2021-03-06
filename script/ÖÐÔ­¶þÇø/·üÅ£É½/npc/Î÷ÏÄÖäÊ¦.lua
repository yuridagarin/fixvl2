--npc西夏咒师
--created by lizhi
--2005-8-24 15:25

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath()
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- 玩家未组队
        if GetTask(TASK_XY_TWO) == 3 then
            if GetItemCount(2,0,210) >= 1 then
                DelItem(2,0,210,1);
                Msg2Player("R綾 Ph? Ch? Th駓 l猲 thi th? Ph竝 S? T﹜ H?");
                local nStep = GetTask(TASK_XY_TWO_ONE);
                SetTask(TASK_XY_TWO_ONE, nStep + 1);
            else
                Talk(1,"","Ch誸 r錳! Kh玭g c? <color=yellow>Ph? Ch? Th駓<color> hay l? quay v? V? ng nh? T? H筩 Ch﹏ Nh﹏ l藀 tr薾 ph竝.");
            end;
            
            if GetTask(TASK_XY_TWO_ONE) >= 3 then
                SetTask(TASK_XY_TWO, 5);
                AddItem(2,0,72,1);
                if GetTask(TASK_XY_ONE) == 5 and GetTask(TASK_XY_TWO) == 5 then  --如果襄阳支线任务都完成了，则见公孙书
                    SetTask(TASK_XYTY, 56);
                    Msg2Player("V? b萴 b竜 C玭g T玭 Th?");
                    TaskTip("V? b萴 b竜 C玭g T玭 Th?");
                end;
            end;
        end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if GetTask(TASK_XY_TWO) == 3 and nDist >= 0 and nDist <= 50 then
                if GetItemCount(2,0,210) >= 1 then
                    DelItem(2,0,210,1);
                    Msg2Player("R綾 Ph? Ch? Th駓 l猲 thi th? Ph竝 S? T﹜ H?");
                    local nStep = GetTask(TASK_XY_TWO_ONE);
                    SetTask(TASK_XY_TWO_ONE, nStep + 1);
                else
                    Talk(1,"","Ch誸 r錳! Kh玭g c? <color=yellow>Ph? Ch? Th駓<color> hay l? quay v? V? ng nh? T? H筩 Ch﹏ Nh﹏ l藀 tr薾 ph竝.");
                end;
                
                if GetTask(TASK_XY_TWO_ONE) >= 3 then
                    SetTask(TASK_XY_TWO, 5);
                    AddItem(2,0,72,1);
                    if GetTask(TASK_XY_ONE) == 5 and GetTask(TASK_XY_TWO) == 5 then  --如果襄阳支线任务都完成了，则见公孙书
                        SetTask(TASK_XYTY, 56);
                        Msg2Player("V? b萴 b竜 C玭g T玭 Th?");
                        TaskTip("V? b萴 b竜 C玭g T玭 Th?");
                    end;
                end;
            end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
    end;
end;
