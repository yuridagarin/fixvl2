--����  
--�ص㣺�꾩 �������������񣬷�֧���1
--�߻���������  2004.02.28

function main()
	UWorld1402 = GetTask(1402)
	UWorld1401 = GetTask(1401)
if ( UWorld1401 == 25 and UWorld1402 == 0  )  then
		Talk(2,"","B� ��u ��i nh�n! T�i h� nghe n�i c� m�t ��m ng��i m�c quan ph�c tr� tr�n v�o thi�n lao gi�i c�u t� nh�n!","C� chuy�n nh� v�y sao? Ph�n r�i! �a t� �� b�o tin! ��y ch�t t� l� xin h�y nh�n l�y!")
    SetTask(1402,5)
    ----AddItem(0,0,0)
    --Earn(10000)
    ModifyExp(10000)
    AddNote("B� m�t b�o quan ph� chuy�n c��p ng�c!")
    Msg2Player("B� m�t b�o quan ph� chuy�n c��p ng�c!")
else
		Talk(1,"","Nha m�n l� n�i c�m ��a! H� �� cho ng��i t� ti�n x�ng v�o sao?")
end
end;