-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理任务NPC摩呼罗迦Script
-- By StarryNight
-- 2006/01/13 PM 13:20

--爱情在岁月流转中逐渐腿色，剩下的会是什么……

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\大理\\task_head.lua")

function OnDeath(index)
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos(); 

    if nMemCount == 0 then -- 玩家未组队
        if GetTask(TASK_DL_LV75_ID) == 7 then
        	SetTask(TASK_DL_LV75_ID, 8);
        	Msg2Player("V? th玭g b竜 cho Tr辬h Qu竛 Chi  nh b筰 Ma H? La Gi?");
        	TaskTip("V? th玭g b竜 cho Tr辬h Qu竛 Chi  nh b筰 Ma H? La Gi?");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV75_ID) == 7 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV75_ID, 8);
           	Msg2Player("V? th玭g b竜 cho Tr辬h Qu竛 Chi  nh b筰 Ma H? La Gi?");
           	TaskTip("V? th玭g b竜 cho Tr辬h Qu竛 Chi  nh b筰 Ma H? La Gi?");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
    end;
end
