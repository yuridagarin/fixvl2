-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理任务NPC蚩火大长老Script
-- By StarryNight
-- 2006/01/13 PM 10:15

--爱情在岁月流转中逐渐腿色，剩下的会是什么……

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\大理\\task_head.lua")

function OnDeath(index)
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- 玩家未组队
        if GetTask(TASK_DL_LV75_ID) == 1 then
        	SetTask(TASK_DL_LV75_ID, 2);
        	Msg2Player("H錳 b竜 Ng? чc gi竜 ch?  nh b筰 Xi H醓 i trng l穙");
        	TaskTip("H錳 b竜 Ng? чc gi竜 ch?  nh b筰 Xi H醓 i trng l穙");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV75_ID) == 1 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV75_ID, 2);
           	Msg2Player("H錳 b竜 Ng? чc gi竜 ch?  nh b筰 Xi H醓 i trng l穙");
           	TaskTip("H錳 b竜 Ng? чc gi竜 ch?  nh b筰 Xi H醓 i trng l穙");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
    end;
end;