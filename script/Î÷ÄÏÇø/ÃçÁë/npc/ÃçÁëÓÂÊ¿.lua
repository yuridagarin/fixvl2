-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理任务NPC苗岭勇士Script
-- By StarryNight
-- 2006/01/04 PM 17:46

--乙酉年 戊子月 癸已日 
--宜: 祭祀 塑绘 开光 裁衣 冠笄 嫁娶 纳采 拆卸 修造 动土 竖柱 上梁 安床 移徙 入宅 安香 结网 捕捉 畋猎 伐木 进人口 放水 
--忌: 出行 安葬 修坟 开市 
--吉神宜趋: 五富 益後  
--凶神宜忌: 劫煞 小耗 复日 重日 元武  
--每日胎神占方: 占房床房内北 
--五行: 长流水 执执位 
--冲: 冲猪(丁亥)煞东 
--彭祖百忌: 癸不词讼理弱敌强 已不远行财物伏藏 

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\大理\\task_head.lua")

function OnDeath()
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- 玩家未组队
        if GetTask(TASK_DL_LV40_ID) == 3 then
        	SetTask(TASK_DL_LV40_ID, 4);
        	Msg2Player("Х nh b筰 Mi猽 L躰h D騨g S?, quay v? g苝 T閏 trng Mi猽 L躰h");
        	TaskTip("Х nh b筰 Mi猽 L躰h D騨g S?, quay v? g苝 T閏 trng Mi猽 L躰h");
        end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if GetTask(TASK_DL_LV40_ID) == 3 and nDist >= 0 and nDist <= 50 then
            	SetTask(TASK_DL_LV40_ID, 4);
        			Msg2Player("Х nh b筰 Mi猽 L躰h D騨g S?, quay v? g苝 T閏 trng Mi猽 L躰h");
        			TaskTip("Х nh b筰 Mi猽 L躰h D騨g S?, quay v? g苝 T閏 trng Mi猽 L躰h");
            end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
    end;
end;