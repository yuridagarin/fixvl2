Include("\\script\\online\\���ڻ\\newyear_head.lua")
function OnUse()
	local nEatNum = GetByte(GetTask(TASK_EAT_NIANGAO),1)
	if nEatNum >= 100 then
		Say("Ng��i ch�i t�i �a ch� c� th� �n 100 c�i b�nh t�.",0)
		return 0
	end
	INum = 35
	if GetEatDoubleCount() > INum - 1 then
		Msg2Player("Tu�n n�y b�n �� s� d�ng"..INum.." l�n nh�n ��i �i�m kinh nghi�m, s� d�ng n�a s� kh�ng c� hi�u qu�.");
	elseif GetExpScale() > 1 then
		Msg2Player("Hi�n gi� linh kh� tr�i ��t �ang giao h�a, hi�u qu� tu luy�n ��t m�c cao nh�t, cho d� �n th�m b�nh t� nh�n t�o c�ng kh�ng hi�u qu�.");
	else
		if DelItem(2,1,268,1) == 1 then
			DoubleExpTime(3600)
			Msg2Player("Hi�n gi� b�t ��u ��nh qu�i nh�n ��i kinh nghi�m, sau 1 gi� hi�u qu� nh�n ��i s� m�t.")
			WriteLog("[Ho�t ��ng m�a xu�n (�n b�nh t�)]:"..GetName().."B�n �� �n 1 c�i b�nh t� nh�n t�o.")
			SetTask(TASK_EAT_NIANGAO,SetByte(GetTask(TASK_EAT_NIANGAO),1,nEatNum+1))
		end
	end
end
