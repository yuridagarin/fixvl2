--����
--�ص㣺�꾩 �������Ź�������9
--�߻���������  2004.03.

function main()
UWorld1401 = GetTask(1401)
if ( UWorld1401 == 60  )  then
		Talk(2,"","C� d�n c�a H�nh Hoa th�n �� �i ��u h�t r�i? <color=red>H�n Tr� Nh��ng<color> l�o nh�n � ��u?","Tr��c ti�n h�y ��nh <color=red>Quan s�<color> l�y <color=red>20 b� Quan ph�c<color> r�i ��n g�p ta!")
		SetTask(1401,65)
    AddNote("T�m 20 b� Quan ph�c cho Tr��ng V�n.")
    Msg2Player("T�m 20 b� Quan ph�c cho Tr��ng V�n.")
						    		
elseif ( UWorld1401  == 65 and GetItemCount(2,1,34) >= 20 ) then
				if  DelItem(2,1,34,20) == 1 then
						    Talk(2,"","Qu� nhi�n l� h�o h�n! H�n Tr� Nh��ng v� mu�n tr�nh lo�n l�c �� �n tr�nh � <color=red>��ng Bi�n Kinh Ph�<color>. T� m�nh �i t�m �ng ta �i!.","�a t� �� ch� gi�o!")
						    SetTask(1401,70)
						    ----AddItem(0,0,0)
						    --Earn(10000)
						    ModifyExp(10000)
						    AddNote("H�n Tr� Nh��ng �ang � T�y Bi�n Kinh (189.174), mau ��n �� g�p!")
						    Msg2Player("H�n Tr� Nh��ng �ang � T�y Bi�n Kinh (189.174), mau ��n �� g�p!")
				else
						 Talk(1,"","Chuy�n giao v�t ph�m kh�ng th�nh c�ng")
				end
elseif ( UWorld1401  == 65 and GetItemCount(2,1,34) < 20 ) then
			Talk(1,"","Tr��c ti�n h�y ��nh <color=red>Quan s�<color> l�y <color=red>20 b� Quan ph�c<color> �� r�i ��n g�p ta!")
elseif ( UWorld1401  == 70 ) then
			Talk(1,"","C� d�n c�a H�nh Hoa th�n �� ��n <color=red>Bi�n Kinh ph� t�y<color> l�nh n�n, ng��i mau ��n �� �i.")	
else
			Talk(1,"","B�n Quan s� n�y ta quy�t kh�ng tha cho ch�ng!")
	end
end;
