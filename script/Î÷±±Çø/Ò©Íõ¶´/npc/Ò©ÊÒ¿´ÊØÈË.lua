-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ҩ����NPCҩ�ҿ�����Script
-- By StarryNight
-- 2007/08/06 PM 9:00

-- ���������ܣ�������ϼӰ�~~~~

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online_activites\\2014_02\\shazhongjin.lua")

function main()
	if VET_201402_TASK:GetTask(VET_201402_TASK.TASK) == 4 then
		VET_201402_TASK:SetTask(VET_201402_TASK.TASK, 5);
		Say("B�n ng��i c�y l�m ta ng�a m�t, h�y ti�u di�t ch�ng, ta c�m th�y vui ta s� truy�n b� thu�t. \n<color=gold>ti�u di�t 99 ng��i c�y<color>", 0);
		TaskTip("Ti�u di�t 99 ng��i c�y");
		return 
	end

	local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);


	---------------------------------- ������19��֧1_10�����----------------------------------
	
	----�Ѿ���ȡ���񵫻�δȡ������װ�뿴���˶Ի�
	if nStep_XBTask_01 == 46 then
		task_019_06_1();
		return
	end
	
	--�Ѿ�ȡ������װ��ˢ��ҩ��
	if nStep_XBTask_01 == 47 then
		task_019_06_0();
		return
	end
	
	--�Ѿ�ɱ��ҩ�����ؿ��ӿڿ���
	if nStep_XBTask_01 == 48 then
		task_019_06_2();
		return
	end
	
	--һ������µĶԻ�
	local strTalk = {
		"D��c th�t th� v�:? (�m thanh qu�i d�) ...%##@!#!? ()!*&)@#",
		"Con ng��i kh� hi�u�"
		}
	
	TalkEx("",strTalk);
	return

end;
