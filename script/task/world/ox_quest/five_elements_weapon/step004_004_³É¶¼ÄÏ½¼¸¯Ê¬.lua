-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- id : 0, 5, 53

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

function wq_ox_few_004_004()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	CreateTrigger(4, 11, 53)					-- ������һ��������
	
	-- ����������������
		
	-- ������������ʾ����
	TaskTip("Ho�n th�nh nhi�n v� quay v� Giang T�n th�n g�p v� binh.")
end