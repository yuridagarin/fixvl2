Include("\\script\\online\\���ڻ\\newyear_head.lua")
function OnUse()
	local nEatNum = GetByte(GetTask(TASK_EAT_NIANGAO),4)
	if nEatNum >= 1000 then
		Say("C� ��i ng��i ch� c� th� �n ���c 1000 c�i b�nh t�.",0)
		return 0
	end
	if DelItem(2,1,267,1) then
		ModifyPopur(300)
		Msg2Player("B�n nh�n ���c 300 �i�m tu luy�n.")
		WriteLog("[Ho�t ��ng m�a xu�n (�n b�nh t�)]:"..GetName().."B�n �� �n 1 c�i b�nh t� ���ng c�t.")
		SetTask(TASK_EAT_NIANGAO,SetByte(GetTask(TASK_EAT_NIANGAO),4,nEatNum+1))
	end
end
