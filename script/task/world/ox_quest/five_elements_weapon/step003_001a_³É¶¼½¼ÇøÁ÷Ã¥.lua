-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- ID : 0, 2, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

function wq_ox_few_003_001a()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	SetTask(101, GetTask(101)+1)			-- �������̱��Ϊ ��ǰ+1 ������ɱ��Ŀ�궼��ɺ���ֵӦ��Ϊ 11

	if (GetTask(101) == 11) then				-- Task(101) == 5 ���ʾ�����ɱ������
		CreateTrigger(4, 7, 51)
		AddItem(2, 0, 11, 1)				-- �õ� ؤ���ܺ�
		TaskTip("Nhi�m v� ho�n th�nh quay v� Th�nh �� g�p B� ��u.")
	end
	
	-- ����������������
	
	-- ������������ʾ����
	TaskTip("Gi�t 30 t�n l�u manh, nhi�m v� ho�n th�nh.")
end