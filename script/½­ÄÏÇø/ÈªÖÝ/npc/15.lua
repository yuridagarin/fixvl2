--����
--�ص㣺�꾩��  ����������������14
--�߻���������  2004.03.


function main()
UWorld1401 = GetTask(1401) 
if ( UWorld1401 == 120 )  then
		Talk(6,"say1401_14","C� ph�i ��y l� <color=red>Ti�u Thi�n H�u<color>��i T��ng qu�n?","L� ta ��y, c� vi�c g� kh�ng?","T�i h� l� thu�c h� c�a M�c Ngh�a, c�ng bi�t ch�t v� c�ng n�n ���c ph�i ��n ��y g�p ch�t c�ng s�c ki�n c�ng l�p nghi�p.","Th�t may, ta �ang b�y Thi�n M�n tr�n �� t�n c�ng Nh�n M�n quan, t��ng so�i l�i kh�ng ��. Ng��i mau v�o <color=red>Thi�n M�n tr�n<color> thay ta l�y th� c�p th��ng t��ng qu�n T�ng, �o�t <color=yellow>B�n �� S�n H� X� T�c<color>!","T�i h� m�o mu�i h�i m�t c�u <color=yellow>B�n �� S�n H� X� T�c<color> l� g� v�y?","T�m <color=yellow>B�n �� S�n H� X� T�c<color> L� th�nh v�t ti�n �� giao cho thi�n t�. Ai m� c� ���c n� nh� n�m to�n b� thi�n h� trong tay kh�ng bi�t sao hi�n nay l�i xu�t hi�n � Nh�n M�n quan. Ta ph�i huy ��ng 10 v�n tinh binh ph� Thi�n M�n tr�n �� �o�t ���c t�m b�n �� <color=yellow>S�n H� X� T�c<color>. C� ���c n� xem nh� �ai Li�u ta n�m ���c thi�n h� r�i.","���c! T�i h� v�o <color=red>Thi�n M�n tr�n<color> nh�t ��nh s� �o�t t�m<color=red>B�n �� S�n H� X� T�c<color>!")
    
elseif ( UWorld1401  == 125 ) then
		Talk(1,"","Ch� c�n ng��i v�o <color=red>Thi�n M�n tr�n<color> l�y ���c t�m <color=red>B�n �� S�n H� X� T�c<color> ta s� tr�ng th��ng!")
elseif ( UWorld1401  == 130 or UWorld1401  == 135 ) then
		Talk(1,"","Nh� ng��i v�o<color=red>Thi�n M�n tr�n<color> l�y <color=red>B�n �� S�n H� X� T�c<color> sao c�n ch�n ch� ch�a �i?")		

else
		Talk(1,"","Tr�i s� ph� h� cho ��i Li�u ta! Ha ha ha !")
end
end;

function  say1401_14()
		Say("L�y danh hi�u phe n�o �� v�o Thi�n M�n tr�n �o�t <color=red>B�n �� S�n H� X� T�c<color>? ( sau n�y c� th� ��i l�i)",2,"T�ng Tri�u/yes1401_14","Li�u Qu�c/no1401_14")

end;

function  yes1401_14()
		Talk(1,"","L�m sao ta c� th� s�t h�i T��ng l�nh T�ng qu�n? Hay l� quay v� b�o cho l�o t��ng qu�n <color=red>D��ng Nghi�p<color> v�y.")
    SetTask(1401,130)
    ----AddItem(0,0,0)
end;

function  no1401_14()
		Talk(1,"","Th�i ���c, qu�n T�ng v� ��o nh� v�y, ta s� l�y danh l� Li�u qu�c t��ng l�nh v�o Thi�n M�n tr�n �o�t <color=red>B�n �� S�n H� X� T�c<color>.")
    SetTask(1401,125)
    ----AddItem(0,0,0)
    --Earn(10000)
    ModifyExp(10000)
    AddNote("L�y danh l� Li�u qu�c t��ng l�nh v�o Thi�n M�n tr�n �o�t B�n �� S�n H� X� T�c. (sau n�y c� th� ��i l�i)")
    Msg2Player("L�y danh l� Li�u qu�c t��ng l�nh v�o Thi�n M�n tr�n �o�t B�n �� S�n H� X� T�c. (sau n�y c� th� ��i l�i)")
end;

