-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- id : 4, 10, 53

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Binh s�", "green")..":"
quest_title = cf_ox_SetColor("Qu�i �� kh�ng", "yellow").."\n"
quest_detail = cf_ox_SetColor("Gi�t 1 H� Thi", "gray").."\n\n"
quest_description_1 = quest_giver.."��m qu�i n�y kh�ng kh�ng ng�ng l�ng h�nh, s�c l�c ch�ng ta l�i c� h�n. Kh�ng bi�t Ng��ic� d�m kh� tr� ch�ng kh�ng?"
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_004_003()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	CreateTrigger(0, 5, 53)					-- ������һ����������ɱ��ʬ
	
	-- ����������������
		
	-- ������������ʾ����
	TaskTip("Gi�t 1 H� Thi")
	Say(quest_title..quest_detail..quest_description_1, 0)
end