-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ɳĮ�Թ�NPC����ͳ��Script
-- By StarryNight
-- 2007/08/07 AM 11:58

-- ��Ҫ�۸����ձ�����

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local nNpcIndex = 0;
local t=0;

	SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	
	if nMemCount == 0 then -- ���δ���
		nNpcIndex = CreateNpc("Hoan T��ng (C� D��ng Th�)","Tr�n M� Th�Hoan T��ng ",nMapId, nX, nY);
		SetNpcLifeTime(nNpcIndex,1800);
		SetNpcScript(nNpcIndex,"\\script\\������\\ɳĮ�Թ�\\npc\\���������.lua");
		TaskTip("Khi �� ti�u di�t �o �nh Th�ng l�nh t��ng binh m�, Hoan T��ng bi�n h�a th�nh Tr�n M� Th�!");
		Msg2Player("Khi �� ti�u di�t �o �nh Th�ng l�nh t��ng binh m�, Hoan T��ng bi�n h�a th�nh Tr�n M� Th�!");
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then	
				TaskTip("Khi �� ti�u di�t �o �nh Th�ng l�nh t��ng binh m�, Hoan T��ng bi�n h�a th�nh Tr�n M� Th�!");
				Msg2Player("Khi �� ti�u di�t �o �nh Th�ng l�nh t��ng binh m�, Hoan T��ng bi�n h�a th�nh Tr�n M� Th�!");
				if t == 0 then
					nNpcIndex = CreateNpc("Hoan T��ng (C� D��ng Th�)","Tr�n M� Th�Hoan T��ng ",nMapId, nX, nY);
					SetNpcLifeTime(nNpcIndex,1800);
					SetNpcScript(nNpcIndex,"\\script\\������\\ɳĮ�Թ�\\npc\\���������.lua");
					t=1;
				end
			end
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end
