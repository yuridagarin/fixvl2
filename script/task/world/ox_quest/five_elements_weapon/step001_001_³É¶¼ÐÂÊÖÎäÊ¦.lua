-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- ID : 4, 1, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("V� s�", "green")..":"
quest_title = cf_ox_SetColor("B�t Qu�i �n_C�n", "yellow").."\n"
quest_detail = cf_ox_SetColor("�i t�m Ch� L�i ��i � Th�nh �� �� h�i th�m v� m�n v�t c� nh�ng v�t kh�c th�n b�", "gray").."\n\n"
quest_description_1 = quest_giver.."Kh�ng bi�t bao gi� ��i ti�u th� m�i t�m ���c m�t anh h�ng c�i th� �� k�t th�n ��y! Thi�n h� sao b�y gi� ai c�ng v� c�ng k�m th� kh�ng bi�t \n �!H�m qua �ng ch� h�nh nh� c� n�i l� nh�t ���c v�t g� c� kh�c nh�ng h�nh th� k� b�, nh�ng h�i ra kh�ng ai nh�n"
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_001_001()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	CreateTrigger(4, 2, 51)					-- ������һ��������
	SetTask(101, 2)
	
	-- ����������������
	
	-- ������������ʾ����
	TaskTip("�i t�m Ch� L�i ��i � Th�nh �� �� h�i th�m v� m�n v�t c� nh�ng v�t kh�c th�n b�")
	Say(quest_title..quest_detail..quest_description_1, 0)
end