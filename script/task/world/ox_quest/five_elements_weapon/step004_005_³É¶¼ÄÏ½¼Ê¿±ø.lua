-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- ID : 4, 11, 53

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Binh s�", "green")..":"
quest_title = cf_ox_SetColor("Qu�i �� kh�ng", "yellow").."\n"
quest_detail = cf_ox_SetColor("Gi�t 1 H� Thi", "gray").."\n\n"
quest_description_1 = quest_giver.."May m� l�n n�y c� b�ng h�u t��ng tr�, ch�t th��ng d��c n�y xin nh�n cho!"
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_004_005()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	--CreateTrigger(4, 11, 53)				-- ������һ����������ѭ������δ����
	
	-- ����������������
	AddItem(1, 0, 2, 4)						-- ������� 4 ƿ��ɢ
	AddItem(1, 0, 3, 1)						-- ������� 1 ƿֹѪɢ
	AddItem(1, 0, 7, 4)						-- ������� 4 ƿС����
	AddItem(1, 0, 8, 1)						-- ������� 4 ƿ������
	ModifyExp(200)							-- ������Ҿ��齱��
		
	-- ������������ʾ����
end