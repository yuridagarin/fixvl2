-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- id : 4, 52, 61

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Th�n d�n", "green")..":"
quest_title = cf_ox_SetColor("Di�t Heo r�ng", "yellow").."\n"
quest_detail = cf_ox_SetColor("Gi�p d�n l�ng di�t 20 Heo r�ng", "gray").."\n\n"
quest_description_1 = quest_giver.."V�ng n�y Heo r�ng nhi�u qu�. \n��i hi�p c� c�ch n�o ti�u tr� ch�ng kh�ng?"
quest_confirm = ""
quest_cancel = ""

function wq_ox_obt_001_003()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	CreateTrigger(0, 52, 61)
	SetTask(111, 4)

	-- ����������������
	DelItem(2, 0, 13, 1)						-- ɾ������������ ��ʧ�İ���
	ModifyExp(200)							-- ��������齱��
	
	-- ������������ʾ����
	TaskTip("Gi�p d�n l�ng di�t 20 Heo r�ng")
	Say(quest_title..quest_detail..quest_description_1, 0)
end