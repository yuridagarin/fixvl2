-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- id : 4, 12, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Ch� Ti�m v� kh�", "green")..":"
quest_title = cf_ox_SetColor("Thu�c t�nh v� kh�", "yellow").."\n"
quest_detail = cf_ox_SetColor("��i tho�i v�i th� r�n Bi�n Kinh.", "gray").."\n\n"
quest_description_1 = quest_giver.."L�c ta c�n nh� trong th�n c�ng x�y ra m�t l�n kinh ho�ng, Ph�a sau n�i, n�i th�n c�t nh�ng thi th� b�ng nhi�n m�c l�n nh�ng lo�i c�y l� r�i n� hoa r�t ��p. M�t ng�y sau �� nh�ng ��a hoa n�y t�n �i v� thi c�t b�t ��u xu�t hi�n t�c lo�n kh�p n�i. Cha ta c� ��n Thi�u L�m T� c�u c�u ���c c�c v� s� t�ng ch� gi�o d�ng Kim Cang H� Nha kh�m n�m v�o v� kh� c� th� tr� ���c b�n y�u qu�i kia."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_005_001()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	CreateTrigger(4, 13, 51)					-- ������һ��������
	SetTask(101, 15)
	
	-- ����������������
	ModifyExp(200)							-- ������Ҿ��齱��
		
	-- ������������ʾ����
	TaskTip("��i tho�i v�i th� r�n Bi�n Kinh.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end