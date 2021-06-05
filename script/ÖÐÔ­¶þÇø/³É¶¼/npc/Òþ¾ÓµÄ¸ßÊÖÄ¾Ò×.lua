function main()
	UWorld1508 = GetTask(1508)
	UWorld500 = GetTask(500)
	if ( UWorld1508 == 45 and  UWorld500 == 0 )  then
		Talk(1,"","Ng��i �o�n ���c ta l� ng��i m� L�ng Nhi c�m h�n. Chuy�n n�y n�i ra d�i d�ng l�m. 10 n�m tr��c ta v� cha l� huynh �� k�t ngh�a � C�i Bang. ��m Th� Lang �ang � ngo�i th�nh, b�ng h�u h�y c�n th�n!")
		Say("Con c�a ta l�n ra ngo�i ch�i k�t qu� l� b� �u Th� Lang tha �i! Mong ng��i gi�p ta b�o th�!",2,"��ng �/yes1508","Ta c�n ch�t vi�c/no1508")
	elseif ( UWorld1508  == 5 and  GetItemCount(2,1,3) > 9)  then	
		Talk(1,"","B�ng h�u qu� nhi�n v� ngh� cao c��ng, tho�ng ch�c �� di�t tr� ��m Th� Lang! ��y l� ch�t l�ng th�nh c�a ti�u d�n, xin h�y nh�n l�y!")
		SetTask(1508,10)
		DelItem(2,1,3,10)
		AddItem(2,1,1,1)
		Earn(1)
		ModifyExp(1)
		AddNote("Ho�n th�nh nhi�m v� gi�p Tr��ng ��i Th�m ��nh �u Th� Lang")
		Msg2Player("Ho�n th�nh nhi�m v� gi�p Tr��ng ��i Th�m ��nh �u Th� Lang")
	elseif ( UWorld1508  ==10  and  GetItemCount(2,1,3)<= 9  )  then
		Talk(1,"","��m �u Th� Lang �ang � ngo�i th�nh, ng��i h�y c�n th�n!")
	else
		Talk(1,"","�i con c�a ta! Sao con c� ham ch�i m�i.")
	end
end;

function yes1508 ()
		Talk(1,"","Ng��i h�y ra ngo�i th�nh ��nh �u Th� Lang v� �em 10 Lang Nha v�, nh� th� con ta m�i ���c nh�m m�t!")
		SetTask(1508,5)
		AddNote("Nh�n nhi�m v� gi�p Tr��ng ��i Th�m ti�u di�t Th� Lang")
		Msg2Player("Nh�n nhi�m v� gi�p Tr��ng ��i Th�m ti�u di�t Th� Lang")
end;

function no1508 ()
		Talk(1,"","B�ng h�u b�n vi�c ta kh�ng th� mi�n c��ng!")
end;
