-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������NPCѪ�۶����ٻ�������Script
-- By StarryNight
-- 2005/12/31 PM 14:30

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
Include("\\script\\task\\world\\����\\lv20\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

local nMapID,nWx,nWy = GetWorldPos();
local nTime = GetTime() - GetTask(1321);

	if nMapID == 407 and GetFightState() == 1 then
		if GetTask(TASK_DL_LV20_ID) == 3 then
			if nTime >= 3600 then
				local nDMIndex = CreateNpc("Huy�t L�n ��c M�ng","Huy�t L�n ��c M�ng",nMapID,nWx,nWy,-1,1,1,50);
				SetNpcLifeTime(nDMIndex,900); 
				SetNpcScript(nDMIndex,"\\script\\task\\world\\����\\Lv20\\Ѫ�۶���.lua");
				ChangeNpcToFight(nDMIndex);
				TaskTip("B�n �� g�i ���c ��c m�ng, mau gi�t ch�ng.");
				Msg2Player("B�n �� g�i ���c ��c m�ng, mau gi�t ch�ng.");
				DelItem(2,0,365,1);--ҩѪ
				SetTask(1321,GetTime());
				return
			else
				local strTalk = {
					"M�i l�n g�i ��c m�ng, c�ch m�t gi� sau m�i c� th� g�i l�i."
				};
				TalkEx("",strTalk);
			end
		else	
			return
		end
	else
		local strTalk = {
			"� ��y kh�ng th� g�i Huy�t L�n ��c M�ng!"
		};
		TalkEx("",strTalk);
		end;
	return
end;

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
		
	SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	
	if nMemCount == 0 then -- ���δ���
		if GetTask(TASK_DL_LV20_ID) == 3 then
			SetTask(TASK_DL_LV20_ID,4);
			TaskTip("Di�t ���c Huy�t L�n ��c m�ng, quay v� g�p Cao Th�ng Tuy�n.");
			Msg2Player("Di�t ���c Huy�t L�n ��c m�ng, quay v� g�p Cao Th�ng Tuy�n.");
		end;	
  else
    for i=1,nMemCount do
       PlayerIndex = GetTeamMember(i);
       local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
       local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
       if GetTask(TASK_DL_LV20_ID) == 3 and nDist >= 0 and nDist <= 50 then
       	SetTask(TASK_DL_LV20_ID, 4);
       	Msg2Player("Di�t ���c Huy�t L�n ��c m�ng, quay v� g�p Cao Th�ng Tuy�n.");
       	TaskTip("Di�t ���c Huy�t L�n ��c m�ng, quay v� g�p Cao Th�ng Tuy�n.");
       end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end