--����
--�ص㣺���Ź�  ����������������8
--�߻���������  2004.03.


function main()
UWorld1401 = GetTask(1401)
if ( UWorld1401 == 70 )  then
	Talk(9,"","Xin h�i ti�n sinh c� ph�i l� H�n Tr� Nh��ng?","L� ta ��y! Ng��i t�m ta c� chuy�n g� kh�ng?","Cu�i c�ng c�ng g�p ���c l�o r�i. Ta ch�nh l� h�u nh�n c�a c�u nh�n l�o ��y. Nay ph�i ph�c m�nh ��n Li�u Qu�c, nghe n�i l�o c� ng��i quen b�n ��, c� c�n nh�n nh� g� kh�ng ta chuy�n l�i gi�p.","B�n tr� l� h�u b�i c�a ai trong th�n t�c ta? C� th� n�i r� ch�t kh�ng?","L�o qu�n r�i sao? L�o c�n n� ng��i �� <color=yellow>1 nh�t �ao<color>!...","Ta nh� r�i. C�u chuy�n <color=yelow>1 nh�t �ao<color> sau n�y ta s� k� ng��i nghe. Ng��i quen Li�u Qu�c ch�nh l� l�o phu. Qu� th�t n�m x�a ta c� m�t h�ng nhan tri k� ng��i Khi�t �an. Ta v� n�ng g�p nhau � Nh�n M�n quan, r�i Khi�t �an �em qu�n ��nh Trung Nguy�n. Ng��i H�n n�i n�ng l� c�u Khi�t �an, ch�i v� ��nh ��p n�ng. Ta c�ng mang ti�ng l� gian t�. Nh�ng ng�y ��, ch�ng ta �� tr�i qua mu�n v�n kh� s�!","Sau �� th� n�o?","Sau n�y n�ng quay v� c� h��ng�N�u c� g�p n�ng, h�y n�i r�ng ta gi�i thi�u ng��i t�i, c� chuy�n g� n�ng s� gi�p ng��i lo li�u! T�n n�ng l� <color=red>Ti�u Y�n Y�n<color>. Ng��i c�ng c� th� t�m <color=red>H�n ��c Nh��ng<color>, em trai ta!","Xin c�o t�!")
    SetTask(1401,75)
    ----AddItem(0,0,0)
    --Earn(10000)
    ModifyExp(10000)
    AddNote("��n ��i th�o nguy�n ngo�i Nh�n M�n quan t�m Ti�u Y�n Y�n v� H�n ��c Nh��ng.")
    Msg2Player("��n ��i th�o nguy�n ngo�i Nh�n M�n quan t�m Ti�u Y�n Y�n v� H�n ��c Nh��ng.")
	
elseif ( UWorld1401  == 75  )then
	Talk(1,"","H�y ��n Li�u Qu�c t�m <color=red>Ti�u Y�n Y�n<color> ho�c <color=red>H�n ��c Nh��ng<color>!")
else
	Talk(1,"","Ng�y th�ng an h��ng tu�i gi�, qu� th�t thanh t�nh!")
end
end;
