-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����Ĺ��һ��NPC��Ĺ��Script
-- By StarryNight
-- 2007/08/03 PM 04:16

-- ǧ�����������ֻΪ����������˺����

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
	"M�t �m thanh l�n vang l�n, l�i v�o t�ng 2 �� m�, mau ch�ng v�o l�y b�o r��ng d�a theo ch� d�n c�a m�t h�m T�y H� Ph�p v��ng."
	}

	SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	
	if nMemCount == 0 then -- ���δ���
		if GetTask(TASK_XB_ID_01) == 25 then
			TalkEx("",strTalk);
			SetTask(TASK_XB_ID_01,26);
			SetTask(CREAT_ZHENMUSHOU_TIME,0);--�����Ĺ��ˢ��ʱ�����
			TaskTip("Mau v�o l�y b�o r��ng d�a theo ch� d�n c�a m�t h�m T�y H� Ph�p v��ng.");
			Msg2Player("Mau v�o l�y b�o r��ng d�a theo ch� d�n c�a m�t h�m T�y H� Ph�p v��ng.");
			GivePlayerAward("Award_XB_32","Easy");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_01) == 25 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				TalkEx("",strTalk); 
				SetTask(TASK_XB_ID_01,26);
				SetTask(CREAT_ZHENMUSHOU_TIME,0);--�����Ĺ��ˢ��ʱ�����
				TaskTip("Mau v�o l�y b�o r��ng d�a theo ch� d�n c�a m�t h�m T�y H� Ph�p v��ng.");
				Msg2Player("Mau v�o l�y b�o r��ng d�a theo ch� d�n c�a m�t h�m T�y H� Ph�p v��ng.");
				GivePlayerAward("Award_XB_32","Easy");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end
