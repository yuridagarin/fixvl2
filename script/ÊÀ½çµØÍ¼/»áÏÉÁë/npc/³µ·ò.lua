
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��ľ��ͼ����ű�
-- Edited by ������
-- 2005/08/26 

-- 2005/9/14���Ϸ��޸� ����

-- ======================================================


function main()
	local selTab = {
				"Gi�i thi�u khu v�c b�n ��/jieshao",
				"R�i kh�i khu v�c thu th�p/leave",
				"��n Th��ng Long L�nh (cao c�p)/#NewWorld(720,1705,3350)",
				"��n H�ng An L�nh (s� c�p)/#NewWorld(710,1707,3385)",
				"K�t th�c ��i tho�i/no",
				}
	Say("Mu�n ��n c�y �? Ch� c�n d�ng Th�n N�ng ��n ��n n�i quy ��nh sau �� s� d�ng K� n�ng ��n c�y. T��ng t� nh� v�y cho T�p Linh",getn(selTab),selTab)
end;

function leave()
	local selTab = {
				"Th�nh ��/#NewWorld(300, 1681 ,3464)",
				"Bi�n Kinh/#NewWorld(200, 1249 ,2732)",
				"Tuy�n Ch�u/#NewWorld(100,1377,3051)",
				"Th�nh �� ��i Kho�ng C�ng (��o kho�ng)/#NewWorld(300,1836,3430)",
				"Th�nh �� Ho�ng ��i Th�m (K�o t�)/#NewWorld(300,1848,3493)",
				"Bi�n Kinh th� s�n Tr��ng (Thu�c da)/#NewWorld(200,1347,3029)",
				"Tuy�n Ch�u L�m D��c S� (H�i thu�c)/#NewWorld(100,1555,2961)",
				"Tuy�n Ch�u L� Phong Thu (Canh t�c)/#NewWorld(100,1603,2968)",
				"Ta mu�n ��n �t c�i!/no",
				}
	Say("N�m nay k� tr�ng c�y �t m� ch�t ph� c�y th� nhi�u, th�t �au l�ng�Xem b� d�ng mi c� v� ��c ch�! Mu�n �i ��u? N�i �i!",getn(selTab),selTab)
end;

function jieshao()
	Say("H�i Ti�n L�nh l� khu v�c ��n c�y s� c�p, ph�a tr�n c� <color=yellow>Ng� ��ng v� ��n T�m Sa c�p 5<color>, Ph�a d��i b�n tr�i l� <color=yellow>Tr�ng M�c v� Thanh � Linh Huy�t c�p 6<color>, ph�a d��i b�n ph�i l� <color=yellow>Thi�t Ch��ng M�c v� B�ch Huy�t Sa c�p 7<color>.",0)
end;

function no()
end;


