--����
--�ص㣺�꾩 �������Ź�������7
--�߻���������  2004.03.

function main()
UWorld1401 = GetTask(1401)
	if ( UWorld1401 == 45  )  then
		Talk(5,"","Ng��i l� ai? Sao t� ti�n v�o ��y?","L�o b� sai t�i h� ��n ��y nh�n v�i l�o t��ng qu�n m�t c�u �� l�: Ti�u nh�n ���ng ��o, Thi�t m�c tr�nh c��ng","Phu nh�n th�t l� chu ��o. �� x�ng pha chi�n tr�n ta nh�t ��nh ph�i chi�n th�ng m�i tr� v�!","H�y ��n g�n qu�n doanh <color=red>Nh�n M�n quan<color> tr�ng tr� v�i t�n <color=red>Ki�u binh<color> �o�t v� <color=red>20 t�m M�u M�c B�i<color>!","T�i h� s� �i ngay!")
		SetTask(1401,50)
	elseif ( UWorld1401  == 50 and GetItemCount(2,1,64) >= 20 ) then
				if  DelItem(2,1,64,20) == 1 then
						    ----AddItem(0,0,0)
						    --Earn(10000)
						    ModifyExp(10000)							    
								AddNote("Nhi�m v� tr�ng tr� Ki�u binh ho�n th�nh.")
						    Msg2Player("Nhi�m v� tr�ng tr� Ki�u binh ho�n th�nh.")
		    
								Talk(6,"","Qu� l� kh�ng t�! C� ch�t <color=red>ph�n th��ng<color> xin nh�n cho!","B�ng h�u m�i ��n ��y b�n n�n ch�ng ch�a nh�n ra! Phi�n gi�p ta ��n Li�u qu�c th�m d� m�t chuy�n!","Nh�ng ta l� ng��i H�n l�m sao ti�p c�n ���c v�i ng��i Khi�t �an?","Nghe n�i <color=red>Bi�n Kinh ph�<color> c� m�t ng��i H�n t�n l� <color=red>H�n Tr� Nh��ng<color> k�t h�n c�ng v�i m�t thi�u n� ng��i Khi�t �an.","��n t�m <color=red>H�n Tr� Nh��ng<color>, n�i ng��i l� th�ng gia c�a �ng �y, ch�c ch�n s� ���c h�u ��i. Tranh th� thu th�p tin t�c!","���c! T�i h� s� ��n <color=red>Bi�n Kinh ph� <color> t�m <color=red>H�n Tr� Nh��ng l�o nh�n<color>.")
								SetTask(1401,55)
			else
							 Talk(1,"","Chuy�n giao v�t ph�m kh�ng th�nh c�ng")
			end
		elseif ( UWorld1401  == 50 and GetItemCount(2,1,19) < 20 ) then
						Talk(1,"","H�y ��n g�n qu�n doanh <color=red>Nh�n M�n quan<color> tr�ng tr� v�i t�n <color=red>Ki�u binh<color> �o�t v� <color=red>20 t�m M�u M�c B�i<color>!")
		elseif ( UWorld1401  == 55  ) then
						Talk(1,"","Mau ��n <color=red>Bi�n Kinh ph�<color> t�m <color=red>H�n Tr� Nh��ng<color> l�o nh�n.")
--����������������---------------------------------------------
		elseif ( UWorld1401  == 105 ) then
						Talk(5,"","B�m b�o t��ng qu�n! T�i h� v�a ���c tin Khi�t �an �� chu�n b� 10 v�n tinh binh, b�y Thi�n M�n tr�n s�p t�n c�ng Nh�n M�n quan!","C� th�t kh�ng? Ng��i nghe t� ��u v�y?","T�i h� v�a t� ch� <color=red>D��ng Di�n Huy<color> tr� v�.","C�u tr�i ph� h� cho Nhi t�! Ng��i mau quay l�i b�o cho <color=red>Di�n Huy<color> �� thi�u gia y�n t�m! M�i vi�c �� c� ta lo li�u, n�u c� th�i gian th� v� th�m ph� m�u!","T�i h� s� l�p t�c ��n <color=red>B� L�c V��ng K�<color> b�o cho <color=red>D��ng ��i nh�n <color>!")
							----AddItem(0,0,0)
						  --Earn(10000)
						  ModifyExp(10000)
							SetTask(1401,110)	    
							AddNote("Quay l�i B� L�c V��ng K� h�i b�o ph� m� M�c Ngh�a")
							Msg2Player("Quay l�i B� L�c V��ng K� h�i b�o ph� m� M�c Ngh�a")
		elseif ( UWorld1401  == 110 ) then
							Talk(1,"","Phi�n b�ng h�u h�i b�o l�i cho nhi t� <color=red>D��ng Di�n Huy<color>.")
							
--���������Ź�����Ĵ���---------------------------------------
		elseif ( UWorld1401  == 130 ) then
				Talk(3,"","B�m b�o T��ng qu�n, t�i h� v�a t� ch� <color=red>Ti�u Thi�n H�u<color> bi�t ���c <color=yellow>B�n �� S�n H� X� T�c<color> hi�n � Thi�n M�n tr�n. V� quy�t �o�t ���c n�, Khi�t �an �� chu�n b� 10 v�n tinh binh.","<color=yellow>B�n �� S�n H� X� T�c<color> l�i xu�t hi�n r�i, nghi�p ch��ng ��y! Nh� ng��i mau ��n <color=red>Thi�n M�n tr�n<color> �o�t t�m <color=yellow>B�n �� S�n H� X� T�c<color> ��!","T�i h� v�o <color=red>Thi�n M�n tr�n<color> nh�t ��nh s� �o�t ���c t�m <color=yellow>B�n �� S�n H� X� T�c<color>")
		    SetTask(1401,135)
		    ----AddItem(0,0,0)
		    --Earn(10000)
		    ModifyExp(10000)
		    AddNote("V�i danh ngh�a t��ng l�nh qu�n T�ng v�o Thi�n M�n tr�n �o�t t�m B�n �� S�n H� X� T�c. (sau n�y c� th� ��i l�i)")
		    Msg2Player("V�i danh ngh�a t��ng l�nh qu�n T�ng v�o Thi�n M�n tr�n �o�t t�m B�n �� S�n H� X� T�c. (sau n�y c� th� ��i l�i)")
		
		elseif ( UWorld1401  == 125 or UWorld1401  == 135 ) then
				Talk(1,"","Sao r�i? C� tin t�c g� c�a qu�n Li�u kh�ng?")
		
		else
								Talk(1,"","Ch� So�i Tr��ng kh�ng ���c t�y ti�n!")
	end
end;
