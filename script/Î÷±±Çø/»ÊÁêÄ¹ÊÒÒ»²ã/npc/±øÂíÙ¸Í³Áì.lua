-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����Ĺ��һ��NPC����ٸͳ��Script
-- By StarryNight
-- 2007/06/29 AM 11:57

-- ��������ϧ

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();

	SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	
	if nMemCount == 0 then -- ���δ���
		if GetTask(TASK_XB_ID_01) == 19 then
			AddItem(2,0,712,1,1);--�򵹱���ٸͳ��õ������
			SetTask(TASK_XB_ID_01,20);
			TaskTip("Nh�n ���c M� Kim Ph�, tr� v� Ph�ng T��ng giao cho Li�u Tung V�n �� h�i v� chuy�n m� th�t.");
			Msg2Player("Nh�n ���c M� Kim Ph�, tr� v� Ph�ng T��ng giao cho Li�u Tung V�n �� h�i v� chuy�n m� th�t.");
			GivePlayerAward("Award_XB_29","Easy");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_01) == 19 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				AddItem(2,0,712,1,1);--�򵹱���ٸͳ��õ������ 
				SetTask(TASK_XB_ID_01,20);
				TaskTip("Nh�n ���c M� Kim Ph�, tr� v� Ph�ng T��ng giao cho Li�u Tung V�n �� h�i v� chuy�n m� th�t.");
				Msg2Player("Nh�n ���c M� Kim Ph�, tr� v� Ph�ng T��ng giao cho Li�u Tung V�n �� h�i v� chuy�n m� th�t.");
				GivePlayerAward("Award_XB_29","Easy");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end
