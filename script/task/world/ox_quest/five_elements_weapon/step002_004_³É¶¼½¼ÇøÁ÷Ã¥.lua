-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- ID : 0, 1, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("L�u Manh", "green")..":"
quest_title = cf_ox_SetColor("Th�m d�", "yellow").."\n"
quest_detail = cf_ox_SetColor("Quay l�i B� ��u � Th�nh �� h�i b�o.", "gray").."\n\n"
quest_description_1 = quest_giver.."Xin tha m�ng�B�t c�c ti�u th� h�m �� c�ng ch� l� l�m theo m�nh l�nh c�a Bang ch� v� L�o ��i, lo�i nh�i nh�p nh� ta ch� bi�t l�m theo. � \n h�m ��n ch� Ch�u gia ta ta c�n ph�t hi�n�a..�au qu��c�u..."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_002_004()
	if (random(1,100) <= 10) then				-- ɱ����å���� 10% �ļ����������

		-- �����Ǵ������Ʋ���
		RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
		CreateTrigger(4, 6, 51)					-- ������һ��������
		SetTask(101, 8)
	
		-- ����������������
		ModifyExp(100)							-- ������Ҿ��齱��
	
		-- ������������ʾ����
		TaskTip("Quay l�i B� ��u � Th�nh �� h�i b�o.")
		Say(quest_title..quest_detail..quest_description_1, 0)

	else
		Msg2Player("B�n kh�ng nh�n ���c tin t�c n�o")
	end
end