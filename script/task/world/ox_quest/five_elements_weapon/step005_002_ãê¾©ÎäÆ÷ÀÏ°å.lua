-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- id : 4, 13, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Ch� Ti�m v� kh�", "green")..":"
quest_title = cf_ox_SetColor("Thu�c t�nh v� kh�", "yellow").."\n"
quest_detail = cf_ox_SetColor("T�m 20 Tinh Thi�t, 10 Tr�ng M�c, 1 Kim Cang H� Nha v� cho th� r�n Bi�n Kinh.", "gray").."\n\n"
quest_description_1 = quest_giver.."N�u t�m �� c�c nguy�n li�u ta s� gi�p ng��i ch� t�o v� kh� Ph�c Ma. \n Thi�u L�m T� {H�} c� th� t�m ���c Kim Cang H� Nha, ngo�i Th�nh �� {Heo r�ng} c� th� t�m ���c Tinh Thi�t, Nga My s�n {Ong v�ng} c� th� t�m ���c Tr�ng M�c."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_005_002()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	CreateTrigger(0, 4, 52)
	CreateTrigger(4, 14, 51)					-- ������һ��������
	SetTask(101, 16)
	
	-- ����������������
	ModifyExp(200)							-- ������Ҿ��齱��
		
	-- ������������ʾ����
	TaskTip("T�m 20 Tinh Thi�t, 10 Tr�ng M�c, 1 Kim Cang H� Nha v� cho th� r�n Bi�n Kinh.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end