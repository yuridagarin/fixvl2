Include("\\script\\online\\���ڻ\\newyear_head.lua")	
function OnUse()
	if GetTask(TASK_EAT_SANXIAN) >= 10 then
		Say("B�n �� �n 10 S�i c�o ba m�n, t�i s� d�ng s� v� hi�u.",0)
		return 0
	end
	if DelItem(2,1,251,1) == 1 then
		WriteLog("[Ho�t ��ng m�a xu�n (b�nh t� 3 m�n)]:"..GetName().." �� s� d�ng m�t b�nh t� 3 m�n.")
		ModifyPopur(1000)
		SetTask(TASK_EAT_SANXIAN,GetTask(TASK_EAT_SANXIAN)+1)
		Msg2Player("B�n nh�n ���c 1000 �i�m tu luy�n.")
	end
end