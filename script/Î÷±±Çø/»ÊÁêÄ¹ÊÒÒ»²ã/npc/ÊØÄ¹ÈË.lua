-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����Ĺһ��NPC��Ĺ��Script
-- By StarryNight
-- 2007/08/03 PM 2:54

-- ����һ�׹�Ĺ��׳�����衣

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
	
	---------------------------------- ������15��֧1_6��Ĺ����----------------------------------
	--��ȡ������δ�ƻ���ˮѨǰ��ʾ
	if nStep_XBTask_01 >= 21 and nStep_XBTask_01 <= 24 then
		task_015_02_1();
		return
	end
	
	--�Ѿ��ƻ���ˮѨ��δ����Ĺ��
	if nStep_XBTask_01 == 25 then
		task_015_02_0();
		return
	end
	
	--�Ѿ�������� �ؿ������ӿ�
	if nStep_XBTask_01 == 26 then
		task_015_02_2();
		return
	end
	
	--һ������µĶԻ�
	local strTalk = {
		"Th� M� Nh�n:? (�m thanh qu�i d�) ...%##@!#!? ()!*&)@#",
		"Con ng��i kh� hi�u�"
		}
	
	TalkEx("",strTalk);
	return
	
end;
