function main()
	UWorld1508 = GetTask(1508)
	if  UWorld1508 == 30  then
		Talk(3,"talk1","L�ng Nhi! Tr��ng ��i Th�m �ang t�m ch�u! H�y mau quay v� �i! Ng��i l�? T�i v� hay kh�ng v� li�n quan g� ��n b� ta? Ng��i ��ng nhi�u chuy�n. Sao ch�u l�i n�i th� v�i m� ch�u?")
	elseif  (UWorld1508 == 35 and GetItemCount(2,1,3)>= 3) then
		DelItem(2,1,3,3)
		Talk(1,"","Ng��i h�y n�i v�i b� ta: Ch�u kh�ng c� ng��i m� nh� th�, s� c� m�t ng�y b�n h� s� b�i d��i tay ch�u")
		SetTask(1508,40)
		AddNote("Chuy�n l�i L�ng Nhi cho Tr��ng ��i Th�m")
		Msg2Player("Chuy�n l�i L�ng Nhi cho Tr��ng ��i Th�m")
	else
		Talk(1,"","Cha y�n t�m! S� c� ng�y b�n ch�ng s� b�i d��i tay con!")
	end
end;

function talk1()
	Say("H�! Ch� ta l�n l�n s� cho b�n ch�ng bi�t tay! N�u ng��i c� l�ng h�y gi�p ta t�m 3 tr�i tim s�i v� ��y.",2,"Ta ph�i d�y d� ng��i m�i ���c!/killboy","T�i h� gi�p c� t�m tim s�i!/langxin")
end;

function killboy()
--	ս��
	Talk(1,"","H�y n�i v�i b� ta, ta kh�ng c� ng��i m� nh� th�, s� c� m�t ng�y b�n h� s� b�i d��i tay ta!")
	SetTask(1508,40)
	AddNote("Chuy�n l�i L�ng Nhi cho Tr��ng ��i Th�m")
	Msg2Player("Chuy�n l�i L�ng Nhi cho Tr��ng ��i Th�m")
end;

function langxin()
	Talk(1,"","H�! Ta s� �� tim s�i tr�n b�n c�a cha ta �� b�n ng��i kh�ng bi�t li�m s� �� th�y b�n ch�ng c� l�i v�i cha ta!")
	SetTask(1508,35)
	AddNote("Gi�p L�ng Nhi t�m 3 vi�n tim s�i")
	Msg2Player("Gi�p L�ng Nhi t�m 3 vi�n tim s�i")
end;

	
