-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- id : 0, 52, 61

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

function wq_ox_obt_001_004()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	CreateTrigger(4, 53, 61)
	--SetTask(111, 5)

	-- ����������������
	
	-- ������������ʾ����
	TaskTip("Nhi�m v� di�t Heo r�ng ho�n th�nh quay v� g�p Th�n D�n")
end