--�꾩������������
--������ 2004.01.26

function main (sel)
  UWorld1505 = GetTask(1505)
  if(GetLevel() > 4 and  UWorld1505 == 0) then
	 		Say("V� c�ng ta tuy cao nh�ng v�n ch�a t�m ���c cao ��, ti�u huynh �� gi�p ta m�t chuy�n ���c kh�ng?",2,"���c!/yes1505","Ta b�n r�i!/no1505")
 	elseif (GetLevel() > 4 and  UWorld1505 == 5) then
 			Talk(1,"","T�n �c �ang � Bi�n Kinh ph�, phi�n ti�u huynh ��!")
 	elseif (GetLevel() > 4 and  UWorld1505 == 10) then
 			Talk(1,"","Ta nghe n�i T�n Khi�m �ang � ph� ��ng Bi�n Kinh, phi�n ti�u huynh ��!")
 	elseif (GetLevel() > 4 and  UWorld1505 == 15) then
 			Talk(1,"","��i tho�i v�i T�n Khi�m ch�a? Xem ra �� t� ta c� hy v�ng r�i!")
 	elseif (GetLevel() > 4 and  UWorld1505 == 20) then
 			Talk(1,"","Ti�u huynh �� gi�p gi�i khoay sau n�y ta nh�t ��nh b�o ��p!")
 	else
 			Talk(1,"","�i! V� c�ng ta tuy cao nh�ng ��n gi� v�n ch�a c� m�t �� ��, sao ��y?")
 	end
end;
 	
 	function yes1505()
 		Talk(1,"","Kh� kh�n l�m m�i t�m ���c m�t ng��i t� ch�t t�t, h�n t�n T�n �c nh�ng kh�ng ch�u b�i ta l�m s� ph�, gi� sao ��y?")
 		Talk(1,"","Ng�i y�n t�m �� t�i h� �i khuy�n h�n!")
 		SetTask(1505,5)
 	end
 	
 	function no1505()
 		Talk(1,"","N�u ti�u huynh �� b�n th� ta nh� ng��i kh�c v�y!")
 	end
 			
  
