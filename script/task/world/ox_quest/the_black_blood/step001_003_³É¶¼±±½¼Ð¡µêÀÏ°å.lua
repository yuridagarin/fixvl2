-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- id : 4, 102, 71

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Ch� ti�m nh�", "green")..":"
quest_title = cf_ox_SetColor("Thanh Kh� L�c Minh", "yellow").."\n"
quest_detail = cf_ox_SetColor("Nh�n ���c ph�n th��ng*2 �i�m kinh nghi�m.", "gray").."\n\n"
quest_description_1 = quest_giver.."Lo�i tr� n�y ���c l�y t� D��c V��ng ��ng ���c pha ch� v�i n��c t� d�ng su�i M�ng V�n. U�ng v�o gi�p t�ng c��ng sinh l�c, tinh th�ng minh m�n. N�u t�m �� nguy�n li�u, ta c� th� gi�p ng��i ch� bi�n."
quest_confirm = ""
quest_cancel = ""

function wq_ox_tbb_001_003()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	SetTask(121, 4)
	--CreateTrigger(0, 101, 71)

	-- ����������������
	DelItem(2, 0, 15, 1)					-- ɾ��������� Сƿ��
	ModifyExp(200)							-- ���齱��
	DoubleExpCount(GetLevel()*100)			-- ˫�����齱��
	
	-- ������������ʾ����
	TaskTip("Nh�n ���c ph�n th��ng*2 �i�m kinh nghi�m.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end