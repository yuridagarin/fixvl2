-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- id : 4, 106, 72

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("��a b� ��ng th��ng", "green")..":"
quest_title = cf_ox_SetColor("M�u �en", "yellow").."\n"
quest_detail = cf_ox_SetColor("Gi�t 30 Th� x�m.", "gray").."\n\n"
quest_description_1 = quest_giver.."Ti�u t� n�y h�m qua b�t v� m�t con Th� x�m, t� t� c�a n� �� b� th� c�n. H�m nay v�n c�n ��ng l�i v�i v�t m�u �en. Phi�n b�ng h�u ra ngo�i th�n gi�t m�t s� Th� x�m �em v� tr� th��ng."
quest_confirm = ""
quest_cancel = ""

function wq_ox_tbb_002_002()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	CreateTrigger(0, 101, 72)
	SetTask(122, 3)

	-- ����������������
	ModifyExp(200)							-- ���齱��
	
	-- ������������ʾ����
	TaskTip("Gi�t 30 Th� x�m.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end