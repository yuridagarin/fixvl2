-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ���踮NPC��ͷScript
-- By StarryNight
-- 2007/06/20 AM 10:54

-- ���˶�Ҫ��

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

	---------------------------------- ������07�ж��----------------------------------
	
	--ѯ��Ԭ��������
	if nStep_XBTask == 34 then
		task_007_03_0();
		return
	end
	
	--δ��Ԭ������ȥ��ҩ
	if nStep_XBTask == 35 then
		task_007_03_1();
		return
	end
	
	---------------------------------- ������20��֧1_11������թ----------------------------------
	--����貶��Ի�ѯ��Ԭ��������
	if nStep_XBTask_01 == 52 then
		task_020_03_0();
		return
	end
	
	--��δɱ���������ӺͲ���Ի�
	if nStep_XBTask_01 == 53 then
		task_020_03_1();
		return
	end
	
	--һ������µĶԻ�
	local strTalk = {
		"B� ��u: L�m B� ��u quan tr�ng nh�t l� g�?",
		"L� g� n�o?",
		"���ng nhi�n l� 2 ch� trung ngh�a! Ta lu�n noi theo g��ng Vi�n Phi V�n B� ��u!"
		}
	
	TalkEx("",strTalk);
	return
	
end;
