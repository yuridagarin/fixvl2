--�ո�

function OnUse()
	local n = GetWorldPos()
	if n == 713 or n == 718 or n == 723 then
		OpenNewGatherWindow()
	else
		Msg2Player("Kh�ng th� s� d�ng c�ng c� thu th�p n�y � ��y.")
	end
end