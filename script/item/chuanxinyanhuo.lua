-- ====================== �ļ���Ϣ ====================== 
                                                          
-- ������ԵonlineII ͨ���������̻��ļ�                 
-- Edited by starry night                                 
-- 2005/11/28 PM 17:40                                    
                                                          
-- ======================================================

--����ͨ������ͷ�ļ�
Include("\\script\\task\\killer\\killer_head.lua");

function OnUse() 

	local nMapID = GetWorldPos();
	
	if GetPKEnmityState() > 0 then
		Talk(1,"end_dialog"," � tr�ng th�i so t�i kh�ng cho ph�p d�ng v�t ph�m n�y!")
		return
	end	

	if GetFightState() == 1 and nMapID < 700 then
		Say("B�n x�c nh�n mu�n g�i 1 Nh�t Ph�m ���ng s�t th� ra gi�p s�c cho b�n?",
				2,
				"���c/yes",
				"Kh�ng c�n/no")
	else
		Talk(1,"","B�n ch� c� th� s� d�ng v�t ph�m n�y � ngo�i th�nh!");
	
	end;
end;

function yes()
	if GetPKEnmityState() > 0 then
		Talk(1,"end_dialog"," � tr�ng th�i so t�i kh�ng cho ph�p d�ng v�t ph�m n�y!")
		return
	end	
	if GetFightState() ~= 1 then
		Talk(1,"","B�n ch� c� th� s� d�ng v�t ph�m n�y � ngo�i th�nh!");
		return
	end

	local nLastUseTime = GetTask(TASK_USEYANHUO_TIME);
	local nNowTime = GetTime();
	local nTime = nNowTime - nLastUseTime;
	local nRemainTime = nTime;
	local strTime = "";
		
		nTime = 900 - nTime;
		
		if nTime < 0 then
			nTime = 0;
		end;
		
		strTime = TurnTime(nTime);
		
		if nRemainTime < 900 then
			Say("Kh�ng th� li�n t�c s� d�ng v�t ph�m n�y trong <color=yellow>15<color> ph�t. (Th�i gian s� d�ng c�n"..strTime..")",0);
			return
		end;
	
	local nDelOk = DelItem(2,1,203,1,1);
	
		if nDelOk ~=1 then 
			return
		end;
		
		DoFireworks(808,1);--�̻�Ч��
	
	local nTopKillerName,nTopKillerMode = GetTopKillerData();
	local nMapID,nWx,nWy = GetWorldPos(); 
	local nTopKillerIndex = CreateNpc(nTopKillerMode,nTopKillerName,nMapID,nWx,nWy,-1,1,1,100);
	
		SetTask(TASK_USEYANHUO_TIME,nNowTime);
		
		--�����ڸõ�ͼ����ɱ������ʱ��ΪһСʱ	
		SetNpcLifeTime(nTopKillerIndex,3600);  

		--���ö���ɱ�ֽű�
		SetNpcScript(nTopKillerIndex,"\\script\\task\\killer\\killer_talk_top.lua");
		
		TaskTip("Ph�i h� g�c t�n s�t th� ��u m�c n�y trong v�ng 60 ph�t!"); 
	
end;

function no()

end;