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

function main()

local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);


	---------------------------------- ������17��֧1_8����֮��----------------------------------
	
	
	--��ȥҩ�˲�ѡ��
	if nStep_XBTask_01 == 36 then
		task_017_03_0();
		return
	end
	
	--��δ��ҩ�˲ݴ���ŷ��ǰ��
	if nStep_XBTask_01 == 37 then
		task_017_03_2();
		return
	end
	
	--��������ˮ������ҩ�˲�
	if nStep_XBTask_01 == 41 then
		task_018_07_0();
		return
	end
	
	--һ������µĶԻ�
	local strTalk = {
		"Ta l� m�t c�ng c�.",
		"H�nh nh� c� ti�ng ng��i, th�t k� l� �m thanh n�y ph�t ra t� ��u?",
		"(*^__^*) Hihi�",
		}
	
	TalkEx("",strTalk);
	return
	
end;
