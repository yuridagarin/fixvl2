-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- id : 4, 101, 71

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Ch� ti�m nh�", "green")..":"
quest_title = cf_ox_SetColor("Thanh Kh� L�c Minh", "yellow").."\n"
quest_detail = cf_ox_SetColor("Mang b�nh n�y ��n d�ng su�i ph�a t�y b�c �� l�y n��c.", "gray").."\n\n"
quest_description_1 = quest_giver.."Tr� c�a ta � ��y c�c k� ngon, u�ng v�o c� th� gi�i ��c, t�ng c��ng sinh l�c l�i ho�n to�n mi�n ph�. \n Ch� c�n ng��i ��n su�i Thanh Kh� � t�y b�c �em v� cho ta b�nh n��c, ta s� t�ng ng��i m�t b�nh tr� ngon."
quest_confirm = ""
quest_cancel = ""

function wq_ox_tbb_001_001()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	SetTask(121, 2)
	--CreateTrigger(0, 102, 71)

	-- ����������������
	AddItem(2, 0, 15, 1)					-- ���������� Сƿ��
	
	-- ������������ʾ����
	TaskTip("Mang b�nh n�y ��n d�ng su�i ph�a t�y b�c �� l�y n��c.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end