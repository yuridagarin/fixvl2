-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- id : 4, 8, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("B� ��u", "green")..":"
quest_title = cf_ox_SetColor("Th�ng b�o tin t�c", "yellow").."\n"
quest_detail = cf_ox_SetColor("��n Giang T�n th�n ��i tho�i v�i tr��ng v� binh", "gray").."\n\n"
quest_description_1 = quest_giver.."��c kh� � Giang T�n th�n ng�y c�ng n�ng n�c, kh�ng ai c� th� ch�u ��ng n�i. \n Nh� b�ng h�u ��n sai nha b�m b�o, ta ngh� chuy�n n�y c� li�n quan ��n m�y t�n L�u manh ��."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_004_001()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	CreateTrigger(4, 9, 51)					-- ������һ��������
	SetTask(101, 13)
	
	-- ����������������
	AddItem(2, 0, 17, 1)					-- ��ͷ����
	
	-- ������������ʾ����
	TaskTip("��n Giang T�n th�n ��i tho�i v�i tr��ng v� binh")
	Say(quest_title..quest_detail..quest_description_1, 0)
end