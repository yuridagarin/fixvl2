--08���ڻָ�Ͻű�
--by vivi
--2008/01/15

function OnUse()
	local strtab = {
				"Li�n quan ��n vi�c n�ng c�p Linh Kh� trang b� B�t Qu�i/about_bagua",
				"Li�n quan ��n ho�t ��ng ch�c t�t m�a xu�n/about_bainian",
				"Li�n quan ��n ho�t ��ng h�p th�nh Thanh ��ng/about_qingtongqi",
				"Li�n quan ��n ho�t ��ng nh�n h�ng bao n�m m�i/about_hongbao",
				"Li�n quan ��n ho�t ��ng ��i C�nh K� � Tuy�n Ch�u B�c/about_pk",
				"T�a �� nh�n v�t ho�t ��ng/about_npc",
				"��ng h��ng d�n/nothing"
				};
	Say("C�c h� mu�n t�m hi�u ph��ng di�n n�o?",
			getn(strtab),
			strtab)
end

function about_bagua()
	Talk(1,"about_bagua2","Ch� c� th� n�ng c�p linh kh� cho <color=green>trang b� ch�a kh�m n�m linh kh�<color>, <color=yellow> trang b� kh�c c�n ph�i n�ng c�p. Ch� �: <color>\n<color=green>b� trang b� B�t Qu�i<color> ph�i ���c r� ra th�nh <color=green>trang b� B�t Qu�i<color>. Ch� �: ph�i <color=green>cho v�o 10000 gi� tr� m�i �� ��m b�o th�o r�i kh�ng g�y t�n th�t cho trang b�<color>, nh� s�p x�p kho�ng tr�ng v� s�c l�c trong h�nh trang, ph� th�o r�i <color=green>b� trang b� B�t Qu�i<color> tr� cho �� t� c�a s� ph� L�u, m�i ng��i ch� c� <color=green>3 l�n<color> c� h�i nh�n ti�n b�i th��ng.");
end

function about_bagua2()
	Talk(1,"about_bagua3","<color=green>Trang b� B�t Qu�i tr�n 80 linh kh�<color> ���c <color=green>mi�n ph� t�ch l�y Linh th�ch<color>, tr� l�i <color=green>to�n b� linh th�ch kh�m tr�n trang b� (thu�c t�nh Linh th�ch v� linh kh� ch�n l� kh�ng ��i, tr� linh kh� s� t� t� dao ��ng), trang b� linh kh� (ch�a k�ch ho�t, tr� s� trang b� nh� s�c c�ng k�ch v� kh� kh�ng ��i), Th�i H� B�t Qu�i ti�u hao khi k�ch ho�t trang b� B�t Qu�i<color> t� ch� �� t� c�a th� r�n L�u.");
end

function about_bagua3()
	Talk(1,"OnUse","Trang b� linh kh� <color=green>l�n h�n ho�c b�ng 91<color> <color=green>mi�n ph� ng�u nhi�n t�ng gi�i h�n linh kh� 10, 12, 14, 16, 18, 20 �i�m<color>, cao nh�t ��n 120 (v� kh� c�ng k�ch kh�ng ��i), n�u t�n <color=green>2 V� Ng�n Th�y<color> s� t�ng 20 �i�m tr� linh kh�. Ch� �: trang b� c�p 8, c�p 9 c� ���c trong k� n�ng s�ng � ho�t ��ng m�a xu�n s� kh�ng th� t�ng.")
end

function about_bainian()
	Talk(1,"about_bainian2","M�i ng�y t� 9 gi� s�ng s� b�t ��u g�i nhi�m v� ch�c t�t, ng��i ch�i c�p 10 tr� l�n c� th� nh�n nhi�m v� t�i Ni�n S�. Sau khi ho�n th�nh nhi�m v� ch�c t�t, tr� v� �� nh�n ph�n th��ng th�ch h�p. \n n�a ti�ng s� g�i 1 l�n nhi�m v�, n�u ch�a ho�n th�nh ho�c b� nhi�m v� c� th� ho�n th�nh v�o l�n sau.")
end

function about_bainian2()
	Talk(1,"OnUse","Sau khi ch�c t�t xong, c� th� nh�n ph�n th��ng cu�i c�ng � ch� Ni�n S�. Ch� �: Ng��i ��u ti�n ho�n th�nh nhi�m v� ch�c t�t t�t c� m�i ng��i ���c g�p ��i ph�n th��ng. Ng��i th� nh� ��n ng��i th� 5 ho�n th�nh nhi�m v� ���c 1.6 ph�n th��ng, ng��i th� s�u ��n ng��i th� 10 ���c 1.2 ph�n th��ng. M�i ng��i ph�i nhanh ch�ng ho�n th�nh. \n N�u kh�ng h�i l�ng b�ng x�p h�ng l�n n�y, c� th� tham gia l�i v�o l�n sau. Nh�ng khi �� nh�n ph�n th��ng th� kh�ng ���c tham gia n�a.")
end

function about_qingtongqi()
	Talk(1,"OnUse","Ho�t ��ng n�m m�i: ��nh qu�i s� c� c� h�i nh�n ���c nguy�n li�u h�p th�nh Thanh ��ng ��nh. Ch� �: ��ng c�p qu�i v�t c�ng cao, b�n m�i c� th� nh�n ���c nguy�n li�u c�ng t�t. Nguy�n li�u t�t nh�t ch� c� � ch� minh ch� B�c L�c L�m, Th��ng Th�n Doanh Thi�n v� L�nh H��ng L�ng. \n Ng� C�c c�ng c� b�n 1 s� nguy�n li�u nh� v� kh� Thanh ��ng, c� th� nh�n ���c b�t k� nguy�n li�u n�o. \n L�c n�y s� d�ng B�ch C�u ho�n, c� th� nh�n ���c 1 v�i nguy�n li�u ho�t ��ng. \n mua Thanh ��ng � Ng� C�c s� ng�u nhi�n nh�n ���c m�nh Thanh ��ng, 2000 m�nh thanh ��ng �� ��i ���c ph�n th��ng t�i Ni�n S�.")
end

function about_hongbao()
	Talk(1,"OnUse","N�m m�i ��n, h� th�ng chu�n b� cho m�i ng��i ��i h�ng bao: g�i v�o l�c 9:00, 13:00, 19:30, 21: 30 m�i ng�y, ��n s�m nh�n tr��c. Ch� �: ng��i nh�n ��i h�ng bao ph�i t� c�p 70 tr� l�n. Ngo�i th�i gian �� ra c� th� nh�n ���c ti�u h�ng bao. Ai c�ng c� ph�n. M�i ng��i ch� nh�n ���c 1 h�ng bao m�i ng�y.")
end

function about_pk()
	Talk(1,"OnUse","Th�i gian ho�t ��ng m�a xu�n, Tuy�n Ch�u ph� B�c l� khu v�c PK l� t��ng, kh�ng c� tr�ng ph�t PK, c� th� ��n b�t k� n�i n�o trong khu v�c n�y, t�t c� ��i sang tr�ng th�i �� s�t, kh�ng th� t� ��i.")
end

function about_npc()
	Talk(1,"OnUse","Ni�n S� xu�t hi�n � Bi�n Kinh, Th�nh ��, Tuy�n Ch�u, T��ng D��ng, D��ng Ch�u, ��i L�, t�o ��: \nBi�n Kinh 145, 178\nTh�nh �� 206, 222\nTuy�n Ch�u 180, 175\nT��ng D��ng 182, 185\nD��ng Ch�u 209, 196\n��i L� 195, 185")
end


function nothing()

end