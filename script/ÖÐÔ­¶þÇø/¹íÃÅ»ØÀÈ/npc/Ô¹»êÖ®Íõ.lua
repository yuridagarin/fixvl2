-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������NPCԹ��֮���ٻ�������Script
-- By StarryNight
-- 2007/08/07 PM 10:23

-- ======================================================
-- ���þ��������ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

local nMapID,nWx,nWy = GetWorldPos();
local nTime = GetTime() - GetTask(CREAT_YUANHUNZHIWANG_TIME);
	
	if nMapID == 328 and GetFightState() == 1 then
		if GetTask(TASK_XB_ID_02) == 4 then
			if nTime >= 1800 then
				local nYHIndex = CreateNpc("Ch�a O�n H�n","Ch�a O�n H�n",nMapID,nWx,nWy,-1,1,1,50);
				SetNpcLifeTime(nYHIndex,900); 
				SetNpcScript(nYHIndex,"\\script\\��ԭ����\\���Ż���\\npc\\Թ��֮��.lua");
				TaskTip("Ng��i �� d�n Ch�a O�n H�n ra th�nh c�ng, mau gi�t n�");
				Msg2Player("Ng��i �� d�n Ch�a O�n H�n ra th�nh c�ng, mau gi�t n�");
				DelItem(2,0,757,1);--�»���
				SetTask(CREAT_YUANHUNZHIWANG_TIME,GetTime());
				return
			else
				strTalk = {
					"C�ch 30 ph�t l� d�n Ch�a O�n H�n ra m�t l�n!"
				};
				TalkEx("",strTalk);
			end
		else
			strTalk = {
				"Xem ra t�c d�ng c�a b�nh n�y kh�ng l�n, hay l� v�t n� �i.",
				}	
			TalkEx("",strTalk);
			DelItem(2,0,757,1);--�»���
			return
		end
	elseif GetTask(TASK_XB_ID_02) == 4 then
		strTalk = {
			"H�nh nh� kh�ng c� hi�u qu� g�, theo C�n L�n m�n nh�n n�i, b�nh n�y n�n m� t�i Qu� M�n H�i Lang, ph�ng C� H�n s� d�n Ch�a O�n H�n ra."
			};
			TalkEx("",strTalk);
	else
		strTalk = {
				"Xem ra t�c d�ng c�a b�nh n�y kh�ng l�n, hay l� v�t n� �i.",
				}	
		TalkEx("",strTalk);
		DelItem(2,0,757,1);--�»���
	end
	
end;

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
		
	SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	
	if nMemCount == 0 then -- ���δ���
		if GetTask(TASK_XB_ID_02) == 4 then
			AddItem(2,0,717,1,1);--�ǳ�����
			SetTask(TASK_XB_ID_02,5);
			SetTask(CREAT_YUANHUNZHIWANG_TIME,0);--���ʱ���¼
			TaskTip("Gi�t Ch�a O�n H�n th�nh c�ng, mau n�i cho �� t� C�n L�n b� th��ng bi�t.");
			Msg2Player("Gi�t Ch�a O�n H�n th�nh c�ng, mau n�i cho �� t� C�n L�n b� th��ng bi�t.");
		end;	
  else
    for i=1,nMemCount do
       PlayerIndex = GetTeamMember(i);
       local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
       local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
       if GetTask(TASK_XB_ID_02) == 4 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
       	SetTask(TASK_XB_ID_02,5);
       	AddItem(2,0,717,1,1);--�ǳ�����
				SetTask(CREAT_YUANHUNZHIWANG_TIME,0);--���ʱ���¼
				TaskTip("Gi�t Ch�a O�n H�n th�nh c�ng, mau n�i cho �� t� C�n L�n b� th��ng bi�t.");
				Msg2Player("Gi�t Ch�a O�n H�n th�nh c�ng, mau n�i cho �� t� C�n L�n b� th��ng bi�t.");
       end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end