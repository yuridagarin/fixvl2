Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
function In_huashan()
	SetDeathPunish(0)
	Msg2Player("B�n �� ��i sang tr�ng th�i PK!")
	if spring_2007_date_chk() == 0 then
		RemoveTrigger(GetTrigger(901))
	end
end
