-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ɳĮ�Թ�NPC����Ѫħ��Script
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
		nNpcIndex = CreateNpc("Hoan T��ng (Qu� T��ng ��u)","Qu� T��ng ��uHoan T��ng ",nMapId, nX, nY);
		SetNpcLifeTime(nNpcIndex,1800);
		SetNpcScript(nNpcIndex,"\\script\\������\\ɳĮ�Թ�\\npc\\�������.lua");
		TaskTip("Khi �� ti�u di�t �o �nh Huy�t Ma Nh�n, Hoan T��ng h�a th�nh Qu� T��ng ��u! ");
		Msg2Player("Khi �� ti�u di�t �o �nh Huy�t Ma Nh�n, Hoan T��ng h�a th�nh Qu� T��ng ��u! ");
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then	
				TaskTip("Khi �� ti�u di�t �o �nh Huy�t Ma Nh�n, Hoan T��ng h�a th�nh Qu� T��ng ��u! ");
				Msg2Player("Khi �� ti�u di�t �o �nh Huy�t Ma Nh�n, Hoan T��ng h�a th�nh Qu� T��ng ��u! ");
				if t == 0 then
					nNpcIndex = CreateNpc("Hoan T��ng (Qu� T��ng ��u)","Qu� T��ng ��uHoan T��ng ",nMapId, nX, nY);
					SetNpcLifeTime(nNpcIndex,1800);
					SetNpcScript(nNpcIndex,"\\script\\������\\ɳĮ�Թ�\\npc\\�������.lua");
					t=1;
				end
			end
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end
