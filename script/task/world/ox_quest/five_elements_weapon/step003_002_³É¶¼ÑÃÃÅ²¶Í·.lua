-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- id : 4, 7, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("B� ��u", "green")..":"
quest_title = cf_ox_SetColor("Ti�u tr�", "yellow").."\n"
quest_detail = cf_ox_SetColor("Quay l�i Th�nh �� g�p B� ��u", "gray").."\n\n"
quest_description_1 = quest_giver.."Giang T�n th�n ng�y c�ng xu�t hi�n nhi�u C��ng Thi, l� tr�nh ��n �� ��u �� b� b� quan."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_003_002()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	CreateTrigger(4, 8, 51)					-- ������һ��������
	SetTask(101, 12)
	
	-- ����������������
	AddItem(2, 0, 10, 1)					-- ������ҵ��߽��� ����ָ
	ModifyExp(200)							-- ������Ҿ��齱��
	
	-- ������������ʾ����
	TaskTip("Quay l�i Th�nh �� g�p B� ��u")
	Say(quest_title..quest_detail..quest_description_1, 0)
end