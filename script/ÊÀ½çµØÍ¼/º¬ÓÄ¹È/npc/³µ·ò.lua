
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��ҩ��ͼ����ű�
-- Edited by ������
-- 2005/08/26 

-- 2005/9/14���Ϸ��޸� ����

-- ======================================================
function main()
	local selTab = {
				"Gi�i thi�u khu v�c b�n ��/jieshao",
				"R�i kh�i khu v�c thu th�p/leave",
				"��n Hi�n Vi�n C�c (cao c�p)/#NewWorld(724,1721,3386)",
				"��n Nam H�e C�c (s� c�p)/#NewWorld(714,1511,3004)",
				"K�t th�c ��i tho�i/no",
				}
	Say("Mu�n h�i thu�c �? Ch� c�n s� d�ng Th�n N�ng ��n ��a ��n khu v�c t��ng �ng sau �� d�ng K� n�ng h�i thu�c",getn(selTab),selTab)
end;

function leave()
	local selTab = {
				"Th�nh ��/#NewWorld(300, 1681 ,3464)",
				"Bi�n Kinh/#NewWorld(200, 1249 ,2732)",
				"Tuy�n Ch�u/#NewWorld(100,1377,3051)",
				"Th�nh �� ��i Kho�ng C�ng (��o kho�ng)/#NewWorld(300,1836,3430)",
				"Th�nh �� Ho�ng ��i Th�m (K�o t�)/#NewWorld(300,1848,3493)",
				"Bi�n Kinh th� s�n Tr��ng (Thu�c da)/#NewWorld(200,1347,3029)",
				"Tuy�n Ch�u M�c Qu�n ��o tr��ng (T�p linh)/#NewWorld(100,1393,2969)",
				"Tuy�n Ch�u L� Phong Thu (Canh t�c)/#NewWorld(100,1603,2968)",
				"Bi�n Kinh L�u Nh�t Ph� (��n g�)/#NewWorld(200,1220,2909)",
				"N�n l�i tr� chuy�n c�ng ta!/no",
				}
	Say("Mu�n tr� v� sao? Sao kh�ng n�n l�i c�ng l�o phu tr� chuy�n? Ph�i ch�ng �� h�i ���c thu�c qu� n�n v�i v� �i b�n?",getn(selTab),selTab)
end;


function jieshao()
	Say("H�m U c�c l� khu v�c h�i thu�c trung c�p. N�i ��y tr�i ph�i ph�a tr�n c� nhi�u <color=yellow> X�c ve c�p 5<color>. B�n tr�i ph�a d��i m�c ��y <color=yellow>�i�n th�t c�p 6<color>, c�n b�n ph�i l� n�i xu�t hi�n c�a <color=yellow>Xuy�n s�n gi�p c�p 7<color>.",0)
end;


function no()
end;


