--��Ƥ

function OnUse()
	local n = GetWorldPos()
	if n == 712 or n == 717 or n == 722 then
		OpenNewGatherWindow()
	else
		Msg2Player("Kh�ng th� s� d�ng c�ng c� thu th�p n�y � ��y.")
	end
end