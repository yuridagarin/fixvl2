-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 皇陵墓室一层NPC兵马俑统领Script
-- By StarryNight
-- 2007/06/29 AM 11:57

-- 且行且珍惜

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();

	SetNpcLifeTime(index,15);--使得尸体消失
	
	if nMemCount == 0 then -- 玩家未组队
		if GetTask(TASK_XB_ID_01) == 19 then
			AddItem(2,0,712,1,1);--打倒兵马俑统领得到摸金符
			SetTask(TASK_XB_ID_01,20);
			TaskTip("Nh薾 頲 M? Kim Ph?, tr? v? Ph鬾g Tng giao cho Li評 Tung V﹏  h醝 v? chuy謓 m? th蕋.");
			Msg2Player("Nh薾 頲 M? Kim Ph?, tr? v? Ph鬾g Tng giao cho Li評 Tung V﹏  h醝 v? chuy謓 m? th蕋.");
			GivePlayerAward("Award_XB_29","Easy");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_01) == 19 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				AddItem(2,0,712,1,1);--打倒兵马俑统领得到摸金符 
				SetTask(TASK_XB_ID_01,20);
				TaskTip("Nh薾 頲 M? Kim Ph?, tr? v? Ph鬾g Tng giao cho Li評 Tung V﹏  h醝 v? chuy謓 m? th蕋.");
				Msg2Player("Nh薾 頲 M? Kim Ph?, tr? v? Ph鬾g Tng giao cho Li評 Tung V﹏  h醝 v? chuy謓 m? th蕋.");
				GivePlayerAward("Award_XB_29","Easy");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
  end;
end
