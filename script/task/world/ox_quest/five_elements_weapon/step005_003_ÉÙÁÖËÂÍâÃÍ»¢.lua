-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- Index : 28

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

function wq_ox_few_005_003()
	if (random(1,100) <= 5) then
		-- �����Ǵ������Ʋ���
		RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
		SetTask(101, 17)
	
		-- ����������������
		AddItem(2, 0, 12, 1)					-- �������������ߡ���ջ���
		
		-- ������������ʾ����
		TaskTip("B�n nh�n ���c Kim Cang H� Nha.")
	else
		Msg2Player("B�n �� h� s�t ���c 1 m�nh h�, nh�ng ch�a l�y ���c Kim Cang H� Nha.")
	end
end