-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ���Ż���NPC���˵����ص���Script
-- By StarryNight
-- 2007/08/07 PM 09:58

-- ������ĸ���ɣ�����һ�Ĳ�ֵ��

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask_02 = GetTask(TASK_XB_ID_02);

	---------------------------------- ������24��֧2_1����ԩ��----------------------------------
	
	--����Ż��������˵����ص��ӶԻ�
	if nStep_XBTask_02 == 1 then
		task_024_02_0();
		return
	end
	
	--��δ���������ͷ��������������ص��ӶԻ�
	if nStep_XBTask_02 == 2 then
		task_024_02_1();
		return
	end
	
	--���ɵ��������˵����ص���
	if nStep_XBTask_02 == 3 then
		task_024_04_0();
		return
	end
	
	--δ����Թ��֮�������˵ĵ��ӶԻ�
	if nStep_XBTask_02 == 4 then
		task_024_04_1();
		return
	end
	
	--����Թ��֮�������˵����ص��ӶԻ�
	if nStep_XBTask_02 == 5 then
		task_024_05_0();
		return
	end
	
	--��δ����Ҷ����Թ��֮��һ��
		if nStep_XBTask_02 == 6 then
		task_024_05_1();
		return
	end
	
	
	--һ������µĶԻ�
	local strTalk = {
		"�au qu�~~!? (*^_^*) hihi�..",
		}
	
	TalkEx("",strTalk);
	return
	
end;
