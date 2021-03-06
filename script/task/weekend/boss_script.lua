--boss的脚本
--created by lizhi
--2005-9-19 17:34

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\WeekEnd\\task_head.lua");

function OnDeath(index)
	--只要被杀死就消失，不管是否被本人杀死
	local npcIndex = tonumber(index);
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    --杀的boss是你召唤出来的
    if nMemCount == 0 then -- 玩家未组队
	    if npcIndex == GetTask(TASK_NPC_INDEX) and npcIndex ~= 0 then
	        --掉落，八卦图
	        if random(1, 100) >= 50 then
	        	local nIndex = GetTask(TASK_BOSS_INDEX);
	        	AddItem(boss_drop_table[nIndex][1],boss_drop_table[nIndex][2],boss_drop_table[nIndex][3],1,1);
	        else
	        	AddItem(2, 0, 225, 2, 1);		--奖券
	        end;
	        --如果杀死的是西魔，则发公告
	        if GetTask(TASK_BOSS_INDEX) == 9 then
	        	AddGlobalNews(GetName().."Ho箃 ng cu鑙 tu莕 ch鑞g gi芻 th祅h c玭g gi誸 頲 T﹜ Ma");
	        end;
	        
	        SetTask(TASK_NPC_INDEX, 0);
	        SetTask(TASK_BOSS_INDEX, 0);
			--删除boss的rect触发器
			RemoveTrigger(GetTrigger(time_boss_table[2]))
			RemoveTrigger(GetTrigger(rect_boss_table[1][2]));
			RemoveTrigger(GetTrigger(log_boss_table[2]));
	    end;
	else
		for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if npcIndex == GetTask(TASK_NPC_INDEX) and npcIndex ~= 0 and nDist >= 0 and nDist <= 50 then
				--掉落，八卦图
				if random(1, 100) >= 50 then
		        	local nIndex = GetTask(TASK_BOSS_INDEX);
		        	AddItem(boss_drop_table[nIndex][1],boss_drop_table[nIndex][2],boss_drop_table[nIndex][3],1,1);
		        else
		        	AddItem(2, 0, 225, 2, 1);		--奖券
		        end;
				--如果杀死的是西魔，则发公告
		        if GetTask(TASK_BOSS_INDEX) == 9 then
		        	AddGlobalNews(GetName().."v? ng i trong ho箃 ng cu鑙 tu莕 ch鑞g gi芻 th祅h c玭g gi誸 頲 T﹜ Ma");
		        end;
		        SetTask(TASK_NPC_INDEX, 0);
		        SetTask(TASK_BOSS_INDEX, 0);
				--删除boss的rect触发器
				RemoveTrigger(GetTrigger(time_boss_table[2]))
				RemoveTrigger(GetTrigger(rect_boss_table[1][2]));
				RemoveTrigger(GetTrigger(log_boss_table[2]));
			end;
		end;
	end;
	PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
end;