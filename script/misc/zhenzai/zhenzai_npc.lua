-- ����NPC

function main()
	Talk(2, "next_talk", "<color=green>��i s� C�u Ph�c<color>: <color=red>Ng�y 12 th�ng 5 n�m 2008<color>, l� ng�y qu�c tang nh�ng n�n nh�n b� ch�t trong tr�n ��ng ��t t�i T� Xuy�n. Ng��i ch�i c�a V� L�m Truy�n K� 2 ch�c ch�n c�ng r�t �au l�ng. C� th� c�ng s� r�t y�u �u�i tr��c tai n�n �e d�a sinh m�ng, nh�ng ch� c�n ch�ng ta c� t�m l�ng hi�p tr�, th� s� c� d�ng kh� v��t qua. C�ng t�c c�u tr� ph�i ���c tri�n khai t�ng gi�, ch�ng ta ch� c� th� � h�u ph��ng v� s� gi�p �� r�t �t, nh�ng h�y ��ng l�ng c�u ph�c cho h�, �� nh�ng ng��i b� n�n ���c ti�p th�m s�c m�nh c� th� v��t qua kh� kh�n.", "<color=green>��i s� C�u Ph�c<color>: Ch�ng t�i mong r�ng khi b�n �y th�c b�y b�n, s� s�a th��ng hi�u b�y b�n th�nh <color=yellow>'C�u cho nh�ng ng��i b� n�n'<color>, �� kh�ng kh� trong th� gi�i tr� ch�i c�a ch�ng ta c�ng th�m �m �p t�nh ng��i. �� c�m �n m�i ng��i �� tham gia, s� c� 4 gi� th�i gian B�ch C�u �y th�c t�ng cao hi�u qu�. (N�u hi�u qu� �y th�c hi�n gi� l� x1, th� s� t�ng th�nh x2, n�u hi�u qu� x2, th� s� t�ng th�nh x3, c� nh� th� t�nh)")
end

function next_talk()
	Say("<color=green>��i s� C�u Ph�c<color>: <color=yellow>Ng��i ch�i c�p 70 tr� l�n<color>, c� th� nh�n danh hi�u <color=yellow>'��ng T�m V��t Kh�'<color> � ch� ta (m� danh hi�u, m�i m�t ph�t s� nh�n ���c ph�n th��ng kinh nghi�m). D�ng h�nh ��ng �� bi�u ��t t�m � c�a m�nh, hy v�ng c� th� g�nh v�c m�t ph�n c�ng v�i ng��i b� n�n, ch�ng l�i thi�n tai, v��t qua kh� kh�n. <color=yellow>Sau 23: 00 ng�y 25 th�ng 5, s� ng�ng ph�t th��ng.<color>", 2, "Nh�n danh hi�u/get_title", "R�i kh�i/no_say")
end

function get_title()
	if GetLevel() < 70 then
		Say("<color=green>��i s� C�u Ph�c<color>: <color=yellow>Ng��i ch�i c�p 70 tr� l�n<color>, c� th� nh�n danh hi�u <color=yellow>'��ng T�m V��t Kh�'<color> � ch� ta (m� danh hi�u, m�i m�t ph�t s� nh�n ���c ph�n th��ng kinh nghi�m). D�ng h�nh ��ng �� bi�u ��t t�m � c�a m�nh, hy v�ng c� th� g�nh v�c m�t ph�n c�ng v�i ng��i b� n�n, ch�ng l�i thi�n tai, v��t qua kh� kh�n.", 0)
		return
	end
	
	if IsTitleExist(3,4) > 0 then
		Say("<color=green>��i s� C�u Ph�c<color>: B�n �� nh�n danh hi�u n�y.",0)
		return
	end
	
	if AddTitle(3, 4) > 0 then
		SetCurTitle(3, 4)
		Say("<color=green>��i s� C�u Ph�c<color>: B�n nh�n ���c danh hi�u <color=yellow>'��ng T�m V��t Kh�'<color>.", 0)
	end
end

function no_say()
end