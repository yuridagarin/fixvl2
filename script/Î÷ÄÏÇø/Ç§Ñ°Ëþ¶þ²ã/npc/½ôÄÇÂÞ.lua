-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理任务NPC紧那罗Script
-- By StarryNight
-- 2006/01/13 PM 20:37

--爱情在岁月流转中逐渐腿色，剩下的会是什么……

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\大理\\task_head.lua")

function OnDeath()
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- 玩家未组队
        if GetTask(TASK_DL_LV80_ID) == 6 then
        	SetTask(TASK_DL_LV80_ID, 7);
        	AddItem(2,0,383,1,1);--得到任务物品引线
        	Msg2Player("Х nh b筰 Kh萵 Na La, h穣 mau v? Чi L? giao kim kh﹗ cho qu鑓 s?!");
        	TaskTip("Х nh b筰 Kh萵 Na La, h穣 mau v? Чi L? giao kim kh﹗ cho qu鑓 s?!");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV80_ID) == 6 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV80_ID, 7);
           	AddItem(2,0,383,1,1);--得到任务物品引线
           	Msg2Player("Х nh b筰 Kh萵 Na La, h穣 mau v? Чi L? giao kim kh﹗ cho qu鑓 s?!");
           	TaskTip("Х nh b筰 Kh萵 Na La, h穣 mau v? Чi L? giao kim kh﹗ cho qu鑓 s?!");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
    end;
end
