-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ɳĮ�Թ�NPC�������Script
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
		nNpcIndex = CreateNpc("Nguy�n h�nh Hoan T��ng","Nguy�n h�nh Hoan T��ng",nMapId, nX, nY);
		SetNpcLifeTime(nNpcIndex,1800);
		SetNpcScript(nNpcIndex,"\\script\\������\\ɳĮ�Թ�\\npc\\����ԭ��.lua");
		TaskTip("Ti�u di�t �o �nh Qu� T��ng ��u, nguy�n h�nh c�a Hoan T��ng-Con trai xu�t hi�n!!");
		Msg2Player("Ti�u di�t �o �nh Qu� T��ng ��u, nguy�n h�nh c�a Hoan T��ng-Con trai xu�t hi�n!!");
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
      if nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				TaskTip("Ti�u di�t �o �nh Qu� T��ng ��u, nguy�n h�nh c�a Hoan T��ng-Con trai xu�t hi�n!!");
				Msg2Player("Ti�u di�t �o �nh Qu� T��ng ��u, nguy�n h�nh c�a Hoan T��ng-Con trai xu�t hi�n!!");
				if t == 0 then
					nNpcIndex = CreateNpc("Nguy�n h�nh Hoan T��ng","Nguy�n h�nh Hoan T��ng",nMapId, nX, nY);
					SetNpcLifeTime(nNpcIndex,1800);
					SetNpcScript(nNpcIndex,"\\script\\������\\ɳĮ�Թ�\\npc\\����ԭ��.lua");
					t=1;
				end
			end
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end
