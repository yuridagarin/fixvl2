--使用空瓶子触发的脚本
--created by lizhi
--2005-9-2 11:18

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_award.lua");

function OnUse()
    if GetTask(TASK_YZ_THREE) == 9 then
        local nMapId, nX, nY = GetWorldPos();
        local nDist = DistanceBetweenPoints(nMapId, nX, nY, 112, 1694, 2987);
        if nDist >= 0 and nDist <= 30 then
            AddItem(2,0,148,1);
            DelItem(2,0,147,1);
        else
            Msg2Player("V祇 Lng Th駓 ng t莕g 1 s? d鬾g ");
            TaskTip("V祇 Lng Th駓 ng t莕g 1 s? d鬾g ");
        end;
    end;
end;