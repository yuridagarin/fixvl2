-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- id : 4, 105, 72

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("��a b� ��ng th��ng", "green")..":"
quest_title = cf_ox_SetColor("M�u �en", "yellow").."\n"
quest_detail = cf_ox_SetColor("��n ch� th� s�n h�i th�m nguy�n nh�n ��a b� kh�c.", "gray").."\n\n"
quest_description_1 = quest_giver.."Hu hu hu� \n con kh�ng c� � m�. Hu hu gi�p con v�i ���c kh�ng�hu hu"
quest_confirm = ""
quest_cancel = ""

function wq_ox_tbb_002_001()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	CreateTrigger(4, 106, 72)
	SetTask(122, 2)

	-- ����������������
	ModifyExp(200)							-- ���齱��
	
	-- ������������ʾ����
	TaskTip("��n ch� th� s�n h�i th�m nguy�n nh�n ��a b� kh�c.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end