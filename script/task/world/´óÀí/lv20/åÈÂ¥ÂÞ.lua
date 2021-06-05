-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������NPC��¥���ٻ�������Script
-- By StarryNight
-- 2006/01/10 PM 14:23

-- �����������ˣ���ʵ���Ŀ���Ҳ�ǳ�ʹ�࡭��

-- ======================================================
-- ���þ��������ļ�
Include("\\script\\task\\world\\����\\task_head.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

local nMapID,nWx,nWy = GetWorldPos();
	
	--��Ҫ�ڷ��۶�һ������ʹ��		
	if nMapID == 414 or nMapID == 415 then
		local nTime = GetTask(TASK_DL_LV55_TIME);
		nTime = 30*60 - (GetTime() - nTime);--����ʱ��Ϊ20���Ӽ�ȥ��·����ʱ��
		
		if nTime <= 0 then
			Say("Ph�ng Ho�ng linh �� m�t hi�u l�c, quay l�i M�c Tam nh�n c�i m�i.",0);
			DelItem(2,0,373,1);
			if GetTrigger(TALK_DL_MOSAN) == 0 then
				CreateTrigger(4,201,TALK_DL_MOSAN);
			end;
			RemoveTrigger(GetTrigger(TIME_DL_PHENIX));--ɾ����ʱ��
			return
		end
		
		if GetTask(TASK_DL_LV55_ID) == 3 then
			local nJLLIndex = CreateNpc("Ph�ng Ho�ng","Ph�ng Ho�ng",nMapID,nWx,nWy,-1,1,1,50);
			SetNpcLifeTime(nJLLIndex,nTime); 
			SetNpcScript(nJLLIndex,"\\script\\task\\world\\����\\Lv20\\��¥��.lua");
			ChangeNpcToFight(nJLLIndex);
			TaskTip("B�n �� g�i ���c Ph�ng Ho�ng! H�y mau ti�u di�t!");
			Msg2Player("B�n �� g�i ���c Ph�ng Ho�ng! H�y mau ti�u di�t!");
			DelItem(2,0,373,1);
			return
		else
			return
		end
	else
		local strTalk = {
			"N�i ��y kh�ng th� s� d�ng Ph�ng Ho�ng linh."
		};
		TalkEx("",strTalk);
	end;
end;

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();

	SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ

	if GetTask(TASK_DL_LV55_ID) == 3 then
		SetTask(TASK_DL_LV55_ID,4);
		RemoveTrigger(GetTrigger(TIME_DL_PHENIX));--ɾȥ��ʱ��
		RemoveTrigger(GetTrigger(TALK_DL_MOSAN));--ɾȥĪ���Ի�������
		TaskTip("Di�t ���c Ph�ng Ho�ng, quay v� g�p Cao Th�ng Tuy�n.");
		Msg2Player("Di�t ���c Ph�ng Ho�ng, quay v� g�p Cao Th�ng Tuy�n.");
	end;
	
	if nMemCount == 0 then -- ���δ���
		if GetTask(TASK_DL_LV55_ID) == 3 then
			SetTask(TASK_DL_LV55_ID,4);
			RemoveTrigger(GetTrigger(TIME_DL_PHENIX));--ɾȥ��ʱ��
			RemoveTrigger(GetTrigger(TALK_DL_MOSAN));--ɾȥĪ���Ի�������
			TaskTip("Di�t ���c Ph�ng Ho�ng, quay v� g�p Cao Th�ng Tuy�n.");
			Msg2Player("Di�t ���c Ph�ng Ho�ng, quay v� g�p Cao Th�ng Tuy�n.");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_DL_LV55_ID) == 3 then
				SetTask(TASK_DL_LV55_ID,4);
				RemoveTrigger(GetTrigger(TIME_DL_PHENIX));--ɾȥ��ʱ��
				RemoveTrigger(GetTrigger(TALK_DL_MOSAN));--ɾȥĪ���Ի�������
				TaskTip("Di�t ���c Ph�ng Ho�ng, quay v� g�p Cao Th�ng Tuy�n.");
				Msg2Player("Di�t ���c Ph�ng Ho�ng, quay v� g�p Cao Th�ng Tuy�n.");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end;