-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- id : 0, 101, 72

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

function wq_ox_tbb_002_003()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	CreateTrigger(4, 107, 72)
	SetTask(122, 4)

	-- ����������������
	ModifyExp(200)							-- ���齱��
	
	-- ������������ʾ����
	TaskTip("�� gi�t 30 Th� x�m, quay v� g�p th� s�n.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end