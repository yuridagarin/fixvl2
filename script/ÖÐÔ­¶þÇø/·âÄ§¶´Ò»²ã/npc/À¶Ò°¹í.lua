--����
--�ص㣺 ����
--�߻���������  2004.03.


function main()
UWorld1402 = GetTask(1402)

--------------�����Ǵ򿪹������ĵڶ���-----------------------------
if ( UWorld1402 == 35 )  then
		Talk(3,"","K� n�o �� m� c�a ��ng Phong Ma? N�i mau!","Kh�ng ph�i ta l�m! Th�t s� kh�ng ph�i ta l�m m�! Ta ��n <color=red>Phong �� Qu� Th�nh<color> xem th�. G�n ��y L�o ��i ch�ng t�i ��t nhi�n xu�t hi�n � nh�n gian, nh�t ��nh l� L�o ��i th� ch�ng t�i ra!","���c! T�m tha m�ng cho mi ��!")
		SetTask(1402,40)
		--AddItem(1,1,1,1)
		--Earn(1)
		--ModifyExp(1)
		--AddNote("��֪�ᶼ��ǳ��ֵ���Ϣ���Ͽ������ʦ̫��ͨ����")
		TaskTip("Bi�t ���c tin t�c Phong �� Qu� Th�nh xu�t hi�n, quay v� b�o cho D��ng Nguy�t S� Th�i bi�t.")
		
else
		Talk(1,"","Kh�ng ph�i ta l�m! Th�t s� kh�ng ph�i ta l�m! Ki�p tr��c ta b� ch�t oan ��!")
end
end;
