-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ������һ��NPC�ǳ�����Script
-- By StarryNight
-- 2007/06/21 PM 3:27

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
	"C� 1 b�c \'M�t th� T�y H�\', xem th� n�i dung gׅ",
	"M�t th� T�y H�: C�n 3 ng�y n�a l� ng��i s� thu ph�c ���c C� D��ng d� th�, l�c �� T�y H� s� gi�p ng��i ph�n c�ng C�n L�n, n�u ng��i c� ���c ch�c tr��ng m�n C�n L�n, T�y H� ch� l�y ph��ng ph�p luy�n Tr��ng Sinh B�t L�o ��n, th� n�y l�m ch�ng, g�i Phi Th��ng ��o Nh�n.",
	"Kh�ng ng� Phi Th��ng ��o Nh�n l�i c� quan h� v�i Nh�t Ph�m ���ng, �em M�nh H�a Luy�n Kim ��n v� giao cho Di�p T� Thu c� l� s� hi�u ���c n�i t�nh."
	}

	--SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	
	if nMemCount == 0 then -- ���δ���
		if GetTask(TASK_XB_ID_02) == 14 then
			AddItem(2,0,700,1,1);--�򵹷ǳ����˵õ���������Ƭ
			AddItem(2,0,701,1,1);--�򵹷ǳ����˵õ���������
			TalkEx("",strTalk);
			SetTask(TASK_XB_ID_02,15);
			TaskTip("�� ��nh b�i Phi Th��ng ��o Nh�n, tr� v� C�n L�n t�m Di�p T� Thu.");
			Msg2Player("�� ��nh b�i Phi Th��ng ��o Nh�n, tr� v� C�n L�n t�m Di�p T� Thu.");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_02) == 14 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				AddItem(2,0,700,1,1);--�򵹷ǳ����˵õ���������Ƭ
				AddItem(2,0,701,1,1);--�򵹷ǳ����˵õ���������
				TalkEx("",strTalk); 
				SetTask(TASK_XB_ID_02,15);
				TaskTip("�� ��nh b�i Phi Th��ng ��o Nh�n, tr� v� C�n L�n t�m Di�p T� Thu.");
				Msg2Player("�� ��nh b�i Phi Th��ng ��o Nh�n, tr� v� C�n L�n t�m Di�p T� Thu.");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end
