function main()
	UWorld1508 = GetTask(1508)
	if  UWorld1508 == 5  then
		Say("Tung t�ch L�ng Nhi �? Ta ���ng nhi�n bi�t, h�y mua cho ta 3 c�i b�nh bao th�t ta s� n�i cho nghe.",2,"Mua b�nh bao cho Thu�n Oa/yes1508","Kh�ng mua/no1508")
	elseif  UWorld1508  == 11  then	
		Talk(1,"","Ta mu�n �n b�nh bao th�t, kh�ng ph�i b�nh bao rau h�, th�i �n �� l�t d�, nh�ng ta e r�ng kh�ng �� s�c n�i chuy�n c�ng ng��i!")
		Msg2Player("��n ch� ��ng Mu�i mua 3 c�i b�nh bao th�t cho Thu�n Oa.")
	elseif ( UWorld1508  >= 10 and  UWorld1508  < 25)  then	
		Talk(1,"","Ng��i nhanh l�n 1 ch�t ���c kh�ng? Ta ��i s�p ch�t r�i n�!")
	elseif  UWorld1508  == 25   then	
		SetTask(1508,30)
		Earn(1)
		ModifyExp(1)
		Talk(1,"","T� m� s�ng ta c� th�y L�ng Nhi ra ngo�i th�nh, g�i nh�ng kh�ng th�y l�n ti�ng!")
		AddNote("Ra ngo�i th�nh t�m L�ng Nhi")
		Msg2Player("Ra ngo�i th�nh t�m L�ng Nhi")
	else
		Talk(1,"","B�nh bao th�m qu�! N�u c� th�t th� hay bi�t m�y!")
	end
end;

function yes1508 ()
		Talk(1,"","Ng��i l�m ta th�t c�m ��ng! Nh�ng ng��i ph�i nhanh l�n nh�, ta ��i qu� kh�ng c�n nh� g� n�a c�!")
		SetTask(1508,10)
		AddNote("��n ch� ��ng Mu�i mua 3 c�i b�nh bao th�t.")
		Msg2Player("��n ch� ��ng Mu�i mua 3 c�i b�nh bao th�t.")
end;

function no1508 ()
		Talk(1,"","��ng t� t�, �� th�m b�nh bao qu�!")
end;
