-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- id : 4, 51, 61

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Th�n d�n", "green")..":"
quest_title = cf_ox_SetColor("N�n Heo r�ng", "yellow").."\n"
quest_detail = cf_ox_SetColor("�i v� h��ng t�y nam t�m t�i h�ng cho th�n d�n.", "gray").."\n\n"
quest_description_1 = quest_giver.."A! ��i hi�p! \n s�ng nay l�c ho�ng lo�n ta �� l�m m�t t�i h�ng, bao nhi�u v�n li�ng ��u � trong ��."
quest_confirm = ""
quest_cancel = ""

function wq_ox_obt_001_001()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	CreateTrigger(0, 51, 61)
	SetTask(111, 2)

	-- ����������������
	
	-- ������������ʾ����
	TaskTip("�i v� h��ng t�y nam t�m t�i h�ng cho th�n d�n.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end