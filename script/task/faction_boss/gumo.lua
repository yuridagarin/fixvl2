-- =============================================================
-- FileName : gumo.lua
-- Desc     : ��ī�Ľű����嶾������
-- Date     : Dec 20 2006
-- Creator  : Tony(Jizheng)
-- =============================================================

function OnDeath(nNpcIndex)

	-- �õ���ǰ��npc����
	local nMapID, nWx, nWy = GetWorldPos()
	local nAddX = 0
	local nAddY = 0
	local nTargetNpc = 0
	
	-- call����10�����ɢ�������
	for i = 1, 10 do
		nAddX = random(-15, 15)
		nAddY = random(-15, 15)
		
		nTargetNpc = CreateNpc("T�i cao th�", "T�i C� M�c", nMapID, nWx + nAddX, nWy + nAddY)
		SetNpcLifeTime(nTargetNpc, 300)
		SetNpcScript(nTargetNpc, "\\script\\task\\faction_boss\\boss_baoxiang_wudu.lua")
	end
	
	-- ��ʧ�Լ�
	SetNpcLifeTime(nNpcIndex, 0)
	SetNpcScript(nNpcIndex, "")
end;