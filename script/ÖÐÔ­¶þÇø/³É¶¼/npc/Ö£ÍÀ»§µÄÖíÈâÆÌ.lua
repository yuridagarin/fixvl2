function main()
	UWorld1508 = GetTask(1508)
	if  UWorld1508 == 15   then
		Say("Th�t heo 50 ��ng m�t c�n, ng��i mua bao nhi�u?",2,"Mua 1 c�n th�t heo!/yes1508","Kh�ng mua!/no1508")
	else
		Talk(1,"","Tr�nh m� ta m� heo �� 20 n�m, ���c m�i ng��i phong cho bi�t hi�u l� Tr�n Quan T�y coi nh� c�ng kh�ng u�ng ki�p n�y! Nh�ng b�y gi� c� chuy�n x�y ra, e r�ng ��n ta c�ng kh�ng b�n ���c th�t heo.")
	end
end;

function yes1508 ()
		i=GetCash()
		if i >= 50 then 
			AddItem(1,3,3,1)	
			Talk(1,"","��y m�t c�n th�t heo! C�m �n kh�ch quan.")
			SetTask(1508,20)
			Msg2Player("B�n nh�n ���c th�t heo!")
			AddNote("�em th�t heo ��a cho ��ng Mu�i l�m b�nh bao th�t")
			
		else
			Talk(1,"","B�n ti�m kh�ng b�n thi�u, kh�ch quan c� ti�n th� h�y ��n.")
		end
end;

function no1508 ()
	Talk(1,"","Kh� kh�! Ng��i t��ng l� 10 n�m tr��c? Hi�n gi� ngo�i th�nh ma qu� l�ng h�nh, c� Th�nh �� ch� c� ti�m n�y b�n th�t heo, xem ng��i �i ��u t�m ��y!")
end;
