--����  
--�ص㣺�꾩 �������������񣬽��1
--�߻���������  2004.02.28
szNpcName = "<color=green>Ti�u nh�<color>: "

Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");

function main()
	if GetWorldPos() == 200 then
		if GetTaskTrans() == 1 then		
			trans_talk_03()
			return
		end
	end	
	UWorld1401 = GetTask(1401)
	if ( UWorld1401 == 0 and  GetLevel() >= 15  )  then
		Talk(1,"say1401_1","G�n ��y sao nghi�u ng��i qua l�i v�y?")
	elseif ( UWorld1401  == 5 ) then
		Talk(1,"","Ng��i nh�n ta l�m g�? �i h�i <color=red>Nh�n s� giang h�<color> b�n kia �i!")
	elseif ( GetLevel() < 15  )  then
		Talk(1,"","Nh�n ng��i l� bi�t m�i ch�p ch�ng b��c ch�n v�o giang h�, luy�n th�m m�t th�i gian ta s� n�i ng��i nghe m�t <color=red>b� m�t ��ng tr�i<color>!")
	else
		Talk(1,"","Nh�n ng��i l� bi�t �i t�m kho b�u � Nh�n M�n quan, c�n mu�n gi�u ta �? ��n b�n ti�m ta s� n�i ng��i nghe tin t�c v� kho b�u.")
	end
end;

function  say1401_1()
	Say("V� kh�ch quan n�y qu� nhi�n tinh m�t, kh�ng gi�u g� ��y l� b� m�t l�n nh�ng ph�i t�n <color=red>15 Kim<color>!",2,"��a 15 Kim cho h�n/yes1401_1","Ti�u nh� g� k� v�y!/no1401_1")
end;

function  yes1401_1()
	if ( GetCash() >= 150000  )  then
	    Talk(2,"","B� m�t l�n v�y m� c� 15 Kim th�i sao!","Kh�ch quan! S� ti�n �� kh�ng oan u�ng ch�t n�o. Nghe n�i <color=yellow>m�nh S�n H� X� T�c<color> ��t nhi�n l�i xu�t hi�n, c� th� ti�u nh�n kh�ng r�, ng�i th� h�i <color=red>Nh�n s� giang h�<color> xem!")
			Pay(150000)
	    SetTask(1401,5)
	    ModifyReputation(4,0)
			--AddNote("��������--���������񣬿�ʼ��")
			Msg2Player("Nhi�m v� ch� tuy�n - Thi�n M�n tr�n")
	elseif ( GetCash() < 150000  ) then
			Talk(1,"","Tr�i! Xem b� d�ng ng��i m�t xu d�nh t�i c�ng kh�ng c� �?")						
	end
end;

function  no1401_1()
		Talk(2,"","Chuy�n nh� v�y sao ��ng 15 Kim!","U�ng qu� b� m�t l�n n�i ai nghe b�y gi�?")
end;
