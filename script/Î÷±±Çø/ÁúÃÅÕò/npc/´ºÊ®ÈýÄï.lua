-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������NPC��ʮ��������Script
-- By StarryNight
-- 2007/06/7 PM 5:00

--�మ���� 

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
	"Xin c� n��ng cho m��n v�t t�y th�n �� c�u ng��i, �a t�.",
	"Ng��i c�u ai li�n quan g� ��n ta? Ng��i d�a v�o g� �� m��n �� ta ch�? ��i ��y ng��i d�m v� l� v�i b� �.",
	"Xin ��c t�i v�i c� n��ng.",
	}

	--SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	
	if nMemCount == 0 then -- ���δ���
		if GetTask(TASK_XB_ID) == 12 then
			AddItem(2,0,690,1,1);--�򵹴�ʮ����õ�һ���Ƕ�
			TalkEx("",strTalk);
			SetTask(TASK_XB_ID,13);
			TaskTip("Mau �em y�m giao cho T�n Nh� Li�m �� gi�i n�i s�u t��ng t�.");
			Msg2Player("Mau �em y�m giao cho T�n Nh� Li�m �� gi�i n�i s�u t��ng t�.");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID) == 12 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				AddItem(2,0,690,1,1);--�򵹴�ʮ����õ�һ���Ƕ�
				TalkEx("",strTalk); 
				SetTask(TASK_XB_ID,13);
				TaskTip("Mau �em y�m giao cho T�n Nh� Li�m �� gi�i n�i s�u t��ng t�.");
				Msg2Player("Mau �em y�m giao cho T�n Nh� Li�m �� gi�i n�i s�u t��ng t�.");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end
