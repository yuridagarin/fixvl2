--��ȫǿ��

function OnUse()
	Say("S� d�ng t�nh n�ng c��ng h�a an to�n ti�n h�nh c��ng h�a v� kh�, c��ng h�a th�t b�i s� kh�ng l�m r�t c�p. <color=red> (C�p 11 tr� l�n m�i c� th� ti�n h�nh c��ng h�a an to�n) <color>",2,"B�t ��u/StartEnhance","Kh�ng c�n ��u/do_nothing")
end

function StartEnhance()
	if GetFightState() ~= 0 then
		Talk(1,"","Hi�n t�i kh�ng th� s� d�ng ��o c� n�y");
		return 0;
	end
	EnhanceItem(3);
	return 1;
end

function do_nothing()
	--do nothing
end