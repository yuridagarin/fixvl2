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
	local nTotalPoint = GetTask(TASK_POINT_TOTAL); 
	
	--���ֲ���
	if random(1,20) == 1 then
		NpcChat(GetTargetNpc(),"Nghe n�i tr�n ng��i c�a b�n s�t th� ���ng c�ng c� Linh Th�ch, thi�u hi�p ph�i theo d�i b�n ch�ng!");
	end;
	if nTotalPoint == 0 then
		local nPointCoefficient = GetPointCoefficient();
			nTotalPoint = GetTask(TASK_KILLER_DONUM)*100*nPointCoefficient;
		SetTask(TASK_POINT_TOTAL,nTotalPoint);
	end; 
			
	--���ʱ���Ƿ�Ϊ��һ������20����24��
	if CheckTime() == 1 then
	
		--��������ĵȼ����Ϊ20��
		if nLevel >= 20 then
					
			if task_state == 0 then
				Say(strButouTitle.."G�n ��y t�i ph�m c�c n�i ng�y m�t nhi�u, ng��i nha m�n th� b�n b�u kh�ng bi�t c�c h� c� th� gi�p m�t tay kh�ng?",
					4,
					"Ng��i luy�n v� nh� ch�ng ta sao c� th� ��ng l�m ng�!/Task_Confirm",
					"C�c b��c nhi�m v�/Task_Show",
					"B�i c�nh nhi�m v�/Task_Backdrop",
					"T�i h� c�n c� chuy�n ph�i l�m!/Taks_Exit");	
			end;
			
			if task_state >= 1 then
			
				local nSurnameID = GetTask(TASK_KILLER_SURNAME_ID);
				local nFirstnameID = GetTask(TASK_KILLER_FIRSTNAME_ID);
				local nKillerName = getKillerName(nSurnameID,nFirstnameID);	
				local nPosID = GetTask(TASK_KILLER_MAP_ID);
				local nMapName,nMapID,nWx,nYx,nMx,nMy = getPosData(nPosID);
				
				Say(strButouTitle.."C�c h� c� ph�i �� gi�p ta ��nh b�i s�t th� xung quanh <color=yellow>"..nMapName.."("..nMx..", "..nMy..")<color>: <color=yellow>"..nKillerName.."<color>?",
					3,
					"Ta �� gi�t/Task_Finish",
					"T�m th�i ch�a/Taks_Exit",
					"Ta kh�ng mu�n gi�t/Task_Cancel");		
			end;
		
		else
			Say(strButouTitle.."Kinh nghi�m c�c h� c�n k�m h�n n�a giang h� hi�m �c ��i ��t <color=yellow>c�p 20<color> m�i ��n t�m ta!",0)
				
		end;
		
	elseif task_state >= 1 then
			
		local nSurnameID = GetTask(TASK_KILLER_SURNAME_ID);
		local nFirstnameID = GetTask(TASK_KILLER_FIRSTNAME_ID);
		local nKillerName = getKillerName(nSurnameID,nFirstnameID);		
		local nPosID = GetTask(TASK_KILLER_MAP_ID);
		local nMapName,nMapID,nWx,nYx,nMx,nMy = getPosData(nPosID);
				
			Say(strButouTitle.."C�c h� c� ph�i �� gi�p ta ��nh b�i s�t th� xung quanh <color=yellow>"..nMapName.."("..nMx..", "..nMy..")<color>: <color=yellow>"..nKillerName.."<color>?",
					3,
					"Ta �� gi�t/Task_Finish",
					"T�m th�i ch�a/Taks_Exit",
					"Ta kh�ng mu�n gi�t/Task_Cancel");		
	else
		Say(strButouTitle.."T� <color=yellow>Th� hai<color> ��n <color=yellow>Th� N�m<color>, t� <color=yellow>20h:00<color> ��n <color=yellow>24h:00 <color>. Th�i gian n�y B� ��u m�i c�ng b� Danh s�ch truy n�!",
				3,
				"C�c b��c nhi�m v�/Task_Show",
				"B�i c�nh nhi�m v�/Task_Backdrop",
				"K�t th�c ��i tho�i/Taks_Exit");
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
	local nTriggerID = 0;
	local nCustomID = 0;
	local nTime = 0;
	local nBuTouMapID = GetWorldPos();
	local nTotal_DoNum = 0;
	local i=0;
	local nNowTime = GetTime();
	local nLastTime = GetTask(TASK_ACCEPT_TIME);--��ȡ��һ�νӻ�����ʱ��
	local nCoolTime = 300 - (nNowTime-nLastTime);
			if nLastTime == nil or nCoolTime < 0 then
				nCoolTime = 0;
			end;
	local strCoolTime = TurnTime(nCoolTime);
	
	--���ݵص��ȡ�õص�Ŀǰ�ӻ�ͨ�����������
--	if nBuTouMapID == 100 then nTotal_DoNum = GetMapTaskTemp(100,1);i=1;end;--Ȫ��
--	if nBuTouMapID == 150 then nTotal_DoNum = GetMapTaskTemp(150,1);i=2;end;--����
--	if nBuTouMapID == 200 then nTotal_DoNum = GetMapTaskTemp(200,1);i=3;end;--�꾩
--	if nBuTouMapID == 300 then nTotal_DoNum = GetMapTaskTemp(300,1);i=4;end;--�ɶ�
--	if nBuTouMapID == 350 then nTotal_DoNum = GetMapTaskTemp(350,1);i=5;end;--����
	
--	һ����ͬһ�ص㲶����ӻ������������100
--	if nTotal_DoNum < 100 then 
		
		--�ӻ��������Ҫ5���ӷ��ܽ���һ������
		if nCoolTime ~= 0 then
			Talk(1,"",strButouTitle.."��ng n�n n�ng, c�c h� c�n "..strCoolTime.." m�i nh�n ���c nhi�m v� k� ti�p, nh��ng c� h�i cho ng��i kh�c �i!")
			return
		end;
		
		--����һ��ɱ������
		nKillerName,nKillerMode,nMapName,nMapID,nWx,nWy,nMx,nMy = createKillerData();
				
		SetTask(TASK_KILLER_STATE_ID,1);--����һ��ͨ�������ñ���Ϊ 1
		--SetMapTaskTemp(nBuTouMapID,1,nTotal_DoNum+1);--��¼һ�������׵ص㲶��ӻ��������
		SetTask(TASK_PLAYER_LEVEL,GetLevel());--��¼��ҽӻ�����ʱ�ĵȼ�
		
		--nTotal_DoNum = GetMapTaskTemp(BuTouMapData[i][1],1);
		
		Say(strButouTitle.."Theo tin th�m b�o, s�t th� <color=yellow>"..nKillerName.."<color> g�n ��y hay xu�t hi�n t�i <color=yellow>"..nMapName.."("..nMx..","..nMy..")<color>. H�y �i di�t tr� h�n tr� h�u h�a!",0);--�����Ǳ��θò�ͷ�����ĵĵ�<color=yellow>"..nTotal_DoNum.."<color>������ÿ�η�����������Ϊ<color=yellow>100<color>�Ρ���",0);
		
		--����ʱ�䴥����������ֵΪ1800
		CreateTrigger(1,400,500);
		ContinueTimer(GetTrigger(500));
		
		--���浱ǰʱ��
		nTime = GetTime();--��ȡ1970�����񾭹�������
		SetTask(TASK_ACCEPT_TIME,nTime);
		
		--���ɵ�ͼ������
		nTriggerID,nCustomID = GetTriggerID(nMapID);
		CreateTrigger(2,nTriggerID,600);
		
		--�����ͼ������ID
		SetTask(TASK_TRIGGER_ID,nTriggerID);

		TaskTip("C�n ho�n th�nh nhi�m v� trong 30 ph�t, xem th�m trong l�nh truy n�!");
		
		if GetItemCount(2,0,338) <= 0 then
			AddItem(2,0,338,1,1);
		end;
				
--	else
--		Say(strButouTitle.."<color=yellow>"..BuTouMapData[i][2].."<color>����ͨ�������ѷ�����ϣ�",0);
--				 
--	end;
		
end;

--������񼰽�����ȡ
function Task_Finish()

	local strButouTitle = "<color=green>B� ��u<color>:";
	local task_state = GetTask(TASK_KILLER_STATE_ID);
	local nDoNum = GetTask(TASK_KILLER_DONUM);
	
	if task_state == 2 then
		Say(strButouTitle.."Thay m�t quan ph� c�m �n c�c h� ra tay gi�p ��, ��y l� ph�n th��ng!",0);
		KillerAward();
		SetTask(TASK_KILLER_STATE_ID,0);--�����������״̬��0
		SetTask(TASK_KILLER_DONUM,nDoNum+1);--������񣬴�����1
		
		--�����ۼƴ���
		local nTotalPoint = GetTask(TASK_POINT_TOTAL);
		local nPointCoefficient = GetPointCoefficient();
			nTotalPoint = nTotalPoint + 100*nPointCoefficient;
		SetTask(TASK_POINT_TOTAL,nTotalPoint);	
		
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
	"T�i h� �i gi�t ch�ng ��y!/Task_Exit",
	"Ta kh�ng gi�t th� sao!/Task_CancelConfirm");
	
end;

--�ٴ�ȷ��ȡ������
function Task_CancelConfirm()

local strButouTitle = "<color=green>B� ��u<color>:";

	SetTask(TASK_KILLER_STATE_ID,0);--ȡ����������״̬��0
	SetTask(TASK_KILLER_STATE_STAR,0);
	Say(strButouTitle.."H�! �� v� d�ng!",0);
	
	TaskPunish();

		--ɾȥͨ����
		if GetItemCount(2,0,338) > 0 then
			DelItem(2,0,338,1,1);
		end;	
	
	--ɾ���õ�ͼ������
	RemoveTrigger(GetTrigger(600));
	--ɾ��ʱ�䴥����
	RemoveTrigger(GetTrigger(500));
	
end;

--ͨ����������˵��
function Task_Show()

local str1 = "Nh�n s� <color=yellow>t� c�p 20 tr� l�n<color>, l�c <color=yellow>20h:00<color> ��n <color=yellow>24h:00<color> t� <color=yellow>Th� hai<color> ��n <color=yellow>Th� n�m<color> h�ng tu�n, c� th� ��n c�c Nha m�n g�p <color=yellow>B� ��u<color> nh�n nhi�m v� Truy n�!";
local str2 = "Khi �� nh�n danh s�ch truy n� <color=yellow>n�i trong 30 ph�t<color> ph�i truy t�m cho ���c s�t th�, n�u qu� th�i gian ho�c h�y b� nhi�m v� th� xem nh� nhi�m v� th�t b�i.";
local str3 = "D� ho�n th�nh nhi�m v�, h�y nhi�m v� hay nhi�m v� th�t b�i ��u ph�i <color=yellow>5 ph�t<color> sau m�i nh�n ti�p nhi�m v�.";

	Talk(3,"",str1,str2,str3);

end;

--ͨ�����񱳾�˵��
function Task_Backdrop()

local str1 = "C��ng qu�c T�y H� n�m � ph�a t�y trung nguy�n tuy v� ngo�i kh�ng ��ng t�nh th�c ch�t ng�p ngh� l�nh th� trung nguy�n, ngo�i c�u k�t v�i Minh gi�o �� l�i d�ng l�n nhau, ch�ng c�n gi�p c�c gian th�n trong tri�u ��nh.";
local str2 = "T�y H� t�n ng��ng v� h�c, s�ng l�p ra Nh�t Ph�m ���ng v�i c�c k� nh�n d� s�. H� ���c xem l� c� c�u ��i ngo�i t�t nh�t c�a T�y H�, t� ch�c n�y t�ng ph�i s�t th� ��n trung nguy�n ph� ho�i v� gi�t kh�ng �t c�c trung th�n.";
local str3 = "L� con ch�u ��i T�ng sao ng��i c� th� khoanh tay ��ng nh�n�...";
	
	Talk(3,"",str1,str2,str3);
	
end;
	
--�պ����������κ���
function Taks_Exit()

end;
