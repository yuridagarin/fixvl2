
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �ڿ��ͼ����ű�
-- Edited by ������
-- 2005/08/26 

-- 2005/9/14���Ϸ��޸� ʯ��

-- ======================================================


function main()
	local selTab = {
				"Gi�i thi�u khu v�c b�n ��/jieshao",
				"R�i kh�i khu v�c thu th�p/leave",
				"��n Huy�n Tinh ��ng (cao c�p)/#NewWorld(721,1688,3333)",
				"��n Linh Nham ��ng (trung c�p)/#NewWorld(716,1694,3032)",
				"K�t th�c ��i tho�i/no",
				}
	Say("Mu�n ��o kho�ng �? Ch� c�n d�ng Th�n N�ng ��n ��a ��n khu v�c t��ng �ng sau �� d�ng k� n�ng ��o kho�ng",getn(selTab),selTab)
end;

function leave()
	local selTab = {
				"Th�nh ��/#NewWorld(300, 1681 ,3464)",
				"Bi�n Kinh/#NewWorld(200, 1249 ,2732)",
				"Tuy�n Ch�u/#NewWorld(100,1377,3051)",
				"Th�nh �� Ho�ng ��i Th�m (K�o t�)/#NewWorld(300,1848,3493)",
				"Bi�n Kinh th� s�n Tr��ng (Thu�c da)/#NewWorld(200,1347,3029)",
				"Tuy�n Ch�u M�c Qu�n ��o tr��ng (T�p linh)/#NewWorld(100,1393,2969)",
				"Tuy�n Ch�u L�m D��c S� (H�i thu�c)/#NewWorld(100,1555,2961)",
				"Tuy�n Ch�u L� Phong Thu (Canh t�c)/#NewWorld(100,1603,2968)",
				"Bi�n Kinh L�u Nh�t Ph� (��n g�)/#NewWorld(200,1220,2909)",
				"Kh�ng �i ��u c�!/no",
				}
	Say("Mu�n tr� v� sao? B�t ���c nhi�u m� qu�, ph�t t�i nh� ��ng qu�n ta!",getn(selTab),selTab)
end;


function jieshao()
	Say("Th�ch M�n ��ng l� khu v�c kho�ng th�ch s� c�p. B�n tr�i ph�a tr�n c� nhi�u <color=yellow>Tinh thi�t c�p 1<color>, b�n ph�i l� <color=yellow>B�ch luy�n cang c�p 2<color>. B�n tr�i ph�a d��i c� <color=yellow>� kim c�p 3<color>, b�n ph�i l� <color=yellow>H�n thi�t c�p 4<color>.",0)
end;


function no()
end;


