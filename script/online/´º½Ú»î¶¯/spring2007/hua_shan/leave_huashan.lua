Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
function Leave_huashan()
	SetDeathPunish(1)
	Msg2Player("B�n �� chuy�n sang tr�ng th�i PK v� t� vong")
	SetTask(991,GetTime())
	if spring_2007_date_chk() == 0 then
		RemoveTrigger(GetTrigger(900))
	end
end
