-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- ID : 4, 2, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Ch� l�i ��i", "green")..":"
quest_title = cf_ox_SetColor("B�t Qu�i �n_C�n", "yellow").."\n"
quest_detail = cf_ox_SetColor("Nh�n ���c B�t qu�i �n-C�n.", "gray").."\n\n"
quest_description_1 = quest_giver.."Ng��i ��n t�m mi�ng ng�c c� kh�c ch� g� gi�ng ch� c�n ph�i kh�ng? \nH�? C�ng kh�ng ph�i c�a ng��i? Nh�ng th�i! C�a ai c�ng ���c. T�ng cho ng��i ��! Ta kh�ng quan t�m n�a!"
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_001_002()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	SetTask(101, 3)							-- �������̱��Ϊ 2 ����ʾ����һ�ε�½���� playerloginin.lua �����µ�����
	
	-- ����������������
	AddItem(2, 0, 9, 1)						-- �������������� ����ӡ��Ǭ
	ModifyExp(300)							-- ������Ҿ��齱��
	
	-- ������������ʾ����
	TaskTip("Nh�n ���c B�t qu�i �n-C�n.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end