-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- id : 4, 53, 61

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Th�n d�n", "green")..":"
quest_title = cf_ox_SetColor("T�m b�t an", "yellow").."\n"
quest_detail = cf_ox_SetColor("Ti�p t�c di�t Heo r�ng", "gray").."\n\n"
quest_description_1 = quest_giver.."Ta v�n c� c�m gi�c b�t an, d��ng nh� Heo r�ng v�n c�n quanh qu�n ��u ��y."
quest_confirm = ""
quest_cancel = ""

function wq_ox_obt_001_005()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	CreateTrigger(0, 53, 61)
	SetTask(111, 6)

	-- ����������������
	ModifyExp(200)							-- ��������齱��
	
	-- ������������ʾ����
	TaskTip("Ti�p t�c di�t Heo r�ng")
	Say(quest_title..quest_detail..quest_description_1, 0)
end