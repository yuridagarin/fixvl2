
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �������ͷ�ļ�
-- Edited by peres
-- 2005/08/08 PM 13:45

-- ֻ��������������һ���
-- ����������ӵ����
-- ������ָ��Ƥ��
-- ���������������������ʹ
-- ���룬�����ǰ���
-- �����뱧Թʲô
-- ÿ���������Ƕ�������
-- ����֪�����������ֽӴ������İ�ȫ�к���ů�����ܴ�����ȡ��
-- ��ϲ����һ˲�䡣�·��ںڰ��Ĵ��ϣ�Ư������ľ�ͷ

-- ======================================================


-- ����ļ����֧���Լ���ͼ��ת��֧��
Include("\\script\\task\\random\\task_gotoworld.lua");

-- ������������ DEBUG ֧���ļ�
Include("\\script\\lib\\task_debug.lua");

-- �����ļ���֧��
Include("\\script\\task\\random\\task_data.lua");

-- �Ի�֮ҹ
Include("\\script\\shinynight_head.lua");

tabNpcName   = new(KTabFile, "\\settings\\task\\random\\task_npc.txt");  -- NPC ���ֱ��
tabTaskType  = new(KTabFile, "\\settings\\task\\random\\task_type.txt"); -- ���������ܱ�
tabTalkTask  = new(KTabFile, "\\settings\\task\\random\\task_talk.txt"); -- �Ի�����ϸ��
tabKillTask  = new(KTabFile, "\\settings\\task\\random\\task_kill.txt"); -- ɱ������ϸ��
tabCollTask  = new(KTabFile, "\\settings\\task\\random\\task_coll.txt"); -- �ռ�����ϸ��

TASKNPC_ID      = 550; -- ���� NPC �� ID
TASKSTATE_ID    = 551; -- �����չ�̶ȵ� ID
TASKTYPE_ID     = 552; -- �������͵� ID
TASKID_ID       = 553; -- ��������� ID
TASKCANCEL_ID   = 554; -- ����ȡ���ۻ������� ID
TASKRANDOM_ID   = 555; -- ����������Ӽ�¼
TASKTIMER_ID    = 556; -- ��¼ʱ�䴥����������
TASKKILL_ID     = 557; -- ��¼ɱ�����񴥷���������

EVENT_NPC_ID    = 100; -- �� NPC �Ի��Ĵ����� ID
EVENT_TIMER_ID  = 101; -- 15 �������޵ļ��� ID


-- ���⽱��
speAward1 = {

	{"Tr��ng Quy�n Ph�", 0,	107, 51},		
  {"T��ng H�nh Ph�", 0, 107, 52},		
  {"Trung B�nh Ph�", 0,	107, 53},		
  {"Khai S�n Ph�", 0,	107, 54},		
  {"Kh� Li�u Thu�t", 0,	107, 55},		
  {"To�i Di�p Ph�", 0,	107, 56},		
  {"T� Nguy�n C�ng Ph�", 0,	107, 57},		
  {"Huy�n Th�ch C�ng Ph�", 0,	107, 58},
  
  }
  
speAward2 = {
  {"Tr��ng Quy�n Ph�", 0,	107, 51},		
  {"T��ng H�nh Ph�", 0, 107, 52},		
  {"Trung B�nh Ph�", 0,	107, 53},		
  {"Khai S�n Ph�", 0,	107, 54},		
  {"Kh� Li�u Thu�t", 0,	107, 55},		
  {"To�i Di�p Ph�", 0,	107, 56},		
  {"T� Nguy�n C�ng Ph�", 0,	107, 57},		
  {"Huy�n Th�ch C�ng Ph�", 0,	107, 58},
  {"Kim Thi�n Ph�", 0,	107, 59},
  {"Tu La M�t t�ch", 0,	107, 60},
  {"B� Kim M�t t�ch", 0,	107, 61},
  {"B� Th�ch M�t t�ch", 0,	107, 62},
  {"Ng� Qu� M�t t�ch", 0,	107, 63},
  
  }
  
speAward3 = {
  {"Tr��ng Quy�n Ph�", 0,	107, 51},		
  {"T��ng H�nh Ph�", 0, 107, 52},		
  {"Trung B�nh Ph�", 0,	107, 53},		
  {"Khai S�n Ph�", 0,	107, 54},		
  {"Kh� Li�u Thu�t", 0,	107, 55},		
  {"To�i Di�p Ph�", 0,	107, 56},		
  {"T� Nguy�n C�ng Ph�", 0,	107, 57},		
  {"Huy�n Th�ch C�ng Ph�", 0,	107, 58},
  {"Kim Thi�n Ph�", 0,	107, 59},
  {"Tu La M�t t�ch", 0,	107, 60},
  {"B� Kim M�t t�ch", 0,	107, 61},
  {"B� Th�ch M�t t�ch", 0,	107, 62},
  {"Ng� Qu� M�t t�ch", 0,	107, 63},
  {"Thi�n H� M�t t�ch", 0,	107, 64},
  {"T� H� M�t t�ch", 0,	107, 65},
  {"Chi�m Y Ph�", 0,	107, 66},
  
}

--ʦ�����ţ��ķ�
FactionBook = {
	--��շ�ħ��,��շ�ħ�ķ�,��������
	[2] = {{0,107,1},{0,107,2},{2,0,205},"Thi�u L�m"},
	--�޳��ؼ�,�޳��ķ�,��������    
	[3] = {{0,107,5},{0,107,6},{2,0,205},"Thi�u L�m"},
	--Ǳ���ؼ�,Ǳ���ķ�,��������
	[4] = {{0,107,3},{0,107,4},{2,0,205},"Thi�u L�m"},
	--�����ؼ�,�����ķ�,��������
	[6] = {{0,107,7},{0,107,8},{2,0,209},"���ng M�n"},
	--�����ؼ�,�����ķ�,��������
	[8] = {{0,107,9},{0,107,10},{2,0,207},"Nga My"},
	--�̺���,�̺��ķ�,��������
	[9] = {{0,107,11},{0,107,12},{2,0,207},"Nga My"},
	--�����ؼ�,�����ķ�,ؤ������
	[11] = {{0,107,13},{0,107,14},{2,0,208},"C�i Bang"},
	--�����ؼ�,�����ķ�,ؤ������
	[12] = {{0,107,15},{0,107,16},{2,0,208},"C�i Bang"},
	--��Ӱ�ؼ�,��Ӱ�ķ�,�䵱����
	[14] = {{0,107,17},{0,107,18},{2,0,206},"V� �ang"},
	--�����ؼ�,�����ķ�,�䵱����
	[15] = {{0,107,19},{0,107,20},{2,0,206},"V� �ang"},
	--ǹ���ؼ�,ǹ���ķ�,��������
	[17] = {{0,107,21},{0,107,22},{2,0,350},"D��ng M�n"},
	--�����ؼ�,�����ķ�,��������
	[18] = {{0,107,23},{0,107,24},{2,0,350},"D��ng M�n"},
	--а���ؼ���а���ķ�,�嶾����
	[20] = {{0,107,25},{0,107,26},{2,0,390},"Ng� ��c"},
	--��ʦ�ؼ�����ʦ�ķ�,�嶾����
	[21] = {{0,107,27},{0,107,28},{2,0,390},"Ng� ��c"},
}

-- ���������ͱ��и���Ȩ��ѡ��һ����������
function SelectTaskType()
    
local nLevel      = SelectPlayerLevel(); -- ѡ��һ����������
local aryRate     = tabTaskType:createArray("Rate"..nLevel); -- ����һ������
local nRow        = GetRateForArray(aryRate);
    
local nTaskType   = tonumber(tabTaskType:getCell(nRow, "TaskType"));
	  
	CDebug:MessageOut("Nh�n ���c lo�i nhi�m v�:"..nTaskType);
	return nTaskType;
    
end;
    
    
-- ������������ѡȡһ�����������
function SelectTask(nTaskType)

local nLevel      = SelectPlayerLevel(); -- ѡ��һ����������
local tabTaskFile = GetTaskTableFile(nTaskType);
local aryRate = {};
local nRow = 0;

	aryRate = tabTaskFile:createArray("Rate"..nLevel);
	nRow    = GetRateForArray(aryRate);
	
	CDebug:MessageOut("Nh�n ���c nhi�m v� c� th�:"..nRow);
	return nRow;

end;


-- �������б���ѡ��һ����������
function SelectTaskNpc()

local nRow = tabNpcName:getRow();
local nRandom = random(3, nRow);
local nNpcID = tabNpcName:getCell(nRandom, "NpcID");

	CDebug:MessageOut("Nh�n ���c ID c�a NPC nhi�m v�:"..nNpcID);
	return nNpcID, nRandom;

end;


-- �����������ӿ� NPC������״̬Ϊ��1
function CreateTask()
	local nNpcID, nRow   = SelectTaskNpc();   -- �õ����� NPC ��ID ������
	local nTaskType      = SelectTaskType();           -- �õ�һ�����������
	local nRow           = SelectTask(nTaskType);      -- �õ�һ������ľ����к�
	local tabTask        = GetTaskTableFile(nTaskType);
	local nTaskID        = tabTask:getCell(nRow, "TaskID"); -- ��ȡ ID
	local nTimerIndex    = 0;
	
	CDebug:MessageOut("Lo�i nhi�m v�:"..nTaskType.."  S� h�ng nhi�m v�:"..nRow);
	if CreateTrigger(4, nNpcID, EVENT_NPC_ID) == 0 then
		WriteLog("[L�i nhi�m v� s� m�n]:task_head.lua L�i CreateTask � h�m s�, CreateTrigger(4. nNpcID, EVENT_NPC_ID), tr� nNpcID:"..nNpcID..". T�n:"..GetName());
		return 0;	--����ʧ��
	end;
	CDebug:MessageOut("B�t ��u xu�t hi�n: Npc ID:"..nNpcID);
	-- ����������ݼ�¼�����������
	SetTask(TASKTYPE_ID, nTaskType);
	SetTask(TASKID_ID, nTaskID);
	SetTask(TASKNPC_ID, nNpcID);
	SetTask(TASKSTATE_ID, 1);
		
	nTimerIndex = CreateTrigger(1, 100, EVENT_TIMER_ID); -- ��ʼһ��ʱ�������
	
	ContinueTimer(nTimerIndex);
	SetTask(TASKTIMER_ID, nTimerIndex);
	
	-- �������û���ź��Ļ��Ǿͼ���һ��
	if GetItemCount(2,0,135)<=0 then
		AddItem(2,0,135,1);
	end;
	
	CDebug:MessageOut("Nhi�m v� ki�n l�p ho�n th�nh, nhi�m v� ���c t�nh 1");
	return 1;
end;


-- ����������� NPC ��λ��
function ShowTaskNpc()

local nNpcID         = GetTask(TASKNPC_ID);
local nRow           = tabNpcName:selectRowNum("NpcID", nNpcID);

local nNpcMapID      = tonumber(tabNpcName:getCell(nRow, "MapID")); -- �õ����� NPC ���ڵ�ͼID

local strNpcName     = tabNpcName:getCell(nRow, "NpcName"); -- �õ����� NPC ������
local strNpcMap      = tabNpcName:getCell(nRow, "NpcMap");  -- �õ����� NPC ���ڵ�ͼ������

local strBossName    = FactionBossName[GetPlayerFaction()];
local strBossTitle   = FactionBossTitle[GetPlayerFaction()];

	Say("B�n nh�n ���c b� c�u ��a th� c�a"..strBossTitle.."{b� c�u ��a th�}"..strBossName.."nh� b�n ��n <color=yellow>"..strNpcMap.."<color> t�m <color=yellow>"..strNpcName.."<color>, ng��i n�y c�n s� gi�p �� c�a b�n, ��ng th�i d�n b�n d� th� n�o c�ng ph�i ho�n th�nh nhi�m v� ���c giao!",
		3,
		"Ti�p nh�n nhi�m v� v� �i ��n n�i ��/#AcceptTask("..nNpcMapID..")",
		"Ta c� vi�c r�i, �� khi kh�c �i!/Main_Exit",
		"T� ch�i nhi�m v�/CancelTask_Confirm");
end;


-- ������ NPC ��������������ϸ���������״̬Ϊ 2
function ShowTask()

local nTaskType = GetTask(TASKTYPE_ID);
local nTask     = GetTask(TASKID_ID);
local tabTask   = GetTaskTableFile(nTaskType);
local nRow      = tabTask:selectRowNum("TaskID", nTask);
local nMapID    = tabTask:getCell(nRow, "MapID");

local strInfo   = tabTask:getCell(nRow, "TaskText");
local strName = GetTargetNpcName();

	if strName==nil or strName=="" then 
		strName = ""; 
	end;
	
	SetTask(TASKSTATE_ID, 2); -- �����������Ϊ 2
	
	StartTaskEvent(nTaskType, nTask); -- ��ʼ����������Ĵ�����
	CDebug:MessageOut("Ng��i ch�i k�t th�c ��i tho�i v�i NPC, nhi�m v� ���c t�nh 2");
	
	if nMapID=="" or nMapID==nil then
		Say("<color=green>"..strName.."<color>: "..strInfo, 0);
	else
		nMapID = tonumber(nMapID)
		Say("<color=green>"..strName.."<color>: "..strInfo, 2, 
			"��n n�i l�m nhi�m v�/#gotoWorld("..nMapID..")",
			"Bi�t r�i!/Main_Exit");
	end;
	
end;


-- ����һ����������Ĵ�����
function StartTaskEvent(nTaskType, nTask)

local nNpcID         = GetTask(TASKNPC_ID);
local tabTask        = GetTaskTableFile(nTaskType);
local nRow           = tabTask:selectRowNum("TaskID", nTask);
local nEventID       = tabTask:getCell(nRow, "EventID");
local nKillIndex     = 0;

	if nTaskType==1 then
		CreateTrigger(4, nTask, EVENT_NPC_ID); -- �Ի�����
	elseif nTaskType==2 then
		CreateTrigger(4, nNpcID, EVENT_NPC_ID); -- �ռ������վɴ�������
	elseif nTaskType==3 then
		-- �洢ɱ�ּ����Ĵ���������
		nKillIndex = CreateTrigger(0, nEventID, EVENT_NPC_ID); -- ɱ������
		SetTask(TASKKILL_ID, nKillIndex);
	end;
	
end;


-- ��������ǰ���������ڵ�
function AcceptTask(nMapID)
local nMap = GetWorldPos()
	--ѩ�ȳ��ز���ʹ��ʦ���ܺ������뿪��ͼ
	if nMap >= 961 and nMap <= 965 then
		Talk(1,"","Khu v�c n�y kh�ng th� ��a t�i n�i l�m nhi�m v� s� m�n, m�i b�n r�i kh�i m�i s� d�ng m�t h�m s� ph�!")
		return
	end
	if GetTask(1715) ~= 0 then
		Talk(1,"","Khu v�c n�y kh�ng th� ��a t�i n�i l�m nhi�m v� s� m�n, m�i b�n r�i kh�i m�i s� d�ng m�t h�m s� ph�!")
		return
	end;
	gotoWorld(nMapID);
end;


-- ȷ��ȡ������
function CancelTask_Confirm()

local strBossTitle   = FactionBossTitle[GetPlayerFaction()];

	Say("B�n ��ng � h�y nhi�m v�"..strBossTitle.."n�y? N�u li�n t�c h�y 2 l�n b�n s� m�t <color=yellow>1<color> �i�m danh v�ng!",
		2,
		"���c/CancelTask",
		"�� xem l�i!/ShowTaskNpc");

end;

-- ȡ����������ʾ
function CancelTask()

local nLost = GetTask(TASKCANCEL_ID);

	nLost = nLost + 1;
	
	if nLost>=2 then
		nLost = 0;
		SetTask(TASKCANCEL_ID, nLost); -- ���ۻ�ʧ�ܴ������
		-- ���񴦷�
		TaskPunish();
		return
	end;
	
	SetTask(TASKSTATE_ID, 0); -- ������״̬��Ϊ��δ��ʼ
	SetTask(TASKCANCEL_ID, nLost);
	local nTriggerID = GetTrigger(EVENT_NPC_ID);
	if nTriggerID ~= 0 then
		RemoveTrigger(nTriggerID);
	end;
end;


-- ����ĳͷ�
function TaskPunish()

-- �������� 5 ��
Msg2Player("Do b�n ch�a ho�n th�nh nhi�m v� �i�m danh v�ng gi�m 1");
TaskTip("Do b�n ch�a ho�n th�nh nhi�m v� �i�m danh v�ng gi�m 1");
ModifyReputation(-1,0);

end;


-- ��������Ƿ����
function CheckTask()

local nTaskType = GetTask(TASKTYPE_ID);
local nTask     = GetTask(TASKID_ID);

local tabTask   = GetTaskTableFile(nTaskType);
local nRow      = tabTask:selectRowNum("TaskID", nTask);

local nGenre, nDetail, nParticular, nNum = 0,0,0,0;

	-- �Ի�����Ĵ���
	if nTaskType==1 then
		return 1;
	end;
	
	-- �ռ�����Ĵ���
	if nTaskType==2 then
	
		nGenre      = tonumber(tabTask:getCell(nRow, "Genre"));
		nDetail     = tonumber(tabTask:getCell(nRow, "Detail"));
		nParticular = tonumber(tabTask:getCell(nRow, "Particular"));
		nNum        = tonumber(tabTask:getCell(nRow, "Num"));
		
		if GetItemCount(nGenre, nDetail, nParticular)>= nNum then
			DelItem(nGenre, nDetail, nParticular, nNum);
			return 1;
		else
			return 0;
		end;

	end;
	
	-- ɱ������Ĵ���
	if nTaskType==3 then
		return 1;
	end;
	
	return 0;

end;


-- ������񲢷��轱���������չΪ 3
function FinishTask()

local nTimerIndex = GetTask(TASKTIMER_ID);

	PauseTimer(nTimerIndex);
	RemoveTrigger(nTimerIndex);
	
	-- ����������������չΪ 3
	SetTask(TASKSTATE_ID, 3);
	
	-- ��ʧ���ۻ����
	SetTask(TASKCANCEL_ID, 0);
	
	-- ����ǻԻ�֮ҹ��ڼ䣬�����ν���
	local multiple = get_reward_multiple(SYS_MASTER_RANDOMTASK)
	--local times = ceil(multiple)
	local times = 2  --�̶�����Ϊ2 
	PayAward(multiple, times)
end;

-- ��������
function PayAward(multiple, times)

	local nTaskType = GetTask(TASKTYPE_ID);
	local nTask     = GetTask(TASKID_ID);
	local tabTask   = GetTaskTableFile(nTaskType);
	local nRow      = tabTask:selectRowNum("TaskID", nTask);
	local nValue    = floor(tonumber(tabTask:getCell(nRow, "Value")) * 3.5); -- ������ֵ���� 2.5 ��
	
	local strBossTitle   = FactionBossTitle[GetPlayerFaction()];
	local strName = GetTargetNpcName();
	
	local nSpe      = 0;
	
	if strName==nil or strName=="" then strName = ""; end;
	
	CDebug:MessageOut("B�t ��u ph�t th��ng, ph�n th��ng l�:"..nValue);

	nValue = nValue * multiple
	ModifyExp(nValue);
	
	local nRoute = GetPlayerRoute();
	local nlevel = GetLevel()
	local a = 0;
	local b = 0;
 
 	for i=1, times do
	-- �� 5% �ĸ��ʵõ�һ�����⽱��
		if random(1, 100)<=5 then
			if random(1,100)<=40 then
				AddItem(2, 1, 148, 1, 1);
				a = 1;				
		  	elseif random(1,100)<=20 and nlevel>=45 then
		  		if FactionBook[nRoute][1][1] ~= nil then
		    		AddItem(FactionBook[nRoute][1][1], FactionBook[nRoute][1][2], FactionBook[nRoute][1][3], 1, 1);
					a = 2;
				end		  
		  	elseif random(1,100)<=20 and nlevel>=45 then
		  		if FactionBook[nRoute][2][1] ~= nil then
		  			AddItem(FactionBook[nRoute][2][1], FactionBook[nRoute][2][2], FactionBook[nRoute][2][3], 1, 1);		    
		    		a = 2;
		  		end
		  	else
		    	if nlevel>=50 then
				    nSpe = random(1, getn(speAward3));
				    AddItem(speAward3[nSpe][2],
					    speAward3[nSpe][3],
				    	speAward3[nSpe][4],
				    	1, 1); 
					a = 2;
				elseif nlevel>=30 and nlevel<=49 then
			    	nSpe = random(1, getn(speAward2));
			    	AddItem(speAward2[nSpe][2],
					    speAward2[nSpe][3],
				    	speAward2[nSpe][4],
			    		1, 1);
					a = 2;
				elseif nlevel<=29 then
			    	nSpe = random(1, getn(speAward1));
			    	AddItem(speAward1[nSpe][2],
				    	speAward1[nSpe][3],
				    	speAward1[nSpe][4],
				    	1, 1);
					a = 2;
				end;
		  	end;
		end;
		
		-- ��5%�ĸ��ʵõ�ʦ������ 
		if random(1, 100)<=5 then
			AddItem(FactionBook[nRoute][3][1], FactionBook[nRoute][3][2], FactionBook[nRoute][3][3], 1, 1);
			b = 1;
		end;
	end
		
	if a==0 and b==0 then
		Say("<color=green>"..strName.."<color>: Kh� l�m! Ng��i �� ho�n th�nh nhi�m v� c�a"..strBossTitle..", ��y l� ph�n th��ng! <enter><enter>Kinh nghi�m:"..nValue,0);		
	elseif a==1 and b==0 then 
		Say("<color=green>"..strName.."<color>: Kh� l�m! Ng��i �� ho�n th�nh nhi�m v� c�a"..strBossTitle..", ��y l� ph�n th��ng! <enter><enter>Kinh nghi�m:"..nValue.."<enter>V�t ph�m ��c bi�t: m�nh B�ng th�ch",0);
		Msg2Faction(FactionBook[nRoute][4], "�� t�"..GetName().." Ho�n th�nh nhi�m v� s� m�n nh�n ���c m�nh B�ng th�ch");
	elseif a==2 and b==0 then
		Say("<color=green>"..strName.."<color>: Kh� l�m! Ng��i �� ho�n th�nh nhi�m v� c�a"..strBossTitle..", ��y l� ph�n th��ng! <enter><enter>Kinh nghi�m:"..nValue.."<enter>V�t ph�m ��c bi�t: M�t t�ch",0);
		Msg2Faction(FactionBook[nRoute][4], "�� t�"..GetName().." Ho�n th�nh nhi�m v� s� m�n nh�n ���c M�t t�ch");
	elseif a==0 and b==1 then
		Say("<color=green>"..strName.."<color>: Kh� l�m! Ng��i �� ho�n th�nh nhi�m v� c�a"..strBossTitle..", ��y l� ph�n th��ng! <enter><enter>Kinh nghi�m:"..nValue.."<enter>V�t ph�m ��c bi�t: L�nh b�i s� m�n",0);
		Msg2Faction(FactionBook[nRoute][4], "�� t�"..GetName().." Ho�n th�nh nhi�m v� s� m�n nh�n ���c L�nh b�i s� m�n");
	elseif a==1 and b==1 then
		Say("<color=green>"..strName.."<color>: Kh� l�m! Ng��i �� ho�n th�nh nhi�m v� c�a"..strBossTitle..", ��y l� ph�n th��ng! <enter><enter>Kinh nghi�m:"..nValue.."<enter>V�t ph�m ��c bi�t: L�nh b�i s� m�n v� m�nh B�ng th�ch",0);
		Msg2Faction(FactionBook[nRoute][4], "�� t�"..GetName().." Ho�n th�nh nhi�m v� s� m�n nh�n ���c L�nh b�i s� m�n v� m�nh B�ng th�ch");
	elseif a==2 and b==1 then
		Say("<color=green>"..strName.."<color>: Kh� l�m! Ng��i �� ho�n th�nh nhi�m v� c�a"..strBossTitle..", ��y l� ph�n th��ng! <enter><enter>Kinh nghi�m:"..nValue.."<enter>V�t ph�m ��c bi�t: L�nh b�i s� m�n v� M�t t�ch",0);
		Msg2Faction(FactionBook[nRoute][4], "�� t�"..GetName().." Ho�n th�nh nhi�m v� s� m�n nh�n ���c L�nh b�i s� m�n v� M�t t�ch");
	end;
	
	-- ���� 2 ������
	ModifyReputation(2 * multiple, 0);  
end;
  
  
-- �õ�����ļ�����Ϣ
function GetTaskClearInfo()
  
local nTaskType = GetTask(TASKTYPE_ID);
local nTask     = GetTask(TASKID_ID);
local tabTask   = GetTaskTableFile(nTaskType);
local nRow      = tabTask:selectRowNum("TaskID", nTask);

local strInfo   = "";
local strMain   = "";

	if (nTaskType==2) then
		strInfo = tabTask:getCell(nRow, "GoodsName");
		strMain = "�i thu th�p <color=yellow> "..strInfo.." <color>.";
	elseif (nTaskType==3) then
		strInfo = tabTask:getCell(nRow, "KillNpc");
		strMain = "�i gi�t <color=yellow> "..strInfo.." <color>.";	
	end;
	
	return strMain;

end;


-- �������� ID ����������Ӧ��������
function GetTaskTableFile(nTaskType)

local tabTaskFile;

	if nTaskType==1 then
		tabTaskFile = tabTalkTask;
	elseif nTaskType==2 then
		tabTaskFile = tabCollTask;
	elseif nTaskType==3 then
		tabTaskFile = tabKillTask;
	end;
	
	return tabTaskFile;
	
end;

-- ��һ����ά�����ﹹ��һ����άȨ������
-- ���������ary:table ���飬nCol:int ���������������
function CreateRateArray(ary, nCol)

local aryReturn = {};
local i=0;

	for i=1, getn(ary) do
		tinsert(aryReturn, ary[i][nCol]);
	end;
	
	return aryReturn;

end;


-- ��һ�д�Ȩ�ص���������ѡ��һ��
-- ���������ary:table ��ά����
function GetRateForArray(ary)

local nRandom = 0;
local nAdd = 0;
local i,j=0

	for i=1, getn(ary) do
		nAdd = nAdd + ary[i];
	end;
	
	nRandom = random(1, nAdd);
	
	nAdd = 0;
	
	for i=1, getn(ary) do
		nAdd = nAdd + ary[i];
		if nAdd>=nRandom then
			return i+2;
		end;
	end;
	
	return 0;
	
end;


-- ������ҵȼ������������ڵĵȼ�����
function SelectPlayerLevel()

local nLevel = GetLevel();

	if nLevel<10 then return 10; end;
	
	if nLevel>100 then return 100; end;
	
	return floor(nLevel/10)*10;

end;


-- ʲôҲ�����Ŀպ���
function Main_Exit()

end;