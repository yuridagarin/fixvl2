function main()
	i=random(1,4)
	if i==1 then 
		Talk(1,"","B�c qu�n t� ph�i tu th�n d��ng t�nh, kh�ng m�ng danh l�i.")
	elseif i==2 then
		Talk(1,"","C�c cung t�n t�y, l�ng tin ki�n ��nh nh� th� ph�i r�n luy�n trong bao l�u?")
	elseif i==3 then
		Talk(1,"","Th��ng th�ng thi�n ��o, trung h�p nh�n t�nh, h� minh ��a l�. V� H�u ��ng l� b�c cao nh�n thi�n c�. Ch� ti�c V� S�ng Nho sinh sau 500 n�m, kh�ng th� th�nh gi�o s� ph�")
	else
		Talk(1,"","V�n v� chi ��o c�n ph�i h�p t�c l�n nhau. C� th� n�y e kh�ng ph�i chuy�n t�t c�a qu�c gia!")
	end
end
