-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- ID : 4, 3, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("V� binh th�nh m�n", "green")..":"
quest_title = cf_ox_SetColor("B�t c�c", "yellow").."\n"
quest_detail = cf_ox_SetColor("T�m B� ��u � Th�nh �� h�i th�m v� v� b�t c�c.", "gray").."\n\n"
quest_description_1 = quest_giver.."Ch�u ��i nh�n v�a tr�nh b�o, canh 3 ��m qua c� m�t ng��i b�t m�t ��t nh�p b�t c�c ti�u th�, h�n c�n l�m r�i m�t mi�ng ng�c. N�u th�y ai ��ng nghi ho�c c� tin t�c g� mau ��n g�p sai nha h�i b�o."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_002_001()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	CreateTrigger(4, 4, 51)					-- ������һ��������
	SetTask(101, 5)
	
	-- ����������������
	
	-- ������������ʾ����
	TaskTip("T�m B� ��u � Th�nh �� h�i th�m v� v� b�t c�c.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end