function main (sel)
		UWorld1505 = GetTask(1505)
			if (UWorld1505 == 5) then 
			  Talk(1,"","L�m gi�o ��u k�u ng��i t�i thuy�t ph�c ta ph�i kh�ng? Ta c�ng mu�n h�c v� nh�ng ph�i ch�m s�c m� gi� sao an t�m b�i s� ���c!")
			  Talk(1,"","V�y ph�i l�m sao?")
			  Talk(1,"","Vi�c n�y kh�ng kh� ta c� m�t huynh tr��ng t�n T�n Khi�m hi�n � ph� ��ng Bi�n Kinh, n�u ng��i khuy�n ���c anh ta v� ch�m s�c m� gi� th� ta an t�m b�i s�.")
			  Talk(1,"","���c th�i!")
			  SetTask(1505,10)
						elseif ( UWorld1505  ==  10)  then
								Talk(1,"","Nh� ��ng l�m ta th�t v�ng nh�!")
									elseif ( UWorld1505  == 15 )  then	
											Talk(1,"","T�t qu�! Huynh tr��ng ��ng � vi�c ch�m s�c m� r�i �? Ta c� th� y�n t�m b�i s� r�i. ��y c� ch�t l� v�t xin nh�n cho!")
													SetTask(1505,20)
													    --AddItem(0,0,0)
 													    Earn(300)
													    ModifyExp(300)
													    ModifyReputation(3,0)
													    
													    else
													    		Talk(1,"","B�ch thi�n, hi�u vi ti�n.")
end
end;
		  	
