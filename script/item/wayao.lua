--��ҩ
Include("\\script\\function\\zq_battles\\zq_head.lua")

function OnUse(nItem)
	local n = GetWorldPos()
	if n == 714 or n == 719 or n == 724 then
		OpenNewGatherWindow()
	else
		Msg2Player("Kh�ng th� s� d�ng c�ng c� thu th�p n�y � ��y.")
	end
end