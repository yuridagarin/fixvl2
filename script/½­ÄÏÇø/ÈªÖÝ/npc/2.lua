--����
--�ص㣺�꾩 �������Ź�������2
--�߻���������  2004.03.

function main()
UWorld1401 = GetTask(1401)
	if ( UWorld1401 == 5  )  then
		Talk(1,"say1401_2","G�n ��y, Bi�n Kinh c� nhi�u Nh�n s� giang h� qua l�i, d�m h�i c� chuy�n g� s�p x�y ra?")

	elseif ( UWorld1401  == 10 and GetItemCount(2,1,19) >= 20 ) then
			
		if  DelItem(2,1,19,20) == 1 then
						    Talk(3,"","Nghe n�i <color=yellow>B�n �� S�n H� X� T�c<color> truy�n thuy�t �� xu�t hi�n � <color=red>Nh�n M�n quan<color>. Thi�n h� ��u �� ��n n�i n�y!","D�m h�i t�m <color=yellow>B�n �� S�n H� X� T�c<color> r�t cu�c l� b�o v�t g�?","Ta kh�ng r�! Nh�ng bang ch� c�a ta �t s� bi�t chuy�n n�y! H�y ��n t�u l�u t�m <color=red>T�o ��i L�c<color> Kim Ng�u bang bang ch� h�i th�m c� s�!")
						    SetTask(1401,15)
						    ----AddItem(0,0,0)
						    --Earn(10000)
						    ModifyExp(10000)
						    AddNote("Bi�t ���c tin t�c B�n �� S�n H� X� T�c nh�ng c�n ph�i �i�u tra k� l��ng!")
						    Msg2Player("Bi�t ���c tin t�c B�n �� S�n H� X� T�c nh�ng c�n ph�i �i�u tra k� l��ng!")
		else
							 Talk(1,"","Chuy�n giao v�t ph�m kh�ng th�nh c�ng")
		end

	elseif ( UWorld1401  == 10 and GetItemCount(2,1,19) < 20 ) then
				Talk(1,"","H�y ��n ch�n n�i � <color=red>Thi�u L�m t�<color> gi�t <color=red>H� d�<color>. Ta c�n <color=red>20 c�i �u�i h�<color> �� ng�m r��u!")
	elseif ( UWorld1401  == 15  ) then
				Talk(1,"","��n t�u l�u t�m <color=red>T�o ��i L�c<color> Kim Ng�u bang bang ch� h�i th�m!")
	else
				Talk(1,"","Sao ng�y n�o c�ng c� nhi�u ng��i ��n t�m ta th� n�y!? Phi�n ch�t �i ���c!")
	end
end;

function  say1401_2()
		Say("���c! Ta s� cho ng��i bi�t! Nh�ng��i da! Ta l�i th�m nh�m H� V� T�u n�a r�i! H�y gi�p ta l�y v� <color=red>20 c�i �u�i h�<color> �� ng�m r��u!",2,"��ng �/yes1401_2","Kh�ng gi�p/no1401_2")
end;

function  yes1401_2()
		Talk(2,"","Ch�t vi�c m�n h�y �� t�i h� ra tay! Ch�ng phi�n ��i ca ph�i ��ch th�n ��ng th�!","Ra T�y m�n Bi�n Kinh ph� l� <color=red>Thi�u L�m t�<color>. C� nhi�u <color=red>H� d�<color>. H�y c�n th�n!")
		SetTask(1401,10)
		AddNote("Gi�p Nh�n s� giang h� thu th�p 20 c�i �u�i h� �� bi�t th�m tin t�c!")
		Msg2Player("Gi�p Nh�n s� giang h� thu th�p 20 c�i �u�i h� �� bi�t th�m tin t�c!")
end;

function  no1401_2()
	Talk(1,"","Ta c� ch�t chuy�n! Xin ��i ca h�y nh� ng��i kh�c!")
end;
