Include("\\script\\online\\���ڻ\\newyear_head.lua")
function OnUse()
	local nEatNum = GetByte(GetTask(TASK_EAT_NIANGAO),2)
	if nEatNum >= 1000 then
		Say("C� ��i ng��i ch� c� th� �n ���c 1000 c�i b�nh t�.",0)
		return 0
	end
	if DelItem(2,1,266,1) == 1 then
		ModifyReputation(5,0)
		Msg2Player("B�n nh�n ���c 5 �i�m danh v�ng.")
		WriteLog("[Ho�t ��ng m�a xu�n (�n b�nh t�)]:"..GetName().."B�n �� �n 1 c�i b�nh t� h�t sen.")
		SetTask(TASK_EAT_NIANGAO,SetByte(GetTask(TASK_EAT_NIANGAO),2,nEatNum+1))
	end
end
