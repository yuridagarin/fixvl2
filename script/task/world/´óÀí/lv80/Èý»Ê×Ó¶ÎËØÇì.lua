-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������NPC���������ӣ�����ɮ�ٻ�������Script
-- By StarryNight
-- 2006/01/13 PM 21:07

--������  ������ ������ 

-- ======================================================
-- ���þ��������ļ�
Include("\\script\\task\\world\\����\\task_head.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

local nMapID,nWx,nWy = GetWorldPos();

	if nMapID == 411 then
		local n3HZIndex = CreateNpc("Tam Ho�ng T� ��i L�","Tam Ho�ng T� �o�n T� Kh�nh",nMapID,nWx,nWy,-1,1,1,70);
		local nFS1Index = CreateNpc("Long T��ng Ph�p T�ng","Long T��ng Ph�p T�ng",nMapID,nWx,nWy,-1,1,1,70);
		local nFS2Index = CreateNpc("Long T��ng Ph�p T�ng","Long H� ph�p t�ng",nMapID,nWx,nWy,-1,1,1,70);
		SetNpcLifeTime(n3HZIndex,1200);
		SetNpcLifeTime(nFS1Index,1200);
		SetNpcLifeTime(nFS2Index,1200);
		SetNpcScript(n3HZIndex,"\\script\\task\\world\\����\\Lv80\\�����Ӷ�����.lua");
		SetNpcScript(nFS1Index,"\\script\\task\\world\\����\\Lv80\\����ɮ.lua");
		SetNpcScript(nFS2Index,"\\script\\task\\world\\����\\Lv80\\����ɮ.lua");
		ChangeNpcToFight(n3HZIndex);
		ChangeNpcToFight(nFS1Index);
		ChangeNpcToFight(nFS2Index);
		TaskTip("Tam Ho�ng T� �� xu�t hi�n, mau b�t l�i!");
		Msg2Player("Tam Ho�ng T� �� xu�t hi�n, mau b�t l�i!");
		DelItem(2,0,384,1);--ɾ���ٻ����
		return
	else
		local strTalk = {
			"� ��y kh�ng th� d�ng ph�o!"
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
        if GetTask(TASK_DL_LV80_ID) == 8 then
        	SetTask(TASK_DL_LV80_ID, 9);
        	Msg2Player("�� ��nh b�i Tam Ho�ng T�, quay v� ��i L� h�i b�o ��ng Qu�c S�.");
        	TaskTip("�� ��nh b�i Tam Ho�ng T�, quay v� ��i L� h�i b�o ��ng Qu�c S�.");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV80_ID) == 8 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV80_ID, 9);
           	Msg2Player("�� ��nh b�i Tam Ho�ng T�, quay v� ��i L� h�i b�o ��ng Qu�c S�.");
           	TaskTip("�� ��nh b�i Tam Ho�ng T�, quay v� ��i L� h�i b�o ��ng Qu�c S�.");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
    end;
end