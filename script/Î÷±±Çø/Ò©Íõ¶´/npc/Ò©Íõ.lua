-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ҩ����NPCҩ��Script
-- By StarryNight
-- 2007/08/06 PM 9:26

-- ��ʵҩ��ֻ������С��Ϸ���ѣ�������Ϸ����׳��ҩ��

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
	"Ta �� chu�n b� cho ng��i 100 d��c nh�n. D��c Nh�n d��c ph��ng nghi�p �� ph�i th�nh, ��u d�ng nguy�n li�u D��c Nh�n Th�o trong d��c v��ng ��ng.",
	"Kh�ng hay r�i, T�y H� mu�n t�o ra ��i qu�n D��c Nh�n, gi� ph��ng thu�c �� n�m trong tay ta, ph�i v� g�p �u D��ng ti�n b�i.",
	}

	SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	
	if nMemCount == 0 then -- ���δ���
		if GetTask(TASK_XB_ID_01) == 47 then
			SetTask(CREAT_YAOWANG_TIME,0);--ˢ��ҩ��ʱ������
			AddItem(2,0,726,1,1);--��ҩ���õ�ҩ��ҩ��
			AddItem(2,0,727,1,1);--���ķ����麯
			DelItem(2,0,760,1);--ɾȥҩ������װ
			TalkEx("",strTalk);
			SetTask(TASK_XB_ID_01,48);
			TaskTip("H�i b�o �u D��ng H�a, T�y H� C�c t�m ph��ng thu�c D��c V��ng t�o ra ��i qu�n D��c Nh�n, vi�c n�y v� c�ng c�p b�ch.");
			Msg2Player("H�i b�o �u D��ng H�a, T�y H� C�c t�m ph��ng thu�c D��c V��ng t�o ra ��i qu�n D��c Nh�n, vi�c n�y v� c�ng c�p b�ch.");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_01) == 47 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				SetTask(CREAT_YAOWANG_TIME,0);--ˢ��ҩ��ʱ������
				AddItem(2,0,726,1,1);--��ҩ���õ�ҩ��ҩ��
				AddItem(2,0,727,1,1);--���ķ����麯
				TalkEx("",strTalk); 
				SetTask(TASK_XB_ID_01,48);
				TaskTip("H�i b�o �u D��ng H�a, T�y H� C�c t�m ph��ng thu�c D��c V��ng t�o ra ��i qu�n D��c Nh�n, vi�c n�y v� c�ng c�p b�ch.");
				Msg2Player("H�i b�o �u D��ng H�a, T�y H� C�c t�m ph��ng thu�c D��c V��ng t�o ra ��i qu�n D��c Nh�n, vi�c n�y v� c�ng c�p b�ch.");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end
