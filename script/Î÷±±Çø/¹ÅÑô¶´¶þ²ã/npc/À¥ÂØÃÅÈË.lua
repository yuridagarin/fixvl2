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

function main()

local nStep_XBTask_02 = GetTask(TASK_XB_ID_02);


	--------------------------------- ������27��֧2_4��������----------------------------------
	
	--�Ѿ���ȡ���񵫻�δȡ����ľ���뿴���˶Ի�
	if nStep_XBTask_02 == 16 then
		task_027_03_1();
		return
	end
	
	--ˢ��������
	if nStep_XBTask_02 == 17 then
		task_027_03_0();
		return
	end
	
	--�Ѿ�ɱ�������ޣ��ؿ��ӿڿ���
	if nStep_XBTask_02 == 18 then
		task_027_03_2();
		return
	end
	
	--һ������µĶԻ�
	local strTalk = {
		"C� D��ng ��ng n�y th�t nguy hi�m.",
		}
	
	TalkEx("",strTalk);
	return

end;
