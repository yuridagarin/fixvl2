-- VNG Library
-- Created by TriHM
-- 06/2011

Include("\\script\\online\\viet_event\\vng_task_control.lua")
Include("\\script\\online_activites\\reborn\\tongban\\head.lua");

function vf_AddPetGrow(nPoint)
	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurPetLevel < 1 then
		Talk(1,"","��i hi�p ch�a c� B�n ��ng H�nh, kh�ng th� t�ng �i�m tr��ng th�nh!")			
		return
     end
	SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (nPoint * 100))
	Msg2Player("B�n nh�n ���c "..nPoint.." �i�m N�ng C�p B�n ��ng H�nh")
end

function vf_AddPetSoul(nPoint)
	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurPetLevel < 2 then
		Talk(1,"","��i hi�p ch�a c� B�n ��ng H�nh c�p 2 tr� l�n, kh�ng th� t�ng �i�m linh l�c!")			
		return
     end
	Pet_AddGP(nPoint)
	Msg2Player("B�n nh�n ���c "..nPoint.." �i�m Linh L�c B�n ��ng H�nh")
end