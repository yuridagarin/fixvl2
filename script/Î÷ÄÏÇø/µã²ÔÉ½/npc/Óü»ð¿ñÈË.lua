-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理任务NPC狱火狂人Script
-- By StarryNight
-- 2006/01/11 PM 18:28

--爱情在岁月流转中逐渐腿色，剩下的会是什么……

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\大理\\task_head.lua")

function OnDeath(index)
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- 玩家未组队
        if GetTask(TASK_DL_LV60_1_ID) == 2 then
        	SetTask(TASK_DL_LV60_1_ID, 3);
        	Msg2Player("V? Th祅h Й g苝 V? Nng th玭g b竜  nh b筰 Ng鬰 H醓 Cu錸g Nh﹏");
        	TaskTip("V? Th祅h Й g苝 V? Nng th玭g b竜  nh b筰 Ng鬰 H醓 Cu錸g Nh﹏");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV60_1_ID) == 2 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV60_1_ID, 3);
           	Msg2Player("V? Th祅h Й g苝 V? Nng th玭g b竜  nh b筰 Ng鬰 H醓 Cu錸g Nh﹏");
           	TaskTip("V? Th祅h Й g苝 V? Nng th玭g b竜  nh b筰 Ng鬰 H醓 Cu錸g Nh﹏");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
    end;
end;