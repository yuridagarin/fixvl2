-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ҩ����NPCҩ�˲�Script
-- By StarryNight
-- 2007/08/04 AM 11:23

-- ����һ�Ų�~(*^__^*) ��������

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
local strTalk = {};

	---------------------------------- ������18��֧1_9�ƺ�����----------------------------------
	
	SetNpcLifeTime(index,0);
	SetNpcScript(index,"");
	
	if nStep_XBTask_01 == 41 then
	
		SetTask(KILL_YAORENBOSS_NUM,GetTask(KILL_YAORENBOSS_NUM)+1);
		
		if GetTask(KILL_YAORENBOSS_NUM) >= 5 then
			
			DelItem(2,0,725,1);--ɾȥ����ˮ
			SetTask(KILL_YAORENBOSS_NUM,0);--��������
			SetTask(TASK_XB_ID_01,42);--�ɹ�����5��ҩ�˲�
			strTalk = {
				"T�ch D��ng th�y qu� nhi�n kh�c ch� ���c ��c t�nh c�a D��c Nh�n Th�o, v�y l� �m m�u c�a D��c V��ng v� T�y H� t�m th�i b� kh�ng ch�. Chi b�ng ��n h�i �u D��ng H�a ti�n b�i b��c ti�p theo n�n l�m sao.",
				}
			TalkEx("",strTalk);
			Msg2Player("�� ti�u di�t D��c Nh�n Th�o, quay v� t�m �u D��ng ti�n b�i b�n b�c.");
			TaskTip("�� ti�u di�t D��c Nh�n Th�o, quay v� t�m �u D��ng ti�n b�i b�n b�c.");
		
		else
			
			strTalk = {
				"L�i di�t ���c 1 D��c Nh�n Th�o, xem ra T�ch D��ng th�y qu� l� c�ng hi�u, hi�n gi� �� ti�u di�t ���c "..GetTask(KILL_YAORENBOSS_NUM).." c�y, ph�i ti�u di�t 5 c�y m�i ki�m h�m ���c s� sinh s�n c�a D��c Nh�n Th�o"
				}
				
			TalkEx("",strTalk);
			
		end
		
	end

end
