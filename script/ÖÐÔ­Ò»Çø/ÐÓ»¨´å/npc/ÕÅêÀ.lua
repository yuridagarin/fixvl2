--����
--�ص㣺�꾩 �������Ź�������9
--�߻���������  2004.03.
Include("\\script\\task\\world\\task_award.lua");
function main()
UWorld1401 = GetTask(1401)
if ( UWorld1401 == 60  )  then
		Talk(2,"","C� d�n c�a H�nh Hoa th�n �� �i ��u h�t r�i? <color=red>H�n Tr� Nh��ng<color> l�o nh�n � ��u?","T�m ta c� chuy�n chi? Gi�p ta ��n H�nh Hoa th�n l�y <color=red>10 b� quan ph�c<color> c�a b�n <color=red>Quan s� <color>�� r�i h�y ��n ��y!")
		SetTask(1401,65)
    --AddNote("Ҫ��10�׹ٷ����ܵõ���һ������Ϣ��")
    TaskTip("L�y v� 10 b� quan ph�c m�i bi�t th�m tin t�c!")
						    		
elseif ( UWorld1401  == 65 and GetItemCount(2,1,34) >= 10 ) then
				if  DelItem(2,1,34,10) == 1 then
						    Talk(2,"","Qu� nhi�n l� h�o h�n! H�n Tr� Nh��ng v� mu�n tr�nh lo�n l�c �� �n tr�nh � <color=red>��ng Bi�n Kinh Ph�<color>. T� m�nh �i t�m �ng ta �i!.","�a t� �� ch� gi�o!")
						    SetTask(1401,70)
						    GivePlayerExp(SkeyTianmenzhen,"eli")
						    Earn(1000)
						    ModifyReputation(12,0)
						    --AddNote("��֪�������Ѿ��ᵽ�꾩�����ˣ���Ҫ��������һ�����顣")
						    TaskTip("H�n Tr� Nh��ng �ang � T�y Bi�n Kinh (189.174), mau ��n �� g�p!")
				else
						 Talk(1,"","Chuy�n giao v�t ph�m kh�ng th�nh c�ng")
				end
elseif ( UWorld1401  == 65 and GetItemCount(2,1,34) < 10 ) then
			Talk(1,"","Gi�p ta ��nh <color=red>Quan s�<color>, l�y ���c <color=red>10 b� quan ph�c<color> r�i h�y ��n g�p ta!")
elseif ( UWorld1401  == 70 ) then
			Talk(1,"","C� d�n c�a H�nh Hoa th�n �� ��n <color=red>Bi�n Kinh ph� t�y<color> l�nh n�n, ng��i mau ��n �� �i.")	
else
			Talk(1,"","B�n Quan s� n�y ta quy�t kh�ng tha cho ch�ng!")
	end
end;
