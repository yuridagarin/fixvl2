--����
--�ص㣺�꾩��  ����������������11
--�߻���������  2004.03.
Include("\\script\\task\\world\\task_award.lua");

function main()
UWorld1401 = GetTask(1401) 
if ( UWorld1401 == 75 )  then
		Talk(9,"","��i ca kh�e kh�ng?","<color=green>Nhi�u L�n<color>:�","Xin h�i ��i ca c� bi�t <color=red>Ti�u Y�n Y�n<color> v� <color=red>H�n ��c Nh��ng<color> � ��u kh�ng?","Ta bi�t, nh�ng <color=red>h� Ti�u v� h� H�n �� ��u thu�c d�ng d�i qu� t�c<color> m�t ng��i H�n nh� ng��i sao c� th� quen bi�t h�?","Ta ���c s� �y th�c c�a m�t ng��i ��n v�n an h�.","Th� ra l� v�y! T�n h� H�n �� c� l� v�n c�ng l� ng��i H�n. M�y h�m tr��c nghe ��i V��ng n�i l�nh ��a T�ng Tri�u s�p thu�c v� tay ch�ng ta r�i.","N�i v�y l� c�c ng��i s�p xu�t binh r�i �? L� n�o <color=yellow>t�m b�n �� S�n H� X� T�c<color> c�c ng��i �� �o�t ���c r�i?","Sao c� nh�c ��n <color=yellow>B�n �� S�n H� X� T�c<color> ho�i v�y? Ng��i ��n <color=red>B� L�c V��ng K�<color> t�m ph� m� <color=red>M�c Ngh�a<color> h�i �i nh�!","�a t� ��i ca!")
    SetTask(1401,80)
    GivePlayerExp(SkeyTianmenzhen,"dacaoyuan")
    Earn(1000)
    ModifyReputation(15,0)
    --AddNote("�Դ���ȥ���첿��������������п��ܴ������������뺫���õ����䡣")
    TaskTip("��n B� L�c V��ng K� t�m ph� m� M�c Ngh�a h�i th�m tin t�c c�a Ti�u Y�n Y�n v� H�n ��c Nh��ng.")
    
elseif ( UWorld1401  == 85 ) then
		Talk(3,"","Nhi�u L�n ��i ca, v� binh c�a B� L�c V��ng K� kh�ng cho v�o, l�m c�ch n�o ��y?","Ta �ang ph� tr�ch v�n chuy�n l��ng th�c v�o B� L�c V��ng K�, nh�n c� h�i n�y c� th� tr� tr�n �� v�o. Ng��i mau ��n <color=red>Kim Quang ��ng<color> v� <color=red>Long H� ��ng<color> l�y �� <color=red>10 G�m v�ng<color>, <color=red>10 M�c L�i V�n �ao<color>, <color=red>5 Ch� Nam Ng�<color> v� ��y!","T�i h� s� �i ngay sau �� ��ch th�n v�n chuy�n v�o <color=red>B� L�c V��ng K�<color> giao t�n tay cho ph� m� <color=red>M�c Ngh�a<color>, ng��i y�n t�m!")
    SetTask(1401,90)
    GivePlayerExp(SkeyTianmenzhen,"huifu")
    Earn(1000)
    ModifyReputation(10,0)
    TaskTip("T�m 10 G�m v�ng, 10 M�c L�i V�n �ao, 5 Ch� Nam Ng�, giao cho M�c Ngh�a � V��ng K�.")

elseif ( UWorld1401  == 90 ) then
		if ( GetItemCount(2,1,54) < 10 or GetItemCount(2,1,75) < 10 or GetItemCount(2,1,96) < 5 )  then
				Talk(1,"","��n <color=red>Kim Quang ��ng<color> v� <color=red>Long H� ��ng<color> l�y <color=red>10 G�m v�ng<color>, <color=red>10 M�c L�i V�n �ao<color>, <color=red>5 Ch� Nam Ng�<color> ��n B� L�c V��ng K� giao cho <color=red>ph� m� M�c Ngh�a<color>")
		else
				Talk(1,"","Chu�n b� v�t ph�m xong ch�a? Mau ��n <color=red>B� L�c V��ng K�<color> giao cho <color=red> ph� m� M�c Ngh�a<color>.")
		end
	
elseif ( UWorld1401  == 80  ) then
		Talk(1,"","Ng��i ��n <color=red>B� L�c V��ng K�<color> h�i xem may ra c� ch�t manh m�i.")	
elseif ( UWorld1401  > 90  ) then
	Talk(1,"","Sao r�i? T�m ���c h� kh�ng?")
else
	Talk(1,"","B� L�c V��ng K� �ang c�n ta chuy�n l��ng th�c ��n �� g�p!")
end
end;
