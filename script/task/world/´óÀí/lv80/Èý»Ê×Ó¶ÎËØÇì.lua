-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理任务NPC大理三皇子，龙象法僧召唤和死亡Script
-- By StarryNight
-- 2006/01/13 PM 21:07

--乙酉年  戊子月 己丑日 

-- ======================================================
-- 引用剧情任务文件
Include("\\script\\task\\world\\大理\\task_head.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

local nMapID,nWx,nWy = GetWorldPos();

	if nMapID == 411 then
		local n3HZIndex = CreateNpc("Tam Ho祅g T? Чi L?","Tam Ho祅g T? 祅 T? Kh竛h",nMapID,nWx,nWy,-1,1,1,70);
		local nFS1Index = CreateNpc("Long Tng Ph竝 T╪g","Long Tng Ph竝 T╪g",nMapID,nWx,nWy,-1,1,1,70);
		local nFS2Index = CreateNpc("Long Tng Ph竝 T╪g","Long H? ph竝 t╪g",nMapID,nWx,nWy,-1,1,1,70);
		SetNpcLifeTime(n3HZIndex,1200);
		SetNpcLifeTime(nFS1Index,1200);
		SetNpcLifeTime(nFS2Index,1200);
		SetNpcScript(n3HZIndex,"\\script\\task\\world\\大理\\Lv80\\三皇子段素庆.lua");
		SetNpcScript(nFS1Index,"\\script\\task\\world\\大理\\Lv80\\龙象法僧.lua");
		SetNpcScript(nFS2Index,"\\script\\task\\world\\大理\\Lv80\\龙象法僧.lua");
		ChangeNpcToFight(n3HZIndex);
		ChangeNpcToFight(nFS1Index);
		ChangeNpcToFight(nFS2Index);
		TaskTip("Tam Ho祅g T?  xu蕋 hi謓, mau b総 l筰!");
		Msg2Player("Tam Ho祅g T?  xu蕋 hi謓, mau b総 l筰!");
		DelItem(2,0,384,1);--删掉召唤物件
		return
	else
		local strTalk = {
			"? y kh玭g th? d飊g ph竜!"
		};
		TalkEx("",strTalk);
		end;
	return
end;

function OnDeath(index)
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();
		
		SetNpcLifeTime(index,15);--使得尸体消失
		
    if nMemCount == 0 then -- 玩家未组队
        if GetTask(TASK_DL_LV80_ID) == 8 then
        	SetTask(TASK_DL_LV80_ID, 9);
        	Msg2Player("Х nh b筰 Tam Ho祅g T?, quay v? Чi L? h錳 b竜 фng Qu鑓 S?.");
        	TaskTip("Х nh b筰 Tam Ho祅g T?, quay v? Чi L? h錳 b竜 фng Qu鑓 S?.");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV80_ID) == 8 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV80_ID, 9);
           	Msg2Player("Х nh b筰 Tam Ho祅g T?, quay v? Чi L? h錳 b竜 фng Qu鑓 S?.");
           	TaskTip("Х nh b筰 Tam Ho祅g T?, quay v? Чi L? h錳 b竜 фng Qu鑓 S?.");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
    end;
end