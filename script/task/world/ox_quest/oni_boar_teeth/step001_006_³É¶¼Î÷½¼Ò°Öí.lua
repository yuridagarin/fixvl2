-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- id : 0, 53, 61

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

function wq_ox_obt_001_006()
	if (random(1,100) <= 10) then
		-- �����Ǵ������Ʋ���
		RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
		CreateTrigger(4, 54, 61)
		--SetTask(111, 7)

		-- ����������������
		AddItem(2, 0, 14, 1)					-- ���������� Ұ�����
		
		-- ������������ʾ����
		TaskTip("Nhi�m v� di�t Heo r�ng ho�n th�nh quay v� g�p Th�n D�n")
	else
		Msg2Player("Heo r�ng �� l�m cho d�n l�ng ho�ng s�.")
	end
end