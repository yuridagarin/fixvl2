
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �ո���ͼ����ű�
-- Edited by ������
-- 2005/08/26 

-- 2005/9/14���Ϸ��޸� ��ˮ

-- ======================================================


function main()
	local selTab = {
				"Gi�i thi�u khu v�c b�n ��/jieshao",
				"R�i kh�i khu v�c thu th�p/leave",
				"��n L�m Nh�c Th�n (cao c�p)/#NewWorld(723,1700,3448)",
				"��n Doanh D�n Th�n (trung c�p)/#NewWorld(718,1708,3405)",
				"K�t th�c ��i tho�i/no",
				}
	Say("Mu�n canh t�c �? Ch� c�n d�ng Th�n N�ng ��n ��a ��n khu v�c t��ng �ng sau �� d�ng k� n�ng canh t�c",getn(selTab),selTab)
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
				"Tuy�n Ch�u L�m D��c S� (H�i thu�c)/#NewWorld(100,1555,2961)",
				"Bi�n Kinh L�u Nh�t Ph� (��n g�)/#NewWorld(200,1220,2909)",
				"Kh�ng �i ��u c�!/no",
				}
	Say("G�n ��y l�ng ta m�a thu�n gi� h�a, thu ho�ch ng�y c�ng ���c m�a. Ng��i ��n canh t�c l� l��t, xa phu ta c�ng ph�i t�t b�t ng�y ��m! Kh�ch quan mu�n ��n n�i n�o?",getn(selTab),selTab)	
end;


function jieshao()
	Say("Thanh Th�y th�n l� khu v�c canh t�c s� c�p. B�n tr�i ph�a tr�n c� m�c nhi�u <color=yellow>Quang Th�ng Ma v� M�c nh� c�p 1<color>, b�n ph�i l� <color=yellow>Khuynh ly ��u v� Th�ch khu�n c�p 2<color>. B�n tr�i ph�a d��i m�c ��y <color=yellow>Nhi�u minh ��u c�p 3, M�ng tr�c<color>, b�n ph�i l� <color=yellow>Dung tr�ch c�c, H� Ti�u c�p 4<color>.",0)
end;


function no()
end;


