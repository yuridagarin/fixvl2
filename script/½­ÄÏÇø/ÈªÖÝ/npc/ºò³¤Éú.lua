--����ָ��
--lijinyong

function main()
	Uworld1 = GetTask(1)
	if Uworld1 == 6  then
		Say("���c l�n V� �ang h�c n�i gia b� truy�n l� �i�u m� ��c c�a c�c nh�n s� v� l�m! V� c�ng b�n ph�i n�i ngo�i t��ng t�, h� th�c t��ng sinh. Tr�ng ti�u huynh �� t� ch�t tinh th�m nh�ng xem ra ch�a �� c�n c�! Chi b�ng h�y h�c hai chi�u c�ng phu c� b�n c�a L�o Nhi T� xem th�c l�c th� n�o!",2,"Mu�n/yes","Kh�ng c�n ��u!/no")
	SetTask(1,7)
	else
		Talk(1,"","Qu� nhi�u �� t� nh�ng kh�ng c� ai h�i l�ng ta!")
	end
end;


function yes()
	Talk(1,"no","Mu�n luy�n t�p n�i gia c�ng phu c� 2 b� quy�t l�n: H�i th� s�u ch�m, t�nh t�m t�a thi�n ��n khi kh�i ph�c ���c nguy�n th�n. C�n tu luy�n m�i ng�y, ch� � ��n kinh m�ch c� th� tr�ch ���c b�nh t�t, ch�n kh� ���c t�ng l�n. Th�u hi�u ��o l� n�y c� th� d�ng kh� v�n chi�u, h�c b�t c� c�ng phu g� ��u c� th� nh�n ���c b�i ph�n c�ng l�c!")
	AddMagic(151,1);
	AddMagic(153,1);
end

function no()
	Talk(1,"","H�y thay ta n�i v�i ch� d��c �i�m, ��n d��c h�n b�c r�t linh nghi�m, ti�n th� b�c th�m cho ta 2 thang!")
end




		