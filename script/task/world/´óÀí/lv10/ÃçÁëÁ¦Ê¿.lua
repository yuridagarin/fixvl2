-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������NPCѪ�۶����ٻ�������Script
-- By StarryNight
-- 2006/01/09 PM 14:40

--������  ������ ������ 
--��: �ɲ� ���� ��Ȣ ���� �� ���� ���� ���� ������ ���� ��ҽ �β� ��� ��ж ��� ���� ���� ���� ɨ�� ���� ���� ����� 
--��: ի�� ���� �� ��ɥ ���� 
--��������: ���� ���� ���� ���� ���� �ջ� ����  
--�����˼�: ���� ��ɥ  
--ÿ��̥��ռ��: ռ�Ų������� 
--����: ������  ��ִλ 
--��: ����(��δ)ɷ�� 
--����ټ�: ������ȯ���Ȳ��� �󲻹ڴ��������� 

-- ======================================================
-- ���þ��������ļ�
Include("\\script\\task\\world\\����\\task_head.lua");
Include("\\script\\task\\world\\����\\lv10\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

local nMapID,nWx,nWy = GetWorldPos();

	if nMapID == 420 and GetTask(TASK_DL_LV45_ID) == 2 then
		local nLSIndex = CreateNpc("Mi�u L�nh L�c S�","Mi�u L�nh L�c S�",nMapID,nWx,nWy,-1,1,1,50);
		SetNpcLifeTime(nLSIndex,900); 
		SetNpcScript(nLSIndex,"\\script\\task\\world\\����\\Lv10\\������ʿ.lua");
		ChangeNpcToFight(nLSIndex);
		TaskTip("B�n �� g�i ���c s� gi� Mi�u L�nh, mau gi�t h�n.");
		Msg2Player("B�n �� g�i ���c s� gi� Mi�u L�nh, mau gi�t h�n.");
		DelItem(2,0,367,1);--ɾȥ��ʿ����
		return
	else
		local strTalk = {
			"Ph�i ��n Y�n T� ��ng t�ng 1 m�i d�ng ���c T�n ti�u n�y g�i Mi�u L�nh L�c S�"
		};
		TalkEx("",strTalk);
	end;
end;

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();

	SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	
	if nMemCount == 0 then -- ���δ���
		if GetTask(TASK_DL_LV45_ID) == 2 then
			AddItem(2,0,369,1);--��������ʿ�õ�һ����
			SetTask(TASK_DL_LV45_ID,3);
			TaskTip("�em th� v� cho Tr�nh Qu�n Chi");
			Msg2Player("�em th� v� cho Tr�nh Qu�n Chi");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_DL_LV45_ID) == 2 then
				AddItem(2,0,369,1);--��������ʿ�õ�һ���� 
				SetTask(TASK_DL_LV45_ID,3);
				TaskTip("�em th� v� cho Tr�nh Qu�n Chi");
				Msg2Player("�em th� v� cho Tr�nh Qu�n Chi");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end
