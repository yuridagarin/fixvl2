-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ҩ����NPC���ķ���Script
-- By StarryNight
-- 2007/08/07 PM 05:51

-- �Ҳ��ǽ��ַ���������Ҫ�ϴ��ˣ�

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
	"Xem ra Ph�p kh� n�y l� v�t Di�p T� Thu nh�c ��n c� th� khi�n cho Nguy�n h�nh �o �nh_Th�n hi�n nguy�n h�nh, mau ��n M� cung sa m�c t�m B�ch Thi�n Th�nh �� bi�t n�i �o �nh."
	}

	--SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	
	if nMemCount == 0 then -- ���δ���
		if GetTask(TASK_XB_ID_01) == 63 then
			AddItem(2,0,733,1,1);--������
			TalkEx("",strTalk);
			SetTask(TASK_XB_ID_01,64);
			TaskTip("L�y ���c ph�p kh� �o �nh, h�y ��n M� cung sa m�c nh� B�ch Thi�n Th�nh t�m �o �nh.");
			Msg2Player("L�y ���c ph�p kh� �o �nh, h�y ��n M� cung sa m�c nh� B�ch Thi�n Th�nh t�m �o �nh.");
			GivePlayerAward("Award_XB_53","Easy");
			return
		end
		if GetTask(TASK_XB_ID_01) >= 64 and GetTask(TASK_XB_ID_01) <= 66 then --��û��ܻ���ǰ���������
			if GetItemCount(2,0,733) == 0 then
				AddItem(2,0,733,1,1);--������
				return
			end
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
      if GetTask(TASK_XB_ID_01) >= 64 and GetTask(TASK_XB_ID_01) <= 66 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then --��û��ܻ���ǰ���������
				if GetItemCount(2,0,733) == 0 then
				AddItem(2,0,733,1,1);--������
				return
			end
			end;
			if GetTask(TASK_XB_ID_01) == 63 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				AddItem(2,0,733,1,1);--������
				TalkEx("",strTalk);
				SetTask(TASK_XB_ID_01,64);
				TaskTip("L�y ���c ph�p kh� �o �nh, h�y ��n M� cung sa m�c nh� B�ch Thi�n Th�nh t�m �o �nh.");
				Msg2Player("L�y ���c ph�p kh� �o �nh, h�y ��n M� cung sa m�c nh� B�ch Thi�n Th�nh t�m �o �nh.");
				GivePlayerAward("Award_XB_53","Easy");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end
