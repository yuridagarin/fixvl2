-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

function OnUse()
	local mapid, mapx, mapy = GetWorldPos() 
	
	if ((mapid == 308) and (mapx > 1406) and (mapx < 1418) and (mapy > 2957) and (mapy < 2973)) then
		-- �����Ǵ������Ʋ���
		--RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
		CreateTrigger(4, 102, 71)
		SetTask(121, 3)

		-- ����������������
	
		-- ������������ʾ����
		Msg2Player("�em n��c ��n cho �ng ch� qu�n tr�")
		TaskTip("�em n��c ��n cho �ng ch� qu�n tr�")
	else
		Msg2Player("D�ng c�i b�nh n�y m�i c� th� l�y ���c n��c � su�i Thanh Kh�")
	end
end