--npc姚立诚脚本
--created by lizhi
--2005-8-24 15:25

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_泉州\\task_head.lua")
Include("\\script\\task\\world\\lizhi_泉州\\12级\\task_main.lua");

function OnDeath()
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- 玩家未组队
        if GetTask(TASK_LEV_10_ID) == 2 then
        	SetTask(TASK_LEV_10_ID, 3);
        	Msg2Player("Tr? s? s竎h cho Vng Nghi謕 V?");
        	TaskTip("Tr? s? s竎h cho Vng Nghi謕 V?");
        	AddItem(2, 0, 32, 1);
        end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if GetTask(TASK_LEV_10_ID) == 2 and nDist >= 0 and nDist <= 50 then
            	SetTask(TASK_LEV_10_ID, 3);
            	Msg2Player("Tr? s? s竎h cho Vng Nghi謕 V?");
            	TaskTip("Tr? s? s竎h cho Vng Nghi謕 V?");
            	AddItem(2, 0, 32, 1);
            end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
    end;
end;
