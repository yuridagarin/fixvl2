-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- id : 0, 51, 61

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

function wq_ox_obt_001_002()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	CreateTrigger(4, 52, 61)
	--SetTask(111, 3)

	-- ����������������
	AddItem(2, 0, 13, 1)					-- �õ�������� ��ʧ�İ���
	
	-- ������������ʾ����
	TaskTip("��a g�i h�ng cho th�n d�n.")
end