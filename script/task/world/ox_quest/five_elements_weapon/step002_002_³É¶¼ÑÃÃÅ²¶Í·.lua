-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- ID : 4, 4, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("B� ��u", "green")..":"
quest_title = cf_ox_SetColor("B�t c�c", "yellow").."\n"
quest_detail = cf_ox_SetColor("��i tho�i v�i B� ��u � Th�nh ��", "gray").."\n\n"
quest_description_1 = quest_giver.."Ng��i ch�nh l� v� Ng��itrong cu�c t� v� ch�n hi�n t� h�m ��? ��i ti�u th� b� b�t c�c ng��i �� c� c�ch g� ch�a? Ta ngh� ng��i b�t c�c ti�u th� l� m�t trong ��m g�y r�i ��."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_002_002()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	CreateTrigger(4, 5, 51)					-- ������һ��������
	SetTask(101, 6)
	
	-- ����������������
	ModifyExp(100)							-- ������Ҿ��齱��
	
	-- ������������ʾ����
	TaskTip("��i tho�i v�i B� ��u � Th�nh ��")
	Say(quest_title..quest_detail..quest_description_1, 0)
end