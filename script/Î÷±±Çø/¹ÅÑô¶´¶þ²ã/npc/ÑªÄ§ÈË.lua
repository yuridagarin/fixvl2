-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������NPCѪħ���ٻ�������Script
-- By StarryNight
-- 2007/08/08 AM 10:31

-- ======================================================
-- ���þ��������ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

local nMapID,nWx,nWy = GetWorldPos();
local nTime = GetTime() - GetTask(CREAT_XUEMOREN_TIME);
local strTalk = {};

	if nMapID == 512 and GetFightState() == 1 then
		if GetTask(TASK_XB_ID_02) == 19 then
			if nTime >= 1800 then
				local nYHIndex = CreateNpc("Huy�t Ma Nh�n","Huy�t Ma Nh�n",nMapID,nWx,nWy,-1,1,1,50);
				SetNpcLifeTime(nYHIndex,900); 
				SetNpcScript(nYHIndex,"\\script\\������\\����������\\npc\\Ѫħ��.lua");
				TaskTip("B�n �� tri�u g�i Huy�t Ma Nh�n h�y ti�u di�t n�.");
				Msg2Player("B�n �� tri�u g�i Huy�t Ma Nh�n h�y ti�u di�t n�.");
				DelItem(2,0,706,1);--����ذ��
				SetTask(CREAT_XUEMOREN_TIME,GetTime());
				return
			else
				strTalk = {
					"Sau m�i l�n tri�u g�i Huy�t Ma Nh�n ch� 30 ph�t m�i ���c l�p l�i."
				};
				TalkEx("",strTalk);
			end
		else
			strTalk = {
				"Xem ra con dao n�y kh�ng c�n t�c d�ng r�i chi b�ng v�t �i. ",
				}	
			TalkEx("",strTalk);
			DelItem(2,0,706,1);--����ذ��
			return
		end
	elseif GetTask(TASK_XB_ID_02) == 19 then
		strTalk = {
			"Theo l�i c�a Di�p T� Thu th� con dao n�y ph�i h�p v�i Huy�t H�n Tinh Ph�ch trong C� D��ng ��ng_2 m�i c� th� tri�u g�i Ma v�t trong b�ng C� D��ng Th�."
			};
			TalkEx("",strTalk);
	else
		strTalk = {
				"Xem ra con dao n�y kh�ng c�n t�c d�ng r�i chi b�ng v�t �i. ",
				}	
		TalkEx("",strTalk);
		DelItem(2,0,706,1);--����ذ��
	end
end;

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
		
	SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	
	if nMemCount == 0 then -- ���δ���
		if GetTask(TASK_XB_ID_02) == 19 then
			DelItem(2,0,705,1);--Ѫ�꾧��
			AddItem(2,0,707,1,1);--�������
			SetTask(TASK_XB_ID_02,20);
			SetTask(CREAT_YUANHUNZHIWANG_TIME,0);--���ʱ���¼
			TaskTip("�� ti�u di�t Huy�t Ma Nh�n, v� C�n L�n b�o cho Di�p T� Thu.");
			Msg2Player("�� ti�u di�t Huy�t Ma Nh�n, v� C�n L�n b�o cho Di�p T� Thu.");
		end;	
  else
    for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
      if GetTask(TASK_XB_ID_02) == 19 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				DelItem(2,0,705,1);--Ѫ�꾧��
				AddItem(2,0,707,1,1);--�������
				SetTask(TASK_XB_ID_02,20);
				SetTask(CREAT_YUANHUNZHIWANG_TIME,0);--���ʱ���¼
				TaskTip("�� ti�u di�t Huy�t Ma Nh�n, v� C�n L�n b�o cho Di�p T� Thu.");
				Msg2Player("�� ti�u di�t Huy�t Ma Nh�n, v� C�n L�n b�o cho Di�p T� Thu.");
      end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end