--����
--�ص㣺���Ź�  ����������������8
--�߻���������  2004.03.


function main()
UWorld1401 = GetTask(1401)
if ( UWorld1401 == 55 )  then
	Talk(6,"","D�m h�i <color=red>H�n Tr� Nh��ng<color> l�o nh�n c�n c� tr� n�i n�y?","Ng��i l���?","T�i h� l� h� h�ng xa c�a ng��i n�y, ���c nh� ��n v�n an l�o nh�n!","T�t l�m! Xem nh� ng��i c� l�ng! M�y n�m nay H�n Tr� Nh��ng l�o nh�n ch�u r�t nhi�u kh� s�! �� tu�i gi� ���c y�n b�nh, l�o �� chuy�n ��n s�ng � <color=red>H�nh Hoa th�n<color>!","�a t� l�ng t�t c�a ng��i! T�i h� �i ngay ��y!","��ng qu�n nh�n gi�p ta, l�o c�n n� ta <color=yellow>m�t nh�t �ao<color>! Kh� kh�!...")
    SetTask(1401,60)
    ----AddItem(0,0,0)
    --Earn(10000)
    ModifyExp(10000)
    AddNote("��n H�nh Hoa th�n h�i th�m Tr��ng V�n v� H�n l�o!")
    Msg2Player("��n H�nh Hoa th�n h�i th�m Tr��ng V�n v� H�n l�o!")

elseif ( UWorld1401  == 60  ) then
	Talk(1,"","�� tu�i gi� ���c y�n b�nh, m�y n�m tr��c H�n Tr� Nh��ng l�o nh�n �� chuy�n ��n s�ng � <color=red>H�nh Hoa th�n<color>! H�y ��n �� t�m �ng ta!")
	
elseif ( UWorld1401  > 60  ) then
	Talk(1,"","Sao? H�n Tr� Nh��ng hi�n s�ng ra sao?")
else
	Talk(1,"","Gi�c Khi�t �an ��n khi n�o m�i lui qu�n? C�n b�ng gi�c, d�n ch�ng ��u c�m th�y b�t an!")
end
end;
