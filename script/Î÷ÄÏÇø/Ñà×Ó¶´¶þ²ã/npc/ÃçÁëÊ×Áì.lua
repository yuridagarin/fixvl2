-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理任务NPC苗族首领Script
-- By StarryNight
-- 2006/01/09 PM 16:12

--爱情在岁月流转中逐渐腿色，剩下的会是什么……

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\大理\\task_head.lua")

function OnDeath(index)
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- 玩家未组队
        if GetTask(TASK_DL_LV50_ID) == 4 then
        	SetTask(TASK_DL_LV50_ID, 5);
        	AddItem(2,0,370,1);
        	Msg2Player("Х l蕐 頲 Mi猽 L躰h l謓h b礽, v? g苝 T閏 trng Mi猽 L躰h");
        	TaskTip("Х l蕐 頲 Mi猽 L躰h l謓h b礽, v? g苝 T閏 trng Mi猽 L躰h");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV50_ID) == 4 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV50_ID, 5);
           	AddItem(2,0,370,1);
           	Msg2Player("Х l蕐 頲 Mi猽 L躰h l謓h b礽, v? g苝 T閏 trng Mi猽 L躰h");
           	TaskTip("Х l蕐 頲 Mi猽 L躰h l謓h b礽, v? g苝 T閏 trng Mi猽 L躰h");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
    end;
end;