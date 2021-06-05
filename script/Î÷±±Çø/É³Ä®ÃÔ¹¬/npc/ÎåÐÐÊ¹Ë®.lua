-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ɳĮ�Թ�NPC����ʹˮScript
-- By StarryNight
-- 2007/08/07 PM 04:48

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local nBossState = {0,0,0,0,0}
local nBossName = {" Kim ","M�c","Th�y","H�a","Th�"}
local strTalk = {
	"B�n �� ��nh b�i Ng� H�nh S�, v� th�ng b�o cho Th�c B�t Ho�ng."
	}

	SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	
	if nMemCount == 0 then -- ���δ���
		if GetTask(TASK_XB_ID_01) == 58 then
			if GetBit(GetTask(WUXINGSHI_STATE),3) == 0 then --��δɱ������ʹˮ
				SetTask(WUXINGSHI_STATE,SetBit(GetTask(WUXINGSHI_STATE),3,1));
				 --5������ʹ����
				 if CheckBossStata() == 1 then
					 SetTask(TASK_XB_ID_01,59);
					 SetTask(WUXINGSHI_STATE,0);--��ռ�¼����ʹ����ı���
					 Msg2Player("Khi ��nh b�i ���c Ng� H�nh S�, v� h�i b�o Th�c B�t Ho�ng. ");
					 TaskTip("Khi ��nh b�i ���c Ng� H�nh S�, v� h�i b�o Th�c B�t Ho�ng. ");
					 TalkEx("",strTalk);
				 --��ʾ��δɱ��5������ʹ��������ʾ
				 elseif  CheckBossStata() == 0 then
					 TipBossMsg();
				 end
			--��ʾ�Ѿ�ɱ��1������ʹ������δɱ����	 					
			elseif CheckBossStata() == 0 then
				TipBossMsg();
			end
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
      if GetTask(TASK_XB_ID_01) == 58 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				if GetBit(GetTask(WUXINGSHI_STATE),3) == 0 then --��δɱ������ʹˮ
					SetTask(WUXINGSHI_STATE,SetBit(GetTask(WUXINGSHI_STATE),3,1));
					 --4����������
					 if CheckBossStata() == 1 then
						SetTask(TASK_XB_ID_01,59);
						SetTask(WUXINGSHI_STATE,0);--��ռ�¼����ʹ����ı���
					 Msg2Player("Khi ��nh b�i ���c Ng� H�nh S�, v� h�i b�o Th�c B�t Ho�ng. ");
					 TaskTip("Khi ��nh b�i ���c Ng� H�nh S�, v� h�i b�o Th�c B�t Ho�ng. ");
						TalkEx("",strTalk);
					 --��ʾ��δɱ��5������ʹ��������ʾ
					 elseif  CheckBossStata() == 0 then
						 TipBossMsg();	 	
					 end
				--��ʾ�Ѿ�ɱ��1������ʹ������δɱ����	 					
				elseif CheckBossStata() == 0 then
					TipBossMsg();
				end
			end
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end


--���5������ʹ
function CheckBossStata()
	
local i=0;
local nBossState = {0,0,0,0,0};	
	
	for i=1,5 do
		if GetBit(GetTask(WUXINGSHI_STATE),i) == 1 then
			nBossState[i] = 1;
		end
	end
	--��ɱ��
	if nBossState[1] == nBossState[2] == nBossState[3] == nBossState[4] == nBossState[5] == 1 then
		return 1
	--��δɱ
	elseif nBossState[1] == nBossState[2] == nBossState[3] == nBossState[4] == nBossState[5] == 0 then
		return 2
	else
		return 0
	end
	
end

--���5������ʹ
function CheckBossStataEx()
	
local i=0;
local nBossState = {0,0,0,0,0};	
	
	for i=1,5 do
		if GetBit(GetTask(WUXINGSHI_STATE),i) == 1 then
			nBossState[i] = 1;
		end
	end
	
	return nBossState
	
end

--��ʾ5������ʹ���
function TipBossMsg()

local strMsg = "";
local strTalk = {};
local nNum = 0;
local nBossState = CheckBossStataEx();
local nBossName = {" Kim ","M�c","Th�y","H�a","Th�"}

	for i=1,5 do
		if nBossState[i] == 0 then
			strMsg = strMsg..nBossName[i]
			nNum = nNum + 1
		end
	end
	
	strTalk = {
		"B�n �� h� th�"..(5 - nNum).." Ng� H�nh S�, c�n "..strMsg.." v� "..nNum.." Ng� H�nh S� ch�a gi�t ���c."
		}
		
	TalkEx("",strTalk);
	
end
