-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- ID : 4, 6, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("B� ��u", "green")..":"
quest_title = cf_ox_SetColor("Ti�u tr�", "yellow").."\n"
quest_detail = cf_ox_SetColor("Gi�t 30 t�n l�u manh, 20 t�n C�n �� sau �� v� Th�nh �� g�p B� ��u.", "gray").."\n\n"
quest_description_1 = quest_giver.."Ng��i ra ngo�i th�nh gi�o hu�n b�n l�u manh ��, nh�n ti�n t�m th�m manh m�i."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_002_005()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	CreateTrigger(0, 2, 51)					-- ������һ�������� ɱ����å
	CreateTrigger(0, 3, 52)					-- ������һ�������� ɱ������
	SetTask(101, 9)
	
	-- ����������������
	ModifyExp(100)							-- ������Ҿ��齱��
	
	-- ������������ʾ����
	TaskTip("Gi�t 30 t�n l�u manh, 20 t�n C�n �� sau �� v� Th�nh �� g�p B� ��u.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end