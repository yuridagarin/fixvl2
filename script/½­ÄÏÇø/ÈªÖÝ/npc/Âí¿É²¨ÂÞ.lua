--����ָ��
--lijinyong

function main()
	Uworld1 = GetTask(1)
	if Uworld1 == 5  then
		Say("Cu�i c�ng ta �� gia nh�p ���c V� �ang. Ta quy�t s� tr� th�nh m�t ��i hi�p ��nh thi�n l�p ��a. �a t� ti�u huynh �� b�o tin l�nh! C� mu�n ta truy�n l�i kinh nghi�m kh�ng? ",2,"Mu�n/yes","Kh�ng c�n ��u!/no")
	SetTask(1,6)
	else
		Talk(1,"","�a t� c�c h� d�n d�t ta t�i ��t Trung Nguy�n! A men!")
	end
end;


function yes()
	Talk(1,"no","Th�n th� c�a ng��i hi�n gi� ch�a n�n ra ngo�i ��nh qu�i! H�y v�o c�c th�nh th� th��ng ngo�n, k�t giao b�ng h�u nh�t ��nh s� g�p nhi�u �i�u b�t ng�! H�y ��n th�nh gi�o c�c ti�n b�i cao nh�n tr�n giang h�! Tr�ng th��ng c� th� ��n Tr�n L�o H�n t�t b�ng trong th�nh ch�a mi�n ph�!")
	Earn(1000)
end

function no()
	Talk(1,"","H�y b�o v�i H�u Tr��ng Sinh � gi�a qu�ng tr��ng, ng�y mai ta ph�i l�n n�i V� �ang, e r�ng kh�ng th� h�c v� ngh� v�i h�n n�a!")
end




		