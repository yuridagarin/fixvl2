-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- id : 4, 107, 72

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("��a b� ��ng th��ng", "green")..":"
quest_title = cf_ox_SetColor("M�u �en", "yellow").."\n"
quest_detail = cf_ox_SetColor("��n Nga My h�i th�m v� v�t m�u �en", "gray").."\n\n"
quest_description_1 = quest_giver.."Nghe n�i D��ng Nguy�t s� � Nga My tinh th�ng y thu�t, nh� b�ng h�u ��n �� h�i xem c�ch tr� li�u."
quest_confirm = ""
quest_cancel = ""

function wq_ox_tbb_002_002()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	SetTask(122, 5)
	--CreateTrigger(0, 101, 71)

	-- ����������������
	ModifyExp(200)							-- ���齱��
	AddItem(2, 0, 16, 1)					-- ������� ��ɫ��Ѫ
	
	-- ������������ʾ����
	TaskTip("��n Nga My h�i th�m v� v�t m�u �en")
	Say(quest_title..quest_detail..quest_description_1, 0)
end