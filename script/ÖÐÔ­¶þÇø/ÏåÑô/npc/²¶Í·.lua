-- ====================== �ļ���Ϣ ======================             
             
-- ������ԵonlineII ͨ������ʵ�崦���ļ�             
-- Edited by Starry              
-- 2005/09/05 PM 16:21             
             
-- ======================================================             

--����ͨ������ͷ�ļ�
Include("\\script\\task\\killer\\killer_head.lua");

function main()

	local strButouTitle = "<color=green>B� ��u<color>:";
	local task_state = GetTask(TASK_KILLER_STATE_ID);
	local nLevel = GetLevel();
	
	if random(1,20) == 1 then
		NpcChat(GetTargetNpc(),"Nghe n�i tr�n ng��i c�a b�n s�t th� ���ng c�ng c� Linh Th�ch, thi�u hi�p ph�i theo d�i b�n ch�ng!");
	end;
	
	--��������ĵȼ����Ϊ10��
	if nLevel >= 10 then
	
		if task_state == 0 then
			Say(strButouTitle.."G�n ��y s� t�i ph�m kh�p n�i kh�ng ng�ng t�ng l�n, kh�ng bi�t C�c h� c� th� ra tay t��ng tr� gi�p Quan ph� b�t ch�ng quy �n?",
				2,
				"Ng��i luy�n v� nh� ch�ng ta sao c� th� ��ng l�m ng�!/Task_Confirm",
				"T�i h� c�n c� chuy�n ph�i l�m!/Taks_Exit");	
		end;
		
		if task_state >= 1 then
		
			local nSurnameID = GetTask(TASK_KILLER_SURNAME_ID);
			local nFirstnameID = GetTask(TASK_KILLER_FIRSTNAME_ID);
			local nKillerName = getKillerName(nSurnameID,nFirstnameID);
			
			local nPosID = GetTask(TASK_KILLER_MAP_ID);
			local nMapName,nMapID,nWx,nYx,nMx,nMy = getPosData(nPosID);
			
			Say(strButouTitle.."C�c h� c� ph�i �� gi�p ta ��nh b�i s�t th� xung quanh <color=yellow>"..nMapName.."("..nMx..", "..nMy..")<color> (s�t th�) <color=yellow>"..nKillerName.."<color>?",
				3,
				"Ta �� gi�t/Task_Finish",
				"T�m th�i ch�a/Taks_Exit",
				"Ta kh�ng mu�n gi�t/Task_Cancel");		
		end;
	
	else
		Say("Ch� ��ng c�p c�a ng��i ��t <color=yellow>c�p 10<color> h�y ��n t�m ta!",0)
			
	end;
end;

--��������
function Task_Confirm()

	local nKillerName = "";
	local nKillerMode = "";
	local nMapName = "";
	local nMapID = 0;
	local nWx,nWy,nMx,nMy = 0,0,0,0;
	local strButouTitle = "<color=green>B� ��u<color>:";
	local nDoNum = GetTask(TASK_KILLER_DONUM);
	local nTriggerID = 0;
	local nCustomID = 0;
	
	if Is_1stTask() == 1 then --������Ϸ��һ��������
	
		--����һ��ɱ������
		nKillerName,nKillerMode,nMapName,nMapID,nWx,nWy,nMx,nMy = createKillerData();

		Say(strButouTitle.."Theo tin th�m b�o, s�t th� <color=yellow>"..nKillerName.."<color> g�n ��y hay xu�t hi�n t�i <color=yellow>"..nMapName.."("..nMx..","..nMy..")<color>. H�y mau �i di�t tr�!",0);

		SetTask(TASK_KILLER_STATE_ID,1);--����һ��ͨ�������ñ���Ϊ 1
		SetTask(TASK_KILLER_DONUM,1);--��¼�ӻ��������	
		SetTask(TASK_PLAYER_LEVEL,GetLevel());--��¼��ҽӻ�����ʱ�ĵȼ�
		
		--����ʱ�䴥����������ֵΪ900
		CreateTrigger(2,400,500);
		ContinueTimer(GetTrigger(500));
		
		--���ɵ�ͼ������
		nTriggerID,nCustomID = GetTriggerID(nMapID);
		CreateTrigger(2,nTriggerID,600);
		
		--�����ͼ������ID
		SetTask(TASK_TRIGGER_ID,nTriggerID);
		
		if GetItemCount(2,0,338) <= 0 then
			AddItem(2,0,338,1,1);
		end;
		
		TaskTip("B�n nh�n ���c m�t nhi�m v� truy n�, trong 15 ph�t ph�i ��n khu v�c ��, th�ng tin chi ti�t c� th� xem trong Truy N� l�nh!");
		
	else
		if Is_1stTask_day() == 1 then -- һ���ڵ�һ��������
		 
		 	--��ָ���ط�����һ��ɱ������
			nKillerName,nKillerMode,nMapName,nMapID,nWx,nWy,nMx,nMy = createKillerData();
			
			Say(strButouTitle.."Theo tin th�m b�o, s�t th� <color=yellow>"..nKillerName.."<color> g�n ��y hay xu�t hi�n t�i <color=yellow>"..nMapName.."("..nMx..","..nMy..")<color>. H�y mau �i di�t tr�!",0);			
			
			SetTask(TASK_KILLER_STATE_ID,1);--����һ��ͨ�������ñ���Ϊ 1
			SetTask(TASK_KILLER_DONUM,1);--��¼�ӻ��������
			SetTask(TASK_PLAYER_LEVEL,GetLevel());--��¼��ҽӻ�����ʱ�ĵȼ�
			
			--����ʱ�䴥����������ֵΪ1800
			CreateTrigger(2,400,500);
			ContinueTimer(GetTrigger(500));
			
			--���ɵ�ͼ������
			nTriggerID,nCustomID = GetTriggerID(nMapID);
			CreateTrigger(2,nTriggerID,600);
		
			--�����ͼ������ID
			SetTask(TASK_TRIGGER_ID,nTriggerID);
			
			--�õ�������Ʒͨ����
			if GetItemCount(2,0,338) <= 0 then
				AddItem(2,0,338,1,1);
			end;
			
			TaskTip("B�n nh�n ���c m�t nhi�m v� truy n�, trong 15 ph�t ph�i ��n khu v�c ��, th�ng tin chi ti�t c� th� xem trong Truy N� l�nh!");
		
		else
			if nDoNum < 20 then --һ���ڽӻ������������20
			
				--��ָ���ط�����һ��ɱ������
				nKillerName,nKillerMode,nMapName,nMapID,nWx,nWy,nMx,nMy = createKillerData();
			
				Say(strButouTitle.."Theo tin th�m b�o, s�t th� <color=yellow>"..nKillerName.."<color> g�n ��y hay xu�t hi�n t�i <color=yellow>"..nMapName.."("..nMx..","..nMy..")<color>. H�y mau �i di�t tr�!",0);
			
				SetTask(TASK_KILLER_STATE_ID,1);--����һ��ͨ�������ñ���Ϊ 1
				SetTask(TASK_KILLER_DONUM,nDoNum+1);--��¼�ӻ��������
				SetTask(TASK_PLAYER_LEVEL,GetLevel());--��¼��ҽӻ�����ʱ�ĵȼ�
				
				--����ʱ�䴥����������ֵΪ1800
				CreateTrigger(2,400,500);
				ContinueTimer(GetTrigger(500));
				
				--���ɵ�ͼ������
				nTriggerID,nCustomID = GetTriggerID(nMapID);
				CreateTrigger(2,nTriggerID,600);
		
				--�����ͼ������ID
				SetTask(TASK_TRIGGER_ID,nTriggerID);
				
				if GetItemCount(2,0,338) <= 0 then
					AddItem(2,0,338,1,1);
			end;
			
			TaskTip("B�n nh�n ���c m�t nhi�m v� truy n�, trong 15 ph�t ph�i ��n khu v�c ��, th�ng tin chi ti�t c� th� xem trong Truy N� l�nh!");
				
			else
				 Say(strButouTitle.."H�m nay C�c h� �� gi�p ta ti�u di�t s�t th� ���c 20 l�n, t�m th�i kh�ng phi�n C�c h� n�a.",0);
				 
			end;
			
		end;
		
	end;
		
end;

--������񼰽�����ȡ
function Task_Finish()

	local strButouTitle = "<color=green>B� ��u<color>:";
	local task_state = GetTask(TASK_KILLER_STATE_ID);
	local nDoNum = GetTask(TASK_KILLER_DONUM);
	
	if task_state == 2 then
		Say(strButouTitle.."Ta thay m�t Quan ph� v� b� t�nh c�m t� C�c h�! Xin nh�n ch�t ph�n th��ng!",0);
		KillerAward();
		SetTask(TASK_KILLER_STATE_ID,0);--�����������״̬��0
		SetTask(TASK_KILLER_DONUM,nDoNum+1);--������񣬴�����1
		
		--ɾȥͨ����
		if GetItemCount(2,0,338) > 0 then
			DelItem(2,0,338,1,1);
		end;
		-- ʦͽ���� ��ɱ�֣�
		local nChance, nMaxChance = CustomDataRead("mp_shashou")
		if nChance ~= nil then
			nChance = nChance + 1
			if nChance < nMaxChance then
				CustomDataSave("mp_shashou", "dd", nChance, nMaxChance)
				Msg2Player("Ho�n th�nh nhi�m v� s� ��-s�t th�:"..nChance.."/"..nMaxChance)
			else
				PrenticeCompleteTask()
			end
		end
	else
		Say(strButouTitle.."H�! Tu�i c�n nh� m� d�m g�t ta �?",0);
	end;
end;

--ȡ������
function Task_Cancel()

local strButouTitle = "<color=green>B� ��u<color>:";

	Say(strButouTitle.."Sao d� n�n l�ng v�y?",
	2,
	"���c ta s� di�t tr� b�n ch�ng!/Task_Exit",
	"Ta kh�ng gi�t th� sao!/Task_CancelConfirm");
	
end;

--�ٴ�ȷ��ȡ������
function Task_CancelConfirm()

local strButouTitle = "<color=green>B� ��u<color>:";
local nDoNum = GetTask(TASK_KILLER_DONUM);
	
	SetTask(TASK_KILLER_DONUM,nDoNum+1);--ȡ�����񣬴�����1
	SetTask(TASK_KILLER_STATE_ID,0);--ȡ����������״̬��0
	SetTask(TASK_KILLER_STATE_STAR,0);
	Say(strButouTitle.."H�! �� v� d�ng!",0);

		--ɾȥͨ����
		if GetItemCount(2,0,338) > 0 then
			DelItem(2,0,338,1,1);
		end;	
	
	--ɾ���õ�ͼ������
	RemoveTrigger(GetTrigger(600));
	--ɾ��ʱ�䴥����
	RemoveTrigger(GetTrigger(500));
	
end;
	
	
--�պ����������κ���
function Taks_Exit()

end;
