-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- ID : 0, 2, 52

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

function wq_ox_few_003_001b()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	SetTask(101, GetTask(101)+1)			-- �������̱��Ϊ ��ǰ+1 ������ɱ��Ŀ�궼��ɺ���ֵӦ��Ϊ 5

	if (GetTask(101) == 11) then				-- Task(101) == 5 ���ʾ�����ɱ������
		CreateTrigger(4, 7, 51)				-- ������һ��������
		AddItem(2, 0, 11, 1)				-- �õ� ؤ���ܺ�
		TaskTip("Nhi�m v� ho�n th�nh quay v� Th�nh �� g�p B� ��u.")
	end
	
	-- ����������������
	
	-- ������������ʾ����
	TaskTip("Gi�t 20 t�n C�n ��, nhi�m v� ho�n th�nh.")
end