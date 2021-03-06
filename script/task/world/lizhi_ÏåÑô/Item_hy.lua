--使用火药之后执行的脚本
--created by lizhi
--2005-8-30 11:12

--东山哨岗  1542 3049
--西山哨岗  1354 2856
--粮草      1544 2686
--辎重      1544 2686

Include("\\script\\task\\world\\task_award.lua")
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

function OnUse()
    local nMapId, nX, nY = GetWorldPos();
    local flagEast = 0;
    local flagWest = 0;
    local nDistEast = 0;
    local nDistWest = 0;

--烧毁哨岗的任务
    if GetTask(TASK_XY_ONE) == 2 then
    
        if GetTask(TASK_XY_ONE_ONE) ~= 1 then
            nDistEast = DistanceBetweenPoints(nMapId, nX, nY, 311, 1542, 3049);   --到东山哨港的距离    
            if nDistEast >= 0 and nDistEast <= 10 then
                flagEast = 1;
            end;
        end;
        
        if GetTask(TASK_XY_ONE_TWO) ~= 1 then  
            nDistWest = DistanceBetweenPoints(nMapId, nX, nY, 311, 1354, 2856);   --到西山哨港的距离
            if nDistWest >= 0 and nDistWest <= 10 then
                flagWest = 1;
            end;
        end;
        --Msg2Player(flagWest);
        if flagEast ~= 1 and flagWest ~= 1 then
            Talk(1,"","Thu鑓 n? n祔 d飊g  t {L莡 canh} c馻 Li猽 qu﹏ ? Ph鬰 Ng璾 s琻.");
            return
        end;
        
        if flagEast == 1 then
            Death("L莡 canh Йng S琻");
            DelItem(2,0,70,1);
            SetTask(TASK_XY_ONE_ONE, 1);   --证明烧毁的是东山
        else
            Death("L莡 canh T﹜ S琻");
            DelItem(2,0,70,1);
            SetTask(TASK_XY_ONE_TWO, 1);   --烧毁的是西山
        end;
        
        if GetTask(TASK_XY_ONE_ONE) == 1 and GetTask(TASK_XY_ONE_TWO) == 1 then
            SetTask(TASK_XY_ONE, 3);
            Msg2Player("V? b竜 cho T鎛g binh Tng Dng");
            TaskTip("V? b竜 cho T鎛g binh Tng Dng");
            SetTask(TASK_XY_ONE_ONE, 0);
            SetTask(TASK_XY_ONE_TWO, 0);
        end;
    end;
    
--烧毁粮草和辎重的任务 
    if GetTask(TASK_XY_ONE) == 4 then
        nDistEast = DistanceBetweenPoints(nMapId, nX, nY, 311, 1544, 2686);   --到粮草和辎重的距离
        if nDistEast >= 0 and nDistEast <= 10 then
            Death("Lng th秓");
            Death("Qu﹏ nhu");
            SetTask(TASK_XY_ONE, 5);
            AddItem(2,0,71,1);
            DelItem(2,0,70,1);
            if GetTask(TASK_XY_ONE) == 5 and GetTask(TASK_XY_TWO) == 5 then  --如果襄阳支线任务都完成了，则见公孙书
                SetTask(TASK_XYTY, 56);
                Msg2Player("V? b萴 b竜 C玭g T玭 Th?");
                TaskTip("V? b萴 b竜 C玭g T玭 Th?");
            end;
        else
            Talk(1,"","Thu鑓 n? n祔 d飊g  t lng th秓 v? qu﹏ nhu.");
        end;
    end;
end;