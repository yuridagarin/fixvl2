-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ɳĮ�Թ�NPC������Script
-- By StarryNight
-- 2007/08/04 AM 11:59

-- ���Ȱ����Ȱ�����

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);


	---------------------------------- ������18��֧1_9�ƺ�����----------------------------------
	
	
	--��ȡ�˲ɼ�����������
	if nStep_XBTask_01 == 40 then
		task_018_04_0();
		return
	end
	
	--һ������µĶԻ�
	local strTalk = {
		"Ta l� T�ch D��ng c�n.",
		"H�nh nh� c� ti�ng ng��i, th�t k� l� �m thanh n�y ph�t ra t� ��u?",
		"(*^__^*) Hihi�",
		}
	
	TalkEx("",strTalk);
	return
	
end;
