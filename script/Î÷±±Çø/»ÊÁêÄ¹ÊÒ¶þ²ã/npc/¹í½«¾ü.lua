-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����Ĺ�Ҷ���NPC����Script
-- By StarryNight
-- 2007/08/03 PM 08:15

-- ���Ĺͬ�ߡ���

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
	"Ch�ng l� ��y l� M�c ��u Ki�m? Ng�c b�i n�y l� g�? Sao kh�ng th�y m�t �� Thi�n H� X� T�c? Tr�o V��ng �� ��n t�i, kh�ng ai c�a Nh�t Ph�m ���ng v�o t�ng 2. Nh�ng v�t n�y nh�t ��nh c� li�n quan t�i v� c�a T� M� ti�n b�i, t�t nh�t n�n h�i �ng ta tr��c."
	};

	SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	
	if nMemCount == 0 then -- ���δ���
		if GetTask(TASK_XB_ID_01) == 27 then
			DelItem(2,0,717,1);--ɾȥ�ǳ�����
			AddItem(2,0,718,1,1);--���ī��
			AddItem(2,0,719,1,1);--�������
			TalkEx("",strTalk);
			SetTask(TASK_XB_ID_01,28);
			SetTask(CREAT_GUIJIANGJUN_TIME,0);--�������ˢ��ʱ�����
			TaskTip("Mang cho T� M� Minh Phong nh�ng v�t c� trong b�o r��ng.");
			Msg2Player("Mang cho T� M� Minh Phong nh�ng v�t c� trong b�o r��ng.");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_01) == 27 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				DelItem(2,0,717,1);--ɾȥ�ǳ�����
				AddItem(2,0,718,1,1);--���ī��
				AddItem(2,0,719,1,1);--�������
				TalkEx("",strTalk); 
				SetTask(TASK_XB_ID_01,28);
				SetTask(CREAT_GUIJIANGJUN_TIME,0);--�������ˢ��ʱ�����
				TaskTip("Mang cho T� M� Minh Phong nh�ng v�t c� trong b�o r��ng.");
				Msg2Player("Mang cho T� M� Minh Phong nh�ng v�t c� trong b�o r��ng.");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end
