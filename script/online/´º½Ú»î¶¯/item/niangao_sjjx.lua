Include("\\script\\online\\���ڻ\\newyear_head.lua")
function OnUse()
	local nEatNum = GetByte(GetTask(TASK_EAT_NIANGAO),3)
	local pk1,pk2 = GetPKFlag();
	if pk1 == 1 or pk1 == 2 then
		Talk(1,"","D�ng th�c phi luy�n c�ng kh�ng th� s� d�ng v�t ph�m n�y.");
		return
	end	
	if nEatNum >= 100 then
		Say("Ng��i ch�i t�i �a ch� c� th� �n 100 c�i b�nh t�.",0)
		return 0
	end
	if DelItem(2,1,269,1) == 1 then
		CastState("state_move_speed_percent_add",20,60*10*18,1,1)	--��λΪ֡��18֡1�롣���ܵ��ӡ�
		Msg2Player("T�c �� di chuy�n c�a b�n t�ng 20% trong v�ng 10 ph�t.")
		WriteLog("[Ho�t ��ng m�a xu�n (�n b�nh t�)]:"..GetName().."B�n �� �n 1 c�i b�nh t� nh�n th�p c�m.")
		SetTask(TASK_EAT_NIANGAO,SetByte(GetTask(TASK_EAT_NIANGAO),3,nEatNum+1))
	end
end
