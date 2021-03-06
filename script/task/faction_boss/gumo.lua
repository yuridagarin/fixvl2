-- =============================================================
-- FileName : gumo.lua
-- Desc     : 古墨的脚本，五毒掉箱子
-- Date     : Dec 20 2006
-- Creator  : Tony(Jizheng)
-- =============================================================

function OnDeath(nNpcIndex)

	-- 得到当前的npc坐标
	local nMapID, nWx, nWy = GetWorldPos()
	local nAddX = 0
	local nAddY = 0
	local nTargetNpc = 0
	
	-- call出来10个随机散落的箱子
	for i = 1, 10 do
		nAddX = random(-15, 15)
		nAddY = random(-15, 15)
		
		nTargetNpc = CreateNpc("T骾 cao th?", "T骾 C? M芻", nMapID, nWx + nAddX, nWy + nAddY)
		SetNpcLifeTime(nTargetNpc, 300)
		SetNpcScript(nTargetNpc, "\\script\\task\\faction_boss\\boss_baoxiang_wudu.lua")
	end
	
	-- 消失自己
	SetNpcLifeTime(nNpcIndex, 0)
	SetNpcScript(nNpcIndex, "")
end;