function main()
	UWorld1508 = GetTask(1508)
	if  (UWorld1508 == 10  or UWorld1508 == 11 ) then
		Say("Hi�n gi� ch�a c� b�nh bao th�t, hay l� ng��i mua cho Thu�n Oa v�i bao rau h� �i!",2,"Mua bao rau h�/yes1508","Mua b�nh bao th�t/no1508")
	elseif ( UWorld1508  >= 15 and  UWorld1508  < 20 )  then
		Talk(1,"","Kh�ng c� th�t heo ta kh�ng th� l�m b�nh bao th�t r�i!")
	elseif ( UWorld1508  == 20 and  GetItemCount(1,3,3) >= 1)  then
		Talk(1,"","Qu� nhi�n l� ng��i t�t! B�nh bao n�y ta l�m cho ng��i. Mau v� b�o cho ng��i nh� L�ng Nhi. H�! C�n nh� m� m�t d�y th�, l�n l�n l�m sao n�n ng��i.")
		SetTask(1508,25)
		DelItem(1,3,3,1)
		Earn(1)
		ModifyExp(1)
		Msg2Player("H�i tung t�ch c�a L�ng Nhi")
		AddNote("H�i tung t�ch c�a L�ng Nhi")
	else
		Talk(1,"","B�nh bao ��y! B�nh bao m�i ra l� ��y!")
	end
end;

function yes1508 ()
		i=GetCash()
		if i >= 1000 then 	
			Talk(1,"","Bao rau h� c�a ng��i ��y!")
			Msg2Player("Nh�n ���c bao rau h�!")
			SetTask(1508,11)
		else
			Talk(1,"","3 bao rau h� 50 ��ng! Ng��i kh�ng �� ti�n r�i!")
		end
end;

function no1508 ()
		Talk(1,"","V�y ���c! Ng��i h�y t�m Th� m� Tr�nh mua m�t �t th�t heo.")
		SetTask(1508,15)
end;
