-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����Ĺ����NPC��Ĺ����Script
-- By StarryNight
-- 2007/08/03 PM 08:13

-- ���ֻʣһ�н�ӡ��

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
	
	---------------------------------- ������15��֧1_6��Ĺ����----------------------------------
	--��ȡ������δ��4����Ĺ����ǰ��ʾ
	if nStep_XBTask_01 == 26 then
		task_015_03_1();
		return
	end
	
	--�Ѿ������Ĺ������δ�򵹹���
	if nStep_XBTask_01 == 27 then
		task_015_03_0();
		return
	end
	
	--�Ѿ�������� �ؿ������ӿ�
	if nStep_XBTask_01 == 28 then
		task_015_03_2();
		return
	end
	
	--һ������µĶԻ�
	local strTalk = {
		"Th� M� T��ng Qu�n:? (�m thanh qu�i d�) ...%##@!#!? ()!*&!@#",
		"Con ng��i kh� hi�u�"
		}
	
	TalkEx("",strTalk);
	return
	
end;
