-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����Ĺ��һ��NPCצ��Script
-- By StarryNight
-- 2007/06/29 PM 16:55

-- ��ƽ����һ�� (*^__^*) ��������

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
	"L�y ���c Ph� Phong Ch�y, ch� c�n d�ng La Canh t�m ra huy�t phong th�y th� c� th� d�ng ch�y �� m� c�nh c�a t�ng 2."
	}

	--SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	
	if nMemCount == 0 then -- ���δ���
		if GetTask(TASK_XB_ID_01) == 23 then
			AddItem(2,0,715,1,1);--��צ���õ��Ʒ��
			AddItem(2,0,716,1,1);--��צ���õ����ķ����ܺ�
			AddItem(2,0,717,1,1);--��צ���õ��ǳ�����
			TalkEx("",strTalk);
			SetTask(TASK_XB_ID_01,24);
			TaskTip("H�nh nh� c� tin t�c trong m�t h�m n�y mau m� ra xem.");
			Msg2Player("H�nh nh� c� tin t�c trong m�t h�m n�y mau m� ra xem.");
			GivePlayerAward("Award_XB_31","Easy");
		end;
		if GetTask(TASK_XB_ID_01) == 24 and GetItemCount(2,0,715) < 1 then
			AddItem(2,0,715,1,1);--��צ���õ��Ʒ��
		end
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_01) == 23 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				AddItem(2,0,715,1,1);--��צ���õ��Ʒ��
				AddItem(2,0,716,1,1);--��צ���õ����ķ����ܺ�
				AddItem(2,0,717,1,1);--��צ���õ��ǳ�����
				TalkEx("",strTalk); 
				SetTask(TASK_XB_ID_01,24);
				TaskTip("H�nh nh� c� tin t�c trong m�t h�m n�y mau m� ra xem.");
				Msg2Player("H�nh nh� c� tin t�c trong m�t h�m n�y mau m� ra xem.");
				GivePlayerAward("Award_XB_31","Easy");
			end;
			if GetTask(TASK_XB_ID_01) == 24 and GetItemCount(2,0,715) < 1 then
				AddItem(2,0,715,1,1);--��צ���õ��Ʒ��
			end
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end
