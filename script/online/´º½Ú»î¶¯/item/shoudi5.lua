Include("\\script\\online\\���ڻ\\newyear_head.lua")

function OnUse()
	local nMapID = GetWorldPos()
	if nMapID >= 700 then
		Talk(1,"","� ��y kh�ng th� s� d�ng th� c�ng!");
		return 0;
	end;
	if GetTask(TASK_PET_BORN) ~= 0 then
		Say("B�n �� c� th� c�ng, kh�ng th� g�i th�m th� c�ng kh�c.",0)
	else
		AddPet()
	end
end

function AddPet()
	if DelItem(2,1,242,1) == 1 then
		CreateTrigger(1,500,3106)
		ContinueTimer(GetTrigger(3106))
		SetTask(TASK_PET_BORN,GetTime())	--��¼����ĳ���ʱ��
		SummonNpc("S�i xanh","��y nh�")
		WriteLog("[Ho�t ��ng m�a xu�n (s�o tr�c)]:"..GetName().."B�n �� s� d�ng s�o tr�c g�i ra S�i xanh.")
		Msg2Player("C�nh b�n �� xu�t hi�n 1 th� c�ng ��ng y�u.")
	end
end


