-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����������NPC������Script
-- By StarryNight
-- 2007/08/08 AM 0:46

-- ��һ���˾Ͳ�Ҫ�˺���

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local strTalk = {
	"(1 �nh h�ng quang l�e l�n c�ng v�i ti�ng r�t ch�i tai)",
	"Ng��i ch�i: ??!? (�nh h�o quang v� ti�ng r�t l�c n�y l� sao? Hay n�n �i h�i Di�p T� Thu.)",
	}

	SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	
	if nMemCount == 0 then -- ���δ���
		if GetTask(TASK_XB_ID_02) == 17 then
			DelItem(2,0,704,1);--������
			AddItem(2,0,705,1,1);--Ѫ�꾧��
			TalkEx("",strTalk);
			SetTask(TASK_XB_ID_02,18);
			SetTask(CREAT_GUYANGSHOU_TIME,0);--������ˢ��ʱ������
			TaskTip("�� ��nh b�i C� D��ng Th� , tr� v� C�n L�n g�p Di�p T� Thu. ");
			Msg2Player("�� ��nh b�i C� D��ng Th� , tr� v� C�n L�n g�p Di�p T� Thu. ");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_02) == 17 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				DelItem(2,0,704,1);--������
				AddItem(2,0,705,1,1);--Ѫ�꾧��
				TalkEx("",strTalk);
				SetTask(TASK_XB_ID_02,18);
				SetTask(CREAT_GUYANGSHOU_TIME,0);--������ˢ��ʱ������
				TaskTip("�� ��nh b�i C� D��ng Th� , tr� v� C�n L�n g�p Di�p T� Thu. ");
				Msg2Player("�� ��nh b�i C� D��ng Th� , tr� v� C�n L�n g�p Di�p T� Thu. ");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end
