-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- id : 4, 54, 61

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Th�n d�n", "green")..":"
quest_title = cf_ox_SetColor("T�m b�t an", "yellow").."\n"
quest_detail = cf_ox_SetColor("Gi�p th�n d�n di�t xong Heo r�ng, nh�n ���c nguy�n li�u h�a ph�", "gray").."\n\n"
quest_description_1 = quest_giver.."L� Heo r�ng n�y c� l�m ta b�t an, may m� l�n n�y c� ng��i ra tay gi�p ��. \n Ta c� 1 quy�n b�a ch� gi� l�i c�ng kh�ng d�ng, nay t�ng ng��i. N�u ng��i c� h�ng th� v� v�n �� n�y c� th� ��n Ph� s� trong c�c th�nh th� �� h�c."
quest_confirm = ""
quest_cancel = ""

function wq_ox_obt_001_007()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	SetTask(111, 8)
	--CreateTrigger(0, 53, 61)

	-- ����������������
	ModifyExp(200)							-- ��������齱��
	AddItem(2, 2, 29, 1)					-- ���������߽��� �ݼ���
	
	-- ������������ʾ����
	TaskTip("Gi�p th�n d�n di�t xong Heo r�ng, nh�n ���c nguy�n li�u h�a ph�")
	Say(quest_title..quest_detail..quest_description_1, 0)
end