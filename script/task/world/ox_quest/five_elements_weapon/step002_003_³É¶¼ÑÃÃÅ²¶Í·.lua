-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- ID : 4, 5, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("B� ��u", "green")..":"
quest_title = cf_ox_SetColor("B�t c�c", "yellow").."\n"
quest_detail = cf_ox_SetColor("�i t�m b�n L�u manh ngo�i th�nh th�m d� tin t�c.", "gray").."\n\n"
quest_description_1 = quest_giver.."B�n ch�ng c�n ch�nh l� mi�ng ng�c n�y, xem ra c�ng ��ng gi� ��, c� l� ta nh� quan ph� gi� h� th� t�t h�n. Hi�n gi� b�n l�u manh b�n ngo�i Th�nh �� �ang n�o lo�n. Ch�ng ta h�y �i b�t v�i t�n �em v� l�y kh�u cung �� t�m ra manh m�i."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_002_003()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	CreateTrigger(0, 1, 51)					-- ������һ��������
	SetTask(101, 7)
	
	-- ����������������
	DelItem(2, 0, 9, 1)						-- ɾ������������ ����ӡ��Ǭ
	ModifyExp(100)							-- ������Ҿ��齱��
	
	-- ������������ʾ����
	TaskTip("�i t�m b�n L�u manh ngo�i th�nh th�m d� tin t�c.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end