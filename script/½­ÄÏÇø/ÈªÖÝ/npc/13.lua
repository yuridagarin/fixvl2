--�ص㣺�꾩 �������������񣬽��12
--�߻���������  2004.02.28

function main()
	UWorld1401 = GetTask(1401)
if ( UWorld1401 == 80  )  then
				Talk(2,"say1401_12","L�m g� c� t�n ng��i H�n n�o? Ph�a tr��c l� <color=yellow>B� L�c V��ng K�<color> nh�ng ng��i kh�ng d� d�ng v�o ���c �� ��u!","Ta ���c m�t ng��i �y th�c ��n ��y t�m ng��i th�n v� b�n b� c�a h�.")

elseif ( UWorld1401  == 85 ) then
				Talk(1,"","N�u v�y th� ta c�ng ph�i gi� ng��i l�i.")
				
elseif ( UWorld1401  >= 100 ) then
				Talk(1,"","L�m v�y c� c�n l� c�ng b�ng kh�ng?")
else
				Talk(1,"","Ph�a tr��c l� <color=yellow>B� L�c V��ng K�<color>! Ng��i H�n kh�ng th� v�o �� ���c!")
end
end;

function  say1401_12()
	Say("Th� ra l� v�y!",2,"Quay v� g�p Nhi�u L�n ngh� c�ch/yes1401_12","D�ng 50 l��ng h�i l�./grease1401_12")
end;


function  grease1401_12()
	Say("B�n quy�t ��nh d�ng 50 l��ng h�i l� th� v� b� l�c?",2,"���c/grease1401_12yes","Ta suy ngh� l�i!/grease1401_12no")
end;

function  grease1401_12no()
	Talk(1,"","�� ta ngh� l�i ��!")
end;

function  grease1401_12yes()
			if ( GetCash() >= 500000  )  then
				    Talk(2,"","V�t v� cho c�c huynh �� qu�, ch�t ti�n tr� n��c xin nh�n cho!","Ng��i H�n c�c ng��i xem ra c�ng c� t�nh c� ngh�a! Sao ta n� t� ch�i ���c, ng��i mau ��n <color=yellow>B� L�c V��ng K�<color> h�i th�m tin t�c c�a h�.")
						Pay(500000)
				    SetTask(1401,100)
    				AddNote("��n B� L�c V��ng K� h�i th�m tin t�c c�a Ti�u Y�n Y�n v� H�n ��c Nh��ng.")
    				Msg2Player("��n B� L�c V��ng K� h�i th�m tin t�c c�a Ti�u Y�n Y�n v� H�n ��c Nh��ng.")
			elseif ( GetCash() < 500000  ) then
						Talk(1,"","H�ng r�i, ta qu�n �em theo ng�n l��ng.")						
			end
end;

function  yes1401_12()
		Talk(1,"","�� ta quay v� h�i <color=red>Nhi�u L�n<color>, xem c� c�ch n�o v��t �i kh�ng.")
    SetTask(1401,85)
		AddNote("Quay l�i h�i Nhi�u L�n t�m c�ch v��t �i.")
		Msg2Player("Quay l�i h�i Nhi�u L�n t�m c�ch v��t �i.")
		
end;
