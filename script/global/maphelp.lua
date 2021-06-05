-- filename��s2map_ask.lua
-- By:Xsjcs
-- ������Ҳ�ѯ�����ص�
---------------------------------------------
lv_str = {	"T�n th�"," tr�n c�p 5","v�a qua c�p 10","h�n c�p 10","v�a qua c�p 20","h�n c�p 20","v�a qua c�p 30","h�n c�p 30","v�a qua c�p 40","h�n c�p 40","Cao th� c�p 50","Tuy�t h�o cao th�"}
dangernpc = {	"Th� tr�ng, Th� x�m","L�u manh, C�n ��","S�i x�m, S�i xanh, Thi�t Gi�p tr�ng","Heo r�ng, Ong v�ng, B�ch Nh�t ti�n","Tr�m v�t, D�i, M� h�u, Ki�m kh�ch","Phi t�c, �ao hi�p, H�","N� Ki�m kh�ch, Tuy�t qu�i","S�i �i�n, Ng��i l�n, Qu�, Nh�n, N� Hi�p Kh�ch, B�t Ph� H� ��ng s�, M�c Nh�n, Quan s�","Y�u H�, S�n t�c, Danh Th��ng Hi�p, Ki�m s�t, D�i H�t m�u, Nh�n K�nh x�, �ao tuy�t, Thi�n L� Ti�u, Ki�m cu�ng, ��ng Nh�n, Ki�m tuy�t, �ao Kh�ch","��a s�t, Huy�n V� �ao, Cung Li�p, N� Ki�m h�o, Li�u Ti�n binh, B� kho�i, Li�u �ao binh, T�ng Ti�n binh, T�ng �ao binh","Thi�n s�t, T�ng Th��ng qu�n, B�ng qu�i, C� quan M�c Nh�n, M�t th�m, Th��ng qu�n Li�u, H� Y Nh�n, ��ng �ao Kh�ch, Huy�n V� Ki�m, �ao Kh�ch hoang m�c","C�c NPc c�p 100, nh� Ki�m T�, Th��ng cu�ng"}
helpmap = {	"Khu v�c xung quanh Th�nh ��, Khu v�c xung quanh Bi�n Kinh",
		"Khu v�c ven Th�nh ��, Khu v�c ven Bi�n Kinh",
		"Khu v�c ven Nam m�n Th�nh ��, Khu v�c ven ��ng m�n Bi�n Kinh, H�nh Hoa th�n, xung quanh C�i Bang, xung quanh Nga My ph�i",
		"Xung quanh Thi�u L�m, xung quanh Nga My, xung quanh V� �ang, ch�n Ph�c Ng�u s�n, b�n ngo�i H�nh Hoa th�n",
		"Xung quanh c�c ��i m�n ph�i",
		"Xung quanh c�c ��i m�n ph�i",
		"Xung quanh c�c ��i m�n ph�i, B�ng T�m ��ng t�ng 1",
		"T��ng V�n ��ng, D��ng Trung ��ng t�ng 2 tr�i,Ch�n Thanh Th�nh s�n, Th�t Tinh ��ng t�ng 1, Thi�u L�m M�t th�t t�ng 1, B�ng T�m ��ng t�ng 1",
		"T��ng V�n ��ng, D��ng Trung ��ng t�ng 1 v� 2, Th�t Tinh ��ng t�ng 1, Thi�u L�m M�t th�t t�ng 1, B�ng T�m ��ng t�ng 1, Tr�c Ty ��ng t�ng 1, L��ng S�n B�c",
		"D��ng Trung ��ng t�ng 3, Th�t Tinh ��ng t�ng 2, Thi�u L�m M�t th�t t�ng 2, Kim Quang ��ng, Ki�m M�n quan, Nh�n M�n quan",
		"Kim Quang ��ng, D��ng Trung ��ng, Thi�u L�m M�t th�t t�ng 2, Kim Quang ��ng, Nh� Long S�n, Ki�m M�n quan, Nh�n M�n quan",
		"C�c s�n ��ng th�n b�, S�n tr�i, M�t ��o, Huy�t c�c"
	}

function maphp()
	lvl = floor(GetLevel()/5 + 1)
	if (lvl>12) then 
		lvl=12;
	end;
	Talk(3,"","��i v�i <color=red>"..lv_str[lvl].."<color> nh� ng��i, th� ��a �i�m luy�n c�ng th�ch h�p nh�t l� <color=red>"..helpmap[lvl].."<color>. <enter>T�i nh�ng n�i ��, t�t nh�t ng��i n�n ��nh <color=red>"..dangernpc[lvl].."<color>.","M�c d� hi�n t�i ng��i �� r�t m�nh, nh�ng ta v�n �� ngh� ng��i <color=red>n�n t� ��i v�i nhi�u ng��i kh�c<color> �� t�ng th�m s� an to�n v� hi�u qu� luy�n c�ng!","<color=red>Ph�i h�t s�c ch� �<color>: M�i khu v�c luy�n c�ng ph�n b� <color=red>h�n t�p<color> c�c lo�i qu�i. V� v�y ��i v�i nh�ng lo�i c� t�n <color=red>m�u ��<color>, <color=blue>m�u xanh<color> v� <color=yellow>m�u v�ng<color> th� kh�ng n�n ��n ��c chi�n ��u v�i ch�ng! <enter>Sau khi <color=red>�� c� v� kh� ng� h�nh<color> + <color=red>��ng c�p t��ng ���ng 40<color> v� ho�n th�nh nhi�m v� t��ng ���ng, ng��i c� th� ��n <color=green>Phong ��<color>, <color=green>Giang T�n th�n<color> �� luy�n c�ng v�i c�c qu�i v�t <color=red>�m t�nh<color>")
end;